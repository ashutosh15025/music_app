  import 'package:ashe_music/feature/domain/model/search_model.dart';
import 'package:ashe_music/feature/domain/usecase/usecase.dart';
import 'package:retrofit/dio.dart';

import '../repository/artist_repository.dart';

class GetSearchUseCase extends UseCase<SearchModel,String>{
  final ArtistRepository _artistRepository;
  GetSearchUseCase(this._artistRepository);
  @override
  Future<HttpResponse<SearchModel>> call({ String? params}) {
    if(params==null)
      params = "all";
    print(params+"hi");
    var result =  _artistRepository.getSearch(params!);
    print("$params alll ${result.then((value) => value.data.data.length)}");
    return result;

  }

}