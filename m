Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BCE6AE64F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 17:22:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZa4O-0000c1-B1; Tue, 07 Mar 2023 11:21:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZa4L-0000bh-CA
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:21:41 -0500
Received: from mout.kundenserver.de ([212.227.126.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZa4J-0006yS-Ma
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:21:41 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MUGyh-1pz3Rn3GgF-00RFkB; Tue, 07 Mar 2023 17:21:32 +0100
Message-ID: <f63f6861-df82-9b5d-70b8-129b15a17492@vivier.eu>
Date: Tue, 7 Mar 2023 17:21:31 +0100
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
X-Provags-ID: V03:K1:/0uL1x13Wu3rZomLus/YOkWm7E/g5J1mcodALrt2FXI4+w3WxNY
 WdiyYIpTnJ/gLtbYWtOZ6dCtr2b7FTeV0IMJG6GF+d8USS7uTujBuhQZ1MVOPz/+VO3DYBF
 Scq5u5XKpHYVRImdWT1fI7RiUhm6URLVAucIaTTXGKxcBxsZFzVnDcIYDN3mRvju2xiBfy9
 xFMr1pNWumqDBMvD8jt9A==
UI-OutboundReport: notjunk:1;M01:P0:XkODJwn6czI=;7ZNsILcYJNwqtGbNdOy0bLUpW8K
 wWq2M2tM0ej1nzgBF1B1bQ46H9jZxHhXL5C/dqi7x0YgaBVEgOaasdZuiDa2UUsX9pbHLycBG
 656ZNg4ZsDvNYiMZ5xmNKP4koFYHSUTvWKG3qxgdcXyMAYLUagYVnnM82I1Jb/896vCeRb5Dr
 te6P22ilH1NcvbflccYSXfgLnXnV+G9Aew8nsPW8z3oOprfQoCVfiyMtrjBOx6UTqeXldvDgk
 AeKSclQIPgB9cqMYZ4do8QJ9JIZi4YjXvOSERi+zBwSJX7mH7SvCohrMyLZkHFvTeSEUn0PV9
 Y3piAmj0bRtHUSrSwUZt8shmHeUAbRkSGFM4WmVUObxBz66z+F0iZHvhO2cGt109kYiAn2NtI
 bZH2EY9i4Z+AyLy3UXOCnLM8vhrkuITnWGXqHYrevQdVgJqADuJZoppJkWBFq2nldJ/40JDE2
 wlYuqoqcSG7VTomGxyP+OfBphi1sOCzGfVpX4NSIW/Fijvc9mhRu8jsdhAapbozTCQoq7x6Y0
 1Hk3xu3hmwWXIKT8cxAF2/wtuv+EdNw+2tFrocRplfDa7XBdgOfMgwoHQVd+b5PvHc9tbxqlk
 1OEd8ilVPkDsacjadG6pPPxS5CLcKZKzvChQEm9QPwVbfg5Gw2RhfwEBFan+aX7R9mlN7xrz9
 43p037bbH93RUiE85ZZ6Uw2hiNbwk2SHVNh0WDGr4w==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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

Applied to my linux-user-for-8.0 branch.

Thanks,
Laurent


