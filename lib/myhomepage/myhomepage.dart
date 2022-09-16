import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hive_demo/myhomepage/homepage_controller.dart';
import 'package:hive_demo/utils/common_color.dart';
import 'package:hive_demo/utils/common_row.dart';
import 'package:hive_demo/utils/common_textStyle.dart';
import 'package:provider/provider.dart';
import '../utils/app_string.dart';

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
      Provider.of<MyHomePageController>(context,listen: false).checkConnectionFun(context);
      provider = Provider.of<MyHomePageController>(context,listen: false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.white,
        body: Consumer<MyHomePageController>(
            builder: (context,provider,child){
              return  provider.allCoinListModel == []  ? const Center(child: CircularProgressIndicator(color: AppColor.blue),):
                Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: AppColor.darkBlue,
                    ),
                    child: Center(child:  CommonTextStyle.label(text: AppString.coinApp,size: 18.0,color: AppColor.white,fontWeight: FontWeight.w600),),
                  ),
                  provider.allCoinListModel == [] ? const Center(child: CircularProgressIndicator(color: AppColor.blue),) :
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: 10),
                      shrinkWrap: true,
                      itemCount: provider.allCoinListModel.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context,index){
                        return Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          shadowColor: Colors.black,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                            padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                            decoration: const BoxDecoration(
                              color: AppColor.white,
                              // borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children:   [
                                     CircleAvatar(
                                      backgroundImage: NetworkImage(provider.allCoinListModel[index].image == '' ? AppString.staticImage: provider.allCoinListModel[index].image.toString()),
                                      radius: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:  [
                                          CommonTextStyle.label(text: provider.allCoinListModel[index].name.toString(),size: 15.0,fontWeight: FontWeight.w600,color: AppColor.black),
                                          CommonTextStyle.label(text:provider.allCoinListModel[index].dataStart.toString(),size: 10.0,fontWeight: FontWeight.w400,color: AppColor.grey),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children:  [
                                        CommonRowData(coinValue: '${provider.allCoinListModel[index].volume1HrsUsd!.toDouble().toStringAsFixed(2)} ₹',coinName: AppString.hrs),
                                        CommonRowData(coinValue: '${provider.allCoinListModel[index].volume1DayUsd!.toDouble().toStringAsFixed(2)} ₹',coinName: AppString.day),
                                        CommonRowData(coinValue: '${provider.allCoinListModel[index].volume1MthUsd!.toDouble().toStringAsFixed(2)} ₹',coinName: AppString.mon),
                                      ],
                                    )

                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              );
            }
        ),
      ),
    );
  }
}
