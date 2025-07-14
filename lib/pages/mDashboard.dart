// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tasker/Data/appData.dart';
import 'package:tasker/Users/users.dart';
import 'package:tasker/components/mngCard.dart';
import 'package:tasker/config/colours.dart';

class MDashboard extends StatefulWidget {
  const MDashboard({super.key});

  @override
  State<MDashboard> createState() => _MDashboardState();
}

class _MDashboardState extends State<MDashboard> {

  TextEditingController data = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Manager Dashboard",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        backgroundColor: Colours.mine,
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: (MediaQuery.of(context).size.height) * 0.20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 5, color: Colours.mine!),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: data,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20),
                  maxLines: null,
                  decoration: InputDecoration(
                     hintText: "Enter Task...",
                    hintStyle: TextStyle(
                      color: Colours.mine,
                      
                      fontSize: 20,

                    ),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22), color: Colours.mine),
              child: MaterialButton(
                onPressed: () {
                  if(data.text != "" && data.text != " "){
                  setState(() {
                      Data.toEmployee.enqueue(data.text);
                      data.clear();
                   
                  });
                  }else{
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "Please Enter The task", style: TextStyle(color: Colors.white),),
                          backgroundColor: Colors.black,
                          duration: Duration(seconds: 3),
                        ));
                  }
                },
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Text(
                          "Assign",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.send,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            Center(
              child: Text("Completed Tasks",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colours.mine,
                fontSize: 25
              ),),
            ),
            (!Data.toManager.isEmpty())
                ? Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: Colours.mine),
                    child: MaterialButton(
                      onPressed: () {
                        
                        setState(() {
                          Data.toManager.dequeue();
                        });
                      },
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Center(
                              child: Text(
                                "Done",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  )
                : SizedBox(
                    height: 10,
                  ),
            Expanded(
                child: SizedBox(
              child: SingleChildScrollView(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: Data.toManager.getLength() - 1,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                        child: Mcard(
                            question: Data.toManager.getData()![index][0],
                            answer: Data.toManager.getData()![index][1]
                           ),
                      );
                    }),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
