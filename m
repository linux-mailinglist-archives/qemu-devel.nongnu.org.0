Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5002E485106
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 11:20:05 +0100 (CET)
Received: from localhost ([::1]:41852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n53Ol-0002wA-Qv
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 05:20:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n53Kz-0000BN-8Q
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:16:09 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:38703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n53Kx-0006IS-7Q
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:16:08 -0500
Received: from [192.168.100.1] ([82.142.30.62]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MfZ9C-1mTniO3Usa-00fwkN; Wed, 05 Jan 2022 11:16:05 +0100
Message-ID: <cca2a02e-78f4-6f36-c3ff-9ec19f6466eb@vivier.eu>
Date: Wed, 5 Jan 2022 11:16:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 1/2] linux-user: add sched_getattr support
Content-Language: fr
To: Tonis Tiigi <tonistiigi@gmail.com>, qemu-devel@nongnu.org
References: <20220105041819.24160-1-tonistiigi@gmail.com>
 <20220105041819.24160-2-tonistiigi@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220105041819.24160-2-tonistiigi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:7oGx679+iI4jLwRW/EsciBBZsYIn3iIZ6k6YR8M9IE655ig7o1M
 vyQuXl836W8DkchaOqvrJGOQycCVb+Css9wGKUfJQ4C8edb60Texd3TuTFa4gOuqAV511hb
 TG1P+xAmcu/mbhhHj9MPK7Ygt9YFO1wzEW3wNU8gfRWJFlnDJ7wSXU2GCE+B5bvjnMs4gJG
 H6BHUF5GD93SxzmJjUUyg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NmLD80P0/Bs=:s4nHDDdoW2iPS11ybKxDDK
 P5kNN0Jy1a237jBT0Ay35Er5+vSDOK8w4YF/1RVzXZSZibCkhRWAeyqyCKoxWJgVl7zISkYXM
 0g2Or85cOvPNv6zOdcqBWjmLoXC/MkSpgx/N0l+WZRCNxk8fnWWSG5k7eymqY44ohBPQJGjbq
 u9cRgP9MjUTp1Tauwagkl0HIZRXwLrkoqxwa/K5mWdjnBcuzvGIGcLtRgectNxd9471SPInkx
 SYk4sGC+IOTNy1qznbCkc4gqGXBhoJd1euUMGDJLqi4YI3AvJEJxwyB8q1zF+Q7zevklQRDRZ
 4jIZTLDwUXRa/iuV2eRtgbTfVzmBhCdVZ9Q/fblW6err2EpQYFXeqimh4mN0sBFfTpwOSqQ2c
 aPJR3qQtMOXJy60oLObQodse4Epxt8dx2Xa1Ddt4OOvyDAGpi0LPTpUCWW3zuJt00Zaqpy+d2
 zzR9Gr0vYMyO67u7tVdknjx7baoh6D5fbU4C8GwmF/0fIzxpbqReIjMVGcPqF3FVU+0UdYK/0
 FwRHuIrxNiLnf5f20wEPxAkRyyw7Fyr82PoqEk3Zct/VGMrPqYqwJg+7DrnmAqGn1Qq8eUvcn
 HpRDqNulF/4tZQK8TYcrznxZGq/jir+/T5gl5orkntQApYiXQSybE3pp7F2PiZIUk3cGmCIHU
 K1i61YdL9F7BEpK0yb5kQw30ABTl9TkmyHs5KTFkhWCLz6aeY+y4B3kmKPafQd9YoVSI=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.057,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 05/01/2022 à 05:18, Tonis Tiigi a écrit :
> These syscalls are not exposed by glibc. The struct type need to be
> redefined as it can't be included directly before
> https://lkml.org/lkml/2020/5/28/810 .
> 
> sched_attr type can grow in future kernel versions. When client sends
> values that QEMU does not understand it will return E2BIG with same
> semantics as old kernel would so client can retry with smaller inputs.
> 
> Signed-off-by: Tonis Tiigi <tonistiigi@gmail.com>
> ---
>   linux-user/syscall.c      | 123 ++++++++++++++++++++++++++++++++++++++
>   linux-user/syscall_defs.h |  14 +++++
>   2 files changed, 137 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 56a3e17183..1b8415c8a3 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -340,6 +340,25 @@ _syscall3(int, sys_sched_getaffinity, pid_t, pid, unsigned int, len,
>   #define __NR_sys_sched_setaffinity __NR_sched_setaffinity
>   _syscall3(int, sys_sched_setaffinity, pid_t, pid, unsigned int, len,
>             unsigned long *, user_mask_ptr);
> +/* sched_attr is not defined in glibc */
> +struct sched_attr {
> +    uint32_t size;
> +    uint32_t sched_policy;
> +    uint64_t sched_flags;
> +    int32_t sched_nice;
> +    uint32_t sched_priority;
> +    uint64_t sched_runtime;
> +    uint64_t sched_deadline;
> +    uint64_t sched_period;
> +    uint32_t sched_util_min;
> +    uint32_t sched_util_max;
> +};
> +#define __NR_sys_sched_getattr __NR_sched_getattr
> +_syscall4(int, sys_sched_getattr, pid_t, pid, struct sched_attr *, attr,
> +          unsigned int, size, unsigned int, flags);
> +#define __NR_sys_sched_setattr __NR_sched_setattr
> +_syscall3(int, sys_sched_setattr, pid_t, pid, struct sched_attr *, attr,
> +          unsigned int, flags);
>   #define __NR_sys_getcpu __NR_getcpu
>   _syscall3(int, sys_getcpu, unsigned *, cpu, unsigned *, node, void *, tcache);
>   _syscall4(int, reboot, int, magic1, int, magic2, unsigned int, cmd,
> @@ -558,6 +577,24 @@ const char *target_strerror(int err)
>       return strerror(target_to_host_errno(err));
>   }
>   
> +static int check_zeroed_user(abi_long addr, size_t ksize, size_t usize)
> +{
> +    int i;
> +    uint8_t b;
> +    if (usize <= ksize) {
> +        return 1;
> +    }
> +    for (i = ksize; i < usize; i++) {
> +        if (get_user_u8(b, addr + i)) {
> +            return -TARGET_EFAULT;
> +        }
> +        if (b != 0) {
> +            return 0;
> +        }
> +    }
> +    return 1;
> +}
> +
>   #define safe_syscall0(type, name) \
>   static type safe_##name(void) \
>   { \
> @@ -10594,6 +10631,92 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>           }
>       case TARGET_NR_sched_getscheduler:
>           return get_errno(sched_getscheduler(arg1));
> +    case TARGET_NR_sched_getattr:
> +        {
> +            struct target_sched_attr *target_scha;
> +            struct sched_attr scha;
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
> +                if (scha.size > offsetof(struct sched_attr, sched_util_min)) {
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
> +            struct sched_attr scha;
> +            uint32_t size;
> +            int zeroed;
> +            if (arg2 == 0) {
> +                return -TARGET_EINVAL;
> +            }
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
> +            zeroed = check_zeroed_user(arg2, sizeof(struct target_sched_attr), size);
> +            if (zeroed < 0) {
> +                return zeroed;
> +            } else if (zeroed == 0) {
> +                if (put_user_u32(sizeof(struct target_sched_attr), arg2)) {
> +                    return -TARGET_EFAULT;
> +                }
> +                return -TARGET_E2BIG;
> +            }
> +            if (size > sizeof(struct target_sched_attr)) {
> +                size = sizeof(struct target_sched_attr);
> +            }
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

Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent


