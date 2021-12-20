import 'package:flutter/material.dart';
import 'package:task_project/data/core/algorithm.dart';
import 'package:task_project/data/core/color_constant.dart';

createColumn(
    {int? x,
    int? xDestination,
    int? xStarting,
    List? shortPathCells,
    List? lockedCells}) {
  Color? cellColor;
  Color? textColor;
  List<Widget> column = [];
  for (int y = 0; y < matrix.length; y++) {
    var yDestination = getDestinationCell()[0];
    var yStarting = getStartingCell()[0];
    if (x == xDestination && y == yDestination) {
      cellColor = AppColors.destinationColor;
    } else if (x == xStarting && y == yStarting) {
      cellColor = AppColors.startPointColor;
    } else if (shortPathCells!.length == 1) {
      cellColor = null;
      if (x == shortPathCells.first[1] && y == shortPathCells.first[0]) {
        cellColor = AppColors.shortPathColor;
      }
    } else {
      cellColor = null;
    }

    if (shortPathCells!.length != 1) {
      for (var i = 0; i < shortPathCells.length; i++) {
        if (x == shortPathCells[i][0] && y == shortPathCells[i][1]) {
          cellColor = AppColors.shortPathColor;
        }
      }
    }

    if (lockedCells!.isNotEmpty) {
      textColor = null;
      for (var i = 0; i < lockedCells.length; i++) {
        if (x == lockedCells[i][0] && y == lockedCells[i][1]) {
          cellColor = AppColors.lockCellColor;
          textColor = Colors.white;
        }
      }
    }

    column.add(Container(
      height: 50,
      color: cellColor ?? null,
      child: Center(
          child: Text(
        "($y,$x)", //! after your response for my confusion, I just changed x-y vice versa.. as Coordinate system.
        style: TextStyle(color: textColor ?? null),
      )),
    ));
  }
  return column;
}
