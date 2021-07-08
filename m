Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 209A03C16AF
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:56:20 +0200 (CEST)
Received: from localhost ([::1]:55950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WNv-00044g-1l
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1Vu5-00028Y-Pl
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:25:30 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:56725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1Vu3-0001uu-Cz
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:25:29 -0400
Received: from [192.168.100.1] ([82.142.13.34]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MI5YN-1lvDJA2Kvf-00FCbO; Thu, 08 Jul 2021 17:25:11 +0200
Subject: Re: [PATCH v2 4/8] linux-user/alpha: Move errno definitions to
 'target_errno_defs.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210708141121.1731691-1-f4bug@amsat.org>
 <20210708141121.1731691-5-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <443add70-8ac9-053d-48bf-aef83fb40773@vivier.eu>
Date: Thu, 8 Jul 2021 17:25:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708141121.1731691-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BF1gLOz9T3g6sTHiecoaZwgtWNV8afFHtXCh1jucYWtrokYvxTy
 39diFDJv9ib/yMyNawqLkku/YoGCOtI11K92eso36p75TId23oebvQ4xW5mRIzxPKYp8+Vx
 kSs/cBLJd8DpW6j3pIaizdFfrSme2vLwGuKM5+a7Y3aOYOCmdlfmhVM514B7KHN4FrVAwIW
 n1ELitj8YDzs1LlsAt+1A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/T1n5eQZb0Y=:UXf29n+MlpzG3osXkzbcDZ
 wOo/QFACXP/fxEdBYpmD5FpVV47chP7fDEV09X8km4wb1RUjBoNJdbD+V7jJRlAMOr7pYAbnJ
 sQbUDKHALCdO696eVLOYSJYZpE7Jb6DTpWnyqaYmXrGlFF/3YFtvWiaIOOQegGLPYeoTC5cGz
 w9oi4Q0SOia+WfuCvNEp3OI37saddULFsL+xqiPFfx7WGMlL6BQpFPTl+qbjsbLxreKVweCZw
 YWhctjhirRHpTP2fud/SSE9w7qpX49No8eijKaM/+YThPKNdUHd+jU3W1ENRXqq0dlwL/FVxi
 MzI7MVix5RIu9h/G2bE5ofQYBGH1CZwkkEdHq80iZfnJVb6uW+DKXaJya0LW7YMZfdzcAXQXP
 boyDzmHRaY83F82HaQ06eneFf4yGv7B21/VUJahjqWuz5urha0bbVw6wc0nUH4DpFyEO3wQpx
 DOiDQv4hOztkTrl9Ze1Sn2+76MmvSx9/xHJazeM37DKHjmN8slKpueBhCAfz1eRblye9VCNey
 OnDy1+4+KJ4VIgkQeXsfLfOsf3TSDTVKAQEr1uycaCE9xf4eZ8GcWF+L6RFLs2N3AwpjTf5UN
 vUt0RPJ1Ux2RQWt00lYhYcQIBZIfarw17yuzxEV3AvpGm3MwP4Ia8tE/xePcwnmZqlTIopzLi
 jMU9bd9My63UcSuTm1lCXqRLvl26t6eGdWskay4YGDYtiOX8CjrFMl0V+Fnx5K0vSj/6rki5p
 Z6PYObZ8RzYtNxWC3ZG2hTbB3sh6i7xeKV8s3DfkTrc2WoHGUBYrttkByiRs4ONahpBheqs99
 7IoOQda6gpVpa8dxvfUjOtPD2B0iB9vUkZ0h7WTc/GqI4VXQoynA7NJukvcNduGsci+QUL6
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/07/2021 à 16:11, Philippe Mathieu-Daudé a écrit :
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/alpha/target_errno_defs.h | 194 +++++++++++++++++++++++++++
>  linux-user/alpha/target_syscall.h    | 194 ---------------------------
>  2 files changed, 194 insertions(+), 194 deletions(-)
> 
> diff --git a/linux-user/alpha/target_errno_defs.h b/linux-user/alpha/target_errno_defs.h
> index 54770108c02..8cc4c5fb308 100644
> --- a/linux-user/alpha/target_errno_defs.h
> +++ b/linux-user/alpha/target_errno_defs.h
> @@ -3,4 +3,198 @@
>  
>  #include "../generic/target_errno_defs.h"
>  
> +#undef TARGET_EWOULDBLOCK
> +#define TARGET_EWOULDBLOCK      TARGET_EAGAIN
> +#undef TARGET_EDEADLK
> +#define TARGET_EDEADLK          11
> +#undef TARGET_EAGAIN
> +#define TARGET_EAGAIN           35
> +#undef TARGET_EINPROGRESS
> +#define TARGET_EINPROGRESS      36
> +#undef TARGET_EALREADY
> +#define TARGET_EALREADY         37
> +#undef TARGET_ENOTSOCK
> +#define TARGET_ENOTSOCK         38
> +#undef TARGET_EDESTADDRREQ
> +#define TARGET_EDESTADDRREQ     39
> +#undef TARGET_EMSGSIZE
> +#define TARGET_EMSGSIZE         40
> +#undef TARGET_EPROTOTYPE
> +#define TARGET_EPROTOTYPE       41
> +#undef TARGET_ENOPROTOOPT
> +#define TARGET_ENOPROTOOPT      42
> +#undef TARGET_EPROTONOSUPPORT
> +#define TARGET_EPROTONOSUPPORT  43
> +#undef TARGET_ESOCKTNOSUPPORT
> +#define TARGET_ESOCKTNOSUPPORT  44
> +#undef TARGET_EOPNOTSUPP
> +#define TARGET_EOPNOTSUPP       45
> +#undef TARGET_EPFNOSUPPORT
> +#define TARGET_EPFNOSUPPORT     46
> +#undef TARGET_EAFNOSUPPORT
> +#define TARGET_EAFNOSUPPORT     47
> +#undef TARGET_EADDRINUSE
> +#define TARGET_EADDRINUSE       48
> +#undef TARGET_EADDRNOTAVAIL
> +#define TARGET_EADDRNOTAVAIL    49
> +#undef TARGET_ENETDOWN
> +#define TARGET_ENETDOWN         50
> +#undef TARGET_ENETUNREACH
> +#define TARGET_ENETUNREACH      51
> +#undef TARGET_ENETRESET
> +#define TARGET_ENETRESET        52
> +#undef TARGET_ECONNABORTED
> +#define TARGET_ECONNABORTED     53
> +#undef TARGET_ECONNRESET
> +#define TARGET_ECONNRESET       54
> +#undef TARGET_ENOBUFS
> +#define TARGET_ENOBUFS          55
> +#undef TARGET_EISCONN
> +#define TARGET_EISCONN          56
> +#undef TARGET_ENOTCONN
> +#define TARGET_ENOTCONN         57
> +#undef TARGET_ESHUTDOWN
> +#define TARGET_ESHUTDOWN        58
> +#undef TARGET_ETOOMANYREFS
> +#define TARGET_ETOOMANYREFS     59
> +#undef TARGET_ETIMEDOUT
> +#define TARGET_ETIMEDOUT        60
> +#undef TARGET_ECONNREFUSED
> +#define TARGET_ECONNREFUSED     61
> +#undef TARGET_ELOOP
> +#define TARGET_ELOOP            62
> +#undef TARGET_ENAMETOOLONG
> +#define TARGET_ENAMETOOLONG     63
> +#undef TARGET_EHOSTDOWN
> +#define TARGET_EHOSTDOWN        64
> +#undef TARGET_EHOSTUNREACH
> +#define TARGET_EHOSTUNREACH     65
> +#undef TARGET_ENOTEMPTY
> +#define TARGET_ENOTEMPTY        66
> +/* Unused                       67 */
> +#undef TARGET_EUSERS
> +#define TARGET_EUSERS           68
> +#undef TARGET_EDQUOT
> +#define TARGET_EDQUOT           69
> +#undef TARGET_ESTALE
> +#define TARGET_ESTALE           70
> +#undef TARGET_EREMOTE
> +#define TARGET_EREMOTE          71
> +/* Unused                       72-76 */
> +#undef TARGET_ENOLCK
> +#define TARGET_ENOLCK           77
> +#undef TARGET_ENOSYS
> +#define TARGET_ENOSYS           78
> +/* Unused                       79 */
> +#undef TARGET_ENOMSG
> +#define TARGET_ENOMSG           80
> +#undef TARGET_EIDRM
> +#define TARGET_EIDRM            81
> +#undef TARGET_ENOSR
> +#define TARGET_ENOSR            82
> +#undef TARGET_ETIME
> +#define TARGET_ETIME            83
> +#undef TARGET_EBADMSG
> +#define TARGET_EBADMSG          84
> +#undef TARGET_EPROTO
> +#define TARGET_EPROTO           85
> +#undef TARGET_ENODATA
> +#define TARGET_ENODATA          86
> +#undef TARGET_ENOSTR
> +#define TARGET_ENOSTR           87
> +#undef TARGET_ECHRNG
> +#define TARGET_ECHRNG           88
> +#undef TARGET_EL2NSYNC
> +#define TARGET_EL2NSYNC         89
> +#undef TARGET_EL3HLT
> +#define TARGET_EL3HLT           90
> +#undef TARGET_EL3RST
> +#define TARGET_EL3RST           91
> +#undef TARGET_ENOPKG
> +#define TARGET_ENOPKG           92
> +#undef TARGET_ELNRNG
> +#define TARGET_ELNRNG           93
> +#undef TARGET_EUNATCH
> +#define TARGET_EUNATCH          94
> +#undef TARGET_ENOCSI
> +#define TARGET_ENOCSI           95
> +#undef TARGET_EL2HLT
> +#define TARGET_EL2HLT           96
> +#undef TARGET_EBADE
> +#define TARGET_EBADE            97
> +#undef TARGET_EBADR
> +#define TARGET_EBADR            98
> +#undef TARGET_EXFULL
> +#define TARGET_EXFULL           99
> +#undef TARGET_ENOANO
> +#define TARGET_ENOANO           100
> +#undef TARGET_EBADRQC
> +#define TARGET_EBADRQC          101
> +#undef TARGET_EBADSLT
> +#define TARGET_EBADSLT          102
> +/* Unused                       103 */
> +#undef TARGET_EBFONT
> +#define TARGET_EBFONT           104
> +#undef TARGET_ENONET
> +#define TARGET_ENONET           105
> +#undef TARGET_ENOLINK
> +#define TARGET_ENOLINK          106
> +#undef TARGET_EADV
> +#define TARGET_EADV             107
> +#undef TARGET_ESRMNT
> +#define TARGET_ESRMNT           108
> +#undef TARGET_ECOMM
> +#define TARGET_ECOMM            109
> +#undef TARGET_EMULTIHOP
> +#define TARGET_EMULTIHOP        110
> +#undef TARGET_EDOTDOT
> +#define TARGET_EDOTDOT          111
> +#undef TARGET_EOVERFLOW
> +#define TARGET_EOVERFLOW        112
> +#undef TARGET_ENOTUNIQ
> +#define TARGET_ENOTUNIQ         113
> +#undef TARGET_EBADFD
> +#define TARGET_EBADFD           114
> +#undef TARGET_EREMCHG
> +#define TARGET_EREMCHG          115
> +#undef TARGET_EILSEQ
> +#define TARGET_EILSEQ           116
> +/* Same as default              117-121 */
> +#undef TARGET_ELIBACC
> +#define TARGET_ELIBACC          122
> +#undef TARGET_ELIBBAD
> +#define TARGET_ELIBBAD          123
> +#undef TARGET_ELIBSCN
> +#define TARGET_ELIBSCN          124
> +#undef TARGET_ELIBMAX
> +#define TARGET_ELIBMAX          125
> +#undef TARGET_ELIBEXEC
> +#define TARGET_ELIBEXEC         126
> +#undef TARGET_ERESTART
> +#define TARGET_ERESTART         127
> +#undef TARGET_ESTRPIPE
> +#define TARGET_ESTRPIPE         128
> +#undef TARGET_ENOMEDIUM
> +#define TARGET_ENOMEDIUM        129
> +#undef TARGET_EMEDIUMTYPE
> +#define TARGET_EMEDIUMTYPE      130
> +#undef TARGET_ECANCELED
> +#define TARGET_ECANCELED        131
> +#undef TARGET_ENOKEY
> +#define TARGET_ENOKEY           132
> +#undef TARGET_EKEYEXPIRED
> +#define TARGET_EKEYEXPIRED      133
> +#undef TARGET_EKEYREVOKED
> +#define TARGET_EKEYREVOKED      134
> +#undef TARGET_EKEYREJECTED
> +#define TARGET_EKEYREJECTED     135
> +#undef TARGET_EOWNERDEAD
> +#define TARGET_EOWNERDEAD       136
> +#undef TARGET_ENOTRECOVERABLE
> +#define TARGET_ENOTRECOVERABLE  137
> +#undef TARGET_ERFKILL
> +#define TARGET_ERFKILL          138
> +#undef TARGET_EHWPOISON
> +#define TARGET_EHWPOISON        139
> +
>  #endif
> diff --git a/linux-user/alpha/target_syscall.h b/linux-user/alpha/target_syscall.h
> index 13a71f35eaf..03091bf0a82 100644
> --- a/linux-user/alpha/target_syscall.h
> +++ b/linux-user/alpha/target_syscall.h
> @@ -44,200 +44,6 @@ struct target_pt_regs {
>  #define UNAME_MACHINE "alpha"
>  #define UNAME_MINIMUM_RELEASE "2.6.32"
>  
> -#undef TARGET_EWOULDBLOCK
> -#define TARGET_EWOULDBLOCK      TARGET_EAGAIN /* Operation would block */
> -#undef TARGET_EDEADLK
> -#define TARGET_EDEADLK          11
> -#undef TARGET_EAGAIN
> -#define TARGET_EAGAIN           35
> -#undef TARGET_EINPROGRESS
> -#define TARGET_EINPROGRESS      36
> -#undef TARGET_EALREADY
> -#define TARGET_EALREADY         37
> -#undef TARGET_ENOTSOCK
> -#define TARGET_ENOTSOCK         38
> -#undef TARGET_EDESTADDRREQ
> -#define TARGET_EDESTADDRREQ     39
> -#undef TARGET_EMSGSIZE
> -#define TARGET_EMSGSIZE         40
> -#undef TARGET_EPROTOTYPE
> -#define TARGET_EPROTOTYPE       41
> -#undef TARGET_ENOPROTOOPT
> -#define TARGET_ENOPROTOOPT      42
> -#undef TARGET_EPROTONOSUPPORT
> -#define TARGET_EPROTONOSUPPORT  43
> -#undef TARGET_ESOCKTNOSUPPORT
> -#define TARGET_ESOCKTNOSUPPORT  44
> -#undef TARGET_EOPNOTSUPP
> -#define TARGET_EOPNOTSUPP       45
> -#undef TARGET_EPFNOSUPPORT
> -#define TARGET_EPFNOSUPPORT     46
> -#undef TARGET_EAFNOSUPPORT
> -#define TARGET_EAFNOSUPPORT     47
> -#undef TARGET_EADDRINUSE
> -#define TARGET_EADDRINUSE       48
> -#undef TARGET_EADDRNOTAVAIL
> -#define TARGET_EADDRNOTAVAIL    49
> -#undef TARGET_ENETDOWN
> -#define TARGET_ENETDOWN         50
> -#undef TARGET_ENETUNREACH
> -#define TARGET_ENETUNREACH      51
> -#undef TARGET_ENETRESET
> -#define TARGET_ENETRESET        52
> -#undef TARGET_ECONNABORTED
> -#define TARGET_ECONNABORTED     53
> -#undef TARGET_ECONNRESET
> -#define TARGET_ECONNRESET       54
> -#undef TARGET_ENOBUFS
> -#define TARGET_ENOBUFS          55
> -#undef TARGET_EISCONN
> -#define TARGET_EISCONN          56
> -#undef TARGET_ENOTCONN
> -#define TARGET_ENOTCONN         57
> -#undef TARGET_ESHUTDOWN
> -#define TARGET_ESHUTDOWN        58
> -#undef TARGET_ETOOMANYREFS
> -#define TARGET_ETOOMANYREFS     59
> -#undef TARGET_ETIMEDOUT
> -#define TARGET_ETIMEDOUT        60
> -#undef TARGET_ECONNREFUSED
> -#define TARGET_ECONNREFUSED     61
> -#undef TARGET_ELOOP
> -#define TARGET_ELOOP            62
> -#undef TARGET_ENAMETOOLONG
> -#define TARGET_ENAMETOOLONG     63
> -#undef TARGET_EHOSTDOWN
> -#define TARGET_EHOSTDOWN        64
> -#undef TARGET_EHOSTUNREACH
> -#define TARGET_EHOSTUNREACH     65
> -#undef TARGET_ENOTEMPTY
> -#define TARGET_ENOTEMPTY        66
> -/* Unused                       67 */
> -#undef TARGET_EUSERS
> -#define TARGET_EUSERS           68
> -#undef TARGET_EDQUOT
> -#define TARGET_EDQUOT           69
> -#undef TARGET_ESTALE
> -#define TARGET_ESTALE           70
> -#undef TARGET_EREMOTE
> -#define TARGET_EREMOTE          71
> -/* Unused                       72-76 */
> -#undef TARGET_ENOLCK
> -#define TARGET_ENOLCK           77
> -#undef TARGET_ENOSYS
> -#define TARGET_ENOSYS           78
> -/* Unused                       79 */
> -#undef TARGET_ENOMSG
> -#define TARGET_ENOMSG           80
> -#undef TARGET_EIDRM
> -#define TARGET_EIDRM            81
> -#undef TARGET_ENOSR
> -#define TARGET_ENOSR            82
> -#undef TARGET_ETIME
> -#define TARGET_ETIME            83
> -#undef TARGET_EBADMSG
> -#define TARGET_EBADMSG          84
> -#undef TARGET_EPROTO
> -#define TARGET_EPROTO           85
> -#undef TARGET_ENODATA
> -#define TARGET_ENODATA          86
> -#undef TARGET_ENOSTR
> -#define TARGET_ENOSTR           87
> -#undef TARGET_ECHRNG
> -#define TARGET_ECHRNG           88
> -#undef TARGET_EL2NSYNC
> -#define TARGET_EL2NSYNC         89
> -#undef TARGET_EL3HLT
> -#define TARGET_EL3HLT           90
> -#undef TARGET_EL3RST
> -#define TARGET_EL3RST           91
> -#undef TARGET_ENOPKG
> -#define TARGET_ENOPKG           92
> -#undef TARGET_ELNRNG
> -#define TARGET_ELNRNG           93
> -#undef TARGET_EUNATCH
> -#define TARGET_EUNATCH          94
> -#undef TARGET_ENOCSI
> -#define TARGET_ENOCSI           95
> -#undef TARGET_EL2HLT
> -#define TARGET_EL2HLT           96
> -#undef TARGET_EBADE
> -#define TARGET_EBADE            97
> -#undef TARGET_EBADR
> -#define TARGET_EBADR            98
> -#undef TARGET_EXFULL
> -#define TARGET_EXFULL           99
> -#undef TARGET_ENOANO
> -#define TARGET_ENOANO           100
> -#undef TARGET_EBADRQC
> -#define TARGET_EBADRQC          101
> -#undef TARGET_EBADSLT
> -#define TARGET_EBADSLT          102
> -/* Unused                       103 */
> -#undef TARGET_EBFONT
> -#define TARGET_EBFONT           104
> -#undef TARGET_ENONET
> -#define TARGET_ENONET           105
> -#undef TARGET_ENOLINK
> -#define TARGET_ENOLINK          106
> -#undef TARGET_EADV
> -#define TARGET_EADV             107
> -#undef TARGET_ESRMNT
> -#define TARGET_ESRMNT           108
> -#undef TARGET_ECOMM
> -#define TARGET_ECOMM            109
> -#undef TARGET_EMULTIHOP
> -#define TARGET_EMULTIHOP        110
> -#undef TARGET_EDOTDOT
> -#define TARGET_EDOTDOT          111
> -#undef TARGET_EOVERFLOW
> -#define TARGET_EOVERFLOW        112
> -#undef TARGET_ENOTUNIQ
> -#define TARGET_ENOTUNIQ         113
> -#undef TARGET_EBADFD
> -#define TARGET_EBADFD           114
> -#undef TARGET_EREMCHG
> -#define TARGET_EREMCHG          115
> -#undef TARGET_EILSEQ
> -#define TARGET_EILSEQ           116
> -/* Same as default              117-121 */
> -#undef TARGET_ELIBACC
> -#define TARGET_ELIBACC          122
> -#undef TARGET_ELIBBAD
> -#define TARGET_ELIBBAD          123
> -#undef TARGET_ELIBSCN
> -#define TARGET_ELIBSCN          124
> -#undef TARGET_ELIBMAX
> -#define TARGET_ELIBMAX          125
> -#undef TARGET_ELIBEXEC
> -#define TARGET_ELIBEXEC         126
> -#undef TARGET_ERESTART
> -#define TARGET_ERESTART         127
> -#undef TARGET_ESTRPIPE
> -#define TARGET_ESTRPIPE         128
> -#undef TARGET_ENOMEDIUM
> -#define TARGET_ENOMEDIUM        129
> -#undef TARGET_EMEDIUMTYPE
> -#define TARGET_EMEDIUMTYPE      130
> -#undef TARGET_ECANCELED
> -#define TARGET_ECANCELED        131
> -#undef TARGET_ENOKEY
> -#define TARGET_ENOKEY           132
> -#undef TARGET_EKEYEXPIRED
> -#define TARGET_EKEYEXPIRED      133
> -#undef TARGET_EKEYREVOKED
> -#define TARGET_EKEYREVOKED      134
> -#undef TARGET_EKEYREJECTED
> -#define TARGET_EKEYREJECTED     135
> -#undef TARGET_EOWNERDEAD
> -#define TARGET_EOWNERDEAD       136
> -#undef TARGET_ENOTRECOVERABLE
> -#define TARGET_ENOTRECOVERABLE  137
> -#undef TARGET_ERFKILL
> -#define TARGET_ERFKILL          138
> -#undef TARGET_EHWPOISON
> -#define TARGET_EHWPOISON        139
> -
>  // For sys_osf_getsysinfo
>  #define TARGET_GSI_UACPROC		8
>  #define TARGET_GSI_IEEE_FP_CONTROL	45
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

