Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9873349988B
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 22:38:01 +0100 (CET)
Received: from localhost ([::1]:52020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC72G-00053W-Mw
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 16:38:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nC6zq-0002q4-Am
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 16:35:31 -0500
Received: from [2607:f8b0:4864:20::a2a] (port=43991
 helo=mail-vk1-xa2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nC6zk-0006wm-Cj
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 16:35:27 -0500
Received: by mail-vk1-xa2a.google.com with SMTP id w206so11089777vkd.10
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 13:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/xFTQjp3ckLfhgii5Xnt1UGwdnbfHAy4X4c7WxkunlY=;
 b=o9z7n6GTCogbF4cDPn60SIeF+ZTBW+5lmqYzb16MVGdbfeScmtnbr47+CHddqPXRgt
 MPTFv+XjV6S0Ye0zUY+YXH6s/2w7Ekheyc49hwDbHXDALX6f4SlyezmBB8eaf7d3zsBr
 BgbJBh5lc85UWNfKavoV3K35BHXv+ZGjGzB00EN0HVSRz2DlC7EVFpcgMNio8vtjcAt/
 yetrSIThefEzcCDhI+uCriMLxUjruS+AQ4bJkK5jX7JxAE5UkD9qcOtCKrhV7mz7/TFq
 GFBPMdiyK/Obvy7Y5MmSB4d2oVU4aGQ5YmrqOe4RLOai7i2xghz456DeRA8WT+H/0dzh
 Udpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/xFTQjp3ckLfhgii5Xnt1UGwdnbfHAy4X4c7WxkunlY=;
 b=o+4PSTfDkMpjOmgM6MaX6sV2xSWwBLYnXqj3iLjGadD4XO1KMappL7thSMTfOc+7Hm
 MEVsZQuqxYE9EaAqmq1IT/0SHlhBA8cl6vDSk7ziYv4shgKNMXfNeVDnECbRKUqbiUaM
 UEW2ul44Vno5sRl20wanj9WcsZOyyKjmlsntJtzQGZeQ/gPSbnsKMSRX+8p95vHWMpfz
 cAk1Gxw2/JJ5Lq+8dwrV5l5aT7iBoPLwaAsq4v6pjtBtE6B2EzFTTnV8Q0sAjiL5BDhq
 UEnt9v5wu0UUjx7ysQjdXjr4B26+L+SaAE9GLSu3HjH/fXWadlgdPhFtTIohd/ScHiLD
 4sVQ==
X-Gm-Message-State: AOAM533oDD1Bmm1pPgd5bfg5wZXtEZPvMVOyXMu5qsaYOQoDHAIdDUum
 /B4LFVqyCNkZgOCWdEI1rtrKfmGWHhl2Mfiq9PrDgmAHGZw=
X-Google-Smtp-Source: ABdhPJzKx1tA15+93s3cknDkXWAxWY+XiNbyg8YpULobnldDdglmoBKm7WJ2NdpIDbb7Y0o8T5Z14SrPIP5Ya5EHa08=
X-Received: by 2002:a05:6122:130f:: with SMTP id
 e15mr2119520vkp.26.1643060116129; 
 Mon, 24 Jan 2022 13:35:16 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-11-imp@bsdimp.com>
 <bddea574-4a35-51fa-f483-c15128f79082@linaro.org>
In-Reply-To: <bddea574-4a35-51fa-f483-c15128f79082@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 24 Jan 2022 14:35:05 -0700
Message-ID: <CANCZdfoDLd0V_7EzGODJK0XMe7zaUCEL9RLzg2nYXFY+nbtfFg@mail.gmail.com>
Subject: Re: [PATCH 10/30] bsd-user/signal.c: Implement signal_init()
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000091279e05d65abe57"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a2a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa2a.google.com
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

--00000000000091279e05d65abe57
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 23, 2022 at 6:38 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 1/10/22 3:19 AM, Warner Losh wrote:
> > Initialize the signal state for the emulator. Setup a set of sane
> > default signal handlers, mirroring the host's signals. For fatal signals
> > (those that exit by default), establish our own set of signal
> > handlers. Stub out the actual signal handler we use for the moment.
> >
> > Signed-off-by: Stacey Son <sson@FreeBSD.org>
> > Signed-off-by: Kyle Evans <kevans@freebsd.org>
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >   bsd-user/qemu.h   |  1 +
> >   bsd-user/signal.c | 68 +++++++++++++++++++++++++++++++++++++++++++++++
> >   2 files changed, 69 insertions(+)
> >
> > diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> > index 334f8b1d715..0e0b8db708b 100644
> > --- a/bsd-user/qemu.h
> > +++ b/bsd-user/qemu.h
> > @@ -97,6 +97,7 @@ typedef struct TaskState {
> >       struct qemu_sigqueue sigqueue_table[MAX_SIGQUEUE_SIZE]; /* siginfo
> queue */
> >       struct qemu_sigqueue *first_free; /* first free siginfo queue
> entry */
> >       int signal_pending; /* non zero if a signal may be pending */
> > +    sigset_t signal_mask;
> >
> >       uint8_t stack[];
> >   } __attribute__((aligned(16))) TaskState;
> > diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> > index 7ea86149981..b2c91c39379 100644
> > --- a/bsd-user/signal.c
> > +++ b/bsd-user/signal.c
> > @@ -28,6 +28,9 @@
> >    * fork.
> >    */
> >
> > +static struct target_sigaction sigact_table[TARGET_NSIG];
> > +static void host_signal_handler(int host_sig, siginfo_t *info, void
> *puc);
> > +
> >   int host_to_target_signal(int sig)
> >   {
> >       return sig;
> > @@ -47,6 +50,28 @@ void queue_signal(CPUArchState *env, int sig,
> target_siginfo_t *info)
> >       qemu_log_mask(LOG_UNIMP, "No signal queueing, dropping signal
> %d\n", sig);
> >   }
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
> >   /*
> >    * Force a synchronously taken QEMU_SI_FAULT signal. For QEMU the
> >    * 'force' part is handled in process_pending_signals().
> > @@ -64,8 +89,51 @@ void force_sig_fault(int sig, int code, abi_ulong
> addr)
> >       queue_signal(env, sig, &info);
> >   }
> >
> > +static void host_signal_handler(int host_sig, siginfo_t *info, void
> *puc)
> > +{
> > +}
> > +
> >   void signal_init(void)
> >   {
> > +    TaskState *ts = (TaskState *)thread_cpu->opaque;
> > +    struct sigaction act;
> > +    struct sigaction oact;
> > +    int i;
> > +    int host_sig;
> > +
> > +    /* Set the signal mask from the host mask. */
> > +    sigprocmask(0, 0, &ts->signal_mask);
> > +
> > +    /*
> > +     * Set all host signal handlers. ALL signals are blocked during the
> > +     * handlers to serialize them.
> > +     */
> > +    memset(sigact_table, 0, sizeof(sigact_table));
> > +
> > +    sigfillset(&act.sa_mask);
> > +    act.sa_sigaction = host_signal_handler;
> > +    act.sa_flags = SA_SIGINFO;
> > +
> > +    for (i = 1; i <= TARGET_NSIG; i++) {
> > +        host_sig = target_to_host_signal(i);
> > +        sigaction(host_sig, NULL, &oact);
>
> Missing test for CONFIG_GPROF + SIGPROF.  Otherwise,
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>

Gotcha. Will add.

Warner

--00000000000091279e05d65abe57
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jan 23, 2022 at 6:38 PM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 1/10/22 3:19 AM, Warner Losh wrote:<br>
&gt; Initialize the signal state for the emulator. Setup a set of sane<br>
&gt; default signal handlers, mirroring the host&#39;s signals. For fatal s=
ignals<br>
&gt; (those that exit by default), establish our own set of signal<br>
&gt; handlers. Stub out the actual signal handler we use for the moment.<br=
>
&gt; <br>
&gt; Signed-off-by: Stacey Son &lt;sson@FreeBSD.org&gt;<br>
&gt; Signed-off-by: Kyle Evans &lt;<a href=3D"mailto:kevans@freebsd.org" ta=
rget=3D"_blank">kevans@freebsd.org</a>&gt;<br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/qemu.h=C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0bsd-user/signal.c | 68 +++++++++++++++++++++++++++++++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A02 files changed, 69 insertions(+)<br>
&gt; <br>
&gt; diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h<br>
&gt; index 334f8b1d715..0e0b8db708b 100644<br>
&gt; --- a/bsd-user/qemu.h<br>
&gt; +++ b/bsd-user/qemu.h<br>
&gt; @@ -97,6 +97,7 @@ typedef struct TaskState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct qemu_sigqueue sigqueue_table[MAX_SIGQ=
UEUE_SIZE]; /* siginfo queue */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct qemu_sigqueue *first_free; /* first f=
ree siginfo queue entry */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int signal_pending; /* non zero if a signal =
may be pending */<br>
&gt; +=C2=A0 =C2=A0 sigset_t signal_mask;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t stack[];<br>
&gt;=C2=A0 =C2=A0} __attribute__((aligned(16))) TaskState;<br>
&gt; diff --git a/bsd-user/signal.c b/bsd-user/signal.c<br>
&gt; index 7ea86149981..b2c91c39379 100644<br>
&gt; --- a/bsd-user/signal.c<br>
&gt; +++ b/bsd-user/signal.c<br>
&gt; @@ -28,6 +28,9 @@<br>
&gt;=C2=A0 =C2=A0 * fork.<br>
&gt;=C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static struct target_sigaction sigact_table[TARGET_NSIG];<br>
&gt; +static void host_signal_handler(int host_sig, siginfo_t *info, void *=
puc);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0int host_to_target_signal(int sig)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return sig;<br>
&gt; @@ -47,6 +50,28 @@ void queue_signal(CPUArchState *env, int sig, targe=
t_siginfo_t *info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log_mask(LOG_UNIMP, &quot;No signal que=
ueing, dropping signal %d\n&quot;, sig);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
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
&gt;=C2=A0 =C2=A0/*<br>
&gt;=C2=A0 =C2=A0 * Force a synchronously taken QEMU_SI_FAULT signal. For Q=
EMU the<br>
&gt;=C2=A0 =C2=A0 * &#39;force&#39; part is handled in process_pending_sign=
als().<br>
&gt; @@ -64,8 +89,51 @@ void force_sig_fault(int sig, int code, abi_ulong a=
ddr)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0queue_signal(env, sig, &amp;info);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static void host_signal_handler(int host_sig, siginfo_t *info, void *=
puc)<br>
&gt; +{<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0void signal_init(void)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 TaskState *ts =3D (TaskState *)thread_cpu-&gt;opaque;<b=
r>
&gt; +=C2=A0 =C2=A0 struct sigaction act;<br>
&gt; +=C2=A0 =C2=A0 struct sigaction oact;<br>
&gt; +=C2=A0 =C2=A0 int i;<br>
&gt; +=C2=A0 =C2=A0 int host_sig;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Set the signal mask from the host mask. */<br>
&gt; +=C2=A0 =C2=A0 sigprocmask(0, 0, &amp;ts-&gt;signal_mask);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Set all host signal handlers. ALL signals are b=
locked during the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* handlers to serialize them.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 memset(sigact_table, 0, sizeof(sigact_table));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 sigfillset(&amp;act.sa_mask);<br>
&gt; +=C2=A0 =C2=A0 act.sa_sigaction =3D host_signal_handler;<br>
&gt; +=C2=A0 =C2=A0 act.sa_flags =3D SA_SIGINFO;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 1; i &lt;=3D TARGET_NSIG; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 host_sig =3D target_to_host_signal(i);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sigaction(host_sig, NULL, &amp;oact);<br>
<br>
Missing test for CONFIG_GPROF + SIGPROF.=C2=A0 Otherwise,<br>
<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br></blockqu=
ote><div><br></div><div>Gotcha. Will add.</div><div><br></div><div>Warner=
=C2=A0</div></div></div>

--00000000000091279e05d65abe57--

