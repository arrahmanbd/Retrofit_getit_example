import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'services/rest_client.dart';

final sm = GetIt.instance;
void callSugerMummy() {
  sm.registerSingleton<RestClient>(
    RestClient(
      Dio(
        BaseOptions(contentType: 'application/json'),
      ),
    ),
  );

  //Register the object
}
