import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';

class ApiService {
  final String _baseUrl = "https://api.sekhabo.com/";

  Future<http.Response?> get(String endUrl, Map<String, String> header) async {
    print(header);
    print(endUrl);
    try {
      final response = await http.get(Uri.parse(endUrl), headers: header);
      print(response.body);
      return _response(response);
    } on SocketException {
      throw Exception('No Internet connection');
    }
  }

  Future<http.Response?> post(
      String url, Map<String, String> header, var body) async {
    try {
      final response =
          await http.post(Uri.parse(url), headers: header, body: body);
      print(response.statusCode);
      print(response.body);
      print("......................");
      return _response(response);
    } on SocketException {
      throw Exception('connection problem');
    }
  }

  Future<dynamic> put(String endUrl, Map<String, String> header,
      Map<String, dynamic>? body) async {
    print('Api Put, url $endUrl');
    var responseJson;
    try {
      final response = await http.put(Uri.parse(_baseUrl + endUrl),
          headers: header, body: body);
      responseJson = _response(response);
    } on SocketException {
      print('No net');
      throw Exception('No Internet connection');
    }
    print('api put.');
    print(responseJson.toString());
    return responseJson;
  }

  Future<dynamic> delete(String endUrl) async {
    print('Api delete, url $endUrl');
    var apiResponse;
    try {
      final response = await http.delete(Uri.parse(_baseUrl + endUrl));
      print(response);
      apiResponse = _response(response);
    } on SocketException {
      print('No net');
      throw Exception('No Internet connection');
    }
    print('api delete.');
    return apiResponse;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 400:
        var jsonDecoded = json.decode(response.body);
        print(jsonDecoded['message']);
        throw Exception(jsonDecoded['message']);
      case 401:

      case 403:
        throw Exception("Credential dosen't match");

      case 422:
        throw Exception("Bad requist");
      case 504:
        throw Exception("Connection time out try again");
      case 500:
        throw Exception('InternalServer error');

      default:
        throw Exception(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
