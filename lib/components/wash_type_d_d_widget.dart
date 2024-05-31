import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'wash_type_d_d_model.dart';
export 'wash_type_d_d_model.dart';

class WashTypeDDWidget extends StatefulWidget {
  const WashTypeDDWidget({super.key});

  @override
  State<WashTypeDDWidget> createState() => _WashTypeDDWidgetState();
}

class _WashTypeDDWidgetState extends State<WashTypeDDWidget> {
  late WashTypeDDModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WashTypeDDModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
