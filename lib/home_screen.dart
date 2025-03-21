import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:foods_app/about_page.dart';
import 'package:foods_app/setting_page.dart';
import 'detail_page.dart';
import 'favorite_page.dart';
import 'cart_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Map<String, dynamic>> favoriteFoods = [];
  List<Map<String, dynamic>> cartItems = [];

  List<Map<String, dynamic>> foodList = [
    {
      "name": "Pizza",
      "price": "Rp 50.000",
      "discountPrice": "Rp 35.000",
      "image": "assets/images/pizza.jpg",
      "description":
          "Pizza adalah makanan yang sangat lezat dan cocok untuk semua kesempatan! Dengan adonan yang renyah dan topping beragam, pizza ini pasti akan memuaskan selera Anda. Cocok untuk dinikmati bersama teman atau keluarga.",
    },
    {
      "name": "Bakso",
      "price": "Rp 10.000",
      "discountPrice": "Rp 15.000",
      "image": "assets/images/bakso.jpeg",
      "description":
          "Bakso, bola daging yang kenyal dan gurih, adalah salah satu makanan favorit di Indonesia. Disajikan dengan kuah kaldu yang hangat dan bumbu yang pas, bakso ini sempurna untuk menghangatkan tubuh di hari yang dingin.",
    },
    {
      "name": "Martabak Asin & Manis",
      "price": "Rp 35.000",
      "discountPrice": "Rp 20.000",
      "image": "assets/images/martabak.png",
      "description":
          "Martabak adalah camilan yang sangat populer, baik dalam versi asin maupun manis. Martabak asin diisi dengan telur, daging, dan sayuran, sementara martabak manis dipenuhi dengan cokelat, kacang, dan susu kental manis. Nikmati keduanya untuk pengalaman rasa yang tak terlupakan!",
    },
    {
      "name": "Pisang Goreng",
      "price": "Rp 15.000",
      "discountPrice": "Rp 10.000",
      "image": "assets/images/pisanggoreng.jpg",
      "description":
          "Pisang goreng adalah camilan yang renyah di luar dan lembut di dalam. Dengan rasa manis alami dari pisang yang digoreng hingga keemasan, camilan ini sangat cocok dinikmati sebagai teman minum teh atau kopi.",
    },
    {
      "name": "Nasi Goreng Madura",
      "price": "Rp 25.000",
      "discountPrice": "Rp 20.000",
      "image": "assets/images/nasigorengmadura.jpg",
      "description":
          "Nasi goreng Madura adalah hidangan yang kaya rasa dengan bumbu khas yang menggugah selera. Dimasak dengan bumbu rempah yang kuat dan disajikan dengan pelengkap seperti ayam, telur, dan kerupuk, nasi goreng ini pasti akan memuaskan perut Anda.",
    },
    {
      "name": "Sate Taichan",
      "price": "Rp 30.000",
      "discountPrice": "Rp 25.000",
      "image": "assets/images/satetaichan.jpeg",
      "description":
          "Sate Taichan adalah sate ayam yang dibakar dengan bumbu sederhana, memberikan rasa yang segar dan lezat. Disajikan dengan sambal pedas dan perasan jeruk nipis, sate ini adalah pilihan sempurna bagi pecinta makanan pedas.",
    },
    {
      "name": "Nasi Padang",
      "price": "Rp 35.000",
      "discountPrice": "Rp 20.000",
      "image": "assets/images/nasingpadang.jpeg",
      "description":
          "Nasi Padang adalah hidangan khas Sumatera yang terkenal dengan berbagai lauk pauk yang kaya rasa. Dengan pilihan seperti rendang, ayam pop, dan sambal hijau, nasi Padang adalah pengalaman kuliner yang tidak boleh dilewatkan.",
    },
    {
      "name": "Bubur Kacang",
      "price": "Rp 20.000",
      "discountPrice": "Rp 15.000",
      "image": "assets/images/buburkacang.jpg",
      "description":
          "Bubur kacang adalah hidangan penutup yang manis dan lembut, terbuat dari kacang hijau yang dimasak hingga empuk. Disajikan dengan santan dan gula merah, bubur ini adalah pilihan yang sempurna untuk menutup makan malam Anda.",
    },
    {
      "name": "Ayam Geprek",
      "price": "Rp 15.000",
      "discountPrice": "Rp 10.000",
      "image": "assets/images/ayamgeprek.jpg",
      "description":
          "Ayam geprek adalah hidangan ayam goreng yang diulek dengan sambal pedas, memberikan rasa yang menggugah selera. Disajikan dengan nasi putih dan sayuran, hidangan ini adalah favorit bagi pecinta makanan pedas.",
    },
    {
      "name": "Es Doger",
      "price": "Rp 10.000",
      "discountPrice": "Rp 5.000",
      "image": "assets/images/esdoger.jpg",
      "description":
          "Es Doger adalah minuman segar yang terbuat dari campuran es serut, santan, dan berbagai bahan seperti ketan hitam dan roti. Cocok untuk menghilangkan dahaga di hari yang panas, es ini adalah pilihan yang menyegarkan.",
    },
    {
      "name": "Ayam Penyet",
      "price": "Rp 20.500",
      "discountPrice": "Rp 15.000",
      "image": "assets/images/ayampenyet.jpg",
      "description":
          "Ayam penyet adalah hidangan ayam goreng yang dipenyet dengan sambal dan disajikan dengan nasi dan lalapan. Rasa pedas dan gurihnya membuat hidangan ini sangat menggugah selera.",
    },
    {
      "name": "Ayam Bakar",
      "price": "Rp 15.000",
      "discountPrice": "Rp 12.000",
      "image": "assets/images/ayambakar.jpg",
      "description":
          "Ayam bakar adalah hidangan ayam yang dibakar dengan bumbu khas yang meresap hingga ke dalam daging. Dengan aroma yang menggoda dan rasa yang kaya, ayam bakar ini sangat cocok disajikan dengan nasi dan sambal.",
    },
    {
      "name": "Mie Ayam",
      "price": "Rp 13.000",
      "discountPrice": "Rp 9.500",
      "image": "assets/images/mieayam.jpg",
      "description":
          "Mie ayam adalah hidangan mie yang disajikan dengan potongan ayam, sayuran, dan kuah kaldu yang gurih. Mie ini adalah pilihan yang sempurna untuk makan siang yang mengenyangkan dan lezat.",
    },
    {
      "name": "Es Teh Hangat",
      "price": "Rp 5.000",
      "discountPrice": "Rp 3.500",
      "image": "assets/images/esteh.png",
      "description":
          "Es teh hangat adalah minuman yang menyegarkan dan cocok dinikmati kapan saja. Dengan rasa teh yang alami dan sedikit manis, minuman ini adalah pilihan yang tepat untuk menemani hidangan Anda.",
    },
    {
      "name": "Klepon",
      "price": "Rp 12.000",
      "discountPrice": "Rp 7.500",
      "image": "assets/images/klepon.jpg",
      "description":
          "Klepon adalah kue tradisional yang terbuat dari tepung ketan dan diisi dengan gula merah. Dengan lapisan kelapa parut di luar, klepon ini adalah camilan manis yang sangat disukai banyak orang.",
    },
    {
      "name": "Sop Iga",
      "price": "Rp 70.000",
      "discountPrice": "Rp 65.000",
      "image": "assets/images/sopiga.jpg",
      "description":
          "Sop iga adalah hidangan sup yang kaya rasa, terbuat dari iga sapi yang dimasak dengan bumbu rempah. Kuahnya yang gurih dan dagingnya yang empuk membuat sop ini menjadi pilihan yang sempurna untuk makan malam.",
    },
    {
      "name": "Ikan Bakar",
      "price": "Rp 35.000",
      "discountPrice": "Rp 25.800",
      "image": "assets/images/ikanbakar.jpg",
      "description":
          "Ikan bakar adalah hidangan ikan yang dibakar dengan bumbu rempah yang khas. Dengan rasa yang smoky dan daging yang lembut, ikan bakar ini sangat cocok disajikan dengan nasi dan sambal.",
    },
    {
      "name": "Kue Cubit",
      "price": "Rp 10.000",
      "discountPrice": "Rp 8.500",
      "image": "assets/images/kuecubit.jpeg",
      "description":
          "Kue cubit adalah camilan manis yang lembut dan kenyal, biasanya disajikan dengan berbagai topping seperti cokelat dan keju. Kue ini adalah pilihan yang sempurna untuk menemani waktu santai Anda.",
    },
    {
      "name": "Bubur Ayam",
      "price": "Rp 20.000",
      "discountPrice": "Rp 13.000",
      "image": "assets/images/buburayam.jpg",
      "description":
          "Bubur ayam adalah hidangan bubur yang disajikan dengan potongan ayam, cakwe, dan sambal. Dengan rasa yang gurih dan tekstur yang lembut, bubur ini adalah pilihan yang tepat untuk sarapan atau makan malam.",
    },
    {
      "name": "Sushi",
      "price": "Rp 80.000",
      "discountPrice": "Rp 59.999",
      "image": "assets/images/sushi.jpg",
      "description":
          "Sushi adalah hidangan khas Jepang yang terbuat dari nasi yang dibentuk dengan berbagai isian seperti ikan segar, sayuran, dan nori. Dengan rasa yang unik dan presentasi yang menarik, sushi adalah pilihan yang sempurna untuk pecinta kuliner.",
    },
  ];

  late List<bool> isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = List.generate(foodList.length, (index) => false);
  }

  List<String> carouselImages = [
    "assets/images/kulineran1.jpg",
    "assets/images/kulineran3.png",
    "assets/images/kulineran2.jpg",
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Kategori Card
  Widget _buildCategoryCard() {
    List<Map<String, dynamic>> categories = [
      {"name": "Semua", "icon": Icons.all_inclusive},
      {"name": "Makanan", "icon": Icons.fastfood},
      {"name": "Minuman", "icon": Icons.local_drink},
      {"name": "Diskon", "icon": Icons.local_offer},
      {"name": "Terlaris", "icon": Icons.star},
      {"name": "Rating Tertinggi", "icon": Icons.thumb_up},
    ];

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children:
              categories.map((category) {
                return Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(category["icon"], color: const Color.fromARGB(255, 0, 0, 0)),
                          SizedBox(width: 8),
                          Text(
                            category["name"],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }

  Widget _buildHomePage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Cari makanan...",
                border: InputBorder.none,
                icon: Icon(Icons.search, color: Colors.grey),
              ),
            ),
          ),
          SizedBox(height: 20),
          CarouselSlider(
            options: CarouselOptions(
              height: 180.0,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
            items:
                carouselImages.map((imgPath) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      imgPath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  );
                }).toList(),
          ),
          SizedBox(height: 20),
          _buildCategoryCard(),
          SizedBox(height: 10),
          Text(
            "🔥 Lagi Ada Promo Nih! 🔥",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: foodList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => DetailPage(
                              name: foodList[index]["name"],
                              price: foodList[index]["price"],
                              discountPrice: foodList[index]["discountPrice"],
                              image: foodList[index]["image"],
                              description: foodList[index]["description"],
                              addToCart: (item) {
                                setState(() {
                                  cartItems.add(item);
                                });
                              },
                            ),
                      ),
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          foodList[index]["image"],
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(foodList[index]["name"]),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            foodList[index]["price"],
                            style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          Text(
                            foodList[index]["discountPrice"],
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          isFavorite[index]
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: isFavorite[index] ? Colors.red : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            isFavorite[index] = !isFavorite[index];
                            if (isFavorite[index]) {
                              favoriteFoods.add(foodList[index]);
                            } else {
                              favoriteFoods.remove(foodList[index]);
                            }
                          });
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _pages() => [
    _buildHomePage(),
    FavoritePage(
      favoriteFoods: favoriteFoods,
      removeFromFavorites: (food) {
        setState(() {
          favoriteFoods.remove(food);
        });
      },
      clearFavorites: () {
        setState(() {
          favoriteFoods.clear();
        });
      },
    ),
    CartPage(
      cartItems: cartItems,
      removeFromCart: (food) {
        setState(() {
          cartItems.remove(food);
        });
      },
      clearCart: () {
        setState(() {
          cartItems.clear();
        });
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(
                "assets/images/fazhari.jpg",
              ), // Gambar profil statis
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.orange),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: _pages()[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
