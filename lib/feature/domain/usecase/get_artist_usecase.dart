import 'package:ashe_music/feature/domain/model/artistModel.dart';
import 'package:ashe_music/feature/domain/model/singers_model.dart';
import 'package:ashe_music/feature/domain/repository/artist_repository.dart';
import 'package:ashe_music/feature/domain/usecase/usecase.dart';
import 'package:retrofit/dio.dart';


class GetArtistUseCase  implements UseCase<SingerModel,String>{
  final ArtistRepository _artistRepository;
  GetArtistUseCase(this._artistRepository);

  @override
  Future<HttpResponse<SingerModel>> call({String params="0"}) {
    return _artistRepository.getArtist(params);
  }





}

