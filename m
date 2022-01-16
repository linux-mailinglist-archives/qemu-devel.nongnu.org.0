Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E0848FEEA
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Jan 2022 21:55:07 +0100 (CET)
Received: from localhost ([::1]:57888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9CYM-0001Wd-G8
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 15:55:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n9CWD-0000db-Mm
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 15:52:53 -0500
Received: from [2607:f8b0:4864:20::92f] (port=34755
 helo=mail-ua1-x92f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n9CWB-0005II-83
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 15:52:53 -0500
Received: by mail-ua1-x92f.google.com with SMTP id y4so26995845uad.1
 for <qemu-devel@nongnu.org>; Sun, 16 Jan 2022 12:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yuXamKcNia1YCbGnNg8jdyBlwoNUhQvQecO7nGhXuL8=;
 b=BAiPBXvCXvmxN0c9PiEBpTMU2wEwYa9Gq3KhAJWyRfsMPEY/K+XxQ9NzWCHib/E5iN
 vqoUEq/Ch6+0CMFPVZ1vPTqpo9tgUiC3m9up7qHai90BsVEfsvSE5+uf+Z6YGViEkaLK
 4mELGz4e4uD1D7G3ZBGqDOqLTIFg7ZRRmk3SdaE+u+XN3xj580ao2BoJiy8ACtESUvJ6
 Oul+EyRWbqzGwQtd1BQH/m5zv+DY7/ByeEFjAsbRuSmnlk/fdkYo5v1dHSHVQI5sKNdD
 NrUMg6CKl3YHGas7ngEFOlGY4/68K4ffz2Ui/JxTrqr3E0zW3Zq3TU6eG+B4CeCZZU/N
 /M6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yuXamKcNia1YCbGnNg8jdyBlwoNUhQvQecO7nGhXuL8=;
 b=Ju9tFEp7uDm73CsUDD/9hkijZAY2j5rs92H6ZTURZi1Nw7Gvaa0UoFZPaOGNrorMpp
 uR/ybbMzd0bTUCa6nEvNjW98UZlNfzta2qp3Wgt6KbuqWcdKRZCiNofsx+6O2i8a4J2v
 BaIvT3t+2RgukMAjjl+cO7f8JbfGm4aU5Jl4rPcbHphMgb8Iz8vVFvGkAxhOl17MUi4m
 B4XPMBdzxS2pWrm42FxRcSTCT/IOVhxHNWwBQ2yhBitSdkajIJwPPLehglzW+VNTpryz
 Hn4EG2fiGu4Si5d5BJYnAKOwqSbp54ZP3tqrGOmiXLWjfCArNb57zxVcv8RYupINnn20
 892w==
X-Gm-Message-State: AOAM532zmTjXJy5c3paCu2AMpBh96u0pxGbVrwdOfSz9KFoOBjs6Kq7Z
 bFv0tIAO2y3j6l53aB7Wtqch0w/ZAGHMYu6RXoF5FQ==
X-Google-Smtp-Source: ABdhPJxOglSoN02Uxf9czk6vjKNa+31+piymkVP1HBe/QtmRFe5VjrDdY49dVsWEC0QE7aFVMsQepXxArpSXiUav6HQ=
X-Received: by 2002:a67:edc5:: with SMTP id e5mr6855818vsp.6.1642366369670;
 Sun, 16 Jan 2022 12:52:49 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-19-imp@bsdimp.com>
 <CAFEAcA9RLjFON6A89j+gVoiRxehiwNpbsF5GpPL3z1EFhrHw1Q@mail.gmail.com>
In-Reply-To: <CAFEAcA9RLjFON6A89j+gVoiRxehiwNpbsF5GpPL3z1EFhrHw1Q@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 16 Jan 2022 13:52:38 -0700
Message-ID: <CANCZdfrNHuoUY4M--O3qTSK2OwA_p=fjisvuMLq8S==+sNXN9Q@mail.gmail.com>
Subject: Re: [PATCH 18/30] bsd-user/signal.c: Implement host_signal_handler
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000000e389b05d5b938c1"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::92f;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000e389b05d5b938c1
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 13, 2022 at 1:17 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Sun, 9 Jan 2022 at 16:40, Warner Losh <imp@bsdimp.com> wrote:
> >
> > Implement host_signal_handler to handle signals generated by the host
> > and to do safe system calls.
> >
> > Signed-off-by: Stacey Son <sson@FreeBSD.org>
> > Signed-off-by: Kyle Evans <kevans@freebsd.org>
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >  bsd-user/signal.c | 105 ++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 105 insertions(+)
> >
> > diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> > index b1331f63d61..a6e07277fb2 100644
> > --- a/bsd-user/signal.c
> > +++ b/bsd-user/signal.c
> > @@ -142,6 +142,111 @@ void force_sig_fault(int sig, int code, abi_ulong
> addr)
> >
> >  static void host_signal_handler(int host_sig, siginfo_t *info, void
> *puc)
> >  {
> > +    CPUState *cpu = thread_cpu;
> > +    CPUArchState *env = cpu->env_ptr;
> > +    int sig;
> > +    target_siginfo_t tinfo;
> > +    ucontext_t *uc = puc;
> > +    uintptr_t pc = 0;
> > +    bool sync_sig = false;
> > +
> > +    /*
> > +     * Non-spoofed SIGSEGV and SIGBUS are synchronous, and need special
> > +     * handling wrt signal blocking and unwinding.
> > +     */
> > +    if ((host_sig == SIGSEGV || host_sig == SIGBUS) && info->si_code >
> 0) {
> > +        MMUAccessType access_type;
> > +        uintptr_t host_addr;
> > +        abi_ptr guest_addr;
> > +        bool is_write;
> > +
> > +        host_addr = (uintptr_t)info->si_addr;
> > +
> > +        /*
> > +         * Convert forcefully to guest address space: addresses outside
> > +         * reserved_va are still valid to report via SEGV_MAPERR.
> > +         */
> > +        guest_addr = h2g_nocheck(host_addr);
> > +
> > +        pc = host_signal_pc(uc);
> > +        is_write = host_signal_write(info, uc);
> > +        access_type = adjust_signal_pc(&pc, is_write);
> > +
> > +        if (host_sig == SIGSEGV) {
> > +            bool maperr = true;
> > +
> > +            if (info->si_code == SEGV_ACCERR && h2g_valid(host_addr)) {
> > +                /* If this was a write to a TB protected page, restart.
> */
> > +                if (is_write &&
> > +                    handle_sigsegv_accerr_write(cpu, &uc->uc_sigmask,
> > +                                                pc, guest_addr)) {
> > +                    return;
> > +                }
> > +
> > +                /*
> > +                 * With reserved_va, the whole address space is
> PROT_NONE,
> > +                 * which means that we may get ACCERR when we want
> MAPERR.
> > +                 */
> > +                if (page_get_flags(guest_addr) & PAGE_VALID) {
> > +                    maperr = false;
> > +                } else {
> > +                    info->si_code = SEGV_MAPERR;
> > +                }
> > +            }
> > +
> > +            sigprocmask(SIG_SETMASK, &uc->uc_sigmask, NULL);
> > +            cpu_loop_exit_sigsegv(cpu, guest_addr, access_type, maperr,
> pc);
> > +        } else {
> > +            sigprocmask(SIG_SETMASK, &uc->uc_sigmask, NULL);
> > +            if (info->si_code == BUS_ADRALN) {
> > +                cpu_loop_exit_sigbus(cpu, guest_addr, access_type, pc);
> > +            }
> > +        }
> > +
> > +        sync_sig = true;
> > +    }
> > +
> > +    /* Get the target signal number. */
> > +    sig = host_to_target_signal(host_sig);
> > +    if (sig < 1 || sig > TARGET_NSIG) {
> > +        return;
> > +    }
> > +    trace_user_host_signal(cpu, host_sig, sig);
> > +
> > +    host_to_target_siginfo_noswap(&tinfo, info);
> > +
> > +    queue_signal(env, sig, &tinfo);       /* XXX how to cope with
> failure? */
>
> queue_signal() can't fail, so there is nothing to cope with.
> (Your bsd-user version even has the right 'void' type --
> linux-user's returns 1 always and we never look at the return
> value, so we should really switch that to void return too.)
>

Submitted a patch to that last bit. I'll remove this comment in the rework
I'm doing.


> > +    /*
> > +     * Linux does something else here -> the queue signal may be wrong,
> but
> > +     * maybe not.  And then it does the rewind_if_in_safe_syscall
> > +     */
>
> I think you have here a bit of a mix of linux-user's current design
> and some older (broken) version. This is how linux-user works today:
>

Yes. I think we forked bsd-user from linux-user around 2015 and the old
design dropped signal queueing in 2016 if I'm reading git log correctly.


>  * queue_signal() is a little bit misnamed, because there is no
>    "queue" here: there can only be at most one "queued" signal,
>    and it lives in the TaskState struct (which is user-only specific
>    information that hangs off the guest CPU struct) as the
>    TaskState::sync_signal field. The reason
>    we only have one at once is that queue_signal() is used only
>    for signals generated by QEMU itself by calling queue_signal()
>    directly or indirectly from the cpu_loop() code. The cpu loop
>    always calls process_pending_signals() at the end of its loop,
>    which will pick up a queued signal. We never call queue_signal()
>    twice in a row before getting back to process_pending_signals(),
>    so there's only ever at most one thing in the "queue".
>  * for all signals we get from the host except SIGSEGV/SIGBUS,
>    we track whether there's a host signal pending in the
>    TaskState::sigtab[] array (which is indexed by signal number).
>    We block all host signals except SIGSEGV/SIGBUS before calling
>    cpu_exit(), so we know we're not going to get more than one
>    of these at once (and it won't clash with a queue_signal()
>    signal either, as those use the sync_signal field, not the
>    sigtab[]).
>  * for host-sent non-spoofed (ie not sent via 'kill()') SIGSEGV/SIGBUS,
>    we know this was caused by a bit of generated code, so we just
>    use cpu_loop_exit_restore() to turn this into an EXCP_INTERRUPT
>    at the right guest PC
>
> I feel fairly strongly that you definitely want to use the same
> design as current linux-user does for signals:
>  * getting this right is pretty tricky, and even if we get two
>    different designs to both have the same semantics it's going
>    to be pretty confusing
>  * we thought quite hard about the linux-user code at the time
>    and it's definitely less buggy than the previous design
>  * It's much easier to review the bsd-user code as "yes this is
>    doing the same thing linux-user does" than working through
>    a different approach from first principles
>

I agree. I like that design better than what's in bsd-user today and
seems simpler to implement and get right. I'd add a 4th bullet point
"It's easier to share code, either directly or via copying"


> I don't have as strong an opinion on whether we should try to get
> it into the tree that way from the start, or to put in whatever
> you have currently and then fix it later. (More accurately,
> I would prefer to review patches which use the same design
> as linux-user but if that's going to be massively painful/slow
> for you to get something upstream doing it that way around
> I can probably live with the other approach...)
>

I'm going to start down that path and see if I can rework the patches
and see if it solves some of the regressions we've seen in bsd-user
between 6.1 and 6.2 as the signal stuff was reworked in linux-user
to cope better with sigsegv and sigbus. If that works out OK, then
I'll move forward with adjusting the fork and reflect that back into
this patch series.


> > +    /*
> > +     * For synchronous signals, unwind the cpu state to the faulting
> > +     * insn and then exit back to the main loop so that the signal
> > +     * is delivered immediately.
> > +     XXXX Should this be in queue_signal?
>
> No, because queue_signal() is called for lots of ways to pend
> a signal, most of which aren't real host signals.
>

OK. I now agree after reading the code.


> > +     */
> > +    if (sync_sig) {
> > +        cpu->exception_index = EXCP_INTERRUPT;
> > +        cpu_loop_exit_restore(cpu, pc);
> > +    }
> > +
> > +    rewind_if_in_safe_syscall(puc);
> > +
> > +    /*
> > +     * Block host signals until target signal handler entered. We
> > +     * can't block SIGSEGV or SIGBUS while we're executing guest
> > +     * code in case the guest code provokes one in the window between
> > +     * now and it getting out to the main loop. Signals will be
> > +     * unblocked again in process_pending_signals().
> > +     */
> > +    sigfillset(&uc->uc_sigmask);
> > +    sigdelset(&uc->uc_sigmask, SIGSEGV);
> > +    sigdelset(&uc->uc_sigmask, SIGBUS);
> > +
> > +    /* Interrupt the virtual CPU as soon as possible. */
> > +    cpu_exit(thread_cpu);
> >  }
> >
> >  void signal_init(void)
>
> thanks
>

Thank you for the insight and places to focus on making this code better.
It's
a bit hard to discover all this just from reading code in any sane amount
of time
and it is both quite helpful and much appreciated.

Warner

--0000000000000e389b05d5b938c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 13, 2022 at 1:17 PM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Sun, 9 Jan 2022 at 16:40, Warner Losh &lt;<a href=3D"mailto:imp@bs=
dimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Implement host_signal_handler to handle signals generated by the host<=
br>
&gt; and to do safe system calls.<br>
&gt;<br>
&gt; Signed-off-by: Stacey Son &lt;sson@FreeBSD.org&gt;<br>
&gt; Signed-off-by: Kyle Evans &lt;<a href=3D"mailto:kevans@freebsd.org" ta=
rget=3D"_blank">kevans@freebsd.org</a>&gt;<br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 bsd-user/signal.c | 105 ++++++++++++++++++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 1 file changed, 105 insertions(+)<br>
&gt;<br>
&gt; diff --git a/bsd-user/signal.c b/bsd-user/signal.c<br>
&gt; index b1331f63d61..a6e07277fb2 100644<br>
&gt; --- a/bsd-user/signal.c<br>
&gt; +++ b/bsd-user/signal.c<br>
&gt; @@ -142,6 +142,111 @@ void force_sig_fault(int sig, int code, abi_ulon=
g addr)<br>
&gt;<br>
&gt;=C2=A0 static void host_signal_handler(int host_sig, siginfo_t *info, v=
oid *puc)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 CPUState *cpu =3D thread_cpu;<br>
&gt; +=C2=A0 =C2=A0 CPUArchState *env =3D cpu-&gt;env_ptr;<br>
&gt; +=C2=A0 =C2=A0 int sig;<br>
&gt; +=C2=A0 =C2=A0 target_siginfo_t tinfo;<br>
&gt; +=C2=A0 =C2=A0 ucontext_t *uc =3D puc;<br>
&gt; +=C2=A0 =C2=A0 uintptr_t pc =3D 0;<br>
&gt; +=C2=A0 =C2=A0 bool sync_sig =3D false;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Non-spoofed SIGSEGV and SIGBUS are synchronous,=
 and need special<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* handling wrt signal blocking and unwinding.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 if ((host_sig =3D=3D SIGSEGV || host_sig =3D=3D SIGBUS)=
 &amp;&amp; info-&gt;si_code &gt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 MMUAccessType access_type;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uintptr_t host_addr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 abi_ptr guest_addr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool is_write;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 host_addr =3D (uintptr_t)info-&gt;si_addr=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Convert forcefully to guest addre=
ss space: addresses outside<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* reserved_va are still valid to re=
port via SEGV_MAPERR.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 guest_addr =3D h2g_nocheck(host_addr);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pc =3D host_signal_pc(uc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_write =3D host_signal_write(info, uc);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 access_type =3D adjust_signal_pc(&amp;pc,=
 is_write);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (host_sig =3D=3D SIGSEGV) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool maperr =3D true;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (info-&gt;si_code =3D=3D=
 SEGV_ACCERR &amp;&amp; h2g_valid(host_addr)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If this wa=
s a write to a TB protected page, restart. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (is_write =
&amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 handle_sigsegv_accerr_write(cpu, &amp;uc-&gt;uc_sigmask,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 pc, guest_addr)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* With =
reserved_va, the whole address space is PROT_NONE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* which=
 means that we may get ACCERR when we want MAPERR.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (page_get_=
flags(guest_addr) &amp; PAGE_VALID) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 maperr =3D false;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 info-&gt;si_code =3D SEGV_MAPERR;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sigprocmask(SIG_SETMASK, &a=
mp;uc-&gt;uc_sigmask, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_loop_exit_sigsegv(cpu, =
guest_addr, access_type, maperr, pc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sigprocmask(SIG_SETMASK, &a=
mp;uc-&gt;uc_sigmask, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (info-&gt;si_code =3D=3D=
 BUS_ADRALN) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_loop_exit=
_sigbus(cpu, guest_addr, access_type, pc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sync_sig =3D true;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Get the target signal number. */<br>
&gt; +=C2=A0 =C2=A0 sig =3D host_to_target_signal(host_sig);<br>
&gt; +=C2=A0 =C2=A0 if (sig &lt; 1 || sig &gt; TARGET_NSIG) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 trace_user_host_signal(cpu, host_sig, sig);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 host_to_target_siginfo_noswap(&amp;tinfo, info);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 queue_signal(env, sig, &amp;tinfo);=C2=A0 =C2=A0 =C2=A0=
 =C2=A0/* XXX how to cope with failure? */<br>
<br>
queue_signal() can&#39;t fail, so there is nothing to cope with.<br>
(Your bsd-user version even has the right &#39;void&#39; type --<br>
linux-user&#39;s returns 1 always and we never look at the return<br>
value, so we should really switch that to void return too.)<br></blockquote=
><div><br></div><div>Submitted a patch to that last bit. I&#39;ll remove th=
is comment in the rework I&#39;m doing.</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Linux does something else here -&gt; the queue =
signal may be wrong, but<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* maybe not.=C2=A0 And then it does the rewind_if=
_in_safe_syscall<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
<br>
I think you have here a bit of a mix of linux-user&#39;s current design<br>
and some older (broken) version. This is how linux-user works today:<br></b=
lockquote><div><br></div><div>Yes. I think we forked bsd-user from linux-us=
er around 2015 and the old</div><div>design dropped signal queueing in 2016=
 if I&#39;m reading git log correctly.</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
=C2=A0* queue_signal() is a little bit misnamed, because there is no<br>
=C2=A0 =C2=A0&quot;queue&quot; here: there can only be at most one &quot;qu=
eued&quot; signal,<br>
=C2=A0 =C2=A0and it lives in the TaskState struct (which is user-only speci=
fic<br>
=C2=A0 =C2=A0information that hangs off the guest CPU struct) as the<br>
=C2=A0 =C2=A0TaskState::sync_signal field. The reason<br>
=C2=A0 =C2=A0we only have one at once is that queue_signal() is used only<b=
r>
=C2=A0 =C2=A0for signals generated by QEMU itself by calling queue_signal()=
<br>
=C2=A0 =C2=A0directly or indirectly from the cpu_loop() code. The cpu loop<=
br>
=C2=A0 =C2=A0always calls process_pending_signals() at the end of its loop,=
<br>
=C2=A0 =C2=A0which will pick up a queued signal. We never call queue_signal=
()<br>
=C2=A0 =C2=A0twice in a row before getting back to process_pending_signals(=
),<br>
=C2=A0 =C2=A0so there&#39;s only ever at most one thing in the &quot;queue&=
quot;.<br>
=C2=A0* for all signals we get from the host except SIGSEGV/SIGBUS,<br>
=C2=A0 =C2=A0we track whether there&#39;s a host signal pending in the<br>
=C2=A0 =C2=A0TaskState::sigtab[] array (which is indexed by signal number).=
<br>
=C2=A0 =C2=A0We block all host signals except SIGSEGV/SIGBUS before calling=
<br>
=C2=A0 =C2=A0cpu_exit(), so we know we&#39;re not going to get more than on=
e<br>
=C2=A0 =C2=A0of these at once (and it won&#39;t clash with a queue_signal()=
<br>
=C2=A0 =C2=A0signal either, as those use the sync_signal field, not the<br>
=C2=A0 =C2=A0sigtab[]).<br>
=C2=A0* for host-sent non-spoofed (ie not sent via &#39;kill()&#39;) SIGSEG=
V/SIGBUS,<br>
=C2=A0 =C2=A0we know this was caused by a bit of generated code, so we just=
<br>
=C2=A0 =C2=A0use cpu_loop_exit_restore() to turn this into an EXCP_INTERRUP=
T<br>
=C2=A0 =C2=A0at the right guest PC<br>
<br>
I feel fairly strongly that you definitely want to use the same<br>
design as current linux-user does for signals:<br>
=C2=A0* getting this right is pretty tricky, and even if we get two<br>
=C2=A0 =C2=A0different designs to both have the same semantics it&#39;s goi=
ng<br>
=C2=A0 =C2=A0to be pretty confusing<br>
=C2=A0* we thought quite hard about the linux-user code at the time<br>
=C2=A0 =C2=A0and it&#39;s definitely less buggy than the previous design<br=
>
=C2=A0* It&#39;s much easier to review the bsd-user code as &quot;yes this =
is<br>
=C2=A0 =C2=A0doing the same thing linux-user does&quot; than working throug=
h<br>
=C2=A0 =C2=A0a different approach from first principles<br></blockquote><di=
v><br></div><div>I agree. I like that design better than what&#39;s in bsd-=
user today and</div><div>seems simpler to implement and get right. I&#39;d =
add a 4th bullet point</div><div>&quot;It&#39;s easier to share code, eithe=
r directly or via copying&quot;</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
I don&#39;t have as strong an opinion on whether we should try to get<br>
it into the tree that way from the start, or to put in whatever<br>
you have currently and then fix it later. (More accurately,<br>
I would prefer to review patches which use the same design<br>
as linux-user but if that&#39;s going to be massively painful/slow<br>
for you to get something upstream doing it that way around<br>
I can probably live with the other approach...)<br></blockquote><div><br></=
div><div>I&#39;m going to start down that path and see if I can rework the =
patches</div><div>and see if it solves some of the regressions we&#39;ve se=
en in bsd-user</div><div>between 6.1 and 6.2 as the signal stuff was rework=
ed in linux-user</div><div>to cope better with sigsegv and sigbus. If that =
works out OK, then</div><div>I&#39;ll move forward with adjusting the fork =
and reflect that back into</div><div>this patch series.</div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* For synchronous signals, unwind the cpu state t=
o the faulting<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* insn and then exit back to the main loop so tha=
t the signal<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* is delivered immediately.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0XXXX Should this be in queue_signal?<br>
<br>
No, because queue_signal() is called for lots of ways to pend<br>
a signal, most of which aren&#39;t real host signals.<br></blockquote><div>=
<br></div><div>OK. I now agree after reading the code.</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 if (sync_sig) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;exception_index =3D EXCP_INTERRUP=
T;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_loop_exit_restore(cpu, pc);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 rewind_if_in_safe_syscall(puc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Block host signals until target signal handler =
entered. We<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* can&#39;t block SIGSEGV or SIGBUS while we&#39;=
re executing guest<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* code in case the guest code provokes one in the=
 window between<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* now and it getting out to the main loop. Signal=
s will be<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* unblocked again in process_pending_signals().<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 sigfillset(&amp;uc-&gt;uc_sigmask);<br>
&gt; +=C2=A0 =C2=A0 sigdelset(&amp;uc-&gt;uc_sigmask, SIGSEGV);<br>
&gt; +=C2=A0 =C2=A0 sigdelset(&amp;uc-&gt;uc_sigmask, SIGBUS);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Interrupt the virtual CPU as soon as possible. */<br=
>
&gt; +=C2=A0 =C2=A0 cpu_exit(thread_cpu);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 void signal_init(void)<br>
<br>
thanks<br></blockquote><div><br></div><div>Thank you for the insight and pl=
aces to focus on making this code better. It&#39;s</div><div>a bit hard to =
discover all this just from reading code in any sane amount of time</div><d=
iv>and it is both quite helpful and much appreciated.</div><div><br></div><=
div>Warner=C2=A0</div></div></div>

--0000000000000e389b05d5b938c1--

