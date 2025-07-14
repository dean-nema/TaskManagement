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
            " Login",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          backgroundColor: Colours.mine,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                                            decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 5, color: Colours.mine!)),
                                            child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppRoutes.eDash);
                        },
                        child: Column(
                          children: [
                            Expanded(flex: 3, child: FittedBox(child: Icon(Icons.person, color: Colors.blueGrey,))),
                            Expanded(flex: 1, child: Text("Assistant", style: TextStyle(color: Colours.mine, fontWeight: FontWeight.bold),))
                          ],
                        ),
                                            ),
                                          ),
                      )),
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                                            decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 5, color: Colours.mine!)),
                                            child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppRoutes.mDash);
                        },
                        child: Column(
                          children: [
                            Expanded(flex: 3, child: FittedBox(child: Icon(Icons.person, color: Colors.blueGrey,))),
                            Expanded(flex: 1, child: Text("Manager", style: TextStyle(color: Colours.mine, fontWeight: FontWeight.bold),))
                          ],
                        ),
                                            ),
                                          ),
                      )),
                ],
              )
            ],
          ),
        ));
  }
}
