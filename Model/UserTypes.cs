using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfProject1_OnlineShop.Model
{
    public class UserTypes
    {
        [Key, MaxLength(10)]
        public string TypeName { get; set; }
        
        [Required]
        public string TypeDescription { get; set; }
    }
}
