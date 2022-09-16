// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allcoin_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AllCoinListModelAdapter extends TypeAdapter<AllCoinListModel> {
  @override
  final int typeId = 5;

  @override
  AllCoinListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AllCoinListModel(
      assetId: fields[0] as String?,
      name: fields[1] as String?,
      typeIsCrypto: fields[2] as int?,
      dataQuoteStart: fields[3] as DateTime?,
      dataQuoteEnd: fields[4] as DateTime?,
      dataOrderbookStart: fields[5] as DateTime?,
      dataOrderbookEnd: fields[6] as DateTime?,
      dataTradeStart: fields[7] as DateTime?,
      dataTradeEnd: fields[8] as DateTime?,
      dataSymbolsCount: fields[9] as int?,
      volume1HrsUsd: fields[10] as num?,
      volume1DayUsd: fields[11] as num?,
      volume1MthUsd: fields[12] as num?,
      idIcon: fields[13] as String?,
      dataStart: fields[14] as String?,
      dataEnd: fields[15] as String?,
      priceUsd: fields[16] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, AllCoinListModel obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.assetId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.typeIsCrypto)
      ..writeByte(3)
      ..write(obj.dataQuoteStart)
      ..writeByte(4)
      ..write(obj.dataQuoteEnd)
      ..writeByte(5)
      ..write(obj.dataOrderbookStart)
      ..writeByte(6)
      ..write(obj.dataOrderbookEnd)
      ..writeByte(7)
      ..write(obj.dataTradeStart)
      ..writeByte(8)
      ..write(obj.dataTradeEnd)
      ..writeByte(9)
      ..write(obj.dataSymbolsCount)
      ..writeByte(10)
      ..write(obj.volume1HrsUsd)
      ..writeByte(11)
      ..write(obj.volume1DayUsd)
      ..writeByte(12)
      ..write(obj.volume1MthUsd)
      ..writeByte(13)
      ..write(obj.idIcon)
      ..writeByte(14)
      ..write(obj.dataStart)
      ..writeByte(15)
      ..write(obj.dataEnd)
      ..writeByte(16)
      ..write(obj.priceUsd);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllCoinListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
