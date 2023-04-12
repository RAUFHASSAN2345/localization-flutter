import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class home_view extends StatefulWidget {
  const home_view({super.key});

  @override
  State<home_view> createState() => _home_viewState();
}

class _home_viewState extends State<home_view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: ListTile(
          leading: const Icon(Icons.language),
          title: const Text('Language'),
          trailing: DropdownButton(
            value: context.locale,
            items: EasyLocalization.of(context)
                ?.supportedLocales
                .map((locale) => DropdownMenuItem(
                      value: locale,
                      child: Text(locale.languageCode.toUpperCase()),
                    ))
                .toList(),
            onChanged: (locale) {
              context.setLocale(locale!);
            },
          ),
        ),
      ),
      body: Center(
          child: Text(
        'body_text'.tr(),
        style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.05,
            fontWeight: FontWeight.bold),
      )),
    );
  }
}
