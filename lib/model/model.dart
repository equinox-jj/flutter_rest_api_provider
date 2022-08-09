import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class Response {
  String? title;
  String? body;

  Response({this.title, this.body});

  // @override
  // String toString() {
  //   return 'Model(title: $title, body: $body)';
  // }

  factory Response.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);

  Map<String, dynamic> toJson() => _$ModelToJson(this);

  Response copyWith({
    String? title,
    String? body,
  }) {
    return Response(
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}
