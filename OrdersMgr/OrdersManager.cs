using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WpfProject1_OnlineShop.DataAccess;
using WpfProject1_OnlineShop.UsersMgr;
using WpfProject1_OnlineShop.Model;
using System.Windows;
using Microsoft.EntityFrameworkCore;

namespace WpfProject1_OnlineShop.OrdersMgr
{
    class OrdersManager : IOrdersManager
    {
        string _currentUserFilePath = UserManager.currentUserFilePath;
        private IUserManager userManager = new UserManager();
        
        public List<Orders> GetOrdersOfLoggedInUser()
        {
            if (File.Exists(_currentUserFilePath))
            {
                string[] currentUserCred = File.ReadAllLines(_currentUserFilePath);
                using (var dbContext = new DBAccess())
                {
                    int userID = dbContext.Users.Where(p => p.Email == currentUserCred[0]).Select(p => p.UserID).SingleOrDefault();

                    List<Orders> orders = dbContext.Orders.Where(p => p.UserID.Equals(userID)).OrderBy(p=>p.OrderDate).ToList();
                    return orders;
                }
            }
            MessageBox.Show("Some issue occurred with identification of user.\nPlease re-login and try again.");
            return null;
        }

        public List<OrderDetails> GetOrderDetailsByOrderID(int orderID)
        {
            // Returns OrderDetails including Product
            using (var dbContext = new DBAccess())
            {
                List<OrderDetails> orders = dbContext.OrderDetails.Where(p => p.OrderID.Equals(orderID)).Include(p => p.Product).OrderBy(p => p.Product.ProductName).ToList();
                return orders;
            }
        }
        public List<OrderDetails> GetOrderDetailsByUserID(int userID)
        {
            // Returns OrderDetails including Order
            using (var dbContext = new DBAccess())
            {
                List<OrderDetails> orders = dbContext.OrderDetails.Where(p => p.Order.UserID.Equals(userID)).Include(p => p.Order).Include(p=>p.Product).OrderBy(p => p.OrderID).ToList();
                return orders;
            }
        }

        public void Create(string email)
        {
            using (var dbContext = new DBAccess())
            {
                int userID = dbContext.Users.Where(p => p.Email.Equals(email)).Select(p => p.UserID).Single();
                Orders order = new Orders() {UserID=userID};
                dbContext.Add(order);
                dbContext.SaveChanges();
            }
        }

        public void Create(string email, List<Products> products)
        {
            List<OrderDetails> orderDetails = new List<OrderDetails>();
            List<Products> productsInventoryUpdate = new List<Products>();
            
            using (var dbContext = new DBAccess())
            {
                // Create new order
                Users user = dbContext.Users.Where(p => p.Email.Equals(email)).Single();
                Orders order = new Orders() { Users = user };
                order.OrderDate = DateTime.Now;

                dbContext.Add(order);
                dbContext.SaveChanges();
            

                var prodGroupByID = products.GroupBy(p => p.ProductID).ToList();
                foreach (var product in prodGroupByID)
                {
                    int quantityInOrder = 0;
                    //update Product inventory (UnitsInStock) value
                    Products prodForInStockUpdate = dbContext.Products.Where(p => p.ProductID == product.Key).Single();
                    prodForInStockUpdate.UnitsInStock -= product.Count();
                    if (prodForInStockUpdate.UnitsInStock < 0)
                    {
                        quantityInOrder = product.Count() + prodForInStockUpdate.UnitsInStock;
                        prodForInStockUpdate.UnitsInStock = 0;
                        MessageBox.Show($"Sorry, {prodForInStockUpdate.ProductName} is out of stock.\nYou ordered {quantityInOrder} of {prodForInStockUpdate.ProductName}.");
                    }
                    else
                        quantityInOrder = product.Count();

                    productsInventoryUpdate.Add(prodForInStockUpdate);
                    
                    orderDetails.Add(new OrderDetails()
                    {
                        Order = order,
                        ProductID = product.Key,
                        Quantity = quantityInOrder,
                        Discount = 0,
                    });
                }

                dbContext.AddRange(orderDetails);
                dbContext.UpdateRange(productsInventoryUpdate);
                dbContext.SaveChanges();
            }
        }
    }
}
