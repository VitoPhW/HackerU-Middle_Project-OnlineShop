using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using WpfProject1_OnlineShop.DataAccess;
using WpfProject1_OnlineShop.Model;

namespace WpfProject1_OnlineShop.UsersMgr
{
    public class UserManager : IUserManager
    {
        public const string currentUserFilePath = @".\CurrentUser.txt";

        public bool CreateUser(string email, string password)
        {
            using (var dbContext = new DBAccess())
            {
                if (!IsUserExists(email))
                {
                    if (password.Length > 5)
                    {
                        var newUser = new Users()
                        {
                            Email = email,
                            Password = password,
                            TypeName = "Customer",
                        };

                        dbContext.Add(newUser);
                        dbContext.SaveChanges();
                        return true;
                    }
                    else
                    {
                        MessageBox.Show("Your password is too short.\nPlease use minimum 6 characters.", "Password too short");
                        return false;
                    }
                }
                else
                {
                    MessageBox.Show($"User with email \"{email}\" already exists.", "User already exists");
                    return false;
                }
            }
        }

        public void DeleteUser(string email)
        {
            if (IsUserExists(email))
            {
                using (var dbContext = new DBAccess())
                {
                    var deleteUserByEmail = dbContext.Users.FirstOrDefault(p => p.Email == email);
                    dbContext.Remove(deleteUserByEmail);
                    dbContext.SaveChanges();
                }
            }
            else
                MessageBox.Show($"User with email \"{email}\" doesn't exists");
        }

        public void DeleteUser(int ID)
        {
            using (var dbContext = new DBAccess())
            {
                var deleteUserByEmail = dbContext.Users.FirstOrDefault(p => p.UserID == ID);
                dbContext.Remove(deleteUserByEmail);
                dbContext.SaveChanges();
            }
        }

        public bool IsUserExists(string email)
        {
            using (var dbContext = new DBAccess())
            {
                var user = dbContext.Users
                    .Where(p => p.Email.ToLower() == email.ToLower())
                    .Select(p => p.Email).FirstOrDefault();

                if (user == email)
                    return true;
                else
                    return false;
            }
        }

        public bool IsPasswordCompatibleWithEmail(string email, string password)
        {
            using (var dbContext = new DBAccess())
            {
                if (IsUserExists(email))
                {
                    try
                    {
                        var passwordInDB = dbContext.Users
                            .Where(p => p.Email.ToLower() == email.ToLower())
                            .Select(p => p.Password).Single();
                        if (passwordInDB == password)
                            return true;
                        else
                            return false;
                    }
                    catch (Exception)
                    {
                        return false;
                    }
                }
                else
                    return false;
            }
        }
        public void LogIn(string email, string password)
        {
            if (IsPasswordCompatibleWithEmail(email, password))
            {
                string userType = GetUserType(email);
                string credentials = $"{email}\n{password}\n{userType}";
                
                File.WriteAllText(currentUserFilePath, credentials); // Creates\overwrites a file
            }
            else 
            {
                MessageBox.Show("Invalid username or password.");
            }
        }
        public void LogOut()
        {
            File.Delete(currentUserFilePath);
        }

        public void ModifyUserDetails(string identifyByEmail, IUserManager.DetailToModify detailToModify, string newParameter)
        {
            if (IsUserExists(identifyByEmail))
            {
                using (var dbContext = new DBAccess())
                {
                    Users user = dbContext.Users.Where(p => p.Email == identifyByEmail).FirstOrDefault();
                    switch(detailToModify)
                    {
                        case IUserManager.DetailToModify.FirstName:
                            user.FirstName = newParameter;
                            dbContext.Update(user);
                            break;
                        case IUserManager.DetailToModify.LastName:

                            user.LastName = newParameter;
                            dbContext.Update(user);
                            break;
                        case IUserManager.DetailToModify.Email:
                            user.Email = newParameter;
                            dbContext.Update(user);
                            break;
                        case IUserManager.DetailToModify.Password:
                            user.Password = newParameter;
                            dbContext.Update(user);
                            break;
                        case IUserManager.DetailToModify.Phone:
                            user.Phone = newParameter;
                            dbContext.Update(user);
                            break;
                        case IUserManager.DetailToModify.BirthDate:
                            user.BirthDate = DateTime.Parse(newParameter);
                            dbContext.Update(user);
                            break;
                    }
                    dbContext.SaveChanges();
                }
            }
        }

        public string GetUserType(string email)
        {
            using (var dbContext = new DBAccess())
            {
                if (IsUserExists(email)) 
                {
                    var userType = dbContext.Users
                        .Where(p => p.Email.ToLower() == email.ToLower())
                        .Select(p => p.UserType).FirstOrDefault();
                    return userType.TypeName;
                }
                else
                {
                    return "Guest";
                }
            }
        }
    }
}