import 'package:flutter/material.dart';

import 'package:flutter_netflix_responsive_ui/models/content_model.dart';

class ContentList extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  final bool isOriginal;
  const ContentList({
    Key key,
    @required this.title,
    @required this.contentList,
    this.isOriginal = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 24.0),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          height: isOriginal ? 500 : 220,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: contentList.length,
              itemBuilder: (context, index) {
                Content content = contentList[index];
                return GestureDetector(
                  onTap: () {
                    print(content.name);
                  },
                  child: Container(
                    height: isOriginal ? 400 : 200,
                    width: isOriginal ? 240 : 130,
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(content.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
