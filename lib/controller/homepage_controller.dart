import 'package:get/get.dart';
import 'package:news_app/core/strings.dart';
import 'package:news_app/data/server/remote.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/models/response_model.dart';

class HomePageController extends GetxController {
  RemoteApi remoteApi = RemoteApi();
  List<NewsModel> currentNews = <NewsModel>[].obs;
  List<String> categories = <String>[].obs;
  RxBool isLoading = false.obs;
  RxInt currentPageIndex = 0.obs;

  getCurrentNews() {
    isLoading.value = true;
    try {
      currentNews.clear();
      remoteApi.getApi("$serverUrl/news").then((res) {
        ResponseModel data = ResponseModel.fromJson(res);
        for (var element in data.data) {
          currentNews.add(element);
        }
        isLoading.value = false;
      });
    } catch (error) {
      print(error);
      isLoading.value = false;
    }
  }

  getMoreCurrentNews(page) {
    try {
      remoteApi.getApi('$serverUrl/news?pid=$page').then((res) {
        for (var element in res['data']) {
          currentNews.add(NewsModel.fromJson(element));
        }
        update();
      });
    } catch (error) {
      print(error);
    }
  }

  getCategories() {
    if (categories.isEmpty) {
      try {
        remoteApi.getApi('$serverUrl/category').then((res) {
          for (var element in res['data']) {
            categories.add(element);
          }
        });
      } catch (error) {
        print(error);
      }
    }
  }
}
