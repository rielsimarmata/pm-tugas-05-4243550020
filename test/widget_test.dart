import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:menu_umkm/main.dart';

void main() {
  testWidgets('menu pertama dapat ditandai sebagai favorit', (tester) async {
    await tester.pumpWidget(const MenuUmkmApp());

    await tester.drag(find.byType(ListView), const Offset(0, -600));
    await tester.pumpAndSettle();

    final ikonFavorit = find.byIcon(Icons.favorite_border).first;
    await tester.ensureVisible(ikonFavorit);
    await tester.pumpAndSettle();
    await tester.tap(ikonFavorit);
    await tester.pump();

    expect(find.byIcon(Icons.favorite), findsOneWidget);
    expect(find.textContaining('ditambahkan ke favorit'), findsOneWidget);
  });
}

