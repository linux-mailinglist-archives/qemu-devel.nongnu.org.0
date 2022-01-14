Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 139A248F03F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 19:59:51 +0100 (CET)
Received: from localhost ([::1]:55454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Rnh-0001zZ-MG
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 13:59:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n8Rfs-0008So-Pk
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 13:51:44 -0500
Received: from [2607:f8b0:4864:20::a34] (port=38662
 helo=mail-vk1-xa34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n8Rfq-0006w9-9V
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 13:51:44 -0500
Received: by mail-vk1-xa34.google.com with SMTP id h16so6391729vkp.5
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 10:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AwhtTIy2gXbHCzzCV6mtHqJpXp+ikSYIhBBnCffOpWg=;
 b=wTNp0NqoWeEYeuKpGuKN2x/5BIGyt4e/ELWZcMaqbEoV4WjGPFFOiGPUT3+Rx71+Ko
 tQcVgImxqwG9eOq3o6oEpDBKRlDIj7cTVsy9P6n/5BI+2Pkt5+vjdo/QBb7KxRCc2D68
 n/R2XrufadzGEaqldP7KUUOcWaEDIcDxxGqKXyz6wrpraXHzad+O19iqlh86kjVKoNXL
 WhUhnTqb9PcSMf0Lp4GJB/XJEAkn4X9ANHedw+Ww+12n8yM5kza5e+UWWYuCE8Qr63Ry
 7FQwwP8xytFZyZs8DKHaV4QwaFp8gZs/uNPF/xkZ9grq5jiWL/dH0W0rODT4kvbT3f8W
 8/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AwhtTIy2gXbHCzzCV6mtHqJpXp+ikSYIhBBnCffOpWg=;
 b=K6QmRutRi5+N9Hu49cRjPupWVvvD+dSiIfYNnlY7x2ENSPXbmhVUlGUrZc7DclT658
 RwAawv5sAzn/iUWehUcyZTcEwFU4CtSJN16WOCsN9aeR84CrHLLDkps3XktCwPoBkr/u
 c+BBfURSf94GCgOKhHsU7Bm27tajtPg0vniUCioSDoZNRs8Tq5iMNwrrXH39jkhnQQiz
 m1E83Yct3szLZcDipHJd5ovH71xRpIui4Vm6KFxoJ50uQd41jZA8eNB41OFqm4NGrA2j
 GKoGNXqilXXEUe1GfAmo5S3G4DUYw6Ijjl2WEG7YjRH4z/3fUeNvrvVXS1ML2hGIt+iH
 nP1Q==
X-Gm-Message-State: AOAM533Cn9A9dCtt0D0tDuFKwo8dYw2kOmAHJn76M/KsH9PwMlFxrMtY
 kiwk3ljXKLyfzeLx6IMTNj19ecR/ANZ3VkdAM7j6Tw==
X-Google-Smtp-Source: ABdhPJylvVWS5Lct4+YG/hgUVEyRAWhvOC646E4WrsNRJLtNXznlX/yRoeGYXHHVMJGoFteg0QGPFU0+6Pc0v1ktAr8=
X-Received: by 2002:a05:6122:1805:: with SMTP id
 ay5mr4707104vkb.5.1642186300919; 
 Fri, 14 Jan 2022 10:51:40 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-11-imp@bsdimp.com>
 <CAFEAcA9eX+f9j8wsrkPP-vap_OHyz70c_CdVPgo8ha71vZQxtw@mail.gmail.com>
In-Reply-To: <CAFEAcA9eX+f9j8wsrkPP-vap_OHyz70c_CdVPgo8ha71vZQxtw@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 14 Jan 2022 11:51:29 -0700
Message-ID: <CANCZdfqVKJB3yaNwjM0DvXB12UWbt_+t07tHPjubMLhA52oyJg@mail.gmail.com>
Subject: Re: [PATCH 10/30] bsd-user/signal.c: Implement signal_init()
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000001f1fb505d58f4b6a"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a34
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::a34;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa34.google.com
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

--0000000000001f1fb505d58f4b6a
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 13, 2022 at 12:28 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Sun, 9 Jan 2022 at 16:29, Warner Losh <imp@bsdimp.com> wrote:
> >
> > Initialize the signal state for the emulator. Setup a set of sane
> > default signal handlers, mirroring the host's signals. For fatal signals
> > (those that exit by default), establish our own set of signal
> > handlers. Stub out the actual signal handler we use for the moment.
> >
> > Signed-off-by: Stacey Son <sson@FreeBSD.org>
> > Signed-off-by: Kyle Evans <kevans@freebsd.org>
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >  bsd-user/qemu.h   |  1 +
> >  bsd-user/signal.c | 68 +++++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 69 insertions(+)
>
> > +static struct target_sigaction sigact_table[TARGET_NSIG];
>
>
>
>
> >  void signal_init(void)
> >  {
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
>
> Do you need this memset()? sigact_table is a global, so it's
> zero-initialized on startup, and this function is only called once.
> The (otherwise basically identical) Linux version of this function
> doesn't have it.
>

Yea, that looks bogus. I'll remove it.


> > +
> > +    sigfillset(&act.sa_mask);
> > +    act.sa_sigaction = host_signal_handler;
> > +    act.sa_flags = SA_SIGINFO;
> > +
> > +    for (i = 1; i <= TARGET_NSIG; i++) {
> > +        host_sig = target_to_host_signal(i);
> > +        sigaction(host_sig, NULL, &oact);
> > +        if (oact.sa_sigaction == (void *)SIG_IGN) {
> > +            sigact_table[i - 1]._sa_handler = TARGET_SIG_IGN;
> > +        } else if (oact.sa_sigaction == (void *)SIG_DFL) {
> > +            sigact_table[i - 1]._sa_handler = TARGET_SIG_DFL;
> > +        }
> > +        /*
> > +         * If there's already a handler installed then something has
> > +         * gone horribly wrong, so don't even try to handle that case.
> > +         * Install some handlers for our own use.  We need at least
> > +         * SIGSEGV and SIGBUS, to detect exceptions.  We can not just
> > +         * trap all signals because it affects syscall interrupt
> > +         * behavior.  But do trap all default-fatal signals.
> > +         */
> > +        if (fatal_signal(i)) {
> > +            sigaction(host_sig, &act, NULL);
> > +        }
> > +    }
> >  }
>
> Otherwise
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>

thanks!

Warner

--0000000000001f1fb505d58f4b6a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 13, 2022 at 12:28 PM Pete=
r Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Sun, 9 Jan 2022 at 16:29, Warner Losh &lt;<a href=3D"mailto:imp@b=
sdimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Initialize the signal state for the emulator. Setup a set of sane<br>
&gt; default signal handlers, mirroring the host&#39;s signals. For fatal s=
ignals<br>
&gt; (those that exit by default), establish our own set of signal<br>
&gt; handlers. Stub out the actual signal handler we use for the moment.<br=
>
&gt;<br>
&gt; Signed-off-by: Stacey Son &lt;sson@FreeBSD.org&gt;<br>
&gt; Signed-off-by: Kyle Evans &lt;<a href=3D"mailto:kevans@freebsd.org" ta=
rget=3D"_blank">kevans@freebsd.org</a>&gt;<br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 bsd-user/qemu.h=C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 bsd-user/signal.c | 68 +++++++++++++++++++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 2 files changed, 69 insertions(+)<br>
<br>
&gt; +static struct target_sigaction sigact_table[TARGET_NSIG];<br>
<br>
<br>
<br>
<br>
&gt;=C2=A0 void signal_init(void)<br>
&gt;=C2=A0 {<br>
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
<br>
Do you need this memset()? sigact_table is a global, so it&#39;s<br>
zero-initialized on startup, and this function is only called once.<br>
The (otherwise basically identical) Linux version of this function<br>
doesn&#39;t have it.<br></blockquote><div><br></div><div>Yea, that looks bo=
gus. I&#39;ll remove it.</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
&gt; +<br>
&gt; +=C2=A0 =C2=A0 sigfillset(&amp;act.sa_mask);<br>
&gt; +=C2=A0 =C2=A0 act.sa_sigaction =3D host_signal_handler;<br>
&gt; +=C2=A0 =C2=A0 act.sa_flags =3D SA_SIGINFO;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 1; i &lt;=3D TARGET_NSIG; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 host_sig =3D target_to_host_signal(i);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sigaction(host_sig, NULL, &amp;oact);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (oact.sa_sigaction =3D=3D (void *)SIG_=
IGN) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sigact_table[i - 1]._sa_han=
dler =3D TARGET_SIG_IGN;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (oact.sa_sigaction =3D=3D (void=
 *)SIG_DFL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sigact_table[i - 1]._sa_han=
dler =3D TARGET_SIG_DFL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If there&#39;s already a handler =
installed then something has<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* gone horribly wrong, so don&#39;t=
 even try to handle that case.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Install some handlers for our own=
 use.=C2=A0 We need at least<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* SIGSEGV and SIGBUS, to detect exc=
eptions.=C2=A0 We can not just<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* trap all signals because it affec=
ts syscall interrupt<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* behavior.=C2=A0 But do trap all d=
efault-fatal signals.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fatal_signal(i)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sigaction(host_sig, &amp;ac=
t, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
<br>
Otherwise<br>
<br>
Reviewed-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" =
target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br></blockquote><div><br=
></div><div>thanks!</div><div><br></div><div>Warner=C2=A0</div></div></div>

--0000000000001f1fb505d58f4b6a--

