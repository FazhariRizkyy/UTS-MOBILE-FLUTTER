import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  final List<Map<String, dynamic>> favoriteFoods;
  final Function(Map<String, dynamic>) removeFromFavorites; // Menghapus satu item
  final Function() clearFavorites; // Menghapus semua item

  const FavoritePage({Key? key, required this.favoriteFoods, required this.removeFromFavorites, required this.clearFavorites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorite Foods")),
      body: favoriteFoods.isEmpty
          ? Center(child: Text("Belum ada makanan favorit!", style: TextStyle(fontSize: 18)))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: favoriteFoods.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(favoriteFoods[index]["image"], width: 60, height: 60, fit: BoxFit.cover),
                          ),
                          title: Text(favoriteFoods[index]["name"]),
                          subtitle: Text(favoriteFoods[index]["discountPrice"], style: TextStyle(color: Colors.red)),
                          trailing: IconButton(
                            icon: Icon(Icons.favorite, color: Colors.red), // Tombol hapus satu item
                            onPressed: () {
                              removeFromFavorites(favoriteFoods[index]); // Hapus satu item
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("${favoriteFoods[index]["name"]} dihapus dari Favorite!")),
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
                        clearFavorites(); // Hapus semua item dari Favorite
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Semua makanan favorit telah dihapus!")),
                        );
                      },
                      icon: Icon(Icons.delete, color: Colors.white),
                      label: Text("Clear Favorite", style: TextStyle(fontSize: 18, color: Colors.white)),
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