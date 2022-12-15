import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ShopModel {
  final String id;
  final String name;
  final String imageLink;
  final String location;
  final String deliveryDateRange;
  ShopModel({
    required this.id,
    required this.name,
    required this.imageLink,
    required this.location,
    required this.deliveryDateRange,
  });

  factory ShopModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return ShopModel(
      id: snapshot.id,
      name: (snapshot.data() as Map)['name'],
      imageLink: (snapshot.data() as Map)['imageLink'] as String,
      location: (snapshot.data() as Map)['location'] as String,
      deliveryDateRange:
          (snapshot.data() as Map)['deliveryDateRange'] as String,
    );
  }
}
