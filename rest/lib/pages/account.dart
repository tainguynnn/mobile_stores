import 'package:flutter/cupertino.dart';
import 'package:rest/widgets/product_detauk/detail_attribute.dart';
import 'package:rest/widgets/screen_title/page_title.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTitle(title: 'Account'),
        const SizedBox(height: 20,),
        DetailAttribute(title: 'name', detail: 'abc'),
        DetailAttribute(title: 'username', detail: 'abc'),
        DetailAttribute(title: 'role', detail: 'abc'),
      ],
    );
  }
}
