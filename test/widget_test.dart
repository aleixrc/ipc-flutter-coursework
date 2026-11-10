import 'package:flutter_test/flutter_test.dart';

import 'package:adelar6/main.dart';

void main() {
  testWidgets('carga productos y abre el detalle', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.text('LOGIN'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text('Router TP-Link AC1200'), findsOneWidget);

    await tester.tap(find.text('Router TP-Link AC1200'));
    await tester.pumpAndSettle();

    expect(find.text('99.99 €'), findsOneWidget);
    expect(find.textContaining('Lorem ipsum'), findsOneWidget);
  });
}
