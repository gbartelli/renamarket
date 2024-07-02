import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/criar_produto/criar_produto_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'produtos_model.dart';
export 'produtos_model.dart';

class ProdutosWidget extends StatefulWidget {
  const ProdutosWidget({super.key});

  @override
  State<ProdutosWidget> createState() => _ProdutosWidgetState();
}

class _ProdutosWidgetState extends State<ProdutosWidget> {
  late ProdutosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProdutosModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Stack(
        children: [
          Container(
            height: 180.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondary,
            ),
            child: Align(
              alignment: const AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                child: Image.asset(
                  'assets/images/renamarket-logo.png',
                  width: 128.0,
                  height: 128.0,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 160.0, 0.0, 0.0),
            child: Container(
              height: 80.0,
              decoration: const BoxDecoration(),
              child: Stack(
                children: [
                  if (!(Theme.of(context).brightness == Brightness.dark))
                    Image.asset(
                      'assets/images/divisor-light.png',
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      fit: BoxFit.fill,
                    ),
                  if (Theme.of(context).brightness == Brightness.dark)
                    Image.asset(
                      'assets/images/divisor-dark.png',
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      fit: BoxFit.fill,
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 210.0, 0.0, 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: 400.0,
                  ),
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      StreamBuilder<List<ProdutosRecord>>(
                        stream: queryProdutosRecord(
                          queryBuilder: (produtosRecord) =>
                              produtosRecord.where(
                            'comprado',
                            isEqualTo: false,
                          ),
                        ),
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
                          List<ProdutosRecord>
                              listviewNaoCompradosProdutosRecordList =
                              snapshot.data!;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount:
                                listviewNaoCompradosProdutosRecordList.length,
                            itemBuilder: (context, listviewNaoCompradosIndex) {
                              final listviewNaoCompradosProdutosRecord =
                                  listviewNaoCompradosProdutosRecordList[
                                      listviewNaoCompradosIndex];
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 8.0, 24.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          icon: FaIcon(
                                            FontAwesomeIcons.circle,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 18.0,
                                          ),
                                          onPressed: () async {
                                            await listviewNaoCompradosProdutosRecord
                                                .reference
                                                .update(
                                                    createProdutosRecordData(
                                              comprado: true,
                                            ));
                                          },
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            listviewNaoCompradosProdutosRecord
                                                .produto,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
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
                      StreamBuilder<List<ProdutosRecord>>(
                        stream: queryProdutosRecord(
                          queryBuilder: (produtosRecord) =>
                              produtosRecord.where(
                            'comprado',
                            isEqualTo: true,
                          ),
                        ),
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
                          List<ProdutosRecord>
                              listviewCompradosProdutosRecordList =
                              snapshot.data!;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount:
                                listviewCompradosProdutosRecordList.length,
                            itemBuilder: (context, listviewCompradosIndex) {
                              final listviewCompradosProdutosRecord =
                                  listviewCompradosProdutosRecordList[
                                      listviewCompradosIndex];
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 8.0, 24.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          icon: FaIcon(
                                            FontAwesomeIcons.solidCheckCircle,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 18.0,
                                          ),
                                          onPressed: () async {
                                            await listviewCompradosProdutosRecord
                                                .reference
                                                .update(
                                                    createProdutosRecordData(
                                              comprado: false,
                                            ));
                                          },
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            listviewCompradosProdutosRecord
                                                .produto,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
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
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.95),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 100.0,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 12.0,
                            color: Color(0x99FCA120),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                            spreadRadius: 0.0,
                          )
                        ],
                        shape: BoxShape.circle,
                      ),
                      child: Builder(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await showDialog(
                              barrierColor: const Color(0x4D000000),
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: const AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: const CriarProdutoWidget(),
                                );
                              },
                            ).then((value) => setState(() {}));
                          },
                          child: const Icon(
                            Icons.add_shopping_cart_rounded,
                            color: Colors.white,
                            size: 28.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(1.0, -1.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                GoRouter.of(context).prepareAuthEvent();
                await authManager.signOut();
                GoRouter.of(context).clearRedirectLocation();

                context.goNamedAuth('cadastro', context.mounted);
              },
              child: Container(
                width: 40.0,
                height: 40.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: const Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: FaIcon(
                    FontAwesomeIcons.signOutAlt,
                    color: Colors.white,
                    size: 16.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
