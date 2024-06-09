import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AssetFile implements File {
  final AssetBundle assetBundle;
  final String filePath;

  AssetFile(this.assetBundle, this.filePath);

  @override
  Future<Uint8List> readAsBytes() async {
    final ByteData bytes = await this.assetBundle.load(filePath);
    return bytes.buffer.asUint8List();
  }

  @override
  File get absolute => throw UnimplementedError();

  @override
  Future<File> copy(String newPath) {
    throw UnimplementedError();
  }

  @override
  File copySync(String newPath) {
    throw UnimplementedError();
  }

  @override
  Future<File> create({bool recursive = false}) {
    throw UnimplementedError();
  }

  @override
  void createSync({bool recursive = false}) {
    throw UnimplementedError();
  }

  @override
  Future<FileSystemEntity> delete({bool recursive = false}) {
    throw UnimplementedError();
  }

  @override
  void deleteSync({bool recursive = false}) {
    throw UnimplementedError();
  }

  @override
  Future<bool> exists() {
    throw UnimplementedError();
  }

  @override
  bool existsSync() {
    throw UnimplementedError();
  }

  @override
  bool get isAbsolute => throw UnimplementedError();

  @override
  Future<DateTime> lastAccessed() {
    throw UnimplementedError();
  }

  @override
  DateTime lastAccessedSync() {
    throw UnimplementedError();
  }

  @override
  Future<DateTime> lastModified() {
    throw UnimplementedError();
  }

  @override
  DateTime lastModifiedSync() {
    throw UnimplementedError();
  }

  @override
  Future<int> length() {
    throw UnimplementedError();
  }

  @override
  int lengthSync() {
    throw UnimplementedError();
  }

  @override
  Future<RandomAccessFile> open({FileMode mode = FileMode.read}) {
    throw UnimplementedError();
  }

  @override
  Stream<List<int>> openRead([int? start, int? end]) {
    throw UnimplementedError();
  }

  @override
  RandomAccessFile openSync({FileMode mode = FileMode.read}) {
    throw UnimplementedError();
  }

  @override
  IOSink openWrite({FileMode mode = FileMode.write, Encoding encoding = utf8}) {
    throw UnimplementedError();
  }

  @override
  Directory get parent => throw UnimplementedError();

  @override
  String get path => filePath;

  @override
  Uint8List readAsBytesSync() {
    throw UnimplementedError();
  }

  @override
  Future<List<String>> readAsLines({Encoding encoding = utf8}) {
    throw UnimplementedError();
  }

  @override
  List<String> readAsLinesSync({Encoding encoding = utf8}) {
    throw UnimplementedError();
  }

  @override
  Future<String> readAsString({Encoding encoding = utf8}) {
    throw UnimplementedError();
  }

  @override
  String readAsStringSync({Encoding encoding = utf8}) {
    throw UnimplementedError();
  }

  @override
  Future<File> rename(String newPath) {
    throw UnimplementedError();
  }

  @override
  File renameSync(String newPath) {
    throw UnimplementedError();
  }

  @override
  Future<String> resolveSymbolicLinks() {
    throw UnimplementedError();
  }

  @override
  String resolveSymbolicLinksSync() {
    throw UnimplementedError();
  }

  @override
  Future setLastAccessed(DateTime time) {
    throw UnimplementedError();
  }

  @override
  void setLastAccessedSync(DateTime time) {
    throw UnimplementedError();
  }

  @override
  Future setLastModified(DateTime time) {
    throw UnimplementedError();
  }

  @override
  void setLastModifiedSync(DateTime time) {
    throw UnimplementedError();
  }

  @override
  Future<FileStat> stat() {
    throw UnimplementedError();
  }

  @override
  FileStat statSync() {
    throw UnimplementedError();
  }

  @override
  Uri get uri => throw UnimplementedError();

  @override
  Stream<FileSystemEvent> watch({int events = FileSystemEvent.all, bool recursive = false}) {
    throw UnimplementedError();
  }

  @override
  Future<File> writeAsBytes(List<int> bytes, {FileMode mode = FileMode.write, bool flush = false}) {
    throw UnimplementedError();
  }

  @override
  void writeAsBytesSync(List<int> bytes, {FileMode mode = FileMode.write, bool flush = false}) {
    throw UnimplementedError();
  }

  @override
  Future<File> writeAsString(String contents, {FileMode mode = FileMode.write, Encoding encoding = utf8, bool flush = false}) {
    throw UnimplementedError();
  }

  @override
  void writeAsStringSync(String contents, {FileMode mode = FileMode.write, Encoding encoding = utf8, bool flush = false}) {
    throw UnimplementedError();
  }
}
