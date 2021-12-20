using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WpfProject1_OnlineShop.Model;

namespace WpfProject1_OnlineShop.OrdersMgr
{
    public interface IOrdersManager
    {
        List<Orders> GetOrdersOfLoggedInUser();
        List<OrderDetails> GetOrderDetailsByOrderID(int orderID);
        List<OrderDetails> GetOrderDetailsByUserID(int orderID);
        void Create(string email);
        void Create(string email, List<Products> products);
    }
}
