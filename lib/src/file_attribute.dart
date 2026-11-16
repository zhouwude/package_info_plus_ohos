// ohos probe stub：原实现依赖 win32 ^5 FFI（TEXT 等），与 win32 6.x 不兼容。
// Windows 平台在 ohos 构建不可达；如真跑 Windows 会抛 UnsupportedError。
class FileAttributes {
  FileAttributes(String filePath);

  DateTime? get creationTime =>
      throw UnsupportedError('win32 FFI stubbed out for ohos probe');
  DateTime? get lastWriteTime =>
      throw UnsupportedError('win32 FFI stubbed out for ohos probe');
}