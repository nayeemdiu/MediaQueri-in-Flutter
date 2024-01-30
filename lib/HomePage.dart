import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Media Queary"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: (MediaQuery.of(context).size.height / 20),
                width: 5 * (MediaQuery.of(context).size.width / 10),
                color: Colors.cyan,
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 5,
                color: Colors.red,
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 5,
                color: Colors.blue,
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 5,
                color: Colors.black,
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 5,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
