class Like {
  late int likes;
  late List<String> usernames;

  Like({required this.likes, required this.usernames});

  factory Like.formJson(Map<String, dynamic> json) {
    return Like(
        likes: json['like'],
        usernames:
            (json['usernames'] as List).map((e) => (e as String)).toList());
  }

  Map<String, dynamic> toJson() {
    return {'usernames': this.usernames, 'like': this.likes};
  }
}

class Comments {
  late String username;
  late String imageUrl;
  late String comment;

  Comments(
      {required this.username, required this.comment, required this.imageUrl});

  factory Comments.formJson(Map<String, dynamic> json) {
    return Comments(
        comment: json['comment'],
        imageUrl: json['imageUrl'],
        username: json['username']);
  }

  Map<String, dynamic> toJson() {
    return {
      'comment': this.comment,
      'imageUrl': this.imageUrl,
      'username': this.username
    };
  }
}

class Postproto {
  late String id;
  late String imageId;
  late String userId;
  late String creatorName;
  late String speciality;
  late String education;
  late String experience;
  late String description;
  late String imageUrl;
  late String address;
  late String number;
  late String email;

  late Like likData;
  late List<Comments> comments;

  Postproto(
      {required this.id,
      required this.imageId,
      required this.userId,
      required this.description,
      required this.imageUrl,
      required this.likData,
      required this.creatorName,
      required this.education,
      required this.experience,
      required this.address,
      required this.number,
      required this.speciality,
      required this.email,
      required this.comments});
}

class BuySell {
  late int id;
  late String userId;
  late String title;
  late String description;
  late String imageId;
  late String creatorName;
  late String projectType;
  late String money;

  BuySell(
      {required this.id,
      required this.userId,
      required this.title,
      required this.description,
      required this.imageId,
      required this.creatorName,
      required this.projectType,
      required this.money});
}
