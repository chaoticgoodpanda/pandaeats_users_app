class Sellers
{
  // retrieve seller info from Firestore DB
  String? sellerName;
  String? sellerUID;
  String? sellerAvatarUrl;
  String? sellerEmail;

  Sellers({
    this.sellerUID,
    this.sellerName,
    this.sellerEmail,
    this.sellerAvatarUrl
});

  // retrieve and parse the json data
  Sellers.fromJson(Map <String, dynamic> json)
  {
    sellerUID = json["sellerUID"];
    sellerName = json["sellerName"];
    sellerEmail = json["sellerEmail"];
    sellerAvatarUrl = json["sellerAvatarUrl"];
  }

  // Returns Json data of sellers as a map
  Map<String, dynamic> toJson()
  {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["sellerUID"] = this.sellerUID;
    data["sellerName"] = this.sellerName;
    data["sellerEmail"] = this.sellerEmail;
    data["sellerAvatarUrl"] = this.sellerAvatarUrl;

    return data;
  }

}