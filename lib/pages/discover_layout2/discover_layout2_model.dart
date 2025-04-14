import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'discover_layout2_widget.dart' show DiscoverLayout2Widget;
import 'package:flutter/material.dart';

class DiscoverLayout2Model extends FlutterFlowModel<DiscoverLayout2Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
