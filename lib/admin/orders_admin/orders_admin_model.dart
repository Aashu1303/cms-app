import '/components/nav_bar2/nav_bar2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'orders_admin_widget.dart' show OrdersAdminWidget;
import 'package:flutter/material.dart';

class OrdersAdminModel extends FlutterFlowModel<OrdersAdminWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for NavBar2 component.
  late NavBar2Model navBar2Model1;
  // Model for NavBar2 component.
  late NavBar2Model navBar2Model2;
  DateTime? datePicked;
  // Model for NavBar2 component.
  late NavBar2Model navBar2Model3;

  @override
  void initState(BuildContext context) {
    navBar2Model1 = createModel(context, () => NavBar2Model());
    navBar2Model2 = createModel(context, () => NavBar2Model());
    navBar2Model3 = createModel(context, () => NavBar2Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    navBar2Model1.dispose();
    navBar2Model2.dispose();
    navBar2Model3.dispose();
  }
}
