
import 'package:ashe_music/constant/const.dart';
import 'package:ashe_music/feature/domain/model/artistModel.dart';
import 'package:ashe_music/feature/domain/model/genre_model.dart';
import 'package:ashe_music/feature/domain/model/search_model.dart';
import 'package:ashe_music/feature/domain/model/singers_model.dart';
import 'package:ashe_music/feature/domain/repository/artist_repository.dart';
import 'package:retrofit/dio.dart';

import '../service/deezer_api_service.dart';
import '../service/song_api_service.dart';

class ArtistRepositoryImp extends ArtistRepository{
  final SongApiServices _songApiServices;
  final DeezerApiService _deezerApiService;

  ArtistRepositoryImp(this._songApiServices,this._deezerApiService);

  @override
  Future<HttpResponse<SingerModel>> getArtists() async {
   return await _deezerApiService.getArtist("eminem", API_KEY,HOST_KEY);
  }

  @override
  Future<HttpResponse<GenreModel>> getGenre() async{
  return _songApiServices.getGenre(API_KEY, HOST_KEY);
  }

  @override
  Future<HttpResponse<SingerModel>> getArtist(String id) async {
    return await _deezerApiService.getArtist(id, API_KEY,HOST_KEY);
  }

  @override
  Future<HttpResponse<SearchModel>> getSearch(String params) async{
    return await _deezerApiService.getSearch(params, API_KEY,HOST_KEY);

  }

}