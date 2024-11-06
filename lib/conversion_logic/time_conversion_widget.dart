import 'package:flutter/material.dart';

class TimeConversionWidget extends StatefulWidget {
  @override
  _TimeConversionWidgetState createState() => _TimeConversionWidgetState();
}

class _TimeConversionWidgetState extends State<TimeConversionWidget> {
  String selectedInputType = 'Seconds';
  String selectedOutputType = 'Minutes';
  String inputData = '';
  String outputData = '';

  // List of conversion types
  final List<String> conversionTypes = [
    'Seconds',
    'Minutes',
    'Hours',
    'Days'
  ];

  void convertTime() {
    // Convert input data based on selected types
    double value = double.tryParse(inputData) ?? 0;
    double convertedValue;

    if (selectedInputType == 'Seconds') {
      convertedValue = value; // No conversion
    } else if (selectedInputType == 'Minutes') {
      convertedValue = value * 60; // Convert Minutes to Seconds
    } else if (selectedInputType == 'Hours') {
      convertedValue = value * 3600; // Convert Hours to Seconds
    } else if (selectedInputType == 'Days') {
      convertedValue = value * 86400; // Convert Days to Seconds
    } else {
      convertedValue = 0; // Default case
    }

    // Set the output based on the selected output type
    if (selectedOutputType == 'Seconds') {
      outputData = convertedValue.toString();
    } else if (selectedOutputType == 'Minutes') {
      outputData = (convertedValue / 60).toString();
    } else if (selectedOutputType == 'Hours') {
      outputData = (convertedValue / 3600).toString();
    } else if (selectedOutputType == 'Days') {
      outputData = (convertedValue / 86400).toString();
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
            onPressed: convertTime,
            child: Text('Convert'),
          ),
          SizedBox(height: 16),
          Text('Output: $outputData'),
        ],
      ),
    );
  }
}
