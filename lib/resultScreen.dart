import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final List<String> results;

  ResultScreen({required this.results});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prediction Result"),
      ),
      body: results.isEmpty
          ? Center(
              child: Text(
                "No predictions available",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(results[index]),
                  leading: Icon(
                      Icons.medication), // Optional: Icon for visual appeal
                );
              },
            ),
    );
  }
}
