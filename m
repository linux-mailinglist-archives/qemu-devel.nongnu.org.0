Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBEA3BF05C
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 21:37:29 +0200 (CEST)
Received: from localhost ([::1]:43404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1DMO-0001kB-SX
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 15:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1DIG-0001UP-Gj
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:33:12 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:44035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1DIE-0007eA-C8
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:33:12 -0400
Received: from [192.168.100.1] ([82.142.13.34]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MqJVd-1lNX1H1rvP-00nTce; Wed, 07 Jul 2021 21:32:40 +0200
Subject: Re: [PATCH 06/12] linux-user/alpha: Remove hardcoded tabs (code style)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210704183755.655002-1-f4bug@amsat.org>
 <20210704183755.655002-7-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <d35465b9-1d57-69fb-8969-af6c33c586e8@vivier.eu>
Date: Wed, 7 Jul 2021 21:32:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210704183755.655002-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:FmgIil2iLLOCdPy1M+HhtgIsNb6WV161LS3goPzPGQg7bk4RSNl
 5vslMEEGh6lD/VnvoBkiFc9bTxmWHnN5zs+PlrVSWI6JriEq98ZvnFOKQnX/m5hKptRwhYp
 hNeY9jIlAIg7GEyn4zzJYSLKHWIwVHEeD1DZwNv+nwqfDwhk+2aqd5c8czFirUNG0VMfGAw
 FIMMsp5T4f+ZbrnDBcZTQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bHJjqBuU8nk=:28uJXLchtaAdh+6buNluqX
 wS9S5P+DPkdTHkUrnFsPjNEv1STRPlV/Q0cinAjs5D+cCx2yoLn1apWrhWRAnwiKh9XsFoWza
 WiXOoZko62wzrTDQpJdBegSoKWTgmwWyoobMNzs1bHoizGNzM7xGah6ZkBD6r0Uhi+D/bESey
 D75wvXJ8lDqB7WblWIxumxLeET0065zCgy6Fb7tq8JYbROGxy7e0sqDtuNcHlwGnWKrKkkgqe
 wv49RtoXWeDcEMx9if+upUtkISGhdykBy0EED8QYm7N9ElQ0j9XAvbPzP7veQOHb3LxhMXgjV
 iGQlnzjwSuIOWmmxp2NzL3lt3Q595NDXF7cqlLUELEkah+oMMky0ngkpRY9aLOHSbMd5NUkG5
 s5AxUboHy9gbACmbveYUmvpYtXlDmSFiqsi/c7viYUDY4XPO6CxwKxJhAS0mkiVOjGJPSKZp5
 3YlPMYA+gORKeSwL+ugh8TQ2wCHptWNAG8v9fiz7BsvqlHQA+v7JhFaeB6acJ6omSXYMCFN3s
 DdLV4wcYom92BoZurRFw/HnuYFM9zMO43jvvuWhOx8ogZM85r3X0glumQTkI8KtYGvKjjQMLp
 plAOJBabUrfZa2df8vTTHHC6F/9stqFjIVL1JCEbZ+rPNPkzc18i0osBXGmsr4Yyaxbw5vro2
 mzFD6b19hRfJmv6wGEx2kZKMuZsOE67uRoWnc2P4vxdW0KjUDuX2tpahXY9bKhY3vfKR2lo9y
 uC2e29kUVYx5k08IYUy++raPamaOjXUCZ0SGkFFg8PPE7AspT+cKCxZUxVlewldJHzK4INISg
 iQIeImm1ItHpVO7ZLpEOZz8ZGHiKG+456WcQvvtG4HHat1tAUnIVJ6ygMp9e3EFkJURp31q
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
>  linux-user/alpha/target_syscall.h | 196 +++++++++++++++---------------
>  1 file changed, 97 insertions(+), 99 deletions(-)
> 
> diff --git a/linux-user/alpha/target_syscall.h b/linux-user/alpha/target_syscall.h
> index 4e6f9360566..13a71f35eaf 100644
> --- a/linux-user/alpha/target_syscall.h
> +++ b/linux-user/alpha/target_syscall.h
> @@ -47,196 +47,194 @@ struct target_pt_regs {
>  #undef TARGET_EWOULDBLOCK
>  #define TARGET_EWOULDBLOCK      TARGET_EAGAIN /* Operation would block */
>  #undef TARGET_EDEADLK
> -#define TARGET_EDEADLK		11
> +#define TARGET_EDEADLK          11
>  #undef TARGET_EAGAIN
> -#define TARGET_EAGAIN		35
> +#define TARGET_EAGAIN           35
>  #undef TARGET_EINPROGRESS
> -#define TARGET_EINPROGRESS	36
> +#define TARGET_EINPROGRESS      36
>  #undef TARGET_EALREADY
> -#define TARGET_EALREADY		37
> +#define TARGET_EALREADY         37
>  #undef TARGET_ENOTSOCK
> -#define TARGET_ENOTSOCK		38
> +#define TARGET_ENOTSOCK         38
>  #undef TARGET_EDESTADDRREQ
> -#define TARGET_EDESTADDRREQ	39
> +#define TARGET_EDESTADDRREQ     39
>  #undef TARGET_EMSGSIZE
> -#define TARGET_EMSGSIZE		40
> +#define TARGET_EMSGSIZE         40
>  #undef TARGET_EPROTOTYPE
> -#define TARGET_EPROTOTYPE	41
> +#define TARGET_EPROTOTYPE       41
>  #undef TARGET_ENOPROTOOPT
> -#define TARGET_ENOPROTOOPT	42
> +#define TARGET_ENOPROTOOPT      42
>  #undef TARGET_EPROTONOSUPPORT
> -#define TARGET_EPROTONOSUPPORT	43
> +#define TARGET_EPROTONOSUPPORT  43
>  #undef TARGET_ESOCKTNOSUPPORT
> -#define TARGET_ESOCKTNOSUPPORT	44
> +#define TARGET_ESOCKTNOSUPPORT  44
>  #undef TARGET_EOPNOTSUPP
> -#define TARGET_EOPNOTSUPP	45
> +#define TARGET_EOPNOTSUPP       45
>  #undef TARGET_EPFNOSUPPORT
> -#define TARGET_EPFNOSUPPORT	46
> +#define TARGET_EPFNOSUPPORT     46
>  #undef TARGET_EAFNOSUPPORT
> -#define TARGET_EAFNOSUPPORT	47
> +#define TARGET_EAFNOSUPPORT     47
>  #undef TARGET_EADDRINUSE
> -#define TARGET_EADDRINUSE	48
> +#define TARGET_EADDRINUSE       48
>  #undef TARGET_EADDRNOTAVAIL
> -#define TARGET_EADDRNOTAVAIL	49
> +#define TARGET_EADDRNOTAVAIL    49
>  #undef TARGET_ENETDOWN
> -#define TARGET_ENETDOWN		50
> +#define TARGET_ENETDOWN         50
>  #undef TARGET_ENETUNREACH
> -#define TARGET_ENETUNREACH	51
> +#define TARGET_ENETUNREACH      51
>  #undef TARGET_ENETRESET
> -#define TARGET_ENETRESET	52
> +#define TARGET_ENETRESET        52
>  #undef TARGET_ECONNABORTED
> -#define TARGET_ECONNABORTED	53
> +#define TARGET_ECONNABORTED     53
>  #undef TARGET_ECONNRESET
> -#define TARGET_ECONNRESET	54
> +#define TARGET_ECONNRESET       54
>  #undef TARGET_ENOBUFS
> -#define TARGET_ENOBUFS		55
> +#define TARGET_ENOBUFS          55
>  #undef TARGET_EISCONN
> -#define TARGET_EISCONN		56
> +#define TARGET_EISCONN          56
>  #undef TARGET_ENOTCONN
> -#define TARGET_ENOTCONN		57
> +#define TARGET_ENOTCONN         57
>  #undef TARGET_ESHUTDOWN
> -#define TARGET_ESHUTDOWN	58
> +#define TARGET_ESHUTDOWN        58
>  #undef TARGET_ETOOMANYREFS
> -#define TARGET_ETOOMANYREFS	59
> +#define TARGET_ETOOMANYREFS     59
>  #undef TARGET_ETIMEDOUT
> -#define TARGET_ETIMEDOUT	60
> +#define TARGET_ETIMEDOUT        60
>  #undef TARGET_ECONNREFUSED
> -#define TARGET_ECONNREFUSED	61
> +#define TARGET_ECONNREFUSED     61
>  #undef TARGET_ELOOP
> -#define TARGET_ELOOP		62
> +#define TARGET_ELOOP            62
>  #undef TARGET_ENAMETOOLONG
> -#define TARGET_ENAMETOOLONG	63
> +#define TARGET_ENAMETOOLONG     63
>  #undef TARGET_EHOSTDOWN
> -#define TARGET_EHOSTDOWN	64
> +#define TARGET_EHOSTDOWN        64
>  #undef TARGET_EHOSTUNREACH
> -#define TARGET_EHOSTUNREACH	65
> +#define TARGET_EHOSTUNREACH     65
>  #undef TARGET_ENOTEMPTY
> -#define TARGET_ENOTEMPTY	66
> -// Unused			67
> +#define TARGET_ENOTEMPTY        66
> +/* Unused                       67 */
>  #undef TARGET_EUSERS
> -#define TARGET_EUSERS		68
> +#define TARGET_EUSERS           68
>  #undef TARGET_EDQUOT
> -#define TARGET_EDQUOT		69
> +#define TARGET_EDQUOT           69
>  #undef TARGET_ESTALE
> -#define TARGET_ESTALE		70
> +#define TARGET_ESTALE           70
>  #undef TARGET_EREMOTE
> -#define TARGET_EREMOTE		71
> -// Unused			72-76
> +#define TARGET_EREMOTE          71
> +/* Unused                       72-76 */
>  #undef TARGET_ENOLCK
> -#define TARGET_ENOLCK		77
> +#define TARGET_ENOLCK           77
>  #undef TARGET_ENOSYS
> -#define TARGET_ENOSYS		78
> -// Unused			79
> +#define TARGET_ENOSYS           78
> +/* Unused                       79 */
>  #undef TARGET_ENOMSG
> -#define TARGET_ENOMSG		80
> +#define TARGET_ENOMSG           80
>  #undef TARGET_EIDRM
> -#define TARGET_EIDRM		81
> +#define TARGET_EIDRM            81
>  #undef TARGET_ENOSR
> -#define TARGET_ENOSR		82
> +#define TARGET_ENOSR            82
>  #undef TARGET_ETIME
> -#define TARGET_ETIME		83
> +#define TARGET_ETIME            83
>  #undef TARGET_EBADMSG
> -#define TARGET_EBADMSG		84
> +#define TARGET_EBADMSG          84
>  #undef TARGET_EPROTO
> -#define TARGET_EPROTO		85
> +#define TARGET_EPROTO           85
>  #undef TARGET_ENODATA
> -#define TARGET_ENODATA		86
> +#define TARGET_ENODATA          86
>  #undef TARGET_ENOSTR
> -#define TARGET_ENOSTR		87
> +#define TARGET_ENOSTR           87
>  #undef TARGET_ECHRNG
> -#define TARGET_ECHRNG		88
> +#define TARGET_ECHRNG           88
>  #undef TARGET_EL2NSYNC
> -#define TARGET_EL2NSYNC		89
> +#define TARGET_EL2NSYNC         89
>  #undef TARGET_EL3HLT
> -#define TARGET_EL3HLT		90
> +#define TARGET_EL3HLT           90
>  #undef TARGET_EL3RST
> -#define TARGET_EL3RST		91
> +#define TARGET_EL3RST           91
>  #undef TARGET_ENOPKG
> -#define TARGET_ENOPKG		92
> +#define TARGET_ENOPKG           92
>  #undef TARGET_ELNRNG
> -#define TARGET_ELNRNG		93
> +#define TARGET_ELNRNG           93
>  #undef TARGET_EUNATCH
> -#define TARGET_EUNATCH		94
> +#define TARGET_EUNATCH          94
>  #undef TARGET_ENOCSI
> -#define TARGET_ENOCSI		95
> +#define TARGET_ENOCSI           95
>  #undef TARGET_EL2HLT
> -#define TARGET_EL2HLT		96
> +#define TARGET_EL2HLT           96
>  #undef TARGET_EBADE
> -#define TARGET_EBADE		97
> +#define TARGET_EBADE            97
>  #undef TARGET_EBADR
> -#define TARGET_EBADR		98
> +#define TARGET_EBADR            98
>  #undef TARGET_EXFULL
> -#define TARGET_EXFULL		99
> +#define TARGET_EXFULL           99
>  #undef TARGET_ENOANO
> -#define TARGET_ENOANO		100
> +#define TARGET_ENOANO           100
>  #undef TARGET_EBADRQC
> -#define TARGET_EBADRQC		101
> +#define TARGET_EBADRQC          101
>  #undef TARGET_EBADSLT
> -#define TARGET_EBADSLT		102
> -// Unused			103
> +#define TARGET_EBADSLT          102
> +/* Unused                       103 */
>  #undef TARGET_EBFONT
> -#define TARGET_EBFONT		104
> +#define TARGET_EBFONT           104
>  #undef TARGET_ENONET
> -#define TARGET_ENONET		105
> +#define TARGET_ENONET           105
>  #undef TARGET_ENOLINK
> -#define TARGET_ENOLINK		106
> +#define TARGET_ENOLINK          106
>  #undef TARGET_EADV
> -#define TARGET_EADV		107
> +#define TARGET_EADV             107
>  #undef TARGET_ESRMNT
> -#define TARGET_ESRMNT		108
> +#define TARGET_ESRMNT           108
>  #undef TARGET_ECOMM
> -#define TARGET_ECOMM		109
> +#define TARGET_ECOMM            109
>  #undef TARGET_EMULTIHOP
> -#define TARGET_EMULTIHOP	110
> +#define TARGET_EMULTIHOP        110
>  #undef TARGET_EDOTDOT
> -#define TARGET_EDOTDOT		111
> +#define TARGET_EDOTDOT          111
>  #undef TARGET_EOVERFLOW
> -#define TARGET_EOVERFLOW	112
> +#define TARGET_EOVERFLOW        112
>  #undef TARGET_ENOTUNIQ
> -#define TARGET_ENOTUNIQ		113
> +#define TARGET_ENOTUNIQ         113
>  #undef TARGET_EBADFD
> -#define TARGET_EBADFD		114
> +#define TARGET_EBADFD           114
>  #undef TARGET_EREMCHG
> -#define TARGET_EREMCHG		115
> +#define TARGET_EREMCHG          115
>  #undef TARGET_EILSEQ
> -#define TARGET_EILSEQ		116
> -
> -// Same as default		117-121
> -
> +#define TARGET_EILSEQ           116
> +/* Same as default              117-121 */
>  #undef TARGET_ELIBACC
> -#define TARGET_ELIBACC		122
> +#define TARGET_ELIBACC          122
>  #undef TARGET_ELIBBAD
> -#define TARGET_ELIBBAD		123
> +#define TARGET_ELIBBAD          123
>  #undef TARGET_ELIBSCN
> -#define TARGET_ELIBSCN		124
> +#define TARGET_ELIBSCN          124
>  #undef TARGET_ELIBMAX
> -#define TARGET_ELIBMAX		125
> +#define TARGET_ELIBMAX          125
>  #undef TARGET_ELIBEXEC
> -#define TARGET_ELIBEXEC		126
> +#define TARGET_ELIBEXEC         126
>  #undef TARGET_ERESTART
> -#define TARGET_ERESTART		127
> +#define TARGET_ERESTART         127
>  #undef TARGET_ESTRPIPE
> -#define TARGET_ESTRPIPE		128
> +#define TARGET_ESTRPIPE         128
>  #undef TARGET_ENOMEDIUM
> -#define TARGET_ENOMEDIUM	129
> +#define TARGET_ENOMEDIUM        129
>  #undef TARGET_EMEDIUMTYPE
> -#define TARGET_EMEDIUMTYPE	130
> +#define TARGET_EMEDIUMTYPE      130
>  #undef TARGET_ECANCELED
> -#define TARGET_ECANCELED	131
> +#define TARGET_ECANCELED        131
>  #undef TARGET_ENOKEY
> -#define TARGET_ENOKEY		132
> +#define TARGET_ENOKEY           132
>  #undef TARGET_EKEYEXPIRED
> -#define TARGET_EKEYEXPIRED	133
> +#define TARGET_EKEYEXPIRED      133
>  #undef TARGET_EKEYREVOKED
> -#define TARGET_EKEYREVOKED	134
> +#define TARGET_EKEYREVOKED      134
>  #undef TARGET_EKEYREJECTED
> -#define TARGET_EKEYREJECTED	135
> +#define TARGET_EKEYREJECTED     135
>  #undef TARGET_EOWNERDEAD
> -#define TARGET_EOWNERDEAD	136
> +#define TARGET_EOWNERDEAD       136
>  #undef TARGET_ENOTRECOVERABLE
> -#define TARGET_ENOTRECOVERABLE	137
> +#define TARGET_ENOTRECOVERABLE  137
>  #undef TARGET_ERFKILL
> -#define TARGET_ERFKILL		138
> +#define TARGET_ERFKILL          138
>  #undef TARGET_EHWPOISON
>  #define TARGET_EHWPOISON        139
>  
> 

Applied to my linux-user-for-6.1 branch.

Thanks,
Laurent



