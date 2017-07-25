#!/bin/sh

# ==============================================================================
#   機能
#     ファイルのカラー出力
#   構文
#     USAGE 参照
#
#   Copyright (c) 2006-2017 Yukio Shiiya
#
#   This software is released under the MIT License.
#   https://opensource.org/licenses/MIT
# ==============================================================================

######################################################################
# 基本設定
######################################################################
trap "" 28				# TRAP SET
trap "POST_PROCESS;exit 1" 1 2 15	# TRAP SET

######################################################################
# 関数定義
######################################################################
. color_function.sh

PRE_PROCESS() {
	# 前景色または背景色が指定されている場合
	if [ ! "${CHARS_COLOR}" = "" ];then
		# 色の変更
		printf "${CHARS_COLOR}"
		if [ $? -ne 0 ];then
			echo "-E Command has ended unsuccessfully." 1>&2
			exit 1
		fi
	fi
}

POST_PROCESS() {
	# 前景色または背景色が指定されている場合
	if [ ! "${CHARS_COLOR}" = "" ];then
		# 色の戻し
		printf "${CHARS_COLOR_NONE}"
		if [ $? -ne 0 ];then
			echo "-E Command has ended unsuccessfully." 1>&2
			exit 1
		fi
	fi
}

USAGE() {
	cat <<- EOF 1>&2
		Usage:
		    color_cat.sh [OPTIONS ...] [FILE]...
		
		    FILE : Specify the file name to output, or standard input, to standard output.
		
		OPTIONS:
		    -F FORE_COLOR (foreground-color)
		       Output the foreground of the strings in the color specified from the following.
		         black, red, green, brown, blue, purple, cyan, light_gray,
		         dark_gray, light_red, light_green, light_yellow,
		         light_blue, light_purple, light_cyan, light_white
		    -B BACK_COLOR (background-color)
		       Output the background of the strings in the color specified from the following.
		         black, red, green, brown, blue, purple, cyan, light_gray
		    -C "CAT_OPTIONS" (cat-options)
		       execute 'cat' command with specified options.
		    --help
		       Display this help and exit.
	EOF
}

######################################################################
# 変数定義
######################################################################
# ユーザ変数

# システム環境 依存変数

# プログラム内部変数
CHARS_COLOR=""							#初期状態が「空文字」でなければならない変数
CHARS_COLOR_NONE='\033[00m'

CAT_OPTIONS=""							#初期状態が「空文字」でなければならない変数

#DEBUG=TRUE

######################################################################
# メインルーチン
######################################################################

# オプションのチェック
CMD_ARG="`getopt -o F:B:C: -l help -- \"$@\" 2>&1`"
if [ $? -ne 0 ];then
	echo "-E ${CMD_ARG}" 1>&2
	USAGE;exit 1
fi
eval set -- "${CMD_ARG}"
while true ; do
	opt="$1"
	case "${opt}" in
	-F)
		CHARS_COLOR="${CHARS_COLOR}`FORECOLOR2CODE \"$2\"`"
		if [ $? -ne 0 ];then
			echo "-E Invalid FORE_COLOR -- \"$2\"" 1>&2
			USAGE;exit 1
		fi
		shift 2
		;;
	-B)
		CHARS_COLOR="${CHARS_COLOR}`BACKCOLOR2CODE \"$2\"`"
		if [ $? -ne 0 ];then
			echo "-E Invalid BACK_COLOR -- \"$2\"" 1>&2
			USAGE;exit 1
		fi
		shift 2
		;;
	-C)	CAT_OPTIONS="$2" ; shift 2;;
	--help)
		USAGE;exit 0
		;;
	--)
		shift 1;break
		;;
	esac
done

# 作業開始前処理
PRE_PROCESS

#####################
# メインループ 開始 #
#####################

# 引数が指定されていない場合
if [ "$1" = "" ];then
	# 標準入力から読み込んで画面表示
	cat ${CAT_OPTIONS}
	if [ $? -ne 0 ];then
		echo "-E Command has ended unsuccessfully." 1>&2
		POST_PROCESS;exit 1
	fi
# 引数が指定されている場合
else
	# ファイルから読み込んで画面表示
	cat ${CAT_OPTIONS} "$@"
	if [ $? -ne 0 ];then
		echo "-E Command has ended unsuccessfully." 1>&2
		POST_PROCESS;exit 1
	fi
fi

#####################
# メインループ 終了 #
#####################

# 作業終了後処理
POST_PROCESS;exit 0

