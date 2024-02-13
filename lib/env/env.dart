import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField()
  static const String FIREBASEAPI_ANDROID = _Env.FIREBASEAPI_ANDROID;
  @EnviedField()
  static const String FIREBASEAPI_IOS = _Env.FIREBASEAPI_IOS;
}
