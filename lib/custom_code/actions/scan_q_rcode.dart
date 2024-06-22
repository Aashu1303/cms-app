// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> scanQRcode(BuildContext context) async {
  // Trigger the QR code scanner
  String scanResult = await FlutterBarcodeScanner.scanBarcode(
    '#C62828', // scanning line color
    'Cancel', // cancel button text
    true, // show the flash icon
    ScanMode.QR,
  );

  // Check the scan result
  if (scanResult != '-1' && scanResult.isNotEmpty) {
    // Check if the scanned document ID is present in the 'order' collection
    DocumentSnapshot orderDoc = await FirebaseFirestore.instance
        .collection('orders')
        .doc(scanResult)
        .get();

    if (orderDoc.exists) {
      // QR code scanned successfully and found in the collection, navigate to the 'userItems-Admin' page with the scan result
      context.pushNamed(
        'userItems-Admin',
        queryParameters: {
          'orderID': serializeParam(
            scanResult,
            ParamType.DocumentReference,
          ),
        },
      );
      return; // Exit the function if navigation is successful
    } else {
      // Scanned document ID not found in the collection
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Order not found.'),
        ),
      );
    }
  } else {
    // Scan canceled or result is empty
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('QR code scan canceled or invalid result.'),
      ),
    );
  }

  // If scan is canceled, invalid, or order not found, navigate back to 'orderItems-Admin'
  context.pushNamed('orders-Admin');
}
