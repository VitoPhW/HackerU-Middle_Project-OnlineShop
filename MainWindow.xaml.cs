using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
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
using System.Windows.Navigation;
using System.Windows.Shapes;
using WpfProject1_OnlineShop.DataAccess;
using WpfProject1_OnlineShop.Model;
using WpfProject1_OnlineShop.OrdersMgr;
using WpfProject1_OnlineShop.UsersMgr;

namespace WpfProject1_OnlineShop
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        string _currentUserFilePath = UserManager.currentUserFilePath;
        private IUserManager _userManager = new UserManager();
        private IOrdersManager _ordersManager = new OrdersManager();

        public MainWindow()
        {
            InitializeComponent();

            UpdateLoginButton();
            UpdateHiUser();
            ShowHideMgmtButtons();

            LoadCategoriesList();
            LoadProductsList();
        }

        public void ShowHideMgmtButtons()
        {
            // Show\hide management buttons - "Inventory" and\or "User Mgmt"
            if (File.Exists(_currentUserFilePath))
            {
                string[] currentUserCred = File.ReadAllLines(_currentUserFilePath);
                using (var dbContext = new DBAccess())
                {
                    string userType = _userManager.GetUserType(currentUserCred[0]);
                    switch(userType)
                    {
                        case "Admin":
                            bt_Inventory.Visibility = Visibility.Visible;
                            bt_Admin.Visibility = Visibility.Visible;
                            bt_MyDetails.Visibility = Visibility.Visible;
                            bt_MyOrders.Visibility = Visibility.Visible;
                            break;
                        case "Assistant":
                            bt_Inventory.Visibility = Visibility.Visible;
                            bt_Admin.Visibility = Visibility.Collapsed;
                            bt_MyDetails.Visibility = Visibility.Visible;
                            bt_MyOrders.Visibility = Visibility.Visible;
                            break;
                        case "Customer":
                            bt_Inventory.Visibility = Visibility.Collapsed;
                            bt_Admin.Visibility = Visibility.Collapsed;
                            bt_MyDetails.Visibility = Visibility.Visible;
                            bt_MyOrders.Visibility = Visibility.Visible;
                            break;
                        default:
                            bt_Inventory.Visibility = Visibility.Collapsed;
                            bt_Admin.Visibility = Visibility.Collapsed;
                            bt_MyDetails.Visibility = Visibility.Collapsed;
                            bt_MyOrders.Visibility = Visibility.Collapsed;
                            break;

                    }
                }
            }
            else
            { 
                bt_Inventory.Visibility = Visibility.Collapsed;
                bt_Admin.Visibility = Visibility.Collapsed;
                bt_MyDetails.Visibility = Visibility.Collapsed;
                bt_MyOrders.Visibility = Visibility.Collapsed;
            }
        }

        private void LoadCategoriesList()
        {
            ListBoxCategories.Items.Clear();
            using (var dbContext = new DBAccess())
            {
                var categories = dbContext.Categories.ToList();
                ListBoxCategories.ItemsSource = categories;
            }
        }

        public void LoadProductsList()
        {
            using (var dbContext = new DBAccess())
            {
                ListBoxProducts.ItemsSource = dbContext.Products.Where(p=>p.UnitsInStock>0).ToList();
            }
        }
        public void UpdateLoginButton()
        {
            // Set "Log in" or "Log out" content on Login button
            if (File.Exists(_currentUserFilePath))
            {
                string[] currentUser = File.ReadAllLines(_currentUserFilePath);
                if (currentUser.Length>2)
                    bt_Login.Content = "Log out";
                else
                    bt_Login.Content = "Log in";
            }
            else
                bt_Login.Content = "Log in";
        }

        public void UpdateHiUser()
        {
            // Update "HiUser" text | "Hi <email>!" if First name doesn't exist's | "Hi Guest!" if logged out
            if (File.Exists(_currentUserFilePath))
            {
                string[] currentUserCred = File.ReadAllLines(_currentUserFilePath);
                using (var dbContext = new DBAccess())
                {
                    string userFirstName = dbContext.Users.Where(p => p.Email == currentUserCred[0]).Select(p => p.FirstName).SingleOrDefault();
                    if (userFirstName == null)
                        txt_HiUser.Text = $"Hi {currentUserCred[0]}!";
                    else
                        txt_HiUser.Text = $"Hi {userFirstName}!";
                }
            }
            else
                txt_HiUser.Text = $"Hi Guest!";
        }

        private void bt_Login_Click(object sender, RoutedEventArgs e)
        {
            if (Convert.ToString(bt_Login.Content) == "Log out")
            {
                _userManager.LogOut();
                ShowHideMgmtButtons();
                bt_Login.Content = "Log in";
                txt_HiUser.Text = $"Hi Guest!";
            }
            else
            {
                LoginOrSignUP loginScreen = new LoginOrSignUP(this);
                loginScreen.ShowDialog();
            }
        }

        private void ListBoxCategories_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            using (var dbContext = new DBAccess())
            {
                if (ListBoxCategories.SelectedItem != null)
                {
                    if(ListBoxCategories.SelectedIndex == 0)
                    {
                        ListBoxProducts.ItemsSource = dbContext.Products.ToList();
                    }
                    else
                    {
                        int categoryId = (ListBoxCategories.SelectedItem as Categories).CategoryID;
                        ListBoxProducts.ItemsSource = dbContext.Products.Where(p=>p.CategoryID == categoryId).ToList();
                    }
                }
            }
        }

        private void bt_MyDetails_Click(object sender, RoutedEventArgs e)
        {
            MyAccount myAccount = new MyAccount(this);
            myAccount.Show();
            this.Hide();
        }

        private void bt_MyOrders_Click(object sender, RoutedEventArgs e)
        {
            MyOrders myOrders = new MyOrders(this);
            myOrders.Show();
            this.Hide();
        }

        private void AddToBasket_Click(object sender, RoutedEventArgs e)
        {
            ListBoxBasket.Items.Add(ListBoxProducts.SelectedItem); 
        }

        private void CheckOut_Click(object sender, RoutedEventArgs e)
        {
            string[] currentUser = File.ReadAllLines(_currentUserFilePath);

            List<Products> products = new List<Products>(); 
            foreach (Products prodItem in ListBoxBasket.Items)
            {
                products.Add(prodItem);
            }

            _ordersManager.Create(currentUser[0], products);

            ListBoxBasket.Items.Clear();
            bt_MyOrders_Click(default(object), default(RoutedEventArgs));
        }

        private void ListBoxProducts_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            ListBoxBasket.Items.Add(ListBoxProducts.SelectedItem);
        }

        private void bt_Inventory_Click(object sender, RoutedEventArgs e)
        {
            Inventory inventory = new Inventory(this);
            inventory.Show();
            this.Hide();
        }

        private void bt_Admin_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
