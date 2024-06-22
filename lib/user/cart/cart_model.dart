import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cart_widget.dart' show CartWidget;
import 'package:flutter/material.dart';

class CartModel extends FlutterFlowModel<CartWidget> {
  ///  Local state fields for this page.

  int? decrementVal;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Cart widget.
  List<ClothesRecord>? queryPrices;
  List<ClothesRecord>? containerPreviousSnapshot;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ClothesRecord>? queryClothes;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? numberOfOrders;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  OrdersRecord? createdDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future priceLoad(BuildContext context) async {}
}
