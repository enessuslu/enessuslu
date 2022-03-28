import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testflutter/model.dart';

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

class _HomePageState extends State<HomePage> {
  bool isChecked = false;

  ValueChanged<bool?>? onChanged;
  final url = Uri.parse("http://172.28.64.1:80/user");
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
                              callUsers();
                              if (userNameController.text.toString() ==
                                      "ergun" &&
                                  userPasswordController.text.toString() ==
                                      "12345") {
                                if (isChecked == true) {
                                  remember();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => StokPage()));
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => StokPage()));
                                }
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

class StokPage extends StatelessWidget {
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
                                  onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => StokPage())),
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
                        hintText: 'Enter a search term',
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
                ],
              ),
            ),
          ),
        ));
  }
}
