import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/post_model.dart';
part 'rest_client.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;
  //Now the methods
  @GET("/posts")
  Future<List<PostModel>> getPosts();
}
