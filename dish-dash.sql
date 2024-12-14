-- MySQL dump 10.13  Distrib 9.1.0, for Win64 (x86_64)
--
-- Host: localhost    Database: dish_dash
-- ------------------------------------------------------
-- Server version	9.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(50) DEFAULT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `district` varchar(20) DEFAULT NULL,
  `city_id` int NOT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'1500 E Chapman Ave',NULL,'Orange',1,'92866'),(2,'1301 W Chapman Ave',NULL,'Orange',1,'92868'),(3,'1824 E Chapman Ave',NULL,'Orange',1,'92867'),(4,'101 S Glassell St',NULL,'Orange',1,'92866'),(5,'940 N Tustin St',NULL,'Orange',1,'92867'),(6,'424 S Main St',NULL,'Orange',1,'92868'),(7,'1303 W Katella Ave',NULL,'Orange',1,'92867'),(8,'770 N Tustin St',NULL,'Orange',1,'92867'),(9,'2202 N Tustin St',NULL,'Orange',1,'92865'),(10,'1302 W Chapman Ave',NULL,'Orange',1,'92868'),(11,'1305 W Chapman Ave',NULL,'Orange',1,'92868'),(12,'763 S Main St',NULL,'Orange',1,'92868'),(13,'1325 E Chapman Ave',NULL,'Orange',1,'92866'),(14,'1500 E Village Way',NULL,'Orange',1,'92865'),(15,'1001 N Tustin St',NULL,'Orange',1,'92867'),(16,'1610 E Katella Ave',NULL,'Orange',1,'92867'),(17,'2433 N Tustin St',NULL,'Orange',1,'92865'),(18,'12892 Harbor Blvd',NULL,'Garden Grove',2,'92840'),(19,'20 City Blvd W',NULL,'Orange',1,'92868'),(20,'1371 S Harbor Blvd',NULL,'Fullerton',3,'92832'),(21,'350 The City Dr S',NULL,'Orange',1,'92868'),(22,'2575 N Tustin St',NULL,'Orange',1,'92865'),(23,'1824 E Chapman Ave',NULL,'Orange',1,'92867'),(24,'1301 W Chapman Ave',NULL,'Orange',1,'92868'),(25,'1302 W Chapman Ave',NULL,'Orange',1,'92868'),(26,'2820 E Chapman Ave',NULL,'Orange',1,'92869'),(27,'2240 N Tustin St',NULL,'Orange',1,'92865'),(28,'1305 W Chapman Ave',NULL,'Orange',1,'92868'),(29,'1300 W Chapman Ave',NULL,'Orange',1,'92868'),(30,'1500 E Village Way',NULL,'Orange',1,'92865'),(31,'1419 N Tustin St',NULL,'Orange',1,'92867'),(32,'2001 W Chapman Ave',NULL,'Orange',1,'92868'),(33,'1301 W Chapman Ave',NULL,'Orange',1,'92868'),(34,'2316 W Chapman Ave',NULL,'Orange',1,'92868'),(35,'203 W Center St Promenade',NULL,'Anaheim',4,'92805'),(36,'1701 W La Veta Ave',NULL,'Orange',1,'92868'),(37,'1302 W Chapman Ave',NULL,'Orange',1,'92868'),(38,'18011 Newhope St',NULL,'Fountain Valley',5,'92708'),(39,'16556 Bolsa Chica St',NULL,'Huntington Beach',6,'92649'),(40,'2139 N Tustin St',NULL,'Orange',1,'92865');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `city` varchar(100) NOT NULL,
  `country_id` int NOT NULL,
  PRIMARY KEY (`city_id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Orange',1),(2,'Garden Grove',1),(3,'Fullerton',1),(4,'Anaheim',1),(5,'Fountain Valley',1),(6,'Huntington Beach',1);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `country_id` int NOT NULL AUTO_INCREMENT,
  `country` varchar(100) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'United States');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `address_id` int NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_customer_address` (`address_id`),
  CONSTRAINT `fk_customer_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Alice Johnson','alice.johnson@example.com','(714) 555-1234','password123',1),(2,'Bob Smith','bob.smith@example.com','(714) 555-2345','securePass456',2),(3,'Catherine Brown','catherine.brown@example.com','(714) 555-3456','catBrown!789',3),(4,'David Wilson','david.wilson@example.com','(714) 555-4567','daveyWils_001',4),(5,'Evelyn Martinez','evelyn.martinez@example.com','(714) 555-5678','evieM_2022',5),(6,'Frank Thomas','frank.thomas@example.com','(714) 555-6789','frankieT_888',6),(7,'Grace Lee','grace.lee@example.com','(714) 555-7890','gracefulLee99',7),(8,'Henry Moore','henry.moore@example.com','(714) 555-8901','mooreSecure01',8),(9,'Isabella Taylor','isabella.taylor@example.com','(714) 555-9012','bellaT_0423',9),(10,'Jack Harris','jack.harris@example.com','(714) 555-0123','jackAttack777',10),(11,'Karen Clark','karen.clark@example.com','(714) 555-5678','karenC_2468',11),(12,'Liam Lewis','liam.lewis@example.com','(714) 555-6789','liamLoveCoding',12),(13,'Mia White','mia.white@example.com','(714) 555-7890','whiteMia321',13),(14,'Nathan Green','nathan.green@example.com','(714) 555-8901','greenCode101',14),(15,'Olivia Carter','olivia.carter@example.com','(714) 555-9012','oliviaRules123',15),(16,'Paul Young','paul.young@example.com','(714) 555-0123','youngCoder444',16),(17,'Quinn Hill','quinn.hill@example.com','(714) 555-5678','hilltop777',17),(18,'Rachel Adams','rachel.adams@example.com','(714) 555-6789','adamsR_246',18),(19,'Samuel Brooks','samuel.brooks@example.com','(714) 555-7890','brooks_321',19),(20,'Tina Lopez','tina.lopez@example.com','(714) 555-8901','lopezLove23',20);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `delivery_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  PRIMARY KEY (`delivery_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_item`
--

DROP TABLE IF EXISTS `menu_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_item` (
  `menu_item_id` int NOT NULL AUTO_INCREMENT,
  `restaurant_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`menu_item_id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `menu_item_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=408 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_item`
--

LOCK TABLES `menu_item` WRITE;
/*!40000 ALTER TABLE `menu_item` DISABLE KEYS */;
INSERT INTO `menu_item` VALUES (1,1,'Big Mac','Two beef patties, special sauce, lettuce, cheese, pickles, onions on a sesame seed bun.',5.99,'Burgers'),(2,1,'McChicken','Crispy chicken sandwich with lettuce and mayo.',3.99,'Sandwiches'),(3,1,'French Fries','Golden, crispy french fries.',2.49,'Sides'),(4,1,'McFlurry','Soft-serve ice cream mixed with your favorite toppings.',3.49,'Desserts'),(5,1,'Chicken McNuggets','Tender chicken nuggets with dipping sauces.',4.99,'Chicken'),(6,1,'Filet-O-Fish','Fish sandwich with tartar sauce and cheese.',3.99,'Sandwiches'),(7,1,'Apple Pie','Hot, crispy apple pie.',1.49,'Desserts'),(8,1,'Quarter Pounder','Quarter-pound beef patty with cheese, onions, pickles, and ketchup.',5.29,'Burgers'),(9,1,'Sausage McMuffin','Breakfast sandwich with sausage, egg, and cheese.',2.79,'Breakfast'),(10,1,'Iced Coffee','Refreshing iced coffee.',2.49,'Beverages'),(11,2,'Whopper','Flame-grilled beef patty with lettuce, tomato, mayo, pickles, and onions.',6.49,'Burgers'),(12,2,'Chicken Fries','Breaded chicken strips served with dipping sauce.',3.99,'Chicken'),(13,2,'Impossible Whopper','Plant-based burger with all the fixings.',6.99,'Burgers'),(14,2,'French Fries','Thick-cut fries.',2.99,'Sides'),(15,2,'Onion Rings','Crispy onion rings.',2.99,'Sides'),(16,2,'Classic Chicken Sandwich','Crispy chicken sandwich with lettuce and mayo.',4.99,'Sandwiches'),(17,2,'Cheeseburger','Single-patty burger with cheese, ketchup, and mustard.',3.49,'Burgers'),(18,2,'Hershey’s Sundae Pie','Chocolate pie with creamy filling.',2.49,'Desserts'),(19,2,'Breakfast Croissant','Croissant with egg, cheese, and sausage or bacon.',4.29,'Breakfast'),(20,2,'Soft Drink','Assorted soft drinks.',1.99,'Beverages'),(21,3,'Original Recipe Chicken','Crispy fried chicken with 11 herbs and spices.',7.99,'Chicken'),(22,3,'Extra Crispy Chicken','Double-breaded, extra-crispy fried chicken.',7.99,'Chicken'),(23,3,'Chicken Pot Pie','Flaky crust filled with chicken, vegetables, and gravy.',5.99,'Meals'),(24,3,'Mashed Potatoes','Creamy mashed potatoes with gravy.',2.49,'Sides'),(25,3,'Coleslaw','Tangy coleslaw.',1.99,'Sides'),(26,3,'Chicken Sandwich','Crispy chicken filet with pickles and mayo.',4.99,'Sandwiches'),(27,3,'Popcorn Chicken','Bite-sized fried chicken.',4.99,'Chicken'),(28,3,'Mac & Cheese','Creamy mac and cheese.',2.99,'Sides'),(29,3,'Biscuits','Flaky, buttery biscuits.',0.99,'Sides'),(30,3,'Pepsi','Refreshing soft drink.',1.99,'Beverages'),(31,4,'Caramel Macchiato','Espresso, steamed milk, vanilla syrup, and caramel drizzle.',4.99,'Beverages'),(32,4,'Pumpkin Spice Latte','Espresso, pumpkin spice, and steamed milk.',5.29,'Beverages'),(33,4,'Iced Coffee','Chilled coffee sweetened with syrup.',3.49,'Beverages'),(34,4,'Cappuccino','Espresso with steamed milk foam.',3.99,'Beverages'),(35,4,'Blueberry Muffin','Moist muffin with blueberries.',2.99,'Bakery'),(36,4,'Butter Croissant','Flaky croissant.',2.79,'Bakery'),(37,4,'Egg Bites','Egg and cheese bites.',4.49,'Breakfast'),(38,4,'Turkey Pesto Panini','Turkey, pesto, and mozzarella in a toasted panini.',6.99,'Sandwiches'),(39,4,'Chai Tea Latte','Spiced tea with steamed milk.',4.49,'Beverages'),(40,4,'Banana Nut Bread','Moist banana bread with walnuts.',2.99,'Bakery'),(41,5,'Pepperoni Pizza','Classic pizza with marinara sauce, mozzarella, and pepperoni.',10.99,'Pizza'),(42,5,'Supreme Pizza','Pizza with pepperoni, sausage, vegetables, and cheese.',12.99,'Pizza'),(43,5,'Cheese Sticks','Breadsticks with melted cheese.',5.49,'Sides'),(44,5,'Cinnamon Sticks','Sweet breadsticks dusted with cinnamon sugar.',4.99,'Desserts'),(45,5,'Meat Lovers Pizza','Pizza loaded with various meats.',13.99,'Pizza'),(46,5,'Veggie Lovers Pizza','Pizza topped with fresh vegetables.',11.99,'Pizza'),(47,5,'Wings','Crispy chicken wings with various sauces.',8.99,'Sides'),(48,5,'Pasta Alfredo','Creamy pasta with chicken and cheese.',8.49,'Pasta'),(49,5,'Stuffed Crust Pizza','Pizza with cheese-filled crust.',13.99,'Pizza'),(50,5,'Pepsi','Refreshing soft drink.',1.99,'Beverages'),(51,6,'Turkey Breast Sandwich','Turkey sandwich with customizable toppings.',6.49,'Sandwiches'),(52,6,'Italian B.M.T.','Salami, pepperoni, and ham on freshly baked bread.',6.99,'Sandwiches'),(53,6,'Veggie Delight','Fresh vegetables on your choice of bread.',5.49,'Sandwiches'),(54,6,'Meatball Marinara','Meatballs with marinara sauce and melted cheese.',6.99,'Sandwiches'),(55,6,'Chicken Teriyaki','Grilled chicken with teriyaki sauce.',7.49,'Sandwiches'),(56,6,'Tuna Sandwich','Tuna salad with customizable toppings.',6.49,'Sandwiches'),(57,6,'Spinach Wrap','Spinach wrap with your choice of protein.',7.49,'Wraps'),(58,6,'Chips','Assorted bagged chips.',1.49,'Sides'),(59,6,'Cookies','Freshly baked cookies.',1.29,'Desserts'),(60,6,'Bottled Water','Chilled bottled water.',1.99,'Beverages'),(61,7,'Chicken Burrito','Flour tortilla filled with rice, beans, chicken, and toppings.',8.49,'Burritos'),(62,7,'Steak Bowl','Bowl with steak, rice, beans, and toppings.',9.49,'Bowls'),(63,7,'Carnitas Tacos','Soft tacos with carnitas and toppings.',7.49,'Tacos'),(64,7,'Barbacoa Salad','Salad with barbacoa, lettuce, beans, and dressing.',8.99,'Salads'),(65,7,'Chips and Guacamole','Crispy chips with fresh guacamole.',3.99,'Sides'),(66,7,'Quesadilla','Melted cheese in a grilled tortilla.',5.99,'Quesadillas'),(67,7,'Sofritas Bowl','Plant-based protein bowl.',8.49,'Bowls'),(68,7,'Kid’s Meal','Small burrito or tacos with sides.',5.49,'Meals'),(69,7,'Chips and Queso','Chips with creamy queso dip.',3.99,'Sides'),(70,7,'Hibiscus Lemonade','Refreshing hibiscus-flavored lemonade.',2.49,'Beverages'),(71,8,'Pepperoni Pizza','Pizza with marinara sauce, mozzarella, and pepperoni.',9.99,'Pizza'),(72,8,'Hawaiian Pizza','Pizza with ham, pineapple, and cheese.',10.99,'Pizza'),(73,8,'Cheesy Bread','Warm breadsticks with melted cheese.',5.49,'Sides'),(74,8,'Buffalo Wings','Spicy chicken wings.',7.99,'Sides'),(75,8,'Chocolate Lava Cake','Molten chocolate cake.',4.99,'Desserts'),(76,8,'Philly Cheesesteak Pizza','Pizza topped with steak and cheese.',12.99,'Pizza'),(77,8,'MeatZZa Pizza','Loaded with pepperoni, sausage, and beef.',12.49,'Pizza'),(78,8,'Mediterranean Veggie Sandwich','Vegetable-packed sandwich.',7.49,'Sandwiches'),(79,8,'Marbled Cookie Brownie','Dessert combining brownies and cookies.',6.49,'Desserts'),(80,8,'Coke','Refreshing Coca-Cola.',1.99,'Beverages'),(81,9,'Glazed Donut','Classic yeast donut with a sweet glaze.',1.29,'Desserts'),(82,9,'Boston Kreme Donut','Donut filled with custard and topped with chocolate glaze.',1.49,'Desserts'),(83,9,'Jelly Donut','Donut filled with sweet fruit jelly.',1.49,'Desserts'),(84,9,'Iced Coffee','Chilled coffee served sweetened or unsweetened.',2.49,'Beverages'),(85,9,'Latte','Espresso with steamed milk.',3.49,'Beverages'),(86,9,'Bagel with Cream Cheese','Toasted bagel with a choice of cream cheese.',2.99,'Breakfast'),(87,9,'Egg & Cheese Sandwich','Egg and cheese on an English muffin.',3.49,'Breakfast'),(88,9,'Bacon Egg & Cheese Croissant','Flaky croissant with egg, cheese, and bacon.',4.49,'Breakfast'),(89,9,'Munchkins','Donut holes in assorted flavors.',2.99,'Desserts'),(90,9,'Hot Chocolate','Rich and creamy hot chocolate.',2.99,'Beverages'),(91,10,'Crunchwrap Supreme','Tortilla filled with seasoned beef, nacho cheese, and vegetables.',4.49,'Tacos'),(92,10,'Cheesy Gordita Crunch','Soft tortilla with cheese wrapped around a taco shell.',3.99,'Tacos'),(93,10,'Doritos Locos Taco','Taco shell made from Doritos chips.',2.99,'Tacos'),(94,10,'Quesadilla','Grilled tortilla filled with melted cheese.',3.99,'Quesadillas'),(95,10,'Nachos BellGrande','Tortilla chips topped with beef, beans, cheese, and sour cream.',5.49,'Sides'),(96,10,'Cinnamon Twists','Crispy, sweet cinnamon-flavored snack.',1.49,'Desserts'),(97,10,'Fiesta Taco Salad','Taco salad with seasoned beef, beans, and toppings.',5.99,'Salads'),(98,10,'Mexican Pizza','Layers of tortilla, beans, and cheese topped with sauce.',4.99,'Pizza'),(99,10,'Soft Taco','Soft tortilla filled with seasoned beef and lettuce.',1.99,'Tacos'),(100,10,'Mountain Dew Baja Blast','Exclusive tropical-flavored soda.',1.99,'Beverages'),(101,11,'Dave’s Single','Fresh beef patty with cheese, lettuce, tomato, and onion.',4.49,'Burgers'),(102,11,'Spicy Chicken Sandwich','Crispy spicy chicken filet with lettuce and mayo.',4.99,'Sandwiches'),(103,11,'Baconator','Double beef patties with bacon and cheese.',6.99,'Burgers'),(104,11,'French Fries','Natural-cut, sea-salted fries.',2.49,'Sides'),(105,11,'Frosty','Creamy frozen treat in chocolate or vanilla.',1.99,'Desserts'),(106,11,'Apple Pecan Salad','Fresh salad with apples, pecans, and blue cheese.',6.49,'Salads'),(107,11,'Chili','Hearty beef and bean chili.',2.99,'Sides'),(108,11,'Jr. Bacon Cheeseburger','Small burger with bacon and cheese.',2.49,'Burgers'),(109,11,'Breakfast Baconator','Breakfast sandwich with bacon, egg, and cheese.',5.49,'Breakfast'),(110,11,'Lemonade','Freshly squeezed lemonade.',2.49,'Beverages'),(111,12,'Orange Chicken','Signature crispy chicken in sweet and tangy sauce.',6.99,'Chicken'),(112,12,'Kung Pao Chicken','Spicy stir-fried chicken with vegetables and peanuts.',6.99,'Chicken'),(113,12,'Beijing Beef','Crispy beef with a tangy sweet sauce.',7.49,'Beef'),(114,12,'Honey Walnut Shrimp','Shrimp in honey sauce with walnuts.',7.99,'Seafood'),(115,12,'Fried Rice','Rice stir-fried with egg and vegetables.',3.49,'Sides'),(116,12,'Chow Mein','Stir-fried noodles with vegetables.',3.49,'Sides'),(117,12,'Spring Rolls','Vegetable spring rolls.',1.99,'Appetizers'),(118,12,'SweetFire Chicken','Chicken with sweet chili sauce.',6.99,'Chicken'),(119,12,'Black Pepper Angus Steak','Tender steak with black pepper sauce.',8.49,'Beef'),(120,12,'Fortune Cookies','Crispy cookies with fortunes inside.',0.99,'Desserts'),(121,13,'ShackBurger','Single beef patty with cheese, lettuce, and ShackSauce.',5.99,'Burgers'),(122,13,'SmokeShack','Burger with smoked bacon and cherry peppers.',7.49,'Burgers'),(123,13,'Shack Stack','Cheeseburger topped with a fried portobello mushroom.',9.49,'Burgers'),(124,13,'Crinkle-Cut Fries','Golden, crispy crinkle-cut fries.',2.99,'Sides'),(125,13,'Cheese Fries','Crinkle-cut fries topped with melted cheese.',3.99,'Sides'),(126,13,'Chicken Shack','Crispy chicken sandwich with lettuce and pickles.',6.99,'Sandwiches'),(127,13,'Hot Dog','All-beef hot dog.',3.49,'Hot Dogs'),(128,13,'Shack-cago Dog','Hot dog with mustard, relish, onion, and pickle.',4.49,'Hot Dogs'),(129,13,'Vanilla Shake','Classic vanilla milkshake.',4.49,'Desserts'),(130,13,'Root Beer Float','Root beer with vanilla ice cream.',4.99,'Desserts'),(131,14,'Bacon Cheeseburger','Double beef patties with crispy bacon and cheese.',8.99,'Burgers'),(132,14,'Little Cheeseburger','Single beef patty with cheese and toppings of your choice.',6.99,'Burgers'),(133,14,'Five Guys Fries','Hand-cut fries seasoned with salt.',3.99,'Sides'),(134,14,'Cajun Fries','Hand-cut fries with Cajun seasoning.',4.49,'Sides'),(135,14,'Milkshake','Customizable milkshake with mix-ins.',4.99,'Desserts'),(136,14,'Veggie Sandwich','Grilled vegetables on a toasted bun.',3.99,'Sandwiches'),(137,14,'Grilled Cheese','Melted cheese on a toasted bun.',3.49,'Sandwiches'),(138,14,'Hot Dog','All-beef hot dog with toppings of your choice.',4.99,'Hot Dogs'),(139,14,'BLT Sandwich','Bacon, lettuce, and tomato on a toasted bun.',5.49,'Sandwiches'),(140,14,'Bottled Soda','Assorted bottled sodas.',2.49,'Beverages'),(141,15,'Original Buttermilk Pancakes','Stack of fluffy buttermilk pancakes.',5.99,'Breakfast'),(142,15,'Belgian Waffles','Crispy waffle with butter and syrup.',6.49,'Breakfast'),(143,15,'French Toast','Thick slices of bread dipped in batter and grilled.',6.49,'Breakfast'),(144,15,'Breakfast Sampler','Two eggs, bacon, sausage, and hash browns.',8.99,'Breakfast'),(145,15,'Chicken & Waffles','Crispy fried chicken served with a waffle.',9.49,'Breakfast'),(146,15,'Sirloin Steak Tips','Grilled steak tips with onions and mushrooms.',12.99,'Entrees'),(147,15,'Spinach & Mushroom Omelette','Omelette with spinach, mushrooms, and Swiss cheese.',9.99,'Breakfast'),(148,15,'Cupcake Pancakes','Pancakes with sprinkles and whipped cream.',7.49,'Breakfast'),(149,15,'Classic Burger','Beef patty with lettuce, tomato, and cheese.',8.49,'Burgers'),(150,15,'Orange Juice','Freshly squeezed orange juice.',2.99,'Beverages'),(151,16,'Grand Slam Breakfast','Two eggs, two pancakes, bacon, and sausage.',8.99,'Breakfast'),(152,16,'Lumberjack Slam','Pancakes, eggs, bacon, sausage, and ham.',10.99,'Breakfast'),(153,16,'Moons Over My Hammy','Grilled ham and scrambled eggs on sourdough bread.',9.49,'Sandwiches'),(154,16,'Zesty Nachos','Tortilla chips with beef, cheese, and jalapenos.',7.99,'Appetizers'),(155,16,'Cobb Salad','Salad with chicken, bacon, egg, and avocado.',9.49,'Salads'),(156,16,'Classic BLT','Bacon, lettuce, and tomato sandwich.',6.99,'Sandwiches'),(157,16,'Pot Roast','Tender pot roast with mashed potatoes and gravy.',12.49,'Entrees'),(158,16,'Chocolate Lava Cake','Warm chocolate cake with molten center.',5.99,'Desserts'),(159,16,'Spaghetti & Meatballs','Spaghetti pasta topped with marinara and meatballs.',9.99,'Entrees'),(160,16,'Iced Tea','Refreshing iced tea.',2.49,'Beverages'),(161,17,'Fettuccine Alfredo','Pasta tossed in creamy Alfredo sauce.',13.99,'Pasta'),(162,17,'Chicken Parmigiana','Breaded chicken topped with marinara and cheese.',15.49,'Entrees'),(163,17,'Lasagna Classico','Layers of pasta, meat sauce, and cheese.',14.99,'Pasta'),(164,17,'Shrimp Scampi','Shrimp in a garlic butter sauce over angel hair pasta.',16.99,'Seafood'),(165,17,'House Salad','Fresh salad with Italian dressing.',6.99,'Salads'),(166,17,'Breadsticks','Warm breadsticks with garlic butter.',4.99,'Sides'),(167,17,'Zuppa Toscana','Soup with sausage, kale, and potatoes.',5.99,'Soups'),(168,17,'Five Cheese Ziti','Baked ziti with five types of cheese.',13.99,'Pasta'),(169,17,'Tiramisu','Classic Italian dessert with coffee and mascarpone.',6.49,'Desserts'),(170,17,'Moscato Wine','Sweet white wine.',6.99,'Beverages'),(171,18,'Ultimate Feast','Lobster tail, shrimp, scallops, and crab legs.',29.99,'Seafood'),(172,18,'Cheddar Bay Biscuits','Warm biscuits with cheddar and garlic.',4.99,'Sides'),(173,18,'Garlic Shrimp Scampi','Shrimp in a garlic butter sauce.',18.99,'Seafood'),(174,18,'Seaside Shrimp Trio','Fried shrimp, shrimp scampi, and shrimp pasta.',21.99,'Seafood'),(175,18,'Crab Linguini Alfredo','Linguini pasta with crab meat in Alfredo sauce.',19.99,'Pasta'),(176,18,'Wood-Grilled Salmon','Grilled salmon with seasoning.',20.99,'Seafood'),(177,18,'Clam Chowder','Creamy clam chowder.',5.99,'Soups'),(178,18,'Lobster Pizza','Thin-crust pizza with lobster and cheese.',12.99,'Appetizers'),(179,18,'Chocolate Wave','Rich chocolate cake with fudge layers.',6.99,'Desserts'),(180,18,'Bahama Mama','Fruity rum cocktail.',8.99,'Beverages'),(181,19,'Original Cheesecake','Classic cheesecake with a graham cracker crust.',7.99,'Desserts'),(182,19,'Godiva Chocolate Cheesecake','Rich cheesecake with layers of Godiva chocolate.',8.99,'Desserts'),(183,19,'Chicken Madeira','Sautéed chicken with Madeira wine sauce.',19.99,'Entrees'),(184,19,'Cajun Jambalaya Pasta','Pasta with spicy Cajun sauce, shrimp, and chicken.',21.99,'Pasta'),(185,19,'Avocado Egg Rolls','Crispy egg rolls filled with avocado.',11.99,'Appetizers'),(186,19,'Thai Lettuce Wraps','Chicken and vegetables served with lettuce leaves.',15.99,'Appetizers'),(187,19,'Fish Tacos','Soft tacos filled with grilled fish and slaw.',17.99,'Seafood'),(188,19,'Spicy Chicken Sandwich','Crispy chicken sandwich with spicy mayo.',15.99,'Sandwiches'),(189,19,'Flatbread Pizza','Crispy flatbread topped with cheese and vegetables.',13.99,'Pizza'),(190,19,'Strawberry Lemonade','Freshly made lemonade with strawberries.',4.99,'Beverages'),(191,20,'Bloomin\' Onion','Crispy fried onion with signature dipping sauce.',10.99,'Appetizers'),(192,20,'Outback Special Sirloin','Juicy sirloin steak cooked to order.',17.99,'Entrees'),(193,20,'Alice Springs Chicken','Grilled chicken with bacon, cheese, and mushrooms.',16.99,'Entrees'),(194,20,'Shrimp on the Barbie','Grilled shrimp with garlic butter.',19.99,'Seafood'),(195,20,'Aussie Cheese Fries','Crispy fries topped with cheese and bacon.',8.99,'Sides'),(196,20,'Caesar Salad','Crisp romaine lettuce with Caesar dressing.',6.99,'Salads'),(197,20,'Baby Back Ribs','Tender pork ribs with barbecue sauce.',22.99,'Entrees'),(198,20,'Chocolate Thunder','Chocolate brownie topped with ice cream.',7.99,'Desserts'),(199,20,'Victoria\'s Filet','Tender filet mignon cooked to perfection.',28.99,'Entrees'),(200,20,'Gold Coast Rita','Signature margarita.',9.99,'Beverages'),(201,21,'Double-Double','Two beef patties with cheese, lettuce, and tomato.',4.99,'Burgers'),(202,21,'Animal Style Fries','Fries topped with cheese, grilled onions, and sauce.',3.99,'Sides'),(203,21,'Cheeseburger','Single beef patty with cheese, lettuce, and tomato.',3.99,'Burgers'),(204,21,'Hamburger','Single beef patty with lettuce and tomato.',3.49,'Burgers'),(205,21,'Milkshake','Hand-spun milkshake in chocolate, vanilla, or strawberry.',2.99,'Desserts'),(206,21,'French Fries','Fresh-cut fries fried to perfection.',1.99,'Sides'),(207,21,'Protein Style Burger','Burger wrapped in lettuce instead of a bun.',4.99,'Burgers'),(208,21,'Grilled Cheese','Melted cheese on a toasted bun.',2.99,'Sandwiches'),(209,21,'Root Beer Float','Root beer topped with vanilla ice cream.',3.49,'Desserts'),(210,21,'Lemonade','Freshly squeezed lemonade.',1.99,'Beverages'),(211,22,'Original Chicken Sandwich','Breaded chicken filet with pickles on a bun.',4.99,'Sandwiches'),(212,22,'Chicken Nuggets','Bite-sized breaded chicken.',3.99,'Chicken'),(213,22,'Spicy Chicken Sandwich','Spicy breaded chicken filet with pickles.',5.49,'Sandwiches'),(214,22,'Waffle Fries','Crispy waffle-cut fries.',2.49,'Sides'),(215,22,'Chicken Biscuit','Breaded chicken filet on a fluffy biscuit.',3.49,'Breakfast'),(216,22,'Grilled Chicken Sandwich','Grilled chicken with lettuce and tomato.',5.49,'Sandwiches'),(217,22,'Fruit Cup','Freshly cut seasonal fruit.',3.99,'Sides'),(218,22,'Chicken Tortilla Soup','Hearty soup with chicken, beans, and vegetables.',4.99,'Soups'),(219,22,'Chocolate Chunk Cookie','Soft-baked cookie with chocolate chunks.',1.99,'Desserts'),(220,22,'Lemonade','Freshly squeezed lemonade.',2.49,'Beverages'),(221,23,'Chicken Avocado Burrito','Grilled chicken with avocado and beans.',6.99,'Burritos'),(222,23,'Original Pollo Bowl','Rice, beans, chicken, and toppings.',5.99,'Bowls'),(223,23,'Chicken Nachos','Tortilla chips topped with chicken and cheese.',7.49,'Appetizers'),(224,23,'Fire-Grilled Chicken','Signature marinated grilled chicken.',8.99,'Entrees'),(225,23,'Tacos al Carbon','Soft tacos with grilled chicken and salsa.',5.49,'Tacos'),(226,23,'Shrimp Tacos','Tacos with shrimp and creamy sauce.',6.99,'Seafood'),(227,23,'Chicken Caesar Salad','Grilled chicken on a Caesar salad.',7.49,'Salads'),(228,23,'Quesadilla','Grilled tortilla filled with cheese and chicken.',5.49,'Appetizers'),(229,23,'Double Chicken Avocado Salad','Salad with double chicken and avocado.',8.49,'Salads'),(230,23,'Horchata','Sweet and creamy cinnamon-flavored rice drink.',2.99,'Beverages'),(231,24,'Del Taco','Soft taco with seasoned beef, cheese, and lettuce.',1.49,'Tacos'),(232,24,'Beyond Taco','Plant-based taco with Beyond Meat and toppings.',2.49,'Tacos'),(233,24,'Epic Burrito','Large burrito filled with meat, rice, and beans.',5.99,'Burritos'),(234,24,'Quesadilla','Grilled tortilla filled with melted cheese.',2.99,'Appetizers'),(235,24,'Crinkle-Cut Fries','Crispy crinkle-cut fries.',1.99,'Sides'),(236,24,'Carne Asada Fries','Fries topped with steak, cheese, and guacamole.',4.99,'Sides'),(237,24,'Chicken Rollers','Small burritos with grilled chicken and sauce.',1.99,'Burritos'),(238,24,'Churro','Sweet fried dough dusted with cinnamon sugar.',1.29,'Desserts'),(239,24,'Strawberry Lemonade','Fresh lemonade with strawberry flavor.',2.49,'Beverages'),(240,24,'Breakfast Burrito','Eggs, bacon, and cheese wrapped in a tortilla.',3.49,'Breakfast'),(241,25,'Jumbo Jack','Large burger with lettuce, tomato, and sauce.',3.99,'Burgers'),(242,25,'Sourdough Jack','Burger with sourdough bread and Swiss cheese.',4.99,'Burgers'),(243,25,'Tacos','Crispy tacos filled with seasoned beef and cheese.',1.49,'Tacos'),(244,25,'Curly Fries','Crispy seasoned curly fries.',2.49,'Sides'),(245,25,'Chicken Sandwich','Breaded chicken filet with mayo and lettuce.',4.49,'Sandwiches'),(246,25,'Breakfast Jack','Egg, ham, and cheese on a toasted bun.',2.99,'Breakfast'),(247,25,'Ultimate Cheeseburger','Double patties with American and Swiss cheese.',5.49,'Burgers'),(248,25,'Mozzarella Sticks','Fried mozzarella sticks with marinara sauce.',3.49,'Appetizers'),(249,25,'Chocolate Milkshake','Creamy milkshake with chocolate flavor.',3.99,'Desserts'),(250,25,'Lemonade','Refreshing lemonade.',1.99,'Beverages'),(251,26,'Farmer’s Burger','Burger with bacon, cheese, avocado, and vegetables.',7.49,'Burgers'),(252,26,'Cobb Salad','Salad with grilled chicken, bacon, and avocado.',8.99,'Salads'),(253,26,'Classic French Toast','Thick slices of French toast with syrup.',6.49,'Breakfast'),(254,26,'Patty Melt','Burger patty on rye bread with melted cheese.',7.99,'Sandwiches'),(255,26,'Onion Rings','Golden, crispy onion rings.',3.49,'Sides'),(256,26,'Breakfast Burrito','Eggs, cheese, and bacon wrapped in a tortilla.',5.99,'Breakfast'),(257,26,'Chili Cheese Fries','Fries topped with chili and melted cheese.',4.99,'Sides'),(258,26,'Chocolate Chip Pancakes','Pancakes with chocolate chips and syrup.',5.99,'Breakfast'),(259,26,'Veggie Burger','Plant-based burger with fresh vegetables.',6.99,'Burgers'),(260,26,'Strawberry Milkshake','Creamy strawberry-flavored milkshake.',3.99,'Desserts'),(261,27,'Box Combo','Chicken fingers, fries, Texas toast, coleslaw, and drink.',8.99,'Meals'),(262,27,'Caniac Combo','Six chicken fingers, fries, Texas toast, and coleslaw.',12.49,'Meals'),(263,27,'Chicken Sandwich Combo','Chicken sandwich, fries, and a drink.',7.99,'Meals'),(264,27,'Crinkle-Cut Fries','Golden crinkle-cut fries.',2.49,'Sides'),(265,27,'Texas Toast','Thick-cut buttery toast.',1.49,'Sides'),(266,27,'Coleslaw','Creamy coleslaw.',1.49,'Sides'),(267,27,'Chicken Fingers (3 pcs)','Three crispy chicken fingers.',4.99,'Chicken'),(268,27,'Chicken Fingers (6 pcs)','Six crispy chicken fingers.',8.99,'Chicken'),(269,27,'Sweet Tea','Freshly brewed sweet tea.',1.99,'Beverages'),(270,27,'Lemonade','Freshly squeezed lemonade.',1.99,'Beverages'),(271,28,'Famous Star Burger','Burger with lettuce, tomato, and special sauce.',4.99,'Burgers'),(272,28,'Western Bacon Cheeseburger','Burger with onion rings and barbecue sauce.',5.99,'Burgers'),(273,28,'Double Western Bacon Cheeseburger','Double patties with barbecue sauce and bacon.',6.99,'Burgers'),(274,28,'CrissCut Fries','Seasoned waffle fries.',2.99,'Sides'),(275,28,'Chicken Tenders','Crispy chicken strips.',4.49,'Chicken'),(276,28,'Breakfast Burger','Burger topped with egg, bacon, and hash browns.',5.49,'Breakfast'),(277,28,'Super Star Burger','Double beef patties with all the fixings.',6.49,'Burgers'),(278,28,'Green Burrito','Burrito filled with beans, rice, and meat.',4.99,'Burritos'),(279,28,'Hand-Scooped Milkshake','Milkshake made with premium ice cream.',3.99,'Desserts'),(280,28,'Coca-Cola','Chilled soft drink.',1.99,'Beverages'),(281,29,'Omega Cheeseburger','Classic cheeseburger with lettuce, tomato, and onion.',6.99,'Burgers'),(282,29,'Bacon Avocado Burger','Burger with bacon, avocado, and cheese.',8.49,'Burgers'),(283,29,'Grilled Chicken Sandwich','Chicken breast with lettuce, tomato, and mayo.',7.49,'Sandwiches'),(284,29,'Chili Cheese Fries','Fries topped with chili and melted cheese.',5.99,'Sides'),(285,29,'Garden Salad','Fresh greens with a choice of dressing.',4.99,'Salads'),(286,29,'Hot Dog','All-beef hot dog on a toasted bun.',4.49,'Hot Dogs'),(287,29,'Milkshake','Hand-blended milkshake in various flavors.',4.49,'Desserts'),(288,29,'Pastrami Sandwich','Hot pastrami on rye bread.',8.99,'Sandwiches'),(289,29,'Chicken Tenders','Crispy chicken tenders with dipping sauce.',6.99,'Chicken'),(290,29,'Root Beer Float','Classic root beer with vanilla ice cream.',3.99,'Desserts'),(291,30,'Nexx Burger','Beef patty with house-made Nexx sauce.',7.49,'Burgers'),(292,30,'Truffle Burger','Burger topped with truffle aioli and Swiss cheese.',8.99,'Burgers'),(293,30,'Turkey Burger','Juicy turkey patty with fresh vegetables.',7.99,'Burgers'),(294,30,'Impossible Burger','Plant-based burger with vegan mayo.',8.49,'Burgers'),(295,30,'Sweet Potato Fries','Crispy sweet potato fries.',3.99,'Sides'),(296,30,'Onion Rings','Golden onion rings with house sauce.',4.49,'Sides'),(297,30,'Classic Milkshake','Creamy milkshake in vanilla, chocolate, or strawberry.',3.99,'Desserts'),(298,30,'Chicken Caesar Wrap','Grilled chicken wrapped in a Caesar salad.',6.99,'Wraps'),(299,30,'Loaded Fries','Fries topped with bacon, cheese, and jalapeños.',5.99,'Sides'),(300,30,'Fresh Lemonade','Freshly squeezed lemonade.',2.99,'Beverages'),(301,31,'BBQ Chicken Bowl','Grilled chicken with BBQ sauce over rice and vegetables.',8.99,'Bowls'),(302,31,'Mediterranean Wrap','Chicken with hummus, vegetables, and tzatziki in a wrap.',7.49,'Wraps'),(303,31,'Southwest Salad','Salad with grilled chicken, black beans, and avocado.',8.49,'Salads'),(304,31,'Veggie Chili','Hearty chili made with fresh vegetables.',6.99,'Soups'),(305,31,'Avocado Toast','Toasted bread with smashed avocado and spices.',5.99,'Breakfast'),(306,31,'Quinoa Bowl','Quinoa with roasted vegetables and tahini sauce.',8.49,'Bowls'),(307,31,'Spicy Chicken Wrap','Grilled chicken with spicy sauce in a tortilla.',7.49,'Wraps'),(308,31,'Fruit Smoothie','Blended smoothie with fresh fruit.',4.99,'Beverages'),(309,31,'Veggie Panini','Grilled sandwich with roasted vegetables and cheese.',7.99,'Sandwiches'),(310,31,'House Salad','Simple salad with greens, cucumbers, and tomatoes.',6.49,'Salads'),(311,32,'Hercules Burger','Triple beef patty burger with all the fixings.',9.99,'Burgers'),(312,32,'Greek Gyro','Traditional gyro with lamb, tzatziki, and vegetables.',8.49,'Sandwiches'),(313,32,'Philly Cheesesteak','Grilled steak with melted cheese and onions.',8.99,'Sandwiches'),(314,32,'Zucchini Fries','Crispy zucchini sticks with ranch dressing.',4.49,'Sides'),(315,32,'Greek Salad','Salad with feta cheese, olives, and Greek dressing.',6.99,'Salads'),(316,32,'Hot Wings','Spicy chicken wings with dipping sauce.',7.99,'Appetizers'),(317,32,'Bacon Chili Burger','Burger topped with chili and crispy bacon.',8.49,'Burgers'),(318,32,'Falafel Wrap','Falafel with hummus and vegetables in a tortilla.',7.49,'Wraps'),(319,32,'Milkshake','Classic milkshake in various flavors.',3.99,'Desserts'),(320,32,'Iced Tea','Refreshing sweet or unsweetened iced tea.',2.49,'Beverages'),(321,33,'Classic Roast Beef Sandwich','Slow-roasted beef on a toasted sesame seed bun.',4.99,'Sandwiches'),(322,33,'Beef \'n Cheddar','Roast beef with cheddar cheese and tangy sauce.',5.49,'Sandwiches'),(323,33,'French Dip & Swiss','Roast beef sandwich with Swiss cheese and au jus.',6.49,'Sandwiches'),(324,33,'Curly Fries','Seasoned curly fries.',2.99,'Sides'),(325,33,'Mozzarella Sticks','Crispy mozzarella sticks with marinara sauce.',3.99,'Appetizers'),(326,33,'Chicken Bacon Swiss','Crispy chicken, bacon, and Swiss cheese.',5.99,'Sandwiches'),(327,33,'Market Fresh Turkey Club','Turkey sandwich with bacon and fresh vegetables.',7.99,'Sandwiches'),(328,33,'Jamocha Shake','Coffee and chocolate-flavored milkshake.',3.99,'Desserts'),(329,33,'Crispy Fish Sandwich','Fried fish filet with tartar sauce.',4.49,'Sandwiches'),(330,33,'Soft Drink','Chilled soda in various flavors.',1.99,'Beverages'),(331,34,'Hook & Ladder Sub','Smoked turkey and Virginia honey ham with Monterey Jack cheese.',6.99,'Sandwiches'),(332,34,'Italian Sub','Salami, pepperoni, and ham with provolone cheese.',7.49,'Sandwiches'),(333,34,'Smokehouse Beef & Cheddar Brisket','Beef brisket with cheddar cheese and barbecue sauce.',8.99,'Sandwiches'),(334,34,'Turkey Bacon Ranch','Turkey and bacon with ranch dressing.',7.49,'Sandwiches'),(335,34,'Meatball Sub','Italian meatballs with marinara sauce and provolone.',6.99,'Sandwiches'),(336,34,'New York Steamer','Corned beef and pastrami with melted provolone.',7.99,'Sandwiches'),(337,34,'Chips','Assorted bagged chips.',1.49,'Sides'),(338,34,'Pickle Spear','Crunchy dill pickle spear.',0.49,'Sides'),(339,34,'Chocolate Chip Cookie','Soft-baked cookie with chocolate chips.',1.49,'Desserts'),(340,34,'Sweet Tea','Freshly brewed sweet tea.',1.99,'Beverages'),(341,35,'Chicken Bowl','Grilled chicken with rice and vegetables.',7.49,'Bowls'),(342,35,'Beef Bowl','Grilled beef with rice and vegetables.',8.49,'Bowls'),(343,35,'Half & Half Bowl','Combination of grilled chicken and beef.',8.99,'Bowls'),(344,35,'Tofu Bowl','Grilled tofu with rice and vegetables.',7.49,'Bowls'),(345,35,'Veggie Bowl','Steamed vegetables with rice and house sauce.',6.99,'Bowls'),(346,35,'Brown Rice Bowl','Bowl with brown rice instead of white rice.',8.49,'Bowls'),(347,35,'Mini Chicken Bowl','Smaller portion of the chicken bowl.',5.99,'Bowls'),(348,35,'Avocado Slice','Fresh sliced avocado as an add-on.',1.99,'Sides'),(349,35,'Side Salad','Small salad with fresh greens.',2.99,'Sides'),(350,35,'Bottled Water','Chilled bottled water.',1.49,'Beverages'),(351,36,'Spam Musubi','Grilled spam on rice wrapped in seaweed.',2.99,'Appetizers'),(352,36,'Chicken Katsu Musubi','Crispy chicken katsu on rice wrapped in seaweed.',3.49,'Appetizers'),(353,36,'Teriyaki Beef Musubi','Teriyaki beef on rice wrapped in seaweed.',3.99,'Appetizers'),(354,36,'Salmon Musubi','Grilled salmon on rice wrapped in seaweed.',4.49,'Appetizers'),(355,36,'Veggie Musubi','Vegetables on rice wrapped in seaweed.',2.99,'Appetizers'),(356,36,'Loco Moco Bowl','Rice topped with a hamburger patty, egg, and gravy.',7.49,'Bowls'),(357,36,'Garlic Shrimp Bowl','Rice with garlic butter shrimp.',8.49,'Bowls'),(358,36,'Pineapple Smoothie','Sweet pineapple smoothie.',4.49,'Beverages'),(359,36,'Shoyu Chicken Bowl','Hawaiian-style soy sauce chicken over rice.',7.49,'Bowls'),(360,36,'Spam Fries','Crispy fried strips of spam.',3.49,'Sides'),(361,37,'Chicken Tamales','Steamed tamales filled with seasoned chicken.',2.49,'Entrees'),(362,37,'Pork Tamales','Steamed tamales filled with seasoned pork.',2.49,'Entrees'),(363,37,'Cheese & Jalapeño Tamales','Tamales filled with cheese and jalapeños.',2.49,'Entrees'),(364,37,'Green Sauce Tamales','Tamales topped with tangy green sauce.',3.49,'Entrees'),(365,37,'Red Sauce Tamales','Tamales topped with spicy red sauce.',3.49,'Entrees'),(366,37,'Rice & Beans','Side of traditional Mexican rice and beans.',2.99,'Sides'),(367,37,'Horchata','Sweet and creamy cinnamon-flavored rice drink.',1.99,'Beverages'),(368,37,'Mexican Coca-Cola','Coca-Cola made with cane sugar.',2.49,'Beverages'),(369,37,'Tres Leches Cake','Moist sponge cake soaked in three types of milk.',4.49,'Desserts'),(370,37,'Churros','Crispy fried dough dusted with cinnamon sugar.',1.99,'Desserts'),(371,38,'Chili Cheese Dog','Classic hot dog topped with chili and melted cheese.',3.49,'Hot Dogs'),(372,38,'Corn Dog','Hot dog coated in sweet cornbread batter.',2.49,'Hot Dogs'),(373,38,'Bacon Ranch Chili Cheese Dog','Hot dog topped with bacon, chili, cheese, and ranch.',4.49,'Hot Dogs'),(374,38,'Classic Hamburger','Beef patty with lettuce, tomato, and pickles.',4.99,'Burgers'),(375,38,'Chili Cheese Fries','Crispy fries topped with chili and melted cheese.',3.99,'Sides'),(376,38,'Mini Corn Dogs','Bite-sized corn dogs.',2.99,'Appetizers'),(377,38,'Ice Cream Sundae','Soft-serve ice cream topped with chocolate or caramel.',2.49,'Desserts'),(378,38,'Root Beer Float','Root beer with a scoop of vanilla ice cream.',2.99,'Desserts'),(379,38,'Banana Split','Classic banana split with ice cream and toppings.',4.49,'Desserts'),(380,38,'Lemonade','Freshly squeezed lemonade.',1.99,'Beverages'),(381,39,'Big Poppa Tart Donut','Donut stuffed with a pop tart and topped with icing.',4.99,'Desserts'),(382,39,'Maple Bacon Bar','Long donut topped with maple glaze and crispy bacon.',3.99,'Desserts'),(383,39,'S’mores Donut','Donut topped with marshmallow, chocolate, and graham cracker.',4.49,'Desserts'),(384,39,'Caramel Latte Donut','Donut infused with caramel and espresso.',4.49,'Desserts'),(385,39,'Red Velvet Donut','Rich red velvet donut with cream cheese icing.',3.99,'Desserts'),(386,39,'PB&J Donut','Donut filled with peanut butter and jelly.',4.29,'Desserts'),(387,39,'Strawberry Sprinkle Donut','Classic donut with strawberry glaze and sprinkles.',2.99,'Desserts'),(388,39,'Cronut','Flaky croissant-donut hybrid.',4.49,'Desserts'),(389,39,'Chocolate Fudge Donut','Donut with rich chocolate fudge topping.',3.99,'Desserts'),(390,39,'Glazed Donut','Classic yeast donut with sweet glaze.',1.99,'Desserts'),(391,40,'Hawaiian Shave Ice','Soft shave ice with your choice of tropical syrups.',4.49,'Desserts'),(392,40,'Rainbow Shave Ice','Shave ice with three colorful syrups.',4.99,'Desserts'),(393,40,'Tropical Breeze','Shave ice with mango, passionfruit, and pineapple syrup.',4.99,'Desserts'),(394,40,'Coconut Paradise','Shave ice with coconut syrup and condensed milk.',4.99,'Desserts'),(395,40,'Lava Flow','Shave ice with strawberry and pina colada syrup.',5.49,'Desserts'),(396,40,'Lychee Delight','Shave ice with lychee syrup and mochi toppings.',5.49,'Desserts'),(397,40,'Pineapple Float','Shave ice with pineapple juice and vanilla ice cream.',5.99,'Desserts'),(398,40,'Acai Bowl','Shave ice with acai, granola, and fresh fruit.',6.99,'Desserts'),(399,40,'Green Tea Matcha','Shave ice with matcha syrup and condensed milk.',5.49,'Desserts'),(400,40,'Mango Sunrise','Shave ice with mango and strawberry syrup.',4.99,'Desserts');
/*!40000 ALTER TABLE `menu_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `restaurant_id` int NOT NULL,
  `order_date` datetime DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE,
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `restaurant_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  PRIMARY KEY (`restaurant_id`),
  KEY `fk_address` (`address_id`),
  CONSTRAINT `fk_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'McDonald\'s','(714) 633-3950','contact@mcdonalds.com','Fast Food',1),(2,'Burger King','(714) 978-3711','contact@bk.com','Fast Food',2),(3,'KFC','(714) 633-9200','contact@kfc.com','Fast Food',3),(4,'Starbucks','(714) 771-2595','contact@starbucks.com','Cafe',4),(5,'Pizza Hut','(714) 633-3366','contact@pizzahut.com','Fast Food',5),(6,'Subway','(714) 978-4888','contact@subway.com','Fast Food',6),(7,'Chipotle','(714) 288-9980','contact@chipotle.com','Fast Food',7),(8,'Domino\'s Pizza','(714) 633-3030','contact@dominos.com','Fast Food',8),(9,'Dunkin\' Donuts','(714) 998-4000','contact@dunkindonuts.com','Cafe',9),(10,'Taco Bell','(714) 634-9200','contact@tacobell.com','Fast Food',10),(11,'Wendy\'s','(714) 634-5600','contact@wendys.com','Fast Food',11),(12,'Panda Express','(714) 978-8888','contact@pandaexpress.com','Fast Food',12),(13,'Shake Shack','(714) 639-0000','contact@shakeshack.com','Fast Food',13),(14,'Five Guys','(714) 998-4897','contact@fiveguys.com','Fast Food',14),(15,'IHOP','(714) 633-2680','contact@ihop.com','Restaurant',15),(16,'Denny\'s','(714) 633-8651','contact@dennys.com','Restaurant',16),(17,'Olive Garden','(714) 998-9092','contact@olivegarden.com','Restaurant',17),(18,'Red Lobster','(714) 530-9898','contact@redlobster.com','Restaurant',18),(19,'The Cheesecake Factory','(714) 769-2411','contact@thecheesecakefactory.com','Restaurant',19),(20,'Outback Steakhouse','(714) 447-0775','contact@outback.com','Restaurant',20),(21,'In-N-Out Burger','(800) 786-1000','contact@in-n-out.com','Fast Food',21),(22,'Chick-fil-A','(714) 998-7575','contact@chick-fil-a.com','Fast Food',22),(23,'El Pollo Loco','(714) 633-9200','contact@elpolloloco.com','Fast Food',23),(24,'Del Taco','(714) 978-3711','contact@deltaco.com','Fast Food',24),(25,'Jack in the Box','(714) 634-9200','contact@jackinthebox.com','Fast Food',25),(26,'Farmer Boys','(714) 633-5300','contact@farmerboys.com','Fast Food',26),(27,'Raising Cane\'s Chicken Fingers','(714) 998-7080','contact@raisingcanes.com','Fast Food',27),(28,'Carl\'s Jr.','(714) 634-5600','contact@carlsjr.com','Fast Food',28),(29,'Omega Drive-In','(714) 978-3711','contact@omegadrivein.com','Fast Food',29),(30,'Nexx Burger','(714) 998-4897','contact@nexxburger.com','Fast Food',30),(31,'Green Tomato Grill','(714) 998-9330','contact@greentomatogrill.com','Restaurant',31),(32,'Hercules Burgers','(714) 978-3711','contact@herculesburgers.com','Fast Food',32),(33,'Arby\'s','(714) 978-3711','contact@arbys.com','Fast Food',33),(34,'Flame Broiler','(714) 938-1156','contact@flamebroilerusa.com','Fast Food',34),(35,'Musubi Monster','(714) 603-7332','contact@musubimonster.com','Fast Food',35),(36,'Tamaleria Rincon Sinaloense','(714) 602-9444','contact@tamaleriarinconsinaloense.com','Restaurant',36),(37,'Wienerschnitzel','(714) 634-9200','contact@wienerschnitzel.com','Fast Food',37),(38,'Donut Bar','(714) 847-7000','contact@donutbar.com','Dessert',38),(39,'Hula Girls Shave Ice','(714) 377-6545','contact@hulagirlsshavedice.com','Dessert',39),(40,'Firehouse Subs','(714) 282-1743','contact@firehousesubs.com','Fast Food',40);
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-13 19:33:09
