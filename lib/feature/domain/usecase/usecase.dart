
import 'package:retrofit/retrofit.dart';

abstract class UseCase<Type,Params> {
  Future<HttpResponse<Type>> call({Params params});
}