import 'package:edit_builder/edit_builder.dart';
import 'package:edit_builder/src/edit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class TestPage extends StatelessWidget {
  final Widget test;

  const TestPage(this.test);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          body: test,
        ),
      ),
    );
  }
}

void main() {
  group('EditBuilder', () {
    group('arguments', () {
      test('initialValue cant be null', () {
        expect(
          () => EditBuilder(
            initialValue: null,
            builder: (context, value, setValue) => null,
          ),
          throwsAssertionError,
        );
      });

      test('builder cant be null', () {
        expect(
          () => EditBuilder(
            initialValue: '',
            builder: null,
          ),
          throwsAssertionError,
        );
      });

      test('cubit\'s initial state cant be null', () {
        expect(
          () => EditCubit(null),
          throwsAssertionError,
        );
      });
    });

    group('functionality', () {
      testWidgets('represents initialValue correctly', (tester) async {
        await tester.pumpWidget(
          TestPage(
            EditBuilder<String>(
              initialValue: 'Hello world',
              builder: (context, value, setValue) {
                return Column(
                  children: [
                    Text(value),
                    FlatButton(
                      child: Text('Change'),
                      onPressed: () => setValue(value += '++'),
                    )
                  ],
                );
              },
            ),
          ),
        );

        expect(find.text('Hello world'), findsOneWidget);
      });

      testWidgets('updates value correctly', (tester) async {
        await tester.pumpWidget(
          TestPage(
            EditBuilder<String>(
              initialValue: 'Hello world',
              builder: (context, value, setValue) {
                return Column(
                  children: [
                    Text(value),
                    FlatButton(
                      child: Text('Change'),
                      onPressed: () => setValue(value += '++'),
                    )
                  ],
                );
              },
            ),
          ),
        );

        await tester.tap(find.text('Change'));
        await tester.pumpAndSettle();

        expect(find.text('Hello world'), findsNothing);
        expect(find.text('Hello world++'), findsOneWidget);
      });
    });
  });
}
