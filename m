Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3721618916
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 20:56:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqgI7-0007bh-Do; Thu, 03 Nov 2022 15:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oqgI4-0007b2-Ot
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 15:54:16 -0400
Received: from mout.gmx.net ([212.227.17.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oqgI2-0000im-ID
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 15:54:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1667505246; bh=xaWkeHPp+Y+tD14u+tt3R/uisZYT4QjMqK2yynW3xak=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=tGR/yX4sXrYRc1yVk6lv4D7jEVCr0EepflCj9m9qs4Sku5PxKvZl1FB29oegP0VOW
 zW82LeWSNBWkYnwQlCwwMOKC99QMUwPPVZ4YR+B3Am+lBGLyi/1rH0Cbg7LMLhNnSW
 VuMcr7PK84BXnj3TAYrhgFahk7RkmoQHIe9eo1yqi0yu1OHYO1AstosRbqngOHdaMn
 IXcKA7A9VQT6i+HeKrUFGs83isi+N9v9fU4Gsv4WoZ/bzo4U3NTizqMqXus55iTqBr
 NWtWgMtt6efG9hUQNvfwDa5IfMFozgGzul3WhLBuGB42pTQrA7Nab/jBcDl0PH0yCu
 9y5Etjwifm+dA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.154.237]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MvbG2-1p7vzM03ug-00sdTd; Thu, 03
 Nov 2022 20:54:06 +0100
Message-ID: <9dfb3d48-9a8e-5560-9d8f-6d786962ab6e@gmx.de>
Date: Thu, 3 Nov 2022 20:54:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3] linux-user: implement execveat
Content-Language: en-US
To: Drew DeVault <sir@cmpwn.com>, Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org
References: <20221103173212.3724698-1-sir@cmpwn.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20221103173212.3724698-1-sir@cmpwn.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:84jXFOZXJa8LqMYUIEUi0p0istkc1eBE0/uKQYud3CTStTsJpY6
 lHGRHhOKgSV9/pUZDOupKMYcsEHm2nt/bRlNP65A1mH0uQnMnfhdVGMc5Fezf99/XcwdewL
 oAJe2K/RGCXcdEuML7jXPYFin9rBtMkHM9OFilQoRJ9Z5b8DpQQ2GIZ0qfNkhzoMweMyOlZ
 jmdRk4FWiFxK+JplvszYg==
UI-OutboundReport: notjunk:1;M01:P0:SuRWuFahvRo=;T+T8vOPFAm/Utwe+ANeRkLENVc7
 uZyODOKTSCW4xKoxw4hV2kX8qxizqcZtAztfMn5CR26mcZ9Q8IlBZkPkK64LsZ5dhO8lHgJex
 9Q0O3AUyXwYlqu1fPcC5gsvArDfBA+6VAHy6HfWvojsMGTe1+HfK8DGBtf9zg/Bwwk6DPOOoL
 M81qZgp5z0MHNH5pDUOFEZJH2/DeOaFJN+O6ws/wPhkczLErvcgdQUOSLJ7Kk+1cfgI7i2Nca
 h7wmDeBoSJRxfE501vuFdvJt8hQiprCv4m65L2b1GmNNZ2pHtD0x2y5rtPcauKVL2iWLWbV2U
 Y4Q1ozxLI6lpyMwCZk5djts6V93Qit6adxud/Fb+LbIMHy2tHN0PR8G0JXM2OxydTCcjXnSBv
 2OfiAaeTcqPXuKEyEazI7SA8pb63agkbXaoA69yVCwB4rxvbll7373hQAwkiZ/CMZA92GcYGG
 WQrfDUTkwmATuutHoxowGXaKidNFymJwGqmIl7ogpr1DCRqjPgaD2xbXWu/6Sy346RkC+nbSh
 8rg8ZbXoYAg4lGNiKwrXvHYbt42q/ozUzav98duT2BP3ziXC6qTVS7YwfNL87tHL7n8Qfi2Y2
 Ywf5zHVA+q2lvYt8fK6OE+2y/e2Hee/YCoCSezzJOTNgUxJAm82G/yhO3/NVU8pwHA/nycFXo
 xweq3ejqSblySwlun6JhFwKwLkVyYskUZmXBYxpeYAYifpcz5R6bLBxFiaSfcx7pxk8QFciv5
 +LYPhaseuXoOKPHxXDpu0D+1UZ7kHfjjZ91Xf3n9hifpHvpVUWYNb3umZjfI/ig2H9jc1iIwA
 fa/3SqFzLqSD6AGdGB/U+1x2gui/eWrmJvDfxFTZ8C3aZ2Qc3Vcsz5CVz3oeMHTas+6YGoFQR
 jtV2JKZjPYqAMNhZZUfmdmwnVygF5oHm+k0Nqo/Odp7KPOXpdA1j5ygPqCfRN2z6uTcXc0OD0
 BgFCwIUnMoA6gpTknrQgayw6MKA=
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/3/22 18:32, Drew DeVault wrote:
> References: https://gitlab.com/qemu-project/qemu/-/issues/1007
> Signed-off-by: Drew DeVault <sir@cmpwn.com>
> ---
> v2 =3D> v3:
> - Rebase to address the is_proc_myself fix
> - Drop the ifdefs
>
>   linux-user/syscall.c | 203 ++++++++++++++++++++++---------------------
>   1 file changed, 105 insertions(+), 98 deletions(-)


I'd suggest you add the missing strace part as well.
See in strace.list and compare what's done for execve.

Helge



>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 8402c1399d..38fbbbad6a 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -689,7 +689,8 @@ safe_syscall4(pid_t, wait4, pid_t, pid, int *, statu=
s, int, options, \
>   #endif
>   safe_syscall5(int, waitid, idtype_t, idtype, id_t, id, siginfo_t *, in=
fop, \
>                 int, options, struct rusage *, rusage)
> -safe_syscall3(int, execve, const char *, filename, char **, argv, char =
**, envp)
> +safe_syscall5(int, execveat, int, dirfd, const char *, filename,
> +        char **, argv, char **, envp, int, flags)
>   #if defined(TARGET_NR_select) || defined(TARGET_NR__newselect) || \
>       defined(TARGET_NR_pselect6) || defined(TARGET_NR_pselect6_time64)
>   safe_syscall6(int, pselect6, int, nfds, fd_set *, readfds, fd_set *, w=
ritefds, \
> @@ -8349,6 +8350,106 @@ static int do_openat(CPUArchState *cpu_env, int =
dirfd, const char *pathname, int
>       return safe_openat(dirfd, path(pathname), flags, mode);
>   }
>
> +static int do_execveat(CPUArchState *cpu_env, int dirfd, abi_long pathn=
ame, abi_long guest_argp, abi_long guest_envp, int flags)
> +{
> +    int ret;
> +    char **argp, **envp;
> +    int argc, envc;
> +    abi_ulong gp;
> +    abi_ulong addr;
> +    char **q;
> +    void *p;
> +
> +    argc =3D 0;
> +
> +    for (gp =3D guest_argp; gp; gp +=3D sizeof(abi_ulong)) {
> +        if (get_user_ual(addr, gp))
> +            return -TARGET_EFAULT;
> +        if (!addr)
> +            break;
> +        argc++;
> +    }
> +    envc =3D 0;
> +    for (gp =3D guest_envp; gp; gp +=3D sizeof(abi_ulong)) {
> +        if (get_user_ual(addr, gp))
> +            return -TARGET_EFAULT;
> +        if (!addr)
> +            break;
> +        envc++;
> +    }
> +
> +    argp =3D g_new0(char *, argc + 1);
> +    envp =3D g_new0(char *, envc + 1);
> +
> +    for (gp =3D guest_argp, q =3D argp; gp;
> +          gp +=3D sizeof(abi_ulong), q++) {
> +        if (get_user_ual(addr, gp))
> +            goto execve_efault;
> +        if (!addr)
> +            break;
> +        if (!(*q =3D lock_user_string(addr)))
> +            goto execve_efault;
> +    }
> +    *q =3D NULL;
> +
> +    for (gp =3D guest_envp, q =3D envp; gp;
> +          gp +=3D sizeof(abi_ulong), q++) {
> +        if (get_user_ual(addr, gp))
> +            goto execve_efault;
> +        if (!addr)
> +            break;
> +        if (!(*q =3D lock_user_string(addr)))
> +            goto execve_efault;
> +    }
> +    *q =3D NULL;
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
> +    if (!(p =3D lock_user_string(pathname)))
> +        goto execve_efault;
> +
> +    if (is_proc_myself(p, "exe")) {
> +        ret =3D get_errno(safe_execveat(dirfd, exec_path, argp, envp, f=
lags));
> +    } else {
> +        ret =3D get_errno(safe_execveat(dirfd, p, argp, envp, flags));
> +    }
> +
> +    unlock_user(p, pathname, 0);
> +
> +    goto execve_end;
> +
> +execve_efault:
> +    ret =3D -TARGET_EFAULT;
> +
> +execve_end:
> +    for (gp =3D guest_argp, q =3D argp; *q;
> +          gp +=3D sizeof(abi_ulong), q++) {
> +        if (get_user_ual(addr, gp)
> +            || !addr)
> +            break;
> +        unlock_user(*q, addr, 0);
> +    }
> +    for (gp =3D guest_envp, q =3D envp; *q;
> +          gp +=3D sizeof(abi_ulong), q++) {
> +        if (get_user_ual(addr, gp)
> +            || !addr)
> +            break;
> +        unlock_user(*q, addr, 0);
> +    }
> +
> +    g_free(argp);
> +    g_free(envp);
> +    return ret;
> +}
> +
>   #define TIMER_MAGIC 0x0caf0000
>   #define TIMER_MAGIC_MASK 0xffff0000
>
> @@ -8846,104 +8947,10 @@ static abi_long do_syscall1(CPUArchState *cpu_e=
nv, int num, abi_long arg1,
>           unlock_user(p, arg2, 0);
>           return ret;
>   #endif
> +    case TARGET_NR_execveat:
> +        return do_execveat(cpu_env, arg1, arg2, arg3, arg4, arg5);
>       case TARGET_NR_execve:
> -        {
> -            char **argp, **envp;
> -            int argc, envc;
> -            abi_ulong gp;
> -            abi_ulong guest_argp;
> -            abi_ulong guest_envp;
> -            abi_ulong addr;
> -            char **q;
> -
> -            argc =3D 0;
> -            guest_argp =3D arg2;
> -            for (gp =3D guest_argp; gp; gp +=3D sizeof(abi_ulong)) {
> -                if (get_user_ual(addr, gp))
> -                    return -TARGET_EFAULT;
> -                if (!addr)
> -                    break;
> -                argc++;
> -            }
> -            envc =3D 0;
> -            guest_envp =3D arg3;
> -            for (gp =3D guest_envp; gp; gp +=3D sizeof(abi_ulong)) {
> -                if (get_user_ual(addr, gp))
> -                    return -TARGET_EFAULT;
> -                if (!addr)
> -                    break;
> -                envc++;
> -            }
> -
> -            argp =3D g_new0(char *, argc + 1);
> -            envp =3D g_new0(char *, envc + 1);
> -
> -            for (gp =3D guest_argp, q =3D argp; gp;
> -                  gp +=3D sizeof(abi_ulong), q++) {
> -                if (get_user_ual(addr, gp))
> -                    goto execve_efault;
> -                if (!addr)
> -                    break;
> -                if (!(*q =3D lock_user_string(addr)))
> -                    goto execve_efault;
> -            }
> -            *q =3D NULL;
> -
> -            for (gp =3D guest_envp, q =3D envp; gp;
> -                  gp +=3D sizeof(abi_ulong), q++) {
> -                if (get_user_ual(addr, gp))
> -                    goto execve_efault;
> -                if (!addr)
> -                    break;
> -                if (!(*q =3D lock_user_string(addr)))
> -                    goto execve_efault;
> -            }
> -            *q =3D NULL;
> -
> -            if (!(p =3D lock_user_string(arg1)))
> -                goto execve_efault;
> -            /* Although execve() is not an interruptible syscall it is
> -             * a special case where we must use the safe_syscall wrappe=
r:
> -             * if we allow a signal to happen before we make the host
> -             * syscall then we will 'lose' it, because at the point of
> -             * execve the process leaves QEMU's control. So we use the
> -             * safe syscall wrapper to ensure that we either take the
> -             * signal as a guest signal, or else it does not happen
> -             * before the execve completes and makes it the other
> -             * program's problem.
> -             */
> -            if (is_proc_myself(p, "exe")) {
> -                ret =3D get_errno(safe_execve(exec_path, argp, envp));
> -            } else {
> -                ret =3D get_errno(safe_execve(p, argp, envp));
> -            }
> -            unlock_user(p, arg1, 0);
> -
> -            goto execve_end;
> -
> -        execve_efault:
> -            ret =3D -TARGET_EFAULT;
> -
> -        execve_end:
> -            for (gp =3D guest_argp, q =3D argp; *q;
> -                  gp +=3D sizeof(abi_ulong), q++) {
> -                if (get_user_ual(addr, gp)
> -                    || !addr)
> -                    break;
> -                unlock_user(*q, addr, 0);
> -            }
> -            for (gp =3D guest_envp, q =3D envp; *q;
> -                  gp +=3D sizeof(abi_ulong), q++) {
> -                if (get_user_ual(addr, gp)
> -                    || !addr)
> -                    break;
> -                unlock_user(*q, addr, 0);
> -            }
> -
> -            g_free(argp);
> -            g_free(envp);
> -        }
> -        return ret;
> +        return do_execveat(cpu_env, AT_FDCWD, arg1, arg2, arg3, 0);
>       case TARGET_NR_chdir:
>           if (!(p =3D lock_user_string(arg1)))
>               return -TARGET_EFAULT;


