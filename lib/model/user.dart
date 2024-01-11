class User {
  String? status;
  Map<String, dynamic>? name;
  String? username;
  String? password;
  List<dynamic>? emails;
  String? phoneNumber;
  Map<String, dynamic>? location;
  String? website;
  String? domain;
  Map<String, dynamic>? job;
  Map<String, dynamic>? creditCard;
  String? uuid;
  String? objectId;

  User({
    this.status,
    this.name,
    this.username,
    this.password,
    this.emails,
    this.phoneNumber,
    this.location,
    this.website,
    this.domain,
    this.job,
    this.creditCard,
    this.uuid,
    this.objectId,
  });

  User.fromJson(Map<String, dynamic> json){
    status = json['status'];
    name = json['name'];
    username = json['username'];
    password = json['password'];
    emails = json['emails'];
    phoneNumber = json['phoneNumber'];
    location = json['location'];
    website = json['website'];
    domain = json['domain'];
    job = json['job'];
    creditCard = json['creditCard'];
    uuid = json['uuid'];
    objectId = json['objectId'];
  }

  Map<String, dynamic> toJson(){
   final Map<String, dynamic> data = {};
   data['status'] = status;
   data['name'] = name;
   data['username'] = username;
   data['password'] = password;
   data['emails'] = emails;
   data['phoneNumber'] = phoneNumber;
   data['location'] = location;
   data['website'] = website;
   data['domain'] = domain;
   data['job'] = job;
   data['creditCard'] = creditCard;
   data['uuid'] = uuid;
   data['objectId'] = objectId;
   return data;
  }
}
