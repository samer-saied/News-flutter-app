class NewsDetailsModel {
  final String title;
  final String description;
  final String media;
  final String type;
  final String topic;
  final String timeDate;

  NewsDetailsModel(
      {required this.timeDate,
      required this.title,
      required this.description,
      required this.media,
      required this.type,
      required this.topic});

  factory NewsDetailsModel.fromJson(Map<String, dynamic> json) {
    return NewsDetailsModel(
      timeDate: json['timeDate'],
      title: json['title'],
      type: json['type'],
      description: json['description'],
      media: json['media'],
      topic: json['topic'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> newsDetailsModel = <String, dynamic>{};
    newsDetailsModel['title'] = title;
    newsDetailsModel['description'] = description;
    newsDetailsModel['media'] = media;
    newsDetailsModel['type'] = type;
    newsDetailsModel['topic'] = topic;
    newsDetailsModel['timeDate'] = timeDate;
    return newsDetailsModel;
  }
}
