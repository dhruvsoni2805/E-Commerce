import 'dart:convert';
import 'dart:io';

import 'package:ecommerce/data_network/app_exception.dart';
import 'package:ecommerce/data_network/network/base_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Networkservice extends BaseService {
  @override
  Future<dynamic> getApiResponse(String url) async {
    debugPrint("the App url is : $url");
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
      debugPrint(" response is : ${response.body}");
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet Connection');
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApiResponse(String url, String data) async {
    debugPrint("the App url is : $url");
    debugPrint("the App data is : $data");
    dynamic responseJson;
    try {
      final response = await http
          .post(
            Uri.parse(url),
            body: data,
          )
          .timeout(const Duration(seconds: 30));
      debugPrint(" response is : ${response.body}");
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnAutorizedAccessException(response.body.toString());
      case 404:
        throw FetchDataException(response.body.toString());
      case 502:
        throw BadGateWayException(response.body.toString());
      case 503:
        throw NoServiceException(response.body.toString());
      case 504:
        throw GatewayTimeOutException(response.body.toString());
      default:
        throw FetchDataException(
            "Error Occure While Communicate With server : ${response.statusCode}");
    }
  }
}
