using System;
using System.Collections.Generic;
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
using System.Windows.Shapes;
using WpfProject1_OnlineShop.DataAccess;
using WpfProject1_OnlineShop.Model;
using WpfProject1_OnlineShop.UsersMgr;
using static WpfProject1_OnlineShop.UsersMgr.IUserManager;

namespace WpfProject1_OnlineShop
{
    /// <summary>
    /// Interaction logic for MyAccount.xaml
    /// </summary>
    public partial class MyAccount : Window
    {
        private MainWindow _mainWindow;
        private string _currentUserFilePath = UserManager.currentUserFilePath;
        private IUserManager _userManager = new UserManager();
        private Users _currentUser;
        public MyAccount(MainWindow mainWindow)
        {
            InitializeComponent();

            _mainWindow = mainWindow;

            SetUser();

            ShowAccDetails();
        }

        private void SetUser()
        {
            if (File.Exists(_currentUserFilePath))
            {
                string[] currentUserCred = File.ReadAllLines(_currentUserFilePath);
                string currentEmail = currentUserCred[0];

                using (var dbContext = new DBAccess())
                {
                    _currentUser = dbContext.Users.Where(p => p.Email == currentEmail).SingleOrDefault();
                }
            }
        }

        private void UpdateAccDetails()
        {
            if (txt_FirstName.Text != "" && txt_FirstName.Text != _currentUser.FirstName)
            {
                _userManager.ModifyUserDetails(_currentUser.Email, DetailToModify.FirstName, txt_FirstName.Text);
            }
            
            if (txt_LastName.Text != "" && txt_LastName.Text != _currentUser.LastName)
            {
                _userManager.ModifyUserDetails(_currentUser.Email, DetailToModify.LastName, txt_LastName.Text);
            }
            
            if (txt_Email.Text != "" && txt_Email.Text != _currentUser.Email)
            {
                _userManager.ModifyUserDetails(_currentUser.Email, DetailToModify.Email, txt_Email.Text);
            }
            
            if (txt_Password.Text != "" && txt_Password.Text != _currentUser.Password)
            {
                _userManager.ModifyUserDetails(_currentUser.Email, DetailToModify.Password, txt_Password.Text);
            }
            
            if (txt_Phone.Text != "" && txt_Phone.Text != _currentUser.Phone)
            {
                _userManager.ModifyUserDetails(_currentUser.Email, DetailToModify.Phone, txt_Phone.Text);
            }
            
            if (dp_BirthDate.Text != "" && !dp_BirthDate.SelectedDate.Equals(_currentUser.BirthDate))
            {
                _userManager.ModifyUserDetails(_currentUser.Email, DetailToModify.BirthDate, dp_BirthDate.Text);
            }
        }

        private void ShowAccDetails()
        {
            txt_FirstName.Text = _currentUser.FirstName;
            txt_LastName.Text = _currentUser.LastName;
            txt_Email.Text = _currentUser.Email;
            txt_Phone.Text = _currentUser.Phone;
            dp_BirthDate.SelectedDate = _currentUser.BirthDate;
        }

        private void bt_UpdateDetails_Click(object sender, RoutedEventArgs e)
        {
            UpdateAccDetails();
        }

        private void bt_BackToHomePage_Click(object sender, RoutedEventArgs e)
        {
            this.Hide();
            _mainWindow.Show();
        }
    }
}
