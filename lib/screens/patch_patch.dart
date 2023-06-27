import 'package:api_fetching_using_retrofit/modal/album_modal.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../services/api_services.dart';

class PatchRequestpagee extends StatefulWidget {
  const PatchRequestpagee({Key? key}) : super(key: key);

  @override
  State<PatchRequestpagee> createState() => _PatchRequestpageeState();
}

class _PatchRequestpageeState extends State<PatchRequestpagee> {
  @override
  void initState() {
    super.initState();
  }

  Future<AlbumModal> updateData(newId, newTitle) async {
    final restClient = RestClient(Dio());
    final modalData =  {'title': newTitle};
    try {
      final response = await restClient.patchData(newId, modalData);
      print("successfully updated Data using Patch");
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
              updateData(5, "I am updated patch");
            },
            child: const Text("Update Data using Patch"),
          ),
        ),
      ),
    );
  }
}
