# color_tools

## 概要

コンソールでのカラー出力

## 使用方法

### color_echo.sh

指定された文字列をコンソールにカラー出力します。

    $ color_echo.sh -F light_blue "OK"
    $ color_echo.sh -F light_red  "NG"

### color_cat.sh

指定されたテキストファイルの内容をコンソールにカラー出力します。

    $ color_cat.sh -F light_blue テキストファイル名

### その他

* 上記で紹介したツールの詳細については、「ツール名 --help」を参照してください。

## 動作環境

OS:

* Linux
* Cygwin

依存パッケージ または 依存コマンド:

* make (インストール目的のみ)

## インストール

ソースからインストールする場合:

    (Linux, Cygwin の場合)
    # make install

fil_pkg.plを使用してインストールする場合:

[fil_pkg.pl](https://github.com/yuksiy/fil_tools_pl/blob/master/README.md#fil_pkgpl) を参照してください。

## インストール後の設定

環境変数「PATH」にインストール先ディレクトリを追加してください。

## 最新版の入手先

<https://github.com/yuksiy/color_tools>

## License

MIT License. See [LICENSE](https://github.com/yuksiy/color_tools/blob/master/LICENSE) file.

## Copyright

Copyright (c) 2006-2017 Yukio Shiiya
