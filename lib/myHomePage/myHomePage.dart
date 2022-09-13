import 'package:flutter/material.dart';
import 'package:hive_demo/myHomePage/myHomePage_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MyHomePageController myHomePageController = MyHomePageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hive Demo',
          style: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.white, fontSize: 12),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: TextField(
              controller: myHomePageController.nameController,
              maxLines: 1,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Name',
                  hintText: 'Enter Your Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: TextField(
              controller: myHomePageController.ageController,
              maxLines: 1,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Your Age',
                  hintText: 'Enter Your Age'),
            ),
          ),
          Center(
            child: InkWell(
              onTap: (){
                myHomePageController.displayValue();
              },
                child: Container(
              height: 30,
              width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                  ),
            )),
          )
        ],
      ),
    );
  }
}
