import 'package:cached_network_image/cached_network_image.dart';
import '../data/data.dart';
import '../models/maravilla_model.dart';
import '../models/popular_tours_model.dart';
import 'details.dart';
import 'forum.dart';
import 'profile.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<PopularTourModel> popularTourModels = [];
  List<CountryModel> country = [];
  String searchQuery = '';
  bool isDarkMode = false; // Estado para el modo oscuro

  @override
  void initState() {
    super.initState();
    country = getCountrys();
    popularTourModels = getPopularTours();
  }

  void _showMenu() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void _toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final themeData = isDarkMode
        ? ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Colors.black,
            appBarTheme: AppBarTheme(color: Colors.grey[850]),
          )
        : ThemeData.light();

    return MaterialApp(
      theme: themeData,
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: _showMenu,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo.png",
                height: 30,
              ),
              SizedBox(width: 5),
              Text(
                "Maravillas 360",
                style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(isDarkMode ? Icons.wb_sunny : Icons.nights_stay),
              onPressed: _toggleTheme,
            ),
          ],
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "¿A dónde Vamos?",
                style: TextStyle(fontSize: 28, color: isDarkMode ? Colors.white : Colors.black54, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: isDarkMode ? Colors.grey[800] : Colors.white,
                  boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.4), blurRadius: 10)],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Busca tu maravilla favorita...',
                    hintStyle: TextStyle(color: isDarkMode ? Colors.white54 : Colors.black54),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: isDarkMode ? Colors.white : Colors.black),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 240,
                child: ListView.builder(
                  itemCount: country.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CountryListTile(
                      label: country[index].label,
                      countryName: country[index].countryName,
                      noOfTours: country[index].noOfTours,
                      rating: country[index].rating,
                      imgUrl: country[index].imgUrl,
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Categorías",
                style: TextStyle(fontSize: 18, color: isDarkMode ? Colors.white : Colors.black54, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCategoryButton(Icons.restaurant, "Comidas"),
                    SizedBox(width: 16),
                    _buildCategoryButton(Icons.hotel, "Hospedajes"),
                    SizedBox(width: 16),
                    _buildCategoryButton(Icons.local_bar, "Bebidas"),
                    SizedBox(width: 16),
                    _buildCategoryButton(Icons.festival, "Diversión"),
                    SizedBox(width: 16),
                    _buildCategoryButton(Icons.pool, "Lugares para nadar"),
                    SizedBox(width: 16),
                    _buildCategoryButton(Icons.family_restroom, "Familiar"),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Lo más popular",
                style: TextStyle(fontSize: 18, color: isDarkMode ? Colors.white : Colors.black54, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 14),
              ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: popularTourModels.length,
                itemBuilder: (context, index) {
                  return PopularTours(
                    desc: popularTourModels[index].desc.length > 40
                        ? popularTourModels[index].desc.substring(0, 40) + '...'
                        : popularTourModels[index].desc,
                    imgUrl: popularTourModels[index].imgUrl,
                    title: popularTourModels[index].title,
                    price: popularTourModels[index].price,
                    rating: popularTourModels[index].rating,
                  );
                },
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                height: 100,
                child: DrawerHeader(
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.close, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Expanded(
                        child: Text(
                          'Menú',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Perfil', style: TextStyle(color: isDarkMode ? Colors.white : Colors.black)),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Profile()),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Configuración', style: TextStyle(color: isDarkMode ? Colors.white : Colors.black)),
                      onTap: () {
                        Navigator.pop(context);
                        print('Configuración');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.forum),
                      title: Text('Foro', style: TextStyle(color: isDarkMode ? Colors.white : Colors.black)),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Forum()),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.language),
                      title: Text('Idiomas', style: TextStyle(color: isDarkMode ? Colors.white : Colors.black)),
                      onTap: () {
                        Navigator.pop(context);
                        print('Idiomas');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(IconData icon, String label) {
    return ElevatedButton.icon(
      onPressed: () {
        print("Seleccionado: $label");
      },
      icon: Icon(icon, color: Colors.white),
      label: Text(label, style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: EdgeInsets.symmetric(horizontal: 19, vertical: 8),
      ),
    );
  }
}

class PopularTours extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String desc;
  final String price;
  final double rating;

  PopularTours({
    required this.imgUrl,
    required this.rating,
    required this.desc,
    required this.price,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(
              imgUrl: imgUrl,
              placeName: title,
              rating: rating,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: Color(0xffE9F4F9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
              child: CachedNetworkImage(
                imageUrl: imgUrl,
                width: 110,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xff4E6059)),
                    ),
                    SizedBox(height: 3),
                    Text(
                      desc,
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff89A097)),
                    ),
                    SizedBox(height: 6),
                    Text(
                      price,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xff4E6059)),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10, right: 8),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Color(0xff139157),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$rating",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                  SizedBox(height: 2),
                  Icon(Icons.star, color: Colors.white, size: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CountryListTile extends StatefulWidget {
  final String label;
  final String countryName;
  final int noOfTours;
  final double rating;
  final String imgUrl;

  CountryListTile({
    required this.countryName,
    required this.label,
    required this.noOfTours,
    required this.rating,
    required this.imgUrl,
  });

  @override
  _CountryListTileState createState() => _CountryListTileState();
}

class _CountryListTileState extends State<CountryListTile>
    with SingleTickerProviderStateMixin {
  bool isFavorite = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    if (isFavorite) {
      _controller.forward().then((_) => _controller.reverse());
    }
  }

  @override
  Widget build(BuildContext context) {
    final double tileWidth = 220;
    final double tileHeight = 240;

    return Container(
      margin: EdgeInsets.only(right: 8),
      width: tileWidth,
      height: tileHeight,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: widget.imgUrl,
              width: tileWidth,
              height: tileHeight,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [Colors.black54, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white38,
                      ),
                      child: Text(
                        widget.label,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    GestureDetector(
                      onTap: _toggleFavorite,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite
                                ? Colors.red
                                : const Color.fromARGB(193, 0, 0, 0),
                            size: 24,
                          ),
                          ScaleTransition(
                            scale: _animation,
                            child: Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.countryName,
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
                        ),
                        SizedBox(height: 3),
                        Text(
                          "${widget.noOfTours} Tours",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.white38,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "${widget.rating}",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 10),
                          ),
                          SizedBox(height: 2),
                          Icon(Icons.star, color: Colors.amber, size: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
