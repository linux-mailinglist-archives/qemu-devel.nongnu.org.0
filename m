Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 822C73C16DA
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:06:51 +0200 (CEST)
Received: from localhost ([::1]:58644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WY6-0008O6-In
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:06:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1Vu4-00025h-6X
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:25:28 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:44293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1Vu1-0001u5-U9
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:25:27 -0400
Received: from [192.168.100.1] ([82.142.13.34]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MFK8H-1lz33v398z-00FjeL; Thu, 08 Jul 2021 17:25:19 +0200
Subject: Re: [PATCH v2 5/8] linux-user/hppa: Move errno definitions to
 'target_errno_defs.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210708141121.1731691-1-f4bug@amsat.org>
 <20210708141121.1731691-6-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <5b7ad434-f96d-957b-ff25-f2f913a9bbe6@vivier.eu>
Date: Thu, 8 Jul 2021 17:25:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708141121.1731691-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:FS/nwW86dL7pLiyvCj935O8ag7WT4c09iqFR9b2eqhi5GYmL8Qs
 e3Ddd97YjJP7upaPxvH8BbrppW8DEJUqjFshQ7CLarVFL91e4pYi+oDThrV6h54O2ECLT6/
 Q/kqa3dIR+ujt0LyheQAV9IoS/0wiNqw+LHY1H0MoMwyY5/PbaWQ+k0wOJmp0iVea/sAP07
 XcGitgLRh6WaPLeET84ww==
X-UI-Out-Filterresults: notjunk:1;V03:K0:40PGvLArrdc=:ZBTURBszR7S7PUH6HF1hKp
 aoiKn3aPZyzZta3eXsijpT4GqVpeDTOH9bAj5vKMolOXtd8LCsoiuOtGBmc6BnA89jQTnxp+3
 D+Xuw3Shb1TgP6Vf0eE7E/W3ClXcCSI0ZsfgWaRuKXRoiP7nxYLcVD1eCb99ahko6OxLeEz1e
 +NSThwL54RxBbM7JC+SvDW605EaApHRxUpEYsmPWoOx61xWJTZUQDRIjAP43B5T+Aqpr+44e2
 x7p1CfQ0+zkOzl/qrKDnfbljdqMAnZHdWoIlwklJJkNl5GkpVq8ysVnXd7JGvb8QCdEXfZSFM
 fRKpcwEeWuaYeY6fXFWw0FoXIu8a5188SfScpnhRC0knmL0HP+FzZxYFv60uxI22d2nWfzHoe
 c6vYPXDAuKzq1RKzbQv+YTGqNxTJVRq+DvoiZ0JhQ2jeIdBSptgpYp9FSSu0rwXlRYBvbbnmX
 hRE54oaEh4nhQuP5c766zvFxSlhPS4muw5K6TRVfzo2Cg8fb03aVh6FXp5KvPwx5ODRa/t8Ip
 o3QE9x/90Dxg1m4mXF8HAkdINK9mmpriAO9SbdtGBxg/YC4dDmczoOtmlz8bKiuTVvOKwgTaM
 49jbpZmgPtgcqWaGYhaGSaKwkf1Jhp6kPFncYCl4N/rE5q97K8qB8yqrVPKT962CEUFnk6Ato
 hdPPIC3DifWKpOymfIoBnF38XWP+AwCpUR7pKOOORcwFBmDbOzjrgEY9UVh50fEVFkZaIb/4G
 boUaC8mwOFWXcsHGo5qMdqjahdqbul7ud5PlSP778n+E4lXac94YHzK2YtfUUFftKesRT+JAq
 Sa8BckHwq9lifNie5EqNUt+i9XjOv1LRyvnsS1yLQc6jEybJKYrkVDHYIos7b9vvVwg/yUN
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/07/2021 à 16:11, Philippe Mathieu-Daudé a écrit :
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/hppa/target_errno_defs.h | 210 ++++++++++++++++++++++++++++
>  linux-user/hppa/target_syscall.h    | 210 ----------------------------
>  2 files changed, 210 insertions(+), 210 deletions(-)
> 
> diff --git a/linux-user/hppa/target_errno_defs.h b/linux-user/hppa/target_errno_defs.h
> index d6e9676ce25..17ece226c8d 100644
> --- a/linux-user/hppa/target_errno_defs.h
> +++ b/linux-user/hppa/target_errno_defs.h
> @@ -3,4 +3,214 @@
>  
>  #include "../generic/target_errno_defs.h"
>  
> +#undef TARGET_EWOULDBLOCK
> +#define TARGET_EWOULDBLOCK     TARGET_EAGAIN /* Operation would block */
> +#undef  TARGET_ENOMSG
> +#define TARGET_ENOMSG          35
> +#undef  TARGET_EIDRM
> +#define TARGET_EIDRM           36
> +#undef  TARGET_ECHRNG
> +#define TARGET_ECHRNG          37
> +#undef  TARGET_EL2NSYNC
> +#define TARGET_EL2NSYNC        38
> +#undef  TARGET_EL3HLT
> +#define TARGET_EL3HLT          39
> +#undef  TARGET_EL3RST
> +#define TARGET_EL3RST          40
> +#undef  TARGET_ELNRNG
> +#define TARGET_ELNRNG          41
> +#undef  TARGET_EUNATCH
> +#define TARGET_EUNATCH         42
> +#undef  TARGET_ENOCSI
> +#define TARGET_ENOCSI          43
> +#undef  TARGET_EL2HLT
> +#define TARGET_EL2HLT          44
> +#undef  TARGET_EDEADLK
> +#define TARGET_EDEADLK         45
> +#undef  TARGET_ENOLCK
> +#define TARGET_ENOLCK          46
> +#undef  TARGET_EILSEQ
> +#define TARGET_EILSEQ          47
> +
> +#undef  TARGET_ENONET
> +#define TARGET_ENONET          50
> +#undef  TARGET_ENODATA
> +#define TARGET_ENODATA         51
> +#undef  TARGET_ETIME
> +#define TARGET_ETIME           52
> +#undef  TARGET_ENOSR
> +#define TARGET_ENOSR           53
> +#undef  TARGET_ENOSTR
> +#define TARGET_ENOSTR          54
> +#undef  TARGET_ENOPKG
> +#define TARGET_ENOPKG          55
> +
> +#undef  TARGET_ENOLINK
> +#define TARGET_ENOLINK         57
> +#undef  TARGET_EADV
> +#define TARGET_EADV            58
> +#undef  TARGET_ESRMNT
> +#define TARGET_ESRMNT          59
> +#undef  TARGET_ECOMM
> +#define TARGET_ECOMM           60
> +#undef  TARGET_EPROTO
> +#define TARGET_EPROTO          61
> +
> +#undef  TARGET_EMULTIHOP
> +#define TARGET_EMULTIHOP       64
> +
> +#undef  TARGET_EDOTDOT
> +#define TARGET_EDOTDOT         66
> +#undef  TARGET_EBADMSG
> +#define TARGET_EBADMSG         67
> +#undef  TARGET_EUSERS
> +#define TARGET_EUSERS          68
> +#undef  TARGET_EDQUOT
> +#define TARGET_EDQUOT          69
> +#undef  TARGET_ESTALE
> +#define TARGET_ESTALE          70
> +#undef  TARGET_EREMOTE
> +#define TARGET_EREMOTE         71
> +#undef  TARGET_EOVERFLOW
> +#define TARGET_EOVERFLOW       72
> +
> +#undef  TARGET_EBADE
> +#define TARGET_EBADE           160
> +#undef  TARGET_EBADR
> +#define TARGET_EBADR           161
> +#undef  TARGET_EXFULL
> +#define TARGET_EXFULL          162
> +#undef  TARGET_ENOANO
> +#define TARGET_ENOANO          163
> +#undef  TARGET_EBADRQC
> +#define TARGET_EBADRQC         164
> +#undef  TARGET_EBADSLT
> +#define TARGET_EBADSLT         165
> +#undef  TARGET_EBFONT
> +#define TARGET_EBFONT          166
> +#undef  TARGET_ENOTUNIQ
> +#define TARGET_ENOTUNIQ        167
> +#undef  TARGET_EBADFD
> +#define TARGET_EBADFD          168
> +#undef  TARGET_EREMCHG
> +#define TARGET_EREMCHG         169
> +#undef  TARGET_ELIBACC
> +#define TARGET_ELIBACC         170
> +#undef  TARGET_ELIBBAD
> +#define TARGET_ELIBBAD         171
> +#undef  TARGET_ELIBSCN
> +#define TARGET_ELIBSCN         172
> +#undef  TARGET_ELIBMAX
> +#define TARGET_ELIBMAX         173
> +#undef  TARGET_ELIBEXEC
> +#define TARGET_ELIBEXEC        174
> +#undef  TARGET_ERESTART
> +#define TARGET_ERESTART        175
> +#undef  TARGET_ESTRPIPE
> +#define TARGET_ESTRPIPE        176
> +#undef  TARGET_EUCLEAN
> +#define TARGET_EUCLEAN         177
> +#undef  TARGET_ENOTNAM
> +#define TARGET_ENOTNAM         178
> +#undef  TARGET_ENAVAIL
> +#define TARGET_ENAVAIL         179
> +#undef  TARGET_EISNAM
> +#define TARGET_EISNAM          180
> +#undef  TARGET_EREMOTEIO
> +#define TARGET_EREMOTEIO       181
> +#undef  TARGET_ENOMEDIUM
> +#define TARGET_ENOMEDIUM       182
> +#undef  TARGET_EMEDIUMTYPE
> +#define TARGET_EMEDIUMTYPE     183
> +#undef  TARGET_ENOKEY
> +#define TARGET_ENOKEY          184
> +#undef  TARGET_EKEYEXPIRED
> +#define TARGET_EKEYEXPIRED     185
> +#undef  TARGET_EKEYREVOKED
> +#define TARGET_EKEYREVOKED     186
> +#undef  TARGET_EKEYREJECTED
> +#define TARGET_EKEYREJECTED    187
> +
> +/* Never used in linux.  */
> +/* #define TARGET_ENOSYM          215 */
> +#undef  TARGET_ENOTSOCK
> +#define TARGET_ENOTSOCK        216
> +#undef  TARGET_EDESTADDRREQ
> +#define TARGET_EDESTADDRREQ    217
> +#undef  TARGET_EMSGSIZE
> +#define TARGET_EMSGSIZE        218
> +#undef  TARGET_EPROTOTYPE
> +#define TARGET_EPROTOTYPE      219
> +#undef  TARGET_ENOPROTOOPT
> +#define TARGET_ENOPROTOOPT     220
> +#undef  TARGET_EPROTONOSUPPORT
> +#define TARGET_EPROTONOSUPPORT 221
> +#undef  TARGET_ESOCKTNOSUPPORT
> +#define TARGET_ESOCKTNOSUPPORT 222
> +#undef  TARGET_EOPNOTSUPP
> +#define TARGET_EOPNOTSUPP      223
> +#undef  TARGET_EPFNOSUPPORT
> +#define TARGET_EPFNOSUPPORT    224
> +#undef  TARGET_EAFNOSUPPORT
> +#define TARGET_EAFNOSUPPORT    225
> +#undef  TARGET_EADDRINUSE
> +#define TARGET_EADDRINUSE      226
> +#undef  TARGET_EADDRNOTAVAIL
> +#define TARGET_EADDRNOTAVAIL   227
> +#undef  TARGET_ENETDOWN
> +#define TARGET_ENETDOWN        228
> +#undef  TARGET_ENETUNREACH
> +#define TARGET_ENETUNREACH     229
> +#undef  TARGET_ENETRESET
> +#define TARGET_ENETRESET       230
> +#undef  TARGET_ECONNABORTED
> +#define TARGET_ECONNABORTED    231
> +#undef  TARGET_ECONNRESET
> +#define TARGET_ECONNRESET      232
> +#undef  TARGET_ENOBUFS
> +#define TARGET_ENOBUFS         233
> +#undef  TARGET_EISCONN
> +#define TARGET_EISCONN         234
> +#undef  TARGET_ENOTCONN
> +#define TARGET_ENOTCONN        235
> +#undef  TARGET_ESHUTDOWN
> +#define TARGET_ESHUTDOWN       236
> +#undef  TARGET_ETOOMANYREFS
> +#define TARGET_ETOOMANYREFS    237
> +#undef  TARGET_ETIMEDOUT
> +#define TARGET_ETIMEDOUT       238
> +#undef  TARGET_ECONNREFUSED
> +#define TARGET_ECONNREFUSED    239
> +#define TARGET_EREMOTERELEASE  240
> +#undef  TARGET_EHOSTDOWN
> +#define TARGET_EHOSTDOWN       241
> +#undef  TARGET_EHOSTUNREACH
> +#define TARGET_EHOSTUNREACH    242
> +
> +#undef  TARGET_EALREADY
> +#define TARGET_EALREADY        244
> +#undef  TARGET_EINPROGRESS
> +#define TARGET_EINPROGRESS     245
> +#undef  TARGET_ENOTEMPTY
> +#define TARGET_ENOTEMPTY       247
> +#undef  TARGET_ENAMETOOLONG
> +#define TARGET_ENAMETOOLONG    248
> +#undef  TARGET_ELOOP
> +#define TARGET_ELOOP           249
> +#undef  TARGET_ENOSYS
> +#define TARGET_ENOSYS          251
> +
> +#undef  TARGET_ECANCELED
> +#define TARGET_ECANCELED       253
> +
> +#undef  TARGET_EOWNERDEAD
> +#define TARGET_EOWNERDEAD      254
> +#undef  TARGET_ENOTRECOVERABLE
> +#define TARGET_ENOTRECOVERABLE 255
> +
> +#undef  TARGET_ERFKILL
> +#define TARGET_ERFKILL         256
> +#undef  TARGET_EHWPOISON
> +#define TARGET_EHWPOISON       257
> +
>  #endif
> diff --git a/linux-user/hppa/target_syscall.h b/linux-user/hppa/target_syscall.h
> index 97a095656d8..0018bcb5c4d 100644
> --- a/linux-user/hppa/target_syscall.h
> +++ b/linux-user/hppa/target_syscall.h
> @@ -27,214 +27,4 @@ struct target_pt_regs {
>  #define TARGET_MCL_FUTURE  2
>  #define TARGET_MCL_ONFAULT 4
>  
> -#undef  TARGET_EWOULDBLOCK
> -#define TARGET_EWOULDBLOCK     TARGET_EAGAIN /* Operation would block */
> -#undef  TARGET_ENOMSG
> -#define TARGET_ENOMSG          35
> -#undef  TARGET_EIDRM
> -#define TARGET_EIDRM           36
> -#undef  TARGET_ECHRNG
> -#define TARGET_ECHRNG          37
> -#undef  TARGET_EL2NSYNC
> -#define TARGET_EL2NSYNC        38
> -#undef  TARGET_EL3HLT
> -#define TARGET_EL3HLT          39
> -#undef  TARGET_EL3RST
> -#define TARGET_EL3RST          40
> -#undef  TARGET_ELNRNG
> -#define TARGET_ELNRNG          41
> -#undef  TARGET_EUNATCH
> -#define TARGET_EUNATCH         42
> -#undef  TARGET_ENOCSI
> -#define TARGET_ENOCSI          43
> -#undef  TARGET_EL2HLT
> -#define TARGET_EL2HLT          44
> -#undef  TARGET_EDEADLK
> -#define TARGET_EDEADLK         45
> -#undef  TARGET_ENOLCK
> -#define TARGET_ENOLCK          46
> -#undef  TARGET_EILSEQ
> -#define TARGET_EILSEQ          47
> -
> -#undef  TARGET_ENONET
> -#define TARGET_ENONET          50
> -#undef  TARGET_ENODATA
> -#define TARGET_ENODATA         51
> -#undef  TARGET_ETIME
> -#define TARGET_ETIME           52
> -#undef  TARGET_ENOSR
> -#define TARGET_ENOSR           53
> -#undef  TARGET_ENOSTR
> -#define TARGET_ENOSTR          54
> -#undef  TARGET_ENOPKG
> -#define TARGET_ENOPKG          55
> -
> -#undef  TARGET_ENOLINK
> -#define TARGET_ENOLINK         57
> -#undef  TARGET_EADV
> -#define TARGET_EADV            58
> -#undef  TARGET_ESRMNT
> -#define TARGET_ESRMNT          59
> -#undef  TARGET_ECOMM
> -#define TARGET_ECOMM           60
> -#undef  TARGET_EPROTO
> -#define TARGET_EPROTO          61
> -
> -#undef  TARGET_EMULTIHOP
> -#define TARGET_EMULTIHOP       64
> -
> -#undef  TARGET_EDOTDOT
> -#define TARGET_EDOTDOT         66
> -#undef  TARGET_EBADMSG
> -#define TARGET_EBADMSG         67
> -#undef  TARGET_EUSERS
> -#define TARGET_EUSERS          68
> -#undef  TARGET_EDQUOT
> -#define TARGET_EDQUOT          69
> -#undef  TARGET_ESTALE
> -#define TARGET_ESTALE          70
> -#undef  TARGET_EREMOTE
> -#define TARGET_EREMOTE         71
> -#undef  TARGET_EOVERFLOW
> -#define TARGET_EOVERFLOW       72
> -
> -#undef  TARGET_EBADE
> -#define TARGET_EBADE           160
> -#undef  TARGET_EBADR
> -#define TARGET_EBADR           161
> -#undef  TARGET_EXFULL
> -#define TARGET_EXFULL          162
> -#undef  TARGET_ENOANO
> -#define TARGET_ENOANO          163
> -#undef  TARGET_EBADRQC
> -#define TARGET_EBADRQC         164
> -#undef  TARGET_EBADSLT
> -#define TARGET_EBADSLT         165
> -#undef  TARGET_EBFONT
> -#define TARGET_EBFONT          166
> -#undef  TARGET_ENOTUNIQ
> -#define TARGET_ENOTUNIQ        167
> -#undef  TARGET_EBADFD
> -#define TARGET_EBADFD          168
> -#undef  TARGET_EREMCHG
> -#define TARGET_EREMCHG         169
> -#undef  TARGET_ELIBACC
> -#define TARGET_ELIBACC         170
> -#undef  TARGET_ELIBBAD
> -#define TARGET_ELIBBAD         171
> -#undef  TARGET_ELIBSCN
> -#define TARGET_ELIBSCN         172
> -#undef  TARGET_ELIBMAX
> -#define TARGET_ELIBMAX         173
> -#undef  TARGET_ELIBEXEC
> -#define TARGET_ELIBEXEC        174
> -#undef  TARGET_ERESTART
> -#define TARGET_ERESTART        175
> -#undef  TARGET_ESTRPIPE
> -#define TARGET_ESTRPIPE        176
> -#undef  TARGET_EUCLEAN
> -#define TARGET_EUCLEAN         177
> -#undef  TARGET_ENOTNAM
> -#define TARGET_ENOTNAM         178
> -#undef  TARGET_ENAVAIL
> -#define TARGET_ENAVAIL         179
> -#undef  TARGET_EISNAM
> -#define TARGET_EISNAM          180
> -#undef  TARGET_EREMOTEIO
> -#define TARGET_EREMOTEIO       181
> -#undef  TARGET_ENOMEDIUM
> -#define TARGET_ENOMEDIUM       182
> -#undef  TARGET_EMEDIUMTYPE
> -#define TARGET_EMEDIUMTYPE     183
> -#undef  TARGET_ENOKEY
> -#define TARGET_ENOKEY          184
> -#undef  TARGET_EKEYEXPIRED
> -#define TARGET_EKEYEXPIRED     185
> -#undef  TARGET_EKEYREVOKED
> -#define TARGET_EKEYREVOKED     186
> -#undef  TARGET_EKEYREJECTED
> -#define TARGET_EKEYREJECTED    187
> -
> -/* Never used in linux.  */
> -/* #define TARGET_ENOSYM          215 */
> -#undef  TARGET_ENOTSOCK
> -#define TARGET_ENOTSOCK        216
> -#undef  TARGET_EDESTADDRREQ
> -#define TARGET_EDESTADDRREQ    217
> -#undef  TARGET_EMSGSIZE
> -#define TARGET_EMSGSIZE        218
> -#undef  TARGET_EPROTOTYPE
> -#define TARGET_EPROTOTYPE      219
> -#undef  TARGET_ENOPROTOOPT
> -#define TARGET_ENOPROTOOPT     220
> -#undef  TARGET_EPROTONOSUPPORT
> -#define TARGET_EPROTONOSUPPORT 221
> -#undef  TARGET_ESOCKTNOSUPPORT
> -#define TARGET_ESOCKTNOSUPPORT 222
> -#undef  TARGET_EOPNOTSUPP
> -#define TARGET_EOPNOTSUPP      223
> -#undef  TARGET_EPFNOSUPPORT
> -#define TARGET_EPFNOSUPPORT    224
> -#undef  TARGET_EAFNOSUPPORT
> -#define TARGET_EAFNOSUPPORT    225
> -#undef  TARGET_EADDRINUSE
> -#define TARGET_EADDRINUSE      226
> -#undef  TARGET_EADDRNOTAVAIL
> -#define TARGET_EADDRNOTAVAIL   227
> -#undef  TARGET_ENETDOWN
> -#define TARGET_ENETDOWN        228
> -#undef  TARGET_ENETUNREACH
> -#define TARGET_ENETUNREACH     229
> -#undef  TARGET_ENETRESET
> -#define TARGET_ENETRESET       230
> -#undef  TARGET_ECONNABORTED
> -#define TARGET_ECONNABORTED    231
> -#undef  TARGET_ECONNRESET
> -#define TARGET_ECONNRESET      232
> -#undef  TARGET_ENOBUFS
> -#define TARGET_ENOBUFS         233
> -#undef  TARGET_EISCONN
> -#define TARGET_EISCONN         234
> -#undef  TARGET_ENOTCONN
> -#define TARGET_ENOTCONN        235
> -#undef  TARGET_ESHUTDOWN
> -#define TARGET_ESHUTDOWN       236
> -#undef  TARGET_ETOOMANYREFS
> -#define TARGET_ETOOMANYREFS    237
> -#undef  TARGET_ETIMEDOUT
> -#define TARGET_ETIMEDOUT       238
> -#undef  TARGET_ECONNREFUSED
> -#define TARGET_ECONNREFUSED    239
> -#define TARGET_EREMOTERELEASE  240
> -#undef  TARGET_EHOSTDOWN
> -#define TARGET_EHOSTDOWN       241
> -#undef  TARGET_EHOSTUNREACH
> -#define TARGET_EHOSTUNREACH    242
> -
> -#undef  TARGET_EALREADY
> -#define TARGET_EALREADY        244
> -#undef  TARGET_EINPROGRESS
> -#define TARGET_EINPROGRESS     245
> -#undef  TARGET_ENOTEMPTY
> -#define TARGET_ENOTEMPTY       247
> -#undef  TARGET_ENAMETOOLONG
> -#define TARGET_ENAMETOOLONG    248
> -#undef  TARGET_ELOOP
> -#define TARGET_ELOOP           249
> -#undef  TARGET_ENOSYS
> -#define TARGET_ENOSYS          251
> -
> -#undef  TARGET_ECANCELED
> -#define TARGET_ECANCELED       253
> -
> -#undef  TARGET_EOWNERDEAD
> -#define TARGET_EOWNERDEAD      254
> -#undef  TARGET_ENOTRECOVERABLE
> -#define TARGET_ENOTRECOVERABLE 255
> -
> -#undef  TARGET_ERFKILL
> -#define TARGET_ERFKILL         256
> -#undef  TARGET_EHWPOISON
> -#define TARGET_EHWPOISON       257
> -
>  #endif /* HPPA_TARGET_SYSCALL_H */
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

