import 'package:flutter/material.dart';

class PropertySearchRequest {
  final String period;
  final String nameOrRegion;
  final String dateFrom;
  final String dateTo;
  final String priceFrom;
  final String priceTo;
  final String sort;
  final String type;
  final int rooms;
  final String view;

  PropertySearchRequest({
    required this.period,
    required this.nameOrRegion,
    required this.dateFrom,
    required this.dateTo,
    required this.priceFrom,
    required this.priceTo,
    required this.sort,
    required this.type,
    required this.rooms,
    required this.view,
  });

  factory PropertySearchRequest.fromJson(Map<String, dynamic> json) {
    return PropertySearchRequest(
      period: json['period'],
      nameOrRegion: json['nameOrRegion'],
      dateFrom: json['dateFrom'],
      dateTo: json['dateTo'],
      priceFrom: json['priceFrom'],
      priceTo: json['priceTo'],
      sort: json['sort'],
      type: json['type'],
      rooms: json['rooms'],
      view: json['view'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'period': period,
      'nameOrRegion': nameOrRegion,
      'dateFrom': dateFrom,
      'dateTo': dateTo,
      'priceFrom': priceFrom,
      'priceTo': priceTo,
      'sort': sort,
      'type': type,
      'rooms': rooms,
      'view': view,
    };
  }

}
