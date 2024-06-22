import '/backend/backend.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'add_to_bucket_model.dart';
export 'add_to_bucket_model.dart';

class AddToBucketWidget extends StatefulWidget {
  const AddToBucketWidget({super.key});

  @override
  State<AddToBucketWidget> createState() => _AddToBucketWidgetState();
}

class _AddToBucketWidgetState extends State<AddToBucketWidget>
    with TickerProviderStateMixin {
  late AddToBucketModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddToBucketModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'AddToBucket'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            title: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 0.0, 0.0),
              child: Text(
                'Add Cloths',
                style: FlutterFlowTheme.of(context).headlineLarge.override(
                      fontFamily: 'Outfit',
                      fontSize: 30.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            actions: const [],
            centerTitle: false,
            elevation: 500.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 40.0, 12.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 12.0, 20.0, 20.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownValueController1 ??=
                                            FormFieldController<String>(null),
                                    options: const ['Bedsheet', 'Regular', 'Winter'],
                                    onChanged: (val) => setState(
                                        () => _model.dropDownValue1 = val),
                                    width: 300.0,
                                    height: 80.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    hintText: 'Please select Cloth Type.',
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    margin: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isOverButton: false,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (_model.dropDownValue1 != null &&
                              _model.dropDownValue1 != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 20.0, 20.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: FlutterFlowDropDown<String>(
                                      controller:
                                          _model.dropDownValueController2 ??=
                                              FormFieldController<String>(null),
                                      options: () {
                                        if (_model.dropDownValue1 ==
                                            'Bedsheet') {
                                          return ['Wash'];
                                        } else if (_model.dropDownValue1 ==
                                            'Regular') {
                                          return ['Wash', 'Iron', 'Wash&Iron'];
                                        } else {
                                          return ['Wash'];
                                        }
                                      }(),
                                      onChanged: (val) => setState(
                                          () => _model.dropDownValue2 = val),
                                      width: 300.0,
                                      height: 80.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      hintText: 'Please select Wash Type.',
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 5.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderWidth: 2.0,
                                      borderRadius: 8.0,
                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 16.0, 4.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if ((_model.dropDownValue1 != null &&
                                  _model.dropDownValue1 != '') &&
                              (_model.dropDownValue2 != null &&
                                  _model.dropDownValue2 != ''))
                            Align(
                              alignment: const AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 20.0, 0.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 5.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Container(
                                    width: 156.0,
                                    height: 70.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Container(
                                      width: 160.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                      child: FlutterFlowCountController(
                                        decrementIconBuilder: (enabled) =>
                                            FaIcon(
                                          FontAwesomeIcons.minus,
                                          color: enabled
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryText
                                              : FlutterFlowTheme.of(context)
                                                  .alternate,
                                          size: 30.0,
                                        ),
                                        incrementIconBuilder: (enabled) =>
                                            FaIcon(
                                          FontAwesomeIcons.plus,
                                          color: enabled
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : FlutterFlowTheme.of(context)
                                                  .alternate,
                                          size: 30.0,
                                        ),
                                        countBuilder: (count) => Text(
                                          count.toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Outfit',
                                                fontSize: 30.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        count: _model.countControllerValue ??=
                                            0,
                                        updateCount: (count) => setState(() =>
                                            _model.countControllerValue =
                                                count),
                                        stepSize: 1,
                                        minimum: 0,
                                        contentPadding: const EdgeInsets.all(6.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if ((_model.dropDownValue1 != null &&
                                  _model.dropDownValue1 != '') &&
                              (_model.dropDownValue2 != null &&
                                  _model.dropDownValue2 != '') &&
                              (_model.countControllerValue != 0))
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  90.0, 40.0, 90.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: StreamBuilder<List<PricesRecord>>(
                                      stream: queryPricesRecord(
                                        queryBuilder: (pricesRecord) =>
                                            pricesRecord
                                                .where(
                                                  'type',
                                                  isEqualTo:
                                                      _model.dropDownValue1,
                                                )
                                                .where(
                                                  'washType',
                                                  isEqualTo:
                                                      _model.dropDownValue2,
                                                ),
                                        singleRecord: true,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<PricesRecord>
                                            buttonPricesRecordList =
                                            snapshot.data!;
                                        // Return an empty Container when the item does not exist.
                                        if (snapshot.data!.isEmpty) {
                                          return Container();
                                        }
                                        final buttonPricesRecord =
                                            buttonPricesRecordList.isNotEmpty
                                                ? buttonPricesRecordList.first
                                                : null;
                                        return FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'ADD_TO_BUCKET_PAGE_ADD_BTN_ON_TAP');
                                            logFirebaseEvent(
                                                'Button_firestore_query');
                                            _model.checkEntry =
                                                await queryClothesRecordOnce(
                                              parent: FFAppState().uid,
                                              queryBuilder: (clothesRecord) =>
                                                  clothesRecord
                                                      .where(
                                                        'type',
                                                        isEqualTo: _model
                                                            .dropDownValue1,
                                                      )
                                                      .where(
                                                        'washType',
                                                        isEqualTo: _model
                                                            .dropDownValue2,
                                                      ),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                            if ((_model.checkEntry != null) ==
                                                false) {
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              var clothesRecordReference =
                                                  ClothesRecord.createDoc(
                                                      FFAppState().uid!);
                                              await clothesRecordReference
                                                  .set(createClothesRecordData(
                                                type: _model.dropDownValue1,
                                                washType: _model.dropDownValue2,
                                                quantity:
                                                    _model.countControllerValue,
                                                uid: FFAppState().uid?.id,
                                                price: buttonPricesRecord!
                                                        .price *
                                                    (_model
                                                        .countControllerValue!),
                                              ));
                                              _model.addClothes = ClothesRecord
                                                  .getDocumentFromData(
                                                      createClothesRecordData(
                                                        type: _model
                                                            .dropDownValue1,
                                                        washType: _model
                                                            .dropDownValue2,
                                                        quantity: _model
                                                            .countControllerValue,
                                                        uid: FFAppState()
                                                            .uid
                                                            ?.id,
                                                        price: buttonPricesRecord
                                                                .price *
                                                            (_model
                                                                .countControllerValue!),
                                                      ),
                                                      clothesRecordReference);
                                            } else {
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              await _model.checkEntry!.reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'quantity': FieldValue
                                                        .increment(_model
                                                            .countControllerValue!),
                                                    'price': FieldValue.increment(
                                                        buttonPricesRecord!
                                                                .price *
                                                            (_model
                                                                .countControllerValue!)),
                                                  },
                                                ),
                                              });
                                            }

                                            logFirebaseEvent(
                                                'Button_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .clearSnackBars();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Item Added',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 2000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                            );
                                            logFirebaseEvent(
                                                'Button_navigate_to');

                                            context.pushNamed(
                                              'Cart',
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    const TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType
                                                          .rightToLeft,
                                                ),
                                              },
                                            );

                                            setState(() {});
                                          },
                                          text: 'Add',
                                          options: FFButtonOptions(
                                            height: 57.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          'Plus Jakarta Sans',
                                                      color: Colors.white,
                                                      fontSize: 25.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navBar1Model,
                  updateCallback: () => setState(() {}),
                  child: const NavBar1Widget(
                    curr: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
