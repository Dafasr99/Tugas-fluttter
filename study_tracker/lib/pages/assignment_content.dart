import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:study_tracker/model/assignment_model.dart';
import 'package:http/http.dart' as http;
import 'package:study_tracker/pages/assignment.dart';
import 'package:study_tracker/widgets/drawer.dart';

class DetailPage extends StatefulWidget {
  final int pk;

  DetailPage({required this.pk});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Future<List<Assignment>> fetchDetail() async {
    final int pk = widget.pk;
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    var url = Uri.parse(
        'https://webbed-energy-zoa.domcloud.io/tracker/json/${pk}');
    var response = await http.get(
        url,
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
        },
    );
    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Assignment
    List<Assignment> listAssignment = [];
    for (var d in data) {
        if (d != null) {
            listAssignment.add(Assignment.fromJson(d));
        }
    }
    return listAssignment;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas'),
      ),
      drawer: const DrawerMenu(),
      body: FutureBuilder(
        future: fetchDetail(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                  children: const [
                  Text(
                      "Tidak ada data tugas.",
                      style:
                          TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                  ),
                  SizedBox(height: 8),
                  ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(20.0),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(
                          "${snapshot.data![index].fields.name}",
                          style: const TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black, // Set the desired text color
                              ),
                              children: [
                                TextSpan(
                                  text: 'Mata kuliah: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: snapshot.data![index].fields.subject,
                                ),
                              ],
                            ),
                          ),
                        ), 
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black, // Set the desired text color
                              ),
                              children: [
                                TextSpan(
                                  text: 'Tanggal: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: snapshot.data![index].fields.date.toString(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black, // Set the desired text color
                              ),
                              children: [
                                TextSpan(
                                  text: 'Progress: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: "${snapshot.data![index].fields.progress.toString()}%",
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black, // Set the desired text color
                              ),
                              children: [
                                TextSpan(
                                  text: 'Deskripsi: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: snapshot.data![index].fields.description,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const AssignmentPage()),
                            );
                          }, child: const Text('Kembali'),
                        )
                      ]
                    ),
                  )
                )
              );
            }
          }
        }
      )
    );
  }
}