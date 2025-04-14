import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'product_page_model.dart';
export 'product_page_model.dart';

class ProductPageWidget extends StatefulWidget {
  const ProductPageWidget({super.key});

  static String routeName = 'productPage';
  static String routePath = '/productPage';

  @override
  State<ProductPageWidget> createState() => _ProductPageWidgetState();
}

class _ProductPageWidgetState extends State<ProductPageWidget> {
  late ProductPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'productPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PRODUCT_productPage_ON_INIT_STATE');
      logFirebaseEvent('productPage_backend_call');
      _model.apiResultProductInfo = await GetProductInformationCall.call(
        productName: 'compostable-sandwich-bag',
      );

      if ((_model.apiResultProductInfo?.succeeded ?? true)) {
        logFirebaseEvent('productPage_update_page_state');
        _model.productName = GetProductInformationCall.title(
          (_model.apiResultProductInfo?.jsonBody ?? ''),
        )!;
        _model.productPrice = GetProductInformationCall.price(
          (_model.apiResultProductInfo?.jsonBody ?? ''),
        )?.toDouble();
        _model.productDescription = GetProductInformationCall.description(
          (_model.apiResultProductInfo?.jsonBody ?? ''),
        )!;
        _model.headerImage = GetProductInformationCall.headerimage(
          (_model.apiResultProductInfo?.jsonBody ?? ''),
        )!;
        _model.bodyImages = GetProductInformationCall.imagelist(
          (_model.apiResultProductInfo?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        safeSetState(() {});
      } else {
        logFirebaseEvent('productPage_show_snack_bar');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Failed to load product information.',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
        logFirebaseEvent('productPage_navigate_to');

        context.pushNamed(DiscoverLayout1Widget.routeName);
      }
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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        key: ValueKey('Text_8gd5'),
                        _model.productName,
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Montserrat',
                              letterSpacing: 0.0,
                            ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          _model.headerImage,
                          width: 388.0,
                          height: 200.0,
                          fit: BoxFit.cover,
                          alignment: Alignment(0.0, -1.0),
                        ),
                      ),
                      Text(
                        valueOrDefault<String>(
                          formatNumber(
                            (double var1) {
                              return var1 = var1 / 100;
                            }(_model.productPrice!),
                            formatType: FormatType.decimal,
                            decimalType: DecimalType.automatic,
                            currency: '\$',
                          ),
                          '0',
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              letterSpacing: 0.0,
                            ),
                      ),
                      FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'coming soon!',
                        options: FFButtonOptions(
                          width: 300.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          textStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          final test = _model.bodyImages.toList();

                          return Container(
                            width: 388.0,
                            height: 200.0,
                            child: PageView.builder(
                              controller: _model.pageViewController ??=
                                  PageController(
                                      initialPage:
                                          max(0, min(0, test.length - 1))),
                              scrollDirection: Axis.horizontal,
                              itemCount: test.length,
                              itemBuilder: (context, testIndex) {
                                final testItem = test[testIndex];
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    _model.bodyImages
                                        .elementAtOrNull(testIndex)!,
                                    width: 200.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        child: Text(
                          functions
                              .newCustomFunction(_model.productDescription),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ].divide(SizedBox(height: 15.0)),
                  ),
                ),
              ),
              Divider(
                thickness: 2.0,
                color: FlutterFlowTheme.of(context).alternate,
              ),
              FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('PRODUCT_RETURN_TO_DISCOVER_BTN_ON_TAP');
                  logFirebaseEvent('Button_navigate_to');

                  context.goNamed(DiscoverLayout1Widget.routeName);
                },
                text: 'return to discover',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFFA49E8F),
                  textStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primaryText,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ].divide(SizedBox(height: 15.0)),
          ),
        ),
      ),
    );
  }
}
