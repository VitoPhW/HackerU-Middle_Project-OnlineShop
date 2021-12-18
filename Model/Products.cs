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
    public class Products
    {
        [Key]
        public int ProductID { get; set; }

        [MaxLength(40)]
        public string ProductName { get; set; }

        [MaxLength(300), DefaultValue("NA")]
        public string ProductDescription { get; set; }

        [ForeignKey("CategoryID")]
        public int? CategoryID { get; set; }
        public Categories Category { get; set; }

        [Required]
        public float UnitPrice { get; set; }

        [Required]
        public int UnitsInStock { get; set; }

        [DataType(DataType.ImageUrl)]
        #nullable enable
        public string? Image { get; set; }
    }
}
