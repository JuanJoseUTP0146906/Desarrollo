import 'package:flutter/material.dart';
import '../utils/data.dart';

class StoryItem extends StatefulWidget {
  @override
  _StoryItemState createState() => _StoryItemState();
}

class _StoryItemState extends State<StoryItem> {
  void _showStoryViewer(String storyImage, String dpImage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.black,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image.asset(
                      storyImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(dpImage),
                    backgroundColor: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Escribe un comentario...',
                            filled: true,
                            fillColor: Colors.grey[800],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 10),
                      _reactionIcon(Icons.thumb_up),
                      SizedBox(width: 10),
                      _reactionIcon(Icons.favorite),
                      SizedBox(width: 10),
                      _reactionIcon(Icons.sentiment_satisfied),
                      SizedBox(width: 10),
                      _reactionIcon(Icons.sentiment_dissatisfied),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _reactionIcon(IconData icon) {
    return GestureDetector(
      onTap: () {
        // Manejar la reacción aquí
      },
      child: Icon(
        icon,
        color: Colors.white,
        size: 30,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          Map story = data[index];
          return GestureDetector(
            onTap: () {
              _showStoryViewer(story['story'], story['dp']);
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Stack(
                children: [
                  Container(
                    height: 180.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(story['story']),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 4),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 150.0,
                    right: 42.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            offset: Offset(0.0, 0.0),
                            blurRadius: 4.0,
                            spreadRadius: 1.0,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(story['dp']),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
