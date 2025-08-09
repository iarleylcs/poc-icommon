import '/auth/firebase_auth/auth_util.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'meus_dados_page_widget.dart' show MeusDadosPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MeusDadosPageModel extends FlutterFlowModel<MeusDadosPageWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDataNr2 = false;
  FFUploadedFile uploadedLocalFile_uploadDataNr2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataNr2 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
