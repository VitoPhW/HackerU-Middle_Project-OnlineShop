using Microsoft.EntityFrameworkCore.Migrations;

namespace WpfProject1_OnlineShop.Migrations
{
    public partial class ChangeKeyOfUserTypesTable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Users_UserTypes_Type_Id",
                table: "Users");

            migrationBuilder.DropPrimaryKey(
                name: "PK_UserTypes",
                table: "UserTypes");

            migrationBuilder.DropIndex(
                name: "IX_Users_Type_Id",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "TypeID",
                table: "UserTypes");

            migrationBuilder.DropColumn(
                name: "Type_Id",
                table: "Users");

            migrationBuilder.AddColumn<string>(
                name: "TypeName",
                table: "Users",
                type: "nvarchar(10)",
                nullable: true);

            migrationBuilder.AddPrimaryKey(
                name: "PK_UserTypes",
                table: "UserTypes",
                column: "TypeName");

            migrationBuilder.CreateIndex(
                name: "IX_Users_TypeName",
                table: "Users",
                column: "TypeName");

            migrationBuilder.AddForeignKey(
                name: "FK_Users_UserTypes_TypeName",
                table: "Users",
                column: "TypeName",
                principalTable: "UserTypes",
                principalColumn: "TypeName",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Users_UserTypes_TypeName",
                table: "Users");

            migrationBuilder.DropPrimaryKey(
                name: "PK_UserTypes",
                table: "UserTypes");

            migrationBuilder.DropIndex(
                name: "IX_Users_TypeName",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "TypeName",
                table: "Users");

            migrationBuilder.AddColumn<int>(
                name: "TypeID",
                table: "UserTypes",
                type: "int",
                nullable: false,
                defaultValue: 0)
                .Annotation("SqlServer:Identity", "1, 1");

            migrationBuilder.AddColumn<int>(
                name: "Type_Id",
                table: "Users",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddPrimaryKey(
                name: "PK_UserTypes",
                table: "UserTypes",
                column: "TypeID");

            migrationBuilder.CreateIndex(
                name: "IX_Users_Type_Id",
                table: "Users",
                column: "Type_Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Users_UserTypes_Type_Id",
                table: "Users",
                column: "Type_Id",
                principalTable: "UserTypes",
                principalColumn: "TypeID",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
