import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    //runApp method
    home: HomePage(),
  ));//MaterialApp
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool checkboxvalue = false;

  ValueChanged<bool?>? onChanged;

  @override
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
                      margin: EdgeInsets.only(left: 130,top: 25),
                      decoration: BoxDecoration(
                        // spice up the button with a radius
                        borderRadius: BorderRadius.all(
                          Radius.circular(14),
                        ),
                        border: Border.all(width: 1,color: Color(0xFF878787)),

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
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 120,top: 10),
                      child: Row(
                        children: [
                          Checkbox(
                            value: checkboxvalue,
                            onChanged: (value) {
                              setState(() {
                                checkboxvalue = value!;
                              });
                            },

                          ),
                          Text('Beni Unutma',style: TextStyle(color: Color(0xff273CB1)),),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20, left: 15),
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
