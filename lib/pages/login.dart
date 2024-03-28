import 'package:flutter/material.dart';
import 'package:tasker/Users/users.dart';
import 'package:tasker/config/colours.dart';
import 'package:tasker/config/routes.dart';

import '../Data/appData.dart';

class Login extends StatelessWidget {
  Login({super.key});

  TextEditingController usr = TextEditingController();
  TextEditingController pass = TextEditingController();
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 60,
        title: Text(
          " Log",
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colours.mine,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Enter Details",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colours.mine),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 300,
            child: TextField(
              controller: usr,
              style: TextStyle(
                color: Colours.mine,
              ),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  label: Text("User Name"),
                  labelStyle: TextStyle(
                    color: Colours.mine,
                  )),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: 300,
            child: TextField(
              obscureText: true,
              controller: pass,
              style:
                  TextStyle(color: Colours.mine, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  label: Text("Password"),
                  labelStyle: TextStyle(color: Colours.mine),
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colours.mine)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22), color: Colours.mine),
            child: MaterialButton(
              //color: Colours.mine,

              onPressed: () {
                password = pass.text;
                String userName = usr.text;
                pass.clear();
                usr.clear();
                switch (userName) {
                  case "Manager":
                    if (Data.users[userName]!.passMatch(password)) {
                      Navigator.of(context).pushNamed(AppRoutes.mDash);
                    } else {
                      print("Here");
                    }
                    break;
                  case "Emp001":
                    if (Data.users[userName]!.passMatch(password)) {
                      Navigator.of(context).pushNamed(AppRoutes.eDash);
                    }
                  default:
                    print("Tough");
                }
              },
              child: Text(
                "Enter",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
