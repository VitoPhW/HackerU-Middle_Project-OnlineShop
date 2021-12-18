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

namespace WpfProject1_OnlineShop
{
    /// <summary>
    /// Interaction logic for Administration.xaml
    /// </summary>
    public partial class Administration : Window
    {
        public Administration()
        {
            InitializeComponent();
        }

        private void bt_AddNewProduct_Click(object sender, RoutedEventArgs e)
        {
            using (var dbContext = new DBAccess())
            {
                var newProduct = new Products
                {
                    ProductName = txt_NProdName.Text,
                    ProductDescription = txt_NProdDescription.Text,
                    CategoryID = 2, //txt_NCategory.Text,
                    UnitPrice = int.Parse(txt_NUnitPrice.Text),
                    UnitsInStock = int.Parse(txt_NUnitsInStock.Text)
                };
                int count = dbContext.Users.Count();

                dbContext.Add(newProduct);
                string log = dbContext.SaveChanges().ToString();

                txtblock_1.Text = $"Amount of users: {count}\n" +
                    $"Users added: {log}"
                    + "\nDate sent to database: ";

                Thread.Sleep(5 * 1000);

                MainWindow main = new MainWindow();
                main.Show();
            }
        }
    }
}
