
import 'dart:async';

import 'package:btvn_buoi8/data/provider.dart';
import 'package:btvn_buoi8/data/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../Utils/dialog.dart';
import '../model/customer.dart';



class WritePartner extends StatefulWidget {
  const WritePartner({super.key, required this.isEdit, required this.customer});
  final bool isEdit;
  final Customer customer;
  @override
  State<WritePartner> createState() => _writePartnerState();
}

class _writePartnerState extends State<WritePartner> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _typeCusController = TextEditingController();
  String? _provinceSelected;
  String? _districtSelected;
  late int _age;
  Timer? timer;
  final List<DropdownMenuItem<String>> _partnerType = [
    const DropdownMenuItem(
      value: "Khách hàng",
      child: Text("Khách hàng"),
    ),
    const DropdownMenuItem(
      value: "Nhân viên",
      child: Text("Nhân viên"),
    ),
  ];
  late List<DropdownMenuItem<String>> _provinceList;
  List<DropdownMenuItem<String>> _districtList = [];
  bool isChange = false;
  bool isAdd = false;
  bool isSuccess = false;

  @override
  void initState() {
    super.initState();

    if (widget.isEdit) {
      context.read<CusProvider>().getDataEdit(widget.customer.province!);
      _nameController.text = widget.customer.name!;
      if (widget.customer.phoneNumber != null) {
        _phoneNumberController.text = widget.customer.phoneNumber!;
      }
      _typeCusController.text =
      widget.customer.isCustomer! ? "Khách hàng" : "Nhân viên";
      if (widget.customer.province != null &&
          widget.customer.district != null) {
        _provinceSelected = widget.customer.province!;
        _districtSelected = widget.customer.district!;
      }
      _age = widget.customer.age!;
    } else {
      _age = 0;
      context.read<CusProvider>().getDataProvince();
      _districtList= List.empty();
      isAdd = true;
      isChange = true;
    }
  }

  void getAddress(BuildContext context) {
    context
        .watch<CusProvider>()
        .isLoading ? _provinceList = [] : _provinceList =
        context
            .watch<CusProvider>()
            .provinces
            .map((province) {
          return DropdownMenuItem(
              value: province.name,
              child: Text("${province.name}")
          );
        }).toList();
    context
        .watch<CusProvider>()
        .isLoadingDistrict ? _districtList = [] : _districtList =
        context
            .watch<CusProvider>()
            .districts
            .map((district) {
          return DropdownMenuItem(
              value: district.districtName,
              child: Text("${district.districtName}")
          );
        }).toList();
  }
    @override
    Widget build(BuildContext context) {
      getAddress(context);
      return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                  iconTheme: const IconThemeData(color: Colors.white),
                  backgroundColor: Colors.teal,
                  title: widget.isEdit ? const Text(
                    "Sửa đối tác", style: TextStyle(
                      color: Colors.white
                  ),)
                      : const Text("Thêm đối tác", style: TextStyle(
                      color: Colors.white
                  ),)
              ),
              body: SingleChildScrollView(
                child: Container(
                  color: Colors.grey.shade300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(16))
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    children: [
                                      Text("Tên đối tác "),
                                      Text('*', style: TextStyle(color: Colors.red),)
                                    ],
                                  ),
                                  TextFormField(
                                    controller: _nameController,
                                    decoration: const InputDecoration(
                                        hintText: "Ví dụ: Nguyễn Văn A"
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    children: [
                                      Text("Tuổi "),
                                      Text('*', style: TextStyle(color: Colors.red),)
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        child: Container(
                                          padding: const EdgeInsets.all(2),
                                          color: Colors.teal,
                                          child: const Icon(
                                            Icons.remove, color: Colors.white,),
                                        ),
                                        onTap: () {
                                          if (_age > 1) {
                                            setState(() {
                                              _age -= 1;
                                            });
                                          }
                                        },
                                        onLongPress: () {
                                          timer = Timer.periodic(
                                              Duration(milliseconds: 150), (
                                              timer) {
                                            if (_age > 1) {
                                              setState(() {
                                                _age -= 1;
                                              });
                                            }
                                          });
                                        },
                                        onLongPressEnd: (details) {
                                          timer?.cancel();
                                        },
                                      ),
                                      const SizedBox(width: 8,),
                                      Text('$_age',
                                        style: const TextStyle(fontSize: 16),),
                                      const SizedBox(width: 8,),
                                      GestureDetector(
                                        child: Container(
                                          padding: const EdgeInsets.all(2),
                                          color: Colors.teal,
                                          child: const Icon(
                                            Icons.add, color: Colors.white,),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            _age += 1;
                                          });
                                        },
                                        onLongPress: () {
                                          timer = Timer.periodic(
                                              Duration(milliseconds: 150), (
                                              timer) {
                                            setState(() {
                                              _age += 1;
                                            });
                                          });
                                        },
                                        onLongPressEnd: (details) {
                                          timer?.cancel();
                                        },
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Số điện thoại"),
                                  TextFormField(
                                    controller: _phoneNumberController,
                                    decoration: const InputDecoration(
                                        hintText: "Ví dụ: 0123456789"
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    children: [
                                      Text("Loại đối tác "),
                                      Text('*', style: TextStyle(color: Colors.red),)
                                    ],
                                  ),
                                  DropdownButtonFormField(
                                    value: widget.isEdit ? _typeCusController
                                        .text : null,
                                    items: _partnerType,
                                    onChanged: (value) {
                                      _typeCusController.text = value!;
                                    },
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Tỉnh/Thành phố"),
                                  DropdownButtonFormField(
                                    value: _provinceSelected,
                                    items: _provinceList,
                                    onChanged: (value) {
                                      setState(() {
                                        _provinceSelected = value;
                                        _districtSelected = null;
                                      });
                                      context.read<CusProvider>()
                                          .getDataDistrict(value!);
                                    },
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Quận/Huyện"),
                                  DropdownButtonFormField(
                                    value: _districtSelected,
                                    items: _districtList,
                                    onChanged: (value) {
                                      setState(() {
                                        _districtSelected = value;
                                      });
                                      isChange = true;
                                    },

                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: Container(
                color: Colors.white,
                height: 60,
                child: InkWell(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 8),
                    color: Colors.teal,
                    alignment: Alignment.center,
                    child: const Text("Xong", style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                    ), textAlign: TextAlign.center,),
                  ),
                  onTap: () {
                    Customer cus = Customer(id: '1',
                        name: _nameController.text,
                        province: _provinceSelected,
                        district: _districtSelected,
                        age: _age,
                        isCustomer: false,
                        phoneNumber: _phoneNumberController.text);
                    if(_nameController.text !='' && _age.toInt() !=0 && _typeCusController.text != ''){
                      if (widget.isEdit) {
                        cus.id = widget.customer.id;
                        if(_typeCusController.text=='Khách hàng'){
                          cus.isCustomer = true;
                        }
                        updateCus(context, cus);
                      } else {
                        if(_typeCusController.text=='Khách hàng'){
                          cus.isCustomer = true;
                        }
                        addCus(context, cus);
                      }
                    }
                  },
                ),
              )
          )
      );
    }
  Future<void> updateCus(BuildContext context, Customer cus) async{
    int status = await ApiServices.updateCustomer(cus);
    if(status == 200){
      context.read<CusProvider>().getData();
      showDialogSuccess(context, widget.isEdit);
    }
    else{
      showDialogFail(context);
    }
  }
  Future<void> addCus(BuildContext context, Customer cus) async{
    int status = await ApiServices.addCustomer(cus);
    if(status == 201){
      context.read<CusProvider>().getData();
      showDialogSuccess(context, widget.isEdit);
    }else{
      showDialogFail(context);
    }
  }


}



