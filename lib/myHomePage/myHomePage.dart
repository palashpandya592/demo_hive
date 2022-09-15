import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hive_demo/myHomePage/myHomePage_controller.dart';
import 'package:hive_demo/utils/app_string.dart';
import 'package:hive_demo/utils/common_color.dart';
import 'package:hive_demo/utils/common_textStyle.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MyHomePageController? provider;


  @override
  void initState() {
    SchedulerBinding.instance
        .addPostFrameCallback((_){
      Provider.of<MyHomePageController>(context,listen: false).displayValue(context);
      provider = Provider.of<MyHomePageController>(context,listen: false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:   const Text(
          AppString.hiveDemo,
          style: TextStyle(
                fontWeight: FontWeight.w600, color: AppColor.white, fontSize: 12),
        ),
        centerTitle: true,
        backgroundColor: AppColor.blue,
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
                        labelText: AppString.enterYourName,
                        hintText: AppString.enterYourName),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: TextField(
                    controller: provider.ageController,
                    maxLines: 1,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: AppString.enterYourAge,
                        hintText: AppString.enterYourAge),
                  ),
                ),
                Center(
                  child: InkWell(
                      onTap: (){
                        provider.displayValue(context);
                      },
                      child: Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.green,
                        ),
                      )),
                ),
                Expanded(
                  child: provider.userList == [] ?  const Text(AppString.dataIsEmpty) :
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
                            border: Border.all(color: AppColor.black,width: 1),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            CommonTextStyle.label(text: data.firstName.toString(),size: 12.0,fontWeight: FontWeight.w500),
                            CommonTextStyle.label(text: data.lastName.toString(),size: 12.0,fontWeight: FontWeight.w500),
                            CommonTextStyle.label(text: data.email.toString(),size: 12.0,fontWeight: FontWeight.w500),
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
