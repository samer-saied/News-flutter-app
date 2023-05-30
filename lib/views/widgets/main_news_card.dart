import 'package:flutter/material.dart';

import '../../models/news_model.dart';

class MainNewsCard extends StatelessWidget {
  final NewsModel newsModel;
  const MainNewsCard({
    Key? key,
    required this.newsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(children: [
        Image(
          height: 250,
          width: double.infinity,
          fit: BoxFit.cover,
          image: NetworkImage(newsModel.media),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.2),
                  Colors.black,
                ],
              ),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Text(
                  newsModel.title,
                  maxLines: 2,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 2,
                ),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  newsModel.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ]),
          ),
        )
      ]),
    );
  }
}
