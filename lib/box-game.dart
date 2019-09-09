
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flame/game.dart';

class BoxGame extends Game {

  // Vai obter o tamanho da tela
  Size screenSize;

  bool hasWon = false;

  void render(Canvas canvas) {

    // Cria o retangulo e passa o tamanho da tela
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);

    // Cria um objeto paint para pintar o background
    Paint bgPaint = Paint();

    // Atribui a cor a Pintura
    bgPaint.color = Color(0xff000000); // Black
    //bgPaint.color = Color(0xffffffff); // White

    // Usa o canvas para desenhar o Retangulo na tela passando
    // o retangulo e a pintura dele.
    canvas.drawRect(bgRect, bgPaint);

    // Desenha o bloco branco
    // Pega metado do tamanho da tela
    double screenCenterX = screenSize.width / 2;
    double screenCenterY = screenSize.height / 2;

    // Cria o caixa rect branco
    Rect boxRect = Rect.fromLTWH(
      screenCenterX - 75,
      screenCenterY - 75,
      150,
      150,
    );

    Paint boxPaint = Paint();

    if(hasWon){
      boxPaint.color = Color(0xff00ff00);
    } else {
      boxPaint.color = Color(0xffffffff);
    }


    canvas.drawRect(boxRect, boxPaint);

  }


  void update(double t) {

  }


  // Sobreescreve o método passando o tamanho
  void resize(Size size){
    screenSize = size;
    super.resize(size);
  }

  void onTapDown(TapDownDetails d){

    double screenCenterX = screenSize.width / 2;
    double screenCenterY = screenSize.height / 2;

    if(d.globalPosition.dx >= screenCenterX - 75 &&
        d.globalPosition.dx <= screenCenterX + 75 &&
        d.globalPosition.dx >= screenCenterY - 75 &&
        d.globalPosition.dx <= screenCenterY - 75



    )

    {
      hasWon = true;
    }

  }

}