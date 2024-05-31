import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'counter_controller_model.dart';
export 'counter_controller_model.dart';

class CounterControllerWidget extends StatefulWidget {
  const CounterControllerWidget({
    super.key,
    required this.quantity,
  });

  final int? quantity;

  @override
  State<CounterControllerWidget> createState() =>
      _CounterControllerWidgetState();
}

class _CounterControllerWidgetState extends State<CounterControllerWidget> {
  late CounterControllerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CounterControllerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            width: 160.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(8.0),
              shape: BoxShape.rectangle,
              border: Border.all(
                color: FlutterFlowTheme.of(context).alternate,
                width: 2.0,
              ),
            ),
            child: FlutterFlowCountController(
              decrementIconBuilder: (enabled) => FaIcon(
                FontAwesomeIcons.minus,
                color: enabled
                    ? FlutterFlowTheme.of(context).secondaryText
                    : FlutterFlowTheme.of(context).alternate,
                size: 15.0,
              ),
              incrementIconBuilder: (enabled) => FaIcon(
                FontAwesomeIcons.plus,
                color: enabled
                    ? FlutterFlowTheme.of(context).primary
                    : FlutterFlowTheme.of(context).alternate,
                size: 18.0,
              ),
              countBuilder: (count) => Text(
                count.toString(),
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: 'Outfit',
                      letterSpacing: 0.0,
                    ),
              ),
              count: _model.countControllerValue ??= widget.quantity!,
              updateCount: (count) =>
                  setState(() => _model.countControllerValue = count),
              stepSize: 1,
              contentPadding: const EdgeInsets.all(6.0),
            ),
          ),
        ),
      ],
    );
  }
}
