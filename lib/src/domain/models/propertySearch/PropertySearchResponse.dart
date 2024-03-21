import 'dart:convert';

List<PropertySearchResponse> propertyFromJson(dynamic parsed) {
  // final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<PropertySearchResponse>((json) {
    return PropertySearchResponse.fromJson(json);
  }).toList();
}
String propertyToJson(List<PropertySearchResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PropertySearchResponse {
  PropertySearchResponse({
    required this.id,
    required this.propertyName,
    required this.propertyType,
    required this.numberOfToilets,
    required this.numberOfParking,
    required this.numberOfRooms,
    required this.buildUpSize,
    required this.mapLocation,
    required this.searchPrice,
    required this.searchPriceCurrency,
    required this.postedAt,
    required this.images,
  });

  int id;
  String propertyName;
  String propertyType;
  String numberOfToilets;
  String numberOfParking;
  String numberOfRooms;
  String buildUpSize;
  String mapLocation;
  String searchPrice;
  String searchPriceCurrency;
  DateTime postedAt;
  List<PropertyImage> images;

  factory PropertySearchResponse.fromJson(Map<String, dynamic> json) => PropertySearchResponse(
    id: json["id"],
    propertyName: json["propertyName"],
    propertyType: json["propertyType"],
    numberOfToilets: json["numberOfToilets"],
    numberOfParking: json["numberOfParking"],
    numberOfRooms: json["numberOfRooms"],
    buildUpSize: json["buildUpSize"],
    mapLocation: json["mapLocation"],
    searchPrice: json["searchPrice"],
    searchPriceCurrency: json["searchPriceCurrency"],
    postedAt: DateTime.parse(json["postedAt"]),
    images: List<PropertyImage>.from(json["images"].map((x) => PropertyImage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "propertyName": propertyName,
    "propertyType": propertyType,
    "numberOfToilets": numberOfToilets,
    "numberOfParking": numberOfParking,
    "numberOfRooms": numberOfRooms,
    "buildUpSize": buildUpSize,
    "mapLocation": mapLocation,
    "searchPrice": searchPrice,
    "searchPriceCurrency": searchPriceCurrency,
    "postedAt": postedAt.toIso8601String(),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
  };
}

class PropertyImage {
  PropertyImage({
    required this.id,
    required this.name,
    required this.type,
    required this.size,
    required this.image,
    required this.displayOrder,
  });

  int id;
  String name;
  String type;
  int size;
  String image;
  int displayOrder;

  factory PropertyImage.fromJson(Map<String, dynamic> json) => PropertyImage(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    size: json["size"],
    image: json["image"],
    displayOrder: json["displayOrder"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "size": size,
    "image": image,
    "displayOrder": displayOrder,
  };
}
