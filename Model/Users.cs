using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WpfProject1_OnlineShop.OrdersMgr;

namespace WpfProject1_OnlineShop.Model
{
    public class Users
    {
        [Key]
        public int UserID { get; set; }

        [ForeignKey("UserType")]
        public string TypeName { get; set; }
        public UserTypes UserType { get; set; }

        [MaxLength(40)]
        public string FirstName { get; set; }

        [MaxLength(50)]
        public string LastName { get; set; }

        [EmailAddress, Required, MaxLength(100)]
        public string Email { get; set; }

        [Required, MaxLength(30)]
        public string Password { get; set; }

        [Phone, MaxLength(20)]
        public string Phone { get; set; }

        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        public DateTime? BirthDate { get; set; }
    }
}
