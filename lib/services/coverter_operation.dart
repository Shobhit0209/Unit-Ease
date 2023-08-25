import 'package:unit_converter/models.dart/converters.dart';

class ConverOperation {
  ConverOperation._();
  static List<Converters> getConverters() {
    return <Converters>[
      Converters('assets/images/Length.png', 'Length'),
      Converters('assets/images/currency.png', 'Currency'),
      Converters('assets/images/speed.png', 'Speed'),
      Converters('assets/images/temperature.png', 'Temperature'),
      Converters('assets/images/weight.png', 'Weight')
    ];
  }
}
