import 'dart:io';

import 'package:get/get.dart';
import 'package:mail_api/constants/api_urls.dart';

enum Method { POST, GET, PUT, DELETE, PATCH }

class GetxNetworkCall extends GetConnect {
  @override
  void onReady() {
    super.onReady();
    httpClient.baseUrl = ApiUrls.baseUrl;
  }

  Future<Response> makeRequest(String url, Method method,
      Map<String, String> header, Map<String, dynamic>? params) async {
    late Response response;

    print(url);
    print(params);

    try {
      if (method == Method.POST) {
        response = await httpClient.post(url, body: params, headers: header);
      } else if (method == Method.DELETE) {
        response = await httpClient.delete(url, headers: header);
      } else if (method == Method.PATCH) {
        response = await httpClient.patch(url, headers: header);
      } else {
        response = await httpClient.get(url, query: params, headers: header);
      }

      print(response.body);
      print(response.statusCode);

      if (response.isOk) {
        return response;
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized");
      } else if (response.statusCode == 500) {
        throw Exception("Server Error");
      } else if (response.statusCode == 422) {
        throw Exception("This value is already used");
      } else if (response.statusCode == 504) {
        throw Exception("Connection time out try again");
      } else if (response.statusCode == 403) {
        throw Exception("Credential dosen't match");
      } else if (response.status.connectionError) {
        throw Exception("No Internet Connection");
      } else if (response.status.isServerError) {
        throw Exception("Server Connection Error");
      } else if (response.status.isUnauthorized) {
        throw Exception("Unauthorized Error");
      } else {
        throw Exception("Something Went Wrong");
      }
    } on SocketException catch (_) {
      throw Exception("No Internet Connection");
    } on FormatException {
      throw Exception("Bad Response Format!");
    } catch (e) {
      rethrow;
      // throw Exception("Something Went Wrong");
    }
  }
}
