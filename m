Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8950B47A17A
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 18:14:47 +0100 (CET)
Received: from localhost ([::1]:56728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myzlk-0003qA-Dl
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 12:14:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1myzhW-00027U-HY
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 12:10:27 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:58571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1myzhC-0005tD-Mt
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 12:10:08 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MMWgb-1nEajl1ulD-00JcJ7; Sun, 19 Dec 2021 18:09:54 +0100
Message-ID: <53d1b2c6-b04c-4bce-4bc9-0c74dc370ae9@vivier.eu>
Date: Sun, 19 Dec 2021 18:09:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: fr
To: Tonis Tiigi <tonistiigi@gmail.com>, qemu-devel@nongnu.org
References: <20211211022749.95384-1-tonistiigi@gmail.com>
 <20211211022749.95384-2-tonistiigi@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH 1/2] linux-user: add sched_getattr support
In-Reply-To: <20211211022749.95384-2-tonistiigi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:XSS/gOpFEFZn1PvhyOGYUVqtI+q577TTRQIh5hNrGQq6B7iFKUb
 Ni76WGxRj9J5VgImQpUh9MBaYGtSL9cj+rb6/tGHLMWXWqUoUKi+yULyeyOwFgfzQnwx8nu
 rEw5+Eu16GEYR3c5ppjWrs5DrCfdjJI2Eht59aVDq8MLpnkTmgTplVVPIfTPmH/ICb1kEgk
 b932E8eLXiiunrQSJZGPg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Urhj8wwNEcY=:tLLIxpk5KbcIOTzMuJOnV/
 eTUG93lZZl83DTriHIbR1P8wGlBrcFlVa1PZTyNQ7fwJ4xo4PgOcgnoWoOkGr4PljYij7hesB
 Ii9QgdCjt61MaKepgZGDl4darH3scTq1sNVl6/j9dN9y+CqWTKSAvTvfRTKGNUloyyFggvzYa
 mXb7JE9CyzVn5mqoIjGeb1dEJlpL6ux02NGLW+VKOfqGUuVcf1yt1y+g5N+zoC5Lt3W3/7qkh
 gmgHmKAAFQBIZJKaOpxucKwmI2ySAkeCgS6vPWapIVcZnCNdG3XTOP1Q7uoEswRExNvoIumra
 En2uOCNNHaHd1K+bArco4KbO3Cl1bblDVuZnzRktWzOHJypkv7gtY9i8xSkvfum+7H/EwfiHP
 E55M4UDHa6mE0pV+pguP5EUYCkP9kH/D3lZloBlJg7OromuZPke6TgjguN5c3PIXBQNUrvVtW
 rLdGxJ+snQj0Ded/21uv42rirafqwX/c5hSyVUOr+nBWoEng8MWhlehRYD7XGiBrHOxOYf4Cd
 3gxTiNpMekDQPPmXCxtFUocaR7rro4Bnj/84HAULcYB1326l1s3hbKpBID6AENe13nN7chXPf
 +640zOI8aSlJcYewnysc2vSwm+4rH3dWEk/tnNNNYy26/WT/2QOLR0xAb6aJfidkWJPg4PrIf
 aXzhWM0CjNjKPaHMBXrCzQuJ/j4RYGNozIJ6z6bSEDzu3WE5tNxQAqvjCiFVGzCR2MVY=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.563,
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

Le 11/12/2021 à 03:27, Tonis Tiigi a écrit :
> Signed-off-by: Tonis Tiigi <tonistiigi@gmail.com>
> ---
>   linux-user/syscall.c      | 55 +++++++++++++++++++++++++++++++++++++++
>   linux-user/syscall_defs.h | 15 +++++++++++
>   2 files changed, 70 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index f1cfcc8104..670b61b2ef 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -339,6 +339,10 @@ _syscall3(int, sys_sched_getaffinity, pid_t, pid, unsigned int, len,
>   #define __NR_sys_sched_setaffinity __NR_sched_setaffinity
>   _syscall3(int, sys_sched_setaffinity, pid_t, pid, unsigned int, len,
>             unsigned long *, user_mask_ptr);
> +#define __NR_sys_sched_getattr __NR_sched_getattr
> +_syscall4(int, sys_sched_getattr, pid_t, pid, struct sched_attr *, attr, unsigned int, size, unsigned int, flags);
> +#define __NR_sys_sched_setattr __NR_sched_setattr
> +_syscall3(int, sys_sched_setattr, pid_t, pid, struct sched_attr *, attr, unsigned int, flags);
>   #define __NR_sys_getcpu __NR_getcpu
>   _syscall3(int, sys_getcpu, unsigned *, cpu, unsigned *, node, void *, tcache);
>   _syscall4(int, reboot, int, magic1, int, magic2, unsigned int, cmd,
> @@ -10593,6 +10597,57 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
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


> +            ret = get_errno(sys_sched_getattr(arg1, &scha, arg3, arg4));
> +            if (!is_error(ret)) {
> +                if (!lock_user_struct(VERIFY_WRITE, target_scha, arg2, 0))

As sizeof(target_scha) can be greater than arg3, you should user lock_user() with arg3 as length.

> +                    return -TARGET_EFAULT;

QEMU style uses braces {} even for one line statement.

You can run scripts/checkpath.pl to check the style


> +                target_scha->size = tswap32(scha.size);
> +                target_scha->sched_policy = tswap32(scha.sched_policy);
> +                target_scha->sched_flags = tswap64(scha.sched_policy);
> +                target_scha->sched_nice = tswap32(scha.sched_nice);
> +                target_scha->sched_priority = tswap32(scha.sched_priority);
> +                target_scha->sched_runtime = tswap64(scha.sched_runtime);
> +                target_scha->sched_deadline = tswap64(scha.sched_deadline);
> +                target_scha->sched_period = tswap64(scha.sched_period);
> +                if (scha.size >= 0x38) {

You should use offsetot(target_sched_attr, sched_util_min) rather than 0x38.


> +                    target_scha->sched_util_min = tswap32(scha.sched_util_min);
> +                    target_scha->sched_util_max = tswap32(scha.sched_util_max);
> +                }
> +                unlock_user_struct(target_scha, arg2, 1);
> +            }
> +            return ret;
> +        }
> +    case TARGET_NR_sched_setattr:
> +        {
> +            struct target_sched_attr *target_scha;
> +            struct target_sched_attr scha;
> +            if (arg2 == 0) {
> +                return -TARGET_EINVAL;
> +            }
> +            if (!lock_user_struct(VERIFY_READ, target_scha, arg2, 1))
> +                return -TARGET_EFAULT;

same comment

> +            scha.size = tswap32(target_scha->size);
> +            scha.sched_policy = tswap32(target_scha->sched_policy);
> +            scha.sched_flags = tswap64(target_scha->sched_flags);
> +            scha.sched_nice = tswap32(target_scha->sched_nice);
> +            scha.sched_priority = tswap32(target_scha->sched_priority);
> +            scha.sched_runtime = tswap64(target_scha->sched_runtime);
> +            scha.sched_deadline = tswap64(target_scha->sched_deadline);
> +            scha.sched_period = tswap64(target_scha->sched_period);
> +            if (scha.size >= 0x38) {

same comment

> +                scha.sched_util_min = tswap32(target_scha->sched_util_min);
> +                scha.sched_util_max = tswap32(target_scha->sched_util_max);
> +            }
> +            unlock_user_struct(target_scha, arg2, 0);
> +            return get_errno(sys_sched_setattr(arg1, &scha, arg3));
> +        }
>       case TARGET_NR_sched_yield:
>           return get_errno(sched_yield());
>       case TARGET_NR_sched_get_priority_max:
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index 0b13975937..715ec75462 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -2914,4 +2914,19 @@ struct target_statx {
>      /* 0x100 */
>   };
>   
> +/* from kernel's include/linux/sched/types.h */
> +struct target_sched_attr {
> +    uint32_t size;
> +    uint32_t sched_policy;
> +    uint64_t sched_flags;
> +    int32_t sched_nice;
> +    uint32_t sched_priority;
> +    uint64_t sched_runtime;
> +    uint64_t sched_deadline;
> +    uint64_t sched_period;
> +    // 0x30

Remove this comment

> +    uint32_t sched_util_min;
> +    uint32_t sched_util_max;
> +};
> +

Please, use abi_uint, abit_int, abi_ullong rather than uint32_t, int32_t and uint64_t.
These types forces alignment according to the target type.
	
Thanks,
Laurent


