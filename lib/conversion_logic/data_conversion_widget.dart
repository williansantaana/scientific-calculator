import 'package:flutter/material.dart';

class DataConversionWidget extends StatefulWidget {
  @override
  _DataConversionWidgetState createState() => _DataConversionWidgetState();
}

class _DataConversionWidgetState extends State<DataConversionWidget> {
  String selectedInputType = 'Bytes';
  String selectedOutputType = 'Kilobytes';
  String inputData = '';
  String outputData = '';

  // List of conversion types
  final List<String> conversionTypes = [
    'Bytes',
    'Kilobytes',
    'Megabytes',
    'Gigabytes',
    'Terabytes'
  ];

  void convertData() {
    // Convert input data based on selected types
    double value = double.tryParse(inputData) ?? 0;
    double convertedValue;

    if (selectedInputType == 'Bytes') {
      convertedValue = value / 1024; // Convert Bytes to Kilobytes
    } else if (selectedInputType == 'Kilobytes') {
      convertedValue = value; // No conversion
    } else if (selectedInputType == 'Megabytes') {
      convertedValue = value * 1024; // Convert Megabytes to Kilobytes
    } else {
      convertedValue = 0; // Default case
    }

    // Set the output based on the selected output type
    if (selectedOutputType == 'Bytes') {
      outputData = (convertedValue * 1024).toString();
    } else if (selectedOutputType == 'Kilobytes') {
      outputData = convertedValue.toString();
    } else if (selectedOutputType == 'Megabytes') {
      outputData = (convertedValue / 1024).toString();
    } else if (selectedOutputType == 'Gigabytes') {
      outputData = (convertedValue / (1024 * 1024)).toString();
    } else if (selectedOutputType == 'Terabytes') {
      outputData = (convertedValue / (1024 * 1024 * 1024)).toString();
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
            onPressed: convertData,
            child: Text('Convert'),
          ),
          SizedBox(height: 16),
          Text('Output: $outputData'),
        ],
      ),
    );
  }
}
