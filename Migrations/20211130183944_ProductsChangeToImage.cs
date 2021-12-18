using Microsoft.EntityFrameworkCore.Migrations;

namespace WpfProject1_OnlineShop.Migrations
{
    public partial class ProductsChangeToImage : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "ImageURL",
                table: "Products",
                newName: "Image");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Image",
                table: "Products",
                newName: "ImageURL");
        }
    }
}
