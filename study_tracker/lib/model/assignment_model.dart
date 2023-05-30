// To parse this JSON data, do
//
//     final assignment = assignmentFromJson(jsonString);

import 'dart:convert';

List<Assignment> assignmentFromJson(String str) => List<Assignment>.from(json.decode(str).map((x) => Assignment.fromJson(x)));

String assignmentToJson(List<Assignment> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Assignment {
    String model;
    int pk;
    Fields fields;

    Assignment({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Assignment.fromJson(Map<String, dynamic> json) => Assignment(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    String name;
    String subject;
    DateTime date;
    int progress;
    String description;

    Fields({
        required this.name,
        required this.subject,
        required this.date,
        required this.progress,
        required this.description,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        subject: json["subject"],
        date: DateTime.parse(json["date"]),
        progress: json["progress"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "subject": subject,
        "date": date.toIso8601String(),
        "progress": progress,
        "description": description,
    };
}