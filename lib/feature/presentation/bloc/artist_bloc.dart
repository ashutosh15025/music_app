import 'dart:collection';
import 'dart:io';
import 'package:ashe_music/feature/domain/model/genre_model.dart';
import 'package:ashe_music/feature/domain/usecase/get_artist_usecase.dart';
import 'package:ashe_music/feature/domain/usecase/get_genre_usecase.dart';
import 'package:ashe_music/feature/domain/usecase/get_search_usecase.dart';
import 'package:ashe_music/injection_container.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../constant/const.dart';
import '../../domain/model/search_model.dart';
import '../../domain/model/singers_model.dart';

part 'artist_event.dart';

part 'artist_state.dart';

class ArtistBloc extends Bloc<ArtistEvent, ArtistState> {
  String? error;
  List<Datum>? genre;
  List<SingerModel> artists = [];
  String ? search;
  SearchModel ? searchData;
  final List<SearchData> lastPlayed =  [];

  ArtistBloc() : super(const ArtistInitializeState()) {
    on<GenreLoadingEvent>(onGenreLoadingEvent);
    on<SearchLoadingEvent>(onSearchLoadingState);
    on<SongPlayEvent>(onSongPlayEvent);
  }
  void onSongPlayEvent(ArtistEvent event, Emitter<ArtistState> emit){
    emit(SongPlayState());
  }
  void onGenreLoadingEvent(ArtistEvent event, Emitter<ArtistState> emit) async {
    var httpResponse = await locator.get<GetGenreUseCase>().call();
    if (httpResponse.response.statusCode == HttpStatus.ok) {
      var response = httpResponse.data;
      genre = response.data;
      await callApi();
      emit(GenreDataSucessState(genre!));
    } else {
      emit(GenreDataErrorState(httpResponse.response.statusMessage.toString()));
    }
  }

  void onSearchLoadingState(ArtistEvent event, Emitter<ArtistState> emit) async{
    emit(SearchLoadingState());
    var httpResponse = await locator.get<GetSearchUseCase>().call(params:search!);
    if (httpResponse.response.statusCode == HttpStatus.ok) {
      print(httpResponse?.data.data.length.toString());
      searchData = null;
      searchData = httpResponse?.data;
      emit(SearchDataSucessState());
    } else {
      emit(SearchDataErrorState(httpResponse.response.statusMessage.toString()));
    }

  }

  Future<bool> callApi() async {
    await Future.forEach(artistId, (item) async {
      var artistResponse = await locator.get<GetArtistUseCase>().call(params: item);
      if (artistResponse.response.statusCode == HttpStatus.ok) {
        if (artistResponse.data != null) {
          artists.add(artistResponse.data);
          print(artists.length.toString());
        }
      }
    });
    return true;
  }
}
