Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B278D6152A7
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 21:03:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opxRq-0000WZ-3U; Tue, 01 Nov 2022 16:01:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1opxRn-0000Vp-Dt
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 16:01:19 -0400
Received: from mout.kundenserver.de ([212.227.126.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1opxRl-0000hr-Fa
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 16:01:19 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N2Dgk-1p2dU93y8c-013fZt; Tue, 01 Nov 2022 21:01:12 +0100
Message-ID: <01e85f0c-2dbc-7ebe-793a-c05818b8ce8c@vivier.eu>
Date: Tue, 1 Nov 2022 21:01:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: fr
To: Drew DeVault <sir@cmpwn.com>, qemu-devel@nongnu.org
References: <20221031084030.2125288-1-sir@cmpwn.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] linux-user: implement execveat
In-Reply-To: <20221031084030.2125288-1-sir@cmpwn.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:pMB+pqC9RX5U8ka43AfM0Sx8DiIfJFhENZ8QXIIddDCTT9Szx3N
 HqucVj4Yvx8CfxEAPdb3ygNDst32d9yBqsuQX4O7JqUry9uYX/UsKi2D3DEg+k7GsGYrt5X
 7S0VMk0pafnA+TnxtZSvpe3FAH7RBVZOjMbtWPh34dQbFwbtdIasnvn++v/zwE0sFvklo5A
 +UF4tD+qYtpp8prN5SCtw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wVRGKlDy+lA=:Ib8SLPAlaJN6I4pOu0i2sE
 CqraJ61cd7PYjnbQ0/RfDA3btgi3mEbPimNiUcK1P+LG9t1ttIFawA8D9V6S3E1B1x0NlAZtE
 +u+l+WVuOke3zlljI2jDDbrpvXqTB28VHK9FEpXS9Woof1LaLJiUZpiEa2amDH3S8n+UkCQi5
 4zGnbSkdm8OzxJzVIG4dmdRv+aU6mn4LKEAIV8WUTD+UuUY1CAyzSo3eVRY77CQtKy+4SGIEZ
 Q7ZGfe8W6SggC2kFMbnKU43Z507mgQKxqUfhm3ISQlxMg+SgyyU1quZRojiFipFdcW0F5z9nb
 eh1u6YiJ+rtbioCbN/TuFTPfEk4IEXm+lmvtK7gBkhBv+YUk7lY9ikUTZO2pMQaFJXjBPnwR+
 2npoYcy3imX//LWmkDoe/cyvQg8w0oNWc8B9Zky9qYexBkdT4kaQttMLflIrK0HQOCCt4tMix
 lZdRcG/U3v9oNpUz/bdD/JF/7QvPTTyf7p4uIrkpdQFrPyDKaVc4xvdd4D8N9NpKqcNxbBNqz
 7aO9pGMttgxQeNmll4Z9CUuncYetPt7s4WoHEyQREtm0Yw3MXCS1TQLo3meM7/aANdKA4tpmF
 ceGseirCvik9cjeuBYD2gdXLCrFGoMv+lk+Kr2y0Ih+ftFfIsKqpaIHojZU9BAMPoUY5rbcJo
 pnsDZkzO1mINb8Gc3qa7QS6JUriywjgXItTAOh7D8mgC18/yjPVsJCTGH0MHXWS/9y74wH8Hj
 vlcF2H4tvRthKyGgMlsNRS2U3w3yo3GjbYd76zptEdpE84F5xaCsYLCZnM7zs8qzX5F8gW2gG
 mMuCjvk
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 31/10/2022 à 09:40, Drew DeVault a écrit :
> References: https://gitlab.com/qemu-project/qemu/-/issues/1007
> Signed-off-by: Drew DeVault <sir@cmpwn.com>
> ---
>   linux-user/syscall.c | 50 ++++++++++++++++++++++++++++++++++++++------
>   1 file changed, 44 insertions(+), 6 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index f55cdebee5..795f7ce4cd 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -634,6 +634,10 @@ safe_syscall4(pid_t, wait4, pid_t, pid, int *, status, int, options, \
>   safe_syscall5(int, waitid, idtype_t, idtype, id_t, id, siginfo_t *, infop, \
>                 int, options, struct rusage *, rusage)
>   safe_syscall3(int, execve, const char *, filename, char **, argv, char **, envp)
> +#if defined(TARGET_NR_execveat)
> +safe_syscall5(int, execveat, int, dirfd, const char *, filename,
> +        char **, argv, char **, envp, int, flags)
> +#endif
>   #if defined(TARGET_NR_select) || defined(TARGET_NR__newselect) || \
>       defined(TARGET_NR_pselect6) || defined(TARGET_NR_pselect6_time64)
>   safe_syscall6(int, pselect6, int, nfds, fd_set *, readfds, fd_set *, writefds, \
> @@ -8748,19 +8752,45 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>           ret = get_errno(unlinkat(arg1, p, arg3));
>           unlock_user(p, arg2, 0);
>           return ret;
> +#endif
> +#if defined(TARGET_NR_execveat)
> +    case TARGET_NR_execveat:
>   #endif
>       case TARGET_NR_execve:
>           {
>               char **argp, **envp;
> -            int argc, envc;
> +            int argc, envc, dirfd, flags;
>               abi_ulong gp;
>               abi_ulong guest_argp;
>               abi_ulong guest_envp;
>               abi_ulong addr;
> +            abi_long path;
>               char **q;
>   
>               argc = 0;
> -            guest_argp = arg2;
> +
> +            switch (num) {
> +            case TARGET_NR_execve:
> +                path = arg1;
> +                guest_argp = arg2;
> +                guest_envp = arg3;
> +                dirfd = AT_FDCWD;
> +                flags = 0;
> +                break;
> +#if defined(TARGET_NR_execveat)
> +            case TARGET_NR_execveat:
> +                dirfd = arg1;
> +                path = arg2;
> +                guest_argp = arg3;
> +                guest_envp = arg4;
> +                flags = arg5;
> +                break;
> +#endif
> +            default:
> +                // squelch uninitialized variable warnings
> +                abort();
> +            }
> +
>               for (gp = guest_argp; gp; gp += sizeof(abi_ulong)) {
>                   if (get_user_ual(addr, gp))
>                       return -TARGET_EFAULT;
> @@ -8769,7 +8799,6 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>                   argc++;
>               }
>               envc = 0;
> -            guest_envp = arg3;
>               for (gp = guest_envp; gp; gp += sizeof(abi_ulong)) {
>                   if (get_user_ual(addr, gp))
>                       return -TARGET_EFAULT;
> @@ -8803,7 +8832,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>               }
>               *q = NULL;
>   
> -            if (!(p = lock_user_string(arg1)))
> +            if (!(p = lock_user_string(path)))
>                   goto execve_efault;
>               /* Although execve() is not an interruptible syscall it is
>                * a special case where we must use the safe_syscall wrapper:
> @@ -8815,8 +8844,17 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>                * before the execve completes and makes it the other
>                * program's problem.
>                */
> -            ret = get_errno(safe_execve(p, argp, envp));
> -            unlock_user(p, arg1, 0);
> +            switch (num) {
> +            case TARGET_NR_execve:
> +                ret = get_errno(safe_execve(p, argp, envp));
> +                break;
> +#if defined(TARGET_NR_execveat)
> +            case TARGET_NR_execveat:
> +                ret = get_errno(safe_execveat(dirfd, p, argp, envp, flags));
> +                break;
> +#endif
> +            }
> +            unlock_user(p, path, 0);
>   
>               goto execve_end;
>   


I think it would be clearer to write a common function and to call it from execve and execveat, like 
it's in the kernel:

execve:

   do_execveat(AT_FDCWD, filename, argv, envp, 0);

execeveat:

   do_execveat(fd, filename, argv, envp, flags);

Thanks,
Laurent

