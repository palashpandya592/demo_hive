// To parse this JSON data, do
//
//     final allCoinListModel = allCoinListModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_demo/database/coin_database/coin_image_model.dart';
part 'allcoin_list_model.g.dart';

List<AllCoinListModel> allCoinListModelFromJson(String str, List<CoinImageModel>? image,) => List<AllCoinListModel>.from(json.decode(str).map((x) => AllCoinListModel.fromJson(x,image)));

String allCoinListModelToJson(List<AllCoinListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 5)
class AllCoinListModel {
  AllCoinListModel({
    this.assetId,
    this.image,
    this.name,
    this.typeIsCrypto,
    this.dataQuoteStart,
    this.dataQuoteEnd,
    this.dataOrderbookStart,
    this.dataOrderbookEnd,
    this.dataTradeStart,
    this.dataTradeEnd,
    this.dataSymbolsCount,
    this.volume1HrsUsd,
    this.volume1DayUsd,
    this.volume1MthUsd,
    this.idIcon,
    this.dataStart,
    this.dataEnd,
    this.priceUsd,
  });

  @HiveField(0)
  String? assetId;

  @HiveField(1)
  String? name;

  @HiveField(2)
  int? typeIsCrypto;

  @HiveField(3)
  DateTime? dataQuoteStart;

  @HiveField(4)
  DateTime? dataQuoteEnd;

  @HiveField(5)
  DateTime? dataOrderbookStart;

  @HiveField(6)
  DateTime? dataOrderbookEnd;

  @HiveField(7)
  DateTime? dataTradeStart;

  @HiveField(8)
  DateTime? dataTradeEnd;

  @HiveField(9)
  int? dataSymbolsCount;

  @HiveField(10)
  num? volume1HrsUsd;

  @HiveField(11)
  num? volume1DayUsd;

  @HiveField(12)
  num? volume1MthUsd;

  @HiveField(13)
  String? idIcon;

  @HiveField(14)
  String? dataStart;

  @HiveField(15)
  String? dataEnd;

  @HiveField(16)
  num? priceUsd;

  @HiveField(17)
  String? image;

  factory AllCoinListModel.fromJson(Map<String, dynamic> json, List<CoinImageModel>? image) {

   return AllCoinListModel(
      image:"",
      assetId: json["asset_id"],
      name: json["name"],
      typeIsCrypto: json["type_is_crypto"],
      dataQuoteStart: json["data_quote_start"] == null ? null : DateTime.parse(json["data_quote_start"]),
      dataQuoteEnd: json["data_quote_end"] == null ? null : DateTime.parse(json["data_quote_end"]),
      dataOrderbookStart: json["data_orderbook_start"] == null ? null : DateTime.parse(json["data_orderbook_start"]),
      dataOrderbookEnd: json["data_orderbook_end"] == null ? null : DateTime.parse(json["data_orderbook_end"]),
      dataTradeStart: json["data_trade_start"] == null ? null : DateTime.parse(json["data_trade_start"]),
      dataTradeEnd: json["data_trade_end"] == null ? null : DateTime.parse(json["data_trade_end"]),
      dataSymbolsCount: json["data_symbols_count"],
      volume1HrsUsd: json["volume_1hrs_usd"],
      volume1DayUsd: json["volume_1day_usd"],
      volume1MthUsd: json["volume_1mth_usd"] ,
      idIcon: json["id_icon"],
      dataStart: json["data_start"],
      dataEnd: json["data_end"],
      priceUsd: json["price_usd"],
    );
  }

  Map<String, dynamic> toJson() => {
    "asset_id": assetId ,
    "name": name,
    "type_is_crypto": typeIsCrypto,
    "data_quote_start": dataQuoteStart == null ? null : dataQuoteStart!.toIso8601String(),
    "data_quote_end": dataQuoteEnd == null ? null : dataQuoteEnd!.toIso8601String(),
    "data_orderbook_start": dataOrderbookStart == null ? null : dataOrderbookStart!.toIso8601String(),
    "data_orderbook_end": dataOrderbookEnd == null ? null : dataOrderbookEnd!.toIso8601String(),
    "data_trade_start": dataTradeStart == null ? null : dataTradeStart!.toIso8601String(),
    "data_trade_end": dataTradeEnd == null ? null : dataTradeEnd!.toIso8601String(),
    "data_symbols_count": dataSymbolsCount ,
    "volume_1hrs_usd": volume1HrsUsd ,
    "volume_1day_usd": volume1DayUsd,
    "volume_1mth_usd": volume1MthUsd,
    "id_icon": idIcon,
    "data_start": dataStart,
    "data_end": dataEnd,
    "price_usd": priceUsd,
  };
}
