import 'package:api_fetching_using_retrofit/modal/album_modal.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../services/api_services.dart';

class DeleteRequestpage extends StatefulWidget {
  const DeleteRequestpage({Key? key}) : super(key: key);

  @override
  State<DeleteRequestpage> createState() => _DeleteRequestpageState();
}

class _DeleteRequestpageState extends State<DeleteRequestpage> {
  @override
  void initState() {
    super.initState();
  }

  Future<AlbumModal> updateData(newId) async {
    final restClient = RestClient(Dio());
    try {
      final response = await restClient.deleteData(newId);
      print("Hoooorrrrayyyyyyy, deleted successfully");
      print(response);
      print(response.title);
      print(response.id);
      print(response.userId);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Patch"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              updateData(5);
            },
            child: const Text("Update Data using Patch"),
          ),
        ),
      ),
    );
  }
}
