import 'package:flutter/material.dart';

import 'components/my_expansion_tile/my_expansion_tile_widget.dart';

class TilesPage extends StatefulWidget {
  const TilesPage({Key? key}) : super(key: key);

  @override
  State<TilesPage> createState() => _TilesPageState();
}

class _TilesPageState extends State<TilesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyCustomExpansionTile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            MyExpansionTileWidget(title: Text('MyExpansionTiles'), children: [
              FlutterLogo(size: 80),
              FlutterLogo(size: 80),
              Text(
                  'Mussum Ipsum, cacilds vidis litro abertis. Sapien in monti palavris qui num significa nadis i pareci latim.Nullam volutpat risus nec leo commodo, ut interdum diam laoreet. Sed non consequat odio.Per aumento de cachacis, eu reclamis.Mé faiz elementum girarzis, nisi eros vermeio.'),
            ]),
            ExpansionTile(
                title: Text(
                  'MyExpansionTile',
                ),
                children: [
                  FlutterLogo(size: 80),
                  FlutterLogo(size: 80),
                  Text(
                      'Mussum Ipsum, cacilds vidis litro abertis. Sapien in monti palavris qui num significa nadis i pareci latim.Nullam volutpat risus nec leo commodo, ut interdum diam laoreet. Sed non consequat odio.Per aumento de cachacis, eu reclamis.Mé faiz elementum girarzis, nisi eros vermeio.'),
                  Text(
                      'Mussum Ipsum, cacilds vidis litro abertis. Sapien in monti palavris qui num significa nadis i pareci latim.Nullam volutpat risus nec leo commodo, ut interdum diam laoreet. Sed non consequat odio.Per aumento de cachacis, eu reclamis.Mé faiz elementum girarzis, nisi eros vermeio.'),
                ]),
            MyExpansionTileWidget(title: Text('MyExpansionTiles'), children: [
              FlutterLogo(size: 80),
              FlutterLogo(size: 80),
              Text(
                  'Mussum Ipsum, cacilds vidis litro abertis. Sapien in monti palavris qui num significa nadis i pareci latim.Nullam volutpat risus nec leo commodo, ut interdum diam laoreet. Sed non consequat odio.Per aumento de cachacis, eu reclamis.Mé faiz elementum girarzis, nisi eros vermeio.'),
            ]),
          ],
        ),
      ),
    );
  }
}
