import 'package:ashe_music/feature/data/service/song_api_service.dart';
import 'package:ashe_music/feature/domain/usecase/get_genre_usecase.dart';
import 'package:ashe_music/feature/domain/usecase/get_search_usecase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'feature/data/repository/artist_repository_Imp.dart';
import 'feature/data/service/deezer_api_service.dart';
import 'feature/domain/repository/artist_repository.dart';
import 'feature/domain/usecase/get_artist_usecase.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async{
  locator.registerSingleton<Dio>(Dio());
  locator.registerSingleton<SongApiServices>(SongApiServices(locator()));
  locator.registerSingleton<DeezerApiService>(DeezerApiService(locator()));
  locator.registerSingleton<ArtistRepository>(ArtistRepositoryImp(locator(),locator()));
  locator.registerSingleton<GetArtistUseCase>(GetArtistUseCase(locator()));
  locator.registerSingleton<GetGenreUseCase>(GetGenreUseCase(locator()));
  locator.registerSingleton<GetSearchUseCase>(GetSearchUseCase(locator()));



}