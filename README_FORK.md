# package_info_plus (OpenHarmony fork, patched)

CPF-Flutter `package_info_plus` v9.0.0 的 OpenHarmony 分支，含 ohos 原生实现
（`ohos/`，ArkTS PackageInfoPlugin），用于鸿蒙读取 App 版本号/包名。

上游：https://gitcode.com/CPF-Flutter/flutter_plus_plugins
分支：`br_package_info_plus-v9.0.0_ohos`（commit `bc4df81`）

## 本仓库的补丁（相对上游）

上游 `lib/src/file_attribute.dart` / `file_version_info.dart` 依赖 **win32 ^5 FFI**
（`TEXT` / `GetFileVersionInfo` 等），与 win32 6.x 不兼容。CIYINSO 主仓为解
file_picker/share_plus 的 win32 版本死锁，全局 override win32 到 ^6.3.0，故将这两个
**Windows 专用**文件 stub 掉（鸿蒙/Android/iOS 不触及 Windows 文件版本信息；真跑
Windows 会抛 UnsupportedError）。相应把 pubspec 的 win32 约束放宽到 `>=5.5.3 <7.0.0`。

## 用法（CIYINSO 主仓 pubspec.yaml）

```yaml
dependency_overrides:
  package_info_plus:
    git:
      url: https://github.com/zhouwude/package_info_plus_ohos.git
      ref: main
```

pub 自动拉取，无需本地克隆；hvigor 拿到 pub cache 真实路径（非 symlink），
不触发 realpath 校验。