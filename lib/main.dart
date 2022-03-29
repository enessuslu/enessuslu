import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testflutter/model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testflutter/stokmodel.dart';
import 'package:json_table/json_table.dart';

void main() {

  runApp(MaterialApp(
    //runApp method
    home: HomePage(),
  )); //MaterialApp
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
List<String> stoknames1=[];
final List<String> satisaHazir1=[];
final List<String> satHzrAdet1=[];
final List<String> bekleyenSiparis1=[];
final List<String> bekSipAdet1=[];
final List<String> bakiye1=[];
final List<String> adBakiye1=[];
final List<String> fabStokMik1=[];
final List<String> fabStokAd1=[];
final List<String> beklIeMiktar1=[];
final List<String> beklIeAd1=[];
String query="http://172.28.64.1:1433/api/stok";
ScrollController myList=new ScrollController();

class _HomePageState extends State<HomePage> {
  bool isChecked = false;
  void initState() {
    super.initState();
    stoknames1.clear();
    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => MyListView());
  }
  ValueChanged<bool?>? onChanged;
  final url = Uri.parse("http://172.28.64.1:1433/api/user");

  List<String> usernames = [];
  List<String> passwords = [];

  TextEditingController userNameController = new TextEditingController();
  TextEditingController userPasswordController = new TextEditingController();

  Future callUsers() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var result = usersFromJson(response.body);
        for (var i = 0; i < result.length; i++) {
          usernames.add(result[i].userName.toString());
          passwords.add(result[i].userPassword.toString());
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future remember() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('username', userNameController.text.toString());
    prefs.setString('password', userPasswordController.text.toString());
  }

  Future enter() async {
    final prefs = await SharedPreferences.getInstance();
    final String? username = prefs.getString('username');
    final String? userPassword = prefs.getString('password');
    userNameController.text = username!;
    userPasswordController.text = userPassword!;
  }

  @override
  Widget build(BuildContext context) {
    enter();
    callUsers();

    return MaterialApp(
        theme: ThemeData(fontFamily: 'Roboto'),
        home: Scaffold(
          body: SafeArea(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              constraints: BoxConstraints.expand(),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage("assets/arka_logo.jpeg"),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 50.0),
                      child: const Image(
                        width: 300,
                        image: AssetImage("assets/efece_logo.png"),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10, top: 120),
                          width: 60,
                          child: const Image(
                            image: ExactAssetImage('assets/user.png'),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 10,
                            top: 120,
                          ),
                          width: 300,
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: userNameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              hintText: 'Kullanıcı Adı',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: 10,
                            top: 60,
                          ),
                          width: 60,
                          child: const Image(
                            image: ExactAssetImage('assets/password.png'),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 10,
                            top: 60,
                          ),
                          width: 300,
                          child: TextField(
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              UpperCaseTextFormatter(),
                            ],
                            obscureText: true,
                            controller: userPasswordController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              hintText: 'Şifre',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          // customize the height property
                          height: 50,
                          // customize the width property
                          width: 130,
                          margin: EdgeInsets.only(left: 150, top: 35),
                          decoration: BoxDecoration(
                            // spice up the button with a radius
                            borderRadius: BorderRadius.all(
                              Radius.circular(14),
                            ),
                            border:
                                Border.all(width: 1, color: Color(0xFF878787)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 4),
                                  blurRadius: 5.0)
                            ],
                            gradient: LinearGradient(
                              // gradient starts from left
                              begin: Alignment.centerLeft,
                              // gradient ends at right
                              end: Alignment.centerRight,
                              // set all your colors
                              colors: [
                                Color(0xFFE8E8E8),
                                Color(0xFF2752A8),
                                Color(0xFF000000),
                              ],
                            ),
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              minimumSize:
                                  MaterialStateProperty.all(Size(130, 50)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              elevation: MaterialStateProperty.all(0),
                              // elevation: MaterialStateProperty.all(3),
                              shadowColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            onPressed: () {

                              if ( usernames.contains(userNameController.text.toString()) &&
                                  passwords.contains(userPasswordController.text.toString())) {
                                if (isChecked == true) {
                                  remember();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => StokPage()));
                                } else if(isChecked ==false || isChecked == null){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => StokPage()));
                                }
                              }
                              else{
                                Fluttertoast.showToast(
                                    msg: "Kullanıcı adı veya şifre hatalı",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              }
                            },
                            child: Center(
                              child: Text(
                                'GİRİŞ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 140, top: 30),
                      child: Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (bool? newValue) {
                              setState(() {
                                isChecked = newValue!;
                              });
                            },
                          ),
                          Text(
                            'Beni Unutma',
                            style: TextStyle(color: Color(0xff273CB1)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20, left: 35),
                      child: Text(
                        'ŞİFRENİ Mİ UNUTTUN?',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff273CB1),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class MyListView extends StatefulWidget{
  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {


  final List<String> stoknames=[];

  final List<String> satisaHazir=[];

  final List<String> satHzrAdet=[];

  final List<String> bekleyenSiparis=[];

  final List<String> bekSipAdet=[];

  final List<String> bakiye=[];

  final List<String> adBakiye=[];

  final List<String> fabStokMik=[];

  final List<String> fabStokAd=[];

  final List<String> beklIeMiktar=[];

  final List<String> beklIeAd=[];

  Future callStokes() async {
    Uri stokurl=Uri.parse(query);
    try {
      var response = await http.get(stokurl);
      if (response.statusCode == 200) {
        var result = stokFromJson(response.body);
        for (var i = 0; i < result.length; i++) {

          stoknames.add(result[i].stokAdi.toString());
          satisaHazir.add(result[i].satisaHazir.toString());
          satHzrAdet.add(result[i].satHzrAdet.toString());
          bekleyenSiparis.add(result[i].bekleyenSiparis.toString());
          bekSipAdet.add(result[i].bekSipAdet.toString());
          bakiye.add(result[i].bakiye.toString());
          adBakiye.add(result[i].adBakiye.toString());
          fabStokMik.add(result[i].fabStokMik.toString());
          fabStokAd.add(result[i].fabStokAd.toString());
          beklIeMiktar.add(result[i].beklIeMiktar.toString());
          beklIeAd.add(result[i].beklIeAd.toString());

        }

        stoknames1.addAll(stoknames);
        satisaHazir1.addAll(satisaHazir);
        satHzrAdet1.addAll(satHzrAdet);
        bekleyenSiparis1.addAll(bekleyenSiparis);
        bekSipAdet1.addAll(bekSipAdet);
        bakiye1.addAll(bakiye);
        adBakiye1.addAll(adBakiye);
        fabStokMik1.addAll(fabStokMik);
        fabStokAd1.addAll(fabStokAd);
        beklIeMiktar1.addAll(beklIeMiktar);
        beklIeAd1.addAll(beklIeAd);
      }
    } catch (e) {
      print(e.toString());
    }

  }
  @override
  Widget build(BuildContext context){
      callStokes();
      return ListView.builder(
        controller: myList,
        primary: false,
          itemCount: stoknames1.length,
          itemBuilder: (BuildContext context,int index){
            return ExpansionTile(
              title:Text(stoknames1[index].toString()),
              children: [
                Container(

                    child:Align(
                        alignment: Alignment.topLeft,
                        child:Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            Container(
                              margin: EdgeInsets.only(left: 15, top: 5),
                              child: Row(
                                children: [
                                  Text("Satışa hazır M1: "+satisaHazir1[index].toString()),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 15, top: 10),
                              child: Row(
                                children: [
                                  Text("Satışa hazır M2: "+satHzrAdet1[index].toString()),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 15, top: 10),
                              child: Row(
                                children: [
                                  Text("Bekleyen Sipariş M1: "+bekleyenSiparis1[index].toString()),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 15, top: 10),
                              child: Row(
                                children: [
                                  Text("Bekleyen Sipariş M2: "+bekSipAdet1[index].toString()),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 15, top: 10),
                              child: Row(
                                children: [
                                  Text("Bakiye M1: "+bakiye1[index].toString()),
                                ],
                              ),
                            ),
                            Container(margin: EdgeInsets.only(left: 15, top: 10),
                              child: Row(
                                children: [
                                  Text("Bakiye M2: "+bekSipAdet1[index].toString()),
                                ],
                              ),
                            ),
                            Container(margin: EdgeInsets.only(left: 15, top: 10),
                              child: Row(
                                children: [
                                  Text("Fabrika Stok M1: "+fabStokMik1[index].toString()),
                                ],
                              ),
                            ),
                            Container(margin: EdgeInsets.only(left: 15, top: 10),
                              child: Row(
                                children: [
                                  Text("Fabrika Stok M2: "+fabStokAd1[index].toString()),
                                ],
                              ),
                            ),
                            Container(margin: EdgeInsets.only(left: 15, top: 10),
                              child: Row(
                                children: [
                                  Text("Bekleyen iş emri M1: "+beklIeMiktar1[index].toString()),
                                ],
                              ),
                            ),
                            Container(margin: EdgeInsets.only(left: 15, top: 10,bottom: 10),
                              child: Row(
                                children: [
                                  Text("Bekleyen iş emri M2: "+beklIeAd1[index].toString()),
                                ],
                              ),
                            ),
                          ],
                        )
                    )

                )
              ],
            );  }
      );

  }

}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}


class StokPage extends StatefulWidget {
  @override
  State<StokPage> createState() => _StokPageState();

}

class _StokPageState extends State<StokPage> {

  Widget build(BuildContext context) {

return MaterialApp(

    theme: ThemeData(fontFamily: 'Roboto'),
    home: Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          constraints: BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage("assets/arka_logo.jpeg"),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 300,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 10, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () {
                                setState(() {
                                  query="http://172.28.64.1:1433/api/stok/0050";


                                });



                              },
                              child: Center(
                                child: Text(
                                  'GALVANIZLI BORULAR',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 20, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'GALVANIZLI PROFILLER',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 10, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'OLUKLAR',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 20, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'SERA MALZEMELERI (KG)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 10, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'SERA MALZEMELERI (MT)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 20, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'TRAPEZ SACLAR (RAL 3009)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 10, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'TRAPEZ SACLAR (RAL 9002)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 20, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'GALVANIZLI TRAPEZ SACLAR',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 10, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'TRAPEZ MAHYALAR (RAL 3009)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 20, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'TRAPEZ MAHYALAR (RAL 9002)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 10, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'GALVANIZLI TRAPEZ MAHYALARI',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 20, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'ÇATI PANELLERI (R3004)(DELTA )',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 10, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'ÇATI PANELLERI (R9002)(DELTA )',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 20, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'ÇATI PANELLERI (R7016)(DELTA )',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 10, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'CEPHE PANELLERI (R9002)(DELTA)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 20, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'BOYALI BORULAR (YÜCEL)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 10, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'BOYALI PROFILLER (YÜCEL)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 20, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'SIYAH BORULAR (YÜCEL)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 10, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'SIYAH PROFILLER (YÜCEL)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 20, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'GALVANIZLI MANSONLU BORULAR',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 10, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'GALVANIZLI SIC. DALD. PROFILL.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 20, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'GALVANIZLI DESTEK SACLARI',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 10, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'GALVANIZLI DÜZ SACLAR',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 20, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'DÜZ SACLAR (RAL 3009)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 10, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'DKP DÜZ SACLAR',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 20, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'SIYAH BAKLAVALI SACLAR',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 10, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'SIYAH HADDELER',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 20, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'GALVANIZLI HADDELER',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 10, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'GZRD SACLAR',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 20, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'GZRD SACLAR (RAL 3009)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 10, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'GZRD SACLAR (RAL 7016)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 20, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'GZRD SACLAR (RAL 9002)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 10, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'KARBOLINE',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 20, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'IZLI PROFILLER',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 10, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'KAYNAK MAKINELERI',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 20, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'GAZALTI KAYNAK TELLERI',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 10, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'PANEL ARASI ISIKLIKLAR',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 20, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'PANEL ARASI ISIKLIK AKSESUARLARI',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 10, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'POLIKARBONAT LEVHALAR',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 20, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'POLIKARBONAT AKSESUARLARI',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 10, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'POLIKARBONAT TRAPEZLER',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 20, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'SEMERLER',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 10, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'VIDALAR',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 20, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'OSBLER',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 10, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'Alçıpanlar',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 20, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'BETONALTI TRAPEZLER',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 10, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'BETOPANLAR',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 20, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'BOARDEXLER',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 10, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'GALVANIZLI RULO SACLAR',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 20, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'RULO SACLAR (RAL 3009)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            // customize the height property
                            height: 42,
                            // customize the width property
                            width: 180,
                            margin: EdgeInsets.only(left: 10, top: 15),
                            decoration: BoxDecoration(
                              // spice up the button with a radius
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              border: Border.all(
                                  width: 1, color: Color(0xFF878787)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                // gradient starts from left
                                begin: Alignment.centerLeft,
                                // gradient ends at right
                                end: Alignment.centerRight,
                                // set all your colors
                                colors: [
                                  Color(0xFFE8E8E8),
                                  Color(0xFF2752A8),
                                  Color(0xFF000000),
                                ],
                              ),
                            ),

                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(130, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StokPage())),
                              child: Center(
                                child: Text(
                                  'RULO SACLAR (RAL 9002)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 40,
                margin: EdgeInsets.only(left: 40, right: 40, top: 20),
                child: TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    icon: new Icon(Icons.search),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    hintText: 'Ürünler içinde arama yap',
                  ),
                ),
              ),
              Container(
                height: 50,
                margin: EdgeInsets.only(left: 30, top: 10),
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Son güncelleme tarihi',
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Container(

                  height: 300,
                  margin: EdgeInsets.only(left: 0, top: 0),
                  padding: EdgeInsets.only(top: 10),
                  child: MyListView(),
                ),
              ),

            ],
          ),
        ),
      ),
    ));

  }
}













