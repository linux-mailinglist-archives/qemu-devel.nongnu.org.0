Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DEC4A6A54
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 03:52:00 +0100 (CET)
Received: from localhost ([::1]:42200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF5kV-0002nI-G7
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 21:51:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nF0cZ-00071W-0h
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:23:27 -0500
Received: from [2607:f8b0:4864:20::92c] (port=38411
 helo=mail-ua1-x92c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nF0cX-0002Im-6C
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:23:26 -0500
Received: by mail-ua1-x92c.google.com with SMTP id n15so15606534uaq.5
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 13:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2+jxpjzNTLQAdqNrgc6tBuxPb5opRiGgIN7UggKdIBM=;
 b=bYr8nOkbNTxI6Ll98vclMiEnwLAgrnKpvU5iEd4rLqNahlR0pTW9qZRyzVLxUPwhyl
 fk0eMDn9PMTcpbmZCOZ7mluFUkYicUZCgo7/4R6czGf4xGSRrRwfW9YSkJW2+WIY2SPS
 AGSJAZ6M496TrNCFYIswb8EAcNaqq5nzRBevM4/GYdA6pDmlDwzFBS6VqwkUgPyv+2Lj
 mtSva8HTlm6PRw61THFc7pdYcQ18x6G9yREAqT5rB2fFKUxdSrjUlgOe2+4biqVCHFxC
 j4Ct2cgxMEQ2SeBS1VDnfDA0aQljaxJ7U3IlogalBaTHbvvytB7s+Zs7v2WhrXPwoa0a
 y0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2+jxpjzNTLQAdqNrgc6tBuxPb5opRiGgIN7UggKdIBM=;
 b=Ij8f3PmqLeETdY4l1zt71Yai2h++c5UoJzBVNIDYMpq937w8E9a5EpjiLbhjlJlcsN
 1tZbq50vKDzv7KpWDmR3jePfkZSKco4P9/rBiDIFDa1wrfCjDPlHMvVu0PyY/0ZMP1XN
 /O4fcPJxvEt6cGgY8tKZb1XmIEqqEr7PIEqqb9Nz5CFvIHE3SCJ+x8Zqo5L19fOgv3nc
 N4LNX9nvMgiJOYnz6eVMgn7tos5aSYiwcY0NJ07EibSgPAd20kCsci2fuHXNSxeJlnq7
 ih6RYCnx74J4BAGNRfxpPZMFlTq2O16GqhoOjf9kucfPAlqjGFLM1jbZm40fIAknD+RE
 VSHA==
X-Gm-Message-State: AOAM531OB1skkMe+PmGC2sKxze8Rn2rM9SOaxIPXnVMxOp4BKNX6vMK/
 Dd0i3C2vTdaDk6BbJA1mWysgs3DLy2ygOkvMaW6K8Q==
X-Google-Smtp-Source: ABdhPJxZ2uWhPgiBjy+olYbw8yI+Yb9Q67nvVcWLhwMp+GTyqth8FxA+YHb0seD8wFYMlCchjUbZV5l5B5E0ZP7ZNM8=
X-Received: by 2002:a05:6102:3a0f:: with SMTP id
 b15mr10758213vsu.13.1643750603689; 
 Tue, 01 Feb 2022 13:23:23 -0800 (PST)
MIME-Version: 1.0
References: <20220201205251.57691-1-imp@bsdimp.com>
 <a56162d7-bb87-f86c-cb48-8ef26ace0ad4@linaro.org>
In-Reply-To: <a56162d7-bb87-f86c-cb48-8ef26ace0ad4@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 1 Feb 2022 14:23:12 -0700
Message-ID: <CANCZdfqMegptFoQG-br3ug7tG5rrsLNTjZ0EZ=-TRv0Ua_fopQ@mail.gmail.com>
Subject: Re: [PATCH] bsd-user/signal.c: Only copy the _capsicum for
 FreeBSD_version > 1400026
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000d5267a05d6fb82e4"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::92c;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d5267a05d6fb82e4
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 1, 2022 at 2:06 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 2/2/22 07:52, Warner Losh wrote:
> > The capsicum signal stuff is new with FreeBSD 14, rev 1400026, so only
> > copy them on a new enough system.
> >
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >   bsd-user/signal.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> > index ad22ba9d90d..b43266e6e06 100644
> > --- a/bsd-user/signal.c
> > +++ b/bsd-user/signal.c
> > @@ -242,8 +242,10 @@ static inline void
> host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
> >            * one, then we know what to save.
> >            */
> >           if (sig == TARGET_SIGTRAP) {
> > +#if defined(__FreeBSD_version) && __FreeBSD_version >= 1400026
> >               tinfo->_reason._capsicum._syscall =
> >                   info->_reason._capsicum._syscall;
> > +#endif
> >               si_type = QEMU_SI_CAPSICUM;
> >           }
>
> Do you really want the entire IF inside the ifdef?
> Setting QEMU_SI_CAPSICUM doesn't make sense for earlier versions...
>

True. In fact, not defining it at all on earlier versions would be safer to
ensure
all the places where we might want to touch this we'll get a compiler
warning
as well as to communicate this is only for earlier versions w/o sprinkling
the
version through the code. I'll update with this suggestion.

Warner


>
> r~
>
> >           break;
> > @@ -296,8 +298,10 @@ static void tswap_siginfo(target_siginfo_t *tinfo,
> const target_siginfo_t *info)
> >           __put_user(info->_reason._poll._band,
> &tinfo->_reason._poll._band);
> >           break;
> >       case QEMU_SI_CAPSICUM:
> > +#if defined(__FreeBSD_version) && __FreeBSD_version >= 1400026
> >           __put_user(info->_reason._capsicum._syscall,
> >                      &tinfo->_reason._capsicum._syscall);
> > +#endif
> >           break;
> >       default:
> >           g_assert_not_reached();
>
>

--000000000000d5267a05d6fb82e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 1, 2022 at 2:06 PM Richar=
d Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hen=
derson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 2/2/22 07:52, Warner Losh wrote:<br>
&gt; The capsicum signal stuff is new with FreeBSD 14, rev 1400026, so only=
<br>
&gt; copy them on a new enough system.<br>
&gt; <br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/signal.c | 4 ++++<br>
&gt;=C2=A0 =C2=A01 file changed, 4 insertions(+)<br>
&gt; <br>
&gt; diff --git a/bsd-user/signal.c b/bsd-user/signal.c<br>
&gt; index ad22ba9d90d..b43266e6e06 100644<br>
&gt; --- a/bsd-user/signal.c<br>
&gt; +++ b/bsd-user/signal.c<br>
&gt; @@ -242,8 +242,10 @@ static inline void host_to_target_siginfo_noswap(=
target_siginfo_t *tinfo,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * one, then we know what to s=
ave.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sig =3D=3D TARGET_SIGTRAP)=
 {<br>
&gt; +#if defined(__FreeBSD_version) &amp;&amp; __FreeBSD_version &gt;=3D 1=
400026<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tinfo-&gt;_reaso=
n._capsicum._syscall =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in=
fo-&gt;_reason._capsicum._syscall;<br>
&gt; +#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0si_type =3D QEMU=
_SI_CAPSICUM;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
Do you really want the entire IF inside the ifdef?<br>
Setting QEMU_SI_CAPSICUM doesn&#39;t make sense for earlier versions...<br>=
</blockquote><div><br></div><div>True. In fact, not defining it at all on e=
arlier versions would be safer to ensure</div><div>all the places where we =
might want to touch this we&#39;ll get a compiler warning</div><div>as well=
 as to communicate this is only for earlier versions w/o sprinkling the</di=
v><div>version through the code. I&#39;ll update with this suggestion.</div=
><div><br></div><div>Warner</div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
r~<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; @@ -296,8 +298,10 @@ static void tswap_siginfo(target_siginfo_t *tinfo=
, const target_siginfo_t *info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__put_user(info-&gt;_reason._p=
oll._band, &amp;tinfo-&gt;_reason._poll._band);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case QEMU_SI_CAPSICUM:<br>
&gt; +#if defined(__FreeBSD_version) &amp;&amp; __FreeBSD_version &gt;=3D 1=
400026<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__put_user(info-&gt;_reason._c=
apsicum._syscall,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &amp;tinfo-&gt;_reason._capsicum._syscall);<br>
&gt; +#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_not_reached();<br>
<br>
</blockquote></div></div>

--000000000000d5267a05d6fb82e4--

