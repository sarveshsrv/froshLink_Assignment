import 'dart:convert';
import 'package:flutter/material.dart';
import 'model_class.dart';
import 'package:http/http.dart' as http;

class FetchData extends StatefulWidget {
  @override
  _MainFetchDataState createState() => _MainFetchDataState();
}

class _MainFetchDataState extends State<FetchData> {
  List<Photo> list = List.empty();
  var isLoading = false;

  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    if (response.statusCode == 200) {
      list = (json.decode(response.body) as List)
          .map((data) => new Photo.fromJson(data))
          .toList();
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load photos and other data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Fetch Data Using REST API"),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          child: Text("Fetch Data"),
          style: ElevatedButton.styleFrom(
            primary: Colors.teal,
          ),
          onPressed: _fetchData,
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.teal,
              ),
            )
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shadowColor: Colors.red[900],
                  color: Colors.blue[50],
                  child: ListTile(
                    hoverColor: Colors.red,
                    selectedTileColor: Colors.red,
                    contentPadding: EdgeInsets.all(10.0),
                    title: Text(list[index].title),
                    trailing: Image.network(
                      list[index].thumbnailUrl,
                      fit: BoxFit.cover,
                      height: 40.0,
                      width: 40.0,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
