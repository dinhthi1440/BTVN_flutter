import 'package:btvn_buoi8/model/customer.dart';
import 'package:btvn_buoi8/data/provider.dart';
import 'package:btvn_buoi8/data/services.dart';
import 'package:btvn_buoi8/ui/writePartner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Utils/dialog.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CusProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    ),
  );
}


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TabBar get _tabBar => const TabBar(
    labelColor: Colors.teal,
    unselectedLabelColor: Colors.black,
    tabs: [
      Tab(child: Text("Khách hàng")),
      Tab(child: Text("Nhà cung cấp"),),
    ],
    indicatorColor: Colors.teal,
    indicatorSize: TabBarIndicatorSize.tab,
  );
  @override
  void initState() {
    super.initState();
    context.read<CusProvider>().getData();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Learn API", style: TextStyle(
                color: Colors.white
            ),),
            backgroundColor: Colors.teal,
            bottom: PreferredSize(
              preferredSize: _tabBar.preferredSize,
              child: Material(
                color: Colors.white, //<-- SEE HERE
                child: _tabBar,
              ),
            ),
          ),
          body: const TabBarView(
            children: [
              Client(),
              Client()
            ],
          ),
        ),

      ),
    );
  }
}


class Client extends StatefulWidget {
  const Client({super.key});

  @override
  State<Client> createState() => _ClientState();
}

class _ClientState extends State<Client> {
  @override
  Widget build(BuildContext context) {
    return context.watch<CusProvider>().isLoading? const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator()
        ],
    ):
    Container(
      color: Colors.grey.shade300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView.builder( itemCount: context.watch<CusProvider>().customers.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return _clientItem(context, context.watch<CusProvider>().customers[index]);
              },),
          ),
          Container(
            color: Colors.white,
            height: 60,
            child: InkWell(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                color: Colors.teal,
                alignment: Alignment.center,
                child: const Text("Thêm đối tác",style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                ) , textAlign: TextAlign.center,),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:
                    (context) => WritePartner(isEdit: false, customer: Customer(),),));
              },
            ),
          )
        ],
      ),
    );
  }
}

Widget _clientItem(BuildContext context, Customer customer) {
  return Container(
    color: Colors.grey.shade300,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          child: Container(
            margin: const EdgeInsets.all(24),
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.person),
                    const SizedBox(width: 16),
                    Expanded(child: Text(customer.name!)),
                  ],
                ),
                if (customer.phoneNumber != null && customer.phoneNumber != "" )
                  Column(children: [
                    const Divider(),
                    Row(
                      children: [
                        const Icon(Icons.phone),
                        const SizedBox(width: 16),
                        Expanded(child: Text(customer.phoneNumber!)),
                      ],
                    ),
                  ],),
                if (customer.province!=null && customer.province !="")
                  Column(children: [
                    const Divider(),
                    Row(
                      children: [
                        const Icon(Icons.home),
                        const SizedBox(width: 16),
                        Expanded(child: Text(customer.province!)),
                      ],
                    ),
                  ],)

              ],
            ),
          ),
          onTap: () {
            showConfirmDialog(context, customer);
          },
        ),
      ],
    ),
  );
}