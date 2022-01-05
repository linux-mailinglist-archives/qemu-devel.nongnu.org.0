Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B5B485107
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 11:20:13 +0100 (CET)
Received: from localhost ([::1]:41844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n53Ou-0002vv-FL
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 05:20:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n53LH-0000F5-Qz
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:16:30 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:58109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n53LC-0006JD-Hs
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:16:26 -0500
Received: from [192.168.100.1] ([82.142.30.62]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MTzOe-1mwhJw40lW-00R047; Wed, 05 Jan 2022 11:16:19 +0100
Message-ID: <71fe233b-2f4f-d06c-e1e2-8972326d846b@vivier.eu>
Date: Wed, 5 Jan 2022 11:16:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 2/2] linux-user: call set/getscheduler set/getparam
 directly
Content-Language: fr
To: Tonis Tiigi <tonistiigi@gmail.com>, qemu-devel@nongnu.org
References: <20220105041819.24160-1-tonistiigi@gmail.com>
 <20220105041819.24160-3-tonistiigi@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220105041819.24160-3-tonistiigi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Ci/Uaz81wMRy7mJC1tbjoEA6Kzo7ZSucZX8TwUTFo6Ye1GDOQAz
 ffkfwSpe194PnbfaKOLpYX8vn7PK9ormPoXZWKf2oNf7aqevZyNCzsFVKc5v2MuAe85HDyv
 9OVyGeuzs8aS4SB9faKq591bmSeD37iFCOIFXzqkGA5Fliyk5hq8NrioDxGAfKBPTdL8WPX
 oI6Da2n0gQsK9QhLJcIoQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DCQwFwmdfSo=:SUye/FpTEYmvp0ZxVV7rN/
 ZIi0wVk2cOugI5r4G9I1mgwoDGLPW2Ate8nny613UqWzGtDQoHbKPh65S73jP9+4lAWi4TXyE
 pyn6nZZNvtsQuJudyiQ8iYAzDFl6R8/HQBNCdCD2+RtkVmT1oBHkSvQPrLEhg8jKkU1wVjlg1
 y+SQlBuCiWoXqW8YlczHyFa+2H21k2nG9rni1HK5XQ32FIYRPK4zNzlP9BBe0d4Y+NXPnILKI
 yWVPktPCpP8NIBo66qRIsZAjTsk/o15XDkAqDzC/M/XPRIkt0ZdBxvQsXeGILpXsoiOBAJj0Y
 36ewdcOjJVJEdJfDfhiXfiYIv3Lnr2YDo7/gLgsGS4Iu0FpTf8mN9QJ6WuFUY4KxhSufG+BCz
 d7xHH7RL7PBTRBS1rJTKMXFeXrXvwl7YgsSqqe3aS45meyXhbQQzc4A9m6ZooxdC5PTLiDOwU
 grwhZhAgHMDIubLaX6SIw8/7Tnk6YhWnCpKjjf9nFtMya0O9pyceEpRl/tFYbGiZAiTLciOrd
 mc0RnajeSFVGC/hjIaLTe/VakSmUi3Ub90ynw9C75GUi+1Cr2H4Hd1uO8rbTIYQbdRyxVlfgo
 2GWa0g5imSa9o4uVDz1w++wrK+zNBct2iek+hX3BzUwDvP+1b7zZtZJJjZotRKbKvS7pNz1X7
 qY/uahdZK3Ljx3U27/q66UOm1/3PpgXJ+W7BxKaC2CWbfnfTduCJkiEYex7aRhiLOMnk=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.057,
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

Le 05/01/2022 à 05:18, Tonis Tiigi a écrit :
> There seems to be difference in syscall and libc definition of these
> methods and therefore musl does not implement them (1e21e78bf7). Call
> syscall directly to ensure the behavior of the libc of user application,
> not the libc that was used to build QEMU.
> 
> Signed-off-by: Tonis Tiigi <tonistiigi@gmail.com>
> ---
>   linux-user/syscall.c      | 34 ++++++++++++++++++++++++----------
>   linux-user/syscall_defs.h |  4 ++++
>   2 files changed, 28 insertions(+), 10 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 1b8415c8a3..30962155a6 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -359,6 +359,17 @@ _syscall4(int, sys_sched_getattr, pid_t, pid, struct sched_attr *, attr,
>   #define __NR_sys_sched_setattr __NR_sched_setattr
>   _syscall3(int, sys_sched_setattr, pid_t, pid, struct sched_attr *, attr,
>             unsigned int, flags);
> +#define __NR_sys_sched_getscheduler __NR_sched_getscheduler
> +_syscall1(int, sys_sched_getscheduler, pid_t, pid);
> +#define __NR_sys_sched_setscheduler __NR_sched_setscheduler
> +_syscall3(int, sys_sched_setscheduler, pid_t, pid, int, policy,
> +          const struct sched_param *, param);
> +#define __NR_sys_sched_getparam __NR_sched_getparam
> +_syscall2(int, sys_sched_getparam, pid_t, pid,
> +          struct sched_param *, param);
> +#define __NR_sys_sched_setparam __NR_sched_setparam
> +_syscall2(int, sys_sched_setparam, pid_t, pid,
> +          const struct sched_param *, param);
>   #define __NR_sys_getcpu __NR_getcpu
>   _syscall3(int, sys_getcpu, unsigned *, cpu, unsigned *, node, void *, tcache);
>   _syscall4(int, reboot, int, magic1, int, magic2, unsigned int, cmd,
> @@ -10587,30 +10598,32 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>           return ret;
>       case TARGET_NR_sched_setparam:
>           {
> -            struct sched_param *target_schp;
> +            struct target_sched_param *target_schp;
>               struct sched_param schp;
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
> +            struct target_sched_param *target_schp;
>               struct sched_param schp;
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
> @@ -10618,19 +10631,20 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>           return ret;
>       case TARGET_NR_sched_setscheduler:
>           {
> -            struct sched_param *target_schp;
> +            struct target_sched_param *target_schp;
>               struct sched_param schp;
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

Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent


