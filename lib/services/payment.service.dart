import 'dart:convert';

import 'package:http/http.dart' as http;

class PaymentService {
  String backend = 'https://fast-caverns-83701.herokuapp.com';
  String apiKey = '';
  Future<String> _getApiKey({bool force = false}) async {
    try {
      if (apiKey == '' || force == true) {
        var uri = Uri.parse('$backend/token');
        var resp = await http.post(uri);
        apiKey = resp.body;
      }
      return apiKey;
    } catch (err) {
      return '';
    }
  }

  Future<bool> buyAirtime(
      String skuCode, String phone, int amount, bool sevenDays) async {
    try {
      await _getApiKey(force: true);
      var uri = Uri.parse('$backend/payment');
      print("uri");
      var response = await http.post(uri, headers: {
        "Authorization": "Bearer $apiKey"
      }, body: {
        "phone": phone,
        "skuCode": skuCode,
        "amount": "$amount",
        "duration": sevenDays ? "7" : "14"
      });
      print(response);
      if (response.statusCode == 401) {
        await _getApiKey(force: true);
        response = await http.post(
          uri,
          headers: {"Authorization": "Bearer $apiKey"},
          body: {"phone": phone, "skuCode": skuCode, "amount": amount},
        );
        print(response);
      }
      return response.statusCode == 200 ? true : false;
    } catch (err) {
      print(err);
      return false;
    }
  }

  Future<http.Response> getAllValues(number, {bool data = false}) async {
    try {
      apiKey = await _getApiKey(force: true);
      var uri = Uri.parse('$backend/values');
      var response = await http.post(uri,
          headers: {"Authorization": "Bearer $apiKey"},
          body: {"phone": number, "benefit": data ? "Data" : "Minutes"});
      if (response.statusCode == 401) {
        await _getApiKey(force: true);
        response = await http.post(
          uri,
          headers: {"Authorization": "Bearer $apiKey"},
          body: {"phone": number, "benefit": data ? "Data" : "Minutes"},
        );
      }
      return response;
    } catch (err) {
      print(err);
      return http.Response('failed', 400);
    }
  }

  Future<http.Response> getNetworkValues(network, {bool data = false}) async {
    try {
      await _getApiKey(force: true);
      var uri = Uri.parse('$backend/values?network=true');
      var response = await http.post(uri,
          headers: {"Authorization": "Bearer $apiKey"},
          body: {"network": network, "benefit": data ? "Data" : "Minutes"});
      print(response.body);
      if (response.statusCode == 401) {
        await _getApiKey(force: true);
        response = await http.post(
          uri,
          headers: {"Authorization": "Bearer $apiKey"},
          body: {"network": network, "benefit": data ? "Data" : "Minutes"},
        );
      }
      return response;
    } catch (err) {
      print(err);
      return http.Response('failed', 400);
    }
  }

  Future<http.Response> getCountries({bool dataOnly = false}) async {
    try {
      await _getApiKey(force: true);
      var uri = Uri.parse(
          '$backend/countries?${dataOnly == true ? "data=true" : ""}');
      var response = await http.get(
        uri,
        headers: {"Authorization": "Bearer $apiKey"},
      );
      print(json.decode(response.body)["ResultCode"]);
      if (json.decode(response.body)["ResultCode"].toString() == "4") {
        await _getApiKey(force: true);
        response = await http.get(
          uri,
          headers: {"Authorization": "Bearer $apiKey"},
        );
      }
      return response;
    } catch (err) {
      print(err);
      return http.Response('failed', 400);
    }
  }

  Future<http.Response> getNetworks(String country) async {
    try {
      await _getApiKey(force: true);
      var uri = Uri.parse('$backend/networks?country=$country');
      var response = await http.get(
        uri,
        headers: {"Authorization": "Bearer $apiKey"},
      );
      print(json.decode(response.body)["ResultCode"]);
      if (json.decode(response.body)["ErrorCodes"].toList() != []) {
        await _getApiKey(force: true);
        response = await http.get(
          uri,
          headers: {"Authorization": "Bearer $apiKey"},
        );
        return response;
      }
      return response;
    } catch (err) {
      print(err);
      return http.Response('failed', 400);
    }
  }

  Future<bool> addCard(
      String cardNum, String expiry, String cvv, String cardHolder) async {
    try {
      var uri = Uri.parse('$backend/addCard');
      var response = await http.post(uri, body: {
        "email": "visiondaniels32@gmail.com",
        "number": cardNum,
        "cvv": cvv,
        "expiry": expiry,
        "holder": cardHolder
      });
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (err) {
      return false;
    }
  }
}
