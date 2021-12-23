Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9C147E8D2
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 21:38:52 +0100 (CET)
Received: from localhost ([::1]:42058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0UrT-0005CA-F3
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 15:38:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n0Uq1-0003rn-5a
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 15:37:21 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:51631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n0Upy-0000CG-5d
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 15:37:19 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MplTn-1mfjnQ1mX7-00qAVW; Thu, 23 Dec 2021 21:37:13 +0100
Message-ID: <e62f2cbf-0f38-bfb8-a01c-03fa84de5fdd@vivier.eu>
Date: Thu, 23 Dec 2021 21:37:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 2/2] linux-user: call set/getscheduler set/getparam
 directly
Content-Language: fr
To: Tonis Tiigi <tonistiigi@gmail.com>, qemu-devel@nongnu.org
References: <20211223064728.18048-1-tonistiigi@gmail.com>
 <20211223064728.18048-3-tonistiigi@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211223064728.18048-3-tonistiigi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Je0krTGocf6RZw7mQr7Nn4Ns20qiL/jJ/B0YXmLFKT5lja6mJOH
 rbgAa5vxupubTsfGx9Bg/GTi+mcXUzlvRgyQQOxZDTMghpLVVX8sFt+mBAuIAeAj5hu9Qnh
 fz8TQ714TcRUr9Nzv2cfjCgQyLF27JLQVL1ZM+bkUsBF9bZP/c/oRPx2tDAWHS0Em3Uvy2g
 ZXBRMuLWLWiWg31nDBwsA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ahbp7xRLguk=:+eMdQMvgwKWqQyhdTrBTs0
 WoyXEdCBOpJDeQ388lajdEpb/tac7xp1+Droy8PcpFOOQunWRU9nWv92zxDThGslikE1Cavip
 2m1JmEIo6xhEDX0gclbehljLwzEiKTodz7A7W/9qwLYU5aYXLe+0RWBB7hF2UHJB7yR8Grudw
 vheuGeToMT0nEMbhIfeRxX6RszuFvY6R5qxOgftiQ6Tfl3L/EdhmJaFzO+yxiS3FguDph2JvJ
 xH3Nbqahqy16wbStSOLRwT4iA08dBXiaSKNasZayHniUW7Ox+/VQHnXIoOzTr2p+QY3yH0tZF
 faMDKNgXz1i8pQLI8cwdy1gc7jEkbNMmq9ilLWstTr6q/PIGwMWs+r4vQWjTXKwWmj/YRW9w9
 ea4/iCFhRoAQ8jAVDpyPbwknD3gXman8qYkebqbLPbxYecU3yBGh3jaZ1Ug2CXmc2YGC2B1hE
 iwmsms3D0moaNglE0tyBoI1KRBV4fEIzhJus4lq+Vq9AlKcC2aJTE+Ok/wm8h3FrdCo3I0oYQ
 NY24hINPBk1tq/DsYDh2uDf9ctLYtgpXdruNjdcsX9i9YGnvx0qY66a77bccoe8rboupkPjWv
 NTc6txts8TmzRiBYDRLVYqiEeFffvaRr5HQMf3UUMrE72x+IZ0mvxb3L77UFLdMy9mKplBJe/
 IyogtqXDMne8bgHZYeLvCdjcp2opA5uG0KbkXEXi/K6Vat1nfhSxV+BvxX2zNjkeGcgM=
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
> There seems to be difference in syscall and libc definition of these
> methods and therefore musl does not implement them (1e21e78bf7). Call
> syscall directly to ensure the behavior of the libc of user application,
> not the libc that was used to build QEMU.
> 
> Signed-off-by: Tonis Tiigi <tonistiigi@gmail.com>
> ---
>   linux-user/syscall.c      | 40 ++++++++++++++++++++++++++-------------
>   linux-user/syscall_defs.h |  4 ++++
>   2 files changed, 31 insertions(+), 13 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 2f5a0fac5a..8c03a52a36 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -345,6 +345,17 @@ _syscall4(int, sys_sched_getattr, pid_t, pid, struct target_sched_attr *, attr,
>   #define __NR_sys_sched_setattr __NR_sched_setattr
>   _syscall3(int, sys_sched_setattr, pid_t, pid, struct target_sched_attr *, attr,
>             unsigned int, flags);
> +#define __NR_sys_sched_getscheduler __NR_sched_getscheduler
> +_syscall1(int, sys_sched_getscheduler, pid_t, pid);
> +#define __NR_sys_sched_setscheduler __NR_sched_setscheduler
> +_syscall3(int, sys_sched_setscheduler, pid_t, pid, int, policy,
> +          const struct target_sched_param *, param);
> +#define __NR_sys_sched_getparam __NR_sched_getparam
> +_syscall2(int, sys_sched_getparam, pid_t, pid,
> +          struct target_sched_param *, param);
> +#define __NR_sys_sched_setparam __NR_sched_setparam
> +_syscall2(int, sys_sched_setparam, pid_t, pid,
> +          const struct target_sched_param *, param);
>   #define __NR_sys_getcpu __NR_getcpu
>   _syscall3(int, sys_getcpu, unsigned *, cpu, unsigned *, node, void *, tcache);
>   _syscall4(int, reboot, int, magic1, int, magic2, unsigned int, cmd,
> @@ -10555,30 +10566,32 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>           return ret;
>       case TARGET_NR_sched_setparam:
>           {
> -            struct sched_param *target_schp;
> -            struct sched_param schp;
> +            struct target_sched_param *target_schp;
> +            struct target_sched_param schp;

You need to keep sched_param for schp as it is used with host syscall.

>   
>               if (arg2 == 0) {
>                   return -TARGET_EINVAL;
>               }
> -            if (!lock_user_struct(VERIFY_READ, target_schp, arg2, 1))
> +            if (!lock_user_struct(VERIFY_READ, target_schp, arg2, 1)) {
>                   return -TARGET_EFAULT;
> +            }
>               schp.sched_priority = tswap32(target_schp->sched_priority);
>               unlock_user_struct(target_schp, arg2, 0);
> -            return get_errno(sched_setparam(arg1, &schp));
> +            return get_errno(sys_sched_setparam(arg1, &schp));
>           }
>       case TARGET_NR_sched_getparam:
>           {
> -            struct sched_param *target_schp;
> -            struct sched_param schp;
> +            struct target_sched_param *target_schp;
> +            struct target_sched_param schp;

You need to keep sched_param for schp as it is used with host syscall.

>   
>               if (arg2 == 0) {
>                   return -TARGET_EINVAL;
>               }
> -            ret = get_errno(sched_getparam(arg1, &schp));
> +            ret = get_errno(sys_sched_getparam(arg1, &schp));
>               if (!is_error(ret)) {
> -                if (!lock_user_struct(VERIFY_WRITE, target_schp, arg2, 0))
> +                if (!lock_user_struct(VERIFY_WRITE, target_schp, arg2, 0)) {
>                       return -TARGET_EFAULT;
> +                }
>                   target_schp->sched_priority = tswap32(schp.sched_priority);
>                   unlock_user_struct(target_schp, arg2, 1);
>               }
> @@ -10586,19 +10599,20 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>           return ret;
>       case TARGET_NR_sched_setscheduler:
>           {
> -            struct sched_param *target_schp;
> -            struct sched_param schp;
> +            struct target_sched_param *target_schp;
> +            struct target_sched_param schp;

You need to keep sched_param for schp as it is used with host syscall.

>               if (arg3 == 0) {
>                   return -TARGET_EINVAL;
>               }
> -            if (!lock_user_struct(VERIFY_READ, target_schp, arg3, 1))
> +            if (!lock_user_struct(VERIFY_READ, target_schp, arg3, 1)) {
>                   return -TARGET_EFAULT;
> +            }
>               schp.sched_priority = tswap32(target_schp->sched_priority);
>               unlock_user_struct(target_schp, arg3, 0);
> -            return get_errno(sched_setscheduler(arg1, arg2, &schp));
> +            return get_errno(sys_sched_setscheduler(arg1, arg2, &schp));
>           }
>       case TARGET_NR_sched_getscheduler:
> -        return get_errno(sched_getscheduler(arg1));
> +        return get_errno(sys_sched_getscheduler(arg1));
>       case TARGET_NR_sched_getattr:
>           {
>               struct target_sched_attr *target_scha;
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index 310d6ce8ad..28b9fe9a47 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -2928,4 +2928,8 @@ struct target_sched_attr {
>       abi_uint sched_util_max;
>   };
>   
> +struct target_sched_param {
> +    abi_int sched_priority;
> +};
> +
>   #endif

Sorry, I missed these problem in my previous review.

Thanks,
Laurent

