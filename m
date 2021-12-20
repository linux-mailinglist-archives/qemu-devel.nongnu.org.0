Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBD947B2D6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 19:28:53 +0100 (CET)
Received: from localhost ([::1]:36806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzNP2-0007hI-CG
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 13:28:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mzKql-00020q-IE
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:45:20 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:59673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mzKqV-000215-3g
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:45:12 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MWRi7-1mxnv504tP-00Xwv6; Mon, 20 Dec 2021 12:28:36 +0100
Message-ID: <9ea0a231-3175-2dec-4f5a-9d5dbe418f7d@vivier.eu>
Date: Mon, 20 Dec 2021 12:28:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: fr
To: Tonis Tiigi <tonistiigi@gmail.com>, qemu-devel@nongnu.org
References: <20211220072105.48860-1-tonistiigi@gmail.com>
 <20211220072105.48860-2-tonistiigi@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2 1/2] linux-user: add sched_getattr support
In-Reply-To: <20211220072105.48860-2-tonistiigi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0TDFYbNgNw8EP4rsfc1yaIkSlzsx8QvRHKmE8A+HbwEY/nc0hEZ
 LhH3wp4R0LxryNEhWTfUDiFR4pqy+Kzh8/FgqZX1zWgmDPUg/+gnBFndvStJ1ba8dZi85gg
 FWI5/Uz1IK0HP7EeljmwcmVvO+8Iptx77KdYUB551F1oJ8qk9jpRIO9XTIYghLfQYmn9APa
 heAaOiHDsgL4s1DWi4QOg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4yg6UZUHIg8=:f6uB2gMJtuZoO+BWf2Fq8H
 RoESzcK0AxJgeENxmHbrFuDIAGc6GYSs4H14U6esszx8XmbgGFn7nCcScNaauENJEEVW9aMuF
 UTH6EHvau89m3xm6MG0zsltU5QxWczzWOSp1oJErQC4+heBAfq0yY24phbK6AQCXrzW9GLsk+
 fppOjiFC7Z00fwj8XwaKPU31AK90u9aGEQRUpyH39o4CFez0f1OOcZJmWEUecVEhsB8k7X5lm
 xFakkHVwk/td+8Hfi85UzAR7aTQdQHIVDCBv4ADHE4PQxhc3bFiIetcCP8sVsIqpnolY87WXr
 Q/Gk4tLpnALmRcSykbBTAZ193+TaU0wEm2gSi+ml7dXm3Um0+53wgplIGsPrO9z8ro7+fML3n
 MQK//PCqf1v3ZafrKOP+cARtUsOT1Apdd+ksJ0Exgdob8/A+aTwf+Ak9iAY8qhuG65T6Xa9LQ
 4wPl+jhbaQAOlx5tE8GWOrkvChhkfOoqQb+KYvgdX7reBQWIcXzFyJjUsw6glJZ27pmIyFdii
 DOYrc26JkRfaFwunPShJCmvekANPT4kRfPNLlFPhyHL59dQMuNH0SJVdHrmUu2z0n1FMkai8f
 3nuDevvIws96HzLczp3/8ziToPSXNzDWXfQ18TBBjZxCHBRXJ76jjhUJY+u5Xv6NPAvD6jzyb
 wtKdrASL/d0ZTZjHeDylBFh1etS5CzQHe6+oYqKG8nSrLJNrebNAMQDWoQoNS9ZG1Yqc=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.608,
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

Le 20/12/2021 à 08:21, Tonis Tiigi a écrit :
> Signed-off-by: Tonis Tiigi <tonistiigi@gmail.com>
> ---
>   linux-user/syscall.c      | 72 +++++++++++++++++++++++++++++++++++++++
>   linux-user/syscall_defs.h | 14 ++++++++
>   2 files changed, 86 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index f1cfcc8104..a447ce1f92 100644
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
> @@ -10593,6 +10599,72 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>           }
>       case TARGET_NR_sched_getscheduler:
>           return get_errno(sched_getscheduler(arg1));
> +    case TARGET_NR_sched_getattr:
> +        {
> +            struct target_sched_attr *target_scha;
> +            struct target_sched_attr scha;
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
> +                target_scha->sched_flags = tswap64(scha.sched_policy);

wrong cut@paste: it's not sched_policy here.

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
> +            uint32_t *size;
> +            if (arg2 == 0) {
> +                return -TARGET_EINVAL;
> +            }
> +
> +            if (!lock_user_struct(VERIFY_READ, size, arg2, 1)) {
> +                return -TARGET_EFAULT;
> +            }
> +            unlock_user_struct(size, arg2, 0);
> +            *size = tswap32(*size);

You should use get_user_u32() to do that.

But you should also check it's not 0 like in the kernel function sched_copy_attr():

         /* ABI compatibility quirk: */
         if (!size)
                 size = SCHED_ATTR_SIZE_VER0;
         if (size < SCHED_ATTR_SIZE_VER0 || size > PAGE_SIZE)
                 goto err_size;

(Note: I don't think we need to check for the PAGE_SIZE).


Thanks,
Laurent

