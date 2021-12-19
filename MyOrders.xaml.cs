using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using WpfProject1_OnlineShop.UsersMgr;
using WpfProject1_OnlineShop.OrdersMgr;
using WpfProject1_OnlineShop.Model;
using WpfProject1_OnlineShop.DataAccess;
using Microsoft.EntityFrameworkCore;
using System.IO;

namespace WpfProject1_OnlineShop
{
    /// <summary>
    /// Interaction logic for MyOrders.xaml
    /// </summary>
    public partial class MyOrders : Window
    {
        string _currentUserFilePath = UserManager.currentUserFilePath;
        private MainWindow _mainWindow;
        private IOrdersManager _ordersManager = new OrdersManager();

        public MyOrders(MainWindow mainWindow)
        {
            InitializeComponent();

            _mainWindow = mainWindow;
            ShowOrders();
        }
        private void ShowOrders()
        {
            DataGridOrders.ItemsSource = _ordersManager.GetOrdersOfLoggedInUser().OrderByDescending(p=>p.OrderDate);
        }

        private void DataGridOrders_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (DataGridOrders.SelectedItem != null)
            {
                int orderID = (DataGridOrders.SelectedItem as Orders).OrderID;
                var orderDetails = _ordersManager.GetOrderDetailsByOrderID(orderID);
                DataGridOrderDetails.ItemsSource = orderDetails;
                
                List<Products> products = _ordersManager.GetOrderDetailsByOrderID(orderID).Select(p => p.Product).ToList();
                ListBoxProducts.ItemsSource = products;
            }
        }

        private void bt_BackToHomePage_Click(object sender, RoutedEventArgs e)
        {
            this.Hide();
            _mainWindow.Show();
        }

        private void bt_Reorder_Click(object sender, RoutedEventArgs e)
        {
            string[] currentUser = File.ReadAllLines(_currentUserFilePath);

            List<Products> products = new List<Products>();
            foreach (Products prodItem in ListBoxProducts.SelectedItems)
            {
                products.Add(prodItem);
            }

            _ordersManager.Create(currentUser[0], products);
            ShowOrders();
        }
    }
}
