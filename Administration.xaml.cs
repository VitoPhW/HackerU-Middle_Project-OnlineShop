using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using WpfProject1_OnlineShop.DataAccess;
using WpfProject1_OnlineShop.Model;
using WpfProject1_OnlineShop.OrdersMgr;
using WpfProject1_OnlineShop.UsersMgr;

namespace WpfProject1_OnlineShop
{
    /// <summary>
    /// Interaction logic for Administration.xaml
    /// </summary>
    public partial class Administration : Window
    {
        private MainWindow _mainWindow;
        private IOrdersManager _ordersManager = new OrdersManager();
        private List<Users> _changedUser = new List<Users>();
        private string _password;

        public Administration(MainWindow mainWindow)
        {
            InitializeComponent();

            _mainWindow = mainWindow;
            LoadUsers();
        }

        private void LoadUsers()
        {
            using (var dbContext = new DBAccess())
            {
                DataGridUsers.ItemsSource = dbContext.Users.ToList();
            }
        }

        private void DataGridUsers_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (DataGridUsers.SelectedItem as Users != null)
            {
                int userID = (DataGridUsers.SelectedItem as Users).UserID;
                List<OrderDetails> orderDetails = _ordersManager.GetOrderDetailsByUserID(userID);
                DataGridOrderDetails.ItemsSource = orderDetails;
            }
        }

        private void bt_BackToHomePage_Click(object sender, RoutedEventArgs e)
        {
            this.Hide();
            _mainWindow.Show();
        }

        private void DataGridUsers_CellEditEnding(object sender, DataGridCellEditEndingEventArgs e)
        {
            if (e.EditAction == DataGridEditAction.Commit)
            {
                e.EditingElement.GetBindingExpression(TextBox.TextProperty).UpdateSource();
                _changedUser.Add(e.Row.Item as Users);
            }
        }

        private void bt_UpdateUsers_Click(object sender, RoutedEventArgs e)
        {
            using (var dbContext = new DBAccess())
            {
                dbContext.UpdateRange(_changedUser);
                dbContext.SaveChanges();
                _changedUser.Clear();
                MessageBox.Show("All users are updated successfully.");
            }
        }

        private void bt_CreateUser_Click(object sender, RoutedEventArgs e)
        {
            if (DataGridUsers.Items.MoveCurrentToLast())
            {
                Users newUser = DataGridUsers.Items.CurrentItem as Users;
                newUser.Password = "";
                using (var dbContext = new DBAccess())
                {
                    dbContext.Add(newUser);
                    dbContext.SaveChanges();
                }
            }
            MessageBox.Show("User has been created successfully.");

            DataGridUsers.Items.Refresh();
        }

        private void bt_DeleteUser_Click(object sender, RoutedEventArgs e)
        {
            Users deleteUser = DataGridUsers.SelectedItem as Users;
            using (var dbContext = new DBAccess())
            {
                dbContext.Remove(deleteUser);
                dbContext.SaveChanges();
            }
            MessageBox.Show("User has been deleted successfully.");

            LoadUsers();
        }
    }
}
