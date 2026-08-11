import 'package:flutter/material.dart';
import 'package:flutter_news_apps/services/new_services.dart';
import 'package:flutter_news_apps/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab3Page extends StatefulWidget {
  const Tab3Page({super.key});

  @override
  State<Tab3Page> createState() => _Tab3PageState();
}

class _Tab3PageState extends State<Tab3Page> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final headlineshealth= Provider.of<NewsServices>(context).headlineshealth;

    return Scaffold(
      body: (headlineshealth.isEmpty) 
          ? const Center(child: CircularProgressIndicator(),)
          : ListaNoticias(headlineshealth)
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}