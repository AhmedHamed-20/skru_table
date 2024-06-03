import 'package:flutter/material.dart';

List<DataColumn> users({Function? removePlayer}) => [
      DataColumn(
        label: Row(
          children: [
            const Text(
              'First Player',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  removePlayer;
                },
                child: const Icon(Icons.remove))
          ],
        ),
      ),
    ];
List<DataCell> resultsOfFirstRounds = [
  const DataCell(
    TextField(),
  ),
];

List<DataCell> resultsOfSecondRounds = [
  const DataCell(
    TextField(),
  ),
];

List<DataCell> resultsOfThirdRounds = [
  const DataCell(
    TextField(),
  ),
];

List<DataCell> resultsOfForthRounds = [
  const DataCell(
    TextField(),
  ),
];

List<DataCell> resultsOfFifthRounds = [
  const DataCell(
    TextField(),
  ),
];
