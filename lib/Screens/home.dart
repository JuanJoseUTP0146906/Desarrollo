import 'package:cached_network_image/cached_network_image.dart';
import '../data/data.dart';
import '../models/maravilla_model.dart';
import '../models/popular_tours_model.dart';
import 'details.dart';
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

  @override
  void initState() {
    super.initState();
    country = getCountrys();
    popularTourModels = getPopularTours();
  }

  void _showMenu() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "¿A donde Vamos?",
              style: TextStyle(fontSize: 28, color: Colors.black54, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Busca tu maravilla Favorita...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
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
              "Categorias",
              style: TextStyle(fontSize: 20, color: Colors.black54, fontWeight: FontWeight.w600),
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
                  _buildCategoryButton(Icons.local_bar, "Drinks"),
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
              "Lo mas popular",
              style: TextStyle(fontSize: 20, color: Colors.black54, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 14),
            ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: popularTourModels.length,
              itemBuilder: (context, index) {
                return PopularTours(
                  desc: popularTourModels[index].desc,
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
              height: 95, // Ajusta la altura del encabezado
              child: DrawerHeader(
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.pop(context), // Cerrar el menú
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
                    title: Text('Profile'),
                    onTap: () {
                      Navigator.pop(context);
                      print('Profile');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    onTap: () {
                      Navigator.pop(context);
                      print('Settings');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.forum),
                    title: Text('Forum'),
                    onTap: () {
                      Navigator.pop(context);
                      print('Forum');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.language),
                    title: Text('Languages'),
                    onTap: () {
                      Navigator.pop(context);
                      print('Languages');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(IconData icon, String label) {
    return ElevatedButton.icon(
      onPressed: () {
        // Aquí puedes manejar la acción del botón de categoría
        print("Seleccionado: $label");
      },
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xff4E6059)),
                  ),
                  SizedBox(height: 3),
                  Text(
                    desc,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Color(0xff89A097)),
                  ),
                  SizedBox(height: 6),
                  Text(
                    price,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xff4E6059)),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10, right: 8),
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Color(0xff139157),
              ),
              child: Column(
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

class _CountryListTileState extends State<CountryListTile> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: widget.imgUrl,
              height: 220,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : const Color.fromARGB(193, 0, 0, 0),
                size: 24,
              ),
            ),
          ),
          Container(
            height: 200,
            width: 150,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8, top: 8),
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
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10, left: 8, right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.countryName,
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "${widget.noOfTours} Tours",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(bottom: 10, right: 8),
                      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.white38,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "${widget.rating}",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13),
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
