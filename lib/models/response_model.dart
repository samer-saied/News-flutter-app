import 'package:news_app/models/news_model.dart';

class ResponseModel {
  final List<NewsModel> data;
  final String currentPage;
  final int total;

  const ResponseModel({
    required this.data,
    required this.currentPage,
    required this.total,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    List<NewsModel> data = [];
    json['data'].forEach((v) => data.add(NewsModel.fromJson(v)));
    return ResponseModel(
      data: data,
      currentPage: json['current_page'],
      total: json['total'],
    );
  }
}
