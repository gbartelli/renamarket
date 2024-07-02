import '/flutter_flow/flutter_flow_util.dart';
import 'criar_produto_widget.dart' show CriarProdutoWidget;
import 'package:flutter/material.dart';

class CriarProdutoModel extends FlutterFlowModel<CriarProdutoWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
