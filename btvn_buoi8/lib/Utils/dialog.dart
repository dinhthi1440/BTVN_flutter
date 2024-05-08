import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../data/provider.dart';
import '../data/services.dart';
import '../model/customer.dart';
import '../ui/writePartner.dart';

Future<void> showDialogSuccess(BuildContext context, bool isEdit) async{
  return showDialog(context: context, builder: (context) {
    return CupertinoAlertDialog(
      title: Text(isEdit?"Sửa thành công":"Thêm thành công"),
      content: Lottie.network(
        'https://lottie.host/e4bcfd5d-68a8-4392-86b9-42e2fbdd718a/VMqye8K0GC.json',
        height: 100,
        width: 100,
        repeat: false,),
      actions: [
        CupertinoDialogAction(child: const Text("Trở về", style: TextStyle(
            color: Colors.black
        ),), onPressed: () {

          Navigator.pop(context);
          Navigator.pop(context);
        },),
        CupertinoDialogAction(child: const Text("Tiếp tục ", style: TextStyle(
            color: Colors.red
        )), onPressed: () {
          Navigator.pop(context);
        },),
      ],
    );
  },);
}

Future<void> showDialogFail(BuildContext context) async{
  return showDialog(context: context, builder: (context) {
    return CupertinoAlertDialog(
      title: const Text("Thất bại! Hãy thử lại"),
      content: Lottie.network(
        'https://lottie.host/9417b4dc-b217-483d-9137-642e248c99da/QRNqgxHJW7.json',
        height: 100,
        width: 100,
        repeat: false,),
      actions: [
        CupertinoDialogAction(child: const Text("Tiếp tục", style: TextStyle(
            color: Colors.red
        )), onPressed: () {
          Navigator.pop(context);
        },),
      ],
    );
  },);
}
Future<void> showConfirmDialog(BuildContext context, Customer customer) async{
  return showDialog(context: context, builder: (context) {
    return CupertinoAlertDialog(
      title: const Text("Chọn thao tác"),
      actions: [
        CupertinoDialogAction(child: const Text("Sửa", style: TextStyle(
            color: Colors.black
        ),), onPressed: () {
          Navigator.of(context).pop();
          Navigator.push(context, MaterialPageRoute(builder:
              (context) => WritePartner(isEdit: true, customer: customer,),));
        },),
        CupertinoDialogAction(child: const Text("Xóa ", style: TextStyle(
            color: Colors.red
        )), onPressed: () async {
          int deleteResult = await ApiServices.deleteCustomer(customer.id!);
          if(deleteResult == 200){
            context.read<CusProvider>().getData();
            Navigator.of(context).pop();
          }
        },),
      ],
    );
  },);
}