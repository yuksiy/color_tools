#!/bin/sh

# ==============================================================================
#   機能
#     ・前景色->前景色コード 変換(FORECOLOR2CODE)
#     ・背景色->背景色コード 変換(BACKCOLOR2CODE)
#   構文
#     . color_function.sh
#     FORECOLOR2CODE "COLOR"
#     BACKCOLOR2CODE "COLOR"
#
#   Copyright (c) 2006-2017 Yukio Shiiya
#
#   This software is released under the MIT License.
#   https://opensource.org/licenses/MIT
# ==============================================================================

######################################################################
# 関数定義
######################################################################
# 前景色->前景色コード 変換
FORECOLOR2CODE() {
	case "$1" in
	black        ) echo '\033[30;00m';;
	red          ) echo '\033[31;00m';;
	green        ) echo '\033[32;00m';;
	brown        ) echo '\033[33;00m';;
	blue         ) echo '\033[34;00m';;
	purple       ) echo '\033[35;00m';;
	cyan         ) echo '\033[36;00m';;
	light_gray   ) echo '\033[37;00m';;

	dark_gray    ) echo '\033[30;01m';;
	light_red    ) echo '\033[31;01m';;
	light_green  ) echo '\033[32;01m';;
	light_yellow ) echo '\033[33;01m';;
	light_blue   ) echo '\033[34;01m';;
	light_purple ) echo '\033[35;01m';;
	light_cyan   ) echo '\033[36;01m';;
	light_white  ) echo '\033[37;01m';;
	*)
		return 1
		;;
	esac
}

# 背景色->背景色コード 変換
BACKCOLOR2CODE() {
	case "$1" in
	black        ) echo '\033[40m';;
	red          ) echo '\033[41m';;
	green        ) echo '\033[42m';;
	brown        ) echo '\033[43m';;
	blue         ) echo '\033[44m';;
	purple       ) echo '\033[45m';;
	cyan         ) echo '\033[46m';;
	light_gray   ) echo '\033[47m';;
	*)
		return 1
		;;
	esac
}

