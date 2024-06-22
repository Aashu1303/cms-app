import '/backend/backend.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_to_bucket_widget.dart' show AddToBucketWidget;
import 'package:flutter/material.dart';

class AddToBucketModel extends FlutterFlowModel<AddToBucketWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for CountController widget.
  int? countControllerValue;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ClothesRecord? checkEntry;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ClothesRecord? addClothes;
  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navBar1Model.dispose();
  }
}
