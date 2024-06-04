import '/backend/backend.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cart_widget.dart' show CartWidget;
import 'package:flutter/material.dart';

class CartModel extends FlutterFlowModel<CartWidget> {
  ///  Local state fields for this page.

  int? decrementVal;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Cart widget.
  List<ClothesRecord>? queryPrices;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ClothesRecord>? queryClothes;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  OrdersRecord? createdDoc;
  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    navBar1Model.dispose();
  }

  /// Action blocks.
  Future priceLoad(BuildContext context) async {}
}
