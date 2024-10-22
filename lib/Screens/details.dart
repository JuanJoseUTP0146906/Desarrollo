import 'package:cached_network_image/cached_network_image.dart';
import '../data/data.dart';
import '../models/maravilla_model.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final String imgUrl;
  final String placeName;
  final double rating;

  Details({
    required this.rating,
    required this.imgUrl,
    required this.placeName,
  });

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late List<CountryModel> country;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    country = getCountrys();
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Detectar el modo oscuro del sistema
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  widget.imgUrl,
                  height: 350,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(child: Text('Error loading image'));
                  },
                ),
                Container(
                  height: 350,
                  color: isDarkMode ? Colors.black54 : Colors.black12,
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: toggleFavorite,
                              child: Icon(
                                isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: isFavorite ? Colors.red : Colors.white,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.placeName,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 23,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.white70,
                                  size: 25,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "Koh Chang Tai, Thailand",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                RatingBar(widget.rating.round()),
                                const SizedBox(width: 8),
                                Text(
                                  "${widget.rating}",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: isDarkMode ? Colors.grey[800] : Colors.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        height: 50,
                      )
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FeaturesTile(
                  icon: Icon(Icons.wifi, color: Color(0xff5A6C64)),
                  label: "Free Wi-Fi",
                  isDarkMode: isDarkMode,
                ),
                FeaturesTile(
                  icon: Icon(Icons.beach_access, color: Color(0xff5A6C64)),
                  label: "Sand Beach",
                  isDarkMode: isDarkMode,
                ),
                FeaturesTile(
                  icon: Icon(Icons.card_travel, color: Color(0xff5A6C64)),
                  label: "First Coastline",
                  isDarkMode: isDarkMode,
                ),
                FeaturesTile(
                  icon: Icon(Icons.local_drink, color: Color(0xff5A6C64)),
                  label: "Bar and Restaurant",
                  isDarkMode: isDarkMode,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DetailsCard(
                    title: "Booking",
                    noOfReviews: "30 reviews",
                    rating: 8.0,
                    isDarkMode: isDarkMode,
                  ),
                  DetailsCard(
                    title: "Booking",
                    noOfReviews: "20 reviews",
                    rating: 7.5,
                    isDarkMode: isDarkMode,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 15,
                  height: 1.5,
                  fontWeight: FontWeight.w600,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 240,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: country.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ImageListTile(
                    imgUrl: country[index].imgUrl,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeaturesTile extends StatelessWidget {
  final Icon icon;
  final String label;
  final bool isDarkMode;

  FeaturesTile({required this.label, required this.icon, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff5A6C64).withOpacity(0.5)),
                borderRadius: BorderRadius.circular(40),
              ),
              child: icon,
            ),
            const SizedBox(height: 9),
            SizedBox(
              width: 70,
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isDarkMode ? Colors.white : Color(0xff5A6C64),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsCard extends StatelessWidget {
  final String title;
  final String noOfReviews;
  final double rating;
  final bool isDarkMode; // Recibir el estado del modo oscuro

  DetailsCard({required this.rating, required this.title, required this.noOfReviews, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: isDarkMode ? Colors.grey[800] : Color(0xffE9F4F9),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Color(0xffD5E6F2),
                    borderRadius: BorderRadius.circular(10)),
                child: Image.asset(
                  "assets/card1.png",
                  height: 30,
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isDarkMode ? Colors.white : Color(0xff5A6C64),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "8.0/10",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isDarkMode ? Colors.white : Color(0xff5A6C64),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            "Based on $noOfReviews",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? Colors.white70 : Color(0xff879D95),
            ),
          ),
        ],
      ),
    );
  }
}


class RatingBar extends StatelessWidget {
  final int rating;

  RatingBar(this.rating);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: Colors.yellow, // Cambiar color de estrellas a negro
          size: 18,
        );
      }),
    );
  }
}

class ImageListTile extends StatelessWidget {
  final String imgUrl;

  ImageListTile({required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: imgUrl,
          height: 220,
          width: 150,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
        ),
      ),
    );
  }
}
