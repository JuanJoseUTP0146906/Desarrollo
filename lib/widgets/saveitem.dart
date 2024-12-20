import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';
import '../utils/data.dart';

class SavedItem extends StatefulWidget {
  @override
  _SavedItemState createState() => _SavedItemState();
}

class _SavedItemState extends State<SavedItem> {
  // Lista para mantener el estado de los bookmarks
  List<bool> isBookmarked = List.filled(3, false);

  @override
  Widget build(BuildContext context) {
    final totalDots = 4;
    double currentPosition = 0.0;

    return Container(
      height: 250.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              itemBuilder: (BuildContext context, int index) {
                Map datar = data[index];
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 250,
                        height: 180.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            opacity: 2,
                            filterQuality: FilterQuality.high,
                            image: AssetImage(datar['saved']),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: [
                            // Icono del bookmark
                            Positioned(
                              right: 10,
                              top: 10,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isBookmarked[index] = !isBookmarked[index];
                                  });
                                },
                                child: Container(
                                  height: 30.0,
                                  width: 30.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      isBookmarked[index]
                                          ? Ionicons.bookmark // Ícono lleno
                                          : Ionicons.bookmark_outline,
                                      size: 15.0,
                                      color: isBookmarked[index] ? Colors.yellow : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Información en la parte inferior
                            Positioned(
                              left: 10,
                              bottom: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    datar['city'],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Ubuntu-Regular',
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    datar['places'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Ubuntu-Regular',
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Row(
                                    children: [
                                      Icon(
                                        Iconsax.location,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 2),
                                      Text(
                                        datar['location'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Ubuntu-Regular',
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: DotsIndicator(
              dotsCount: totalDots,
              position: currentPosition,
              decorator: DotsDecorator(
                activeColor: Colors.red,
                size: Size.square(10.0),
                spacing: EdgeInsets.only(left: 5),
                activeSize: Size(20.0, 10.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
