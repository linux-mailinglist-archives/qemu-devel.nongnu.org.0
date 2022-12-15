Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5909664D77A
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 09:00:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5j8t-0005wd-4e; Thu, 15 Dec 2022 02:58:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p5j8q-0005wI-T5
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 02:58:56 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p5j8p-0003Cv-3S
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 02:58:56 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so224834wml.0
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 23:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2EkHnf5KUpg2a1ILq8Sa62Ktl8OO37/gMpNH1CdJtLk=;
 b=M3dx4QEBfmL1cFX/YFPSR6zq2kJNmT/Le3ufeAD+cYbTTqKdb7ebC4hedZHkXK7ZkG
 pb/dim/9Ke/iq+TyOjS6rKODl7R3WUwq3dDR6qLy4bDSg8xc+xJe++K8FwmTo6wlpM6p
 HbfO1z9963D4fwOoe7eNiEpOMNch+YANYiDcbi3KUYhH6SJwv+8rhU05Iqh0gK0IU0U7
 uajGC+lXSm+w6PFvHcNxTnERanxhrqnfgaSp9sFvsOUDNxmJEDomrwK0lqCx1HtoA5vP
 O1zNVcz03LWGUTNZjWGcsqmyTMHYu9dBB5f51UQ4iZUsD9b6RhFUsmlw6DYXl4tGWLVX
 lsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2EkHnf5KUpg2a1ILq8Sa62Ktl8OO37/gMpNH1CdJtLk=;
 b=NOr0KX2gbHQ932VjNVMobjkFRkiz3OPeFDvYw3GPyhV9xnFJb0ngIfbX73GnGFI6px
 5NmlnovGrkO6ZBWf3kTY64D549xfaiykyfypCmo1sumCET8pSIvnYE/Lt8ehHfn08VCO
 yp2lfupiHQ7cw4AWxLahB2a7YoucQXBPLQAfuAO2jZzGfjEm/+Asj/dT5LShnmk2QYEC
 WzGrYPI88szLiRjTJuKQEz9dsnbknuHnJV3S4MNvYdJppu2RjWXNwim21fUilWnvF6Ey
 Mjc75Y7hqMoAzc5UWKMDH1YHDNrjkpxI0lAAnjSBBCfyY34BDHvDjtE/ZnJpzk0OI//n
 Ow7w==
X-Gm-Message-State: ANoB5pmROCHblJPUbJvRVfX4XPEPjbuFzCwRHp7Sz1L8ho1c2XGAQAIw
 anUV5tOs5Y0iAwkRaRKNToJVaA==
X-Google-Smtp-Source: AA0mqf6zbfKIAQz7IRUTi6Wdwynq2pe2Hu4pk3GHgbIPr2K0jOsgrJV8okGSytiXaGGyT1u3j/TVgQ==
X-Received: by 2002:a05:600c:3592:b0:3d0:1b21:597 with SMTP id
 p18-20020a05600c359200b003d01b210597mr21068270wmq.1.1671091132264; 
 Wed, 14 Dec 2022 23:58:52 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o20-20020a05600c339400b003cffd3c3d6csm4814256wmp.12.2022.12.14.23.58.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 23:58:51 -0800 (PST)
Message-ID: <165fbdfe-8e72-0ab7-727e-0f54df9957b3@linaro.org>
Date: Thu, 15 Dec 2022 08:58:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] linux-user: Add translation for argument of msync()
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
References: <Y5rMcts4qe15RaVN@p100>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y5rMcts4qe15RaVN@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 15/12/22 08:27, Helge Deller wrote:
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

Hmm don't we want to keep the host flag instead?

    #define TARGET_MS_ASYNC MS_ASYNC

> +#endif
> +
> +#ifndef TARGET_MS_INVALIDATE
> +#define TARGET_MS_INVALIDATE 2

Ditto,

> +#endif
> +
> +#ifndef TARGET_MS_SYNC
> +#define TARGET_MS_SYNC 4

ditto.

LGTM otherwise.

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


