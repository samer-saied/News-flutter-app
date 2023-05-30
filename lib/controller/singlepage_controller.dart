import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/strings.dart';
import 'package:news_app/data/server/remote.dart';
import 'package:news_app/models/news_details_model.dart';

class SinglePageController extends GetxController {
  RemoteApi remoteApi = RemoteApi();
  late NewsDetailsModel singleNews;
  RxBool isLoading = true.obs;

  getSingleNews(String newsLink) {
    isLoading.value = true;
    Map data = {'subject': newsLink};
    var body = json.encode(data);
    try {
      remoteApi.postApi('$serverUrl/news/single', body).then((res) {
        NewsDetailsModel data = NewsDetailsModel.fromJson(res);
        singleNews = data;
        isLoading.value = false;
        return data;
      });
    } catch (error) {
      Get.dialog(Text(error.toString()));
      isLoading.value = false;
    }
  }
}
