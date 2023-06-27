import 'package:api_fetching_using_retrofit/modal/album_modal.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('albums')
  Future<List<AlbumModal>> fetchAlbumAPI();

  @POST('/albums')
  Future<AlbumModal> sendModal(@Body() AlbumModal modal);

  @PUT('albums/{id}')
  Future<AlbumModal> putData(@Path('id') int id, @Body() AlbumModal modal);


  @PATCH('albums/{id}')
  Future<AlbumModal> patchData(@Path('id') int id, @Body() Map<String, dynamic> updatedModal);

  @DELETE('albums/{id}')
  Future<AlbumModal> deleteData(@Path('id') int id);
}

