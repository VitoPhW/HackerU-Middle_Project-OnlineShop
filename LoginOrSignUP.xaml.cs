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
using WpfProject1_OnlineShop.DataAccess;
using System.Windows.Shapes;
using WpfProject1_OnlineShop.Model;
using WpfProject1_OnlineShop.UsersMgr;
using System.Threading;
using System.IO;

namespace WpfProject1_OnlineShop
{
    /// <summary>
    /// Interaction logic for LoginOrSignUP.xaml
    /// </summary>
    public partial class LoginOrSignUP : Window
    {
        private IUserManager userManager = new UserManager();
        private MainWindow _mainWindow;
        string _currentUserFilePath = UserManager.currentUserFilePath;
        public LoginOrSignUP(MainWindow mainWindow)
        {
            InitializeComponent();

            _mainWindow = mainWindow;
        }

        private void Login_Click(object sender, RoutedEventArgs e)
        {
            userManager.LogIn(txt_Email.Text, txt_Password.Text);
            if(File.Exists(_currentUserFilePath))
            {
                txtblock_1.Text = File.ReadAllText(UserManager.currentUserFilePath);
                _mainWindow.UpdateHiUser();
                _mainWindow.UpdateLoginButton();
                _mainWindow.ShowHideMgmtButtons();
                this.Hide();
            }
        }

        private void Register_Click(object sender, RoutedEventArgs e)
        {
            if (userManager.CreateUser(txt_Email.Text, txt_Password.Text))
            {
                MessageBox.Show("Registration finished successfully!\nYou can login or close the Login\\Sign up window.");
            }
        }

        private void txt_Password_KeyUp(object sender, KeyEventArgs e)
        {
            if(e.Key==Key.Enter)
            {
                Login_Click(sender, e);
                Login.Focus();
            }
        }

        private void txt_Email_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                txt_Password.Focus();
            }
        }
    }
}
