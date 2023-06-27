import 'package:json_annotation/json_annotation.dart';
part 'album_modal.g.dart';

@JsonSerializable()
class AlbumModal {
  int? userId;
  int? id;
  String? title;

  AlbumModal({this.userId, this.id, this.title});

  factory AlbumModal.fromJson(Map<String, dynamic> json) => _$AlbumModalFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumModalToJson(this);
}