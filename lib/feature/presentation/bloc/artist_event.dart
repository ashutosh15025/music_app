part of 'artist_bloc.dart';

@immutable
abstract class ArtistEvent {}

class ArtistInitializeEvent extends ArtistEvent{}

class ArtistDataSucessEvent extends ArtistEvent{}

class ArtistLoadingEvent extends ArtistEvent{}

class ArtistsDataSucessEvent extends ArtistEvent{}

class GenreLoadingEvent extends ArtistEvent{}

class SearchLoadingEvent extends ArtistEvent{}

class SearchDataSuccessEvent extends ArtistEvent{}

class SongPlayEvent extends ArtistEvent{}



