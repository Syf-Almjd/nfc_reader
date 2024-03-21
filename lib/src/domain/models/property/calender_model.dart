class CalendarResponseJson {
  List<AvailabilityPricingEntry> data;
  int propertyId;

  CalendarResponseJson({required this.data, required this.propertyId});

  factory CalendarResponseJson.fromJson(Map<String, dynamic> json) {
    return CalendarResponseJson(
      data: List<AvailabilityPricingEntry>.from(
          json['data'].map((x) => AvailabilityPricingEntry.fromJson(x))),
      propertyId: json['propertyId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': List<dynamic>.from(data.map((x) => x.toJson())),
      'propertyId': propertyId,
    };
  }
}

class AvailabilityPricingEntry {
  String description;
  int availabilityId;
  int pricingId;
  String available;
  double price;
  String priceCurrency;
  String date;
  String demand;
  String notes;

  AvailabilityPricingEntry({
    required this.description,
    required this.availabilityId,
    required this.pricingId,
    required this.available,
    required this.price,
    required this.priceCurrency,
    required this.date,
    required this.demand,
    required this.notes,
  });

  factory AvailabilityPricingEntry.fromJson(Map<String, dynamic> json) {
    return AvailabilityPricingEntry(
      description: json['description'],
      availabilityId: json['availabilityId'],
      pricingId: json['pricingId'],
      available: json['available'],
      price: json['price'],
      priceCurrency: json['priceCurrency'],
      date: json['date'],
      demand: json['demand'],
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'availabilityId': availabilityId,
      'pricingId': pricingId,
      'available': available,
      'price': price,
      'priceCurrency': priceCurrency,
      'date': date,
      'demand': demand,
      'notes': notes,
    };
  }
}
