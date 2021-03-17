// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../util/color_utils.dart';
import '../util/random_color.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _colorGenerator = RandomColor();
  var _backgroundColor = Colors.white;

  /// Builds an AppBar title from the RGB values of the background color.
  Widget _buildTitle() {
    final _style = Theme.of(context).textTheme.headline6!;

    // ?TODO: Investigate the performance impact of copyWith.
    return RichText(
      text: TextSpan(
        style: _style,
        children: <TextSpan>[
          TextSpan(text: 'R  ', style: _style.copyWith(color: Colors.red)),
          TextSpan(text: '${_backgroundColor.red}'),
          TextSpan(text: '  G  ', style: _style.copyWith(color: Colors.green)),
          TextSpan(text: '${_backgroundColor.green}'),
          TextSpan(text: '  B  ', style: _style.copyWith(color: Colors.blue)),
          TextSpan(text: '${_backgroundColor.blue}'),
        ],
      ),
    );
  }

  /// Copies the current background color to the clipboard; shows a SnackBar.
  void _copyColor() {
    Clipboard.setData(
      ClipboardData(
        text: _backgroundColor.toHex(),
      ),
    );

    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        content: RichText(
          text: TextSpan(
            style: Theme.of(context).snackBarTheme.contentTextStyle!,
            children: <TextSpan>[
              TextSpan(text: 'The hex color code has been copied — '),
              TextSpan(
                text: _backgroundColor.toHex(),
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Shows an AlertDialog with user instructions.
  Future<void> _showInfoDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return const AlertDialog(
          title: Text('Instructions'),
          content: SingleChildScrollView(
            child: Text(
              'Short tap changes the background color to a random one. A '
              '24-bit color palette is used, which is more than 16 million '
              'colors.\n\nOn long press, one of the 18 primary Material '
              'Design colors will be shown, grey excluded.',
              textAlign: TextAlign.justify,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        title: _buildTitle(),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.info_outline),
          tooltip: 'Show instructions',
          onPressed: _showInfoDialog,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.content_copy),
            tooltip: 'Copy the color code',
            onPressed: _copyColor,
          )
        ],
      ),
      body: InkWell(
        splashColor: _backgroundColor.contrastingColor,
        hoverColor: Colors.transparent, // Removes a weird hover effect.
        onTap: () => setState(() {
          _backgroundColor = _colorGenerator.randomColor();
        }),
        onLongPress: () => setState(() {
          _backgroundColor = _colorGenerator.randomMaterialColor();
        }),
        child: Center(
          child: Text(
            'Hey there',
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: _backgroundColor.contrastingColor),
          ),
        ),
      ),
    );
  }
}
