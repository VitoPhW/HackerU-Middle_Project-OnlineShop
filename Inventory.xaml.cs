using Microsoft.EntityFrameworkCore;
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
using WpfProject1_OnlineShop.DataAccess;
using WpfProject1_OnlineShop.Model;

namespace WpfProject1_OnlineShop
{
    /// <summary>
    /// Interaction logic for Inventory.xaml
    /// </summary>
    public partial class Inventory : Window
    {
        private MainWindow _mainWindow;
        private List<Products> _changedProducts = new List<Products>();
        public Inventory(MainWindow mainWindow)
        {
            InitializeComponent();

            _mainWindow = mainWindow;
            LoadInventory();
        }

        private void LoadInventory()
        {
            using (var dbContext = new DBAccess())
            {
                DataGridInventory.ItemsSource = dbContext.Products.Include(p => p.Category).ToList();
            }
        }

        private void bt_BackToHomePage_Click(object sender, RoutedEventArgs e)
        {
            this.Hide();
            _mainWindow.LoadProductsList();
            _mainWindow.Show();
        }

        private void UpdateDB_Click(object sender, RoutedEventArgs e)
        {
            using (var dbContext = new DBAccess())
            {
                dbContext.UpdateRange(_changedProducts);
                dbContext.SaveChanges();
                _changedProducts.Clear();
                MessageBox.Show("All items are updated successfully.");
            }
        }

        private void DataGridInventory_CellEditEnding(object sender, DataGridCellEditEndingEventArgs e)
        {
            if(e.EditAction == DataGridEditAction.Commit)
            {
                e.EditingElement.GetBindingExpression(TextBox.TextProperty).UpdateSource();
                _changedProducts.Add(e.Row.Item as Products);
            }
        }
    }
}
