Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 992926AE630
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 17:19:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZa25-0007O0-Fn; Tue, 07 Mar 2023 11:19:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZa1y-0007Nd-3H
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:19:14 -0500
Received: from mout.kundenserver.de ([212.227.126.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZa1w-00066x-BK
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:19:13 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M26iv-1pbVpo3ext-002aHU; Tue, 07 Mar 2023 17:19:06 +0100
Message-ID: <42839182-c623-a6c4-1bae-0dcf0790bb3e@vivier.eu>
Date: Tue, 7 Mar 2023 17:19:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] linux-user: Add translation for argument of msync()
Content-Language: fr
To: Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
References: <Y5rMcts4qe15RaVN@p100>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <Y5rMcts4qe15RaVN@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:x80/TXh1CFSuzwpiZmZZ+M6EakEHkWFMLAo2fwjO4X3/svdT1x7
 PEKFJt8dEPl2GTIYQkUURdm+Y3jMhcvB5KtHS2BMN7LH0HDCy7aU4rIO4WFzK6w3MkWQjVe
 cd88h+30Y/AmNwM+z/LOk30l8tOsyPCfak3vWvvKPkUUh9/vqhsMmletlIj62hef9mBf9zb
 DPEWn8Ik5LigIMwLhSxYw==
UI-OutboundReport: notjunk:1;M01:P0:FSi90IxtSwY=;T9LhEU1BTe+CvfIcqf6W/U3HkWl
 IEJxM36byFcyY+bMlrJd/7rizn6hWdtrR5Q6f507UM5d1Gm/uHlypzxX95d1s5yMXCs3qzenS
 kBYKKlJWorQ+DiSWF/tWC3or5kePh4DHIF4Fvjj/bI3rTMFLhZkBpe+c6MeU1xDvyDAEDeiDd
 lZT1z0JuDLzgdmxtWsx6xm9jSJQF6irKKC7+AWc6p5wQkUfjy7WIgQQU47qrsSbuLYj1gDmmY
 RMjmUAveHEDlFF7qk0PC1SR0u1gdnlSdaXSn+GixiBKV6FdztOjaM65JejUhgqK0jt9B+arYZ
 7JmlffkZqmK1A5Wu/psaB6tJpwBm+I6UPi9ov7+jxFNQXfk4qRdcWzzXh2SuSMn9THaXfsIQF
 icjnV98inCgEqPdoVR1LmnSQ8kdXUtv2tK0J6RNRMLTOHgBN7g2bzsZJgD+0EPWRQkgnoNtK4
 VsJp1mylsLSrM4JchsWAH/lXN8lR7EBQWJkIgRiE2srN9RiiEdUflqh9t+DOvkJuzDlQ81Vr1
 ++C4s+Pj9O9r7WJ4y8eKzoK99geWdBbmu5BSkRXGAsbIwmanVEN2lqyzgWR69wrpZiwnnjwpG
 /eU3yW6V5jCnmcFDMNLEi45NK7FXZGiCz3+fLLLAW0dNgmfJAZeTQSUE4HtlOCmoLFQ2yaMon
 P5Ht22inrPH4j8vu1tFoCtvxawrYHAhbGjW1OyK3bw==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 15/12/2022 à 08:27, Helge Deller a écrit :
> msync() uses the flags MS_ASYNC, MS_INVALIDATE and MS_SYNC, which differ
> between platforms, specifcally on alpha and hppa.
> 
> Add a target to host translation for those and wire up a nicer strace
> output.
> 
> This fixes the testsuite of the macaulay2 debian package with a hppa-linux
> guest on a x86-64 host.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/linux-user/alpha/target_mman.h b/linux-user/alpha/target_mman.h
> index cd6e3d70a6..051544f5ab 100644
> --- a/linux-user/alpha/target_mman.h
> +++ b/linux-user/alpha/target_mman.h
> @@ -3,6 +3,10 @@
> 
>   #define TARGET_MADV_DONTNEED 6
> 
> +#define TARGET_MS_ASYNC 1
> +#define TARGET_MS_SYNC 2
> +#define TARGET_MS_INVALIDATE 4
> +
>   #include "../generic/target_mman.h"
> 
>   #endif
> diff --git a/linux-user/generic/target_mman.h b/linux-user/generic/target_mman.h
> index 1436a3c543..32bf1a52d0 100644
> --- a/linux-user/generic/target_mman.h
> +++ b/linux-user/generic/target_mman.h
> @@ -89,4 +89,17 @@
>   #define TARGET_MADV_DONTNEED_LOCKED 24
>   #endif
> 
> +
> +#ifndef TARGET_MS_ASYNC
> +#define TARGET_MS_ASYNC 1
> +#endif
> +
> +#ifndef TARGET_MS_INVALIDATE
> +#define TARGET_MS_INVALIDATE 2
> +#endif
> +
> +#ifndef TARGET_MS_SYNC
> +#define TARGET_MS_SYNC 4
> +#endif
> +
>   #endif
> diff --git a/linux-user/hppa/target_mman.h b/linux-user/hppa/target_mman.h
> index 66dd9f7941..f9b6b97032 100644
> --- a/linux-user/hppa/target_mman.h
> +++ b/linux-user/hppa/target_mman.h
> @@ -10,6 +10,10 @@
>   #define TARGET_MADV_WIPEONFORK 71
>   #define TARGET_MADV_KEEPONFORK 72
> 
> +#define TARGET_MS_SYNC 1
> +#define TARGET_MS_ASYNC 2
> +#define TARGET_MS_INVALIDATE 4
> +
>   #include "../generic/target_mman.h"
> 
>   #endif
> diff --git a/linux-user/strace.list b/linux-user/strace.list
> index a75101fca1..ac8f872371 100644
> --- a/linux-user/strace.list
> +++ b/linux-user/strace.list
> @@ -650,7 +650,7 @@
>   { TARGET_NR_msgsnd, "msgsnd" , NULL, NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_msync
> -{ TARGET_NR_msync, "msync" , NULL, NULL, NULL },
> +{ TARGET_NR_msync, "msync" , "%s(%p,%u,%d)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_multiplexer
>   { TARGET_NR_multiplexer, "multiplexer" , NULL, NULL, NULL },
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index d58e9b8d10..e541fbe09a 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -22,6 +22,7 @@
>   #include "qemu/path.h"
>   #include "qemu/memfd.h"
>   #include "qemu/queue.h"
> +#include "target_mman.h"
>   #include <elf.h>
>   #include <endian.h>
>   #include <grp.h>
> @@ -7667,6 +7668,14 @@ static inline int target_to_host_mlockall_arg(int arg)
>   }
>   #endif
> 
> +static inline int target_to_host_msync_arg(abi_long arg)
> +{
> +    return ((arg & TARGET_MS_ASYNC) ? MS_ASYNC : 0) |
> +           ((arg & TARGET_MS_INVALIDATE) ? MS_INVALIDATE : 0) |
> +           ((arg & TARGET_MS_SYNC) ? MS_SYNC : 0) |
> +           (arg & ~(TARGET_MS_ASYNC | TARGET_MS_INVALIDATE | TARGET_MS_SYNC));
> +}
> +
>   #if (defined(TARGET_NR_stat64) || defined(TARGET_NR_lstat64) ||     \
>        defined(TARGET_NR_fstat64) || defined(TARGET_NR_fstatat64) ||  \
>        defined(TARGET_NR_newfstatat))
> @@ -10163,7 +10172,8 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>           /* ??? msync/mlock/munlock are broken for softmmu.  */
>   #ifdef TARGET_NR_msync
>       case TARGET_NR_msync:
> -        return get_errno(msync(g2h(cpu, arg1), arg2, arg3));
> +        return get_errno(msync(g2h(cpu, arg1), arg2,
> +                               target_to_host_msync_arg(arg3)));
>   #endif
>   #ifdef TARGET_NR_mlock
>       case TARGET_NR_mlock:
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

