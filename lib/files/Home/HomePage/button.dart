import 'package:flutter/material.dart';

class HoverButton extends StatefulWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color colors;

  const HoverButton({super.key, required this.buttonText, required this.onPressed, required this.colors});

  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          height: 80,
          width: 300,
          decoration: BoxDecoration(
            color: _isHovering ? widget.colors : Colors.blueAccent, // Change color on hover
            border: Border.all(
              color: _isHovering ? Colors.blueAccent : Colors.black, // Change border color on hover
              width: 5,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Text(
            widget.buttonText,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}





