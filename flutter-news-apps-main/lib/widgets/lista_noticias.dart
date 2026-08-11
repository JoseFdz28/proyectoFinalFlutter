import 'package:flutter/material.dart';
import 'package:flutter_news_apps/models/news_models.dart';
import 'package:flutter_news_apps/theme/tema.dart';

class ListaNoticias extends StatelessWidget {

  final List noticias;

  const ListaNoticias(this.noticias, {super.key});

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: noticias.length,

      itemBuilder: (BuildContext context, int index) {

        return _Noticia(
          noticia: noticias[index],
          index: index,
        );
      },
    );
  }
}


class _Noticia extends StatelessWidget {

  final Article noticia;
  final int index;

  const _Noticia({
    required this.noticia,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      // AL PRESIONAR LA NOTICIA
      onTap: () {

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalleNoticia(
              noticia: noticia,
            ),
          ),
        );

      },

      child: Column(
        children: [

          _TarjetaTopBar(noticia, index),

          _TarjetaTitulo(noticia),

          _TarjetaImagen(noticia),

          _TarjetaBody(noticia),

          const SizedBox(height: 10),

          const Divider(),
        ],
      ),
    );
  }
}


class _TarjetaBody extends StatelessWidget {

  final Article noticia;

  const _TarjetaBody(
    this.noticia,
  );

  @override
  Widget build(BuildContext context) {

    return Text(
      noticia.description ?? '',
    );
  }
}

class _TarjetaImagen extends StatelessWidget {

  final Article noticia;

  const _TarjetaImagen(
    this.noticia,
  );

  @override
  Widget build(BuildContext context) {

    return Container(

      child: noticia.urlToImage != null

          ? FadeInImage(

              placeholder: const AssetImage(
                'assets/img/load.gif',
              ),

              image: NetworkImage(
                noticia.urlToImage!,
              ),

              imageErrorBuilder: (
                context,
                error,
                stackTrace,
              ) {

                return Image.asset(
                  'assets/img/not_image.png',
                  fit: BoxFit.cover,
                );
              },
            )

          : Image.asset(
              'assets/img/not_image.png',
              fit: BoxFit.cover,
            ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {

  final Article noticia;

  const _TarjetaTitulo(
    this.noticia,
  );

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),

      child: Text(
        noticia.title,

        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {

  final Article noticia;
  final int index;

  const _TarjetaTopBar(
    this.noticia,
    this.index,
  );

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),

      margin: const EdgeInsets.only(
        bottom: 10,
      ),

      child: Row(
        children: [

          Text(
            '${index + 1}.',
            style: TextStyle(
              color: miTema.primaryColor,
            ),
          ),

          Text(
            noticia.source.name,
          ),
        ],
      ),
    );
  }
}

class _TarjetaContent extends StatelessWidget {

  final Article noticia;

  const _TarjetaContent(
    this.noticia,
  );

  @override
  Widget build(BuildContext context) {

    return Text(
      noticia.content ?? '',
    );
  }
}

class DetalleNoticia extends StatelessWidget {
  final Article noticia;
  const DetalleNoticia({
    super.key,
    required this.noticia,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detalle',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TarjetaTitulo(noticia), 
              const SizedBox(height: 10),
              _TarjetaImagen(noticia),
              const SizedBox(height: 10),          
              _TarjetaContent(noticia),  
            ],
          ),
        ),
      ),
    );
  }
}