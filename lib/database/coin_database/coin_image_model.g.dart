// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_image_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoinImageModelAdapter extends TypeAdapter<CoinImageModel> {
  @override
  final int typeId = 6;

  @override
  CoinImageModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoinImageModel(
      assetId: fields[0] as String?,
      url: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CoinImageModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.assetId)
      ..writeByte(1)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoinImageModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
