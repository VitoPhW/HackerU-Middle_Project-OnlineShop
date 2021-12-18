using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WpfProject1_OnlineShop.Model;

namespace WpfProject1_OnlineShop.UsersMgr
{
    public interface IUserManager
    {
        bool CreateUser(string emailAddress, string password);
        bool IsUserExists(string email);
        bool IsPasswordCompatibleWithEmail(string email, string password);
        void LogIn(string email, string password);
        void LogOut();
        void DeleteUser(string email);
        void DeleteUser(int ID);
        void ModifyUserDetails(string identifyByEmail, DetailToModify detailToModify, string newParameter);
        string GetUserType(string email);
        enum DetailToModify { FirstName, LastName, Email, Password, Phone, BirthDate };
    }
}
