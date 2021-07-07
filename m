Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3923BF06E
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 21:43:34 +0200 (CEST)
Received: from localhost ([::1]:60408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1DSH-0005CG-MW
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 15:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1DK4-0005fP-3k
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:35:05 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:56455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1DK2-0007pt-7m
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:35:03 -0400
Received: from [192.168.100.1] ([82.142.13.34]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N4z2Y-1l0lJF0com-010q89; Wed, 07 Jul 2021 21:34:41 +0200
Subject: Re: [PATCH 11/12] linux-user/syscall: Remove hardcoded tabs (code
 style)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210704183755.655002-1-f4bug@amsat.org>
 <20210704183755.655002-12-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <6e37c4a5-fba4-4042-0e54-6a8b10dab0c3@vivier.eu>
Date: Wed, 7 Jul 2021 21:34:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210704183755.655002-12-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:u9cZqqGuX27Ohe5eJumRoDxfpyNt7pvOgBa7pkw9WqEjRStsXUX
 y5k3e7MQyA1d3RJkG38AwwcRAZqUqa0Mu+6+MxC+l4BXgOr73QAgoLS+q9hqyZ76QNTnncL
 axB7xUmnY3Ok9ViDH4lcKaGYISCK7LTFk1602RXtg+nVKKcoi2q85HibsW2s+4TcnMgruv/
 ciqjaJZqdJB3154+LCKLg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EXzLooXWYwo=:uAR0uU3O1WC4K4jW6/+aal
 q+t5bFY1IqcXlZsbtnhwpELYMH6wD+JirIKChnLBCM3Gn8IMIiF90b3BOci7bwP95xD/yFMIZ
 PA1KW4F91xga81DF19iiKDQ8LwTeY+xnHg9gHP4/EEsoX5qUzKIRhO23wEwZtpZgm4dLFxs5b
 miJXxkep29ewFnZqr6v1yv9Y/xz/a+YH1hp0Te/n/75pJMaK1pJXv0a5WVYWiiPmzqqe3vtSE
 HzznV2IWweYPbS09ZB9Ciwhh2CVS0rS8ZEamtbN+78Kao7q69xjzKvIQYy8wmW31sjP4Hpvwp
 +9wJYNxbdRVfaAJPYSafqKPJWolkJPV+AsWR+/H5gK6sbaAvsfeIUbrz5BCBbUNbblwQuWhkA
 GyphUYAQ8EyqAPsWqL8Rtk6Ey1Y1sc5MetJV2C8/sstk7FHAttC+ZrqBgotL6tDgJJm0gPCjS
 cP9BW3ObrmGLgZL6Iq0EbbH+fL/BOWKTbR2dpK9xzcaqVwF3pJzOHn5gd9Fa74gsLDq3Ze+w0
 pFujRVlxS6Q0aBnpSP9Ds5z3BRhgEyE5BV6hix2sd0ZSBV4fhZjrL5WLpSfIMiuFMt6IY1yYY
 ncSyrGwWGxbDdjOLE2a0w2yzyz/mFbdO59yNQNLyTMZrl5jPVH1RcN4D6bD1Qhy+SOEZE1JgY
 r9Dimm+Jx2I1t/zoQ670/xLwhvUucil7dioTu+NuqSEhBVLRQVf1NFf3KmBpJrF/zNnyq7qma
 b07aKoem9OX9YrY30sgRtWDQZ9qfVEK4rEEkld3x9X1I9CzVdjwyuksT7TSMw4GXumgjofNXk
 uQMjGhvCrbCW247WfZ3kWC8zd2F/WrmmWwkfm93zr959LQgX/3/HGSkAZ/peWwTGuLAhGYJ
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UPPERCASE_75_100=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>, Helge Deller <deller@gmx.de>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 04/07/2021 à 20:37, Philippe Mathieu-Daudé a écrit :
> We are going to move this code, fix its style first.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Patch trivial to review using 'git-diff --ignore-all-space'
> ---
>  linux-user/syscall.c | 188 +++++++++++++++++++++----------------------
>  1 file changed, 94 insertions(+), 94 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 33b7fef12a8..3761d3b2d64 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -521,112 +521,112 @@ static uint16_t target_to_host_errno_table[ERRNO_TABLE_SIZE] = {
>   * minus the errnos that are not actually generic to all archs.
>   */
>  static uint16_t host_to_target_errno_table[ERRNO_TABLE_SIZE] = {
> -    [EAGAIN]		= TARGET_EAGAIN,
> -    [EIDRM]		= TARGET_EIDRM,
> -    [ECHRNG]		= TARGET_ECHRNG,
> -    [EL2NSYNC]		= TARGET_EL2NSYNC,
> -    [EL3HLT]		= TARGET_EL3HLT,
> -    [EL3RST]		= TARGET_EL3RST,
> -    [ELNRNG]		= TARGET_ELNRNG,
> -    [EUNATCH]		= TARGET_EUNATCH,
> -    [ENOCSI]		= TARGET_ENOCSI,
> -    [EL2HLT]		= TARGET_EL2HLT,
> -    [EDEADLK]		= TARGET_EDEADLK,
> -    [ENOLCK]		= TARGET_ENOLCK,
> -    [EBADE]		= TARGET_EBADE,
> -    [EBADR]		= TARGET_EBADR,
> -    [EXFULL]		= TARGET_EXFULL,
> -    [ENOANO]		= TARGET_ENOANO,
> -    [EBADRQC]		= TARGET_EBADRQC,
> -    [EBADSLT]		= TARGET_EBADSLT,
> -    [EBFONT]		= TARGET_EBFONT,
> -    [ENOSTR]		= TARGET_ENOSTR,
> -    [ENODATA]		= TARGET_ENODATA,
> -    [ETIME]		= TARGET_ETIME,
> -    [ENOSR]		= TARGET_ENOSR,
> -    [ENONET]		= TARGET_ENONET,
> -    [ENOPKG]		= TARGET_ENOPKG,
> -    [EREMOTE]		= TARGET_EREMOTE,
> -    [ENOLINK]		= TARGET_ENOLINK,
> -    [EADV]		= TARGET_EADV,
> -    [ESRMNT]		= TARGET_ESRMNT,
> -    [ECOMM]		= TARGET_ECOMM,
> -    [EPROTO]		= TARGET_EPROTO,
> -    [EDOTDOT]		= TARGET_EDOTDOT,
> -    [EMULTIHOP]		= TARGET_EMULTIHOP,
> -    [EBADMSG]		= TARGET_EBADMSG,
> -    [ENAMETOOLONG]	= TARGET_ENAMETOOLONG,
> -    [EOVERFLOW]		= TARGET_EOVERFLOW,
> -    [ENOTUNIQ]		= TARGET_ENOTUNIQ,
> -    [EBADFD]		= TARGET_EBADFD,
> -    [EREMCHG]		= TARGET_EREMCHG,
> -    [ELIBACC]		= TARGET_ELIBACC,
> -    [ELIBBAD]		= TARGET_ELIBBAD,
> -    [ELIBSCN]		= TARGET_ELIBSCN,
> -    [ELIBMAX]		= TARGET_ELIBMAX,
> -    [ELIBEXEC]		= TARGET_ELIBEXEC,
> -    [EILSEQ]		= TARGET_EILSEQ,
> -    [ENOSYS]		= TARGET_ENOSYS,
> -    [ELOOP]		= TARGET_ELOOP,
> -    [ERESTART]		= TARGET_ERESTART,
> -    [ESTRPIPE]		= TARGET_ESTRPIPE,
> -    [ENOTEMPTY]		= TARGET_ENOTEMPTY,
> -    [EUSERS]		= TARGET_EUSERS,
> -    [ENOTSOCK]		= TARGET_ENOTSOCK,
> -    [EDESTADDRREQ]	= TARGET_EDESTADDRREQ,
> -    [EMSGSIZE]		= TARGET_EMSGSIZE,
> -    [EPROTOTYPE]	= TARGET_EPROTOTYPE,
> -    [ENOPROTOOPT]	= TARGET_ENOPROTOOPT,
> -    [EPROTONOSUPPORT]	= TARGET_EPROTONOSUPPORT,
> -    [ESOCKTNOSUPPORT]	= TARGET_ESOCKTNOSUPPORT,
> -    [EOPNOTSUPP]	= TARGET_EOPNOTSUPP,
> -    [EPFNOSUPPORT]	= TARGET_EPFNOSUPPORT,
> -    [EAFNOSUPPORT]	= TARGET_EAFNOSUPPORT,
> -    [EADDRINUSE]	= TARGET_EADDRINUSE,
> -    [EADDRNOTAVAIL]	= TARGET_EADDRNOTAVAIL,
> -    [ENETDOWN]		= TARGET_ENETDOWN,
> -    [ENETUNREACH]	= TARGET_ENETUNREACH,
> -    [ENETRESET]		= TARGET_ENETRESET,
> -    [ECONNABORTED]	= TARGET_ECONNABORTED,
> -    [ECONNRESET]	= TARGET_ECONNRESET,
> -    [ENOBUFS]		= TARGET_ENOBUFS,
> -    [EISCONN]		= TARGET_EISCONN,
> -    [ENOTCONN]		= TARGET_ENOTCONN,
> -    [EUCLEAN]		= TARGET_EUCLEAN,
> -    [ENOTNAM]		= TARGET_ENOTNAM,
> -    [ENAVAIL]		= TARGET_ENAVAIL,
> -    [EISNAM]		= TARGET_EISNAM,
> -    [EREMOTEIO]		= TARGET_EREMOTEIO,
> +    [EAGAIN]            = TARGET_EAGAIN,
> +    [EIDRM]             = TARGET_EIDRM,
> +    [ECHRNG]            = TARGET_ECHRNG,
> +    [EL2NSYNC]          = TARGET_EL2NSYNC,
> +    [EL3HLT]            = TARGET_EL3HLT,
> +    [EL3RST]            = TARGET_EL3RST,
> +    [ELNRNG]            = TARGET_ELNRNG,
> +    [EUNATCH]           = TARGET_EUNATCH,
> +    [ENOCSI]            = TARGET_ENOCSI,
> +    [EL2HLT]            = TARGET_EL2HLT,
> +    [EDEADLK]           = TARGET_EDEADLK,
> +    [ENOLCK]            = TARGET_ENOLCK,
> +    [EBADE]             = TARGET_EBADE,
> +    [EBADR]             = TARGET_EBADR,
> +    [EXFULL]            = TARGET_EXFULL,
> +    [ENOANO]            = TARGET_ENOANO,
> +    [EBADRQC]           = TARGET_EBADRQC,
> +    [EBADSLT]           = TARGET_EBADSLT,
> +    [EBFONT]            = TARGET_EBFONT,
> +    [ENOSTR]            = TARGET_ENOSTR,
> +    [ENODATA]           = TARGET_ENODATA,
> +    [ETIME]             = TARGET_ETIME,
> +    [ENOSR]             = TARGET_ENOSR,
> +    [ENONET]            = TARGET_ENONET,
> +    [ENOPKG]            = TARGET_ENOPKG,
> +    [EREMOTE]           = TARGET_EREMOTE,
> +    [ENOLINK]           = TARGET_ENOLINK,
> +    [EADV]              = TARGET_EADV,
> +    [ESRMNT]            = TARGET_ESRMNT,
> +    [ECOMM]             = TARGET_ECOMM,
> +    [EPROTO]            = TARGET_EPROTO,
> +    [EDOTDOT]           = TARGET_EDOTDOT,
> +    [EMULTIHOP]         = TARGET_EMULTIHOP,
> +    [EBADMSG]           = TARGET_EBADMSG,
> +    [ENAMETOOLONG]      = TARGET_ENAMETOOLONG,
> +    [EOVERFLOW]         = TARGET_EOVERFLOW,
> +    [ENOTUNIQ]          = TARGET_ENOTUNIQ,
> +    [EBADFD]            = TARGET_EBADFD,
> +    [EREMCHG]           = TARGET_EREMCHG,
> +    [ELIBACC]           = TARGET_ELIBACC,
> +    [ELIBBAD]           = TARGET_ELIBBAD,
> +    [ELIBSCN]           = TARGET_ELIBSCN,
> +    [ELIBMAX]           = TARGET_ELIBMAX,
> +    [ELIBEXEC]          = TARGET_ELIBEXEC,
> +    [EILSEQ]            = TARGET_EILSEQ,
> +    [ENOSYS]            = TARGET_ENOSYS,
> +    [ELOOP]             = TARGET_ELOOP,
> +    [ERESTART]          = TARGET_ERESTART,
> +    [ESTRPIPE]          = TARGET_ESTRPIPE,
> +    [ENOTEMPTY]         = TARGET_ENOTEMPTY,
> +    [EUSERS]            = TARGET_EUSERS,
> +    [ENOTSOCK]          = TARGET_ENOTSOCK,
> +    [EDESTADDRREQ]      = TARGET_EDESTADDRREQ,
> +    [EMSGSIZE]          = TARGET_EMSGSIZE,
> +    [EPROTOTYPE]        = TARGET_EPROTOTYPE,
> +    [ENOPROTOOPT]       = TARGET_ENOPROTOOPT,
> +    [EPROTONOSUPPORT]   = TARGET_EPROTONOSUPPORT,
> +    [ESOCKTNOSUPPORT]   = TARGET_ESOCKTNOSUPPORT,
> +    [EOPNOTSUPP]        = TARGET_EOPNOTSUPP,
> +    [EPFNOSUPPORT]      = TARGET_EPFNOSUPPORT,
> +    [EAFNOSUPPORT]      = TARGET_EAFNOSUPPORT,
> +    [EADDRINUSE]        = TARGET_EADDRINUSE,
> +    [EADDRNOTAVAIL]     = TARGET_EADDRNOTAVAIL,
> +    [ENETDOWN]          = TARGET_ENETDOWN,
> +    [ENETUNREACH]       = TARGET_ENETUNREACH,
> +    [ENETRESET]         = TARGET_ENETRESET,
> +    [ECONNABORTED]      = TARGET_ECONNABORTED,
> +    [ECONNRESET]        = TARGET_ECONNRESET,
> +    [ENOBUFS]           = TARGET_ENOBUFS,
> +    [EISCONN]           = TARGET_EISCONN,
> +    [ENOTCONN]          = TARGET_ENOTCONN,
> +    [EUCLEAN]           = TARGET_EUCLEAN,
> +    [ENOTNAM]           = TARGET_ENOTNAM,
> +    [ENAVAIL]           = TARGET_ENAVAIL,
> +    [EISNAM]            = TARGET_EISNAM,
> +    [EREMOTEIO]         = TARGET_EREMOTEIO,
>      [EDQUOT]            = TARGET_EDQUOT,
> -    [ESHUTDOWN]		= TARGET_ESHUTDOWN,
> -    [ETOOMANYREFS]	= TARGET_ETOOMANYREFS,
> -    [ETIMEDOUT]		= TARGET_ETIMEDOUT,
> -    [ECONNREFUSED]	= TARGET_ECONNREFUSED,
> -    [EHOSTDOWN]		= TARGET_EHOSTDOWN,
> -    [EHOSTUNREACH]	= TARGET_EHOSTUNREACH,
> -    [EALREADY]		= TARGET_EALREADY,
> -    [EINPROGRESS]	= TARGET_EINPROGRESS,
> -    [ESTALE]		= TARGET_ESTALE,
> -    [ECANCELED]		= TARGET_ECANCELED,
> -    [ENOMEDIUM]		= TARGET_ENOMEDIUM,
> -    [EMEDIUMTYPE]	= TARGET_EMEDIUMTYPE,
> +    [ESHUTDOWN]         = TARGET_ESHUTDOWN,
> +    [ETOOMANYREFS]      = TARGET_ETOOMANYREFS,
> +    [ETIMEDOUT]         = TARGET_ETIMEDOUT,
> +    [ECONNREFUSED]      = TARGET_ECONNREFUSED,
> +    [EHOSTDOWN]         = TARGET_EHOSTDOWN,
> +    [EHOSTUNREACH]      = TARGET_EHOSTUNREACH,
> +    [EALREADY]          = TARGET_EALREADY,
> +    [EINPROGRESS]       = TARGET_EINPROGRESS,
> +    [ESTALE]            = TARGET_ESTALE,
> +    [ECANCELED]         = TARGET_ECANCELED,
> +    [ENOMEDIUM]         = TARGET_ENOMEDIUM,
> +    [EMEDIUMTYPE]       = TARGET_EMEDIUMTYPE,
>  #ifdef ENOKEY
> -    [ENOKEY]		= TARGET_ENOKEY,
> +    [ENOKEY]            = TARGET_ENOKEY,
>  #endif
>  #ifdef EKEYEXPIRED
> -    [EKEYEXPIRED]	= TARGET_EKEYEXPIRED,
> +    [EKEYEXPIRED]       = TARGET_EKEYEXPIRED,
>  #endif
>  #ifdef EKEYREVOKED
> -    [EKEYREVOKED]	= TARGET_EKEYREVOKED,
> +    [EKEYREVOKED]       = TARGET_EKEYREVOKED,
>  #endif
>  #ifdef EKEYREJECTED
> -    [EKEYREJECTED]	= TARGET_EKEYREJECTED,
> +    [EKEYREJECTED]      = TARGET_EKEYREJECTED,
>  #endif
>  #ifdef EOWNERDEAD
> -    [EOWNERDEAD]	= TARGET_EOWNERDEAD,
> +    [EOWNERDEAD]        = TARGET_EOWNERDEAD,
>  #endif
>  #ifdef ENOTRECOVERABLE
> -    [ENOTRECOVERABLE]	= TARGET_ENOTRECOVERABLE,
> +    [ENOTRECOVERABLE]   = TARGET_ENOTRECOVERABLE,
>  #endif
>  #ifdef ENOMSG
>      [ENOMSG]            = TARGET_ENOMSG,
> 

Applied to my linux-user-for-6.1 branch.

Thanks,
Laurent


