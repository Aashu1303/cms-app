import '/components/counter_controller/counter_controller_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bucket_widget.dart' show BucketWidget;
import 'package:flutter/material.dart';

class BucketModel extends FlutterFlowModel<BucketWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for counterController dynamic component.
  late FlutterFlowDynamicModels<CounterControllerModel> counterControllerModels;

  @override
  void initState(BuildContext context) {
    counterControllerModels =
        FlutterFlowDynamicModels(() => CounterControllerModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    counterControllerModels.dispose();
  }
}
