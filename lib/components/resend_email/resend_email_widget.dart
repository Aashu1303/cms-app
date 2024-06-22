import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'resend_email_model.dart';
export 'resend_email_model.dart';

class ResendEmailWidget extends StatefulWidget {
  const ResendEmailWidget({super.key});

  @override
  State<ResendEmailWidget> createState() => _ResendEmailWidgetState();
}

class _ResendEmailWidgetState extends State<ResendEmailWidget> {
  late ResendEmailModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResendEmailModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Email Not Verified',
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Plus Jakarta Sans',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              FlutterFlowIconButton(
                buttonSize: 40.0,
                icon: Icon(
                  Icons.cancel_outlined,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('RESEND_EMAIL_cancel_outlined_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_navigate_to');

                  context.pushNamed('login');
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Text(
              'Your email is not yet verified. Please check your inbox and spam folder for the verification email.',
              textAlign: TextAlign.justify,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Plus Jakarta Sans',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              logFirebaseEvent('RESEND_EMAIL_RESEND_VERIFICATION_EMAIL_B');
              logFirebaseEvent('Button_auth');
              await authManager.sendEmailVerification();
            },
            text: 'Resend Verification Email',
            options: FFButtonOptions(
              width: 200.0,
              height: 45.0,
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'Outfit',
                    color: Colors.white,
                    letterSpacing: 0.0,
                  ),
              elevation: 2.0,
            ),
          ),
        ],
      ),
    );
  }
}
