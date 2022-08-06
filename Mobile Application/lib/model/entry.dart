import 'package:cloud_firestore/cloud_firestore.dart';

class Entry {
  final String qrID;
  final String placeName;
  final DateTime checkIn;
  final Timestamp checkInTimestamp;
  final DateTime checkOut;

  Entry(
      {required this.placeName,
      required this.checkIn,
      required this.checkInTimestamp,
      required this.checkOut,
      required this.qrID});

  static Entry fromJson(Map<void, dynamic> json) => Entry(
      qrID: json['qrCode'],
      placeName: json['placeName'],
      checkIn: (json['check-in'] as Timestamp).toDate(),
      checkInTimestamp: json['check-in'],
      checkOut: (json['check-out'] as Timestamp).toDate());
}
