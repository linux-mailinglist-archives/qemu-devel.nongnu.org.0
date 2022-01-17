Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7176C4902D5
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 08:18:03 +0100 (CET)
Received: from localhost ([::1]:43540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9MHA-0004JA-IE
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 02:18:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n9LyV-0006f3-Dr
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 01:58:43 -0500
Received: from [2607:f8b0:4864:20::936] (port=44929
 helo=mail-ua1-x936.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n9LyR-0005iG-2U
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 01:58:43 -0500
Received: by mail-ua1-x936.google.com with SMTP id l15so28625902uai.11
 for <qemu-devel@nongnu.org>; Sun, 16 Jan 2022 22:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+kb5flOz+R2hP/efLNc5uPHYn5LxVQJZhZLeFf39c6I=;
 b=mJ4O6ISE+q7RwCMGJwJmoiSkabHqj0ndnm/XNDCmBV3wVl5KaoW8wmNs7gWwKm698I
 O+rSOn6BYK1RzZlLdWIH2dX3b7ljM6DpdfNDqpWO3S/+EiSi4oJerYYFiZVdqL6bLVIz
 gXsvtgmu/SBLGX8odt9Qw8bP7ZjhU+DZDKmlBj8CBM5J72Scm87F6KWn/lWB6y9/tE8k
 d6RTxf387ZkrZPEaRuIBTCJmod8F1JhgdvQo+OqE7O1TYZENCBnbJePLAYl1kNtqJto7
 9EbX3xvU8QYXBUvl9g83ND9SncsZH2LP/gLzvbHx7c44DqDE8SUM2scJzwsL0xIr0F+9
 KPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+kb5flOz+R2hP/efLNc5uPHYn5LxVQJZhZLeFf39c6I=;
 b=3/htErYzeHqr8GTq+H5IDRmRBaRE/5C/cjEBduucT+nM2rKDsuopPVQufSquQC2DhU
 3QX0wGOEkHj8GdxmyMs12oXnLL2wymvzY2evvnzSr7G7PRX3WF0PkiVwg3EMxT5ozP9S
 Fbh8J89yk1k6VaT89ySXW4Ysx3gwQicCL5cYT+mQc5zbUa+HRflyN0goEP5n20Jz5N86
 oVg5IiBc2diRNSXWRYG3YEIu9oPuJOsiUYXPK9j5OErBE7LAPuuTqL4NOEzqLV3jEz9i
 q/GAFreKag+pea2ui34u5EC+VI24SRwZ6NAUn2CeRBNji+UUfE0Gq5EOCHLcj9qOGA/P
 n+jw==
X-Gm-Message-State: AOAM531ZmTaQrnB2nZe9Q10vuOZl27YDMAqqK3TSYNrAe5vwAnKdUOS8
 0gUjo+2/Z/EJ/kO31+tgZ5hJedYA7rTh+fGQKktUuw==
X-Google-Smtp-Source: ABdhPJw8cTSBNEQmWogUCQYSwVwK78pfz83Z+XvEP/pnxvc8rziBrIGXGsf+YXr1lAuDQQjTeyxDUADgQsVhnG8ALcM=
X-Received: by 2002:a05:6102:ecf:: with SMTP id
 m15mr6320900vst.68.1642402709326; 
 Sun, 16 Jan 2022 22:58:29 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-25-imp@bsdimp.com>
 <CAFEAcA95+ufTnr1PQRHTFttai=9LVv4dXznPTAobSUAueg_QSA@mail.gmail.com>
In-Reply-To: <CAFEAcA95+ufTnr1PQRHTFttai=9LVv4dXznPTAobSUAueg_QSA@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 16 Jan 2022 23:58:26 -0700
Message-ID: <CANCZdfqVbdwPUL0U01rRvPhcRctzSQDQsA4Xn5L62=AwcSmx3w@mail.gmail.com>
Subject: Re: [PATCH 24/30] bsd-user/signal.c: setup_frame
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000011620b05d5c1aee8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::936
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::936;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x936.google.com
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

--00000000000011620b05d5c1aee8
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 14, 2022 at 4:40 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Sun, 9 Jan 2022 at 16:36, Warner Losh <imp@bsdimp.com> wrote:
> >
> > setup_frame sets up a signalled stack frame. Associated routines to
> > extract the pointer to the stack frame and to support alternate stacks.
> >
> > Signed-off-by: Stacey Son <sson@FreeBSD.org>
> > Signed-off-by: Kyle Evans <kevans@freebsd.org>
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >  bsd-user/signal.c | 166 ++++++++++++++++++++++++++++++++++++++++------
> >  1 file changed, 144 insertions(+), 22 deletions(-)
> >
> > diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> > index 8dadc9a39a7..8e1427553da 100644
> > --- a/bsd-user/signal.c
> > +++ b/bsd-user/signal.c
> > @@ -30,11 +30,27 @@
> >   * fork.
> >   */
> >
> > +static target_stack_t target_sigaltstack_used = {
> > +    .ss_sp = 0,
> > +    .ss_size = 0,
> > +    .ss_flags = TARGET_SS_DISABLE,
> > +};
>
> sigaltstacks are per-thread, so this needs to be in the TaskState,
> not global. (We fixed this in linux-user in commit 5bfce0b74fbd5d5
> in 2019: the change is relatively small.)
>

Done. I saw go mentioned, which I know doesn't work today, so it's
a good step in that direction...


> > +
> >  static struct target_sigaction sigact_table[TARGET_NSIG];
> >  static void host_signal_handler(int host_sig, siginfo_t *info, void
> *puc);
> >  static void target_to_host_sigset_internal(sigset_t *d,
> >          const target_sigset_t *s);
> >
> > +static inline int on_sig_stack(unsigned long sp)
> > +{
> > +    return sp - target_sigaltstack_used.ss_sp <
> target_sigaltstack_used.ss_size;
> > +}
> > +
> > +static inline int sas_ss_flags(unsigned long sp)
> > +{
> > +    return target_sigaltstack_used.ss_size == 0 ? SS_DISABLE :
> on_sig_stack(sp)
> > +        ? SS_ONSTACK : 0;
> > +}
> >
> >  int host_to_target_signal(int sig)
> >  {
> > @@ -336,28 +352,6 @@ void queue_signal(CPUArchState *env, int sig,
> target_siginfo_t *info)
> >      return;
> >  }
> >
> > -static int fatal_signal(int sig)
> > -{
> > -
> > -    switch (sig) {
> > -    case TARGET_SIGCHLD:
> > -    case TARGET_SIGURG:
> > -    case TARGET_SIGWINCH:
> > -    case TARGET_SIGINFO:
> > -        /* Ignored by default. */
> > -        return 0;
> > -    case TARGET_SIGCONT:
> > -    case TARGET_SIGSTOP:
> > -    case TARGET_SIGTSTP:
> > -    case TARGET_SIGTTIN:
> > -    case TARGET_SIGTTOU:
> > -        /* Job control signals.  */
> > -        return 0;
> > -    default:
> > -        return 1;
> > -    }
> > -}
>
> There wasn't any need to move this function, I think ?
>

No, there was some other conflict during rebase getting the patch train
ready that I thought I'd cleaned up, but this was fallout from that which
I overlooked. I've undone it...


> > -
> >  /*
> >   * Force a synchronously taken QEMU_SI_FAULT signal. For QEMU the
> >   * 'force' part is handled in process_pending_signals().
> > @@ -484,6 +478,134 @@ static void host_signal_handler(int host_sig,
> siginfo_t *info, void *puc)
> >      cpu_exit(thread_cpu);
> >  }
> >
> > +static int fatal_signal(int sig)
> > +{
> > +
> > +    switch (sig) {
> > +    case TARGET_SIGCHLD:
> > +    case TARGET_SIGURG:
> > +    case TARGET_SIGWINCH:
> > +    case TARGET_SIGINFO:
> > +        /* Ignored by default. */
> > +        return 0;
> > +    case TARGET_SIGCONT:
> > +    case TARGET_SIGSTOP:
> > +    case TARGET_SIGTSTP:
> > +    case TARGET_SIGTTIN:
> > +    case TARGET_SIGTTOU:
> > +        /* Job control signals.  */
> > +        return 0;
> > +    default:
> > +        return 1;
> > +    }
> > +}
> > +
> > +static inline abi_ulong get_sigframe(struct target_sigaction *ka,
> > +        CPUArchState *regs, size_t frame_size)
> > +{
> > +    abi_ulong sp;
> > +
> > +    /* Use default user stack */
> > +    sp = get_sp_from_cpustate(regs);
> > +
> > +    if ((ka->sa_flags & TARGET_SA_ONSTACK) && (sas_ss_flags(sp) == 0)) {
> > +        sp = target_sigaltstack_used.ss_sp +
> > +            target_sigaltstack_used.ss_size;
> > +    }
> > +
> > +#if defined(TARGET_MIPS) || defined(TARGET_ARM)
> > +    return (sp - frame_size) & ~7;
> > +#elif defined(TARGET_AARCH64)
> > +    return (sp - frame_size) & ~15;
> > +#else
> > +    return sp - frame_size;
> > +#endif
>
> We don't need to do it in this patchseries, but you should strongly
> consider pulling the architecture-specifics out in a way that
> avoids this kind of ifdef ladder.
>

Totally agreed. I debated fixing this before I started this patch
run, but I decided to pick my battles... I'll fix this in a follow up.


> > +}
> > +
> > +/* compare to mips/mips/pm_machdep.c and sparc64/sparc64/machdep.c
> sendsig() */
>

Two dead architectures... I've updated the comments...  and the filename
which
they live in...


> > +static void setup_frame(int sig, int code, struct target_sigaction *ka,
> > +    target_sigset_t *set, target_siginfo_t *tinfo, CPUArchState *regs)
> > +{
> > +    struct target_sigframe *frame;
> > +    abi_ulong frame_addr;
> > +    int i;
> > +
> > +    frame_addr = get_sigframe(ka, regs, sizeof(*frame));
> > +    trace_user_setup_frame(regs, frame_addr);
> > +    if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
> > +        goto give_sigsegv;
>
> FreeBSD for Arm (haven't checked other BSDs or other archs)
> gives a SIGILL for the "can't write signal frame to stack"
> case, I think:
>
> https://github.com/freebsd/freebsd-src/blob/main/sys/arm/arm/exec_machdep.c#L316
> I don't understand why they picked SIGILL, SIGSEGV seems much more
> logical to me, but we should follow the kernel behaviour.
>

This is a good thing to find. I'm going to have to study all the
architectures, but
the first 5 I looked at all returned SIGILL, so this code has to change to
reflect
that...


> > +    }
> > +
> > +    memset(frame, 0, sizeof(*frame));
> > +#if defined(TARGET_MIPS)
> > +    int mflags = on_sig_stack(frame_addr) ? TARGET_MC_ADD_MAGIC :
> > +        TARGET_MC_SET_ONSTACK | TARGET_MC_ADD_MAGIC;
> > +#else
> > +    int mflags = 0;
> > +#endif
> > +    if (get_mcontext(regs, &frame->sf_uc.uc_mcontext, mflags)) {
> > +        goto give_sigsegv;
>
> The FreeBSD kernel get_mcontext() can't fail -- why can ours ?
> (This matters because SIGSEGV may not be the right response to
> whatever the failure case is.)
>

    if (mcp->mc_vfp_size != 0 && mcp->mc_vfp_size !=
sizeof(target_mcontext_vfp_t)) {

is what I try to validate, but looking at the kernel code it does NOT
return vfp, so that
check is bogus. I need to remove it (I'd added as part of a prior review
without fully
checking before I made the change, to be honest).


> > +    }
> > +
> > +    for (i = 0; i < TARGET_NSIG_WORDS; i++) {
> > +        if (__put_user(set->__bits[i],
> &frame->sf_uc.uc_sigmask.__bits[i])) {
> > +            goto give_sigsegv;
>
> __get_user() and __put_user() in QEMU can't fail, so you don't
> need to check for errors here, unlike the non-double-underscore
> versions. At some point you might want to take the current linux-user
> versions of these user-access functions/macros: it looks like bsd-user
> has an older version which doesn't handle the case where the guest
> has looser alignment restrictions than the host. The new ones
> actually expand to do { ... } while(0) statements which won't
> be valid inside an if() condition.
>

OK. I'll make a sweep in addition to fixing this.


> (Historical note: the reason QEMU's __put_user/__get_user ever had
> return values at all is that the linux-user code was copy-and-pasted
> from the Linux kernel. In the Linux kernel handling of writing
> data to userspace is/was error-checked on every write, whereas
> QEMU does the "is this writable" test once with the lock_user
> function and then can assume all the writes to that area succeed.
> But we still started with a lot of copy-pasted code that was doing
> unnecessary checks on __put_user and __get_user return values.
> FreeBSD seems to handle write-checking in yet a third way, by
> assembling the struct in kernel-space and checking for writability
> once at the end when it copies the whole block out to userspace.)
>

We're nothing if not creative... But this is old school Unix which started
doing this in V7 which started doing it for stat and ftime system calls...


> > +        }
> > +    }
> > +
> > +    if (tinfo) {
> > +        frame->sf_si.si_signo = tinfo->si_signo;
> > +        frame->sf_si.si_errno = tinfo->si_errno;
> > +        frame->sf_si.si_code = tinfo->si_code;
> > +        frame->sf_si.si_pid = tinfo->si_pid;
> > +        frame->sf_si.si_uid = tinfo->si_uid;
> > +        frame->sf_si.si_status = tinfo->si_status;
> > +        frame->sf_si.si_addr = tinfo->si_addr;
> > +
> > +        if (TARGET_SIGILL == sig || TARGET_SIGFPE == sig ||
> > +                TARGET_SIGSEGV == sig || TARGET_SIGBUS == sig ||
> > +                TARGET_SIGTRAP == sig) {
> > +            frame->sf_si._reason._fault._trapno =
> tinfo->_reason._fault._trapno;
> > +        }
> > +
> > +        /*
> > +         * If si_code is one of SI_QUEUE, SI_TIMER, SI_ASYNCIO, or
> > +         * SI_MESGQ, then si_value contains the application-specified
> > +         * signal value. Otherwise, the contents of si_value are
> > +         * undefined.
> > +         */
> > +        if (SI_QUEUE == code || SI_TIMER == code || SI_ASYNCIO == code
> ||
> > +                SI_MESGQ == code) {
> > +            frame->sf_si.si_value.sival_int = tinfo->si_value.sival_int;
> > +        }
> > +
> > +        if (SI_TIMER == code) {
> > +            frame->sf_si._reason._timer._timerid =
> > +                tinfo->_reason._timer._timerid;
> > +            frame->sf_si._reason._timer._overrun =
> > +                tinfo->_reason._timer._overrun;
> > +        }
> > +
> > +#ifdef SIGPOLL
> > +        if (SIGPOLL == sig) {
> > +            frame->sf_si._reason._band = tinfo->_reason._band;
> > +        }
> > +#endif
>
> This seems to be yet a third set of the logic for handling
> target_siginfo_t's union, to go along with tswap_siginfo() and
> host_to_target_siginfo_noswap(), except that the logic here is
> different. linux-user calls tswap_siginfo() in its signal-frame
> setup code.
>

Yea, I need to get that sorted out as well.. It's my biggest remaining
item to resolve (except maybe for the comments for do_* you made,
I've not yet completely digested them when I saw they were more
than reviewed by).


> > +
> > +    }
> > +
> > +    if (set_sigtramp_args(regs, sig, frame, frame_addr, ka)) {
> > +        goto give_sigsegv;
> > +    }
>
> set_sigtramp_args() can't fail. (Not sure why it has a non-void
> return type.)
>

OK. I'll fix this as well.


> > +
> > +    unlock_user_struct(frame, frame_addr, 1);
> > +    return;
> > +
> > +give_sigsegv:
> > +    unlock_user_struct(frame, frame_addr, 1);
> > +    force_sig(TARGET_SIGSEGV);
> > +}
> > +
> >  void signal_init(void)
> >  {
> >      TaskState *ts = (TaskState *)thread_cpu->opaque;
> > --
> > 2.33.1
>
> thanks
>

No, thank you. This is quite helpful and got me to look at a number of new
places and understand some historic background.

Warmer -- PMM

--00000000000011620b05d5c1aee8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 14, 2022 at 4:40 AM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Sun, 9 Jan 2022 at 16:36, Warner Losh &lt;<a href=3D"mailto:imp@bs=
dimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt;<br>
&gt; setup_frame sets up a signalled stack frame. Associated routines to<br=
>
&gt; extract the pointer to the stack frame and to support alternate stacks=
.<br>
&gt;<br>
&gt; Signed-off-by: Stacey Son &lt;sson@FreeBSD.org&gt;<br>
&gt; Signed-off-by: Kyle Evans &lt;<a href=3D"mailto:kevans@freebsd.org" ta=
rget=3D"_blank">kevans@freebsd.org</a>&gt;<br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 bsd-user/signal.c | 166 ++++++++++++++++++++++++++++++++++++++++=
------<br>
&gt;=C2=A0 1 file changed, 144 insertions(+), 22 deletions(-)<br>
&gt;<br>
&gt; diff --git a/bsd-user/signal.c b/bsd-user/signal.c<br>
&gt; index 8dadc9a39a7..8e1427553da 100644<br>
&gt; --- a/bsd-user/signal.c<br>
&gt; +++ b/bsd-user/signal.c<br>
&gt; @@ -30,11 +30,27 @@<br>
&gt;=C2=A0 =C2=A0* fork.<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;<br>
&gt; +static target_stack_t target_sigaltstack_used =3D {<br>
&gt; +=C2=A0 =C2=A0 .ss_sp =3D 0,<br>
&gt; +=C2=A0 =C2=A0 .ss_size =3D 0,<br>
&gt; +=C2=A0 =C2=A0 .ss_flags =3D TARGET_SS_DISABLE,<br>
&gt; +};<br>
<br>
sigaltstacks are per-thread, so this needs to be in the TaskState,<br>
not global. (We fixed this in linux-user in commit 5bfce0b74fbd5d5<br>
in 2019: the change is relatively small.)<br></blockquote><div><br></div><d=
iv>Done. I saw go mentioned, which I know doesn&#39;t work today, so it&#39=
;s</div><div>a good step in that direction...<br></div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +<br>
&gt;=C2=A0 static struct target_sigaction sigact_table[TARGET_NSIG];<br>
&gt;=C2=A0 static void host_signal_handler(int host_sig, siginfo_t *info, v=
oid *puc);<br>
&gt;=C2=A0 static void target_to_host_sigset_internal(sigset_t *d,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const target_sigset_t *s);<br>
&gt;<br>
&gt; +static inline int on_sig_stack(unsigned long sp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 return sp - target_sigaltstack_used.ss_sp &lt; target_s=
igaltstack_used.ss_size;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline int sas_ss_flags(unsigned long sp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 return target_sigaltstack_used.ss_size =3D=3D 0 ? SS_DI=
SABLE : on_sig_stack(sp)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ? SS_ONSTACK : 0;<br>
&gt; +}<br>
&gt;<br>
&gt;=C2=A0 int host_to_target_signal(int sig)<br>
&gt;=C2=A0 {<br>
&gt; @@ -336,28 +352,6 @@ void queue_signal(CPUArchState *env, int sig, tar=
get_siginfo_t *info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -static int fatal_signal(int sig)<br>
&gt; -{<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 switch (sig) {<br>
&gt; -=C2=A0 =C2=A0 case TARGET_SIGCHLD:<br>
&gt; -=C2=A0 =C2=A0 case TARGET_SIGURG:<br>
&gt; -=C2=A0 =C2=A0 case TARGET_SIGWINCH:<br>
&gt; -=C2=A0 =C2=A0 case TARGET_SIGINFO:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Ignored by default. */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; -=C2=A0 =C2=A0 case TARGET_SIGCONT:<br>
&gt; -=C2=A0 =C2=A0 case TARGET_SIGSTOP:<br>
&gt; -=C2=A0 =C2=A0 case TARGET_SIGTSTP:<br>
&gt; -=C2=A0 =C2=A0 case TARGET_SIGTTIN:<br>
&gt; -=C2=A0 =C2=A0 case TARGET_SIGTTOU:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Job control signals.=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; -=C2=A0 =C2=A0 default:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -}<br>
<br>
There wasn&#39;t any need to move this function, I think ?<br></blockquote>=
<div><br></div><div>No, there was some other conflict during rebase getting=
 the patch train</div><div>ready that I thought I&#39;d cleaned up, but thi=
s was fallout from that which</div><div>I overlooked. I&#39;ve undone it...=
<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
&gt; -<br>
&gt;=C2=A0 /*<br>
&gt;=C2=A0 =C2=A0* Force a synchronously taken QEMU_SI_FAULT signal. For QE=
MU the<br>
&gt;=C2=A0 =C2=A0* &#39;force&#39; part is handled in process_pending_signa=
ls().<br>
&gt; @@ -484,6 +478,134 @@ static void host_signal_handler(int host_sig, si=
ginfo_t *info, void *puc)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cpu_exit(thread_cpu);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +static int fatal_signal(int sig)<br>
&gt; +{<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 switch (sig) {<br>
&gt; +=C2=A0 =C2=A0 case TARGET_SIGCHLD:<br>
&gt; +=C2=A0 =C2=A0 case TARGET_SIGURG:<br>
&gt; +=C2=A0 =C2=A0 case TARGET_SIGWINCH:<br>
&gt; +=C2=A0 =C2=A0 case TARGET_SIGINFO:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Ignored by default. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +=C2=A0 =C2=A0 case TARGET_SIGCONT:<br>
&gt; +=C2=A0 =C2=A0 case TARGET_SIGSTOP:<br>
&gt; +=C2=A0 =C2=A0 case TARGET_SIGTSTP:<br>
&gt; +=C2=A0 =C2=A0 case TARGET_SIGTTIN:<br>
&gt; +=C2=A0 =C2=A0 case TARGET_SIGTTOU:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Job control signals.=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline abi_ulong get_sigframe(struct target_sigaction *ka,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 CPUArchState *regs, size_t frame_size)<br=
>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 abi_ulong sp;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Use default user stack */<br>
&gt; +=C2=A0 =C2=A0 sp =3D get_sp_from_cpustate(regs);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if ((ka-&gt;sa_flags &amp; TARGET_SA_ONSTACK) &amp;&amp=
; (sas_ss_flags(sp) =3D=3D 0)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sp =3D target_sigaltstack_used.ss_sp +<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_sigaltstack_used.ss_=
size;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +#if defined(TARGET_MIPS) || defined(TARGET_ARM)<br>
&gt; +=C2=A0 =C2=A0 return (sp - frame_size) &amp; ~7;<br>
&gt; +#elif defined(TARGET_AARCH64)<br>
&gt; +=C2=A0 =C2=A0 return (sp - frame_size) &amp; ~15;<br>
&gt; +#else<br>
&gt; +=C2=A0 =C2=A0 return sp - frame_size;<br>
&gt; +#endif<br>
<br>
We don&#39;t need to do it in this patchseries, but you should strongly<br>
consider pulling the architecture-specifics out in a way that<br>
avoids this kind of ifdef ladder.<br></blockquote><div><br></div><div>Total=
ly agreed. I debated fixing this before I started this patch</div><div>run,=
 but I decided to pick my battles... I&#39;ll fix this in a follow up.<br><=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +}<br>
&gt; +<br>
&gt; +/* compare to mips/mips/pm_machdep.c and sparc64/sparc64/machdep.c se=
ndsig() */<br></blockquote><div><br></div><div>Two dead architectures... I&=
#39;ve updated the comments...=C2=A0 and the filename which</div><div>they =
live in...<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
&gt; +static void setup_frame(int sig, int code, struct target_sigaction *k=
a,<br>
&gt; +=C2=A0 =C2=A0 target_sigset_t *set, target_siginfo_t *tinfo, CPUArchS=
tate *regs)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 struct target_sigframe *frame;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong frame_addr;<br>
&gt; +=C2=A0 =C2=A0 int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 frame_addr =3D get_sigframe(ka, regs, sizeof(*frame));<=
br>
&gt; +=C2=A0 =C2=A0 trace_user_setup_frame(regs, frame_addr);<br>
&gt; +=C2=A0 =C2=A0 if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, =
0)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto give_sigsegv;<br>
<br>
FreeBSD for Arm (haven&#39;t checked other BSDs or other archs)<br>
gives a SIGILL for the &quot;can&#39;t write signal frame to stack&quot;<br=
>
case, I think:<br>
<a href=3D"https://github.com/freebsd/freebsd-src/blob/main/sys/arm/arm/exe=
c_machdep.c#L316" rel=3D"noreferrer" target=3D"_blank">https://github.com/f=
reebsd/freebsd-src/blob/main/sys/arm/arm/exec_machdep.c#L316</a><br>
I don&#39;t understand why they picked SIGILL, SIGSEGV seems much more<br>
logical to me, but we should follow the kernel behaviour.<br></blockquote><=
div><br></div><div>This is a good thing to find. I&#39;m going to have to s=
tudy all the architectures, but<br></div><div>the first 5 I looked at all r=
eturned SIGILL, so this code has to change to reflect</div><div>that...<br>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 memset(frame, 0, sizeof(*frame));<br>
&gt; +#if defined(TARGET_MIPS)<br>
&gt; +=C2=A0 =C2=A0 int mflags =3D on_sig_stack(frame_addr) ? TARGET_MC_ADD=
_MAGIC :<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 TARGET_MC_SET_ONSTACK | TARGET_MC_ADD_MAG=
IC;<br>
&gt; +#else<br>
&gt; +=C2=A0 =C2=A0 int mflags =3D 0;<br>
&gt; +#endif<br>
&gt; +=C2=A0 =C2=A0 if (get_mcontext(regs, &amp;frame-&gt;sf_uc.uc_mcontext=
, mflags)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto give_sigsegv;<br>
<br>
The FreeBSD kernel get_mcontext() can&#39;t fail -- why can ours ?<br>
(This matters because SIGSEGV may not be the right response to<br>
whatever the failure case is.)<br></blockquote><div><br></div><div>=C2=A0 =
=C2=A0 if (mcp-&gt;mc_vfp_size !=3D 0 &amp;&amp; mcp-&gt;mc_vfp_size !=3D s=
izeof(target_mcontext_vfp_t)) {</div><div><br></div><div>is what I try to v=
alidate, but looking at the kernel code it does NOT return vfp, so that</di=
v><div>check is bogus. I need to remove it (I&#39;d added as part of a prio=
r review without fully</div><div>checking before I made the change, to be h=
onest).<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; TARGET_NSIG_WORDS; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (__put_user(set-&gt;__bits[i], &amp;fr=
ame-&gt;sf_uc.uc_sigmask.__bits[i])) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto give_sigsegv;<br>
<br>
__get_user() and __put_user() in QEMU can&#39;t fail, so you don&#39;t<br>
need to check for errors here, unlike the non-double-underscore<br>
versions. At some point you might want to take the current linux-user<br>
versions of these user-access functions/macros: it looks like bsd-user<br>
has an older version which doesn&#39;t handle the case where the guest<br>
has looser alignment restrictions than the host. The new ones<br>
actually expand to do { ... } while(0) statements which won&#39;t<br>
be valid inside an if() condition.<br></blockquote><div><br></div><div>OK. =
I&#39;ll make a sweep in addition to fixing this.<br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
(Historical note: the reason QEMU&#39;s __put_user/__get_user ever had<br>
return values at all is that the linux-user code was copy-and-pasted<br>
from the Linux kernel. In the Linux kernel handling of writing<br>
data to userspace is/was error-checked on every write, whereas<br>
QEMU does the &quot;is this writable&quot; test once with the lock_user<br>
function and then can assume all the writes to that area succeed.<br>
But we still started with a lot of copy-pasted code that was doing<br>
unnecessary checks on __put_user and __get_user return values.<br>
FreeBSD seems to handle write-checking in yet a third way, by<br>
assembling the struct in kernel-space and checking for writability<br>
once at the end when it copies the whole block out to userspace.)<br></bloc=
kquote><div><br></div><div>We&#39;re nothing if not creative... But this is=
 old school Unix which started<br></div><div>doing this in V7 which started=
 doing it for stat and ftime system calls...<br></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (tinfo) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 frame-&gt;sf_si.si_signo =3D tinfo-&gt;si=
_signo;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 frame-&gt;sf_si.si_errno =3D tinfo-&gt;si=
_errno;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 frame-&gt;sf_si.si_code =3D tinfo-&gt;si_=
code;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 frame-&gt;sf_si.si_pid =3D tinfo-&gt;si_p=
id;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 frame-&gt;sf_si.si_uid =3D tinfo-&gt;si_u=
id;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 frame-&gt;sf_si.si_status =3D tinfo-&gt;s=
i_status;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 frame-&gt;sf_si.si_addr =3D tinfo-&gt;si_=
addr;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (TARGET_SIGILL =3D=3D sig || TARGET_SI=
GFPE =3D=3D sig ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TARGET_SIGSEG=
V =3D=3D sig || TARGET_SIGBUS =3D=3D sig ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TARGET_SIGTRA=
P =3D=3D sig) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 frame-&gt;sf_si._reason._fa=
ult._trapno =3D tinfo-&gt;_reason._fault._trapno;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If si_code is one of SI_QUEUE, SI=
_TIMER, SI_ASYNCIO, or<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* SI_MESGQ, then si_value contains =
the application-specified<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* signal value. Otherwise, the cont=
ents of si_value are<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* undefined.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (SI_QUEUE =3D=3D code || SI_TIMER =3D=
=3D code || SI_ASYNCIO =3D=3D code ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SI_MESGQ =3D=
=3D code) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 frame-&gt;sf_si.si_value.si=
val_int =3D tinfo-&gt;si_value.sival_int;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (SI_TIMER =3D=3D code) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 frame-&gt;sf_si._reason._ti=
mer._timerid =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tinfo-&gt;_re=
ason._timer._timerid;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 frame-&gt;sf_si._reason._ti=
mer._overrun =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tinfo-&gt;_re=
ason._timer._overrun;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +#ifdef SIGPOLL<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (SIGPOLL =3D=3D sig) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 frame-&gt;sf_si._reason._ba=
nd =3D tinfo-&gt;_reason._band;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +#endif<br>
<br>
This seems to be yet a third set of the logic for handling<br>
target_siginfo_t&#39;s union, to go along with tswap_siginfo() and<br>
host_to_target_siginfo_noswap(), except that the logic here is<br>
different. linux-user calls tswap_siginfo() in its signal-frame<br>
setup code.<br></blockquote><div><br></div><div>Yea, I need to get that sor=
ted out as well.. It&#39;s my biggest remaining</div><div>item to resolve (=
except maybe for the comments for do_* you made,</div><div>I&#39;ve not yet=
 completely digested them when I saw they were more</div><div>than reviewed=
 by).<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
&gt; +<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (set_sigtramp_args(regs, sig, frame, frame_addr, ka)=
) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto give_sigsegv;<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
set_sigtramp_args() can&#39;t fail. (Not sure why it has a non-void<br>
return type.)<br></blockquote><div><br></div><div>OK. I&#39;ll fix this as =
well.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
&gt; +<br>
&gt; +=C2=A0 =C2=A0 unlock_user_struct(frame, frame_addr, 1);<br>
&gt; +=C2=A0 =C2=A0 return;<br>
&gt; +<br>
&gt; +give_sigsegv:<br>
&gt; +=C2=A0 =C2=A0 unlock_user_struct(frame, frame_addr, 1);<br>
&gt; +=C2=A0 =C2=A0 force_sig(TARGET_SIGSEGV);<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 void signal_init(void)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 TaskState *ts =3D (TaskState *)thread_cpu-&gt;opaq=
ue;<br>
&gt; --<br>
&gt; 2.33.1<br>
<br>
thanks<br></blockquote><div><br></div><div>No, thank you. This is quite hel=
pful and got me to look at a number of new</div><div>places and understand =
some historic background.</div><div><br></div><div>Warmer
-- PMM</div></div></div>

--00000000000011620b05d5c1aee8--

