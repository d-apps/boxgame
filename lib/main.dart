import 'package:boxgame/box-game.dart';
import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

 Future main() async {

  // Seta a tela somente no modo retrato
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  // Instancia o objeto jogo
  BoxGame game = BoxGame();

  // Registra o reconhecedor de toques na tela
  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;

  runApp(game.widget);

  flameUtil.addGestureRecognizer(tapper);

 }