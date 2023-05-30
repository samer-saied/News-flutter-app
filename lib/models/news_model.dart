class NewsModel {
  final String title;
  final String description;
  final String media;
  final String link;
  final String topic;

  NewsModel(
      {required this.link,
      required this.title,
      required this.description,
      required this.media,
      required this.topic});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      link: json['link'],
      title: json['title'],
      description: json['description'],
      media: json['media'],
      topic: json['topic'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> newsModel = <String, dynamic>{};
    newsModel['title'] = title;
    newsModel['description'] = description;
    newsModel['media'] = media;
    newsModel['link'] = link;
    newsModel['topic'] = topic;
    return newsModel;
  }
}
