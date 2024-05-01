// To parse this JSON data, do
//
//     final genreModel = genreModelFromJson(jsonString);

import 'dart:convert';

GenreModel genreModelFromJson(String str) => GenreModel.fromJson(json.decode(str));

String genreModelToJson(GenreModel data) => json.encode(data.toJson());

class GenreModel {
    List<Datum> data;

    GenreModel({
        required this.data,
    });

    factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String name;
    String picture;
    String pictureSmall;
    String pictureMedium;
    String pictureBig;
    String pictureXl;
    Type type;

    Datum({
        required this.id,
        required this.name,
        required this.picture,
        required this.pictureSmall,
        required this.pictureMedium,
        required this.pictureBig,
        required this.pictureXl,
        required this.type,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        picture: json["picture"],
        pictureSmall: json["picture_small"],
        pictureMedium: json["picture_medium"],
        pictureBig: json["picture_big"],
        pictureXl: json["picture_xl"],
        type: typeValues.map[json["type"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "picture": picture,
        "picture_small": pictureSmall,
        "picture_medium": pictureMedium,
        "picture_big": pictureBig,
        "picture_xl": pictureXl,
        "type": typeValues.reverse[type],
    };
}

enum Type {
    GENRE
}

final typeValues = EnumValues({
    "genre": Type.GENRE
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
