import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class ConfettiOverlay extends StatefulWidget {
  final Widget child;

  const ConfettiOverlay({super.key, required this.child});

  static _ConfettiOverlayState? of(BuildContext context) =>
      context.findAncestorStateOfType<_ConfettiOverlayState>();

  @override
  State<ConfettiOverlay> createState() => _ConfettiOverlayState();
}

class _ConfettiOverlayState extends State<ConfettiOverlay> {
  late final ConfettiController _controllerCenter;

  @override
  void initState() {
    super.initState();
    _controllerCenter = ConfettiController(
      duration: const Duration(seconds: 2),
    );
  }

  void play() => _controllerCenter.play();

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        Positioned.fill(
          child: IgnorePointer(
            child: Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _controllerCenter,
                blastDirectionality: BlastDirectionality.explosive,
                shouldLoop: false,
                emissionFrequency: 0.05,
                numberOfParticles: 40,
                gravity: 0.2,
                colors: const [
                  Color(0xFFF492A1),
                  Color(0xFFF7B1BC),
                  Color(0xFFB8C4AC),
                  Color(0xFF7F8D6A),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
