import 'package:flutter/material.dart';

class LinearProgress extends StatefulWidget {
  LinearProgress({super.key});

  @override
  State<LinearProgress> createState() => _LinearProgressState();
}

class _LinearProgressState extends State<LinearProgress> {
  @override
  int counter = 0;
  int total = 5;

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: 300,
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FloatingActionButton(
                  backgroundColor: Colors.black,
                  onPressed: () {
                    setState(() {
                      counter = counter + 1;
                    });
                  },
                  child: Icon(Icons.add, color: Colors.white,)),
              SizedBox(
                height: 40,
              ),
              LinearProgressIndicator(
                value: counter / total,
                valueColor: AlwaysStoppedAnimation(Colors.cyanAccent),
                minHeight: 8,
                backgroundColor: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
