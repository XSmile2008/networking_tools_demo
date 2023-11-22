class Calculator {
  int add(int a, int b) => a + b;

  int subtract(int a, int b) => a - b;

  int multiply(int a, int b) => a * b;

  double divide(int a, int b) => a / b;
}

// region Complete version
/*
class AnalyticsReporter {
  Future<void> logUsage(int useCount) async {
    /// Send request to server
  }
}

class DivideByZeroException implements Exception {}

class Calculator {
  final AnalyticsReporter _analyticsReporter;

  Calculator({
    required AnalyticsReporter analyticsReporter,
  }) : _analyticsReporter = analyticsReporter;

  int useCount = 0;

  int add(int a, int b) {
    useCount++;
    _analyticsReporter.logUsage(useCount);
    return a + b;
  }

  int subtract(int a, int b) {
    useCount++;
    _analyticsReporter.logUsage(useCount);
    return a - b;
  }

  int multiply(int a, int b) {
    useCount++;
    _analyticsReporter.logUsage(useCount);
    return a * b;
  }

  double divide(int a, int b) {
    if (b == 0) throw DivideByZeroException();
    useCount++;
    _analyticsReporter.logUsage(useCount);
    return a / b;
  }

  int pow(int a, int b) {
    useCount++;
    _analyticsReporter.logUsage(useCount);
    return a ^ b;
  }
}
*/
// endregion
