import '/backend/backend.dart';
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
    required this.type,
    required this.washType,
    required this.price,
    required this.clothID,
  });

  final int? quantity;
  final String? type;
  final String? washType;
  final int? price;
  final DocumentReference? clothID;

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
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 150.0,
          height: 70.0,
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
              size: 30.0,
            ),
            incrementIconBuilder: (enabled) => FaIcon(
              FontAwesomeIcons.plus,
              color: enabled
                  ? FlutterFlowTheme.of(context).primary
                  : FlutterFlowTheme.of(context).alternate,
              size: 30.0,
            ),
            countBuilder: (count) => Text(
              count.toString(),
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: 'Outfit',
                    fontSize: 30.0,
                    letterSpacing: 0.0,
                  ),
            ),
            count: _model.countControllerValue ??= widget.quantity!,
            updateCount: (count) async {
              setState(() => _model.countControllerValue = count);
              logFirebaseEvent('COUNTER_CONTROLLER_CountController_48ps2');
              if (_model.countControllerValue != 0) {
                logFirebaseEvent('CountController_backend_call');

                await widget.clothID!.update(createClothesRecordData(
                  quantity: _model.countControllerValue,
                  price: (_model.countControllerValue!) * (widget.price!),
                ));
              } else {
                logFirebaseEvent('CountController_alert_dialog');
                var confirmDialogResponse = await showDialog<bool>(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: const Text('Remove Item'),
                          content: const Text('Do you want to remove this item ?'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext, false),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext, true),
                              child: const Text('Confirm'),
                            ),
                          ],
                        );
                      },
                    ) ??
                    false;
                if (confirmDialogResponse) {
                  logFirebaseEvent('CountController_backend_call');
                  await widget.clothID!.delete();
                } else {
                  logFirebaseEvent('CountController_backend_call');

                  await widget.clothID!.update(createClothesRecordData(
                    quantity: 1,
                  ));
                  logFirebaseEvent('CountController_navigate_to');

                  context.pushNamed('Bucket');
                }
              }
            },
            stepSize: 1,
            minimum: 0,
            contentPadding: const EdgeInsets.all(10.0),
          ),
        ),
      ],
    );
  }
}
