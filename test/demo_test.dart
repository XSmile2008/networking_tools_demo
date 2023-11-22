import 'package:flutter_test/flutter_test.dart';
import 'package:networking_tools_demo/utils/calculator.dart';

// TODO: show how to run tests
// TODO: show test structure
// TODO:   - main
// TODO:   - setUp
// TODO:   - group
// TODO:   - test
// TODO: show return value validation
// TODO: show state changes validation (property changes)
// TODO:   - show coverage
// TODO: show system changes
// TODO:   - mocks
// TODO:   - verify
// TODO:   - matchers
// TODO: show TDD
void main() {
  late Calculator calculator;
  setUp(() {
    calculator = Calculator();
  });

  /*
  group('uses counter tests', () {
    test(
      '''
      ## Given:
      - fresh version of `Calculator`
      ## When:
      - `add` is called with some parameters
      ## Then:
      - value of `useCount` should be 1
      ''',
      () {
        // When
        calculator.add(1, 1);

        // Then
        expect(calculator.useCount, 1);
      },
    );

    test(
      '''
      ## Given:
      - two operations was performed on `Calculator`
      ## When:
      - `divide` is called with some parameters
      ## Then:
      - value of `useCount` should be 3
      ''',
      () {
        // Given
        calculator.add(1, 1);
        calculator.subtract(1, 1);

        // When
        calculator.divide(3, 1);

        // Then
        expect(calculator.useCount, 3);
      },
    );
  });
  */

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

    /* Test with DivideByZeroException
    test(
      '''.
      ## Given:
      - `a` = 4
      - `b` = 0
      ## When:
      - `divide` is called with `a` and `b`
      ## Then should:
      - throw `DivideByZeroException`
      ''',
      () {
        // Given
        const a = 4;
        const b = 0;

        // When
        try {
          calculator.divide(a, b);
          fail('Should throw DivideByZeroException');
        } catch (e) {
          // Then
          expect(e, isA<DivideByZeroException>());
        }
      },
    );
    */
  });

  /* Power tests
  group('pow tests', () {
    test(
      '''
      ## When:
      - `pow` is called with 2 and 3 as args
      ## Then should:
      - return 8
      ''',
          () {
        // When
        final result = calculator.pow(2, 3);

        // Then
        expect(result, 8);
      },
    );
  });
  */
}
