using Microsoft.EntityFrameworkCore.Migrations;

namespace WpfProject1_OnlineShop.Migrations
{
    public partial class addUserTypes : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Type_Id",
                table: "UserTypes",
                newName: "TypeID");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "TypeID",
                table: "UserTypes",
                newName: "Type_Id");
        }
    }
}
