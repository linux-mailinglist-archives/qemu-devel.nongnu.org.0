Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D874850EA
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 11:16:52 +0100 (CET)
Received: from localhost ([::1]:36404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n53Le-0007dp-LG
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 05:16:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n53J7-0006We-21
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:14:13 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:34301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n53J4-0004JL-Tp
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:14:12 -0500
Received: from [192.168.100.1] ([82.142.30.62]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MLz3X-1mn6mU3jyT-00HzLs; Wed, 05 Jan 2022 11:14:08 +0100
Message-ID: <45a289b3-76aa-6d21-2750-85c505920bdc@vivier.eu>
Date: Wed, 5 Jan 2022 11:14:07 +0100
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
X-Provags-ID: V03:K1:Bei2i7i7vP+NXYciXYrMSQ8FfDOg4SC/GyV4WUZ7ZZi04+A2GjQ
 IUzg81H7ahZeDI7P+uOo9DYeN4zgBj8RiN+VanD706IsLid6w/OPIwF+Qn/3DigFfGltGzP
 YPRvd37lB1WWCNW0qKQSpSn/76dxzX1w2uvIZdO6j3CcHLNvne5T7e0K5VgxyhDxC6VRStY
 GAf3QUCaYjn+vNmZ4Lswg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fcIFO9iPd2o=:RhO6pj05Hj2n8dlIlnEHLG
 LQGkCVDusjr1Nhq6XaHWVrQyDKhVqFgl+e8q+wPdhGEe5H+yP84Uwl9Ro7q6thQbO9iGRMXFm
 Eun3nVFL7pV84kaN4TZRuKX86YOONsaWHF7iHWQz1lJzabOPKEUenhxqOqr+CgodQbGPc3Xmm
 u8/hVrgtZMAt0ng3zynrYpwBsdeM9yrlTY/ZHM5G65G7vP+nn9HPWcsGv1rgCSCq8G5f1lBKj
 V1iOmo0n9x21lMIsj/mc88CQ+AC6t71zNRqEe68d8Q3JyNl0N+UXIbYVMFBPHsojVqrM3R/Zh
 OzbBGaOFy4JAqGCen1cwScLGIT87ghUb2oDWxFRknJNpLFRZyVpx4iZgD5M9dyzcw2HHj5LPD
 up2LTCPlDewt6d9SECpS4OuZ5zVzCsAphawkaEfiqkaoxhdgb3H/XErXxq8cSsIzcLgs29sGJ
 35QRPHdO2KzhamYkl0amM/cjj2tTPRpR+ugGJAojR5sIfVe93TC1IpXLuWNz2z+oLbl0m0WCL
 NzackO8qW76emEKnsYszBMROmUTp4KPNLlMAcIM9LB/YcNF0WSj3pdXLchdXtNhOC1UV5FWyK
 6XsLocE55+86KgH+FOal4DKyaipaUEEsn7azxsqJWTnVTaM1KBmuiZG//UOy5afcKHzSJhxf7
 fZ/NfJBnszurrsT1WrxjV3YmcTPGM17Eugt/LseTza40Q572s2oKpykElQLGZ2gEbWe8=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


