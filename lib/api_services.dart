import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:user_crud/helpers/api_method.dart';
import 'package:user_crud/model/model.dart';
import 'package:user_crud/utils/api_urls.dart';

class ApiServices {
  static var client = http.Client();

  //nft Api get method
  static Future<User?> userApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).get(ApiUrls.nft, code: 200);
      if (mapResponse != null) {
        User userModel = User.fromJson(mapResponse);
        // ToastMessage.success(dashboardModel.message.success.first.toString());
        return userModel;
      }
    } catch (e) {
      debugPrint('err from history api service ==> $e');
      // ToastMessage.error('Something went Wrong!');
      return null;
    }
    return null;
  }
}
