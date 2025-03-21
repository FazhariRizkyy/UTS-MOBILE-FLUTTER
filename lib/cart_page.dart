import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;
  final Function(Map<String, dynamic>) removeFromCart; // Menghapus satu item
  final Function() clearCart; // Menghapus semua item

  const CartPage({Key? key, required this.cartItems, required this.removeFromCart, required this.clearCart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shopping Cart")),
      body: cartItems.isEmpty
          ? Center(child: Text("Keranjang belanja kosong!", style: TextStyle(fontSize: 18)))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(cartItems[index]["image"], width: 60, height: 60, fit: BoxFit.cover),
                          ),
                          title: Text(cartItems[index]["name"]),
                          subtitle: Text(cartItems[index]["discountPrice"], style: TextStyle(color: Colors.red)),
                          trailing: IconButton(
                            icon: Icon(Icons.remove_circle, color: Colors.red), // Tombol hapus satu item
                            onPressed: () {
                              removeFromCart(cartItems[index]); // Hapus satu item
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("${cartItems[index]["name"]} dihapus dari keranjang!")),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        clearCart(); // Hapus semua item di keranjang
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Keranjang telah dikosongkan!")),
                        );
                      },
                      icon: Icon(Icons.delete, color: Colors.white),
                      label: Text("Clear Cart", style: TextStyle(fontSize: 18, color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}