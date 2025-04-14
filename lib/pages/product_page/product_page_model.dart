import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'product_page_widget.dart' show ProductPageWidget;
import 'package:flutter/material.dart';

class ProductPageModel extends FlutterFlowModel<ProductPageWidget> {
  ///  Local state fields for this page.

  String productName = ' ';

  double? productPrice = 0.0;

  String productDescription = ' ';

  String headerImage =
      '//cdn.shopify.com/s/files/1/0717/1575/0109/files/A7V00096.jpg?v=1739312042';

  List<String> bodyImages = [];
  void addToBodyImages(String item) => bodyImages.add(item);
  void removeFromBodyImages(String item) => bodyImages.remove(item);
  void removeAtIndexFromBodyImages(int index) => bodyImages.removeAt(index);
  void insertAtIndexInBodyImages(int index, String item) =>
      bodyImages.insert(index, item);
  void updateBodyImagesAtIndex(int index, Function(String) updateFn) =>
      bodyImages[index] = updateFn(bodyImages[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Product Information)] action in productPage widget.
  ApiCallResponse? apiResultProductInfo;
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
