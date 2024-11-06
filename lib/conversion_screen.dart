import 'package:flutter/material.dart';
import 'package:scientific_calculator/conversion_logic/time_conversion_widget.dart';
import 'package:scientific_calculator/conversion_logic/weight_conversion_widget.dart';
import 'conversion_logic/data_conversion_widget.dart';


class ConversionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Convert Units'),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Data'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DataConversionScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('Time'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TimeConversionScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('Weight'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WeigthConversionScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Placeholder for Data Conversion Screen
class DataConversionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Conversion'),
      ),
      body: Center(
        child: DataConversionWidget(),
      ),
    );
  }
}

// Placeholder for Time Conversion Screen
class TimeConversionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Conversion'),
      ),
      body: Center(
        child: TimeConversionWidget(),
      ),
    );
  }
}

// Placeholder for Weigth Conversion Screen
class WeigthConversionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weigth Conversion'),
      ),
      body: Center(
        child: WeightConversionWidget(),
      ),
    );
  }
}
