part of 'artist_bloc.dart';

@immutable
 abstract class ArtistState<T> extends Equatable {
  final T ? data;
  final String ? error;

  const ArtistState({this.data,this.error});

  @override
  List<Object?> get props => [data,error];

}

class ArtistInitializeState extends ArtistState {
 const ArtistInitializeState():super();
}



class ArtistLoadingState extends ArtistState {
   const ArtistLoadingState():super();
}

class ArtistDataSucessState extends ArtistState{
 const ArtistDataSucessState() : super();
}

class ArtistDataErrorState extends ArtistState{
ArtistDataErrorState(String error):super(error: error);
}

class GenreDataSucessState extends ArtistState{
 const GenreDataSucessState(List<Datum> data) : super(data: data);
}

class GenreDataErrorState extends ArtistState{
 GenreDataErrorState(String error):super(error: error);
}

class SearchLoadingState extends ArtistState{
 SearchLoadingState():super();
}

class SearchDataSucessState extends ArtistState{
 SearchDataSucessState():super();
}

class SearchDataErrorState extends ArtistState{
 SearchDataErrorState(String error):super(error: error);
}

class SongPlayState extends ArtistState{
 SongPlayState():super();
}

class PlayRecentSongState extends ArtistState{
 PlayRecentSongState():super();
}



