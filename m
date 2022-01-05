Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 639064850EF
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 11:17:37 +0100 (CET)
Received: from localhost ([::1]:37758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n53MO-000096-4a
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 05:17:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n53Jn-00074h-8S
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:14:55 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:52635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n53Jl-0004Ng-BN
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:14:54 -0500
Received: from [192.168.100.1] ([82.142.30.62]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N64JK-1mKtki0oPY-016NTU; Wed, 05 Jan 2022 11:14:44 +0100
Message-ID: <cfcb5a41-7c02-8d23-02fd-048fa80d065d@vivier.eu>
Date: Wed, 5 Jan 2022 11:14:43 +0100
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
X-Provags-ID: V03:K1:RCIM0ADWRrdkGQUxinLL77rYeuUrz/PKyBW8ilhJtIAQ3xAd0SV
 0PjGUSIq/sjaQysJOqJazPVuWun855hlmZWFpfuZkSb71vXFFoD/S//f2uvCf181Z6e7T6x
 eRFCcJXEe2nrwmaIXOjVLwiy96GAxAabI9kKqd2sbVDob8K7U4rGfJf6BDOv9EUALJJGd8y
 wqQE1XN3PsRKI6mv0A6kw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FnaHH9CQcN4=:OMjs4i1t0dk2pQhKChdFY4
 dZzXYUIzv/6Z0Yb8SmvYDuWSf7Cd9N0R6Sn80jKRZtbG5C0tSwKK4+qm72QWmbqlu/1yDGUyZ
 YC/N8RaB3LS8dJrwDi+qhizrPp51Y2AiFrAVj0yhdGBb66rxM0FbQv0Y3ZFcSg4h/EfBEQ1j2
 y2o0eQwB4ejjPVcFRMu0gjqjtLDpspK8+PyPLt+WhnWl+40sCYHpy15jppK1t8CCG59RwzroA
 OmOLVYTGi3PjgnSzaqqdnbFT/I3aQmimnarUzGb5Vt5QeYiLdC/m9/uvwxYL8TzhCITGKcFlQ
 f3quT9yLiBUR+kvGYRubVyN9cSneNTLyBko9OXG3WCk/wiOMs4mYJrOfl4JL7kg2fveFTGi2o
 oYyMRADseD4/TL7TgkkFm24tKbf11WLrKMpd+i80fJYU7UDWwJ1+YIy17Z8W7QFxGlsLjp+se
 Gfn3gj19Sxz9gODDD3wDt+JNWBH2LqrKt3F4VjqNHqRAPP1scXDdATUQLm1Nrf/22+CbURbz8
 ynwgbAymsReQ8dwkbKrQsEb4CBMO3gigBuJ+oObVHJQkMG0gRtO353uutOHj9xoqOje2WE43w
 mhPhtI1uHFXctuopB8/p3NrkUeFAWEJwf2fIF9KDCqaOycMrkGgtQ+Pz++RlJuXjNP8gEobHT
 B7h02/1hZ9xALsGYwiabKYp2xGAMqRhjUVr9e2zxNlHTPKo7iLFg3Y+ASnWydG1RkFs4=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.057,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


