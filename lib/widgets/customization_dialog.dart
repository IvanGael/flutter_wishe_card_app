
import 'package:flutter/material.dart';
import 'package:wishe_card_app/widgets/color_picker.dart';

class CustomizationDialog extends StatefulWidget {
  final ValueChanged<String> onWishChanged;
  final ValueChanged<Color> onColorChanged;
  final ValueChanged<String> onAnimationChanged;

  const CustomizationDialog({super.key, 
    required this.onWishChanged,
    required this.onColorChanged,
    required this.onAnimationChanged,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomizationDialogState createState() => _CustomizationDialogState();
}

class _CustomizationDialogState extends State<CustomizationDialog> {
  String _selectedWish = 'Joyeux Noël';
  Color _selectedColor = Colors.red[600]!;
  String _selectedAnimation = 'assets/animations/snow.riv';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Personnaliser la Carte de Vœux'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            const Text('Choisir un vœu :'),
            DropdownButton<String>(
              value: _selectedWish,
              onChanged: (value) {
                setState(() {
                  _selectedWish = value!;
                });
                widget.onWishChanged(value!);
              },
              items: ['Joyeux Noël', 'Bonne Année', 'Bonne Fêtes'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text('Choisir une couleur :'),
            ColorPicker(
              onSelectColor: (color) {
                setState(() {
                  _selectedColor = color;
                });
                widget.onColorChanged(color);
              },
              direction: "row",
            ),
            const SizedBox(height: 20),
            const Text('Choisir une animation :'),
            DropdownButton<String>(
              value: _selectedAnimation,
              onChanged: (value) {
                setState(() {
                  _selectedAnimation = value!;
                });
                widget.onAnimationChanged(value!);
              },
              items: ['assets/animations/snow.riv', 'assets/animations/fireworks4.riv'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Annuler'),
        ),
        TextButton(
          onPressed: () {
            // Sauvegarder les personnalisations si nécessaire
            Navigator.of(context).pop();
          },
          child: const Text('Enregistrer'),
        ),
      ],
    );
  }
}