import 'dart:convert';

BlogResponseModel blogResponseModelFromJson(String? str) =>
    BlogResponseModel.fromJson(json.decode(str!));

String? blogResponseModelToJson(BlogResponseModel data) =>
    json.encode(data.toJson());

class BlogResponseModel {
  List<BlogModel>? data;
  Links? links;
  Meta? meta;

  BlogResponseModel({
    this.data,
    this.links,
    this.meta,
  });

  factory BlogResponseModel.fromJson(Map<String?, dynamic> json) =>
      BlogResponseModel(
        data: List<BlogModel>.from(
            json["data"].map((x) => BlogModel.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String?, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links!.toJson(),
        "meta": meta!.toJson(),
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
  List<Category>? categories;
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
    this.categories,
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
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
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
        "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
        "comments": List<dynamic>.from(comments!.map((x) => x.toJson())),
        "user": user!.toJson(),
      };
}

class Category {
  int? id;
  dynamic parentId;
  String? name;
  String? slug;
  dynamic photo;
  int? order;
  bool? active;
  List<dynamic>? children;
  int? childrenCount;

  Category({
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

  factory Category.fromJson(Map<String?, dynamic> json) => Category(
        id: json["id"],
        parentId: json["parent_id"],
        name: json["name"],
        slug: json["slug"],
        photo: json["photo"],
        order: json["order"],
        active: json["active"],
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
        "children_count": childrenCount,
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

class Links {
  String? first;
  String? last;
  dynamic prev;
  dynamic next;

  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  factory Links.fromJson(Map<String?, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String?, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Link>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  factory Meta.fromJson(Map<String?, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String?, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": List<dynamic>.from(links!.map((x) => x.toJson())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}

class Link {
  String? url;
  String? label;
  bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromJson(Map<String?, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String?, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
