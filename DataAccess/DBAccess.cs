using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WpfProject1_OnlineShop.Model;

namespace WpfProject1_OnlineShop.DataAccess
{
    public class DBAccess : DbContext
    {
        public DbSet<Users> Users { get; set; }
        public DbSet<UserTypes> UserTypes { get; set; }
        public DbSet<Model.Orders> Orders { get; set; }
        public DbSet<Products> Products { get; set; }
        public DbSet<Categories> Categories { get; set; }
        protected override void OnModelCreating(ModelBuilder builder)
        {
            builder.Entity<OrderDetails>().HasKey(table => new
            {
                table.OrderID,
                table.ProductID
            });
        }
        public DbSet<OrderDetails> OrderDetails { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer(
                    "Server=localhost\\SQLEXPRESS;" +
                    "Database=OnlineShopV2;" +
                    "Trusted_Connection=True;" +
                    "MultipleActiveResultSets=true;");
                //.LogTo(Console.WriteLine, Microsoft.Extensions.Logging.LogLevel.Information);
            }
        }
    }
}
