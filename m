Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB65B48F825
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jan 2022 18:07:11 +0100 (CET)
Received: from localhost ([::1]:34668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8mWE-0006fn-IC
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 12:07:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n8mPZ-0003gc-0k
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 12:00:17 -0500
Received: from [2607:f8b0:4864:20::929] (port=41880
 helo=mail-ua1-x929.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n8mPT-0005W9-85
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 12:00:14 -0500
Received: by mail-ua1-x929.google.com with SMTP id i10so662843uab.8
 for <qemu-devel@nongnu.org>; Sat, 15 Jan 2022 09:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iJZlgSjSPHNBYw8mOc0Fv0/F6APWqwXBnY9JAl4HKoU=;
 b=rKYHQI+TBd7/I+zsYtoEW3r+hlVj6+IVPPILE1QZKCKLQoKjcX2K1b2Pb43rFrJmxn
 7YvK1it0i3VmVnEF4Bnlrk7EA8MhCEOLgHyDTUW5sLL4wv3haKisVwuRI2m4/kfOrhX7
 h8Efo1R+2ZTtj86y4uW28gaoSZmCGLgDwhnIE5k3mMla14FULq0Zk+/f8HVmE+w8af6Y
 nBwlOrNgO/ZmC2ihWUN+BI9iRhw+BY3llZ3LOn0gDVKepUNY8m4HeipsvivNEXz2fJ+H
 3SMR6R9qn7aTD5rJdEGFKs2TlyjhHm2fLA/FYSG9a4MwRVfECMoTNcFrbZVfGSp379EN
 Rajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iJZlgSjSPHNBYw8mOc0Fv0/F6APWqwXBnY9JAl4HKoU=;
 b=6iSoZEaW6DHoWQmqt8cX6pOi6QX7eJzGmz5QnamsFDtsw+FJxHXGtM2UXnBMd9wrni
 kpqp3Q/aYqPvzU8ecBd1g3zWFmuu8L75uCEj0UjEMcFSXzhrsRu+UxwJZh9OoLxPRE5A
 CD6XKrPkxl28+gueFdj4gvL6DQ4OwKabFFxev94fM/ZZpJpb4/8TAmQettViysRcFwEY
 bdFwxOCCd8pzn8uKoWvbRYz0bHi4c2Sx6mU+6xJ7RbsWdJz/UNCFqMEgkTh6DNvEPdUn
 YJ6NehHyNzFyno2S8RGW3VaDSOrSM1qW1ThV9yS2DXS07K6rfVR1EnrVAse1En/lbplG
 wDgA==
X-Gm-Message-State: AOAM5334+pZb5U8Wf7ji7AMcKRhy8sR40kSPwEJge1zcHtDuZJ4dGVw2
 fcdn9p/4t7ywU8a15RRA4N7lp7s+y+wUkuVepjeOtQ==
X-Google-Smtp-Source: ABdhPJyCxbsfTd7n2JCWrXII5C+5wFdKyIfi01I3otr3hECwYUYxeMklk9hVa1c76Wbc+Vdr0ab7my/E0gDeQjqkbmg=
X-Received: by 2002:ab0:a90:: with SMTP id d16mr5927915uak.69.1642266009692;
 Sat, 15 Jan 2022 09:00:09 -0800 (PST)
MIME-Version: 1.0
References: <20220114155032.3767771-1-peter.maydell@linaro.org>
 <87mtjxs52i.fsf@linaro.org>
In-Reply-To: <87mtjxs52i.fsf@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sat, 15 Jan 2022 09:59:58 -0700
Message-ID: <CANCZdfpGYC+DS7uYOOGKsUFhSObcoiXn5Oa_CeBjOHH6ixbErw@mail.gmail.com>
Subject: Re: [RFC] linux-user: Remove stale "not threadsafe" comments
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000022810e05d5a1dacd"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::929
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::929;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x929.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000022810e05d5a1dacd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 15, 2022 at 2:49 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > In linux-user/signal.c we have two FIXME comments claiming that
> > parts of the signal-handling code are not threadsafe. These are
> > very old, as they were first introduced in commit 624f7979058
> > in 2008. Since then we've radically overhauled the signal-handling
> > logic, while carefully preserving these FIXME comments.
> >
> > It's unclear exactly what thread-safety issue the original
> > author was trying to point out -- the relevant data structures
> > are in the TaskStruct, which makes them per-thread and only
> > operated on by that thread. The old code at the time of that
> > commit did have various races involving signal handlers being
> > invoked at awkward times; possibly this was what was meant.
> >
> > Delete these FIXME comments:
> >  * they were written at a time when the way we handled
> >    signals was completely different
> >  * the code today appears to us to not have thread-safety issues
> >  * nobody knows what the problem the comments were trying to
> >    point out was
> > so they are serving no useful purpose for us today.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > Marked "RFC" because I'm a bit uneasy with deleting FIXMEs
> > simply because I can't personally figure out why they're
> > there. This patch is more to start a discussion to see
> > if anybody does understand the issue -- in which case we
> > can instead augment the comments to describe it.
> > ---
> >  linux-user/signal.c | 2 --
> >  1 file changed, 2 deletions(-)
>




> > diff --git a/linux-user/signal.c b/linux-user/signal.c
> > index 32854bb3752..e7410776e21 100644
> > --- a/linux-user/signal.c
> > +++ b/linux-user/signal.c
> > @@ -1001,7 +1001,6 @@ int do_sigaction(int sig, const struct
> target_sigaction *act,
> >          oact->sa_mask =3D k->sa_mask;
> >      }
> >      if (act) {
> > -        /* FIXME: This is not threadsafe.  */
> >          __get_user(k->_sa_handler, &act->_sa_handler);
> >          __get_user(k->sa_flags, &act->sa_flags);
> >  #ifdef TARGET_ARCH_HAS_SA_RESTORER
> > @@ -1151,7 +1150,6 @@ void process_pending_signals(CPUArchState *cpu_en=
v)
> >      sigset_t *blocked_set;
> >
> >      while (qatomic_read(&ts->signal_pending)) {
> > -        /* FIXME: This is not threadsafe.  */
> >          sigfillset(&set);
> >          sigprocmask(SIG_SETMASK, &set, 0);
>
> Looking at the history those FIXMEs could have been for code that they
> where attached to. Could the thread safety be about reading the
> sigaction stuff? I would have though sigaction updates where atomic by
> virtue of the syscall to set them...
>
> Anyway looks old to me:
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>

Reviewed-by: Warner Losh <imp@bsdimp.com>

I looked in bsd-user, to where this was also copied, and couldn't figure ou=
t
what it was talking about...  Though that's a weak review, imho..


> --
> Alex Benn=C3=A9e
>
>

--00000000000022810e05d5a1dacd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jan 15, 2022 at 2:49 AM Alex =
Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><br>
Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_bl=
ank">peter.maydell@linaro.org</a>&gt; writes:<br>
<br>
&gt; In linux-user/signal.c we have two FIXME comments claiming that<br>
&gt; parts of the signal-handling code are not threadsafe. These are<br>
&gt; very old, as they were first introduced in commit 624f7979058<br>
&gt; in 2008. Since then we&#39;ve radically overhauled the signal-handling=
<br>
&gt; logic, while carefully preserving these FIXME comments.<br>
&gt;<br>
&gt; It&#39;s unclear exactly what thread-safety issue the original<br>
&gt; author was trying to point out -- the relevant data structures<br>
&gt; are in the TaskStruct, which makes them per-thread and only<br>
&gt; operated on by that thread. The old code at the time of that<br>
&gt; commit did have various races involving signal handlers being<br>
&gt; invoked at awkward times; possibly this was what was meant.<br>
&gt;<br>
&gt; Delete these FIXME comments:<br>
&gt;=C2=A0 * they were written at a time when the way we handled<br>
&gt;=C2=A0 =C2=A0 signals was completely different<br>
&gt;=C2=A0 * the code today appears to us to not have thread-safety issues<=
br>
&gt;=C2=A0 * nobody knows what the problem the comments were trying to<br>
&gt;=C2=A0 =C2=A0 point out was<br>
&gt; so they are serving no useful purpose for us today.<br>
&gt;<br>
&gt; Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linar=
o.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt; Marked &quot;RFC&quot; because I&#39;m a bit uneasy with deleting FIXM=
Es<br>
&gt; simply because I can&#39;t personally figure out why they&#39;re<br>
&gt; there. This patch is more to start a discussion to see<br>
&gt; if anybody does understand the issue -- in which case we<br>
&gt; can instead augment the comments to describe it.<br>
&gt; ---<br>
&gt;=C2=A0 linux-user/signal.c | 2 --<br>
&gt;=C2=A0 1 file changed, 2 deletions(-)<br></blockquote><div><br></div><d=
iv><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
&gt; diff --git a/linux-user/signal.c b/linux-user/signal.c<br>
&gt; index 32854bb3752..e7410776e21 100644<br>
&gt; --- a/linux-user/signal.c<br>
&gt; +++ b/linux-user/signal.c<br>
&gt; @@ -1001,7 +1001,6 @@ int do_sigaction(int sig, const struct target_si=
gaction *act,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oact-&gt;sa_mask =3D k-&gt;sa_mask;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (act) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* FIXME: This is not threadsafe.=C2=A0 *=
/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __get_user(k-&gt;_sa_handler, &amp;a=
ct-&gt;_sa_handler);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __get_user(k-&gt;sa_flags, &amp;act-=
&gt;sa_flags);<br>
&gt;=C2=A0 #ifdef TARGET_ARCH_HAS_SA_RESTORER<br>
&gt; @@ -1151,7 +1150,6 @@ void process_pending_signals(CPUArchState *cpu_e=
nv)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sigset_t *blocked_set;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 while (qatomic_read(&amp;ts-&gt;signal_pending)) {=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* FIXME: This is not threadsafe.=C2=A0 *=
/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sigfillset(&amp;set);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sigprocmask(SIG_SETMASK, &amp;set, 0=
);<br>
<br>
Looking at the history those FIXMEs could have been for code that they<br>
where attached to. Could the thread safety be about reading the<br>
sigaction stuff? I would have though sigaction updates where atomic by<br>
virtue of the syscall to set them...<br>
<br>
Anyway looks old to me:<br>
<br>
Reviewed-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org"=
 target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br></blockquote><div><br>=
</div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">i=
mp@bsdimp.com</a>&gt;</div><div><br></div><div>I looked in bsd-user, to whe=
re this was also copied, and couldn&#39;t figure out</div><div>what it was =
talking about...=C2=A0 Though that&#39;s a weak review, imho..</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
-- <br>
Alex Benn=C3=A9e<br>
<br>
</blockquote></div></div>

--00000000000022810e05d5a1dacd--

