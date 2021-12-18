<img src="https://github.com/VitoPhW/HackerU-Middle_Project-OnlineShop/blob/master/ProjectElements/OnlineShop_Logo.jpg"
     alt="Project-Online Shop"
     width="200px"
     style="float: left; margin-right: 10px;" />

# Online Shop - [Tal ve Yuval ve](https://github.com/VitoPhW/HackerU-Middle_Project-OnlineShop)

"Tal ve Yuval ve" is an online shop of aesthetic style clothes of long-term fashion with recycling ability.

### Description
An online shop, managed by administrators. Inventory or items models can be updated by assistants as users. The item can be bought by registered customer or casual customer. Registered customer can see orders history and use the history items for recurring orders. Admins and users can search for every order registered in the system.

### Features
-	Online Registration/Login.
-	Customer registration.
-	Clothes inventory management.
-	Clothes buying & availability check.
-	Admin area.

### Supported user journeys

##### Admin
-	Account management
-	Creating, editing or deleting any account (including admin accounts)
-	Order management
-	Viewing all pending orders, details of a specific order, and changing order status (pending payment, pending shipment, pending delivery, cancelled, complete)
-	Viewing all historical order data, with filtering (e.g. by dates, specific items, specific users)
-	Inventory management
-	Adding\removing\editing an item in the store (including price)

##### Assistant
-	Account management
-	Order management
-	Viewing all pending orders, details of a specific order, and changing order status (pending payment, pending shipment, pending delivery, cancelled, complete)
-	Viewing all historical order data, with filtering (e.g. by dates, specific items, specific users)
-	Inventory management
-	Viewing the store inventory
-	Adding/removing/editing an item in the store (including price)

##### Customer
-	Browsing through the available clothes, with filtering (e.g. pants/shirts) and sorting (e.g. by price or popularity)
-	Selecting an item to see its details, and adding it to their shopping cart
-	Check out (placing an order), as a registered user
-	Logging in to their account to view all their orders, details about a specific order, and track the status of their pending orders (perhaps also cancel an order?)

##### Assistant
-	Browsing through the available clothes, with filtering (e.g. pants/shirts) and sorting (e.g. by price or popularity)
-	Selecting an item to see its details, and adding it to their shopping cart
-	Check out (placing an order), as a guest
-	Creating a new customer account

### Out of scope
-	Textual search of items 
-	Sales reporting - generating a report of sales in a given month/year, owed VAT, etc.
-	Payment processing
-	Order cancellation and refunds
-	Login data encryption
-	Customer reviews 
-	Business customer journeys


### Used

-	C# .NET
-	WPF .NET
-	Entity Framework (EF) Core .NET
-	SQL

#### [SQL Database](https://github.com/VitoPhW/HackerU-Middle_Project-OnlineShop/tree/master/ProjectElements/DatabaseCreationQuery)
-    UserTypes - User type (Admin, Assistant, Customer, Guest).
-    Users - Registered users (Admins, Assistants, Customers).
-    Orders - All performed orders.
-    OrderDetails - Details of each order per product and order.
-    Products - Inventory table.
-    Categories - Categries of existing products.

#### SQL diagram
<img src="https://github.com/VitoPhW/HackerU-Middle_Project-OnlineShop/blob/master/ProjectElements/OnlineShop_SQL-Diagram.png"
     alt="Online Shop - SQL Diagram"
     width="800px"
     style="float: left; margin-right: 10px;" />

#### WPF screens
-    MainWindow - Home page, first screen on application opening.
-    MyOrders - Customer's screen for his\her orders review.
-    MyAccount - Customer's screen for his\her account review.
-    Inventory - (Admin\Assistant only) Inventory management.
-    Admistartion - (Admin only) Screen for management of users and orders.
-    LoginOrSignUp - Screen of login or registration action.

#### Homepage screen
<img src="https://github.com/VitoPhW/HackerU-Middle_Project-OnlineShop/blob/master/ProjectElements/OnlineShop_Homepage.png"
     alt="Homepage scree"
     width="800px"
     style="float: left; margin-right: 10px;" />
