import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class Api {
  String baseUrl = "http://192.168.1.74:8000/api/";

  Future loginRegister(Map data, String endPoint) async {
    String url = baseUrl + endPoint;
    var response = await http.post(Uri.parse(url),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(data));

    return response;
  }

  Future postData(Map data, String endPoint) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('token');
    String url = baseUrl + endPoint;
    var response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(data));
    // ignore: avoid_print
    print(response.statusCode);
  }

  Future getData(String endPoint) async {
    String url = baseUrl + endPoint;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('token');
    // ignore: avoid_print
    print(token);
    var response = await http.get(Uri.parse(url), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    // ignore: avoid_print
    print(response.statusCode);
    return response;
  }

  Future getuser(String endPoint) async {
    String url = baseUrl + endPoint;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('token');
    var response = await http.get(Uri.parse(url), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return response;
  }
}

class Search {
  String baseUrl = "http://192.168.18.8:8000/api/";
  Future getSearch(String endPoint) async {
    String url = baseUrl + endPoint;

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('token');
    var response = await Dio().get(url,
        options: Options(headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        }));
    return response.data;
  }
}
