// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
    List<SearchData> data;
    int total;
    String next;

    SearchModel({
        required this.data,
        required this.total,
        required this.next,
    });

    factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        data: List<SearchData>.from(json["data"].map((x) => SearchData.fromJson(x))),
        total: json["total"],
        next: json["next"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "total": total,
        "next": next,
    };
}

class SearchData {
    int id;
    bool readable;
    String title;
    String titleShort;
    String titleVersion;
    String link;
    int duration;
    int rank;
    bool explicitLyrics;
    int explicitContentLyrics;
    int explicitContentCover;
    String preview;
    String md5Image;
    Artist artist;
    Album album;
    SearchDataType type;

    SearchData({
        required this.id,
        required this.readable,
        required this.title,
        required this.titleShort,
        required this.titleVersion,
        required this.link,
        required this.duration,
        required this.rank,
        required this.explicitLyrics,
        required this.explicitContentLyrics,
        required this.explicitContentCover,
        required this.preview,
        required this.md5Image,
        required this.artist,
        required this.album,
        required this.type,
    });

    factory SearchData.fromJson(Map<String, dynamic> json) => SearchData(
        id: json["id"],
        readable: json["readable"],
        title: json["title"],
        titleShort: json["title_short"],
        titleVersion: json["title_version"],
        link: json["link"],
        duration: json["duration"],
        rank: json["rank"],
        explicitLyrics: json["explicit_lyrics"],
        explicitContentLyrics: json["explicit_content_lyrics"],
        explicitContentCover: json["explicit_content_cover"],
        preview: json["preview"],
        md5Image: json["md5_image"],
        artist: Artist.fromJson(json["artist"]),
        album: Album.fromJson(json["album"]),
        type: SearchDataTypeValues.map[json["type"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "readable": readable,
        "title": title,
        "title_short": titleShort,
        "title_version": titleVersion,
        "link": link,
        "duration": duration,
        "rank": rank,
        "explicit_lyrics": explicitLyrics,
        "explicit_content_lyrics": explicitContentLyrics,
        "explicit_content_cover": explicitContentCover,
        "preview": preview,
        "md5_image": md5Image,
        "artist": artist.toJson(),
        "album": album.toJson(),
        "type": SearchDataTypeValues.reverse[type],
    };
}

class Album {
    int id;
    String title;
    String cover;
    String coverSmall;
    String coverMedium;
    String coverBig;
    String coverXl;
    String md5Image;
    String tracklist;
    AlbumType type;

    Album({
        required this.id,
        required this.title,
        required this.cover,
        required this.coverSmall,
        required this.coverMedium,
        required this.coverBig,
        required this.coverXl,
        required this.md5Image,
        required this.tracklist,
        required this.type,
    });

    factory Album.fromJson(Map<String, dynamic> json) => Album(
        id: json["id"],
        title: json["title"],
        cover: json["cover"],
        coverSmall: json["cover_small"],
        coverMedium: json["cover_medium"],
        coverBig: json["cover_big"],
        coverXl: json["cover_xl"],
        md5Image: json["md5_image"],
        tracklist: json["tracklist"],
        type: albumTypeValues.map[json["type"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "cover": cover,
        "cover_small": coverSmall,
        "cover_medium": coverMedium,
        "cover_big": coverBig,
        "cover_xl": coverXl,
        "md5_image": md5Image,
        "tracklist": tracklist,
        "type": albumTypeValues.reverse[type],
    };
}

enum AlbumType {
    ALBUM
}

final albumTypeValues = EnumValues({
    "album": AlbumType.ALBUM
});

class Artist {
    int id;
    String name;
    String link;
    String picture;
    String pictureSmall;
    String pictureMedium;
    String pictureBig;
    String pictureXl;
    String tracklist;
    ArtistType type;

    Artist({
        required this.id,
        required this.name,
        required this.link,
        required this.picture,
        required this.pictureSmall,
        required this.pictureMedium,
        required this.pictureBig,
        required this.pictureXl,
        required this.tracklist,
        required this.type,
    });

    factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        id: json["id"],
        name: json["name"],
        link: json["link"],
        picture: json["picture"],
        pictureSmall: json["picture_small"],
        pictureMedium: json["picture_medium"],
        pictureBig: json["picture_big"],
        pictureXl: json["picture_xl"],
        tracklist: json["tracklist"],
        type: artistTypeValues.map[json["type"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "link": link,
        "picture": picture,
        "picture_small": pictureSmall,
        "picture_medium": pictureMedium,
        "picture_big": pictureBig,
        "picture_xl": pictureXl,
        "tracklist": tracklist,
        "type": artistTypeValues.reverse[type],
    };
}

enum ArtistType {
    ARTIST
}

final artistTypeValues = EnumValues({
    "artist": ArtistType.ARTIST
});

enum SearchDataType {
    TRACK
}

final SearchDataTypeValues = EnumValues({
    "track": SearchDataType.TRACK
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
