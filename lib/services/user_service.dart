import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_demo/database/coin_database/coin_image_model.dart';
import 'package:hive_demo/utils/app_string.dart';

import '../database/coin_database/allcoin_list_model.dart';

class Service {
  final client = Dio();

  Future<List<AllCoinListModel>?> getCoinDataList(List<CoinImageModel>? image) async {
    try {
      final response = await client.get(AppString.urlCoinDataList,
          options: Options(headers: {
            AppString.coinApiKey: AppString.coinApiValue
          }));
      if (response.statusCode == 200) {
        return allCoinListModelFromJson(jsonEncode(response.data),image);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<List<CoinImageModel>?> getCoinImageList()async {
    try{
      final response = await client.get(AppString.coinImageList,options: Options(
        headers: {
          AppString.coinApiKey: AppString.coinApiValue
        }
      ));
      if(response.statusCode == 200){
        return coinImageModelFromJson(jsonEncode(response.data));
      }
    }
    catch(e){
      debugPrint(e.toString());
    }
    return null;
  }
}
