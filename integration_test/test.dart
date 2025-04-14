import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test/integration_test.dart';
import 'package:nadatrace_app/flutter_flow/flutter_flow_drop_down.dart';
import 'package:nadatrace_app/flutter_flow/flutter_flow_icon_button.dart';
import 'package:nadatrace_app/flutter_flow/flutter_flow_widgets.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:nadatrace_app/index.dart';
import 'package:nadatrace_app/main.dart';
import 'package:nadatrace_app/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';
import 'package:nadatrace_app/backend/firebase/firebase_config.dart';
import 'package:nadatrace_app/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();
  });

  setUp(() async {
    await authManager.signOut();
  });

  testWidgets('US4 Golden Path', (WidgetTester tester) async {
    _overrideOnError();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'sarahtest@mail.com', password: 'password');
    await tester.pumpWidget(MyApp(
      entryPage: DiscoverLayout1Widget(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(const Duration(milliseconds: 60000));
    await tester.tap(find.byKey(const ValueKey('learnButton_rer7')));
    await tester.pump(kDoubleTapMinTime);
    await tester.tap(find.byKey(const ValueKey('learnButton_rer7')));
    await tester.pumpAndSettle(const Duration(milliseconds: 60000));
    expect(find.byKey(const ValueKey('Text_8gd5')), findsOneWidget);
  });

  testWidgets('US3 User Account Creation', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(MyApp(
      entryPage: LoginWidget(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(const Duration(milliseconds: 60000));
    await tester.enterText(
        find.byKey(const ValueKey('Signup-email_45vb')), 'test123@gmail.com');
    await tester.pumpAndSettle(const Duration(milliseconds: 60000));
    await tester.enterText(
        find.byKey(const ValueKey('signup-password_6tej')), '1234567');
    await tester.pumpAndSettle(const Duration(milliseconds: 6000));
    await tester.enterText(
        find.byKey(const ValueKey('signup-ConfirmPassword_n0vc')), '1234567');
    await tester.pumpAndSettle(const Duration(milliseconds: 6000));
    expect(find.byKey(const ValueKey('product_title_ymvj')), findsOneWidget);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}
