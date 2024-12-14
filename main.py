from flask import Flask, render_template, jsonify, request, redirect
import mysql.connector
import csv

app = Flask(__name__)

#connection function
def get_db_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="CPSC408!",
        auth_plugin="mysql_native_password",
        database="dish_dash"
    )

#gets the restaurant data and displays them
@app.route('/')
def display_restaurants():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    #query to get a list of all the restaurants
    cursor.execute("SELECT * FROM Restaurant")
    restaurants = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template('homepage.html', restaurants=restaurants)

#gets the details of a restaurant and displays them
@app.route('/restaurant/<int:restaurant_id>')
def restaurant_page(restaurant_id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    #query for restaurant details including the full address
    cursor.execute("""
        SELECT 
            r.*,
            a.address, a.address2, a.district, a.postal_code,
            c.city,
            co.country
        FROM Restaurant r
        INNER JOIN Address a ON r.address_id = a.address_id
        INNER JOIN City c ON a.city_id = c.city_id
        INNER JOIN Country co ON c.country_id = co.country_id
        WHERE r.restaurant_id = %s
    """, (restaurant_id,))
    restaurant = cursor.fetchone()

    #gets the menu items of a specific restaurant
    cursor.execute("SELECT * FROM Menu_Item WHERE restaurant_id = %s", (restaurant_id,))
    menu_items = cursor.fetchall()

    cursor.close()
    conn.close()

    if not restaurant:
        return "Restaurant not found", 404

    return render_template('restaurant.html', restaurant=restaurant, menu_items=menu_items)


# searches for restaurant
@app.route('/search', methods=['GET'])
def search_page():
    query = request.args.get('query')

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    #query that searches by name or category
    search_query = """
    SELECT * FROM Restaurant
    WHERE name LIKE %s OR category LIKE %s
    """

    #for partial matches
    like = f"%{query}%" 
    cursor.execute(search_query, (like, like))
    results = cursor.fetchall()

    cursor.close()
    conn.close()

    return render_template('search_page.html', query=query, results=results)

@app.route('/add_restaurant_form')
def add_restaurant_form():
    return render_template('add_restaurant.html')

#deletes a restaurant by name
@app.route('/delete_restaurant_by_name', methods=['POST'])
def delete_restaurant_by_name():
    data = request.get_json()
    #gets a name from the user
    name = data.get('name')

    #throws an error if name is null
    if not name:
        return jsonify({'error': 'Restaurant name is required'}), 400

    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        #query that deletes the restaurant
        query = "DELETE FROM Restaurant WHERE LOWER(name) = LOWER(%s)"
        cursor.execute(query, (name,))
        conn.commit()

        #checks to see if it was successful
        if cursor.rowcount > 0:
            return jsonify({'success': True, 'message': 'Restaurant deleted successfully'})
        else:
            #throws an error if the restaurant doesnt exist
            return jsonify({'error': 'Restaurant not found'}), 404
    finally:
        cursor.close()
        conn.close()

#update restaurant
@app.route('/update_restaurant', methods=['POST'])
def update_restaurant():
    #gets data from the user
    name = request.form['name'] 
    new_name = request.form['new_name']
    category = request.form['category']  
    phone = request.form['phone'] 

    #checks to see if name is null
    if not name:
        return "Restaurant name is required", 400

    conn = get_db_connection()
    cursor = conn.cursor()
    
    try:
        #query that updates restuarant based on given input
        query = """
        UPDATE Restaurant 
        SET name = %s, category = %s, phone_number = %s 
        WHERE LOWER(name) = LOWER(%s)
        """
        cursor.execute(query, (new_name, category, phone, name))
        conn.commit()

        #checks to see if it was successfully added
        if cursor.rowcount > 0:
            return redirect('/')  
        else:
            #throws an error if not
            return "Restaurant not found", 404
    finally:
        cursor.close()
        conn.close()


#directs the user to the update_restaurant.html page
@app.route('/update_restaurant', methods=['GET'])
def update_restaurant_page():
    return render_template('update_restaurant.html')


#add a restaurant with a menu
@app.route('/add_restaurant_with_menu', methods=['POST'])
def add_restaurant_with_menu():
    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        #query that adds a restuarant with a default address
        cursor.execute("INSERT INTO Address (address, city_id, postal_code) VALUES (%s, %s, %s)", ("Default Address", 1, "00000"))
        address_id = cursor.lastrowid
        cursor.execute(
            "INSERT INTO Restaurant (name, category, phone_number, email, address_id) VALUES (%s, %s, %s, %s, %s)",
            (request.form['name'], request.form['category'], request.form['phone'], request.form['email'], address_id),
        )
        restaurant_id = cursor.lastrowid

        #requests menu items from the user
        menu_items = []
        for key in request.form:
            if key.startswith("menu_items[") and key.endswith("[name]"):
                index = key.split('[')[1].split(']')[0] 
                menu_items.append({
                    "name": request.form[f"menu_items[{index}][name]"],
                    "description": request.form[f"menu_items[{index}][description]"],
                    "price": request.form[f"menu_items[{index}][price]"],
                    "category": request.form[f"menu_items[{index}][category]"],
                })

        #checks if null
        if not menu_items:
            raise ValueError("No menu items found in the request.")

        for item in menu_items:
            #query that adds the given menu items
            cursor.execute(
                "INSERT INTO Menu_Item (restaurant_id, name, description, price, category) VALUES (%s, %s, %s, %s, %s)",
                (restaurant_id, item["name"], item["description"], item["price"], item["category"]),
            )

        conn.commit()
        #returns if adding was a success
        return "Restaurant and menu items added successfully!"
    except Exception as e:
        conn.rollback()
        #throws an error if not
        return f"Transaction failed: {e}", 400
    finally:
        cursor.close()
        conn.close()

#export restaurant
@app.route('/export_restaurants')
def export_restaurants():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Restaurant")
    restaurants = cursor.fetchall()
    cursor.close()
    conn.close()

    #generates the CSV file andwrites into it
    with open('restaurants.csv', 'w') as file:
        writer = csv.DictWriter(file, fieldnames=restaurants[0].keys())
        writer.writeheader()
        writer.writerows(restaurants)

    return "CSV exported"

if __name__ == '__main__':
    app.run(debug=True)
