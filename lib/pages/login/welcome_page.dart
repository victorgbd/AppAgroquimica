import 'package:agroquimica/pages/login/login_page.dart';
import 'package:agroquimica/pages/login/signup_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Bienvenido",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Image(
                image: AssetImage('assets/plant_icon.png'),
                height: 256,
                width: 256,
              ),
              SizedBox(
                height: 44.0,
              ),
              SizedBox(
                height: 24.0,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: Text("LOGIN"),
                padding: EdgeInsets.symmetric(horizontal: 54.0, vertical: 24.0),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
              SizedBox(
                height: 24.0,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                color: Theme.of(context).secondaryHeaderColor,
                textColor: Colors.white,
                child: Text("SIGNUP"),
                padding: EdgeInsets.symmetric(horizontal: 54.0, vertical: 24.0),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignupPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
