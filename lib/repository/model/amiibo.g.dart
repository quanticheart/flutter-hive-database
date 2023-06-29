// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amiibo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AmiiboAdapter extends TypeAdapter<Amiibo> {
  @override
  final int typeId = 0;

  @override
  Amiibo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Amiibo(
      amiiboSeries: fields[0] as String?,
      character: fields[1] as String?,
      gameSeries: fields[2] as String?,
      head: fields[3] as String?,
      image: fields[4] as String?,
      name: fields[5] as String?,
      release: fields[6] as Release?,
      tail: fields[7] as String?,
      type: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Amiibo obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.amiiboSeries)
      ..writeByte(1)
      ..write(obj.character)
      ..writeByte(2)
      ..write(obj.gameSeries)
      ..writeByte(3)
      ..write(obj.head)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.release)
      ..writeByte(7)
      ..write(obj.tail)
      ..writeByte(8)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AmiiboAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ReleaseAdapter extends TypeAdapter<Release> {
  @override
  final int typeId = 1;

  @override
  Release read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Release(
      au: fields[0] as DateTime?,
      eu: fields[1] as DateTime?,
      jp: fields[2] as DateTime?,
      na: fields[3] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Release obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.au)
      ..writeByte(1)
      ..write(obj.eu)
      ..writeByte(2)
      ..write(obj.jp)
      ..writeByte(3)
      ..write(obj.na);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReleaseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AmiiboDetailsAdapter extends TypeAdapter<AmiiboDetails> {
  @override
  final int typeId = 0;

  @override
  AmiiboDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AmiiboDetails(
      amiibo: fields[0] as Amiibo?,
    );
  }

  @override
  void write(BinaryWriter writer, AmiiboDetails obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.amiibo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AmiiboDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AmiiboListAdapter extends TypeAdapter<AmiiboList> {
  @override
  final int typeId = 0;

  @override
  AmiiboList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AmiiboList(
      amiibo: (fields[0] as List).cast<Amiibo>(),
    );
  }

  @override
  void write(BinaryWriter writer, AmiiboList obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.amiibo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AmiiboListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
