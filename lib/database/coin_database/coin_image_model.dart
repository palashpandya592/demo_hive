// To parse this JSON data, do
//
//     final coinImageModel = coinImageModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';
part 'coin_image_model.g.dart';

List<CoinImageModel> coinImageModelFromJson(String str) => List<CoinImageModel>.from(json.decode(str).map((x) => CoinImageModel.fromJson(x)));

String coinImageModelToJson(List<CoinImageModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 6)
class CoinImageModel {
  CoinImageModel({
    this.assetId,
    this.url,
  });

  @HiveField(0)
  String? assetId;

  @HiveField(1)
  String? url;

  factory CoinImageModel.fromJson(Map<String, dynamic> json) => CoinImageModel(
    assetId: json["asset_id"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "asset_id": assetId,
    "url": url,
  };
}
