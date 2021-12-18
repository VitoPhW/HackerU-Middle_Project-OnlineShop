using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfProject1_OnlineShop.OrdersMgr
{
    public interface IAuthentication
    {
        static UserType userType;

    }

    public enum UserType
    {
        Admin,
        Assistant,
        Customer,
        Guest
    }
}
