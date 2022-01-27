Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7C949EE40
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 23:49:14 +0100 (CET)
Received: from localhost ([::1]:39964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDDZp-0004rK-BM
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 17:49:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nDDXP-0003dE-QY
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 17:46:44 -0500
Received: from [2607:f8b0:4864:20::634] (port=36704
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nDDXN-0004HU-81
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 17:46:43 -0500
Received: by mail-pl1-x634.google.com with SMTP id b15so4178574plg.3
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 14:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=s3veLufp/yiLhnxXtFWoUZqDxFnJjzSB4DAkx0e5JK4=;
 b=TyhiR6wj1Fq8WKGaSpyu+p1z5ny46KDx/z/k985C6GG8TrPgSI7H/IpGCzy/E3nEIu
 19MKJXzS7nB4CtBZqAjJZySvvIxZ87dEWDEBHTGZNk2YrgF4vKFxdomKxebZEzzxcnUh
 ntIAib+/k/twIr6ilNsYOFYvGfzafFLrhdg/9VV/u5VY9ym8pW1qrqr8unzt240vIX6M
 JBvS6fJ8q3xlhXYTB1RJeDidyY+0WPmiN3VP3PlcpKAW74ZbNXUeqVizrTg3bfLa/z0o
 UCp5xRZ7jnXkvs4Q/TNBHvZyijBxuihMvx8MUj0TceNdDY9obSx+11NLS2ncqlKbWZtv
 O+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=s3veLufp/yiLhnxXtFWoUZqDxFnJjzSB4DAkx0e5JK4=;
 b=nErpZI59e1GsaSRkJ0XBfCPYdBN9EE+HtkBTVEqtttZYVYYpmGSDXfbS53LBYWxcmO
 6IOTd3RFW9KpqGb0CF0uXKOzdxA1x17JqxRN3aUuH0Py7tFPGF3E6EjruEm+WNfOEJfM
 B/tWX5PXRzrSQlCmVNi0jEZCi4GPhW5pSumSShBVtZuFD8r95Mz9f9TofbJlXk9BR9cu
 SgEQUBpQa9E96yQj7D4nzT3NbrSGs0t8GAJRfI2RasVbeBcJ64kfZRCZK8fMgDHD+ijp
 UYwt453F4+M3kpGejI9DVNJEO6guBqyzJb/MEixhijIHFG+x+OIpAeZrJe2ApFVT6ZeU
 e6Ig==
X-Gm-Message-State: AOAM530P8pEZVp27wUPyrVPmtDm2bmqBHq1Wn3p0ZyRTBMaFkCqIAp7D
 LoMabxvI1T+ukDEck10YK9Ou+g==
X-Google-Smtp-Source: ABdhPJxw1djos04ICsSfStmMpLKB9mz5i2sQOdIR1qz82AiTX8Is1AswE6C3WMaNGz/HzFw2/ctxqg==
X-Received: by 2002:a17:902:dac3:: with SMTP id
 q3mr5310350plx.161.1643323599270; 
 Thu, 27 Jan 2022 14:46:39 -0800 (PST)
Received: from smtpclient.apple ([2603:300b:6:5100:9cd4:545b:aed0:18bd])
 by smtp.gmail.com with ESMTPSA id l10sm6390033pff.44.2022.01.27.14.46.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jan 2022 14:46:38 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH v2 36/40] bsd-user/signal.c: implement do_sigaction
From: Warner Losh <wlosh@bsdimp.com>
In-Reply-To: <20220125012947.14974-37-imp@bsdimp.com>
Date: Thu, 27 Jan 2022 15:46:36 -0700
Content-Transfer-Encoding: quoted-printable
Message-Id: <B29CD011-011F-4BDB-81FD-84311EB562F9@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
 <20220125012947.14974-37-imp@bsdimp.com>
To: Warner Losh <imp@bsdimp.com>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::634;
 envelope-from=wlosh@bsdimp.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, "def@freebsd.org" <def@FreeBSD.org>,
 "jrtc27@freebsd.org" <jrtc27@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jan 24, 2022, at 6:29 PM, Warner Losh <imp@bsdimp.com> wrote:
>=20
> Implement the meat of the sigaction(2) system call with do_sigaction =
and
> helper routiner block_signals (which is also used to implemement =
signal
> masking so it's global).
>=20
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Kyle Evans <kevans@freebsd.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
>=20
> Pending Comments from Peter Maydell <peter.maydell@linaro.org>
>=20
> (1) in block_signals, sigprocmast
> For linux-user we rely on sigprocmask() in a multithreaded
> program setting the signal mask for only the calling thread,
> which isn't POSIX-mandated. (Arguably we should use
> pthread_sigmask() instead, but we don't for basically
> historical reasons since linux-user is host-OS-specific anyway.)
> Does BSD have the same "this changes this thread's signal mask"
> semantics for sigprocmask()?

FreeBSD changes this on a per-thread basis for both
sigprocmask and pthread_sigmask(). pthread_sigmask() just
does some extra stuff with SIGCANCEL for pthread_cancel
support which qemu doesn=E2=80=99t use. They are the same. I=E2=80=99m =
inclined
to leave it as sigprocmask() since I=E2=80=99m unsure what the =
implications
of doing funky things for SIGCANCEL would be.

> (2) do_sigaction, first if validating which signals can be sent
> Kernel seems to allow SIGKILL and SIGSTOP unless act is
> non-NULL and act->sa_handler is SIG_DFL ?
> =
https://github.com/freebsd/freebsd-src/blob/main/sys/kern/kern_sig.c#L747
> (Compare linux-user commit ee3500d33a7431, a recent bugfix.)

That fix is relevant, so I=E2=80=99ll bring that in. Thanks!

> (3) Noting confusion in do_sigaction between host and target
> errnos (they are identical on BSD, but we should still return
> the right sort in case it ever does matter).

Will fix before V3 of patches.

Warner

> ---
> bsd-user/signal-common.h | 22 ++++++++++++
> bsd-user/signal.c        | 76 ++++++++++++++++++++++++++++++++++++++++
> 2 files changed, 98 insertions(+)
>=20
> diff --git a/bsd-user/signal-common.h b/bsd-user/signal-common.h
> index 786ec592d18..7ff8e8f2e40 100644
> --- a/bsd-user/signal-common.h
> +++ b/bsd-user/signal-common.h
> @@ -9,7 +9,29 @@
> #ifndef SIGNAL_COMMON_H
> #define SIGNAL_COMMON_H
>=20
> +/**
> + * block_signals: block all signals while handling this guest syscall
> + *
> + * Block all signals, and arrange that the signal mask is returned to
> + * its correct value for the guest before we resume execution of =
guest code.
> + * If this function returns non-zero, then the caller should =
immediately
> + * return -TARGET_ERESTARTSYS to the main loop, which will take the =
pending
> + * signal and restart execution of the syscall.
> + * If block_signals() returns zero, then the caller can continue with
> + * emulation of the system call knowing that no signals can be taken
> + * (and therefore that no race conditions will result).
> + * This should only be called once, because if it is called a second =
time
> + * it will always return non-zero. (Think of it like a mutex that =
can't
> + * be recursively locked.)
> + * Signals will be unblocked again by process_pending_signals().
> + *
> + * Return value: non-zero if there was a pending signal, zero if not.
> + */
> +int block_signals(void); /* Returns non zero if signal pending */
> +
> long do_rt_sigreturn(CPUArchState *env);
> +int do_sigaction(int sig, const struct target_sigaction *act,
> +                struct target_sigaction *oact);
> abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, =
abi_ulong sp);
> long do_sigreturn(CPUArchState *env, abi_ulong addr);
> void force_sig_fault(int sig, int code, abi_ulong addr);
> diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> index 05caf812ccb..42021556d65 100644
> --- a/bsd-user/signal.c
> +++ b/bsd-user/signal.c
> @@ -309,6 +309,22 @@ static void tswap_siginfo(target_siginfo_t =
*tinfo, const target_siginfo_t *info)
>     }
> }
>=20
> +int block_signals(void)
> +{
> +    TaskState *ts =3D (TaskState *)thread_cpu->opaque;
> +    sigset_t set;
> +
> +    /*
> +     * It's OK to block everything including SIGSEGV, because we =
won't run any
> +     * further guest code before unblocking signals in
> +     * process_pending_signals().
> +     */
> +    sigfillset(&set);
> +    sigprocmask(SIG_SETMASK, &set, 0);
> +
> +    return qatomic_xchg(&ts->signal_pending, 1);
> +}
> +
> /* Returns 1 if given signal should dump core if not handled. */
> static int core_dump_signal(int sig)
> {
> @@ -554,6 +570,66 @@ static void host_signal_handler(int host_sig, =
siginfo_t *info, void *puc)
>     cpu_exit(thread_cpu);
> }
>=20
> +/* do_sigaction() return host values and errnos */
> +int do_sigaction(int sig, const struct target_sigaction *act,
> +        struct target_sigaction *oact)
> +{
> +    struct target_sigaction *k;
> +    struct sigaction act1;
> +    int host_sig;
> +    int ret =3D 0;
> +
> +    if (sig < 1 || sig > TARGET_NSIG || sig =3D=3D TARGET_SIGKILL ||
> +        sig =3D=3D TARGET_SIGSTOP) {
> +        return -EINVAL;
> +    }
> +
> +    if (block_signals()) {
> +        return -TARGET_ERESTART;
> +    }
> +
> +    k =3D &sigact_table[sig - 1];
> +    if (oact) {
> +        oact->_sa_handler =3D tswapal(k->_sa_handler);
> +        oact->sa_flags =3D tswap32(k->sa_flags);
> +        oact->sa_mask =3D k->sa_mask;
> +    }
> +    if (act) {
> +        /* XXX: this is most likely not threadsafe. */
> +        k->_sa_handler =3D tswapal(act->_sa_handler);
> +        k->sa_flags =3D tswap32(act->sa_flags);
> +        k->sa_mask =3D act->sa_mask;
> +
> +        /* Update the host signal state. */
> +        host_sig =3D target_to_host_signal(sig);
> +        if (host_sig !=3D SIGSEGV && host_sig !=3D SIGBUS) {
> +            memset(&act1, 0, sizeof(struct sigaction));
> +            sigfillset(&act1.sa_mask);
> +            act1.sa_flags =3D SA_SIGINFO;
> +            if (k->sa_flags & TARGET_SA_RESTART) {
> +                act1.sa_flags |=3D SA_RESTART;
> +            }
> +            /*
> +             *  Note: It is important to update the host kernel =
signal mask to
> +             *  avoid getting unexpected interrupted system calls.
> +             */
> +            if (k->_sa_handler =3D=3D TARGET_SIG_IGN) {
> +                act1.sa_sigaction =3D (void *)SIG_IGN;
> +            } else if (k->_sa_handler =3D=3D TARGET_SIG_DFL) {
> +                if (fatal_signal(sig)) {
> +                    act1.sa_sigaction =3D host_signal_handler;
> +                } else {
> +                    act1.sa_sigaction =3D (void *)SIG_DFL;
> +                }
> +            } else {
> +                act1.sa_sigaction =3D host_signal_handler;
> +            }
> +            ret =3D sigaction(host_sig, &act1, NULL);
> +        }
> +    }
> +    return ret;
> +}
> +
> static inline abi_ulong get_sigframe(struct target_sigaction *ka,
>         CPUArchState *env, size_t frame_size)
> {
> --=20
> 2.33.1
>=20


