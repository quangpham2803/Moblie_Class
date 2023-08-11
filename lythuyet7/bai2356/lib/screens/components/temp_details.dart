import 'package:flutter/material.dart';

import '../../constanins.dart';
import '../../home_controller.dart';
import 'tmp_btn.dart';

class TempDetails extends StatefulWidget {
  const TempDetails({
    Key? key,
    required HomeController controller,
  })  : _controller = controller,
        super(key: key);

  final HomeController _controller;

  @override
  // ignore: library_private_types_in_public_api
  _TempDetailsState createState() => _TempDetailsState();
}

class _TempDetailsState extends State<TempDetails> {
  int t = 29;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
              child: Row(
                children: [
                  TempBtn(
                    isActive: widget._controller.isCoolSelected,
                    svgSrc: "assets/icons/coolShape.svg",
                    title: "Cool",
                    press: widget._controller.updateCoolSelectedTab,
                  ),
                  const SizedBox(width: defaultPadding),
                  TempBtn(
                    isActive: !widget._controller.isCoolSelected,
                    svgSrc: "assets/icons/heatShape.svg",
                    title: "Heat",
                    activeColor: redColor,
                    press: widget._controller.updateCoolSelectedTab,
                  ),
                ],
              ),
            ),
            const SizedBox(height: defaultPadding), // Add some spacing
            Column(
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    setState(() {
                      t++;
                    });
                  },
                  icon: const Icon(Icons.arrow_drop_up, size: 48),
                ),
                Text(
                  "$t" "\u2103",
                  style: const TextStyle(fontSize: 86),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    setState(() {
                      t--;
                    });
                  },
                  icon: const Icon(Icons.arrow_drop_down, size: 48),
                ),
              ],
            ),
            const SizedBox(height: defaultPadding), // Add some spacing
            const Text("CURRENT TEMPERATURE"),
            const SizedBox(height: defaultPadding), // Add some spacing
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Inside".toUpperCase(),
                    ),
                    Text(
                      "20" "\u2103",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
                const SizedBox(width: defaultPadding),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Outside".toUpperCase(),
                      style: const TextStyle(color: Colors.white54),
                    ),
                    Text(
                      "35" "\u2103",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: Colors.white54),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}