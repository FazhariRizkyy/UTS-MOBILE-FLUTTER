import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String name;
  final String price;
  final String discountPrice;
  final String image;
  final String description;
  final Function(Map<String, dynamic>) addToCart; // Callback untuk menambahkan ke cart

  const DetailPage({
    super.key,
    required this.name,
    required this.price,
    required this.discountPrice,
    required this.image,
    required this.description,
    required this.addToCart, // Terima fungsi addToCart dari Home
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Makanan
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(image, width: double.infinity, height: 200, fit: BoxFit.cover),
            ),
            SizedBox(height: 16),

            // Rating dan Harga
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(5, (index) => Icon(Icons.star, color: Colors.amber, size: 24)), // Rating bintang
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(price, style: TextStyle(color: Colors.grey, decoration: TextDecoration.lineThrough)),
                    Text(discountPrice, style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),

            // Nama Makanan
            Text(name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),

            // Deskripsi Makanan
            Text(description, style: TextStyle(fontSize: 16, color: Colors.grey)),
            SizedBox(height: 80), // Tambahkan padding agar tombol tidak tertutup
          ],
        ),
      ),

      // Tombol Tambah ke Keranjang di bagian bawah
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0),
        child: ElevatedButton.icon(
          onPressed: () {
            addToCart({
              "name": name,
              "price": price,
              "discountPrice": discountPrice,
              "image": image,
            });

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("$name berhasil ditambahkan ke keranjang!"),
                duration: Duration(seconds: 2),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.green,
              ),
            );

            // Kembali ke halaman sebelumnya setelah sukses menambahkan ke keranjang
          },
          icon: Icon(Icons.shopping_cart, color: const Color.fromARGB(255, 255, 255, 255)),
          label: Text("Tambah ke Keranjang", style: TextStyle(fontSize: 18, color: const Color.fromARGB(255, 255, 255, 255))),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 58, 218, 26),
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }
}
