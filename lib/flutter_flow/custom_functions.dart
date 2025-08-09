import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String extractMac(String text) {
  String input = text.replaceAll('\n', ' ').trim();
  if (input.isEmpty) return '';

// 1) MAC com separador (: ou -)
  RegExp macSep = RegExp('([0-9A-Fa-f]{2}[:\\-]){5}[0-9A-Fa-f]{2}');
  final m1 = macSep.firstMatch(input);
  if (m1 != null) {
    return m1.group(0)!.toUpperCase().replaceAll('-', ':');
  }

// 2) 12 hex seguidos
  RegExp macFlat = RegExp('[0-9A-Fa-f]{12}');
  final m2 = macFlat.firstMatch(input);
  if (m2 != null) {
    // evita capturar parte de outra palavra
    int start = m2.start, end = m2.end;
    bool leftOk =
        (start == 0) || !RegExp('[0-9A-Fa-f]').hasMatch(input[start - 1]);
    bool rightOk =
        (end == input.length) || !RegExp('[0-9A-Fa-f]').hasMatch(input[end]);
    if (leftOk && rightOk) {
      String s = m2.group(0)!.toUpperCase();
      String out = '';
      for (int i = 0; i < 12; i += 2) {
        if (out.isNotEmpty) out += ':';
        out += s.substring(i, i + 2);
      }
      return out;
    }
  }
  return '';
}

String extractBrand(String text) {
// Texto em minúsculas
  String t = text.toLowerCase().replaceAll('\n', ' ').trim();

// Versão "limpa": só letras/números, com espaços (ajuda a bater palavra inteira)
  String clean = ' ' +
      t
          .replaceAll(RegExp('[^a-z0-9]+'), ' ')
          .replaceAll(RegExp('\\s+'), ' ')
          .trim() +
      ' ';

// Mapa de padrões (chaves) -> nome normalizado (valor)
  final Map<String, String> patterns = {
    // roteadores/switches mais comuns
    'tp-link': 'TP-Link',
    'tp link': 'TP-Link',
    'tplink': 'TP-Link',
    'd-link': 'D-Link',
    'd link': 'D-Link',
    'dlink': 'D-Link',
    'mikrotik': 'MikroTik',
    'ubiquiti': 'Ubiquiti',
    'intelbras': 'Intelbras',
    'cisco': 'Cisco',
    'netgear': 'Netgear',
    'huawei': 'Huawei',
    // HP e variações
    'hewlett packard': 'HP',
    'hewlett': 'HP',
    'hpe': 'HP',
    // Aruba/HPE
    'aruba': 'Aruba',
    // outros
    'zyxel': 'Zyxel',
    'zte': 'ZTE',
    'xiaomi': 'Xiaomi',
    'mercusys': 'Mercusys',
    'tenda': 'Tenda',
    'dell': 'Dell',
    'lenovo': 'Lenovo',
    'asus': 'Asus',
    'acer': 'Acer',
    'samsung': 'Samsung',
    'positivo': 'Positivo',
    // tokens com espaço para evitar falsos positivos (ex.: "plug")
    ' lg ': 'LG',
    ' hp ': 'HP',
  };

// Busca primeiro por tokens “inteiros” em `clean`
  for (final entry in patterns.entries) {
    final key = entry.key;
    final value = entry.value;

    if (key.startsWith(' ') && key.endsWith(' ')) {
      // tokens com espaço nas pontas (palavra inteira)
      if (clean.contains(key)) return value;
    } else {
      // padrões gerais: tenta no texto bruto e no "clean"
      if (t.contains(key) || clean.contains(' ' + key + ' ')) return value;
    }
  }

  return '';
}
