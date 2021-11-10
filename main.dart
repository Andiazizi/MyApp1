import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/SmartPos/SmartPos.dart';




import 'modals/user.dart';


const NESTED_JSON =
    '[{"name":"MyEat","phone":"Your Numberphone","password":"Your Password","comment" : "Mange your business easier!","account": "Dont have an account?", "forgot": "Forgot the password?"}]';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Future<List<MyEat>> getDataFromFakeServer() async {
    List<dynamic> data = jsonDecode(NESTED_JSON);
    List<MyEat> MyEats = data.map((data) => MyEat.fromJson(data)).toList();
    return MyEats;
  }

  bool _showpassword = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<List<MyEat>>(
            future: getDataFromFakeServer(),
            builder: (context, data) {
              if (data.connectionState != ConnectionState.waiting &&
                  data.hasData) {
                var MyEatList = data.data;
                return ListView.builder(
                    padding: EdgeInsets.only(top: 200),
                    itemCount: MyEatList.length,
                    itemBuilder: (context, index) {
                      var MyEatData = MyEatList[index];
                      return Column(children: <Widget>[
                        Text(
                          MyEatData.name ?? "",
                          style: TextStyle(
                              fontSize: 60,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 30),
                          child: Text(
                            '${MyEatData.comment}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 15),
                              margin: EdgeInsets.only(left: 500, right: 500),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                              ),
                              child: TextField(

                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(Icons.phone_android_sharp),
                                  labelText: '${MyEatData.phone}',
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 15,right: 15),
                              margin: EdgeInsets.only(left: 500, right: 500),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey,width: 1),

                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
                              ),
                              child: TextField(
                                obscureText: _showpassword,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(Icons.lock),
                                  suffixIcon: GestureDetector(onTap: (){
                                  setState(() {
                                    _showpassword = !_showpassword;
                                  });
                                  },
                                  child: Icon(_showpassword ?Icons.remove_red_eye : Icons.remove_red_eye),
                                  ),
                                  labelText: '${MyEatData.password}',
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                          ),
                          padding: EdgeInsets.only(top: 20),
                          height: 60,
                          width: 340,
                          child: new RaisedButton(
                            child: new Text(
                              "LOGIN",
                              style: new TextStyle(color: Colors.white),
                            ),
                            color: Colors.red,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SmartPos()));
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 740),
                          child: Row(
                            children: [
                              Text('${MyEatData.account}'),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => null));
                                  },
                                  child:
                                  Text('REGISTER HERE',style: TextStyle(color: Colors.red),)),

                            ],
                          ),
                        ),
                        Text('${MyEatData.forgot}')
                      ]);
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
