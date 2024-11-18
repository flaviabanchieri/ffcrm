import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'cadastro_usuarios_widget.dart' show CadastroUsuariosWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class CadastroUsuariosModel extends FlutterFlowModel<CadastroUsuariosWidget> {
  ///  Local state fields for this page.

  String? padrao = '123456';

  int? countUser = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for nameUser widget.
  FocusNode? nameUserFocusNode;
  TextEditingController? nameUserTextController;
  String? Function(BuildContext, String?)? nameUserTextControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for permissao widget.
  int? permissaoValue;
  FormFieldController<int>? permissaoValueController;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsuarioRow>? possuiUser;
  Completer<List<UsuarioRow>>? requestCompleter;
  // Stores action output result for [Backend Call - API (apagarUsuario)] action in IconButton widget.
  ApiCallResponse? apiResultnla;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameUserFocusNode?.dispose();
    nameUserTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
