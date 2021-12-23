Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 981CF47E8E6
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 22:04:46 +0100 (CET)
Received: from localhost ([::1]:34236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0VGX-0003NA-8S
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 16:04:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n0VF6-0002bS-Q6
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 16:03:16 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:50651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n0VF4-0005LS-Qd
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 16:03:16 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MLhsE-1miprk0MzY-00HghQ; Thu, 23 Dec 2021 22:03:12 +0100
Message-ID: <e506a0b4-2505-d136-53f8-c1bcafc204a1@vivier.eu>
Date: Thu, 23 Dec 2021 22:03:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: fr
To: Tonis Tiigi <tonistiigi@gmail.com>, qemu-devel@nongnu.org
References: <20211223064728.18048-1-tonistiigi@gmail.com>
 <20211223064728.18048-2-tonistiigi@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v3 1/2] linux-user: add sched_getattr support
In-Reply-To: <20211223064728.18048-2-tonistiigi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ysC3bBNXHphj0p/nS00SeciFweFdShwgA3aNHBn9q2sEVeUR/oe
 aPTlmCIpnAnT+i7gA/Ov+A7yXAhg4cQfFt29tjl2k/MNnqhj27c2ajOI6NS/1OHDbPJQPJV
 5ql9zaarwbsB1TJkzpmZSiE+FmZ/ugPM84kfYtmcNl5LdaGiH0l9iOthibNpUu5DEWpfvY5
 R4ocBA6noJrKdNRp2ejTA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:R89hJuzagJE=:vz103Gznr9XoJ0bzRAsZu5
 jbYCYlnc8AjHiybRk56ueQkLABnKw6XL9/b89ki83DpSP1+DUs1pC6DS4/3TXsC06lCwzsz/h
 bWKCWZdcnic9nXKO8r//3kvsISb6urBU7oTAQtB6TbbzLEfT6kz8/c6KqQgoolm3IRI3c6IUe
 WmFn2FTXRYdrTlcExDiQK4eKSCfRxMv3G9kSh7NLSwtXZGsHJBsVbHC4YEBJhmFF7aSEElBRG
 yO2mTtJ5YRtAvLUYHWNZ/XON4hT4MP+SyTLNIIj9NVyBII1AFAffFEYStNt4XPEJCRttnHPOq
 FgK8BKGIhncGQKsgujRUSxDx6wwJxugfcYEvf15LXpA51q4btN8ugoCrmZcZRxsxRhS9pgSXn
 PfsOwOrYsHw1cegnRaT3M5lCr5wp1eYdwsKY2BlEewVeLu4e3PQ1GO6OZ8napUigzNNkLjxoW
 MAZwrYb6fj0FLvjc9mQlrH2R6T2GckBQKKYMP5iByRc3aKB0IszA5b0qDzXmDY6lifvliil6S
 LztyWAY2bjMM1p0Z5mqDEFGKzV3yaCEwnkxK5H3Kf2kGb1pdHIoQmCYEHtKobde1d1olq/kaz
 scSFHQnByiRzv4Amo+1/j8+F69UcWoYcEv7q23R8P64PxmAodxvgYd7763b6ZUqWvBbCJ7ECD
 wO6Qb4zJeBVwCx5fo6z6PXN1gyhxqdG9Lh6lZBoXc4IuIxpzSzSDQ/OgCXmyz9/nn+xM=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.264,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 23/12/2021 à 07:47, Tonis Tiigi a écrit :

Please copy here what you explain in PATCH 0 regarding this patch.
(do the same for PATCH 1)

> Signed-off-by: Tonis Tiigi <tonistiigi@gmail.com>
> ---
>   linux-user/syscall.c      | 94 +++++++++++++++++++++++++++++++++++++++
>   linux-user/syscall_defs.h | 14 ++++++
>   2 files changed, 108 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index f1cfcc8104..2f5a0fac5a 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -339,6 +339,12 @@ _syscall3(int, sys_sched_getaffinity, pid_t, pid, unsigned int, len,
>   #define __NR_sys_sched_setaffinity __NR_sched_setaffinity
>   _syscall3(int, sys_sched_setaffinity, pid_t, pid, unsigned int, len,
>             unsigned long *, user_mask_ptr);
> +#define __NR_sys_sched_getattr __NR_sched_getattr
> +_syscall4(int, sys_sched_getattr, pid_t, pid, struct target_sched_attr *, attr,
> +          unsigned int, size, unsigned int, flags);
> +#define __NR_sys_sched_setattr __NR_sched_setattr
> +_syscall3(int, sys_sched_setattr, pid_t, pid, struct target_sched_attr *, attr,
> +          unsigned int, flags);
>   #define __NR_sys_getcpu __NR_getcpu
>   _syscall3(int, sys_getcpu, unsigned *, cpu, unsigned *, node, void *, tcache);
>   _syscall4(int, reboot, int, magic1, int, magic2, unsigned int, cmd,
> @@ -10593,6 +10599,94 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>           }
>       case TARGET_NR_sched_getscheduler:
>           return get_errno(sched_getscheduler(arg1));
> +    case TARGET_NR_sched_getattr:
> +        {
> +            struct target_sched_attr *target_scha;
> +            struct target_sched_attr scha;

In fact, this scha is used with the host syscall, so it must be  sched_attr.

> +            if (arg2 == 0) {
> +                return -TARGET_EINVAL;
> +            }
> +            if (arg3 > sizeof(scha)) {
> +                arg3 = sizeof(scha);
> +            }
> +            ret = get_errno(sys_sched_getattr(arg1, &scha, arg3, arg4));
> +            if (!is_error(ret)) {
> +                target_scha = lock_user(VERIFY_WRITE, arg2, arg3, 0);
> +                if (!target_scha) {
> +                    return -TARGET_EFAULT;
> +                }
> +                target_scha->size = tswap32(scha.size);
> +                target_scha->sched_policy = tswap32(scha.sched_policy);
> +                target_scha->sched_flags = tswap64(scha.sched_flags);
> +                target_scha->sched_nice = tswap32(scha.sched_nice);
> +                target_scha->sched_priority = tswap32(scha.sched_priority);
> +                target_scha->sched_runtime = tswap64(scha.sched_runtime);
> +                target_scha->sched_deadline = tswap64(scha.sched_deadline);
> +                target_scha->sched_period = tswap64(scha.sched_period);
> +                if (scha.size > offsetof(struct target_sched_attr, sched_util_min)) {
> +                    target_scha->sched_util_min = tswap32(scha.sched_util_min);
> +                    target_scha->sched_util_max = tswap32(scha.sched_util_max);
> +                }
> +                unlock_user(target_scha, arg2, arg3);
> +            }
> +            return ret;
> +        }
> +    case TARGET_NR_sched_setattr:
> +        {
> +            struct target_sched_attr *target_scha;
> +            struct target_sched_attr scha;

scha is sched_attr as it is used with the host syscall.


> +            if (arg2 == 0) {
> +                return -TARGET_EINVAL;
> +            }
> +            uint32_t size;

QEMU coding style doesn't allow to mix declarations and statements.

> +            if (get_user_u32(size, arg2)) {
> +                return -TARGET_EFAULT;
> +            }
> +            if (!size) {
> +                size = offsetof(struct target_sched_attr, sched_util_min);
> +            }
> +            if (size < offsetof(struct target_sched_attr, sched_util_min)) {
> +                if (put_user_u32(sizeof(struct target_sched_attr), arg2)) {
> +                    return -TARGET_EFAULT;
> +                }
> +                return -TARGET_E2BIG;
> +            }
> +
> +            if (size > sizeof(scha)) {
> +                for (int i = sizeof(scha); i < size; i++) {
> +                    uint8_t b;
> +                    if (get_user_u8(b, arg2 + i)) {
> +                        return -TARGET_EFAULT;
> +                    }
> +                    if (b != 0) {
> +                        if (put_user_u32(sizeof(struct target_sched_attr), arg2)) {
> +                            return -TARGET_EFAULT;
> +                        }
> +                        return -TARGET_E2BIG;
> +                    }
> +                }
> +                size = sizeof(scha);
> +            }

I guess this is the code to mimic kernel copy_struct_from_user(), the part when usize > ksize.

It's a little bit ugly, but I can't disagree because the kernel does the same.

except that the kernel check for unsigned rather than for 8bit. Could you change that?

The best would be to define check_zeroed_user() in Qemu and use it here.

> +
> +            target_scha = lock_user(VERIFY_READ, arg2, size, 1);
> +            if (!target_scha) {
> +                return -TARGET_EFAULT;
> +            }
> +            scha.size = size;
> +            scha.sched_policy = tswap32(target_scha->sched_policy);
> +            scha.sched_flags = tswap64(target_scha->sched_flags);
> +            scha.sched_nice = tswap32(target_scha->sched_nice);
> +            scha.sched_priority = tswap32(target_scha->sched_priority);
> +            scha.sched_runtime = tswap64(target_scha->sched_runtime);
> +            scha.sched_deadline = tswap64(target_scha->sched_deadline);
> +            scha.sched_period = tswap64(target_scha->sched_period);
> +            if (size > offsetof(struct target_sched_attr, sched_util_min)) {
> +                scha.sched_util_min = tswap32(target_scha->sched_util_min);
> +                scha.sched_util_max = tswap32(target_scha->sched_util_max);
> +            }
> +            unlock_user(target_scha, arg2, 0);
> +            return get_errno(sys_sched_setattr(arg1, &scha, arg3));
> +        }
>       case TARGET_NR_sched_yield:
>           return get_errno(sched_yield());
>       case TARGET_NR_sched_get_priority_max:
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index 0b13975937..310d6ce8ad 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -2914,4 +2914,18 @@ struct target_statx {
>      /* 0x100 */
>   };
>   
> +/* from kernel's include/linux/sched/types.h */
> +struct target_sched_attr {
> +    abi_uint size;
> +    abi_uint sched_policy;
> +    abi_ullong sched_flags;
> +    abi_int sched_nice;
> +    abi_uint sched_priority;
> +    abi_ullong sched_runtime;
> +    abi_ullong sched_deadline;
> +    abi_ullong sched_period;
> +    abi_uint sched_util_min;
> +    abi_uint sched_util_max;
> +};
> +
>   #endif

Thanks,
Laurent

