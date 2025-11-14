import 'package:flutter/material.dart';
import 'confetti_overlay.dart';
import 'gallery_page.dart';

class InteractiveReasonsPage extends StatefulWidget {
  final List<String> reasons;
  final List<Color> palette;
  final String letterContent;
  final List<String> photoFileNames;

  const InteractiveReasonsPage({
    super.key,
    required this.reasons,
    required this.palette,
    required this.letterContent,
    required this.photoFileNames,
  });

  @override
  State<InteractiveReasonsPage> createState() => _InteractiveReasonsPageState();
}

class _InteractiveReasonsPageState extends State<InteractiveReasonsPage>
    with TickerProviderStateMixin {
  late final List<bool> _visible;
  late final List<bool> _liked;
  int likedCount = 0;
  bool _maxLikesReached = false;

  final int _likeThreshold = 50;

  // Define max values for better large screen scaling
  static const double _maxFontSize = 20.0;
  // 💡 FIX: Further reduced maximum header font size to ensure fit
  static const double _maxHeaderFontSize = 32.0;
  static const double _maxIconSize = 35.0; // Reduced max icon size slightly
  static const double _maxPadding = 24.0;
  static const double _maxCardPadding = 32.0;

  static const double _letterCardAspectRatio = 2.8;

  @override
  void initState() {
    super.initState();
    _visible = List<bool>.filled(widget.reasons.length, false);
    _liked = List<bool>.filled(widget.reasons.length, false);
    _staggerAppear();
  }

  // Helper function to calculate responsive value with a cap
  double _getResponsiveValue(
    double screenWidth,
    double factor,
    double maxValue,
  ) {
    return (screenWidth * factor).clamp(5.0, maxValue);
  }

  void _staggerAppear() {
    for (var i = 0; i < widget.reasons.length; i++) {
      Future.delayed(Duration(milliseconds: 150 * i), () {
        if (mounted) setState(() => _visible[i] = true);
      });
    }
  }

  void _toggleLike(int index) {
    setState(() {
      _liked[index] = !_liked[index];
      likedCount += _liked[index] ? 1 : -1;

      if (likedCount >= _likeThreshold && !_maxLikesReached) {
        _maxLikesReached = true;
      } else if (likedCount < _likeThreshold && _maxLikesReached) {
        _maxLikesReached = false;
      }
    });

    if (_liked.where((v) => v).length == widget.reasons.length) {
      ConfettiOverlay.of(context)?.play();
    } else if (index == widget.reasons.length - 1 && _liked[index]) {
      ConfettiOverlay.of(context)?.play();
    }
  }

  void _showPhotoGallery() {
    if (_maxLikesReached) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => GalleryPage(
            photoFileNames: widget.photoFileNames,
            palette: widget.palette,
          ),
        ),
      );
    }
  }

  void _showLetterPopup() {
    final width = MediaQuery.of(context).size.width;
    final dialogWidth = width.clamp(0.0, 600.0);
    final popupPadding = _getResponsiveValue(
      width,
      0.06,
      _maxCardPadding * 1.5,
    );
    final popupTitleFontSize = _getResponsiveValue(
      width,
      0.05,
      _maxFontSize * 1.1,
    );
    final popupContentFontSize = _getResponsiveValue(
      width,
      0.04,
      _maxFontSize * 0.9,
    );

    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: Colors.transparent,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: dialogWidth,
          padding: EdgeInsets.all(popupPadding),
          decoration: BoxDecoration(
            color: widget.palette[3],
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'A Letter for Micah 💌',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: popupTitleFontSize,
                      fontFamily: 'Roboto',
                      color: widget.palette[7],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(ctx),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.7,
                ),
                child: SingleChildScrollView(
                  child: Text(
                    widget.letterContent,
                    style: TextStyle(
                      fontSize: popupContentFontSize,
                      height: 1.6,
                      fontFamily: 'Roboto',
                      color: widget.palette[0],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    int cols;
    if (width > 1400) {
      cols = 6;
    } else if (width > 1200) {
      cols = 5;
    } else if (width > 900) {
      cols = 4;
    } else if (width > 600) {
      cols = 3;
    } else if (width > 400) {
      cols = 2;
    } else {
      cols = 1;
    }

    final horizontalPadding = _getResponsiveValue(
      width,
      0.04,
      _maxPadding * 1.5,
    );
    final verticalPadding = _getResponsiveValue(width, 0.03, _maxPadding);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.celebration,
                  color: widget.palette[5],
                  // 💡 FIX: Use a tighter cap for the icon size relative to the screen
                  size: _getResponsiveValue(width, 0.05, _maxIconSize),
                ),
                const SizedBox(width: 8),
                Text(
                  'Happy 10th Monthsary!',
                  style: TextStyle(
                    color: widget.palette[0],
                    // 💡 FIX: Use a lower cap specific to the main header
                    fontSize: _getResponsiveValue(
                      width,
                      0.05,
                      _maxHeaderFontSize,
                    ),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              'Tap a reason to read more!',
              style: TextStyle(
                fontSize: _getResponsiveValue(width, 0.03, _maxFontSize * 1.2),
                color: widget.palette[5],
                fontStyle: FontStyle.italic,
                fontFamily: 'Roboto',
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: Column(
          children: [
            _topStats(),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: cols,
                      mainAxisSpacing: _getResponsiveValue(
                        width,
                        0.04,
                        _maxPadding,
                      ),
                      crossAxisSpacing: _getResponsiveValue(
                        width,
                        0.04,
                        _maxPadding,
                      ),
                      childAspectRatio: 1.15,
                    ),
                    itemCount: widget.reasons.length,
                    itemBuilder: (context, index) {
                      return _buildAnimatedCard(index);
                    },
                  ),
                  const SizedBox(height: 24),
                  _buildLetterCard(width),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _topStats() {
    final width = MediaQuery.of(context).size.width;
    final cardPadding = _getResponsiveValue(width, 0.04, _maxCardPadding);

    final isUnlocked = _maxLikesReached;
    final surpriseColor = isUnlocked
        ? widget.palette[5]
        : widget.palette[4].withOpacity(0.5);
    final surpriseIconColor = isUnlocked ? Colors.white : Colors.white54;
    final surpriseTextColor = isUnlocked ? widget.palette[7] : Colors.white54;
    final surpriseTapHandler = isUnlocked ? _showPhotoGallery : null;

    double progress = (likedCount / _likeThreshold).clamp(0.0, 1.0);

    return Row(
      children: [
        Expanded(
          child: Card(
            color: widget.palette[3],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 6,
            shadowColor: Colors.black.withOpacity(0.15),
            child: Padding(
              padding: EdgeInsets.all(cardPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: widget.palette[5],
                        size: _getResponsiveValue(width, 0.07, _maxIconSize),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Liked Reasons',
                            style: TextStyle(
                              color: widget.palette[6],
                              fontWeight: FontWeight.bold,
                              fontSize: _getResponsiveValue(
                                width,
                                0.04,
                                _maxFontSize * 0.9,
                              ),
                              fontFamily: 'Roboto',
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '$likedCount / ${_likeThreshold} to unlock',
                            style: TextStyle(
                              fontSize: _getResponsiveValue(
                                width,
                                0.045,
                                _maxFontSize,
                              ),
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: widget.palette[2],
                    color: widget.palette[5],
                    borderRadius: BorderRadius.circular(8),
                    minHeight: 8,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        // Interactive Surprise Button
        GestureDetector(
          onTap: surpriseTapHandler,
          child: Card(
            color: surpriseColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: isUnlocked ? 10 : 6,
            shadowColor: isUnlocked
                ? widget.palette[5].withOpacity(0.5)
                : Colors.black.withOpacity(0.15),
            child: Padding(
              padding: EdgeInsets.all(cardPadding),
              child: Column(
                children: [
                  Icon(
                    isUnlocked ? Icons.photo_library : Icons.lock_outline,
                    size: _getResponsiveValue(width, 0.07, _maxIconSize),
                    color: surpriseIconColor,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    isUnlocked ? 'Gallery!' : 'Surprise (Locked)',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: surpriseTextColor,
                      fontWeight: FontWeight.w500,
                      fontSize: _getResponsiveValue(
                        width,
                        0.035,
                        _maxFontSize * 0.8,
                      ),
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLetterCard(double width) {
    final horizontalPadding = _getResponsiveValue(
      width,
      0.04,
      _maxPadding * 1.5,
    );
    final verticalPadding = _getResponsiveValue(width, 0.03, _maxPadding);

    return Padding(
      padding: EdgeInsets.only(
        top: verticalPadding,
        bottom: verticalPadding,
        left: horizontalPadding,
        right: horizontalPadding,
      ),
      child: GestureDetector(
        onTap: _showLetterPopup,
        child: AspectRatio(
          aspectRatio: _letterCardAspectRatio,
          child: Card(
            color: widget.palette[7].withOpacity(0.9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            elevation: 12,
            shadowColor: widget.palette[7].withOpacity(0.4),
            child: Container(
              padding: EdgeInsets.all(
                _getResponsiveValue(width, 0.06, _maxCardPadding * 1.5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'A Special Message for You',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: _getResponsiveValue(
                              width,
                              0.05,
                              _maxFontSize * 1.2,
                            ),
                            color: Colors.white,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Open this on our 10th Monthsary to read the full letter from Adriel.',
                          style: TextStyle(
                            fontSize: _getResponsiveValue(
                              width,
                              0.035,
                              _maxFontSize,
                            ),
                            color: Colors.white70,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.mail_outline,
                    size: _getResponsiveValue(width, 0.1, _maxIconSize * 2),
                    color: widget.palette[4],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedCard(int index) {
    final width = MediaQuery.of(context).size.width;
    final Color cardColor = index % 2 == 0
        ? widget.palette[4]
        : widget.palette[2]; // Pink or Green/Mint
    final Color likeColor;

    if (index % 2 == 0) {
      // Pink card
      likeColor = widget.palette[2]; // Use Green/Mint for Pink Card
    } else {
      // Green/Mint card
      likeColor = widget.palette[5]; // Use Pink/Red for Green/Mint Card
    }

    final cardContentPadding = _getResponsiveValue(
      width,
      0.05,
      _maxPadding * 1.2,
    );

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 600),
      opacity: _visible[index] ? 1 : 0,
      curve: Curves.easeInOut,
      child: AnimatedScale(
        scale: _visible[index] ? 1.0 : 0.9,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOutBack,
        child: AnimatedRotation(
          turns: _visible[index] ? 0 : 0.05,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          child: Transform.translate(
            offset: Offset(0, _visible[index] ? 0 : 30),
            child: GestureDetector(
              onTap: () => _showCenteredPopup(index),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [cardColor, cardColor.withOpacity(0.85)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 15,
                      spreadRadius: 3,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(cardContentPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'Reason ${index + 1}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: _getResponsiveValue(
                                width,
                                0.045,
                                _maxFontSize,
                              ),
                              color: Colors.white,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () => _toggleLike(index),
                          child: AnimatedScale(
                            scale: _liked[index] ? 1.3 : 1.0,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.bounceOut,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                              child: Icon(
                                _liked[index]
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: _liked[index]
                                    ? likeColor
                                    : Colors.white70,
                                size: _getResponsiveValue(
                                  width,
                                  0.07,
                                  _maxIconSize * 0.8,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: _getResponsiveValue(width, 0.03, 16.0)),
                    Flexible(
                      child: Text(
                        widget.reasons[index].length > 80
                            ? widget.reasons[index].substring(0, 80) + '...'
                            : widget.reasons[index],
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: _getResponsiveValue(
                            width,
                            0.035,
                            _maxFontSize * 0.8,
                          ),
                          color: Colors.white70,
                          height: 1.5,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                    SizedBox(height: _getResponsiveValue(width, 0.04, 20.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.touch_app,
                          size: _getResponsiveValue(
                            width,
                            0.04,
                            _maxIconSize * 0.6,
                          ),
                          color: widget.palette[0],
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Tap to open',
                          style: TextStyle(
                            fontSize: _getResponsiveValue(
                              width,
                              0.03,
                              _maxFontSize * 0.7,
                            ),
                            color: widget.palette[0],
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '❤',
                          style: TextStyle(
                            color: widget.palette[6].withOpacity(0.9),
                            fontSize: _getResponsiveValue(
                              width,
                              0.045,
                              _maxFontSize,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showCenteredPopup(int index) {
    final width = MediaQuery.of(context).size.width;
    final dialogWidth = width.clamp(0.0, 500.0);
    final popupPadding = _getResponsiveValue(
      width,
      0.06,
      _maxCardPadding * 1.5,
    );
    final popupTitleFontSize = _getResponsiveValue(
      width,
      0.05,
      _maxFontSize * 1.1,
    );
    final popupContentFontSize = _getResponsiveValue(
      width,
      0.04,
      _maxFontSize * 0.9,
    );
    final buttonHorizontalPadding = _getResponsiveValue(width, 0.04, 30.0);
    final buttonVerticalPadding = _getResponsiveValue(width, 0.025, 12.0);

    final Color likeColor;
    if (index % 2 == 0) {
      // Pink card in main grid
      likeColor = widget.palette[2]; // Use Green/Mint for Pink Card
    } else {
      // Green/Mint card in main grid
      likeColor = widget.palette[5]; // Use Pink/Red for Green/Mint Card
    }

    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: Colors.transparent,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: dialogWidth,
          padding: EdgeInsets.all(popupPadding),
          decoration: BoxDecoration(
            color: widget.palette[3],
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Reason ${index + 1}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: popupTitleFontSize,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(ctx),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.5,
                ),
                child: SingleChildScrollView(
                  child: Text(
                    widget.reasons[index],
                    style: TextStyle(
                      fontSize: popupContentFontSize,
                      height: 1.6,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  _toggleLike(index);
                  Navigator.pop(ctx);
                },
                icon: Icon(
                  _liked[index] ? Icons.favorite : Icons.favorite_border,
                  color: Colors.white,
                ),
                label: Text(
                  _liked[index] ? 'Unlike' : 'Like',
                  style: const TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: likeColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: buttonHorizontalPadding,
                    vertical: buttonVerticalPadding,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
