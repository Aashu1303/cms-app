import '/backend/backend.dart';
import '/components/nav_bar2/nav_bar2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'orders_admin_model.dart';
export 'orders_admin_model.dart';

class OrdersAdminWidget extends StatefulWidget {
  const OrdersAdminWidget({super.key});

  @override
  State<OrdersAdminWidget> createState() => _OrdersAdminWidgetState();
}

class _OrdersAdminWidgetState extends State<OrdersAdminWidget>
    with TickerProviderStateMixin {
  late OrdersAdminModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrdersAdminModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().todayDate =
          functions.getDateOnly(getCurrentTimestamp)!.toString();
      setState(() {});
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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

    return StreamBuilder<List<OrdersRecord>>(
      stream: queryOrdersRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<OrdersRecord> ordersAdminOrdersRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            floatingActionButton: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 80.0),
              child: FloatingActionButton(
                onPressed: () async {
                  _model.qrScan = await FlutterBarcodeScanner.scanBarcode(
                    '#C62828', // scanning line color
                    'Cancel', // cancel button text
                    true, // whether to show the flash icon
                    ScanMode.QR,
                  );

                  context.pushNamed(
                    'userItems-Admin',
                    queryParameters: {
                      'orderID': serializeParam(
                        functions.newCustomFunction(_model.qrScan),
                        ParamType.DocumentReference,
                      ),
                    }.withoutNulls,
                  );

                  setState(() {});
                },
                backgroundColor: FlutterFlowTheme.of(context).primary,
                elevation: 8.0,
                child: Icon(
                  Icons.qr_code,
                  color: FlutterFlowTheme.of(context).info,
                  size: 24.0,
                ),
              ),
            ),
            body: SafeArea(
              top: true,
              child: Container(
                width: 494.0,
                height: 937.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Align(
                            alignment: const Alignment(0.0, 0),
                            child: TabBar(
                              labelColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              unselectedLabelColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                  ),
                              unselectedLabelStyle: const TextStyle(),
                              indicatorColor:
                                  FlutterFlowTheme.of(context).primary,
                              padding: const EdgeInsets.all(4.0),
                              tabs: const [
                                Tab(
                                  text: 'Today ',
                                ),
                                Tab(
                                  text: 'To-Deliver',
                                ),
                                Tab(
                                  text: 'Previous',
                                ),
                              ],
                              controller: _model.tabBarController,
                              onTap: (i) async {
                                [() async {}, () async {}, () async {}][i]();
                              },
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _model.tabBarController,
                              children: [
                                Stack(
                                  children: [
                                    SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(24.0,
                                                                10.0, 0.0, 0.0),
                                                    child: Text(
                                                      'Below are your most recent orders',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                20.0,
                                                                16.0,
                                                                0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      constraints:
                                                          const BoxConstraints(
                                                        maxWidth:
                                                            double.infinity,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    12.0,
                                                                    16.0,
                                                                    12.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              flex: 4,
                                                              child: Text(
                                                                'Order Number',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ),
                                                            if (responsiveVisibility(
                                                              context: context,
                                                              phone: false,
                                                              tablet: false,
                                                              tabletLandscape:
                                                                  false,
                                                            ))
                                                              Expanded(
                                                                flex: 1,
                                                                child: Text(
                                                                  'Weight',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ),
                                                            if (responsiveVisibility(
                                                              context: context,
                                                              phone: false,
                                                              tablet: false,
                                                              tabletLandscape:
                                                                  false,
                                                            ))
                                                              Expanded(
                                                                flex: 2,
                                                                child: Text(
                                                                  'Status',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Plus Jakarta Sans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Text(
                                                                'Amount',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                            Icon(
                                                              Icons.sort,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      10.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final todayList = functions
                                                                  .filterOrdersByToday(
                                                                      ordersAdminOrdersRecordList
                                                                          .toList(),
                                                                      getCurrentTimestamp)
                                                                  .toList();
                                                              return ListView
                                                                  .separated(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .fromLTRB(
                                                                  0,
                                                                  12.0,
                                                                  0,
                                                                  0,
                                                                ),
                                                                primary: false,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    todayList
                                                                        .length,
                                                                separatorBuilder: (_,
                                                                        __) =>
                                                                    const SizedBox(
                                                                        height:
                                                                            12.0),
                                                                itemBuilder:
                                                                    (context,
                                                                        todayListIndex) {
                                                                  final todayListItem =
                                                                      todayList[
                                                                          todayListIndex];
                                                                  return Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        context
                                                                            .pushNamed(
                                                                          'userItems-Admin',
                                                                          queryParameters:
                                                                              {
                                                                            'orderID':
                                                                                serializeParam(
                                                                              todayListItem.reference,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        constraints:
                                                                            const BoxConstraints(
                                                                          maxWidth:
                                                                              570.0,
                                                                        ),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              12.0,
                                                                              16.0,
                                                                              12.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Expanded(
                                                                                flex: 4,
                                                                                child: Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      RichText(
                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                        text: TextSpan(
                                                                                          children: [
                                                                                            const TextSpan(
                                                                                              text: 'Order #: ',
                                                                                              style: TextStyle(),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: todayListItem.reference.id,
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                fontWeight: FontWeight.bold,
                                                                                                fontSize: 15.0,
                                                                                              ),
                                                                                            )
                                                                                          ],
                                                                                          style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                fontFamily: 'Plus Jakarta Sans',
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          dateTimeFormat('d/M h:mm a', todayListItem.createdAt!),
                                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                fontFamily: 'Outfit',
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              if (responsiveVisibility(
                                                                                context: context,
                                                                                phone: false,
                                                                                tablet: false,
                                                                                tabletLandscape: false,
                                                                              ))
                                                                                Expanded(
                                                                                  flex: 1,
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        height: 32.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          borderRadius: BorderRadius.circular(12.0),
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                            width: 2.0,
                                                                                          ),
                                                                                        ),
                                                                                        child: Align(
                                                                                          alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 7.0, 0.0),
                                                                                            child: Text(
                                                                                              '2.5 lbs',
                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: 'Outfit',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              if (responsiveVisibility(
                                                                                context: context,
                                                                                phone: false,
                                                                                tablet: false,
                                                                                tabletLandscape: false,
                                                                              ))
                                                                                Expanded(
                                                                                  flex: 2,
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        height: 32.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).accent1,
                                                                                          borderRadius: BorderRadius.circular(12.0),
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 2.0,
                                                                                          ),
                                                                                        ),
                                                                                        child: Align(
                                                                                          alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                            child: Text(
                                                                                              'Shipped',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              Expanded(
                                                                                flex: 3,
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                      child: RichText(
                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                        text: TextSpan(
                                                                                          children: [
                                                                                            TextSpan(
                                                                                              text: 'Rs ',
                                                                                              style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                    fontFamily: 'Outfit',
                                                                                                    fontSize: 18.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: todayListItem.totalAmount.toString(),
                                                                                              style: const TextStyle(),
                                                                                            )
                                                                                          ],
                                                                                          style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                fontFamily: 'Outfit',
                                                                                                fontSize: 18.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                        textAlign: TextAlign.end,
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          if (responsiveVisibility(
                                                                                            context: context,
                                                                                            desktop: false,
                                                                                          ))
                                                                                            Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(15.0, 4.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                height: 32.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: () {
                                                                                                    if (todayListItem.status == 'on-hold') {
                                                                                                      return FlutterFlowTheme.of(context).accent1;
                                                                                                    } else if (todayListItem.status == 'Accepted') {
                                                                                                      return FlutterFlowTheme.of(context).success;
                                                                                                    } else {
                                                                                                      return FlutterFlowTheme.of(context).error;
                                                                                                    }
                                                                                                  }(),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                  border: Border.all(
                                                                                                    color: () {
                                                                                                      if (todayListItem.service == 'on-hold') {
                                                                                                        return FlutterFlowTheme.of(context).primary;
                                                                                                      } else if (todayListItem.service == 'Accepted') {
                                                                                                        return FlutterFlowTheme.of(context).secondary;
                                                                                                      } else {
                                                                                                        return FlutterFlowTheme.of(context).tertiary;
                                                                                                      }
                                                                                                    }(),
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                ),
                                                                                                child: Align(
                                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Padding(
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                    child: Text(
                                                                                                      todayListItem.status,
                                                                                                      textAlign: TextAlign.center,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Plus Jakarta Sans',
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w800,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          if ((todayListItem.status == 'Accepted') &&
                                                                                              responsiveVisibility(
                                                                                                context: context,
                                                                                                desktop: false,
                                                                                              ))
                                                                                            Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(15.0, 4.0, 0.0, 0.0),
                                                                                              child: Container(
                                                                                                height: 32.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).accent2,
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                  border: Border.all(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                ),
                                                                                                child: Align(
                                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Padding(
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                    child: Text(
                                                                                                      todayListItem.service,
                                                                                                      textAlign: TextAlign.center,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Plus Jakarta Sans',
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w800,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ].addToEnd(const SizedBox(height: 100.0)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 1.0),
                                      child: wrapWithModel(
                                        model: _model.navBar2Model1,
                                        updateCallback: () => setState(() {}),
                                        child: const NavBar2Widget(),
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: [
                                    SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Below are your most recent orders',
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  20.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        constraints:
                                                            const BoxConstraints(
                                                          maxWidth:
                                                              double.infinity,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      12.0,
                                                                      16.0,
                                                                      12.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                flex: 4,
                                                                child: Text(
                                                                  'Order Number',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ),
                                                              if (responsiveVisibility(
                                                                context:
                                                                    context,
                                                                phone: false,
                                                                tablet: false,
                                                                tabletLandscape:
                                                                    false,
                                                              ))
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Text(
                                                                    'Weight',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                              if (responsiveVisibility(
                                                                context:
                                                                    context,
                                                                phone: false,
                                                                tablet: false,
                                                                tabletLandscape:
                                                                    false,
                                                              ))
                                                                Expanded(
                                                                  flex: 2,
                                                                  child: Text(
                                                                    'Status',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Plus Jakarta Sans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                              Expanded(
                                                                flex: 2,
                                                                child: Text(
                                                                  'Amount',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                              Icon(
                                                                Icons.sort,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final toDeliver = functions
                                                                          .filterOrdersByTodayDelivery(
                                                                              ordersAdminOrdersRecordList.toList(),
                                                                              getCurrentTimestamp)
                                                                          ?.toList() ??
                                                                      [];
                                                                  return ListView
                                                                      .separated(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .fromLTRB(
                                                                      0,
                                                                      12.0,
                                                                      0,
                                                                      100.0,
                                                                    ),
                                                                    primary:
                                                                        false,
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount:
                                                                        toDeliver
                                                                            .length,
                                                                    separatorBuilder: (_,
                                                                            __) =>
                                                                        const SizedBox(
                                                                            height:
                                                                                12.0),
                                                                    itemBuilder:
                                                                        (context,
                                                                            toDeliverIndex) {
                                                                      final toDeliverItem =
                                                                          toDeliver[
                                                                              toDeliverIndex];
                                                                      return Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            context.pushNamed(
                                                                              'userItems-Admin',
                                                                              queryParameters: {
                                                                                'orderID': serializeParam(
                                                                                  toDeliverItem.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            constraints:
                                                                                const BoxConstraints(
                                                                              maxWidth: 570.0,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                width: 2.0,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Expanded(
                                                                                    flex: 4,
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          RichText(
                                                                                            textScaler: MediaQuery.of(context).textScaler,
                                                                                            text: TextSpan(
                                                                                              children: [
                                                                                                const TextSpan(
                                                                                                  text: 'Order #: ',
                                                                                                  style: TextStyle(),
                                                                                                ),
                                                                                                TextSpan(
                                                                                                  text: toDeliverItem.reference.id,
                                                                                                  style: TextStyle(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                    fontSize: 15.0,
                                                                                                  ),
                                                                                                )
                                                                                              ],
                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              dateTimeFormat('d/M h:mm a', toDeliverItem.createdAt!),
                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: 'Outfit',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  if (responsiveVisibility(
                                                                                    context: context,
                                                                                    phone: false,
                                                                                    tablet: false,
                                                                                    tabletLandscape: false,
                                                                                  ))
                                                                                    Expanded(
                                                                                      flex: 1,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Container(
                                                                                            height: 32.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                              border: Border.all(
                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                            ),
                                                                                            child: Align(
                                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                              child: Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 7.0, 0.0),
                                                                                                child: Text(
                                                                                                  '2.5 lbs',
                                                                                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: 'Outfit',
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  if (responsiveVisibility(
                                                                                    context: context,
                                                                                    phone: false,
                                                                                    tablet: false,
                                                                                    tabletLandscape: false,
                                                                                  ))
                                                                                    Expanded(
                                                                                      flex: 2,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Container(
                                                                                            height: 32.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).accent1,
                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                              border: Border.all(
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                            ),
                                                                                            child: Align(
                                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                              child: Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                child: Text(
                                                                                                  'Shipped',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Plus Jakarta Sans',
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  Expanded(
                                                                                    flex: 3,
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                          child: RichText(
                                                                                            textScaler: MediaQuery.of(context).textScaler,
                                                                                            text: TextSpan(
                                                                                              children: [
                                                                                                TextSpan(
                                                                                                  text: 'Rs ',
                                                                                                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                        fontFamily: 'Outfit',
                                                                                                        fontSize: 18.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                                TextSpan(
                                                                                                  text: toDeliverItem.totalAmount.toString(),
                                                                                                  style: const TextStyle(),
                                                                                                )
                                                                                              ],
                                                                                              style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                    fontFamily: 'Outfit',
                                                                                                    fontSize: 18.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                            textAlign: TextAlign.end,
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              if (responsiveVisibility(
                                                                                                context: context,
                                                                                                desktop: false,
                                                                                              ))
                                                                                                Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(15.0, 4.0, 0.0, 4.0),
                                                                                                  child: Container(
                                                                                                    height: 32.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: () {
                                                                                                        if (toDeliverItem.status == 'on-hold') {
                                                                                                          return FlutterFlowTheme.of(context).accent1;
                                                                                                        } else if (toDeliverItem.status == 'Accepted') {
                                                                                                          return FlutterFlowTheme.of(context).success;
                                                                                                        } else {
                                                                                                          return FlutterFlowTheme.of(context).error;
                                                                                                        }
                                                                                                      }(),
                                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                                      border: Border.all(
                                                                                                        color: () {
                                                                                                          if (toDeliverItem.status == 'on-hold') {
                                                                                                            return FlutterFlowTheme.of(context).primary;
                                                                                                          } else if (toDeliverItem.status == 'Accepted') {
                                                                                                            return FlutterFlowTheme.of(context).secondary;
                                                                                                          } else {
                                                                                                            return FlutterFlowTheme.of(context).tertiary;
                                                                                                          }
                                                                                                        }(),
                                                                                                        width: 2.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                    child: Align(
                                                                                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                      child: Padding(
                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                        child: Text(
                                                                                                          toDeliverItem.status,
                                                                                                          textAlign: TextAlign.center,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Plus Jakarta Sans',
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w800,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              if ((toDeliverItem.status == 'Accepted') &&
                                                                                                  responsiveVisibility(
                                                                                                    context: context,
                                                                                                    desktop: false,
                                                                                                  ))
                                                                                                Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(15.0, 4.0, 0.0, 0.0),
                                                                                                  child: Container(
                                                                                                    height: 32.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).accent2,
                                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                                      border: Border.all(
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        width: 2.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                    child: Align(
                                                                                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                      child: Padding(
                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                        child: Text(
                                                                                                          toDeliverItem.service,
                                                                                                          textAlign: TextAlign.center,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Plus Jakarta Sans',
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w800,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 1.0),
                                      child: wrapWithModel(
                                        model: _model.navBar2Model2,
                                        updateCallback: () => setState(() {}),
                                        child: const NavBar2Widget(),
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: [
                                    SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 10.0, 0.0, 0.0),
                                                child: Text(
                                                  'Below are your most recent orders',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 20.0, 16.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  constraints: const BoxConstraints(
                                                    maxWidth: double.infinity,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                12.0,
                                                                16.0,
                                                                12.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          flex: 4,
                                                          child: Text(
                                                            'Order Number',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                        if (responsiveVisibility(
                                                          context: context,
                                                          phone: false,
                                                          tablet: false,
                                                          tabletLandscape:
                                                              false,
                                                        ))
                                                          Expanded(
                                                            flex: 1,
                                                            child: Text(
                                                              'Weight',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                        if (responsiveVisibility(
                                                          context: context,
                                                          phone: false,
                                                          tablet: false,
                                                          tabletLandscape:
                                                              false,
                                                        ))
                                                          Expanded(
                                                            flex: 2,
                                                            child: Text(
                                                              'Status',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Plus Jakarta Sans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Text(
                                                            'Amount',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            final datePickedDate =
                                                                await showDatePicker(
                                                              context: context,
                                                              initialDate:
                                                                  getCurrentTimestamp,
                                                              firstDate: (DateTime
                                                                      .fromMicrosecondsSinceEpoch(
                                                                          1717180200000000) ??
                                                                  DateTime(
                                                                      1900)),
                                                              lastDate:
                                                                  (getCurrentTimestamp ??
                                                                      DateTime(
                                                                          2050)),
                                                            );

                                                            if (datePickedDate !=
                                                                null) {
                                                              safeSetState(() {
                                                                _model.datePicked =
                                                                    DateTime(
                                                                  datePickedDate
                                                                      .year,
                                                                  datePickedDate
                                                                      .month,
                                                                  datePickedDate
                                                                      .day,
                                                                );
                                                              });
                                                            }
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .calendar_month,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final groupOrders = functions
                                                                .getOrdersByDate(
                                                                    ordersAdminOrdersRecordList
                                                                        .toList(),
                                                                    getCurrentTimestamp)
                                                                .toList();
                                                            return ListView
                                                                .separated(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                0,
                                                                12.0,
                                                                0,
                                                                0,
                                                              ),
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  groupOrders
                                                                      .length,
                                                              separatorBuilder: (_,
                                                                      __) =>
                                                                  const SizedBox(
                                                                      height:
                                                                          12.0),
                                                              itemBuilder: (context,
                                                                  groupOrdersIndex) {
                                                                final groupOrdersItem =
                                                                    groupOrders[
                                                                        groupOrdersIndex];
                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Align(
                                                                      alignment: const AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            16.0),
                                                                        child:
                                                                            Text(
                                                                          groupOrdersItem
                                                                              .type,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Plus Jakarta Sans',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final group = groupOrdersItem
                                                                            .order
                                                                            .toList();
                                                                        return ListView
                                                                            .separated(
                                                                          padding:
                                                                              const EdgeInsets.fromLTRB(
                                                                            0,
                                                                            12.0,
                                                                            0,
                                                                            0,
                                                                          ),
                                                                          primary:
                                                                              false,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          itemCount:
                                                                              group.length,
                                                                          separatorBuilder: (_, __) =>
                                                                              const SizedBox(height: 12.0),
                                                                          itemBuilder:
                                                                              (context, groupIndex) {
                                                                            final groupItem =
                                                                                group[groupIndex];
                                                                            return Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                              child: StreamBuilder<OrdersRecord>(
                                                                                stream: OrdersRecord.getDocument(groupItem),
                                                                                builder: (context, snapshot) {
                                                                                  // Customize what your widget looks like when it's loading.
                                                                                  if (!snapshot.hasData) {
                                                                                    return Center(
                                                                                      child: SizedBox(
                                                                                        width: 50.0,
                                                                                        height: 50.0,
                                                                                        child: CircularProgressIndicator(
                                                                                          valueColor: AlwaysStoppedAnimation<Color>(
                                                                                            FlutterFlowTheme.of(context).primary,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                  final listContainerOrdersRecord = snapshot.data!;
                                                                                  return InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      context.pushNamed(
                                                                                        'userItems-Admin',
                                                                                        queryParameters: {
                                                                                          'orderID': serializeParam(
                                                                                            groupItem,
                                                                                            ParamType.DocumentReference,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                      );
                                                                                    },
                                                                                    child: Container(
                                                                                      width: double.infinity,
                                                                                      constraints: const BoxConstraints(
                                                                                        maxWidth: 570.0,
                                                                                      ),
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        border: Border.all(
                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                          width: 2.0,
                                                                                        ),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              flex: 4,
                                                                                              child: Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    RichText(
                                                                                                      textScaler: MediaQuery.of(context).textScaler,
                                                                                                      text: TextSpan(
                                                                                                        children: [
                                                                                                          const TextSpan(
                                                                                                            text: 'Order #: ',
                                                                                                            style: TextStyle(),
                                                                                                          ),
                                                                                                          TextSpan(
                                                                                                            text: groupItem.id,
                                                                                                            style: const TextStyle(),
                                                                                                          )
                                                                                                        ],
                                                                                                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                      child: Text(
                                                                                                        dateTimeFormat('d/M h:mm a', listContainerOrdersRecord.createdAt!),
                                                                                                        style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                              fontFamily: 'Outfit',
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            if (responsiveVisibility(
                                                                                              context: context,
                                                                                              phone: false,
                                                                                              tablet: false,
                                                                                              tabletLandscape: false,
                                                                                            ))
                                                                                              Expanded(
                                                                                                flex: 1,
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Container(
                                                                                                      height: 32.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                                        border: Border.all(
                                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                                          width: 2.0,
                                                                                                        ),
                                                                                                      ),
                                                                                                      child: Align(
                                                                                                        alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                        child: Padding(
                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 7.0, 0.0),
                                                                                                          child: Text(
                                                                                                            '2.5 lbs',
                                                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                  fontFamily: 'Outfit',
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            if (responsiveVisibility(
                                                                                              context: context,
                                                                                              phone: false,
                                                                                              tablet: false,
                                                                                              tabletLandscape: false,
                                                                                            ))
                                                                                              Expanded(
                                                                                                flex: 2,
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Container(
                                                                                                      height: 32.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).accent1,
                                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                                        border: Border.all(
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          width: 2.0,
                                                                                                        ),
                                                                                                      ),
                                                                                                      child: Align(
                                                                                                        alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                        child: Padding(
                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                          child: Text(
                                                                                                            'Shipped',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            Expanded(
                                                                                              flex: 3,
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                                    child: RichText(
                                                                                                      textScaler: MediaQuery.of(context).textScaler,
                                                                                                      text: TextSpan(
                                                                                                        children: [
                                                                                                          TextSpan(
                                                                                                            text: 'Rs ',
                                                                                                            style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                  fontFamily: 'Outfit',
                                                                                                                  fontSize: 18.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                          TextSpan(
                                                                                                            text: listContainerOrdersRecord.totalAmount.toString(),
                                                                                                            style: const TextStyle(),
                                                                                                          )
                                                                                                        ],
                                                                                                        style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                              fontFamily: 'Outfit',
                                                                                                              fontSize: 18.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                      textAlign: TextAlign.end,
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        if (responsiveVisibility(
                                                                                                          context: context,
                                                                                                          desktop: false,
                                                                                                        ))
                                                                                                          Padding(
                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(15.0, 4.0, 0.0, 4.0),
                                                                                                            child: Container(
                                                                                                              height: 32.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: () {
                                                                                                                  if (listContainerOrdersRecord.status == 'on-hold') {
                                                                                                                    return FlutterFlowTheme.of(context).accent1;
                                                                                                                  } else if (listContainerOrdersRecord.status == 'Accepted') {
                                                                                                                    return FlutterFlowTheme.of(context).success;
                                                                                                                  } else {
                                                                                                                    return FlutterFlowTheme.of(context).error;
                                                                                                                  }
                                                                                                                }(),
                                                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                                                border: Border.all(
                                                                                                                  color: () {
                                                                                                                    if (listContainerOrdersRecord.status == 'on-hold') {
                                                                                                                      return FlutterFlowTheme.of(context).primary;
                                                                                                                    } else if (listContainerOrdersRecord.status == 'Accepted') {
                                                                                                                      return FlutterFlowTheme.of(context).secondary;
                                                                                                                    } else {
                                                                                                                      return FlutterFlowTheme.of(context).tertiary;
                                                                                                                    }
                                                                                                                  }(),
                                                                                                                  width: 2.0,
                                                                                                                ),
                                                                                                              ),
                                                                                                              child: Align(
                                                                                                                alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                child: Padding(
                                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    listContainerOrdersRecord.status,
                                                                                                                    textAlign: TextAlign.center,
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'Plus Jakarta Sans',
                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FontWeight.w800,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        if ((listContainerOrdersRecord.status == 'Accepted') &&
                                                                                                            responsiveVisibility(
                                                                                                              context: context,
                                                                                                              desktop: false,
                                                                                                            ))
                                                                                                          Padding(
                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(15.0, 4.0, 0.0, 0.0),
                                                                                                            child: Container(
                                                                                                              height: 32.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: FlutterFlowTheme.of(context).accent2,
                                                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                                                border: Border.all(
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                  width: 2.0,
                                                                                                                ),
                                                                                                              ),
                                                                                                              child: Align(
                                                                                                                alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                child: Padding(
                                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    listContainerOrdersRecord.service,
                                                                                                                    textAlign: TextAlign.center,
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'Plus Jakarta Sans',
                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FontWeight.w800,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ].addToEnd(const SizedBox(height: 100.0)),
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 1.0),
                                      child: wrapWithModel(
                                        model: _model.navBar2Model3,
                                        updateCallback: () => setState(() {}),
                                        child: const NavBar2Widget(),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
