Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1F7410CFB
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 21:02:56 +0200 (CEST)
Received: from localhost ([::1]:45168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS25X-000172-So
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 15:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mS23u-0008Ay-In
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 15:01:15 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:34745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mS23p-0004Za-NL
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 15:01:14 -0400
Received: by mail-io1-xd31.google.com with SMTP id y18so19287422ioc.1
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 12:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=sender:from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=mfWe/jRGlGzZ3ZKFmGBBpc++8rTNtgYIixbs+Y9AKoU=;
 b=ujT/hipQrT8MtxZUSCjDMWIUCpEOeS5o35KdxqsXphjlCKW1WJ5qsVxHzHyfZrWAnl
 7BaEUYvO0kgkW7ETpiFcJuSnCYt5Z1g7VfrDqWu6kSsPgEuHZrSyqpzJLbXCJmsy0E7E
 rNDGWkr9fzo2tXmuTOFbyDBy7ZrmkPfv80KYOlnmAA5nljGHEXPV8HpeKlTLfAnZtqDa
 4ZE3tsq23lFMU5FLHMJ+K2EQ0iGZxHYzgCAZAvYalLhHi/pmblSxJUKymiAVmNFZBaEv
 qlDumAopjYWMvCr2GBiWOEm4F33AN9xib60zy69XqBHHw2y4oW8XEohNihXwE+tvPMIC
 SaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:mime-version:subject:in-reply-to
 :date:cc:content-transfer-encoding:message-id:references:to;
 bh=mfWe/jRGlGzZ3ZKFmGBBpc++8rTNtgYIixbs+Y9AKoU=;
 b=F6VhZEA+bqTnfrff34W9+K388urF6MSAESQ9HZF34MiW1bURipJN7OqPAVjwFlAY2I
 K02GGXK133hcYni+8faVhpN4O4OJn5eGkwtteKntngtXJduKdgZveziKfklebSi64xcJ
 Q9lUSqOhmrWy2jvA1nWF0Ab9LFKtoBo/cEODH00rAWRfLz4XTxIuT7soHwru49aNzx4U
 4XDyE0K6hHOCBivJdjJu7t++hItmp/EAiY6Tru8Dpy+w+sSd/9OsvRrVcRE2nNtX+QsS
 LUOg6EV9LovMqvI9JSZYORZDajyIq6QQbmkc0TZ7QmmgJ9sZ8J/uArBZloludNlG2o9R
 kvuA==
X-Gm-Message-State: AOAM532U7+c/Qho6eZ6sr/CH8VsoEzGcWZ1bivlY8uVadjNIcS5dgHv8
 nSyRmHEST9w7D70ad7jy3Zi8Lw==
X-Google-Smtp-Source: ABdhPJwNBODDg9l/4dRKK8QPPNaDUeiC8StBsyLtvruyjw1xQ2A6B2CJPO0BTsmY+Q2/6Kd6avRsqw==
X-Received: by 2002:a05:6638:216:: with SMTP id
 e22mr5421151jaq.120.1632078068090; 
 Sun, 19 Sep 2021 12:01:08 -0700 (PDT)
Received: from macbook.nflx.bsdimp.com
 (50-253-99-174-static.hfc.comcastbusiness.net. [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id r78sm3806399iod.22.2021.09.19.12.01.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 19 Sep 2021 12:01:07 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
X-Google-Original-From: Warner Losh <bsdimp@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH v2 06/41] linux-user: Reorg handling for SIGSEGV
In-Reply-To: <20210918184527.408540-7-richard.henderson@linaro.org>
Date: Sun, 19 Sep 2021 13:01:07 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <A0B1AFDF-56AC-4A39-A6C2-47BFC1B9D4F1@gmail.com>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
 <20210918184527.408540-7-richard.henderson@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=wlosh@bsdimp.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Sep 18, 2021, at 12:44 PM, Richard Henderson =
<richard.henderson@linaro.org> wrote:
>=20
> Add stub host-signal.h for all linux-user hosts.
> Add new code replacing cpu_signal_handler.
> Full migration will happen one host at a time.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> linux-user/host/aarch64/host-signal.h |   1 +
> linux-user/host/arm/host-signal.h     |   1 +
> linux-user/host/i386/host-signal.h    |   1 +
> linux-user/host/mips/host-signal.h    |   1 +
> linux-user/host/ppc/host-signal.h     |   1 +
> linux-user/host/ppc64/host-signal.h   |   1 +
> linux-user/host/riscv/host-signal.h   |   1 +
> linux-user/host/s390/host-signal.h    |   1 +
> linux-user/host/s390x/host-signal.h   |   1 +
> linux-user/host/sparc/host-signal.h   |   1 +
> linux-user/host/sparc64/host-signal.h |   1 +
> linux-user/host/x32/host-signal.h     |   1 +
> linux-user/host/x86_64/host-signal.h  |   1 +
> linux-user/signal.c                   | 109 ++++++++++++++++++++++----
> 14 files changed, 106 insertions(+), 16 deletions(-)
> create mode 100644 linux-user/host/aarch64/host-signal.h
> create mode 100644 linux-user/host/arm/host-signal.h
> create mode 100644 linux-user/host/i386/host-signal.h
> create mode 100644 linux-user/host/mips/host-signal.h
> create mode 100644 linux-user/host/ppc/host-signal.h
> create mode 100644 linux-user/host/ppc64/host-signal.h
> create mode 100644 linux-user/host/riscv/host-signal.h
> create mode 100644 linux-user/host/s390/host-signal.h
> create mode 100644 linux-user/host/s390x/host-signal.h
> create mode 100644 linux-user/host/sparc/host-signal.h
> create mode 100644 linux-user/host/sparc64/host-signal.h
> create mode 100644 linux-user/host/x32/host-signal.h
> create mode 100644 linux-user/host/x86_64/host-signal.h

Seems sensible to me.

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/linux-user/host/aarch64/host-signal.h =
b/linux-user/host/aarch64/host-signal.h
> new file mode 100644
> index 0000000000..f4b4d65031
> --- /dev/null
> +++ b/linux-user/host/aarch64/host-signal.h
> @@ -0,0 +1 @@
> +#define HOST_SIGNAL_PLACEHOLDER
> diff --git a/linux-user/host/arm/host-signal.h =
b/linux-user/host/arm/host-signal.h
> new file mode 100644
> index 0000000000..f4b4d65031
> --- /dev/null
> +++ b/linux-user/host/arm/host-signal.h
> @@ -0,0 +1 @@
> +#define HOST_SIGNAL_PLACEHOLDER
> diff --git a/linux-user/host/i386/host-signal.h =
b/linux-user/host/i386/host-signal.h
> new file mode 100644
> index 0000000000..f4b4d65031
> --- /dev/null
> +++ b/linux-user/host/i386/host-signal.h
> @@ -0,0 +1 @@
> +#define HOST_SIGNAL_PLACEHOLDER
> diff --git a/linux-user/host/mips/host-signal.h =
b/linux-user/host/mips/host-signal.h
> new file mode 100644
> index 0000000000..f4b4d65031
> --- /dev/null
> +++ b/linux-user/host/mips/host-signal.h
> @@ -0,0 +1 @@
> +#define HOST_SIGNAL_PLACEHOLDER
> diff --git a/linux-user/host/ppc/host-signal.h =
b/linux-user/host/ppc/host-signal.h
> new file mode 100644
> index 0000000000..f4b4d65031
> --- /dev/null
> +++ b/linux-user/host/ppc/host-signal.h
> @@ -0,0 +1 @@
> +#define HOST_SIGNAL_PLACEHOLDER
> diff --git a/linux-user/host/ppc64/host-signal.h =
b/linux-user/host/ppc64/host-signal.h
> new file mode 100644
> index 0000000000..f4b4d65031
> --- /dev/null
> +++ b/linux-user/host/ppc64/host-signal.h
> @@ -0,0 +1 @@
> +#define HOST_SIGNAL_PLACEHOLDER
> diff --git a/linux-user/host/riscv/host-signal.h =
b/linux-user/host/riscv/host-signal.h
> new file mode 100644
> index 0000000000..f4b4d65031
> --- /dev/null
> +++ b/linux-user/host/riscv/host-signal.h
> @@ -0,0 +1 @@
> +#define HOST_SIGNAL_PLACEHOLDER
> diff --git a/linux-user/host/s390/host-signal.h =
b/linux-user/host/s390/host-signal.h
> new file mode 100644
> index 0000000000..f4b4d65031
> --- /dev/null
> +++ b/linux-user/host/s390/host-signal.h
> @@ -0,0 +1 @@
> +#define HOST_SIGNAL_PLACEHOLDER
> diff --git a/linux-user/host/s390x/host-signal.h =
b/linux-user/host/s390x/host-signal.h
> new file mode 100644
> index 0000000000..f4b4d65031
> --- /dev/null
> +++ b/linux-user/host/s390x/host-signal.h
> @@ -0,0 +1 @@
> +#define HOST_SIGNAL_PLACEHOLDER
> diff --git a/linux-user/host/sparc/host-signal.h =
b/linux-user/host/sparc/host-signal.h
> new file mode 100644
> index 0000000000..f4b4d65031
> --- /dev/null
> +++ b/linux-user/host/sparc/host-signal.h
> @@ -0,0 +1 @@
> +#define HOST_SIGNAL_PLACEHOLDER
> diff --git a/linux-user/host/sparc64/host-signal.h =
b/linux-user/host/sparc64/host-signal.h
> new file mode 100644
> index 0000000000..f4b4d65031
> --- /dev/null
> +++ b/linux-user/host/sparc64/host-signal.h
> @@ -0,0 +1 @@
> +#define HOST_SIGNAL_PLACEHOLDER
> diff --git a/linux-user/host/x32/host-signal.h =
b/linux-user/host/x32/host-signal.h
> new file mode 100644
> index 0000000000..f4b4d65031
> --- /dev/null
> +++ b/linux-user/host/x32/host-signal.h
> @@ -0,0 +1 @@
> +#define HOST_SIGNAL_PLACEHOLDER
> diff --git a/linux-user/host/x86_64/host-signal.h =
b/linux-user/host/x86_64/host-signal.h
> new file mode 100644
> index 0000000000..f4b4d65031
> --- /dev/null
> +++ b/linux-user/host/x86_64/host-signal.h
> @@ -0,0 +1 @@
> +#define HOST_SIGNAL_PLACEHOLDER
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 5ea8e4584a..6f953f10d4 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -18,12 +18,15 @@
>  */
> #include "qemu/osdep.h"
> #include "qemu/bitops.h"
> +#include "hw/core/tcg-cpu-ops.h"
> +
> #include <sys/ucontext.h>
> #include <sys/resource.h>
>=20
> #include "qemu.h"
> #include "trace.h"
> #include "signal-common.h"
> +#include "host-signal.h"
>=20
> static struct target_sigaction sigact_table[TARGET_NSIG];
>=20
> @@ -761,41 +764,115 @@ static inline void =
rewind_if_in_safe_syscall(void *puc)
> }
> #endif
>=20
> -static void host_signal_handler(int host_signum, siginfo_t *info,
> -                                void *puc)
> +static void host_signal_handler(int host_sig, siginfo_t *info, void =
*puc)
> {
>     CPUArchState *env =3D thread_cpu->env_ptr;
>     CPUState *cpu =3D env_cpu(env);
>     TaskState *ts =3D cpu->opaque;
> -
> -    int sig;
>     target_siginfo_t tinfo;
>     ucontext_t *uc =3D puc;
>     struct emulated_sigtable *k;
> +    int guest_sig;
>=20
> +#ifdef HOST_SIGNAL_PLACEHOLDER
>     /* the CPU emulator uses some host signals to detect exceptions,
>        we forward to it some signals */
> -    if ((host_signum =3D=3D SIGSEGV || host_signum =3D=3D SIGBUS)
> +    if ((host_sig =3D=3D SIGSEGV || host_sig =3D=3D SIGBUS)
>         && info->si_code > 0) {
> -        if (cpu_signal_handler(host_signum, info, puc))
> +        if (cpu_signal_handler(host_sig, info, puc))
>             return;
>     }
> +#else
> +    uintptr_t pc =3D 0;
> +    bool sync_sig =3D false;
> +
> +    /*
> +     * Non-spoofed SIGSEGV and SIGBUS are synchronous, and need =
special
> +     * handling wrt signal blocking and unwinding.
> +     */
> +    if ((host_sig =3D=3D SIGSEGV || host_sig =3D=3D SIGBUS) && =
info->si_code > 0) {
> +        MMUAccessType access_type;
> +        uintptr_t host_addr;
> +        abi_ptr guest_addr;
> +        bool is_write;
> +
> +        host_addr =3D (uintptr_t)info->si_addr;
> +
> +        /*
> +         * Convert forcefully to guest address space: addresses =
outside
> +         * reserved_va are still valid to report via SEGV_MAPERR.
> +         */
> +        guest_addr =3D h2g_nocheck(host_addr);
> +
> +        pc =3D host_signal_pc(uc);
> +        is_write =3D host_signal_write(info, uc);
> +        access_type =3D adjust_signal_pc(&pc, is_write);
> +
> +        if (host_sig =3D=3D SIGSEGV) {
> +            const struct TCGCPUOps *tcg_ops;
> +
> +            if (info->si_code =3D=3D SEGV_ACCERR && =
h2g_valid(host_addr)) {
> +                /* If this was a write to a TB protected page, =
restart. */
> +                if (is_write &&
> +                    handle_sigsegv_accerr_write(cpu, &uc->uc_sigmask,
> +                                                pc, guest_addr)) {
> +                    return;
> +                }
> +
> +                /*
> +                 * With reserved_va, the whole address space is =
PROT_NONE,
> +                 * which means that we may get ACCERR when we want =
MAPERR.
> +                 */
> +                if (page_get_flags(guest_addr) & PAGE_VALID) {
> +                    /* maperr =3D false; */
> +                } else {
> +                    info->si_code =3D SEGV_MAPERR;
> +                }
> +            }
> +
> +            sigprocmask(SIG_SETMASK, &uc->uc_sigmask, NULL);
> +
> +            tcg_ops =3D CPU_GET_CLASS(cpu)->tcg_ops;
> +            tcg_ops->tlb_fill(cpu, guest_addr, 0, access_type,
> +                              MMU_USER_IDX, false, pc);
> +            g_assert_not_reached();
> +        } else {
> +            sigprocmask(SIG_SETMASK, &uc->uc_sigmask, NULL);
> +        }
> +
> +        sync_sig =3D true;
> +    }
> +#endif
>=20
>     /* get target signal number */
> -    sig =3D host_to_target_signal(host_signum);
> -    if (sig < 1 || sig > TARGET_NSIG)
> +    guest_sig =3D host_to_target_signal(host_sig);
> +    if (guest_sig < 1 || guest_sig > TARGET_NSIG) {
>         return;
> -    trace_user_host_signal(env, host_signum, sig);
> +    }
> +    trace_user_host_signal(env, host_sig, guest_sig);
> +
> +    host_to_target_siginfo_noswap(&tinfo, info);
> +    k =3D &ts->sigtab[guest_sig - 1];
> +    k->info =3D tinfo;
> +    k->pending =3D guest_sig;
> +    ts->signal_pending =3D 1;
> +
> +#ifndef HOST_SIGNAL_PLACEHOLDER
> +    /*
> +     * For synchronous signals, unwind the cpu state to the faulting
> +     * insn and then exit back to the main loop so that the signal
> +     * is delivered immediately.
> +     */
> +    if (sync_sig) {
> +        cpu->exception_index =3D EXCP_INTERRUPT;
> +        cpu_loop_exit_restore(cpu, pc);
> +    }
> +#endif
>=20
>     rewind_if_in_safe_syscall(puc);
>=20
> -    host_to_target_siginfo_noswap(&tinfo, info);
> -    k =3D &ts->sigtab[sig - 1];
> -    k->info =3D tinfo;
> -    k->pending =3D sig;
> -    ts->signal_pending =3D 1;
> -
> -    /* Block host signals until target signal handler entered. We
> +    /*
> +     * Block host signals until target signal handler entered. We
>      * can't block SIGSEGV or SIGBUS while we're executing guest
>      * code in case the guest code provokes one in the window between
>      * now and it getting out to the main loop. Signals will be
> --=20
> 2.25.1
>=20
>=20


