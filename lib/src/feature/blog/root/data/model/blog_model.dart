import 'dart:convert';

BlogResponseModel blogResponseModelFromJson(String? str) =>
    BlogResponseModel.fromJson(json.decode(str!));

String? blogResponseModelToJson(BlogResponseModel data) =>
    json.encode(data.toJson());

class BlogResponseModel {
  List<BlogModel>? data;

  BlogResponseModel({
    this.data,
  });

  factory BlogResponseModel.fromJson(Map<String?, dynamic> json) =>
      BlogResponseModel(
        data: List<BlogModel>.from(
            json["data"].map((x) => BlogModel.fromJson(x))),
      );

  Map<String?, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class BlogModel {
  int? id;
  int? userId;
  dynamic approvedBy;
  String? title;
  String? subtitle;
  String? slug;
  String? body;
  String? photo;
  String? video;
  int? order;
  bool? active;
  bool? featured;
  DateTime? createdAt;
  int? likeCount;
  int? commentCount;
  bool? liked;
  List<dynamic>? likes;

  List<Comment>? comments;
  User? user;

  BlogModel({
    this.id,
    this.userId,
    this.approvedBy,
    this.title,
    this.subtitle,
    this.slug,
    this.body,
    this.photo,
    this.video,
    this.order,
    this.active,
    this.featured,
    this.createdAt,
    this.likeCount,
    this.commentCount,
    this.liked,
    this.likes,
    this.comments,
    this.user,
  });

  factory BlogModel.fromJson(Map<String?, dynamic> json) => BlogModel(
        id: json["id"],
        userId: json["user_id"],
        approvedBy: json["approved_by"],
        title: json["title"],
        subtitle: json["subtitle"],
        slug: json["slug"],
        body: json["body"],
        photo: json["photo"],
        video: json["video"],
        order: json["order"],
        active: json["active"],
        featured: json["featured"],
        createdAt: DateTime.parse(json["created_at"]),
        likeCount: json["like_count"],
        commentCount: json["comment_count"],
        liked: json["liked"],
        likes: List<dynamic>.from(json["likes"].map((x) => x)),
        comments: List<Comment>.from(
            json["comments"].map((x) => Comment.fromJson(x))),
        user: User.fromJson(json["user"]),
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "approved_by": approvedBy,
        "title": title,
        "subtitle": subtitle,
        "slug": slug,
        "body": body,
        "photo": photo,
        "video": video,
        "order": order,
        "active": active,
        "featured": featured,
        "created_at": createdAt!.toIso8601String(),
        "like_count": likeCount,
        "comment_count": commentCount,
        "liked": liked,
        "likes": List<dynamic>.from(likes!.map((x) => x)),
        "comments": List<dynamic>.from(comments!.map((x) => x.toJson())),
        "user": user!.toJson(),
      };
}

class Comment {
  int? id;
  int? userId;
  dynamic photo;
  String? body;
  bool? active;
  dynamic parentId;
  int? commentableId;
  List<dynamic>? children;
  String? createdAt;

  Comment({
    this.id,
    this.userId,
    this.photo,
    this.body,
    this.active,
    this.parentId,
    this.commentableId,
    this.children,
    this.createdAt,
  });

  factory Comment.fromJson(Map<String?, dynamic> json) => Comment(
        id: json["id"],
        userId: json["user_id"],
        photo: json["photo"],
        body: json["body"],
        active: json["active"],
        parentId: json["parent_id"],
        commentableId: json["commentable_id"],
        createdAt: json["created_at"],
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "photo": photo,
        "body": body,
        "active": active,
        "parent_id": parentId,
        "commentable_id": commentableId,
        "children": List<dynamic>.from(children!.map((x) => x)),
        "created_at": createdAt,
      };
}

class User {
  int? id;
  String? name;
  String? username;
  String? roll;
  dynamic photo;
  dynamic currentInstitution;
  String? type;
  bool? approved;
  dynamic hscGroup;
  bool? active;
  dynamic pivot;
  bool? isAffiliate;
  dynamic guardiansPhone;
  bool? secondTimer;

  User({
    this.id,
    this.name,
    this.username,
    this.roll,
    this.photo,
    this.currentInstitution,
    this.type,
    this.approved,
    this.hscGroup,
    this.active,
    this.pivot,
    this.isAffiliate,
    this.guardiansPhone,
    this.secondTimer,
  });

  factory User.fromJson(Map<String?, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        roll: json["roll"],
        photo: json["photo"],
        currentInstitution: json["current_institution"],
        type: json["type"],
        approved: json["approved"],
        hscGroup: json["hsc_group"],
        active: json["active"],
        pivot: json["pivot"],
        isAffiliate: json["isAffiliate"],
        guardiansPhone: json["guardians_phone"],
        secondTimer: json["second_timer"],
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "roll": roll,
        "photo": photo,
        "current_institution": currentInstitution,
        "type": type,
        "approved": approved,
        "hsc_group": hscGroup,
        "active": active,
        "pivot": pivot,
        "isAffiliate": isAffiliate,
        "guardians_phone": guardiansPhone,
        "second_timer": secondTimer,
      };
}
