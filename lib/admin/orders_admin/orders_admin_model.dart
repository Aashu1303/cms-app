import '/components/nav_bar2/nav_bar2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'orders_admin_widget.dart' show OrdersAdminWidget;
import 'package:flutter/material.dart';

class OrdersAdminModel extends FlutterFlowModel<OrdersAdminWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  var qrScan = '';
  // Model for NavBar2 component.
  late NavBar2Model navBar2Model;

  @override
  void initState(BuildContext context) {
    navBar2Model = createModel(context, () => NavBar2Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navBar2Model.dispose();
  }
}
