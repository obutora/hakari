class HakariOption {
  /// Set how many times to repeat the process
  final int iter;

  /// Set the maximum number of characters per line.
  ///
  /// default is [80]
  final int maxLineCharNum;

  /// emphasis color
  ///
  /// you can use [0-255].
  ///
  /// default is [20] = [green]
  ///
  /// https://pub.dev/packages/ansicolor
  final int emphasisAnsiColor;

  /// bar color
  ///
  /// you can use [0-255].
  ///
  /// default is [30] = [teal]
  ///
  /// https://pub.dev/packages/ansicolor
  final int barAnsiColor;

  HakariOption({
    this.iter = 100,
    this.emphasisAnsiColor = 20,
    this.maxLineCharNum = 80,
    this.barAnsiColor = 30,
  });

  /// A factory method for easily realizing full-screen display.
  ///
  /// you can change [iter] value.
  factory HakariOption.create(
      {int? iter, int? maxLineCharNum, int? emphasisAnsiColor}) {
    return HakariOption(
      iter: iter ?? 100,
      maxLineCharNum: maxLineCharNum ?? 80,
      emphasisAnsiColor: emphasisAnsiColor ?? 20,
      barAnsiColor: 30,
    );
  }
}
