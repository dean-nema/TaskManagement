import 'package:flutter/material.dart';
import 'package:tasker/Data/appData.dart';
import 'package:tasker/components/empCard.dart';
import 'package:tasker/config/colours.dart';

class EDashBoard extends StatefulWidget {
  const EDashBoard({super.key});

  @override
  State<EDashBoard> createState() => _EDashBoardState();
}

class _EDashBoardState extends State<EDashBoard> {
  TextEditingController data = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          " Employee Dashboard",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        backgroundColor: Colours.mine,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
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
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Response...",
                    hintStyle: TextStyle(
                      color: Colours.mine,
                      
                      fontSize: 20,

                    )
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
                  setState(() {
                    String question = Data.toEmployee.dequeue();

                    List<String> complete = [question, data.text];
                    Data.toManager.enqueue(complete);
                    data.clear();
                  });
                },
                child: const Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Text(
                          "Submit",
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
              child: Text("Tasks From Manager",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colours.mine,
                fontSize: 25
              ),),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                ),
                child: SizedBox(
                  child: SingleChildScrollView(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: Data.toEmployee.getLength()-1,
                        padding: EdgeInsets.only(top:10, bottom: 10),
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: emCard(
                              data: (Data.toEmployee.isEmpty())?(null):(Data.toEmployee.getData()![index]),
                            ),
                          );
                        }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
