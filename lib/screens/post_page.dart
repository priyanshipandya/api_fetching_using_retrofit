import 'package:api_fetching_using_retrofit/modal/album_modal.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../services/api_services.dart';
import 'error_page.dart';

class PostRequestpage extends StatefulWidget {
  const PostRequestpage({Key? key}) : super(key: key);

  @override
  State<PostRequestpage> createState() => _PostRequestpageState();
}

class _PostRequestpageState extends State<PostRequestpage> {

  @override
  void initState() {
    super.initState();
  }
  

  Future<AlbumModal> createAlbumModal() async {
    final restClient = RestClient(Dio(BaseOptions(contentType: "application/json",)));
    final modalData = AlbumModal(title: "Hello World", id: 501, userId: 5);
    try{
     final response = await restClient.sendModal(modalData);
      print('Sent successfully');
      print("Title: ${response.title}");
      print("Id: ${response.id}");
      print("UserId: ${response.userId}");
      return response;
    }
    catch(e){
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(onPressed: () {
            createAlbumModal();
          }, child: Text("Post")),
        ),
      ),
    );
  }
}
