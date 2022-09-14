import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hive_demo/myHomePage/myHomePage_controller.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // MyHomePageController myHomePageController = MyHomePageController();
  MyHomePageController? provider;


  @override
  void initState() {
    SchedulerBinding.instance
        .addPostFrameCallback((_){
      Provider.of<MyHomePageController>(context,listen: false).displayValue();
      provider = Provider.of<MyHomePageController>(context,listen: false);
    });
    super.initState();
  }

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
      body: Consumer<MyHomePageController>(
          builder: (context,provider,child){
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: TextField(
                    controller: provider.nameController,
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
                    controller: provider.ageController,
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
                        provider.displayValue();
                      },
                      child: Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green,
                        ),
                      )),
                ),
                Expanded(
                  child: provider.userList == [] ? const Text('-------') :
                  ListView.builder(
                    padding: const EdgeInsets.only(top: 5),
                    shrinkWrap: true,
                    itemCount: provider.userList.length,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context,index){
                      var data =  provider.userList[index];
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black,width: 1),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Text(data.firstName.toString(),style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                            Text(data.lastName.toString(),style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                            Text(data.email.toString(),style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          }
      ),

    );
  }
}
