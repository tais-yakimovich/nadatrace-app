import '/flutter_flow/flutter_flow_util.dart';
import 'tracking_widget.dart' show TrackingWidget;
import 'package:flutter/material.dart';

class TrackingModel extends FlutterFlowModel<TrackingWidget> {
  ///  Local state fields for this page.
  /// whether or not bottom container is expanded
  bool isExpanded = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
