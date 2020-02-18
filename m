Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE1516310E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 20:59:08 +0100 (CET)
Received: from localhost ([::1]:41300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j491O-0003BY-R8
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 14:59:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42657)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j490N-0002Jw-5q
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 14:58:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j490L-0003Eo-PV
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 14:58:03 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:42351)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1j490L-0003BU-G3
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 14:58:01 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M6DSi-1j6N012HvM-006gPj; Tue, 18 Feb 2020 20:57:57 +0100
Subject: Re: [PATCH v3] linux-user/strace: Improve output of various syscalls
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>
References: <20191121193351.GA31821@ls3530.fritz.box>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <2edf7243-f5c3-9a96-aec3-a68e41dda49b@vivier.eu>
Date: Tue, 18 Feb 2020 20:57:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20191121193351.GA31821@ls3530.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:L3XTV1b2Wllt+gVZZo6tQbAxwqMMdqTgN9W/UOsN3Pe4BJCZT9J
 lBlsYT6XlkBFp4j7IqykEnRATn65BsStankbYKdk4P8d+VM8HsjgJAYnlZrQoJ3YqH7jhlk
 2K8c/s6Yc0dM/CDZo4qy0JZEsnrWFiNfSR9xudbupq4MlJPKrkxXYDZUZRGKOnarIxKkZxB
 iKO82g7PSw4SjCVqHk3OQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:y1OyitYTGOQ=:bcDNMSs9UuyEXlfOPGQgjq
 NRUEBgFdurUT6eypeDvgXUtIsyxZ0KMl+aWiQaXzt4MVgQtmYdnynWMbTaw3mn6wY/2NYvMvx
 bzo6iuBfLVu8IoBt3BpWN2m/1z137T3YUU3KtCvY1mJaJCM8mpYKw7uwpQbuiWGS4i9eMR9+M
 ZW9301dmOdFGI0aU03da/V3U/GW4thFm+GT020kXe4/Pvz7aSufdNZl9GsMMY+OYd0KkBRhBD
 mjyyDc0eyp0jo1qRFcMfAxaOW4obW84t1nZCVyqlw59rqTAZQa9LckpTAhYVSeQQQJTjta9jl
 DuVNyuP4l6skC4g/DGS8ml41AiXBrunutNPEmGmdx0EhYWGai5K/v+RCUU6dGw2k4FLXqXLjA
 4sPbpLOO2gnZGgA8VzJAj7NeRFBmiE/gv3EkQqfFlsud3jfz9LUiyl/ihdW87jwrwYGCEqUY+
 PBaMGGpsmj7m0+CixdyUirRXwKKmcNk+AJ94/7+YH5hcsMz7W4lfqvgjf2H37IO01uTO2e7YV
 QZYCj5r3qA+XoKMdwuuCxDbf1IRcZxlcgN+x5h9qAxKpKOy9ZALtqmmAraeE+hldlcpGq+4bK
 AZJEZBnoT7ia3HGzMNPdIBFI1YXTwkI7Mbp1h26yHf+5JcRc/A90D2ZtQe4/Vp8iigznjO2+O
 oTYEcsQx9zWEWqq671xMZ5DQ0ulKUmGEj+Msldc2ABVRzvpDCP4zKuZ5B+EU1i/k4oKNezkma
 7LiZsROlNoDh7qnRBC+/H3Oc2a/sHHKMMtRqkttAYdZzBA09Tm3rnghqsqHGrDJ+7jxmDx5l1
 Dy7Tfrygw/AJ1Tg8uwulPUHYezXRDRQ44aA5JA8PqiCYkRngxMRMDqMjHa3Fj23swz00+0B
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 21/11/2019 à 20:33, Helge Deller a écrit :
> Improve strace output of various syscalls which either have none
> or only int-type parameters.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> ---
> Changes in v3:
>     fixed alarm()
>     added epoll_create(), epoll_create1(), eventfd(), eventfd2()
> 
> Changes in v2:
>     fixed ioctl()
> 
> 
> diff --git a/linux-user/strace.list b/linux-user/strace.list
> index 1de4319dcf..d49a1e92a8 100644
> --- a/linux-user/strace.list
> +++ b/linux-user/strace.list
> @@ -26,7 +26,7 @@
>  { TARGET_NR_afs_syscall, "afs_syscall" , NULL, NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_alarm
> -{ TARGET_NR_alarm, "alarm" , NULL, NULL, NULL },
> +{ TARGET_NR_alarm, "alarm" , "%s(%u)", NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_aplib
>  { TARGET_NR_aplib, "aplib" , NULL, NULL, NULL },
> @@ -116,19 +116,19 @@
>  { TARGET_NR_dipc, "dipc" , NULL, NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_dup
> -{ TARGET_NR_dup, "dup" , NULL, NULL, NULL },
> +{ TARGET_NR_dup, "dup" , "%s(%d)", NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_dup2
> -{ TARGET_NR_dup2, "dup2" , NULL, NULL, NULL },
> +{ TARGET_NR_dup2, "dup2" , "%s(%d,%d)", NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_dup3
> -{ TARGET_NR_dup3, "dup3" , NULL, NULL, NULL },
> +{ TARGET_NR_dup3, "dup3" , "%s(%d,%d,%d)", NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_epoll_create
> -{ TARGET_NR_epoll_create, "epoll_create" , NULL, NULL, NULL },
> +{ TARGET_NR_epoll_create, "%s(%d)", NULL, NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_epoll_create1
> -{ TARGET_NR_epoll_create1, "epoll_create1" , NULL, NULL, NULL },
> +{ TARGET_NR_epoll_create1, "%s(%d)", NULL, NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_epoll_ctl
>  { TARGET_NR_epoll_ctl, "epoll_ctl" , NULL, NULL, NULL },
> @@ -146,10 +146,10 @@
>  { TARGET_NR_epoll_wait_old, "epoll_wait_old" , NULL, NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_eventfd
> -{ TARGET_NR_eventfd, "eventfd" , NULL, NULL, NULL },
> +{ TARGET_NR_eventfd, "eventfd", "%s(%d)", NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_eventfd2
> -{ TARGET_NR_eventfd2, "eventfd2" , NULL, NULL, NULL },
> +{ TARGET_NR_eventfd2, "eventfd2" , "%s(%d,%d)", NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_execv
>  { TARGET_NR_execv, "execv" , NULL, print_execv, NULL },
> @@ -191,7 +191,7 @@
>  { TARGET_NR_fanotify_mark, "fanotify_mark" , NULL, NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_fchdir
> -{ TARGET_NR_fchdir, "fchdir" , NULL, NULL, NULL },
> +{ TARGET_NR_fchdir, "fchdir" , "%s(%d)", NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_fchmod
>  { TARGET_NR_fchmod, "fchmod" , "%s(%d,%#o)", NULL, NULL },
> @@ -287,7 +287,7 @@
>  { TARGET_NR_getdtablesize, "getdtablesize" , NULL, NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_getegid
> -{ TARGET_NR_getegid, "getegid" , NULL, NULL, NULL },
> +{ TARGET_NR_getegid, "getegid" , "%s()", NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_getegid32
>  { TARGET_NR_getegid32, "getegid32" , NULL, NULL, NULL },
> @@ -299,7 +299,7 @@
>  { TARGET_NR_geteuid32, "geteuid32" , NULL, NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_getgid
> -{ TARGET_NR_getgid, "getgid" , NULL, NULL, NULL },
> +{ TARGET_NR_getgid, "getgid" , "%s()", NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_getgid32
>  { TARGET_NR_getgid32, "getgid32" , NULL, NULL, NULL },
> @@ -329,10 +329,10 @@
>  { TARGET_NR_getpeername, "getpeername" , NULL, NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_getpgid
> -{ TARGET_NR_getpgid, "getpgid" , NULL, NULL, NULL },
> +{ TARGET_NR_getpgid, "getpgid" , "%s(%u)", NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_getpgrp
> -{ TARGET_NR_getpgrp, "getpgrp" , NULL, NULL, NULL },
> +{ TARGET_NR_getpgrp, "getpgrp" , "%s()", NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_getpid
>  { TARGET_NR_getpid, "getpid" , "%s()", NULL, NULL },
> @@ -432,7 +432,7 @@
>  { TARGET_NR_io_cancel, "io_cancel" , NULL, NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_ioctl
> -{ TARGET_NR_ioctl, "ioctl" , NULL, NULL, NULL },
> +{ TARGET_NR_ioctl, "ioctl" , "%s(%d,%#x,%#x)", NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_io_destroy
>  { TARGET_NR_io_destroy, "io_destroy" , NULL, NULL, NULL },
> @@ -1257,22 +1257,22 @@
>  { TARGET_NR_setdomainname, "setdomainname" , NULL, NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_setfsgid
> -{ TARGET_NR_setfsgid, "setfsgid" , NULL, NULL, NULL },
> +{ TARGET_NR_setfsgid, "setfsgid" , "%s(%u)", NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_setfsgid32
> -{ TARGET_NR_setfsgid32, "setfsgid32" , NULL, NULL, NULL },
> +{ TARGET_NR_setfsgid32, "setfsgid32" , "%s(%u)" , NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_setfsuid
> -{ TARGET_NR_setfsuid, "setfsuid" , NULL, NULL, NULL },
> +{ TARGET_NR_setfsuid, "setfsuid" , "%s(%u)" , NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_setfsuid32
>  { TARGET_NR_setfsuid32, "setfsuid32" , NULL, NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_setgid
> -{ TARGET_NR_setgid, "setgid" , NULL, NULL, NULL },
> +{ TARGET_NR_setgid, "setgid" , "%s(%u)", NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_setgid32
> -{ TARGET_NR_setgid32, "setgid32" , NULL, NULL, NULL },
> +{ TARGET_NR_setgid32, "setgid32" , "%s(%u)", NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_setgroups
>  { TARGET_NR_setgroups, "setgroups" , NULL, NULL, NULL },
> @@ -1296,7 +1296,7 @@
>  { TARGET_NR_setns, "setns" , NULL, NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_setpgid
> -{ TARGET_NR_setpgid, "setpgid" , NULL, NULL, NULL },
> +{ TARGET_NR_setpgid, "setpgid" , "%s(%u,%u)", NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_setpgrp
>  { TARGET_NR_setpgrp, "setpgrp" , NULL, NULL, NULL },
> @@ -1311,22 +1311,22 @@
>  { TARGET_NR_setregid32, "setregid32" , NULL, NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_setresgid
> -{ TARGET_NR_setresgid, "setresgid" , NULL, NULL, NULL },
> +{ TARGET_NR_setresgid, "setresgid" , "%s(%u,%u,%u)", NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_setresgid32
>  { TARGET_NR_setresgid32, "setresgid32" , NULL, NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_setresuid
> -{ TARGET_NR_setresuid, "setresuid" , NULL, NULL, NULL },
> +{ TARGET_NR_setresuid, "setresuid" , "%s(%u,%u,%u)", NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_setresuid32
> -{ TARGET_NR_setresuid32, "setresuid32" , NULL, NULL, NULL },
> +{ TARGET_NR_setresuid32, "setresuid32" , "%s(%u,%u,%u)", NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_setreuid
> -{ TARGET_NR_setreuid, "setreuid" , NULL, NULL, NULL },
> +{ TARGET_NR_setreuid, "setreuid" , "%s(%u,%u)", NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_setreuid32
> -{ TARGET_NR_setreuid32, "setreuid32" , NULL, NULL, NULL },
> +{ TARGET_NR_setreuid32, "setreuid32" , "%s(%u,%u)", NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_setrlimit
>  { TARGET_NR_setrlimit, "setrlimit" , NULL, NULL, NULL },
> @@ -1335,7 +1335,7 @@
>  { TARGET_NR_set_robust_list, "set_robust_list" , NULL, NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_setsid
> -{ TARGET_NR_setsid, "setsid" , NULL, NULL, NULL },
> +{ TARGET_NR_setsid, "setsid" , "%s()", NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_setsockopt
>  { TARGET_NR_setsockopt, "setsockopt" , NULL, NULL, NULL },
> 

Applied to my linux-user branch.

Thanks,
Laurent

