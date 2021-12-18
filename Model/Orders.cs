using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfProject1_OnlineShop.Model
{
    public class Orders
    {
        [Key]
        public int OrderID { get; set; }

        [ForeignKey("Users")]
        public int UserID { get; set; }
        public Users Users { get; set; }

        [Required]
        public DateTime OrderDate { get; set; }
    }
}
