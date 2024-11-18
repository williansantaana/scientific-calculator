import 'package:flutter/material.dart';

class WeightConversionWidget extends StatefulWidget {
  @override
  _WeightConversionWidgetState createState() => _WeightConversionWidgetState();
}

class _WeightConversionWidgetState extends State<WeightConversionWidget> {
  String selectedInputType = 'Grams';
  String selectedOutputType = 'Kilograms';
  String inputData = '';
  String outputData = '';

  // List of conversion types
  final List<String> conversionTypes = [
    'Grams',
    'Kilograms',
    'Pounds',
    'Ounces'
  ];

  void convertWeight() {
    // Convert input data based on selected types
    double value = double.tryParse(inputData) ?? 0;
    double convertedValue;

    if (selectedInputType == 'Grams') {
      convertedValue = value; // No conversion
    } else if (selectedInputType == 'Kilograms') {
      convertedValue = value * 1000; // Convert Kilograms to Grams
    } else if (selectedInputType == 'Pounds') {
      convertedValue = value * 453.592; // Convert Pounds to Grams
    } else if (selectedInputType == 'Ounces') {
      convertedValue = value * 28.3495; // Convert Ounces to Grams
    } else {
      convertedValue = 0; // Default case
    }

    // Set the output based on the selected output type
    if (selectedOutputType == 'Grams') {
      outputData = convertedValue.toString();
    } else if (selectedOutputType == 'Kilograms') {
      outputData = (convertedValue / 1000).toString();
    } else if (selectedOutputType == 'Pounds') {
      outputData = (convertedValue / 453.592).toString();
    } else if (selectedOutputType == 'Ounces') {
      outputData = (convertedValue / 28.3495).toString();
    }

    setState(() {}); // Refresh the UI to show output
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Input Data'),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              inputData = value;
            },
          ),
          SizedBox(height: 16),
          DropdownButton<String>(
            value: selectedInputType,
            onChanged: (String? newValue) {
              setState(() {
                selectedInputType = newValue!;
              });
            },
            items: conversionTypes.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(height: 16),
          DropdownButton<String>(
            value: selectedOutputType,
            onChanged: (String? newValue) {
              setState(() {
                selectedOutputType = newValue!;
              });
            },
            items: conversionTypes.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: convertWeight,
            child: Text('Convert'),
          ),
          SizedBox(height: 16),
          Text('Output: $outputData'),
        ],
      ),
    );
  }
}
