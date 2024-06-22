import '/backend/backend.dart';
import '/components/counter_controller/counter_controller_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bucket_widget.dart' show BucketWidget;
import 'package:flutter/material.dart';

class BucketModel extends FlutterFlowModel<BucketWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  List<ClothesRecord>? bucketPreviousSnapshot;
  // Stores action output result for [Firestore Query - Query a collection] action in Bucket widget.
  List<ClothesRecord>? queryPrices;
  // Models for counterController dynamic component.
  late FlutterFlowDynamicModels<CounterControllerModel> counterControllerModels;
  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    counterControllerModels =
        FlutterFlowDynamicModels(() => CounterControllerModel());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    counterControllerModels.dispose();
    navBar1Model.dispose();
  }
}
