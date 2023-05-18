import 'dart:convert';

BlogCategoriesResponseModel blogCategoriesResponseModelFromJson(String? str) =>
    BlogCategoriesResponseModel.fromJson(json.decode(str!));

String? blogCategoriesResponseModelToJson(BlogCategoriesResponseModel data) =>
    json.encode(data.toJson());

class BlogCategoriesResponseModel {
  List<BlogCategoriesModel>? data;

  BlogCategoriesResponseModel({
    this.data,
  });

  factory BlogCategoriesResponseModel.fromJson(Map<String?, dynamic> json) =>
      BlogCategoriesResponseModel(
        data: List<BlogCategoriesModel>.from(
            json["data"].map((x) => BlogCategoriesModel.fromJson(x))),
      );

  Map<String?, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class BlogCategoriesModel {
  int? id;
  int? parentId;
  String? name;
  String? slug;
  String? photo;
  int? order;
  bool? active;
  List<BlogCategoriesModel>? children;
  int? childrenCount;

  BlogCategoriesModel({
    this.id,
    this.parentId,
    this.name,
    this.slug,
    this.photo,
    this.order,
    this.active,
    this.children,
    this.childrenCount,
  });

  factory BlogCategoriesModel.fromJson(Map<String?, dynamic> json) =>
      BlogCategoriesModel(
        id: json["id"],
        parentId: json["parent_id"],
        name: json["name"],
        slug: json["slug"],
        photo: json["photo"],
        order: json["order"],
        active: json["active"],
        children: List<BlogCategoriesModel>.from(
            json["children"].map((x) => BlogCategoriesModel.fromJson(x))),
        childrenCount: json["children_count"],
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "parent_id": parentId,
        "name": name,
        "slug": slug,
        "photo": photo,
        "order": order,
        "active": active,
        "children": List<dynamic>.from(children!.map((x) => x.toJson())),
        "children_count": childrenCount,
      };
}
