import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

import '../../../constant/const.dart';
import '../../domain/model/search_model.dart';
import '../../domain/model/singers_model.dart';
part 'deezer_api_service.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class DeezerApiService {
  factory DeezerApiService(Dio dio) = _DeezerApiService;

  @GET("search")
  Future<HttpResponse<SearchModel>> getSearch(
    @Query("q") String searchParameter,
    @Header("X-RapidAPI-Key") String apiKey,
    @Header("X-RapidAPI-Host") String apiHost,
  );

  @GET("artist/{id}")
  Future<HttpResponse<SingerModel>> getArtist(
    @Path("id") String id,
    @Header("X-RapidAPI-Key") String apiKey,
    @Header("X-RapidAPI-Host") String apiHost,
  );
}
