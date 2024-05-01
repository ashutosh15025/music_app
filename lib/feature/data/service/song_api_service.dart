import 'package:ashe_music/feature/domain/model/genre_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';


import '../../../constant/const.dart';
import '../../domain/model/singers_model.dart';

part 'song_api_service.g.dart';

@RestApi(baseUrl: GENERE_URL)
abstract class SongApiServices {
  factory SongApiServices(Dio dio) = _SongApiServices;


  @GET("genre")
  Future<HttpResponse<GenreModel>> getGenre(
    @Header("X-RapidAPI-Key") String apiKey,
    @Header("X-RapidAPI-Host") String apiHost,
  );

}
