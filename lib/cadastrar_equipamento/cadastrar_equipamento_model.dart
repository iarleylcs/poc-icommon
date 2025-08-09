import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'cadastrar_equipamento_widget.dart' show CadastrarEquipamentoWidget;
import 'package:flutter/material.dart';

class CadastrarEquipamentoModel
    extends FlutterFlowModel<CadastrarEquipamentoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  bool isDataUploading_uploadData1d9 = false;
  FFUploadedFile uploadedLocalFile_uploadData1d9 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData1d9 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
