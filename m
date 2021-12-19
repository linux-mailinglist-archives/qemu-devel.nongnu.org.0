Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D00E47A181
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 18:23:46 +0100 (CET)
Received: from localhost ([::1]:40802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myzuR-00042Q-BV
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 12:23:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1myzqR-0000gK-2C
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 12:19:35 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:36895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1myzqK-00077x-Ii
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 12:19:34 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M734j-1mqUBW28Cd-008bfU; Sun, 19 Dec 2021 18:19:25 +0100
Message-ID: <0070d188-0c31-4537-1993-3aa0f31f7c46@vivier.eu>
Date: Sun, 19 Dec 2021 18:19:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/2] linux-user: call set/getscheduler set/getparam
 directly
Content-Language: fr
To: Tonis Tiigi <tonistiigi@gmail.com>, qemu-devel@nongnu.org
References: <20211211022749.95384-1-tonistiigi@gmail.com>
 <20211211022749.95384-3-tonistiigi@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211211022749.95384-3-tonistiigi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BannKL3FfKy0g5eRIccZpdvBmLAlTYkCZCbnEYjAYjyYh2ygxdN
 BRb5Jej9w6bletQ/tAV1eHU+VzASI5S6SZ7YjS3LwoVlEVl8hfKkyyb/yEBDRwuKdSCJIK2
 KsaNnPsK+Nqr9UMKnqbpumna5W91XAjmsjMyNJ+SwBDGBlf4lMji+r5vSaEr94ZXQCk9RTW
 i5dga3XJIDhJrGH9q3KDQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fZD/f8t3lC8=:SJmLvAxKRBK6SL/jJKzPd6
 7Cya3KDRP9ihEbnjm2vHxWyYHJVc+LDul2TY4Y+mtoA7K4EL7837Wpf454fHnXuvFostgwxHP
 nPB8i/R2UdQC/YqIb4U1eVrxqFfwHjtiW7NZoxY+iyiTywyU2JuPivSzc4Dl2hgIY5yw11ahC
 Aff097RfAwuzX6Vv6dA0ERnaz2HKNnYFZa5WlTjcU4YffaETZubTrksYQU0g5IpiqXB0da8yT
 pghVMduW30g2kK3MmHPtXU0vKjyUwoS9UF+5HSpgo7DCcesdFE1Lvk7T+Iun+iKr3jSdoTVEi
 qMx6f71Om4wD3CYvMpILuFaxabQ9FqVbG0YaMy5mBKv1afzZn3GVbn7Y8pzC1ADgHO9PJ3Ny/
 9BmhtGgYfGbS71zkxzlYF5EnkOUWT5WsEpyEjDDgE6Br1iWVLdQuOnHWwW3xS/sHeaf7iwMRt
 QffCv3TKpKbJDl2jGjYehofsEHWrlAlBcDMrkxYu7AzBabm9jBBUm4rcRvvYhwGhqK5eNQ10Y
 qpAVwfZzHdRhFq+t8vEKjMbFe8Pb2xP1RGJjKqKsaNELUbNVWAhmU7KLouoneEOYe37tJIstQ
 o80F7ou2Gav2n684dzeziJnksY9ldcoAa+bOaiUGXsdCRjkJZakEFtztHW8yJP/KI0Ik7tIWH
 kRKImHvaF5ujq/LsFKtiLMnS8O7p3tUkSaJtL9hh5A7TERg7uMclc+mofIxpnIHmPBew=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.563,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

Le 11/12/2021 à 03:27, Tonis Tiigi a écrit :
> There seems to be difference in syscall and libc definition of these
> methods and therefore musl does not implement them (1e21e78bf7). Call
> syscall directly to ensure the behavior of the libc of user application,
> not the libc that was used to build QEMU.
> 
> Signed-off-by: Tonis Tiigi <tonistiigi@gmail.com>
> ---
>   linux-user/syscall.c | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 670b61b2ef..263d7fac5e 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -343,6 +343,14 @@ _syscall3(int, sys_sched_setaffinity, pid_t, pid, unsigned int, len,
>   _syscall4(int, sys_sched_getattr, pid_t, pid, struct sched_attr *, attr, unsigned int, size, unsigned int, flags);
>   #define __NR_sys_sched_setattr __NR_sched_setattr
>   _syscall3(int, sys_sched_setattr, pid_t, pid, struct sched_attr *, attr, unsigned int, flags);
> +#define __NR_sys_sched_getscheduler __NR_sched_getscheduler
> +_syscall1(int, sys_sched_getscheduler, pid_t, pid);
> +#define __NR_sys_sched_setscheduler __NR_sched_setscheduler
> +_syscall3(int, sys_sched_setscheduler, pid_t, pid, int, policy, const struct sched_param *, param);
> +#define __NR_sys_sched_getparam __NR_sched_getparam
> +_syscall2(int, sys_sched_getparam, pid_t, pid, struct sched_param *, param);
> +#define __NR_sys_sched_setparam __NR_sched_setparam
> +_syscall2(int, sys_sched_setparam, pid_t, pid, const struct sched_param *, param);
>   #define __NR_sys_getcpu __NR_getcpu
>   _syscall3(int, sys_getcpu, unsigned *, cpu, unsigned *, node, void *, tcache);
>   _syscall4(int, reboot, int, magic1, int, magic2, unsigned int, cmd,
> @@ -10563,7 +10571,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>                   return -TARGET_EFAULT;
>               schp.sched_priority = tswap32(target_schp->sched_priority);
>               unlock_user_struct(target_schp, arg2, 0);
> -            return get_errno(sched_setparam(arg1, &schp));
> +            return get_errno(sys_sched_setparam(arg1, &schp));
>           }
>       case TARGET_NR_sched_getparam:
>           {
> @@ -10573,7 +10581,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>               if (arg2 == 0) {
>                   return -TARGET_EINVAL;
>               }
> -            ret = get_errno(sched_getparam(arg1, &schp));
> +            ret = get_errno(sys_sched_getparam(arg1, &schp));
>               if (!is_error(ret)) {
>                   if (!lock_user_struct(VERIFY_WRITE, target_schp, arg2, 0))
>                       return -TARGET_EFAULT;
> @@ -10593,10 +10601,10 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>                   return -TARGET_EFAULT;
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
> 

It looks good, but you need to introduce also target_sched_param using abi_int.

Thanks,
Laurent

