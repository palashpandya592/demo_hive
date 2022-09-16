import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_demo/controller/internet_connection.dart';
import 'package:hive_demo/database/coin_database/allcoin_list_model.dart';
import 'package:hive_demo/dependancy_injection/define_controller.dart';
import 'package:hive_demo/services/user_service.dart';
import 'package:hive_demo/utils/hive_key.dart';
import 'package:collection/collection.dart';
import '../database/coin_database/coin_image_model.dart';

class MyHomePageController with ChangeNotifier {
  //define object of InternetConnection using getIt
  InternetConnection internet = getIt<InternetConnection>();
  List<AllCoinListModel> allCoinListModel = [];

  Service userService = Service();

  void checkConnectionFun(context) async {
    var boxX = await Hive.openBox(HiveKey.modelOfCoinList);

    // check condition here that internet is available or not
    if (internet.isDeviceConnected == true) {
      await getCoinListFromApi();
    } else {
      allCoinListModel = boxX.get(HiveKey.coinListKey);
      notifyListeners();
    }
  }

  getCoinListFromApi() async {
    var box = await Hive.openBox(HiveKey.modelOfCoinList);
    List<CoinImageModel>? data = await userService.getCoinImageList();

    userService.getCoinDataList(data).then((value) {
      if (value != null) {
        allCoinListModel = value;
        allCoinListModel.forEach((value) {
          CoinImageModel? imageURL = data!.firstWhereOrNull((element) => element.assetId == value.assetId);
          value.image = imageURL?.url ??"";
        });

        box.put(HiveKey.coinListKey, value);
      }
      notifyListeners();
    });
  }
}
