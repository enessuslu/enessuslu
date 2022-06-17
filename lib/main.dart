import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testflutter/model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testflutter/stokmodel.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner:false,
    //runApp method
    home: HomePage(),
  )); //MaterialApp
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
final List<String> stoknames1=[];
final List<String> stoknames54=[];
final List<String> stoknames53=[];
final List<String> stoknames52=[];
final List<String> stoknames51=[];
final List<String> stoknames50=[];
final List<String> stoknames49=[];
final List<String> stoknames48=[];
final List<String> stoknames47=[];
final List<String> stoknames46=[];
final List<String> stoknames45=[];
final List<String> stoknames44=[];
final List<String> stoknames43=[];
final List<String> stoknames42=[];
final List<String> stoknames41=[];
final List<String> stoknames40=[];
final List<String> stoknames39=[];
final List<String> stoknames38=[];
final List<String> stoknames37=[];
final List<String> stoknames35=[];
final List<String> stoknames36=[];
final List<String> stoknames34=[];
final List<String> stoknames32=[];
final List<String> stoknames33=[];
final List<String> stoknames30=[];
final List<String> stoknames31=[];
final List<String> stoknames29=[];
final List<String> stoknames28=[];
final List<String> stoknames27=[];
final List<String> stoknames26=[];
final List<String> stoknames25=[];
final List<String> stoknames24=[];
final List<String> stoknames23=[];
final List<String> stoknames22=[];
final List<String> stoknames21=[];
final List<String> stoknames20=[];
final List<String> stoknames19=[];
final List<String> stoknames18=[];
final List<String> stoknames17=[];
final List<String> stoknames16=[];
final List<String> stoknames15=[];
final List<String> stoknames14=[];
final List<String> stoknames13=[];
final List<String> stoknames12=[];
final List<String> stoknames11=[];
final List<String> stoknames10=[];
final List<String> stoknames9=[];
final List<String> stoknames8=[];
final List<String> stoknames7=[];
final List<String> stoknames6=[];
final List<String> stoknames5=[];
final List<String> stoknames4=[];
final List<String> stoknames3=[];
final List<String> stoknames2=[];
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
String query="http://192.168.2.13:83/api/stok";
String galvaniz1="http://192.168.2.13:83/api/stok/0050";
String galvanizProfiller="http://192.168.2.13:83/api/stok/0055";
String oluklar="http://192.168.2.13:83/api/stok/0085";
String seraKg="http://192.168.2.13:83/api/stok/0103";
String seraMt="http://192.168.2.13:83/api/stok/0104";
String trapezSaclarRal3009="http://192.168.2.13:83/api/stok/0128";
String trapezSaclarRal9002="http://192.168.2.13:83/api/stok/0133";
String galvanizTrapezSaclar="http://192.168.2.13:83/api/stok/0061";
String trapezMahyalarRal3009="http://192.168.2.13:83/api/stok/0123";
String trapezMahyalarRal9002="http://192.168.2.13:83/api/stok/0127";
String galvanizTrapezMahyalar="http://192.168.2.13:83/api/stok/0060";
String catiPanelleriR3004Delta="http://192.168.2.13:83/api/stok/0023";
String catiPanelleriR9002Delta="http://192.168.2.13:83/api/stok/0028";
String catiPanelleriR7016Delta="http://192.168.2.13:83/api/stok/0142";
String cephePanelleriR9002Delta="http://192.168.2.13:83/api/stok/0016";
String boyaliBorularYucel="http://192.168.2.13:83/api/stok/0011";
String boyaliProfillerYucel="http://192.168.2.13:83/api/stok/0013";
String siyahBorularYucel="http://192.168.2.13:83/api/stok/0106";
String siyahProfillerYucel="http://192.168.2.13:83/api/stok/0109";
String galvanizMansonluBorular="http://192.168.2.13:83/api/stok/0054";
String galvanizSicDaldProfill="http://192.168.2.13:83/api/stok/0058";
String galvanizDestekSaclari="http://192.168.2.13:83/api/stok/0051";
String galvanizDuzSaclar="http://192.168.2.13:83/api/stok/0052";
String DuzSaclarRal3009="http://192.168.2.13:83/api/stok/0041";
String dkpDuzSaclar="http://192.168.2.13:83/api/stok/0038";
String siyahBaklavaliSaclar="http://192.168.2.13:83/api/stok/0105";
String siyahHaddeler="http://192.168.2.13:83/api/stok/0108";
String galvanizHaddeler="http://192.168.2.13:83/api/stok/0053";
String gzrdSaclar="http://192.168.2.13:83/api/stok/0063";
String gzrdSaclarRal3009="http://192.168.2.13:83/api/stok/0064";
String gzrdSaclarRal7016="http://192.168.2.13:83/api/stok/0065";
String gzrdSaclarRal9002="http://192.168.2.13:83/api/stok/0067";
String karboline="http://192.168.2.13:83/api/stok/0072";
String izliProfiller="http://192.168.2.13:83/api/stok/0070";
String kaynakMakineleri="http://192.168.2.13:83/api/stok/0074";
String gazaltiKaynakTelleri="http://192.168.2.13:83/api/stok/0062";
String panelArasiIsikliklar="http://192.168.2.13:83/api/stok/0089";
String panelArasiIsiklikAksesuarlari="http://192.168.2.13:83/api/stok/0088";
String polikarbonatLevhalar="http://192.168.2.13:83/api/stok/0094";
String polikarbonatAksesuarlari="http://192.168.2.13:83/api/stok/0093";
String polikarbonatTrapezler="http://192.168.2.13:83/api/stok/0095";
String semerler="http://192.168.2.13:83/api/stok/0102";
String vidalar="http://192.168.2.13:83/api/stok/0136";
String osbler="http://192.168.2.13:83/api/stok/0086";
String alcipanlar="http://192.168.2.13:83/api/stok/0005";
String betonaltiTrapezler="http://192.168.2.13:83/api/stok/0008";
String betopanlar="http://192.168.2.13:83/api/stok/0009";
String boardexler="http://192.168.2.13:83/api/stok/0010";
String galvanizRuloSaclar="http://192.168.2.13:83/api/stok/0056";
String ruloSaclarRal3009="http://192.168.2.13:83/api/stok/0098";
String ruloSaclarRal9002="http://192.168.2.13:83/api/stok/0101";
String duzSaclarRal9002="http://192.168.2.13:83/api/stok/0043";
String siyahDuzSaclar="http://192.168.2.13:83/api/stok/0107";
ScrollController myList=new ScrollController();
List<String> usernames = [];
List<String> passwords = [];

class _HomePageState extends State<HomePage> {
  bool isChecked = false;
  final url = Uri.parse("http://192.168.2.13:83/api/user");
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
        debugShowCheckedModeBanner:false,
        theme: ThemeData(fontFamily: 'BreeSerif'),
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
                            onPressed: () async {
                              callUsers();
                              if ( usernames.contains(userNameController.text.toString()) &&
                                  passwords.contains(userPasswordController.text.toString())) {
                                if (isChecked == true) {
                                  remember();
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                      pageBuilder: (
                                          BuildContext context,
                                          Animation<double> animation,
                                          Animation<double> secondaryAnimation) {
                                        return IkinciSayfa();
                                      },
                                      transitionsBuilder: (
                                          BuildContext context,
                                          Animation<double> animation,
                                          Animation<double> secondaryAnimation,
                                          Widget child) {
                                        return Align(
                                          child: SizeTransition(
                                            sizeFactor: animation,
                                            child: child,
                                          ),
                                        );
                                      },
                                      transitionDuration: Duration(milliseconds: 1000),
                                    ),
                                  );
                                  setState(() {
                                      MyListView().callStokes();
                                      MyListView().callGalvanizBoru();
                                      MyListView().callGalvanizProfiller();
                                      MyListView().callGalvanizSicDaldProfill();
                                      MyListView().callOluklar();
                                      MyListView().callSeraKg();
                                      MyListView().callSeraMt();
                                      MyListView().callTrapezSaclarRal3009();
                                      MyListView().callTrapezSaclarRal9002();
                                      MyListView().callGalvanizTrapezSaclar();
                                      MyListView().callTrapezMahyalarRal3009();
                                      MyListView().callTrapezSaclarRal9002();
                                      MyListView().callGalvanizTrapezMahyalar();
                                      MyListView().callCatiPanelleriR3004Delta();
                                      MyListView().callCatiPanelleriR9002Delta();
                                      MyListView().callCatiPanelleriR7016Delta();
                                      MyListView().callCephePanelleriR9002Delta();
                                      MyListView().callBoyaliBorularYucel();
                                      MyListView().callBoyaliProfillerYucel();
                                      MyListView().callSiyahBorularYucel();
                                      MyListView().callSiyahProfillerYucel();
                                      MyListView().callGalvanizMansonluBorular();
                                      MyListView().callGalvanizDestekSaclari();
                                      MyListView().callGalvanizDuzSaclar();
                                      MyListView().callDuzSaclarRal3009();
                                      MyListView().callDkpDuzSaclar();
                                      MyListView().callSiyahBaklavaliSaclar();
                                      MyListView().callSiyahHaddeler();
                                      MyListView().callGalvanizHaddeler();
                                      MyListView().callGzrdSaclar();
                                      MyListView().callGzrdSaclarRal3009();
                                      MyListView().callGzrdSaclarRal7016();
                                      MyListView().callGzrdSaclarRal9002();
                                      MyListView().callKarboline();
                                      MyListView().callIzliProfiller();
                                      MyListView().callKaynakMakineleri();
                                      MyListView().callGazaltiKaynakTelleri();
                                      MyListView().callPanelArasiIsikliklar();
                                      MyListView().callPanelArasiIsiklikAksesuarlari();
                                      MyListView().callPolikarbonatLevhalar();
                                      MyListView().callPolikarbonatAksesuarlari();
                                      MyListView().callPolikarbonatTrapezler();
                                      MyListView().callSemerler();
                                      MyListView().callVidalar();
                                      MyListView().callOsbler();
                                      MyListView().callAlcipanlar();
                                      MyListView().callBetonaltiTrapezler();
                                      MyListView().callBetopanlar();
                                      MyListView().callBoardexler();
                                      MyListView().callGalvanizRuloSaclar();
                                      MyListView().callRuloSaclarRal3009();
                                      MyListView().callRuloSaclarRal9002();
                                      MyListView().callDuzSaclarRal9002();
                                      MyListView().callSiyahDuzSaclar();
                                      MyListView().callTrapezMahyalarRal9002();
                                  });
                                }
                                else if(isChecked ==false){
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                   prefs.remove('password');
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (BuildContext ctx) => IkinciSayfa()));
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
                            style: TextStyle(color: Color(0xff273CB1),fontSize: 15),
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
class MyListView extends StatelessWidget {
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

  Future callGalvanizBoru()async{
    Uri galvanizBoruUrl=Uri.parse(galvaniz1);
    try{
      var response = await http.get(galvanizBoruUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames2.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callGalvanizProfiller()async{
    Uri galvanizProfilUrl=Uri.parse(galvanizProfiller);
    try{
      var response = await http.get(galvanizProfilUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames3.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callOluklar()async{
    Uri OluklarUrl=Uri.parse(oluklar);
    try{
      var response = await http.get(OluklarUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames4.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callSeraKg()async{
    Uri SeraKgUrl=Uri.parse(seraKg);
    try{
      var response = await http.get(SeraKgUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames5.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callSeraMt()async{
    Uri SeraMtUrl=Uri.parse(seraMt);
    try{
      var response = await http.get(SeraMtUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames6.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callTrapezSaclarRal3009()async{
    Uri TrapezSaclarRal3009Url=Uri.parse(trapezSaclarRal3009);
    try{
      var response = await http.get(TrapezSaclarRal3009Url);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames7.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callTrapezSaclarRal9002()async{
    Uri TrapezSaclarRal9002Url=Uri.parse(trapezSaclarRal9002);
    try{
      var response = await http.get(TrapezSaclarRal9002Url);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames8.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callGalvanizTrapezSaclar()async{
    Uri GalvanizTrapezSaclarUrl=Uri.parse(galvanizTrapezSaclar);
    try{
      var response = await http.get(GalvanizTrapezSaclarUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames9.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callTrapezMahyalarRal3009()async{
    Uri TrapezMahyalarRal3009Url=Uri.parse(trapezMahyalarRal3009);
    try{
      var response = await http.get(TrapezMahyalarRal3009Url);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames10.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callTrapezMahyalarRal9002()async{
    Uri TrapezMahyalarRal9002Url=Uri.parse(trapezMahyalarRal9002);
    try{
      var response = await http.get(TrapezMahyalarRal9002Url);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames11.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callGalvanizTrapezMahyalar()async{
    Uri GalvanizTrapezMahyalarUrl=Uri.parse(galvanizTrapezMahyalar);
    try{
      var response = await http.get(GalvanizTrapezMahyalarUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames12.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callCatiPanelleriR3004Delta()async{
    Uri CatiPanelleriR3004DeltaUrl=Uri.parse(catiPanelleriR3004Delta);
    try{
      var response = await http.get(CatiPanelleriR3004DeltaUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames13.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callCatiPanelleriR9002Delta()async{
    Uri CatiPanelleriR9002DeltaUrl=Uri.parse(catiPanelleriR9002Delta);
    try{
      var response = await http.get(CatiPanelleriR9002DeltaUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames14.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callCatiPanelleriR7016Delta()async{
    Uri CatiPanelleriR7016DeltaUrl=Uri.parse(catiPanelleriR7016Delta);
    try{
      var response = await http.get(CatiPanelleriR7016DeltaUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames15.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callCephePanelleriR9002Delta()async{
    Uri CephePanelleriR9002DeltaUrl=Uri.parse(cephePanelleriR9002Delta);
    try{
      var response = await http.get(CephePanelleriR9002DeltaUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames16.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callBoyaliBorularYucel()async{
    Uri BoyaliBorularYucelUrl=Uri.parse(boyaliBorularYucel);
    try{
      var response = await http.get(BoyaliBorularYucelUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames17.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callBoyaliProfillerYucel()async{
    Uri BoyaliProfillerYucelUrl=Uri.parse(boyaliProfillerYucel);
    try{
      var response = await http.get(BoyaliProfillerYucelUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames18.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callSiyahBorularYucel()async{
    Uri SiyahBorularYucelUrl=Uri.parse(siyahBorularYucel);
    try{
      var response = await http.get(SiyahBorularYucelUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames19.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callSiyahProfillerYucel()async{
    Uri SiyahProfillerYucelUrl=Uri.parse(siyahProfillerYucel);
    try{
      var response = await http.get(SiyahProfillerYucelUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames20.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callGalvanizMansonluBorular()async{
    Uri GalvanizMansonluBorularUrl=Uri.parse(galvanizMansonluBorular);
    try{
      var response = await http.get(GalvanizMansonluBorularUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames21.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callGalvanizSicDaldProfill()async{
    Uri GalvanizSicDaldProfillUrl=Uri.parse(galvanizSicDaldProfill);
    try{
      var response = await http.get(GalvanizSicDaldProfillUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames22.addAll(stoknames);
      }

    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callGalvanizDestekSaclari()async{
    Uri GalvanizDestekSaclariUrl=Uri.parse(galvanizDestekSaclari);
    try{
      var response = await http.get(GalvanizDestekSaclariUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames23.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callGalvanizDuzSaclar()async{
    Uri GalvanizDuzSaclarUrl=Uri.parse(galvanizDuzSaclar);
    try{
      var response = await http.get(GalvanizDuzSaclarUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames24.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callDuzSaclarRal3009()async{
    Uri DuzSaclarRal3009Url=Uri.parse(DuzSaclarRal3009);
    try{
      var response = await http.get(DuzSaclarRal3009Url);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames25.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callDkpDuzSaclar()async{
    Uri DkpDuzSaclarUrl=Uri.parse(dkpDuzSaclar);
    try{
      var response = await http.get(DkpDuzSaclarUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames26.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callSiyahBaklavaliSaclar()async{
    Uri SiyahBaklavaliSaclarUrl=Uri.parse(siyahBaklavaliSaclar);
    try{
      var response = await http.get(SiyahBaklavaliSaclarUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames27.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }

  Future callSiyahHaddeler()async{
    Uri SiyahHaddelerUrl=Uri.parse(siyahHaddeler);
    try{
      var response = await http.get(SiyahHaddelerUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames28.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callGalvanizHaddeler()async{
    Uri GalvanizHaddelerUrl=Uri.parse(galvanizHaddeler);
    try{
      var response = await http.get(GalvanizHaddelerUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames29.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callGzrdSaclar()async{
    Uri GzrdSaclarUrl=Uri.parse(gzrdSaclar);
    try{
      var response = await http.get(GzrdSaclarUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames30.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callGzrdSaclarRal3009()async{
    Uri GzrdSaclarRal3009Url=Uri.parse(gzrdSaclarRal3009);
    try{
      var response = await http.get(GzrdSaclarRal3009Url);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames31.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callGzrdSaclarRal7016()async{
    Uri GzrdSaclarRal7016Url=Uri.parse(gzrdSaclarRal7016);
    try{
      var response = await http.get(GzrdSaclarRal7016Url);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames32.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callGzrdSaclarRal9002()async{
    Uri GzrdSaclarRal9002Url=Uri.parse(gzrdSaclarRal9002);
    try{
      var response = await http.get(GzrdSaclarRal9002Url);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames33.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callKarboline()async{
    Uri KarbolineUrl=Uri.parse(karboline);
    try{
      var response = await http.get(KarbolineUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames34.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callIzliProfiller()async{
    Uri IzliProfillerUrl=Uri.parse(izliProfiller);
    try{
      var response = await http.get(IzliProfillerUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames35.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callKaynakMakineleri()async{
    Uri KaynakMakineleriUrl=Uri.parse(kaynakMakineleri);
    try{
      var response = await http.get(KaynakMakineleriUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames36.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callGazaltiKaynakTelleri()async{
    Uri GazaltiKaynakTelleriUrl=Uri.parse(gazaltiKaynakTelleri);
    try{
      var response = await http.get(GazaltiKaynakTelleriUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames37.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callPanelArasiIsikliklar()async{
    Uri PanelArasiIsikliklarUrl=Uri.parse(panelArasiIsikliklar);
    try{
      var response = await http.get(PanelArasiIsikliklarUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames38.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callPanelArasiIsiklikAksesuarlari()async{
    Uri PanelArasiIsiklikAksesuarlariUrl=Uri.parse(panelArasiIsiklikAksesuarlari);
    try{
      var response = await http.get(PanelArasiIsiklikAksesuarlariUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames39.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callPolikarbonatLevhalar()async{
    Uri PolikarbonatLevhalarUrl=Uri.parse(polikarbonatLevhalar);
    try{
      var response = await http.get(PolikarbonatLevhalarUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames40.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callPolikarbonatAksesuarlari()async{
    Uri PolikarbonatAksesuarlariUrl=Uri.parse(polikarbonatAksesuarlari);
    try{
      var response = await http.get(PolikarbonatAksesuarlariUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames41.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callPolikarbonatTrapezler()async{
    Uri PolikarbonatTrapezlerUrl=Uri.parse(polikarbonatTrapezler);
    try{
      var response = await http.get(PolikarbonatTrapezlerUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames42.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callSemerler()async{
    Uri SemerlerUrl=Uri.parse(semerler);
    try{
      var response = await http.get(SemerlerUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames43.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callVidalar()async{
    Uri VidalarUrl=Uri.parse(vidalar);
    try{
      var response = await http.get(VidalarUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames44.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callOsbler()async{
    Uri OsblerUrl=Uri.parse(osbler);
    try{
      var response = await http.get(OsblerUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames45.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callAlcipanlar()async{
    Uri AlcipanlarUrl=Uri.parse(alcipanlar);
    try{
      var response = await http.get(AlcipanlarUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames46.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callBetonaltiTrapezler()async{
    Uri BetonaltiTrapezlerUrl=Uri.parse(betonaltiTrapezler);
    try{
      var response = await http.get(BetonaltiTrapezlerUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames47.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callBetopanlar()async{
    Uri BetopanlarUrl=Uri.parse(betopanlar);
    try{
      var response = await http.get(BetopanlarUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames48.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callBoardexler()async{
    Uri BoardexlerUrl=Uri.parse(boardexler);
    try{
      var response = await http.get(BoardexlerUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames49.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callGalvanizRuloSaclar()async{
    Uri GalvanizRuloSaclarUrl=Uri.parse(galvanizRuloSaclar);
    try{
      var response = await http.get(GalvanizRuloSaclarUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames50.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callRuloSaclarRal3009()async{
    Uri RuloSaclarRal3009Url=Uri.parse(ruloSaclarRal3009);
    try{
      var response = await http.get(RuloSaclarRal3009Url);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames51.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callRuloSaclarRal9002()async{
    Uri RuloSaclarRal9002Url=Uri.parse(ruloSaclarRal9002);
    try{
      var response = await http.get(RuloSaclarRal9002Url);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames52.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callDuzSaclarRal9002()async{
    Uri DuzSaclarRal9002Url=Uri.parse(duzSaclarRal9002);
    try{
      var response = await http.get(DuzSaclarRal9002Url);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames53.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future callSiyahDuzSaclar()async{
    Uri SiyahDuzSaclarUrl=Uri.parse(siyahDuzSaclar);
    try{
      var response = await http.get(SiyahDuzSaclarUrl);
      if(response.statusCode==200){
        var result = stokFromJson(response.body);
        for(var i =0; i <result.length; i++){
          stoknames.add(result[i].stokAdi.toString());
        }
        stoknames54.addAll(stoknames);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
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
      return ListView.builder(
        controller: myList,
        primary: false,
          itemCount: stoknames1.length,
          itemBuilder: (BuildContext context,int index){
            return ExpansionTile(
              title:Text(stoknames1[index].toString(),style: TextStyle(fontFamily:'Roboto-BoldItalic')),
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
                                  Text("Satışa hazır M1: "+satisaHazir1[index].toString(),style: TextStyle(color: Colors.blue),),
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
class IkinciSayfa extends StatefulWidget{
  const IkinciSayfa ({Key? key}) : super(key: key);
  @override
  State<IkinciSayfa> createState() => _IkinciSayfaState();
}
class _IkinciSayfaState extends State<IkinciSayfa> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner:false,
      theme: ThemeData(fontFamily: 'BreeSerif'),
      home:Scaffold(
        body:Container(
          decoration: const BoxDecoration(image:DecorationImage(
            image: AssetImage('assets/arka_logo.jpeg',),
            fit: BoxFit.cover,
          ),
          ),
          child:Column(children: [
                  Container(
                    height:50,
                    width: 225,
                    margin: const EdgeInsets.only(left: 90,top: 40),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(14),
                      ),
                      border: Border.all(width: 1,color: const Color(0xFF878787)),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
                      ],
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFFE8E8E8),
                          Color(0xFF2752A8),
                          Color(0xFF000000),
                        ],
                      ),
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(const Size(130, 50)),
                        backgroundColor: MaterialStateProperty.all(Colors.transparent),
                        elevation: MaterialStateProperty.all(0),
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: (){MyListView().callStokes();
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (
                              BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation) {
                            return UcuncuSayfa();
                          },
                          transitionsBuilder: (
                              BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation,
                              Widget child) {
                            return Align(
                              child: SizeTransition(
                                sizeFactor: animation,
                                child: child,
                              ),
                            );
                          },
                          transitionDuration: Duration(milliseconds: 1000),
                        ),
                      );
                      },
                      child: const Center(
                        child: Text(
                          'SATIŞ',textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 225,
                    margin: const EdgeInsets.only(left:90,top:30),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(14),
                      ),
                      border: Border.all(width: 1,color: const Color(0xFF878787)),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
                      ],
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFFE8E8E8),
                          Color(0xFF2752A8),
                          Color(0xFF000000),
                        ],
                      ),
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(const Size(130, 50)),
                        backgroundColor: MaterialStateProperty.all(Colors.transparent),
                        elevation: MaterialStateProperty.all(0),
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: (){

                      },
                      child: const Center(
                        child: Text(
                          'SATIN ALMA',textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height:50,
                    width: 225,
                    margin: const EdgeInsets.only(left:90,top:30),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(14),
                      ),
                      border: Border.all(width: 1,color: const Color(0xFF878787)),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
                      ],
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFFE8E8E8),
                          Color(0xFF2752A8),
                          Color(0xFF000000),
                        ],
                      ),
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(const Size(130, 50)),
                        backgroundColor: MaterialStateProperty.all(Colors.transparent),
                        elevation: MaterialStateProperty.all(0),
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: (){

                      },
                      child: const Center(
                        child: Text(
                          'ÜRETİM',textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height:50,
                    width: 225,
                    margin: const EdgeInsets.only(left:90,top: 30,bottom:30),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(14),
                      ),
                      border: Border.all(width: 1,color: const Color(0xFF878787)),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
                      ],
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFFE8E8E8),
                          Color(0xFF2752A8),
                          Color(0xFF000000),
                        ],
                      ),
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(const Size(130, 50)),
                        backgroundColor: MaterialStateProperty.all(Colors.transparent),
                        elevation: MaterialStateProperty.all(0),
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: (){

                      },
                      child: const Center(
                        child: Text(
                          'FİNANS',textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height:50,
                    width:225,
                    margin: const EdgeInsets.only(left:90,bottom:30),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(14),
                      ),
                      border: Border.all(width: 1,color: const Color(0xFF878787)),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
                      ],
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFFE8E8E8),
                          Color(0xFF2752A8),
                          Color(0xFF000000),
                        ],
                      ),
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(const Size(130, 50)),
                        backgroundColor: MaterialStateProperty.all(Colors.transparent),
                        elevation: MaterialStateProperty.all(0),
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: (){

                      },
                      child: const Center(
                        child: Text(
                          'MUHASEBE',textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height:50,
                    width:225,
                    margin: const EdgeInsets.only(left:90,bottom:30),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(14),
                      ),
                      border: Border.all(width: 1,color: const Color(0xFF878787)),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
                      ],
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFFE8E8E8),
                          Color(0xFF2752A8),
                          Color(0xFF000000),
                        ],
                      ),
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(const Size(130, 50)),
                        backgroundColor: MaterialStateProperty.all(Colors.transparent),
                        elevation: MaterialStateProperty.all(0),
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: (){

                      },
                      child: const Center(
                        child: Text(
                          'İK',textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height:50,
                    width:225,
                    margin: const EdgeInsets.only(left:90,bottom: 30),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(14),
                      ),
                      border: Border.all(width: 1,color: const Color(0xFF878787)),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
                      ],
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFFE8E8E8),
                          Color(0xFF2752A8),
                          Color(0xFF000000),
                        ],
                      ),
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(const Size(130, 50)),
                        backgroundColor: MaterialStateProperty.all(Colors.transparent),
                        elevation: MaterialStateProperty.all(0),
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: (){

                      },
                      child: const Center(
                        child: Text('YÖNETİM',textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
            Expanded(
              child: Container(
                height:50,
                width:225,
                margin: const EdgeInsets.only(left:90,bottom: 30),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(14),
                  ),
                  border: Border.all(width: 1,color: const Color(0xFF878787)),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
                  ],
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFFE8E8E8),
                      Color(0xFF2752A8),
                      Color(0xFF000000),
                    ],
                  ),
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(const Size(130, 50)),
                    backgroundColor: MaterialStateProperty.all(Colors.transparent),
                    elevation: MaterialStateProperty.all(0),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: (){

                  },
                  child: const Center(
                    child: Text('YÖNETİM PANELİ',textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
          ),
        )));
  }
}
class UcuncuSayfa extends StatefulWidget {
  const UcuncuSayfa({Key? key}) : super(key: key);
  @override
  State<UcuncuSayfa> createState() => _UcuncuSayfaState();
}
class _UcuncuSayfaState extends State<UcuncuSayfa> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner:false,
        theme: ThemeData(fontFamily: 'BreeSerif'),
      home:Scaffold(
        body:Container(
            decoration: const BoxDecoration(image:DecorationImage(
              image: AssetImage('assets/arka_logo.jpeg',),
              fit: BoxFit.cover,
            ),
            ),
            child: Column(children: [
              Expanded(
                flex:1,
                child: Row(
                  children: [
                    Container(
                      height:50,
                      width: 225,
                      margin: const EdgeInsets.only(left:95,top:180),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(14),
                        ),
                        border: Border.all(width: 1,color: const Color(0xFF878787)),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
                        ],
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xFFE8E8E8),
                            Color(0xFF2752A8),
                            Color(0xFF000000),
                          ],
                        ),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          minimumSize: MaterialStateProperty.all(const Size(130, 50)),
                          backgroundColor: MaterialStateProperty.all(Colors.transparent),
                          elevation: MaterialStateProperty.all(0),
                          shadowColor: MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: (){
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder: (
                                  BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secondaryAnimation) {
                                return StokPage();
                              },
                              transitionsBuilder: (
                                  BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secondaryAnimation,
                                  Widget child) {
                                return Align(
                                  child: SizeTransition(
                                    sizeFactor: animation,
                                    child: child,
                                  ),
                                );
                              },
                              transitionDuration: Duration(milliseconds: 1000),
                            ),
                          );
                        },
                        child: const Center(
                          child: Text(
                            'STOK',textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex:1,
                child: Row(
                  children: [
                    Container(
                      height:50,
                      width: 225,
                      margin: const EdgeInsets.only(left: 95),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(14),
                        ),
                        border: Border.all(width: 1,color: const Color(0xFF878787)),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
                        ],
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xFFE8E8E8),
                            Color(0xFF2752A8),
                            Color(0xFF000000),
                          ],
                        ),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          minimumSize: MaterialStateProperty.all(const Size(130, 50)),
                          backgroundColor: MaterialStateProperty.all(Colors.transparent),
                          elevation: MaterialStateProperty.all(0),
                          shadowColor: MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: (){

                        },
                        child: const Center(
                          child: Text(
                            'TEKLİF',textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex:1,
                child: Row(
                  children: [
                    Container(alignment: Alignment.center,
                      height:50,
                      width: 225,
                      margin: const EdgeInsets.only(left:95,bottom:180),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(14),
                        ),
                        border: Border.all(width: 1,color: const Color(0xFF878787)),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
                        ],
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xFFE8E8E8),
                            Color(0xFF2752A8),
                            Color(0xFF000000),
                          ],
                        ),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          minimumSize: MaterialStateProperty.all(const Size(130, 50)),
                          backgroundColor: MaterialStateProperty.all(Colors.transparent),
                          elevation: MaterialStateProperty.all(0),
                          shadowColor: MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const UcuncuSayfa()));
                        },
                        child: const Center(
                          child: Text(
                            'SİPARİŞ',textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),)]))));
  }
}
class StokPage extends StatefulWidget {
  @override
  State<StokPage> createState() => _StokPageState();
}
class _StokPageState extends State<StokPage> {
  TextEditingController editingController = new TextEditingController();
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner:false,
        theme: ThemeData(fontFamily: 'Aldrich'),
        home: Scaffold(
            body: SafeArea(child: Container(
                width: double.infinity,
                height: double.infinity,
                constraints: const BoxConstraints.expand(),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage("assets/arka_logo.jpeg"),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
                child: Expanded(
                  flex: 1,
                  child: Column(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 350,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [Container(
                                  height: 42,
                                  width: 400,
                                  margin: const EdgeInsets.only(
                                      right:20,left: 10, top: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(14),
                                    ),
                                    border: Border.all(width: 1,
                                        color: const Color(0xFF878787)),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0, 4),
                                          blurRadius: 5.0)
                                    ],
                                    gradient: const LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
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
                                          borderRadius: BorderRadius
                                              .circular(20.0),
                                        ),
                                      ),
                                      minimumSize: MaterialStateProperty
                                          .all(const Size(130, 50)),
                                      backgroundColor: MaterialStateProperty
                                          .all(Colors.transparent),
                                      elevation: MaterialStateProperty
                                          .all(0),
                                      shadowColor: MaterialStateProperty
                                          .all(Colors.transparent),
                                    ),
                                    onPressed: () {
                                      items.clear();
                                      items.addAll(stoknames1);
                                      setState(() {
                                        MyListView().callStokes();
                                        firstMethod();
                                      });
                                    },
                                    child: const Center(
                                      child: Text(
                                        'TÜM STOKLAR',
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
                                  Row(
                                    children: [
                                      Container(
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames2);
                                            setState(() {
                                              MyListView().callGalvanizBoru();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 20, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames3);
                                            setState(() {
                                              MyListView().callGalvanizProfiller();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames4);
                                            setState(() {
                                              MyListView().callOluklar();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 20, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames5);
                                            setState(() {
                                              MyListView().callSeraKg();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames6);
                                            setState(() {
                                              MyListView().callSeraMt();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 20, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                           items.clear();
                                            items.addAll(stoknames7);
                                            setState(() {
                                              MyListView().callTrapezSaclarRal3009();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames8);
                                            setState(() {
                                              MyListView().callTrapezSaclarRal9002();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 20, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                           items.clear();
                                           items.addAll(stoknames9);
                                            setState(() {
                                              MyListView()
                                                  .callGalvanizTrapezSaclar();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames10);
                                            setState(() {
                                              MyListView()
                                                  .callTrapezMahyalarRal3009();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 20, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames11);
                                            setState(() {
                                              MyListView()
                                                  .callTrapezMahyalarRal9002();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Color(0xFFE8E8E8),
                                              Color(0xFF2752A8),
                                              Color(0xFF000000)
                                            ],
                                          ),
                                        ),
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames12);
                                            setState(() {
                                              MyListView()
                                                  .callGalvanizTrapezMahyalar();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 20, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames13);
                                            setState(() {
                                              MyListView()
                                                  .callCatiPanelleriR3004Delta();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
                                            child: Text(
                                              'CATI PANELLERI (R3004)(DELTA )',
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames14);
                                            setState(() {
                                              MyListView()
                                                  .callCatiPanelleriR9002Delta();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
                                            child: Text(
                                              'CATI PANELLERI (R9002)(DELTA )',
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 20, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames15);
                                            setState(() {
                                              MyListView()
                                                  .callCatiPanelleriR7016Delta();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
                                            child: Text(
                                              'CATI PANELLERI (R7016)(DELTA )',
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames16);
                                            setState(() {
                                              MyListView()
                                                  .callCephePanelleriR9002Delta();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 20, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames17);
                                            setState(() {
                                              MyListView()
                                                  .callBoyaliBorularYucel();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames18);
                                            setState(() {
                                              MyListView()
                                                  .callBoyaliProfillerYucel();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 20, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames19);
                                            setState(() {
                                              MyListView()
                                                  .callSiyahBorularYucel();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames20);
                                            setState(() {
                                              MyListView()
                                                  .callSiyahProfillerYucel();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 20, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames21);
                                            setState(() {
                                              MyListView()
                                                  .callGalvanizMansonluBorular();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames22);
                                            setState(() {
                                              MyListView()
                                                  .callGalvanizSicDaldProfill();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 20, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames23);
                                            setState(() {
                                              MyListView()
                                                  .callGalvanizDestekSaclari();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames24);
                                            setState(() {
                                              MyListView()
                                                  .callGalvanizDuzSaclar();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 20, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames25);
                                            setState(() {
                                              MyListView()
                                                  .callDuzSaclarRal3009();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames26);
                                            setState(() {
                                              MyListView().callDkpDuzSaclar();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 20, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames27);
                                            setState(() {
                                              MyListView()
                                                  .callSiyahBaklavaliSaclar();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames28);
                                            setState(() {
                                              MyListView().callSiyahHaddeler();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 20, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames29);
                                            setState(() {
                                              MyListView()
                                                  .callGalvanizHaddeler();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames30);
                                            setState(() {
                                              MyListView().callGzrdSaclar();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 20, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames31);
                                            setState(() {
                                              MyListView()
                                                  .callGzrdSaclarRal3009();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames32);
                                            setState(() {
                                              MyListView()
                                                  .callGzrdSaclarRal7016();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 20, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames33);
                                            setState(() {
                                              MyListView()
                                                  .callGzrdSaclarRal9002();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames34);
                                            setState(() {
                                              MyListView().callKarboline();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 20, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames35);
                                            setState(() {
                                              MyListView().callIzliProfiller();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames36);
                                            setState(() {
                                              MyListView()
                                                  .callKaynakMakineleri();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 20, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames37);
                                            setState(() {
                                              MyListView()
                                                  .callGazaltiKaynakTelleri();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames38);
                                            setState(() {
                                              MyListView()
                                                  .callPanelArasiIsikliklar();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 20, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames39);
                                            setState(() {
                                              MyListView()
                                                  .callPanelArasiIsiklikAksesuarlari();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames40);
                                            setState(() {
                                              MyListView()
                                                  .callPolikarbonatLevhalar();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 20, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames41);
                                            setState(() {
                                              MyListView()
                                                  .callPolikarbonatAksesuarlari();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames42);
                                            setState(() {
                                              MyListView()
                                                  .callPolikarbonatTrapezler();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 20, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames43);
                                            setState(() {
                                              MyListView().callSemerler();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames44);
                                            setState(() {
                                              MyListView().callVidalar();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 20, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames45);
                                            setState(() {
                                              MyListView().callOsbler();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames46);
                                            setState(() {
                                              MyListView().callAlcipanlar();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
                                            child: Text(
                                              'ALCIPANLAR',
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 20, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames47);
                                            setState(() {
                                              MyListView().callBetonaltiTrapezler();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames48);
                                            setState(() {
                                              MyListView().callBetopanlar();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 20, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames49);
                                            setState(() {
                                              MyListView().callBoardexler();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames50);
                                            setState(() {
                                              MyListView().callGalvanizRuloSaclar();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 20, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames51);
                                            setState(() {
                                              MyListView().callRuloSaclarRal3009();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames52);
                                            setState(() {
                                              MyListView().callRuloSaclarRal9002();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
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
                                      Container(
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 20, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames53);
                                            setState(() {
                                              MyListView().callDuzSaclarRal9002();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
                                            child: Text(
                                              'DUZ SACLAR(RAL9002)',
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
                                        height: 42,
                                        width: 180,
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          border: Border.all(width: 1,
                                              color: const Color(0xFF878787)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 4),
                                                blurRadius: 5.0)
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
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
                                                borderRadius: BorderRadius
                                                    .circular(20.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(130, 50)),
                                            backgroundColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                          ),
                                          onPressed: () {
                                            items.clear();
                                            items.addAll(stoknames54);
                                            setState(() {
                                              MyListView().callSiyahDuzSaclar();
                                              firstMethod();
                                            });
                                          },
                                          child: const Center(
                                            child: Text(
                                              'SIYAH DUZ SACLAR',
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
                        ),
                        Container(
                          height: 40,
                          margin: const EdgeInsets.only(
                              left: 45, right: 45, top: 20),
                          child: TextField(
                            onChanged: (value) {
                              filterSearchResults(value);
                            },
                            controller: editingController,
                            inputFormatters: [
                              UpperCaseTextFormatter(),
                            ],
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14),
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.search),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(20.0)),),
                              hintText: 'Ara',
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              return ExpansionTile(
                                title: Text(' ${items[index]}',style: TextStyle(fontFamily: 'BreeSerif'),),
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
    Text("Satışa hazır M1: "+satisaHazir1[index].toString(),style: TextStyle(fontFamily: 'BreeSerif'),),
    ],
    ),
    ),
    Container(
    margin: EdgeInsets.only(left: 15, top: 10),
    child: Row(
    children: [
    Text("Satışa hazır M2: "+satHzrAdet1[index].toString(),style: TextStyle(fontFamily: 'BreeSerif'),),
    ],
    ),
    ),
    Container(
    margin: EdgeInsets.only(left: 15, top: 10),
    child: Row(
    children: [
    Text("Bekleyen Sipariş M1: "+bekleyenSiparis1[index].toString(),style: TextStyle(fontFamily: 'BreeSerif'),),
    ],
    ),
    ),
    Container(
    margin: EdgeInsets.only(left: 15, top: 10),
    child: Row(
    children: [
    Text("Bekleyen Sipariş M2: "+bekSipAdet1[index].toString(),style: TextStyle(fontFamily: 'BreeSerif'),),
    ],
    ),
    ),
    Container(
    margin: EdgeInsets.only(left: 15, top: 10),
    child: Row(
    children: [
    Text("Bakiye M1: "+bakiye1[index].toString(),style: TextStyle(fontFamily: 'BreeSerif'),),
    ],
    ),
    ),
    Container(margin: EdgeInsets.only(left: 15, top: 10),
    child: Row(
    children: [
    Text("Bakiye M2: "+bekSipAdet1[index].toString(),style: TextStyle(fontFamily: 'BreeSerif'),),
    ],
    ),
    ),
    Container(margin: EdgeInsets.only(left: 15, top: 10),
    child: Row(
    children: [
    Text("Fabrika Stok M1: "+fabStokMik1[index].toString(),style: TextStyle(fontFamily: 'BreeSerif'),),
    ],
    ),
    ),
    Container(margin: EdgeInsets.only(left: 15, top: 10),
    child: Row(
    children: [
    Text("Fabrika Stok M2: "+fabStokAd1[index].toString(),style: TextStyle(fontFamily: 'BreeSerif'),),
    ],
    ),
    ),
    Container(margin: EdgeInsets.only(left: 15, top: 10),
    child: Row(
    children: [
    Text("Bekleyen iş emri M1: "+beklIeMiktar1[index].toString(),style: TextStyle(fontFamily: 'BreeSerif'),),
    ],
    ),
    ),
    Container(margin: EdgeInsets.only(left: 15, top: 10,bottom: 10),
    child: Row(
    children: [
    Text("Bekleyen iş emri M2: "+beklIeAd1[index].toString(),style: TextStyle(fontFamily: 'BreeSerif'),),
    ],
    ),
    ),
    ],
    )
    )
    )
    ],
    );  } )),
               Container( height:42,
                 width: 180,
                 margin: const EdgeInsets.only(left:20,top:5,bottom:5),
                 decoration: BoxDecoration(
                   borderRadius: const BorderRadius.all(
                     Radius.circular(14),
                   ),
                   border: Border.all(width: 1,color: const Color(0xFF878787)),
                   boxShadow: const [
                     BoxShadow(
                         color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
                   ],
                   gradient: const LinearGradient(
                     begin: Alignment.centerLeft,
                     end: Alignment.centerRight,
                     colors: [
                       Color(0xFFE8E8E8),
                       Color(0xFF2752A8),
                       Color(0xFF000000),
                     ],
                   ),
                 ),
                 child: ElevatedButton( style: ButtonStyle(
                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                     RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(20.0),
                     ),
                   ),
                   minimumSize: MaterialStateProperty.all(const Size(130, 50)),
                   backgroundColor: MaterialStateProperty.all(Colors.transparent),
                   elevation: MaterialStateProperty.all(0),
                   shadowColor: MaterialStateProperty.all(Colors.transparent),
                 ),
                   onPressed: () async {_showDialog();

                 },
                 child:Text('Çıkış Yap',style:TextStyle(fontFamily: 'BreeSerif', fontWeight: FontWeight.w600,
                   color: Colors.white,
                   fontSize: 20,)),
                 ),
               )
                      ]),
                )))));
  }
  var items = <String>[];
  @override
  void initState() {
    items.addAll(stoknames1);
    super.initState();
  }
  void filterSearchResults(String query) {
    List<String> dummySearchList = <String>[];
    dummySearchList.addAll(stoknames1);
    if (query.isNotEmpty) {
      List<String> dummyListData = <String>[];
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(stoknames1);
      });
    }
  }
void firstMethod(){
     items= items.toSet().toList();
}
  _showDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(20.0)),
          title: Text("Çıkmak istediğinize emin misiniz?",style:TextStyle(fontSize:20,fontFamily:'BreeSerif')),
          actions: <Widget>[
            Container( height:42,
              width: 180,
              margin: const EdgeInsets.only(left:20,top:5,bottom:5),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(14),
                ),
                border: Border.all(width: 1,color: const Color(0xFF878787)),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
                ],
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFFE8E8E8),
                    Color(0xFF2752A8),
                    Color(0xFF000000),
                  ],
                ),
              ),
              child: ElevatedButton( style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(const Size(130, 50)),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                elevation: MaterialStateProperty.all(0),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
              ),
                child: new Text("Evet",style:TextStyle(color:Colors.white,fontFamily:'Aldrich',fontSize:20)),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext ctx) => HomePage()));
                },
              ),
            ),
        Container(alignment:Alignment.center,
          height:42,
        width: 180,
        margin: const EdgeInsets.only(left:20,top:5,bottom:5),
        decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
        Radius.circular(14),
        ),
        border: Border.all(width: 1,color: const Color(0xFF878787)),
        boxShadow: const [
        BoxShadow(
        color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
        ],
        gradient: const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
        Color(0xFFE8E8E8),
        Color(0xFF2752A8),
        Color(0xFF000000),
        ],
        ),
        ),
        child: ElevatedButton( style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        ),
        ),
        minimumSize: MaterialStateProperty.all(const Size(130, 50)),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        elevation: MaterialStateProperty.all(0),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
              child: new Text("Hayır",style:TextStyle(color:Colors.white,fontFamily:'Aldrich',fontSize:20),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
        )],
        );
      },
    );
  }
}


