import 'package:flutter_test/flutter_test.dart';

// TODO: show changes of object under tests
class Calculator {
  int add(int a, int b) => a + b;

  int subtract(int a, int b) => a - b;

  int multiply(int a, int b) => a * b;

  double divide(int a, int b) => a / b;
}

void main() {
  late Calculator calculator = Calculator();
  setUp(() {
    calculator = Calculator();
  });

  group('add tests', () {
    test(
      '''.
      ## Given:
      - `a` = 1
      - `b` = 1
      ## When:
      - `add` is called with `a` and `b`
      ## Then should:
      - return 2
      ''',
      () {
        // Given
        const a = 1;
        const b = 1;

        // When
        final result = calculator.add(a, b);

        // Then
        expect(result, 2);
      },
    );

    test(
      '''.
      ## Given:
      - `a` = 1
      - `b` = -4
      ## When:
      - `add` is called with `a` and `b`
      ## Then should:
      - return -3
      ''',
      () {
        // Given
        const a = 1;
        const b = -4;

        // When
        final result = calculator.add(a, b);

        // Then
        expect(result, -3);
      },
    );
  });

  group('subtract tests', () {
    test(
      '''.
      ## Given:
      - `a` = 1
      - `b` = 1
      ## When:
      - `subtract` is called with `a` and `b`
      ## Then should:
      - return 0
      ''',
      () {
        // Given
        const a = 1;
        const b = 1;

        // When
        final result = calculator.subtract(a, b);

        // Then
        expect(result, 0);
      },
    );

    test(
      '''.
      ## Given:
      - `a` = 1
      - `b` = -4
      ## When:
      - `subtract` is called with `a` and `b`
      ## Then should:
      - return 5
      ''',
      () {
        // Given
        const a = 1;
        const b = -4;

        // When
        final result = calculator.subtract(a, b);

        // Then
        expect(result, 5);
      },
    );
  });

  group('multiply tests', () {
    test(
      '''.
      ## Given:
      - `a` = 1
      - `b` = 1
      ## When:
      - `multiply` is called with `a` and `b`
      ## Then should:
      - return 1
      ''',
      () {
        // Given
        const a = 1;
        const b = 1;

        // When
        final result = calculator.multiply(a, b);

        // Then
        expect(result, 1);
      },
    );

    test(
      '''.
      ## Given:
      - `a` = 1
      - `b` = -4
      ## When:
      - `multiply` is called with `a` and `b`
      ## Then should:
      - return -4
      ''',
      () {
        // Given
        const a = 1;
        const b = -4;

        // When
        final result = calculator.multiply(a, b);

        // Then
        expect(result, -4);
      },
    );
  });

  group('divide tests', () {
    test(
      '''.
      ## Given:
      - `a` = 10
      - `b` = 2
      ## When:
      - `divide` is called with `a` and `b`
      ## Then should:
      - return 5
      ''',
      () {
        // Given
        const a = 10;
        const b = 5;

        // When
        final result = calculator.divide(a, b);

        // Then
        expect(result, 2);
      },
    );

    test(
      '''.
      ## Given:
      - `a` = 1
      - `b` = -4
      ## When:
      - `divide` is called with `a` and `b`
      ## Then should:
      - return -0.25
      ''',
      () {
        // Given
        const a = 1;
        const b = -4;

        // When
        final result = calculator.divide(a, b);

        // Then
        expect(result, -0.25);
      },
    );

    test(
      '''.
      ## Given:
      - `a` = 0
      - `b` = 4
      ## When:
      - `divide` is called with `a` and `b`
      ## Then should:
      - return 0
      ''',
      () {
        // Given
        const a = 0;
        const b = 4;

        // When
        final result = calculator.divide(a, b);

        // Then
        expect(result, 0);
      },
    );

    test(
      '''.
      ## Given:
      - `a` = 4
      - `b` = 0
      ## When:
      - `divide` is called with `a` and `b`
      ## Then should:
      - return infinity
      ''',
      () {
        // Given
        const a = 4;
        const b = 0;

        // When
        final result = calculator.divide(a, b);

        // Then
        expect(result, double.infinity);
      },
    );
  });
}
