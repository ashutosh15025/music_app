
import 'package:ashe_music/feature/domain/model/genre_model.dart';
import 'package:ashe_music/feature/domain/repository/artist_repository.dart';
import 'package:ashe_music/feature/domain/usecase/usecase.dart';
import 'package:retrofit/dio.dart';

class GetGenreUseCase implements UseCase<GenreModel,void>{
  final ArtistRepository _artistRepository;
  GetGenreUseCase(this._artistRepository);
  @override
  Future<HttpResponse<GenreModel>> call({void params}) {
   return _artistRepository.getGenre();
  }

}