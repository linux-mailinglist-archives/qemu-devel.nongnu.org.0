Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754614439FB
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 00:46:20 +0100 (CET)
Received: from localhost ([::1]:36794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi3Tu-00063m-RH
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 19:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mi3Pr-0003SG-59
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 19:42:07 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d]:46043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mi3Po-00051i-Qg
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 19:42:06 -0400
Received: by mail-ua1-x92d.google.com with SMTP id ay21so1119659uab.12
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 16:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m2b1/kJVD6hmy1kzRBZ0rZGiXF2Av8jz6i2zt8o3oUI=;
 b=U3P31dFPOUdBJsJwMnmS6xr7wc1L3ecO3rqbzuwdZbd/JktJR39X0GvBoGSogjcpnM
 TX46krfL7PK1Lvx6y1+K2G435VjZNVsX1BoGyPXpUHX10tCWQ7ttaEV5aNJoX9KtuwsC
 XMoRmUnSWEfQQIjRwDRS6u6zwnxD40EyX48Cg+OJVDWC3Mr2EEKjt++cCYEQ4GtoE1IR
 zBlVGCx6VBNMSKu/CHvvIbJIcAS25GY3Wztwg69V+gGSuZnS2pjKnu2iYPax++89MOlr
 vR9edJOxgzBbA4QMqhO3E5gkq/eRFqiA7SCgWxkycsr+KPfERIZnA4IP9u7/J17GPyH2
 6hhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m2b1/kJVD6hmy1kzRBZ0rZGiXF2Av8jz6i2zt8o3oUI=;
 b=JlyWGJ5GfJLq4Kh7tPpCPSJYfbypa4zlX1yWU4Ey9AqBxo8ncXSwKh9tz31O2OlcMc
 MKki0Ot/evzXV9SGZKJVv2UQ23qfaSQSRQiNnC+8GyqZWT63DiPbULvwa4K737IGpK4H
 AFyvGnNv1/C5h/miKVxYOxF/fdgWg+TEU7Yg+HlMYMAWhPravlZ2mPJla1wv0nXH4NBU
 2rmOItMJbSBV7a0R17AC3ruC7XqlDYPpjiEWCqGtHCaKAIotIqzLjv3qNY4o4itTLx+z
 V25HTlQJS30g7SiAZRerDE8evRSBNYTf4CK5LgyyVSBDJCJ6rAjT6SMfkzczIhjAlO3K
 Q84w==
X-Gm-Message-State: AOAM530neHpEf4+ArrMlbte/DK90Nv0BnQu5eoYvAzyHrdBSemCBRv+d
 3VkuvRzVjCHU5FuQzzA7V0yQjOs3OemOzxTD9WiqOg==
X-Google-Smtp-Source: ABdhPJxWOKv3qvwGdwv5WC/uWe2u/UnJ7w9o5cF3agKNLUeAo8IRCabixp2QZpPcLaoviMSsrNbwK8FmsDCHWt2XnIQ=
X-Received: by 2002:ab0:6010:: with SMTP id j16mr31023672ual.69.1635896523585; 
 Tue, 02 Nov 2021 16:42:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211102225248.52999-1-imp@bsdimp.com>
 <20211102225248.52999-2-imp@bsdimp.com>
 <3a4d91dc-5726-ff89-a837-faefdff45a92@linaro.org>
In-Reply-To: <3a4d91dc-5726-ff89-a837-faefdff45a92@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 2 Nov 2021 17:41:52 -0600
Message-ID: <CANCZdfo3+eNB3DMjUoyRTd7VkYVP0r-fyNR0+K6rjzQR1sL-9A@mail.gmail.com>
Subject: Re: [PATCH v2 01/30] bsd-user: Add stubs for new signal routines
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000002d931a05cfd6d70d"
Received-SPF: none client-ip=2607:f8b0:4864:20::92d;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002d931a05cfd6d70d
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 2, 2021 at 5:37 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 11/2/21 6:52 PM, Warner Losh wrote:
> > Until the signal support is merged from the bsd-user fork, we need stubs
> > for cpu_loop_exit_sigsegv and cpu_loop_exit_sigbus to link. These call
> > abort after logging a message. Since singals aren't supported here
> > yet, this is sufficient.
> >
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >   bsd-user/signal.c | 21 +++++++++++++++++++++
> >   1 file changed, 21 insertions(+)
> >
> > diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> > index 0c1093deb1..05b277c642 100644
> > --- a/bsd-user/signal.c
> > +++ b/bsd-user/signal.c
> > @@ -20,6 +20,11 @@
> >   #include "qemu/osdep.h"
> >   #include "qemu.h"
> >
> > +/*
> > + * Stubbed out routines until we merge signal support from bsd-user
> > + * fork.
> > + */
> > +
> >   /*
> >    * Queue a signal so that it will be send to the virtual CPU as soon as
> >    * possible.
> > @@ -36,3 +41,19 @@ void signal_init(void)
> >   void process_pending_signals(CPUArchState *cpu_env)
> >   {
> >   }
> > +
> > +void cpu_loop_exit_sigsegv(CPUState *cpu, target_ulong addr,
> > +                           MMUAccessType access_type, bool maperr,
> uintptr_t ra)
> > +{
> > +    qemu_log_mask(LOG_UNIMP, "No signal support for SIGSEGV\n");
> > +    /* unreachable */
> > +    abort();
> > +}
> > +
> > +void cpu_loop_exit_sigbus(CPUState *cpu, target_ulong addr,
> > +                          MMUAccessType access_type, uintptr_t ra)
> > +{
> > +    qemu_log_mask(LOG_UNIMP, "No signal support for SIGBUS\n");
> > +    /* unreachable */
> > +    abort();
> > +}
> >
>
> I'm going to apply this directly to master as a build fix.
> Sorry about that.
>

Works for me. I just cherry-picked and the build works with it.

Warner

--0000000000002d931a05cfd6d70d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 2, 2021 at 5:37 PM Richar=
d Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hen=
derson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 11/2/21 6:52 PM, Warner Losh wrote:<br>
&gt; Until the signal support is merged from the bsd-user fork, we need stu=
bs<br>
&gt; for cpu_loop_exit_sigsegv and cpu_loop_exit_sigbus to link. These call=
<br>
&gt; abort after logging a message. Since singals aren&#39;t supported here=
<br>
&gt; yet, this is sufficient.<br>
&gt; <br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/signal.c | 21 +++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 21 insertions(+)<br>
&gt; <br>
&gt; diff --git a/bsd-user/signal.c b/bsd-user/signal.c<br>
&gt; index 0c1093deb1..05b277c642 100644<br>
&gt; --- a/bsd-user/signal.c<br>
&gt; +++ b/bsd-user/signal.c<br>
&gt; @@ -20,6 +20,11 @@<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/osdep.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu.h&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +/*<br>
&gt; + * Stubbed out routines until we merge signal support from bsd-user<b=
r>
&gt; + * fork.<br>
&gt; + */<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0/*<br>
&gt;=C2=A0 =C2=A0 * Queue a signal so that it will be send to the virtual C=
PU as soon as<br>
&gt;=C2=A0 =C2=A0 * possible.<br>
&gt; @@ -36,3 +41,19 @@ void signal_init(void)<br>
&gt;=C2=A0 =C2=A0void process_pending_signals(CPUArchState *cpu_env)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +void cpu_loop_exit_sigsegv(CPUState *cpu, target_ulong addr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0MMUAccessType access_type, bool maperr, uintptr=
_t ra)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP, &quot;No signal support for SI=
GSEGV\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 /* unreachable */<br>
&gt; +=C2=A0 =C2=A0 abort();<br>
&gt; +}<br>
&gt; +<br>
&gt; +void cpu_loop_exit_sigbus(CPUState *cpu, target_ulong addr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 MMUAccessType access_type, uintptr_t ra)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP, &quot;No signal support for SI=
GBUS\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 /* unreachable */<br>
&gt; +=C2=A0 =C2=A0 abort();<br>
&gt; +}<br>
&gt; <br>
<br>
I&#39;m going to apply this directly to master as a build fix.<br>
Sorry about that.<br></blockquote><div><br></div><div>Works for me. I just =
cherry-picked and the build works with it.</div><div><br></div><div>Warner=
=C2=A0</div></div></div>

--0000000000002d931a05cfd6d70d--

