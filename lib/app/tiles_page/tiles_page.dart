import 'package:animacoes_implicitas_expansion_tile/app/tiles_page/components/my_expansion_tile_widget.dart';
import 'package:flutter/material.dart';

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
            MyExpansionTileWidget(title: 'MyExpansionTiles', children: [
              FlutterLogo(
                size: 80,
              ),
              Text(
                  'Mussum Ipsum, cacilds vidis litro abertis. Sapien in monti palavris qui num significa nadis i pareci latim.Nullam volutpat risus nec leo commodo, ut interdum diam laoreet. Sed non consequat odio.Per aumento de cachacis, eu reclamis.Mé faiz elementum girarzis, nisi eros vermeio.'),
            ]),
            ExpansionTile(
                title: Text(
                  'MyExpansionTile',
                ),
                children: [
                  FlutterLogo(
                    size: 80,
                  ),
                  Text(
                      'Mussum Ipsum, cacilds vidis litro abertis. Sapien in monti palavris qui num significa nadis i pareci latim.Nullam volutpat risus nec leo commodo, ut interdum diam laoreet. Sed non consequat odio.Per aumento de cachacis, eu reclamis.Mé faiz elementum girarzis, nisi eros vermeio.'),
                ]),
          ],
        ),
      ),
    );
  }
}
