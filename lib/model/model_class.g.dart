// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_class.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelClassAdapter extends TypeAdapter<ModelClass> {
  @override
  final int typeId = 0;

  @override
  ModelClass read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelClass(
      categoryName: fields[0] as String?,
      descriptionName: fields[1] as String?,
      walletName: fields[2] as String?,
      moneyAmmount: fields[3] as String?,
      timestamp: fields[4] as Timestamp?,
    );
  }

  @override
  void write(BinaryWriter writer, ModelClass obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.categoryName)
      ..writeByte(1)
      ..write(obj.descriptionName)
      ..writeByte(2)
      ..write(obj.walletName)
      ..writeByte(3)
      ..write(obj.moneyAmmount)
      ..writeByte(4)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ModelClass1Adapter extends TypeAdapter<ModelClass1> {
  @override
  final int typeId = 1;

  @override
  ModelClass1 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelClass1(
      categoryName: fields[0] as String,
      descriptionName: fields[1] as String,
      walletName: fields[2] as String,
      moneyAmmount: fields[3] as String,
      time: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ModelClass1 obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.categoryName)
      ..writeByte(1)
      ..write(obj.descriptionName)
      ..writeByte(2)
      ..write(obj.walletName)
      ..writeByte(3)
      ..write(obj.moneyAmmount)
      ..writeByte(4)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelClass1Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
