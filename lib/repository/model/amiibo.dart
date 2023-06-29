import 'dart:convert';

import 'package:hive/hive.dart';

part 'amiibo.g.dart';

@HiveType(typeId: 0)
class Amiibo extends HiveObject {
  @HiveField(0)
  String? amiiboSeries;

  @HiveField(1)
  String? character;

  @HiveField(2)
  String? gameSeries;

  @HiveField(3)
  String? head;

  @HiveField(4)
  String? image;

  @HiveField(5)
  String? name;

  @HiveField(6)
  Release? release;

  @HiveField(7)
  String? tail;

  @HiveField(8)
  String? type;

  @override
  String toString() {
    return 'Amiibo{amiiboSeries: $amiiboSeries, character: $character, gameSeries: $gameSeries, head: $head, image: $image, name: $name, release: $release, tail: $tail, type: $type}';
  }

  Amiibo({
    this.amiiboSeries,
    this.character,
    this.gameSeries,
    this.head,
    this.image,
    this.name,
    this.release,
    this.tail,
    this.type,
  });

  factory Amiibo.fromJson(String str) => Amiibo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Amiibo.fromMap(Map<String, dynamic> json) =>
      Amiibo(
        amiiboSeries: json["amiiboSeries"],
        character: json["character"],
        gameSeries: json["gameSeries"],
        head: json["head"],
        image: json["image"],
        name: json["name"],
        release: Release.fromMap(json["release"]),
        tail: json["tail"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() =>
      {
        "amiiboSeries": amiiboSeries,
        "character": character,
        "gameSeries": gameSeries,
        "head": head,
        "image": image,
        "name": name,
        "release": release?.toMap(),
        "tail": tail,
        "type": type,
      };

  Amiibo get copy {
    final objectInstance = Amiibo();
    objectInstance.amiiboSeries = amiiboSeries;
    objectInstance.character = character;
    objectInstance.gameSeries = gameSeries;
    objectInstance.head = head;
    objectInstance.image = image;
    objectInstance.name = name;
    objectInstance.release = release;
    objectInstance.tail = tail;
    objectInstance.type = type;
    return objectInstance;
  }
}

@HiveType(typeId: 1)
class Release extends HiveObject {
  @HiveField(0)
  DateTime? au;
  @HiveField(1)
  DateTime? eu;
  @HiveField(2)
  DateTime? jp;
  @HiveField(3)
  DateTime? na;

  @override
  String toString() {
    return 'Release{au: $au, eu: $eu, jp: $jp, na: $na}';
  }

  Release({
    required this.au,
    required this.eu,
    required this.jp,
    required this.na,
  });

  factory Release.fromJson(String str) => Release.fromJson(json.decode(str));

  String toJson() => json.encode(toJson());

  factory Release.fromMap(Map<String, dynamic> json) =>
      Release(
        au: json["au"] == null ? null : DateTime.parse(json["au"]),
        eu: json["eu"] == null ? null : DateTime.parse(json["eu"]),
        jp: json["jp"] == null ? null : DateTime.parse(json["jp"]),
        na: json["na"] == null ? null : DateTime.parse(json["na"]),
      );

  Map<String, dynamic> toMap() =>
      {
        "au":
        "${au?.year.toString().padLeft(4, '0')}-${au?.month.toString().padLeft(
            2, '0')}-${au?.day.toString().padLeft(2, '0')}",
        "eu":
        "${eu?.year.toString().padLeft(4, '0')}-${eu?.month.toString().padLeft(
            2, '0')}-${eu?.day.toString().padLeft(2, '0')}",
        "jp":
        "${jp?.year.toString().padLeft(4, '0')}-${jp?.month.toString().padLeft(
            2, '0')}-${jp?.day.toString().padLeft(2, '0')}",
        "na":
        "${na?.year.toString().padLeft(4, '0')}-${na?.month.toString().padLeft(
            2, '0')}-${na?.day.toString().padLeft(2, '0')}",
      };
}

@HiveType(typeId: 0)
class AmiiboDetails extends HiveObject {
  @HiveField(0)
  Amiibo? amiibo;

  AmiiboDetails({
    this.amiibo,
  });

  factory AmiiboDetails.fromJson(String str) =>
      AmiiboDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AmiiboDetails.fromMap(Map<String, dynamic> json) =>
      AmiiboDetails(
        amiibo: Amiibo.fromMap(json["amiibo"]),
      );

  Map<String, dynamic> toMap() =>
      {
        "amiibo": amiibo?.toMap(),
      };
}

@HiveType(typeId: 0)
class AmiiboList extends HiveObject {
  @HiveField(0)
  List<Amiibo> amiibo;

  @override
  String toString() {
    return 'AmiiboList{amiibo: $amiibo}';
  }

  AmiiboList({
    required this.amiibo,
  });

  factory AmiiboList.fromJson(String str) =>
      AmiiboList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AmiiboList.fromMap(Map<String, dynamic> json) =>
      AmiiboList(
        amiibo: List<Amiibo>.from(json["amiibo"].map((x) => Amiibo.fromMap(x))),
      );

  Map<String, dynamic> toMap() =>
      {
        "amiibo": List<dynamic>.from(amiibo.map((x) => x.toMap())),
      };
}
