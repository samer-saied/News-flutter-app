import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class RemoteApi {
  final headers = {HttpHeaders.contentTypeHeader: 'application/json'};

  getApi(serverUrl) async {
    try {
      var url = Uri.parse(serverUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        dynamic jsonData = await json.decode(response.body);
        return jsonData;
      }
    } catch (e) {
      print(e);
    }
  }

  postApi(serverUrl, params) async {
    try {
      var url = Uri.parse(serverUrl);
      var response = await http.post(url, headers: headers, body: params);
      return json.decode(response.body);
    } catch (e) {
      print(e);
    }
  }
}
