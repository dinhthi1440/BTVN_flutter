
import 'dart:convert';

import 'package:btvn_buoi8/model/district.dart';
import 'package:btvn_buoi8/model/province.dart';
import '../model/customer.dart';
import 'package:http/http.dart' as http;


class ApiServices{
  static const String _baseUrl = 'https://6633ca12f7d50bbd9b4aaaaa.mockapi.io/flutterHIT';
  static const String _baseAddressUrl = 'https://vapi.vnappmob.com';
  static Future<List<Customer>> getCustomers() async {
    late List<Customer> listCus;
    var response = await http.get(Uri.parse('$_baseUrl/customer'));
    String decodeResponse = utf8.decode(response.body.codeUnits);
    if(response.statusCode == 200){
      var body = jsonDecode(decodeResponse) as List<dynamic>;
      listCus = List.generate(body.length, (index) => Customer.fromJson(body[index]));
    }else{

    }
    return listCus;
  }

  static Future<List<Province>> getProvince() async {
    late List<Province> provinceList;
    var response = await http.get(Uri.parse('$_baseAddressUrl/api/province'));

    if(response.statusCode == 200){
      String decodeResponse = utf8.decode(response.body.codeUnits);
      Map<String, dynamic> jsonData = jsonDecode(decodeResponse);
      List<dynamic> results = jsonData['results'];
      provinceList = results.map((json) => Province.fromJson(json)).toList();
    }else{
      provinceList = [];
    }
    return provinceList;
  }

  static Future<List<District>> getDistrict(String provinceID) async {
    late List<District> districtList;
    var response = await http.get(Uri.parse('$_baseAddressUrl/api/province/district/$provinceID'));
    if(response.statusCode == 200){
      String decodeResponse = utf8.decode(response.body.codeUnits);
      Map<String, dynamic> jsonData = jsonDecode(decodeResponse);
      List<dynamic> results = jsonData['results'];
      districtList = results.map((json) => District.fromJson(json)).toList();
    }else{
      districtList = List.empty();
    }
    return districtList;
  }

  static Future<int> addCustomer(Customer customer) async{
    var response = await http.post(Uri.parse('$_baseUrl/customer'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(customer.toJson()));
    return response.statusCode;
  }

  static Future<int> deleteCustomer(String customerID) async{
    var response = await http.delete(Uri.parse('$_baseUrl/customer/$customerID'));
    return response.statusCode;
  }

  static Future<int> updateCustomer(Customer customer) async{
    var response = await http.put(Uri.parse('$_baseUrl/customer/${customer.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(customer.toJson()));
    if(response.statusCode ==200){
      return 200;
    }else{
      return response.statusCode;
    }

  }
}