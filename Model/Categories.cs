using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfProject1_OnlineShop.Model
{
    public class Categories
    {
        [Key]
        public int CategoryID { get; set; }

        [Required, MaxLength(40)]
        public string CategoryName { get; set; }

        [DataType(DataType.MultilineText), MaxLength(300)]
        public string CategoryDescription { get; set; }

        [DataType(DataType.ImageUrl)]
        #nullable enable
        public string? ImageURL { get; set; }
    }
}
