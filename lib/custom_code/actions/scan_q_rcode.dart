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

import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/scheduler.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

Future<void> scanQRcode(BuildContext context) async {
  // Trigger the QR code scanner
  String scanResult = await FlutterBarcodeScanner.scanBarcode(
    '#C62828', // scanning line color
    'Cancel', // cancel button text
    true, // show the flash icon
    ScanMode.QR,
  );

  // Check the scan result
  if (scanResult != '-1') {
    // QR code scanned successfully, navigate to the 'userItems-Admin' page
    context.pushNamed(
      'userItems-Admin',
      queryParameters: {
        'orderID': serializeParam(
          scanResult,
          ParamType.String,
        ),
      },
    );
  } else {
    // QR code scan canceled, navigate back to the previous page
    Navigator.pop(context);
  }
}
