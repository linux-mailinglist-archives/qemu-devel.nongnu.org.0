Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5C86185E5
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 18:11:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqdkc-0004jd-1y; Thu, 03 Nov 2022 13:11:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oqdkY-0004Ty-GO
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 13:11:30 -0400
Received: from mout.kundenserver.de ([217.72.192.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oqdkW-0000bC-HY
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 13:11:30 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MHoZM-1omjSF160c-00Erco; Thu, 03 Nov 2022 18:11:25 +0100
Message-ID: <a4ed5f7f-6392-ff03-ac66-50a413cefd49@vivier.eu>
Date: Thu, 3 Nov 2022 18:11:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: fr
To: Drew DeVault <sir@cmpwn.com>
Cc: qemu-devel@nongnu.org
References: <20221103145719.3470738-1-sir@cmpwn.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2] linux-user: implement execveat
In-Reply-To: <20221103145719.3470738-1-sir@cmpwn.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:opzcGEvLQWjHW3XuvlaGch8FRr8331mcye6whlmAh3tgAKRpANP
 A7ZZkfnYhxPSpF7F25Sh0wYZHwJVIZvy2gUIIhRkMYSKDFydLlldtFwUtI0qMqAG9CG42rv
 bcEEOVXQCsD/RPIkuIYgltKWUr1VE6tkzbasVVAMx+4Wsh1iQgZ0mevw901eAHU9/fk7YVB
 kniDout2pgPEnvj9sM/Mg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:J2G0wYHbTDY=:Mf7kin4mc7Ng7kbv3a9VNS
 QV7pHHYk3dh4CThXFVuPoyaZdOtw1VHvP7E5azifmREvr+g2IM8JL/azxFgNPQrNWWaPO75/K
 plpo0Q/B/SaJb74PZNvHyGOnHBWHQPDYSKwE7d9oMPoE44tuDa13CBDjkkkycQribAaEGbZl2
 7mK9YhU6zh00ly9pcNj9OOi371kKRCO8gqqr1ezC7MvyAlEoJ1S63BkstQTebZsA1C3FTdUh8
 ZtTaBwccJXrel2dJj9Rn4fVUeWDhcAG6+J19JwG1zqNfB7DjmtqWeXAPXBu2DzrpLeOgv9aqB
 pz6bMDIv0jxA8bzzVkzwGPREfVTtH6rQyGaiUo9O0Z9VniP92k9AhZFJf+83hoU05Xt25ph8s
 wOtLKnE57vfvWgpNyPthik4AzPWsAuzScRQBOZXyGN4yXyo3FyRJ/XbY/5j8xrcc9j8fTKbFQ
 r4RkneaVRieYetnRkAathPpSUvUIRwNQgvPb/HUpNBSnUgl18r++8icbXz2REC6WPO381Flto
 PhOIuEc2h0SixUtF6qrc4eZzAE+9OqVPlWggO4QtunTZUXwzfcvPHJTMB0cbEPq2LPC7sLNLA
 U78dxrOsZwpadJtmOIpeVgQ0uHMtJmAPAf+cxIBYIT7EeXBWCyjdkLW2FZ9/sMdQTNqtrU9V1
 9awIOi3MntQPg3x0lE6gO/UUhPhgBNJBTrc1J5EEpPJeNpCl/9tkgbnPpByq89xN1DqFIqmjL
 ej1bYCpl5U3CFTa57ZsbHmlZRLlEH0jC3uzAyb+1+sr66+owtSLgrHsuEzL7mAYc5O2s5012Q
 YuOXpQ5
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Le 03/11/2022 à 15:57, Drew DeVault a écrit :
> References: https://gitlab.com/qemu-project/qemu/-/issues/1007
> Signed-off-by: Drew DeVault <sir@cmpwn.com>
> ---
>   linux-user/syscall.c | 204 +++++++++++++++++++++++--------------------
>   1 file changed, 111 insertions(+), 93 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index f55cdebee5..57f0b2f0e8 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -633,7 +633,12 @@ safe_syscall4(pid_t, wait4, pid_t, pid, int *, status, int, options, \
>   #endif
>   safe_syscall5(int, waitid, idtype_t, idtype, id_t, id, siginfo_t *, infop, \
>                 int, options, struct rusage *, rusage)
> +#if defined(TARGET_NR_execveat)

execveat has been introduced in kernel 3.19 and all target sycall tables have been updated to 5.13 
by 2fa4ad3f9000 and 3a2f19b7ee3a (except cris, stuck to 4.16), so I think you can remove the "#if 
defined()".

> +safe_syscall5(int, execveat, int, dirfd, const char *, filename,
> +        char **, argv, char **, envp, int, flags)
> +#else
>   safe_syscall3(int, execve, const char *, filename, char **, argv, char **, envp)
> +#endif
>   #if defined(TARGET_NR_select) || defined(TARGET_NR__newselect) || \
>       defined(TARGET_NR_pselect6) || defined(TARGET_NR_pselect6_time64)
>   safe_syscall6(int, pselect6, int, nfds, fd_set *, readfds, fd_set *, writefds, \
> @@ -8281,6 +8286,107 @@ static int do_openat(CPUArchState *cpu_env, int dirfd, const char *pathname, int
>       return safe_openat(dirfd, path(pathname), flags, mode);
>   }
>   
> +static int do_execveat(CPUArchState *cpu_env, int dirfd, abi_long pathname, abi_long guest_argp, abi_long guest_envp, int flags)
> +{
> +    int ret;
> +    char **argp, **envp;
> +    int argc, envc;
> +    abi_ulong gp;
> +    abi_ulong addr;
> +    char **q;
> +    void *p;
> +
> +    argc = 0;
> +
> +    for (gp = guest_argp; gp; gp += sizeof(abi_ulong)) {
> +        if (get_user_ual(addr, gp))
> +            return -TARGET_EFAULT;
> +        if (!addr)
> +            break;
> +        argc++;
> +    }
> +    envc = 0;
> +    for (gp = guest_envp; gp; gp += sizeof(abi_ulong)) {
> +        if (get_user_ual(addr, gp))
> +            return -TARGET_EFAULT;
> +        if (!addr)
> +            break;
> +        envc++;
> +    }
> +
> +    argp = g_new0(char *, argc + 1);
> +    envp = g_new0(char *, envc + 1);
> +
> +    for (gp = guest_argp, q = argp; gp;
> +          gp += sizeof(abi_ulong), q++) {
> +        if (get_user_ual(addr, gp))
> +            goto execve_efault;
> +        if (!addr)
> +            break;
> +        if (!(*q = lock_user_string(addr)))
> +            goto execve_efault;
> +    }
> +    *q = NULL;
> +
> +    for (gp = guest_envp, q = envp; gp;
> +          gp += sizeof(abi_ulong), q++) {
> +        if (get_user_ual(addr, gp))
> +            goto execve_efault;
> +        if (!addr)
> +            break;
> +        if (!(*q = lock_user_string(addr)))
> +            goto execve_efault;
> +    }
> +    *q = NULL;
> +
> +    /* Although execve() is not an interruptible syscall it is
> +     * a special case where we must use the safe_syscall wrapper:
> +     * if we allow a signal to happen before we make the host
> +     * syscall then we will 'lose' it, because at the point of
> +     * execve the process leaves QEMU's control. So we use the
> +     * safe syscall wrapper to ensure that we either take the
> +     * signal as a guest signal, or else it does not happen
> +     * before the execve completes and makes it the other
> +     * program's problem.
> +     */
> +    if (!(p = lock_user_string(pathname)))
> +        goto execve_efault;
> +
> +#if defined(TARGET_NR_execveat)
> +    ret = get_errno(safe_execveat(dirfd, p, argp, envp, flags));
> +#else
> +    assert(dirfd == AT_FDCWD && flags == 0);
> +    ret = get_errno(safe_execve(p, argp, envp));
> +#endif

You don't need the #ifdef, you can call execveat() in both cases, like the kernel.

You need to check for "is_proc_myself(p, "exe")" to manage the case fixed by
  f07eb1c4f805 ("linux-user: handle /proc/self/exe with execve() syscall")

Thanks,
Laurent

