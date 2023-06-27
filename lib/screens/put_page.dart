import 'package:api_fetching_using_retrofit/modal/album_modal.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../services/api_services.dart';

class PutRequestpage extends StatefulWidget {
  const PutRequestpage({Key? key}) : super(key: key);

  @override
  State<PutRequestpage> createState() => _PutRequestpageState();
}

class _PutRequestpageState extends State<PutRequestpage> {
  @override
  void initState() {
    super.initState();
  }

  Future<AlbumModal> updateData(newId, newUserId, newTitle) async {
    final restClient = RestClient(Dio());
    final modalData =  AlbumModal(id: newId, userId: newUserId, title: newTitle);
    try {
      final response = await restClient.putData(newId, modalData);
      print("successfully updated");
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
        title: const Text("Put"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              updateData(5, 505, "I am updated");
            },
            child: const Text("Update Data"),
          ),
        ),
      ),
    );
  }
}
