import 'dart:convert';

ArtistModel artistModelFromJson(String str) => ArtistModel.fromJson(json.decode(str));

String artistModelToJson(ArtistModel data) => json.encode(data.toJson());

class ArtistModel {
  int id;
  String name;
  String link;
  String share;
  String picture;
  String pictureSmall;
  String pictureMedium;
  String pictureBig;
  String pictureXl;
  int nbAlbum;
  int nbFan;
  bool radio;
  String tracklist;
  String type;

  ArtistModel({
    required this.id,
    required this.name,
    required this.link,
    required this.share,
    required this.picture,
    required this.pictureSmall,
    required this.pictureMedium,
    required this.pictureBig,
    required this.pictureXl,
    required this.nbAlbum,
    required this.nbFan,
    required this.radio,
    required this.tracklist,
    required this.type,
  });

  factory ArtistModel.fromJson(Map<String, dynamic> json) => ArtistModel(
    id: json["id"],
    name: json["name"],
    link: json["link"],
    share: json["share"],
    picture: json["picture"],
    pictureSmall: json["picture_small"],
    pictureMedium: json["picture_medium"],
    pictureBig: json["picture_big"],
    pictureXl: json["picture_xl"],
    nbAlbum: json["nb_album"],
    nbFan: json["nb_fan"],
    radio: json["radio"],
    tracklist: json["tracklist"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "link": link,
    "share": share,
    "picture": picture,
    "picture_small": pictureSmall,
    "picture_medium": pictureMedium,
    "picture_big": pictureBig,
    "picture_xl": pictureXl,
    "nb_album": nbAlbum,
    "nb_fan": nbFan,
    "radio": radio,
    "tracklist": tracklist,
    "type": type,
  };
}
