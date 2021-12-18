using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfProject1_OnlineShop.Model
{
    public class OrderDetails
    {
        [Key, ForeignKey("OrderID")]
        public int OrderID { get; set; }
        public Orders Order { get; set; }

        [Key, ForeignKey("ProductID")]
        public int ProductID { get; set; }
        public Products Product { get; set; }

        [Required]
        public int Quantity { get; set; }

        [DefaultValue(0)]
        public float Discount { get; set; }
    }
}
