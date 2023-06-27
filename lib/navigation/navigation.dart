import 'package:flutter/material.dart';

import '../value/navigation_map.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Retrofit"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        shrinkWrap: true,
        itemCount: navigation.length,
        itemBuilder: (context, index) => ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => navigation.values.elementAt(index),
              ),
            );
          },
          child: Text(
            navigation.keys.elementAt(index),
          ),
        ),
      ),
    );
  }
}
