import '/components/nav_bar2/nav_bar2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_admin_widget.dart' show ProfileAdminWidget;
import 'package:flutter/material.dart';

class ProfileAdminModel extends FlutterFlowModel<ProfileAdminWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBar2 component.
  late NavBar2Model navBar2Model;

  @override
  void initState(BuildContext context) {
    navBar2Model = createModel(context, () => NavBar2Model());
  }

  @override
  void dispose() {
    navBar2Model.dispose();
  }
}
