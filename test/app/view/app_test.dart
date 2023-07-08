import 'package:flutter_test/flutter_test.dart';
import 'package:test_week_13/app/app.dart';
import 'package:test_week_13/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
