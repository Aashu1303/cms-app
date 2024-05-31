import '/flutter_flow/flutter_flow_util.dart';
import 'bucket_widget.dart' show BucketWidget;
import 'package:flutter/material.dart';

class BucketModel extends FlutterFlowModel<BucketWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
