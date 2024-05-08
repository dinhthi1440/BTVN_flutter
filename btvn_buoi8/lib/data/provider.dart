import 'package:btvn_buoi8/model/district.dart';
import 'package:btvn_buoi8/model/province.dart';
import 'package:btvn_buoi8/data/services.dart';
import 'package:flutter/cupertino.dart';

import '../model/customer.dart';

class CusProvider extends ChangeNotifier{
  late List<Customer> customers;
  late List<Province> provinces;
  late List<District> districts = [];
  bool isLoading = false;
  bool isLoadingDistrict = false;

  Future<void> getData() async {
    isLoading = true;
    customers = await ApiServices.getCustomers();
    isLoading = false;
    notifyListeners();
  }

  Future<void> getDataEdit(String provinceName) async {
    isLoading = true;
    provinces = await ApiServices.getProvince();
    String? provinceID = provinces.firstWhere((province) => province.name == provinceName).id;
    districts = await ApiServices.getDistrict(provinceID);
    isLoading = false;
    notifyListeners();
  }
  Future<void> getDataProvince() async {
    isLoading = true;
    provinces = await ApiServices.getProvince();
    isLoading = false;
    notifyListeners();
  }

  Future<void> getDataDistrict(String provinceName) async {
    isLoadingDistrict = true;
    String? provinceID = provinces.firstWhere((province) => province.name == provinceName).id;
    districts = await ApiServices.getDistrict(provinceID);
    isLoadingDistrict = false;
    notifyListeners();
  }

}