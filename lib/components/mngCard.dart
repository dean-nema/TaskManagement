import 'package:flutter/material.dart';
import 'package:tasker/config/colours.dart';

class Mcard extends StatelessWidget {
  final dynamic? question;
  final dynamic? answer;
  final String? empName;
  Mcard({super.key, required this.question, required this.answer, required this.empName});

  @override
  Widget build(BuildContext context) {
    return (question != 0)?Container(
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.cyan[800]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Text(
                                  question!,
                                  style: TextStyle(
                  fontSize: 20,
                  color: Colours.mine,
                  fontWeight: FontWeight.bold),
                                ),
              ),
            ),
            Divider(),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Text(
                                  answer!,
                                  style: TextStyle(fontSize: 18, color: Colors.white),
                                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                empName!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            )
          ],
        ),
      ),
    ): Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.blueGrey),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Text(
                                  "No Completed Task to View",
                                  style: TextStyle(
                  fontSize: 20,
                  color: Colors.lightBlueAccent[200],
                  fontWeight: FontWeight.bold),
                                ),
              ),
            ),
          
            
          ],
        ),
      ),
    );
  }
}
