class TextUtil {
  static String align(String text, int length, {isLeft = true}) {
    try {
      if (isLeft) {
        return text.substring(0, length).padRight(length, ' ');
      } else {
        return text.substring(0, length).padLeft(length, ' ');
      }
    } catch (_) {
      if (isLeft) {
        return text.padRight(length, ' ');
      } else {
        return text.padLeft(length, ' ');
      }
    }
  }

  static String formatUnit(int microSeconds) {
    if (microSeconds >= 1000000) {
      return '${(microSeconds / 1000000).toStringAsFixed(2)} s';
    }

    if (microSeconds >= 1000) {
      return '${(microSeconds / 1000).toStringAsFixed(2)} ms';
    }

    return '$microSeconds μs';
  }

  static String addHyphen(String text, int length) {
    return text.padRight(length, '-');
  }
}
