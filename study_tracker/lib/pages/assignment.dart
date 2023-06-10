import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:study_tracker/model/assignment_model.dart';
import 'package:study_tracker/pages/assignment_content.dart';
import '../widgets/drawer.dart';

class AssignmentPage extends StatefulWidget {
  const AssignmentPage({Key? key}) : super(key: key);

  @override
  _AssignmentPageState createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<AssignmentPage> {
  Future<List<Assignment>> fetchAssignment() async {
    var url = Uri.parse('http://127.0.0.1:8000/study-tracker/json/');
    var client = http.Client();
    var response = await client.get(url, headers: {
      "Content-Type": "application/json",
    });

    if (response.statusCode == 200) {
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      List<Assignment> listAssignment = [];
      for (var d in data) {
        if (d != null) {
          listAssignment.add(Assignment.fromJson(d));
        }
      }
      client.close(); // Close the client after use
      return listAssignment;
    } else {
      client.close(); // Close the client in case of an error
      throw Exception('Failed to fetch assignments');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas'),
      ),
      drawer: const DrawerMenu(),
      body: FutureBuilder(
        future: fetchAssignment(),
        builder: (context, AsyncSnapshot<List<Assignment>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to fetch assignments'));
          } else if (snapshot.data == null || snapshot.data!.isEmpty) {
            return Column(
              children: const [
                Text(
                  "Tidak ada data tugas.",
                  style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                ),
                SizedBox(height: 8),
              ],
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) => InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailPage(pk: snapshot.data![index].pk),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: snapshot.data![index].fields.progress > 50
                            ? Colors.blueAccent
                            : Colors.red,
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${snapshot.data![index].fields.name}",
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.subject}"),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
