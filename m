Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5112F484127
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 12:47:07 +0100 (CET)
Received: from localhost ([::1]:53392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4iHS-0004NW-6J
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 06:47:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n4iEz-0002tk-9R
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 06:44:33 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:44647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n4iEx-0007nM-LV
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 06:44:33 -0500
Received: from [192.168.100.1] ([82.142.30.62]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mrfgi-1mYuC91BVE-00ngTn; Tue, 04 Jan 2022 12:44:21 +0100
Message-ID: <8667b7d6-bfb5-ddb5-7661-ae69e5a5ce2a@vivier.eu>
Date: Tue, 4 Jan 2022 12:44:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 2/6] linux-user: Disable more prctl subcodes
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211227150127.2659293-1-richard.henderson@linaro.org>
 <20211227150127.2659293-3-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211227150127.2659293-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1eGUZR4nc5Ut/3PdlfqfnzUBo34ZPxghlOTq9+n2jv5GP/0hgol
 h0kyNplxwkK74mw91JeT3d3ei5hCXd6BgrxH7DYntcLsGZaYLfb/GQOMbCQObjfMYJbHzyH
 tEu1awP/AjqOdotQcINQo3OS7YjQ1qftvlWW/6VDs5+YQgfpcC/4Px183E992harjD0IEMW
 PPI5tQkXs0ufGxX4KT/Yg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:D6HXk3yr5Mc=:IPHQ1tTpK2zTu7MMWPxKUs
 /BFMX7js/T3aBrGX9xbdVvoH0ZZtDSmZfk45GUHI9BYndd6S+mNvi6WIcfl9RqeHVUDk44EFc
 S30autjXRtie9s60mWof+szmPmGG6845YhBaC9IC6xmhVsD51LzIZOCMQNTm4e9LRAbOFuRmT
 fwR5srFeg9ujC1BdwDbC9XZb3ZCTZWjkgRms8jn90h8vVrqPavNJ8pKonJNW+LBX10QTo1E1F
 hRG08bnjtlitC3lGhufqQf9w/SFxRz0IHVxDx0qDsF4PBxj50sDz/zdmzzkdkVQIYYFaL0CBo
 VyYUEMteaWut8EBBbKEuRrnnpeqhbf5pzGXJ1lIt4GDFXeuxtlt44TFc+73ZBrosV1T8uWA+C
 ngMI7W49JY37CdFqTtX5IhXHbDdkzItbPJf6t7GxUROLobaj4ZqnkH8D8bG03S9KiwOJwEBIG
 7wifzAZ3IBk+J2ycbgfNssR16nCH5cqpLVQXwwHxa5G3qopo0pBghIpx46puozrfvobhM850O
 NaUYl6cVvse6dtzIfyU38twO8zBb5s6n/+VX/jSbOAlJgE3qPRrlVOoapg0J1NDW0CLAxEjOl
 80E8+dg1KMBkdSgk9ONKGF0mHdKkNknzRYpf8/1BqXRHCA7sBkIdY6UzGoEjdpAtCl2J38kj3
 4h6dGALX/f3LMNhnpdEWqozgx5pxdzy0vv/bR+HoS7RP/w+Qz3MoRvqmvF/ov43krGA0=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 27/12/2021 à 16:01, Richard Henderson a écrit :
> Create a list of subcodes that we want to pass on, a list of
> subcodes that should not be passed on because they would affect
> the running qemu itself, and a list that probably could be
> implemented but require extra work. Do not pass on unknown subcodes.
> 
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Log unknown prctl options.
> ---
>   linux-user/syscall.c | 58 +++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 55 insertions(+), 3 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 0f0f67d567..d868ef2910 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -6337,6 +6337,13 @@ abi_long do_arch_prctl(CPUX86State *env, int code, abi_ulong addr)
>   # define PR_MTE_TAG_SHIFT       3
>   # define PR_MTE_TAG_MASK        (0xffffUL << PR_MTE_TAG_SHIFT)
>   #endif
> +#ifndef PR_SET_IO_FLUSHER
> +# define PR_SET_IO_FLUSHER 57
> +# define PR_GET_IO_FLUSHER 58
> +#endif
> +#ifndef PR_SET_SYSCALL_USER_DISPATCH
> +# define PR_SET_SYSCALL_USER_DISPATCH 59
> +#endif
>   
>   #include "target_prctl.h"
>   
> @@ -6433,13 +6440,58 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
>               return -TARGET_EINVAL;
>           }
>           return do_prctl_get_tagged_addr_ctrl(env);
> +
> +    case PR_GET_DUMPABLE:
> +    case PR_SET_DUMPABLE:
> +    case PR_GET_KEEPCAPS:
> +    case PR_SET_KEEPCAPS:
> +    case PR_GET_TIMING:
> +    case PR_SET_TIMING:
> +    case PR_GET_TIMERSLACK:
> +    case PR_SET_TIMERSLACK:
> +    case PR_MCE_KILL:
> +    case PR_MCE_KILL_GET:
> +    case PR_GET_NO_NEW_PRIVS:
> +    case PR_SET_NO_NEW_PRIVS:
> +    case PR_GET_IO_FLUSHER:
> +    case PR_SET_IO_FLUSHER:
> +        /* Some prctl options have no pointer arguments and we can pass on. */
> +        return get_errno(prctl(option, arg2, arg3, arg4, arg5));
> +
> +    case PR_GET_CHILD_SUBREAPER:
> +    case PR_SET_CHILD_SUBREAPER:
> +    case PR_GET_SPECULATION_CTRL:
> +    case PR_SET_SPECULATION_CTRL:
> +    case PR_GET_TID_ADDRESS:
> +        /* TODO */
> +        return -TARGET_EINVAL;
> +
> +    case PR_GET_FPEXC:
> +    case PR_SET_FPEXC:
> +        /* Was used for SPE on PowerPC. */
> +        return -TARGET_EINVAL;
> +
> +    case PR_GET_ENDIAN:
> +    case PR_SET_ENDIAN:
> +    case PR_GET_FPEMU:
> +    case PR_SET_FPEMU:
> +    case PR_SET_MM:
>       case PR_GET_SECCOMP:
>       case PR_SET_SECCOMP:
> -        /* Disable seccomp to prevent the target disabling syscalls we need. */
> +    case PR_SET_SYSCALL_USER_DISPATCH:
> +    case PR_GET_THP_DISABLE:
> +    case PR_SET_THP_DISABLE:
> +    case PR_GET_TSC:
> +    case PR_SET_TSC:
> +    case PR_GET_UNALIGN:
> +    case PR_SET_UNALIGN:
> +        /* Disable to prevent the target disabling stuff we need. */
>           return -TARGET_EINVAL;
> +
>       default:
> -        /* Most prctl options have no pointer arguments */
> -        return get_errno(prctl(option, arg2, arg3, arg4, arg5));
> +        qemu_log_mask(LOG_UNIMP, "Unsupported prctl: " TARGET_ABI_FMT_ld "\n",
> +                      option);
> +        return -TARGET_EINVAL;
>       }
>   }
>   

Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent


