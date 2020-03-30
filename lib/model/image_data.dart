import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:hexagonal_grid/hexagonal_grid.dart';
import 'package:quiver/core.dart';

class ImageData with ChangeNotifier {
  String _name;
  String get name => _name ?? '';

  img.Image _image;
  Uint8List get bytes => _image?.getBytes(format: Format);

  bool _isEditingURL = false;
  bool get isEditingURL => _isEditingURL;
  set isEditingURL(bool isEditingURL) {
    _isEditingURL = isEditingURL;
    notifyListeners();
  }

  bool get isLoaded => _image != null;

  void updateState(String name, img.Image image) {
    _name = name;
    _image = image;
    notifyListeners();
  }

  void drawHexes(int pixelsPerYard) {
    var toEdge = false;
    var color = img.getColor(255, 255, 0);
    var thickness = 5;
    var edge = (0.5 * pixelsPerYard) / sin(60.0 * pi / 180.0);
    var size = Point(edge, edge);
    var origin = Point(10, 10); // inset from the edge a little bit
    var layout = HexLayout.orientPointy(size, origin);

    var hexes = <Hex>{};

    for (var x = 0; x < _image.width; x += size.x.toInt()) {
      for (var y = 0; y < _image.height; y += size.y.toInt()) {
        var pt = Point(x, y);
        var hex = Hex.fromPoint(layout, pt);

        if (toEdge || allPointsAreIn(hex.corners(layout), _image))
          hexes.add(hex);
      }
    }

    for (var hex in hexes) {
      var points = hex.corners(layout);

      for (var i = 0; i < points.length; i++) {
        var current = points[i];
        var next = points.last == current ? points[0] : points[i + 1];

        _drawLine(_image, current, next, color, thickness);
      }
    }

    notifyListeners();
  }

  bool allPointsAreIn(List<Point<num>> points, img.Image image) {
    for (var p in points) {
      if (!image.boundsSafe(p.x.round(), p.y.round())) return false;
    }
    return true;
  }
}

class Line {
  Point p1;
  Point p2;
  Line(this.p1, this.p2);

  @override
  bool operator ==(dynamic other) {
    return other is Line && p1 == other.p1 && p2 == other.p2;
  }

  @override
  int get hashCode => hash2(p1, p2);
}

var lines = <Line>{};

void _drawLine(img.Image image, Point<num> current, Point<num> next, int color,
    num thickness) {
  if (!lines.contains(Line(current, next))) {
    img.drawLine(image, current.x.round(), current.y.round(), next.x.round(),
        next.y.round(), color,
        thickness: thickness, antialias: false);
    lines.add(Line(current, next));
  }
}
