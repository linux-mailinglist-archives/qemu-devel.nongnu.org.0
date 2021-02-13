Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8037B31ADC9
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 20:33:22 +0100 (CET)
Received: from localhost ([::1]:47260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lB0fR-00036P-Jq
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 14:33:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lB0co-0002MZ-V5
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 14:30:43 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:38805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lB0cf-0004Lm-1P
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 14:30:36 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Md66H-1llAih0KTj-00aGId; Sat, 13 Feb 2021 20:30:24 +0100
Subject: Re: [PATCH] linux-user: add TARGET_SO_{DOMAIN,PROTOCOL}
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-devel@nongnu.org
References: <20210204153925.2030606-1-Jason@zx2c4.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <1cf2e06d-73f3-1fda-1fad-7d331405ad44@vivier.eu>
Date: Sat, 13 Feb 2021 20:30:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210204153925.2030606-1-Jason@zx2c4.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:aoJqNUnA8PnYAdEGtJrno5vBikyAECFFvyxiKkmd88G3BNdyx/8
 jhjbFuOO8yycS0lvcpHxFsQrnAAqBn9frrly3cf6EiPbozE373LDQ/bhQeRGNh6thEH9qK/
 f4TXYcW0+dl6WQkbjlVSo4uFYyXZLXsUCRjNM80nvbyW1BY9xcM4UWsuwm+KK37WSosiAfF
 7LzlYQtYBsc0VG8qXN6Cw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WcLRhTDbsW4=:O/rAlREw4tVH45MYpYkURK
 yeOuh4WXCORiSL3CNtIvPHMz2X3/n3ifu5AY3wIVcw+nwemh3ceJm3GtI1zEdM0QOOrf1eBhk
 IfxUWKFpqeQcp+Oq5ME7jN59VKSaA277YApVsjKQIY51iiBDB/Wdxbk3xFgVNWDsDg8iRXvGM
 9UtEMlhMeCsDEjaRCTfSIt2dpw5VLlSN+om+0KLYsYwZOBT5HfZ0Mru538gF7oIRsZ6MBCAQV
 XseKJMyT0+gg9CStzcWjBceE4DWXoZucWJoOXeKBs8RoTHiRGe1bgJPx8uMwnck9M/IVD5bnW
 z1dB2Q3DrB0Tmu4XSGKOeFoP/SifyA3VVh/8IWI+Qi7G5xw2K7Agf7I0ChHVBHAC+7EQ7yRhA
 xG8z6GmlgIzFxqdkED1w2HxGLcVPmJ+D0ivpvUN6jAbtlk58sWGippMrGsQnuMuAndYDaFlsT
 IlJiTtcx2w==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 04/02/2021 à 16:39, Jason A. Donenfeld a écrit :
> These were defined for other platforms but mistakenly left out of mips
> and generic, so this commit adds them to the places missing. Then it
> makes them be translated in getsockopt.
> 
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  linux-user/generic/sockbits.h | 3 +++
>  linux-user/mips/sockbits.h    | 2 ++
>  linux-user/syscall.c          | 6 ++++++
>  3 files changed, 11 insertions(+)
> 
> diff --git a/linux-user/generic/sockbits.h b/linux-user/generic/sockbits.h
> index e44733c601..b3b4a8e44c 100644
> --- a/linux-user/generic/sockbits.h
> +++ b/linux-user/generic/sockbits.h
> @@ -55,4 +55,7 @@
>  #define TARGET_SO_ACCEPTCONN           30
>  
>  #define TARGET_SO_PEERSEC              31
> +
> +#define TARGET_SO_PROTOCOL             38
> +#define TARGET_SO_DOMAIN               39
>  #endif
> diff --git a/linux-user/mips/sockbits.h b/linux-user/mips/sockbits.h
> index 0f022cd598..562cad88e2 100644
> --- a/linux-user/mips/sockbits.h
> +++ b/linux-user/mips/sockbits.h
> @@ -40,6 +40,8 @@
>  #define TARGET_SO_SNDTIMEO     0x1005  /* send timeout */
>  #define TARGET_SO_RCVTIMEO     0x1006  /* receive timeout */
>  #define TARGET_SO_ACCEPTCONN   0x1009
> +#define TARGET_SO_PROTOCOL     0x1028  /* protocol type */
> +#define TARGET_SO_DOMAIN       0x1029  /* domain/socket family */
>  
>  /* linux-specific, might as well be the same as on i386 */
>  #define TARGET_SO_NO_CHECK     11
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 34760779c8..264b3265b1 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -2832,6 +2832,12 @@ get_timeout:
>          case TARGET_SO_ACCEPTCONN:
>              optname = SO_ACCEPTCONN;
>              goto int_case;
> +        case TARGET_SO_PROTOCOL:
> +            optname = SO_PROTOCOL;
> +            goto int_case;
> +        case TARGET_SO_DOMAIN:
> +            optname = SO_DOMAIN;
> +            goto int_case;
>          default:
>              goto int_case;
>          }
> 

Applied to my linux-user-for-6.0 branch.

Thanks,
Laurent


