import 'package:flutter/material.dart';
import 'package:task_project/data/core/algorithm.dart';

import 'create_column.dart';

createTable({required List<List<String>> matrix}) {
  List<TableRow> rows = [];
  for (int x = 0; x < matrix[0].length; x++) {
    var xDestination = getDestinationCell()[
        1]; //! after your response for my confusion, I just changed x-y vice versa.. as Coordinate system.
    var xStarting = getStartingCell()[1];

    var shortPathCells = getShortestPathCells(getShortPath());
    rows.add(
      TableRow(
        children: createColumn(
            x: x,
            xDestination: xDestination,
            xStarting: xStarting,
            shortPathCells: shortPathCells,
            lockedCells: getLockedCells(fields)),
      ),
    );
  }
  return Table(border: TableBorder.all(), children: rows);
}
