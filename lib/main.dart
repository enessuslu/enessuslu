import 'package:flutter/material.dart';

void main() {
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

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
                            margin: EdgeInsets.only(top: 60, left: 120),
                            width: 150,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                // Respond to button press
                              },
                              child: new Text(
                                'Giriş',
                                style: new TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  customButtonWidget() {}
}
