import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

DocumentReference newCustomFunction(String ref) {
  final FirebaseFirestore fr = FirebaseFirestore.instance;
  String documentPath = "/orders/" + "$ref";
  DocumentReference documentReference = fr.doc(documentPath);
  return documentReference;
}

int? decreaseVal(int dec) {
  return (-dec);
}

DateTime calculateDeliveryTime(DateTime orderDate) {
  return orderDate.add(Duration(days: 2));
}

List<OrdersRecord>? filterOrdersByTodayDelivery(
  List<OrdersRecord> orders,
  DateTime todayDate,
) {
  DateTime getDateOnly(DateTime? dateTime) {
    if (dateTime == null) {
      return DateTime(
          1970, 1, 1); // Default to Unix epoch start if dateTime is null
    }
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  DateTime todayOnly = getDateOnly(todayDate);

  List<OrdersRecord> filteredOrders = orders.where((order) {
    // Check if deliveryDate exists and matches today
    if (order.deliveryDate != null) {
      DateTime deliveryDate = order.deliveryDate!;
      // Check if the order status is "Accepted" and service is "Pending" or null
      if (getDateOnly(deliveryDate) == todayOnly &&
          order.status == "Accepted" &&
          (order.service == "Pending" || order.service != "Completed")) {
        return true;
      }
    }
    return false;
  }).toList();

  return filteredOrders;
}

DateTime? getDateOnly(DateTime dateTime) {
  return DateTime(dateTime.year, dateTime.month, dateTime.day);
}

List<OrdersRecord> filterOrdersByToday(
  List<OrdersRecord> orders,
  DateTime todayDate,
) {
  DateTime getDateOnly(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  DateTime todayOnly = getDateOnly(todayDate);

  List<OrdersRecord> filteredOrders = orders.where((order) {
    DateTime? createdAt = order
        .createdAt; // Assuming createdAt is a DateTime object in OrdersRecord
    return getDateOnly(createdAt!) == todayOnly;
  }).toList();

  return filteredOrders;
}

List<OrdersStruct> getOrdersByDate(
  List<OrdersRecord> orders,
  DateTime todayDate,
) {
  DateTime getDateOnly(DateTime? dateTime) {
    if (dateTime == null) {
      return DateTime(
          1970, 1, 1); // Default to Unix epoch start if dateTime is null
    }
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  DateTime today = getDateOnly(todayDate);
  DateTime yesterday = getDateOnly(todayDate.subtract(Duration(days: 1)));

  List<DocumentReference> todayOrderRefs = [];
  List<DocumentReference> yesterdayOrderRefs = [];
  List<DocumentReference> previousOrderRefs = [];

  for (var order in orders) {
    DateTime orderDate = getDateOnly(order.createdAt);

    if (orderDate == today) {
      todayOrderRefs.add(order.reference);
    } else if (orderDate == yesterday) {
      yesterdayOrderRefs.add(order.reference);
    } else {
      previousOrderRefs.add(order.reference);
    }
  }

  OrdersStruct todayOrders = OrdersStruct(type: "Today", order: todayOrderRefs);
  OrdersStruct yesterdayOrders =
      OrdersStruct(type: "Yesterday", order: yesterdayOrderRefs);
  OrdersStruct previousOrders =
      OrdersStruct(type: "Previous", order: previousOrderRefs);

  return [todayOrders, yesterdayOrders, previousOrders];
}
