import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../models/news_model.dart';

class NewsCardWidget extends StatelessWidget {
  final NewsModel newsModel;
  const NewsCardWidget({
    Key? key,
    required this.newsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Colors.grey.withOpacity(0.2),
        ),
      ),
      elevation: 5,
      shadowColor: Colors.grey.withOpacity(0.2),
      child: SizedBox(
        height: 100,
        child: Row(
          children: [
            Flexible(
                flex: 2,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black,
                      child: Center(
                        child: Text(
                          newsModel.topic,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.white),
                          maxLines: 1,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    Expanded(
                      child: CachedNetworkImage(
                        imageUrl: newsModel.media,
                        height: double.infinity,
                        fit: BoxFit.fill,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.2),
                          highlightColor: Colors.white,
                          child: Container(
                            height: 100,
                            width: 300,
                            color: Colors.grey,
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ],
                )),
            Flexible(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          newsModel.title,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          newsModel.description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
