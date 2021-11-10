import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/SmartPos/user.dart';

const NESTED_JSON =
    '[{"menuName": "CUSTOMERS","image": "assets/customers.png"}, "menuName": "SUPPLIERS",       "image": "assets/suppliers.png" }, {    "menuName": "PRODUCTS",  "image": "assets/products.png" }, {   "menuName": "POS",  "image": "assets/pos.png" },{ "menuName": "EXPENSE", "image": "assets/expense1.png" }, {      "menuName": "ALL ORDERS",    "image": "assets/AllOrders.png"},  { "menuName": "REPORT",  "image": "assets/report1.png" },   {       "menuName": "SETTINGS",      "image": "assets/settings.png"  }]';

class SmartPos extends StatelessWidget {
  Future<List<Smart>> getDataFromFakeServer() async {
    List<dynamic> data = jsonDecode(NESTED_JSON);
    List<Smart> Smarts = data.map((data) => Smart.fromJson(data)).toList();
    return Smarts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          elevation: 0,
          automaticallyImplyLeading: false,
          toolbarHeight: 350,
          flexibleSpace: Container(
            padding: EdgeInsets.only(top: 20, right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(200),
                  bottomRight: Radius.circular(200),
                ),
                gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.topLeft,
                    stops: [0.9, 1],
                    colors: [Colors.blue[300], Colors.yellow[200]])),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Smart POS',
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                      Icon(Icons.translate),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 500),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 50),
                        child: Image.asset(
                          'assets/PrintingCalculator.png',
                          width: 150,
                          height: 150,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text(
                        'HELLO! WELCOME',
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        body: FutureBuilder<List<Smart>>(
            future: getDataFromFakeServer(),
            builder: (context, data) {
              if (
                data.connectionState != ConnectionState.waiting &&
      
                  data.hasData) {
                var SmartList = data.data;
                return ListView.builder(
                    padding: EdgeInsets.only(top: 200),
                    itemCount: SmartList.length,
                    itemBuilder: (context, index) {
                      var SmartData = SmartList[index];
                      return GridView.builder(
                          primary: false,
                          padding: const EdgeInsets.all(10),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 0,
                                  mainAxisSpacing: 10,
                                  crossAxisCount: 4),
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 0,
                              child: ListTile(
                                onTap: () {},
                                title: Column(
                                  children: [
                                    Image.asset(
                                      SmartData.image,
                                      height: 300,
                                      width: 300,
                                      fit: BoxFit.contain,
                                    ),
                                    Text(
                                      SmartData.menuName,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 40),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }

  void setState(Null Function() param0) {}
}


//MenuItem:
/*

class MenuItem extends StatelessWidget {
  String image;
  String menuName;

  MenuItem(this.image, this.menuName);

  List<MenuItem> contacts = [];

  _initOnWidgetBuilding() {
    contacts = [MenuItem('assets/pos.png', 'POS')];
  }

  @override
  Widget build(BuildContext context) {
    _initOnWidgetBuilding();
    return Container(
      padding: const EdgeInsets.all(8),
      margin: EdgeInsets.only(top: 50, bottom: 50, left: 50, right: 50),
      child: Column(
        children: [
          Image.asset(
            image,
            height: 250,
            width: 200,
            fit: BoxFit.cover,
          ),
          Text(
            menuName,
            style: TextStyle(fontSize: 30, color: Colors.grey),
          ),
        ],
      ),
      color: Colors.grey[100],
    );
  }
}
*/





//GridView:
/*  GridView.builder(
                    primary: false,
                    padding: const EdgeInsets.all(10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 10,
                        crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 0,
                        child: ListTile(
                          onTap: () {},
                          title: Column(
                            children: [
                              Image.asset(
    model[index].image,
                                height: 300,
                                width: 300,
                                fit: BoxFit.contain,
                              ),
                              Text(
                                model[index].menuName,
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 40),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
        ),*/






//ListView:
/*
  List<ProductDataModel> model = [
    ProductDataModel(menuName: 'COSTOMERS', image: 'assets/costomers.png'),
    ProductDataModel(menuName: 'SUPPLIERS', image: 'assets/suppliers.png'),
    ProductDataModel(menuName: 'PRODUCTS', image: 'assets/products.png'),
    ProductDataModel(menuName: 'POS', image: 'assets/pos.png'),
    ProductDataModel(menuName: 'EXPENSE', image: 'assets/expense1.png'),
    ProductDataModel(menuName: 'ALL ORDERS', image: 'assets/AllOrders.png'),
    ProductDataModel(menuName: 'REPORT', image: 'assets/report1.png'),
    ProductDataModel(menuName: 'SETTINGS', image: 'assets/settings.png'),
  ];*/