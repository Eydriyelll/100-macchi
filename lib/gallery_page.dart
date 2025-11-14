import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  final List<String> photoFileNames;
  final List<Color> palette;

  const GalleryPage({
    super.key,
    required this.photoFileNames,
    required this.palette,
  });

  // Simplified helper for brevity
  double getResponsiveValue(
    double screenWidth,
    double factor,
    double maxValue,
  ) {
    return (screenWidth * factor).clamp(8.0, maxValue);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    int cols;
    if (width > 1200) {
      cols = 4;
    } else if (width > 600) {
      cols = 3;
    } else {
      cols = 2;
    }

    final spacing = getResponsiveValue(width, 0.03, 16.0);
    final padding = getResponsiveValue(width, 0.04, 24.0);

    return Scaffold(
      backgroundColor: const Color(0xFFFDEDF0),
      appBar: AppBar(
        title: Text(
          'Surprise Gallery! (10 Months)',
          style: TextStyle(
            color: palette[7].withOpacity(0.9),
            fontWeight: FontWeight.bold,
            fontSize: getResponsiveValue(width, 0.05, 28.0),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: cols,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
            childAspectRatio: 0.8,
          ),
          itemCount: photoFileNames.length,
          itemBuilder: (context, index) {
            // ⭐️ FIX IS HERE: Removed the 'assets/' prefix.
            // The Image.asset function is designed to look inside the top-level
            // assets folder declared in pubspec.yaml.
            final assetPath = 'photos/${photoFileNames[index]}';

            return Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                assetPath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: palette[3],
                    alignment: Alignment.center,
                    child: Text(
                      'Photo not found: ${photoFileNames[index]}',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: palette[7], fontSize: 12),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
