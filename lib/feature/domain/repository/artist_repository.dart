
import 'package:ashe_music/feature/domain/model/genre_model.dart';
import 'package:ashe_music/feature/domain/model/search_model.dart';
import 'package:ashe_music/feature/domain/model/singers_model.dart';
import 'package:retrofit/dio.dart';

import '../model/artistModel.dart';

abstract class ArtistRepository{
  Future<HttpResponse<GenreModel>>  getGenre();
  Future<HttpResponse<SingerModel>>  getArtist(String id);
  Future<HttpResponse<SearchModel>>  getSearch(String params);

}