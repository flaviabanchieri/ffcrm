import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'load_widget.dart' show LoadWidget;
import 'package:flutter/material.dart';

class LoadModel extends FlutterFlowModel<LoadWidget> {
  ///  Local state fields for this page.

  int? permissao = 0;

  bool? passwordDefault = false;

  DateTime? dataInicial;

  DateTime? dataFinal;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Load widget.
  List<UsuarioRow>? consultaUsuario;
  // Stores action output result for [Backend Call - API (obter painel cards)] action in Load widget.
  ApiCallResponse? painelGestor;
  // Stores action output result for [Backend Call - API (obter painel cards)] action in Load widget.
  ApiCallResponse? painelA;
  // Stores action output result for [Backend Call - API (Concluir antigos  dias ou mais)] action in Load widget.
  ApiCallResponse? concluir;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
