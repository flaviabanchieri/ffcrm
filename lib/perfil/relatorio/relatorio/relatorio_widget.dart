import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/widgets_compartilhados/date_picker/date_picker_widget.dart';
import '/widgets_compartilhados/header/header_widget.dart';
import '/widgets_compartilhados/sidenav/sidenav_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'relatorio_model.dart';
export 'relatorio_model.dart';

class RelatorioWidget extends StatefulWidget {
  const RelatorioWidget({super.key});

  @override
  State<RelatorioWidget> createState() => _RelatorioWidgetState();
}

class _RelatorioWidgetState extends State<RelatorioWidget> {
  late RelatorioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RelatorioModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.queryRetornoRelatorioIniciar = await RelatorioDeGestorCall.call(
        dataFim: '9999-01-01 00:00:00',
        dataInicio: '1999-01-01 00:00:00',
      );

      _model.countLigacoes = valueOrDefault<int>(
        RelatorioDeGestorCall.totalLigacoes(
          (_model.queryRetornoRelatorioIniciar?.jsonBody ?? ''),
        ),
        0,
      );
      _model.listaRelatorio = RelatorioDeGestorCall.ligacoes(
        (_model.queryRetornoRelatorioIniciar?.jsonBody ?? ''),
      )!
          .toList()
          .cast<dynamic>();
      _model.tempoLigacao = valueOrDefault<String>(
        RelatorioDeGestorCall.tempoTotal(
          (_model.queryRetornoRelatorioIniciar?.jsonBody ?? ''),
        )?.toString(),
        '0',
      );
      _model.tempoMedioLigacao = valueOrDefault<String>(
        RelatorioDeGestorCall.tempoMedio(
          (_model.queryRetornoRelatorioIniciar?.jsonBody ?? ''),
        )?.toString(),
        '0',
      );
      _model.faturamento = valueOrDefault<double>(
        RelatorioDeGestorCall.faturamento(
          (_model.queryRetornoRelatorioIniciar?.jsonBody ?? ''),
        ),
        0.0,
      );
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.sidenavModel,
                updateCallback: () => safeSetState(() {}),
                child: const SidenavWidget(),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.headerModel,
                      updateCallback: () => safeSetState(() {}),
                      child: const HeaderWidget(
                        page: 'Relatório de Ligações',
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 20.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 1.0, 0.0),
                                      child: Container(
                                        decoration: const BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              final datePicked1Date =
                                                  await showDatePicker(
                                                context: context,
                                                initialDate:
                                                    getCurrentTimestamp,
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime(2050),
                                                builder: (context, child) {
                                                  return wrapInMaterialDatePickerTheme(
                                                    context,
                                                    child!,
                                                    headerBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    headerForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    headerTextStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineLarge
                                                            .override(
                                                              fontFamily:
                                                                  'Outfit',
                                                              fontSize: 32.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                    pickerBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    pickerForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    selectedDateTimeBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    selectedDateTimeForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    actionButtonForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 24.0,
                                                  );
                                                },
                                              );

                                              if (datePicked1Date != null) {
                                                safeSetState(() {
                                                  _model.datePicked1 = DateTime(
                                                    datePicked1Date.year,
                                                    datePicked1Date.month,
                                                    datePicked1Date.day,
                                                  );
                                                });
                                              }
                                              _model.dataInicial =
                                                  _model.datePicked1;
                                              safeSetState(() {});
                                            },
                                            child: wrapWithModel(
                                              model: _model.datePickerModel1,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: DatePickerWidget(
                                                data: _model.dataInicial,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: const BoxDecoration(),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            final datePicked2Date =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: getCurrentTimestamp,
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime(2050),
                                              builder: (context, child) {
                                                return wrapInMaterialDatePickerTheme(
                                                  context,
                                                  child!,
                                                  headerBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  headerForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                  headerTextStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineLarge
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            fontSize: 32.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                  pickerBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  pickerForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  selectedDateTimeBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  selectedDateTimeForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                  actionButtonForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  iconSize: 24.0,
                                                );
                                              },
                                            );

                                            if (datePicked2Date != null) {
                                              safeSetState(() {
                                                _model.datePicked2 = DateTime(
                                                  datePicked2Date.year,
                                                  datePicked2Date.month,
                                                  datePicked2Date.day,
                                                );
                                              });
                                            }
                                            _model.dataFinal = functions
                                                .dataFinal(_model.datePicked2);
                                            safeSetState(() {});
                                          },
                                          child: wrapWithModel(
                                            model: _model.datePickerModel2,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: DatePickerWidget(
                                              data: _model.dataFinal,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: FutureBuilder<List<UsuarioRow>>(
                                        future: UsuarioTable().queryRows(
                                          queryFn: (q) => q
                                              .eq(
                                                'permissao',
                                                2,
                                              )
                                              .neq(
                                                'situacao',
                                                2,
                                              )
                                              .order('nome', ascending: true),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
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
                                          List<UsuarioRow>
                                              dropDownAtendenteUsuarioRowList =
                                              snapshot.data!;

                                          return FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownAtendenteValueController ??=
                                                FormFieldController<String>(
                                              _model.dropDownAtendenteValue ??=
                                                  '',
                                            ),
                                            options: List<String>.from(
                                                dropDownAtendenteUsuarioRowList
                                                    .map((e) => e.user)
                                                    .withoutNulls
                                                    .toList()),
                                            optionLabels:
                                                dropDownAtendenteUsuarioRowList
                                                    .map((e) => e.nome)
                                                    .withoutNulls
                                                    .toList(),
                                            onChanged: (val) => safeSetState(
                                                () => _model
                                                        .dropDownAtendenteValue =
                                                    val),
                                            width: 300.0,
                                            height: 56.0,
                                            searchHintTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Manrope',
                                                      letterSpacing: 0.0,
                                                    ),
                                            searchTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Manrope',
                                                      letterSpacing: 0.0,
                                                    ),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Manrope',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText: 'Atendente',
                                            searchHintText: 'Pesqusie por nome',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 2.0,
                                            borderRadius: 8.0,
                                            margin:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            hidesUnderline: true,
                                            isOverButton: true,
                                            isSearchable: true,
                                            isMultiSelect: false,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: FutureBuilder<List<ProdutoRow>>(
                                        future: ProdutoTable().queryRows(
                                          queryFn: (q) =>
                                              q.order('nome', ascending: true),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
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
                                          List<ProdutoRow>
                                              dropDownProdutoProdutoRowList =
                                              snapshot.data!;

                                          return FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownProdutoValueController ??=
                                                FormFieldController<String>(
                                              _model.dropDownProdutoValue ??=
                                                  '',
                                            ),
                                            options: List<String>.from(
                                                dropDownProdutoProdutoRowList
                                                    .map((e) => e.codigo)
                                                    .withoutNulls
                                                    .toList()),
                                            optionLabels:
                                                dropDownProdutoProdutoRowList
                                                    .map((e) => e.nome)
                                                    .toList(),
                                            onChanged: (val) => safeSetState(
                                                () => _model
                                                        .dropDownProdutoValue =
                                                    val),
                                            width: 300.0,
                                            height: 56.0,
                                            searchHintTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Manrope',
                                                      letterSpacing: 0.0,
                                                    ),
                                            searchTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Manrope',
                                                      letterSpacing: 0.0,
                                                    ),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Manrope',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText: 'Produto',
                                            searchHintText: 'Pesquise por nome',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 2.0,
                                            borderRadius: 8.0,
                                            margin:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            hidesUnderline: true,
                                            isOverButton: true,
                                            isSearchable: true,
                                            isMultiSelect: false,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: FutureBuilder<List<LeadOrigemRow>>(
                                        future: LeadOrigemTable().queryRows(
                                          queryFn: (q) => q,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
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
                                          List<LeadOrigemRow>
                                              dropDownOrigemLeadOrigemRowList =
                                              snapshot.data!;

                                          return FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownOrigemValueController ??=
                                                FormFieldController<String>(
                                              _model.dropDownOrigemValue ??= '',
                                            ),
                                            options: List<String>.from(
                                                dropDownOrigemLeadOrigemRowList
                                                    .map((e) => e.origem)
                                                    .withoutNulls
                                                    .toList()),
                                            optionLabels:
                                                dropDownOrigemLeadOrigemRowList
                                                    .map((e) => e.traducao)
                                                    .withoutNulls
                                                    .toList(),
                                            onChanged: (val) => safeSetState(
                                                () => _model
                                                    .dropDownOrigemValue = val),
                                            width: 300.0,
                                            height: 56.0,
                                            searchHintTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Manrope',
                                                      letterSpacing: 0.0,
                                                    ),
                                            searchTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Manrope',
                                                      letterSpacing: 0.0,
                                                    ),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Manrope',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText: 'Tag de origem',
                                            searchHintText: 'Pesquise pela tag',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 2.0,
                                            borderRadius: 8.0,
                                            margin:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            hidesUnderline: true,
                                            isOverButton: true,
                                            isSearchable: true,
                                            isMultiSelect: false,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: FutureBuilder<List<LeadStatusRow>>(
                                        future: LeadStatusTable().queryRows(
                                          queryFn: (q) => q,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
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
                                          List<LeadStatusRow>
                                              dropDownStatusLeadStatusRowList =
                                              snapshot.data!;

                                          return FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownStatusValueController ??=
                                                FormFieldController<String>(
                                              _model.dropDownStatusValue ??= '',
                                            ),
                                            options:
                                                dropDownStatusLeadStatusRowList
                                                    .map((e) => e.status)
                                                    .toList(),
                                            onChanged: (val) => safeSetState(
                                                () => _model
                                                    .dropDownStatusValue = val),
                                            width: 300.0,
                                            height: 56.0,
                                            searchHintTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Manrope',
                                                      letterSpacing: 0.0,
                                                    ),
                                            searchTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Manrope',
                                                      letterSpacing: 0.0,
                                                    ),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Manrope',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText: 'Status',
                                            searchHintText:
                                                'Pesquise o nome status',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 2.0,
                                            borderRadius: 8.0,
                                            margin:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            hidesUnderline: true,
                                            isOverButton: true,
                                            isSearchable: true,
                                            isMultiSelect: false,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        _model.urlcsv =
                                            await DownloadCSVCall.call(
                                          dataInicial: valueOrDefault<String>(
                                            _model.dataInicial?.toString(),
                                            '1999-01-01 00:00:00',
                                          ),
                                          dataFinal: valueOrDefault<String>(
                                            _model.dataFinal?.toString(),
                                            '9999-01-01 00:00:00',
                                          ),
                                          atendente:
                                              _model.dropDownAtendenteValue,
                                          origemLead:
                                              _model.dropDownOrigemValue,
                                          produtoCodigo:
                                              _model.dropDownProdutoValue,
                                          statusLead:
                                              _model.dropDownStatusValue,
                                        );

                                        if ((_model.urlcsv?.succeeded ??
                                            true)) {
                                          await launchURL(
                                              valueOrDefault<String>(
                                            DownloadCSVCall.link(
                                              (_model.urlcsv?.jsonBody ?? ''),
                                            ),
                                            'www.google.com',
                                          ));
                                        }

                                        safeSetState(() {});
                                      },
                                      text: 'Baixar csv',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Manrope',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        _model.listaRelatorio =
                                            RelatorioDeGestorCall.ligacoes(
                                          (_model.queryRetornoRelatorioIniciar
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                                .toList()
                                                .cast<dynamic>();
                                        _model.dataInicial = null;
                                        _model.dataFinal = null;
                                        _model.tempoLigacao =
                                            valueOrDefault<String>(
                                          RelatorioDeGestorCall.tempoTotal(
                                            (_model.queryRetornoRelatorioIniciar
                                                    ?.jsonBody ??
                                                ''),
                                          )?.toString(),
                                          '0',
                                        );
                                        _model.tempoMedioLigacao =
                                            valueOrDefault<String>(
                                          RelatorioDeGestorCall.tempoMedio(
                                            (_model.queryRetornoRelatorioIniciar
                                                    ?.jsonBody ??
                                                ''),
                                          )?.toString(),
                                          '0',
                                        );
                                        _model.faturamento =
                                            valueOrDefault<double>(
                                          RelatorioDeGestorCall.faturamento(
                                            (_model.queryRetornoRelatorioIniciar
                                                    ?.jsonBody ??
                                                ''),
                                          ),
                                          0.0,
                                        );
                                        _model.countLigacoes =
                                            valueOrDefault<int>(
                                          RelatorioDeGestorCall.totalLigacoes(
                                            (_model.queryRetornoRelatorioIniciar
                                                    ?.jsonBody ??
                                                ''),
                                          ),
                                          0,
                                        );
                                        safeSetState(() {});
                                        safeSetState(() {
                                          _model
                                              .dropDownAtendenteValueController
                                              ?.reset();
                                          _model.dropDownProdutoValueController
                                              ?.reset();
                                          _model.dropDownOrigemValueController
                                              ?.reset();
                                          _model.dropDownStatusValueController
                                              ?.reset();
                                        });
                                      },
                                      text: 'Limpar Filtros',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: const Color(0xFF69ABE9),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Manrope',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      _model.apiResultRelatorioFiltro =
                                          await RelatorioDeGestorCall.call(
                                        nomeUsuario:
                                            _model.dropDownAtendenteValue,
                                        dataInicio: valueOrDefault<String>(
                                          _model.dataInicial?.toString(),
                                          '1999-01-01 00:00:00',
                                        ),
                                        dataFim: valueOrDefault<String>(
                                          _model.dataFinal?.toString(),
                                          '9999-01-01 00:00:00',
                                        ),
                                        origem: _model.dropDownOrigemValue,
                                        produtoCodigo:
                                            _model.dropDownProdutoValue,
                                        statusLead: _model.dropDownStatusValue,
                                        pagina: _model.pagina,
                                      );

                                      _model.listaRelatorio =
                                          RelatorioDeGestorCall.ligacoes(
                                        (_model.apiResultRelatorioFiltro
                                                ?.jsonBody ??
                                            ''),
                                      )!
                                              .toList()
                                              .cast<dynamic>();
                                      _model.countLigacoes =
                                          valueOrDefault<int>(
                                        RelatorioDeGestorCall.totalLigacoes(
                                          (_model.apiResultRelatorioFiltro
                                                  ?.jsonBody ??
                                              ''),
                                        ),
                                        0,
                                      );
                                      _model.tempoLigacao =
                                          valueOrDefault<String>(
                                        RelatorioDeGestorCall.tempoTotal(
                                          (_model.apiResultRelatorioFiltro
                                                  ?.jsonBody ??
                                              ''),
                                        )?.toString(),
                                        '0',
                                      );
                                      _model.tempoMedioLigacao =
                                          valueOrDefault<String>(
                                        RelatorioDeGestorCall.tempoMedio(
                                          (_model.apiResultRelatorioFiltro
                                                  ?.jsonBody ??
                                              ''),
                                        )?.toString(),
                                        '0',
                                      );
                                      _model.faturamento =
                                          valueOrDefault<double>(
                                        RelatorioDeGestorCall.faturamento(
                                          (_model.apiResultRelatorioFiltro
                                                  ?.jsonBody ??
                                              ''),
                                        ),
                                        0.0,
                                      );
                                      safeSetState(() {});

                                      safeSetState(() {});
                                    },
                                    text: 'Filtrar Relatório',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Manrope',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 3.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Wrap(
                                      spacing: 30.0,
                                      runSpacing: 30.0,
                                      alignment: WrapAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Ligações realizadas',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                _model.countLigacoes
                                                    ?.toString(),
                                                '0',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Tempo de ligação',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                functions.formatSeconds(
                                                    _model.tempoLigacao!),
                                                '00:00:00',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Tempo médio de ligação',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              '${functions.formatSeconds(valueOrDefault<String>(
                                                _model.tempoMedioLigacao,
                                                '00:00:00',
                                              ))}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Faturamento',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                functions.mascaraValorReal(
                                                    _model.faturamento),
                                                '0',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 12.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 8.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(8.0),
                                                topRight: Radius.circular(8.0),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    tablet: false,
                                                  ))
                                                    Expanded(
                                                      flex: 2,
                                                      child: Text(
                                                        'Data',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Manrope',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  Expanded(
                                                    flex: 4,
                                                    child: Text(
                                                      'Lead',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelSmall
                                                          .override(
                                                            fontFamily:
                                                                'Manrope',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Text(
                                                      'Atendente',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelSmall
                                                          .override(
                                                            fontFamily:
                                                                'Manrope',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Text(
                                                      'Origem',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelSmall
                                                          .override(
                                                            fontFamily:
                                                                'Manrope',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                  ))
                                                    Expanded(
                                                      flex: 2,
                                                      child: Text(
                                                        'Tempo da ligação\n(segundos)',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Manrope',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      'Produto',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelSmall
                                                          .override(
                                                            fontFamily:
                                                                'Manrope',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      'Status',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelSmall
                                                          .override(
                                                            fontFamily:
                                                                'Manrope',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                  const Icon(
                                                    Icons.arrow_back,
                                                    color: Color(0x00161C24),
                                                    size: 24.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 100.0,
                                          decoration: const BoxDecoration(),
                                          child: Builder(
                                            builder: (context) {
                                              final relatorio = _model
                                                  .listaRelatorio
                                                  .toList();

                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: relatorio.length,
                                                separatorBuilder: (_, __) =>
                                                    const SizedBox(height: 10.0),
                                                itemBuilder:
                                                    (context, relatorioIndex) {
                                                  final relatorioItem =
                                                      relatorio[relatorioIndex];
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 1.0),
                                                    child: Container(
                                                      width: 100.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 0.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            offset: const Offset(
                                                              0.0,
                                                              1.0,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            if (responsiveVisibility(
                                                              context: context,
                                                              phone: false,
                                                              tablet: false,
                                                            ))
                                                              Expanded(
                                                                flex: 2,
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      functions.dataHoraAmPm(
                                                                          functions
                                                                              .converterStringParaData(getJsonField(
                                                                        relatorioItem,
                                                                        r'''$.data_ligacao''',
                                                                      ).toString())),
                                                                      '00/00/0000 00:00:00',
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Manrope',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            Expanded(
                                                              flex: 4,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  getJsonField(
                                                                    relatorioItem,
                                                                    r'''$.nome_lead''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Manrope',
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 3,
                                                              child: Text(
                                                                getJsonField(
                                                                  relatorioItem,
                                                                  r'''$.nome_atendente''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Manrope',
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 3,
                                                              child: Text(
                                                                getJsonField(
                                                                  relatorioItem,
                                                                  r'''$.origem''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Manrope',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                            if (responsiveVisibility(
                                                              context: context,
                                                              phone: false,
                                                            ))
                                                              Expanded(
                                                                flex: 2,
                                                                child: Text(
                                                                  getJsonField(
                                                                    relatorioItem,
                                                                    r'''$.tempo_ligacao''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  if (responsiveVisibility(
                                                                    context:
                                                                        context,
                                                                    phone:
                                                                        false,
                                                                  ))
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Text(
                                                                        getJsonField(
                                                                          relatorioItem,
                                                                          r'''$.nome_produto''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  if (responsiveVisibility(
                                                                    context:
                                                                        context,
                                                                    phone:
                                                                        false,
                                                                  ))
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Text(
                                                                        getJsonField(
                                                                          relatorioItem,
                                                                          r'''$.status_lead''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Aguarde alguns instantes',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent4,
                                                                        ),
                                                                      ),
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                    ),
                                                                  );
                                                                  _model.apiResult218 =
                                                                      await GravacoesCall
                                                                          .call(
                                                                    userId:
                                                                        currentUserUid,
                                                                    ligacaoId:
                                                                        getJsonField(
                                                                      relatorioItem,
                                                                      r'''$.id''',
                                                                    ).toString(),
                                                                  );

                                                                  if ((_model
                                                                          .apiResult218
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    await launchURL(
                                                                        GravacoesCall
                                                                            .url(
                                                                      (_model.apiResult218
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )!);
                                                                  } else {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Não foi possivel salvar a gravação',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            const Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).error,
                                                                      ),
                                                                    );
                                                                  }

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .download_sharp,
                                                                  color: getJsonField(
                                                                            relatorioItem,
                                                                            r'''$.url_gravacao''',
                                                                          ) !=
                                                                          null
                                                                      ? FlutterFlowTheme.of(context).primaryText
                                                                      : Colors.transparent,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 1.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    if (_model.pagina > 1)
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.pagina = _model.pagina + -1;
                                          safeSetState(() {});
                                          _model.apiResultRelatorioFiltroCopy =
                                              await RelatorioDeGestorCall.call(
                                            nomeUsuario:
                                                _model.dropDownAtendenteValue,
                                            dataInicio: valueOrDefault<String>(
                                              _model.dataInicial?.toString(),
                                              '1999-01-01 00:00:00',
                                            ),
                                            dataFim: valueOrDefault<String>(
                                              functions
                                                  .dataFinal(_model.dataFinal)
                                                  ?.toString(),
                                              '9999-01-01 00:00:00',
                                            ),
                                            origem: _model.dropDownOrigemValue,
                                            produtoCodigo:
                                                _model.dropDownProdutoValue,
                                            statusLead:
                                                _model.dropDownStatusValue,
                                            pagina: _model.pagina,
                                          );

                                          _model.countLigacoes =
                                              valueOrDefault<int>(
                                            RelatorioDeGestorCall.totalLigacoes(
                                              (_model.apiResultRelatorioFiltroCopy
                                                      ?.jsonBody ??
                                                  ''),
                                            ),
                                            0,
                                          );
                                          _model.listaRelatorio =
                                              RelatorioDeGestorCall.ligacoes(
                                            (_model.apiResultRelatorioFiltroCopy
                                                    ?.jsonBody ??
                                                ''),
                                          )!
                                                  .toList()
                                                  .cast<dynamic>();
                                          _model.tempoLigacao =
                                              valueOrDefault<String>(
                                            RelatorioDeGestorCall.tempoTotal(
                                              (_model.apiResultRelatorioFiltroCopy
                                                      ?.jsonBody ??
                                                  ''),
                                            )?.toString(),
                                            '0',
                                          );
                                          _model.tempoMedioLigacao =
                                              valueOrDefault<String>(
                                            RelatorioDeGestorCall.tempoMedio(
                                              (_model.apiResultRelatorioFiltroCopy
                                                      ?.jsonBody ??
                                                  ''),
                                            )?.toString(),
                                            '0',
                                          );
                                          _model.faturamento =
                                              valueOrDefault<double>(
                                            RelatorioDeGestorCall.faturamento(
                                              (_model.apiResultRelatorioFiltroCopy
                                                      ?.jsonBody ??
                                                  ''),
                                            ),
                                            0.0,
                                          );
                                          safeSetState(() {});

                                          safeSetState(() {});
                                        },
                                        child: Icon(
                                          Icons.arrow_back,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                    if (_model.pagina <
                                        valueOrDefault<int>(
                                          ((valueOrDefault<int>(
                                                    _model.countLigacoes,
                                                    0,
                                                  ) /
                                                  10)
                                              .ceil()),
                                          0,
                                        ))
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.pagina = _model.pagina + 1;
                                          safeSetState(() {});
                                          _model.apiResultRelatorioFiltroCopyCopy =
                                              await RelatorioDeGestorCall.call(
                                            nomeUsuario:
                                                _model.dropDownAtendenteValue,
                                            dataInicio: valueOrDefault<String>(
                                              _model.dataInicial?.toString(),
                                              '1999-01-01 00:00:00',
                                            ),
                                            dataFim: valueOrDefault<String>(
                                              functions
                                                  .dataFinal(_model.dataFinal)
                                                  ?.toString(),
                                              '9999-01-01 00:00:00',
                                            ),
                                            origem: _model.dropDownOrigemValue,
                                            produtoCodigo:
                                                _model.dropDownProdutoValue,
                                            statusLead:
                                                _model.dropDownStatusValue,
                                            pagina: _model.pagina,
                                          );

                                          _model.countLigacoes =
                                              RelatorioDeGestorCall
                                                  .totalLigacoes(
                                            (_model.apiResultRelatorioFiltroCopyCopy
                                                    ?.jsonBody ??
                                                ''),
                                          );
                                          _model.listaRelatorio =
                                              RelatorioDeGestorCall.ligacoes(
                                            (_model.apiResultRelatorioFiltroCopyCopy
                                                    ?.jsonBody ??
                                                ''),
                                          )!
                                                  .toList()
                                                  .cast<dynamic>();
                                          _model.tempoLigacao =
                                              valueOrDefault<String>(
                                            RelatorioDeGestorCall.tempoTotal(
                                              (_model.apiResultRelatorioFiltroCopyCopy
                                                      ?.jsonBody ??
                                                  ''),
                                            )?.toString(),
                                            '0',
                                          );
                                          _model.tempoMedioLigacao =
                                              valueOrDefault<String>(
                                            RelatorioDeGestorCall.tempoMedio(
                                              (_model.apiResultRelatorioFiltroCopyCopy
                                                      ?.jsonBody ??
                                                  ''),
                                            )?.toString(),
                                            '0',
                                          );
                                          _model.faturamento =
                                              valueOrDefault<double>(
                                            RelatorioDeGestorCall.faturamento(
                                              (_model.apiResultRelatorioFiltroCopyCopy
                                                      ?.jsonBody ??
                                                  ''),
                                            ),
                                            0.0,
                                          );
                                          safeSetState(() {});

                                          safeSetState(() {});
                                        },
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ].divide(const SizedBox(height: 20.0)),
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
      ),
    );
  }
}
