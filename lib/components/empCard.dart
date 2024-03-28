import 'package:flutter/material.dart';

class emCard extends StatelessWidget {
  final String? data;
  emCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return (data != null)? Container(
      width: MediaQuery.of(context).size.width,
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.cyan[800]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Center(
            child: Text(
              data!,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    ):Container(
      width: MediaQuery.of(context).size.width,
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.blueGrey),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Center(
            child: Text(
              "No Task Assigned!! ",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
