import 'package:api_fetching_using_retrofit/modal/album_modal.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../services/api_services.dart';
import 'error_page.dart';

class GetRequestpage extends StatefulWidget {
  const GetRequestpage({Key? key}) : super(key: key);

  @override
  State<GetRequestpage> createState() => _GetRequestpageState();
}

class _GetRequestpageState extends State<GetRequestpage> {
  TextEditingController textController = TextEditingController();

  // late Future getAlbum;

  @override
  void initState() {
    // getAlbum = fetchAlbumAPI();
    super.initState();
  }

  FutureBuilder<List<AlbumModal>> _buildBody(context) {
   try{
     final client = RestClient(
       Dio(
         BaseOptions(contentType: "application/json"),
       ),
     );

    return FutureBuilder<List<AlbumModal>>(
      future: client.fetchAlbumAPI(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data);
          return ListView.builder(
            itemBuilder: (context, index) => ListTile(
              title: Text(snapshot.data?[index].title ?? ""),
            ),
          );
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return const ErrorPage();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
   }catch(e){
      throw Exception(e);
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: _buildBody(context),
      ),
    );
  }
}
