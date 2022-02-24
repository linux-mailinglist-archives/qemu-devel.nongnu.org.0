Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B75B4C362D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 20:52:14 +0100 (CET)
Received: from localhost ([::1]:43922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNK9t-0006oJ-Nb
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 14:52:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nNK8Q-000652-GL
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 14:50:42 -0500
Received: from [2a00:1450:4864:20::336] (port=38726
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nNK8N-0006vM-DS
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 14:50:42 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 m13-20020a7bca4d000000b00380e379bae2so436260wml.3
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 11:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iXSnUkpG2/bL8xNDgEsD3gMcy9mC8mcEHS4U3vWBnOI=;
 b=IrBdK87XL/ujVzKAxCayJgFtocRBex1PT24ph40XuRt/UUjX7ny2uAu2ROat1PUWMN
 AKz0rDHxIwae5/DNClmxq0C8YZ+mMSqxnkX+h9lnuz87m0xgU9s109aENpHdsHrKHxXj
 ddG5SLgbnyL6tFj8ozeh0NmdrO3aoUsUTGoXiW6AkVQmtskgbVJJfbs9MFDb6noBBjEM
 HhnkWO0BPzI1/1V763+49WFn74NlQLsoINm1vXnRRQw4Q3yrjK/RXTYuAB/qn18TdgDJ
 KljsHiuw3WklodGfUbU30qqBg/rWd7qKfofRCCqwc1+7OqaLagTSBbwg8OyFiTe7rXvv
 uEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iXSnUkpG2/bL8xNDgEsD3gMcy9mC8mcEHS4U3vWBnOI=;
 b=2qbM5FPrrVAghn204RlDEvjTRIz7KyyT1/wMYq/Xhy7rNpMdSoJ8JX74j11VObT4Wl
 6Mnwe/urSIAb85+vYig9N7cc1cMvfcP/umsXf3IWvxsEl6sUenOXNLnkRjzihinSOTDt
 n+C2Ht+oBuNE6lk/+a0oPs0evH7lL7uWTMqcqA2/BQm3OHa9wwnpV8Xh3nS/A1yDXvqk
 vGmESBZpBQcJHDEUEjaCwf106yg/l/yfJ/d9aJyJ7gg4dW2OECK7fOHYGlLFck0lQeGn
 hMTu+VRdmYjf3AtVJapmmd97G1yBLsbtJNhBtFSo0lzl2nBSuGjMIu8eKWGZgifGxPNB
 lOEA==
X-Gm-Message-State: AOAM5306ea+RBtW1A13eBV3AaRwJLvRjs8AMTgIY4sDZmkmV5eAtgc+N
 4kzWFhs9FQBuEn/kjgQC+QE87VYpW2J/FFUcXzc=
X-Google-Smtp-Source: ABdhPJzPal2QVAG1Rl+EHPYLgeitlgFKAejLk6FXXp3SO0vZkgL7lPr7yrCfDpR2GsYO9jKhUgsyVxFYtXebQWOs3vY=
X-Received: by 2002:a05:600c:3d06:b0:37b:f831:2a98 with SMTP id
 bh6-20020a05600c3d0600b0037bf8312a98mr3630111wmb.36.1645732237785; Thu, 24
 Feb 2022 11:50:37 -0800 (PST)
MIME-Version: 1.0
References: <20220224183701.608720-1-marcandre.lureau@redhat.com>
 <20220224183701.608720-6-marcandre.lureau@redhat.com>
 <CAFEAcA9FDt0Y6W4zBLG3ciGe8M7TERimzD_4gX-y7pAv2G+=ag@mail.gmail.com>
In-Reply-To: <CAFEAcA9FDt0Y6W4zBLG3ciGe8M7TERimzD_4gX-y7pAv2G+=ag@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 24 Feb 2022 23:50:25 +0400
Message-ID: <CAJ+F1CJiQRn+5VXtfZgmVAKuA2wUdCXv=5hToiwfRQPX4qXUKg@mail.gmail.com>
Subject: Re: [PATCH 05/12] compiler.h: drop __printf__ macro MinGW/glib
 workaround
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000006dbe4605d8c8e5e6"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU <qemu-devel@nongnu.org>, Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006dbe4605d8c8e5e6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter

On Thu, Feb 24, 2022 at 11:23 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 24 Feb 2022 at 18:38, <marcandre.lureau@redhat.com> wrote:
> >
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > This workaround was added in commit 95df51a4 ("w32: Always use standard
> > instead of native format strings"), as it claimed glib was using
> > __printf__ attribute. This is surprising, since glib has always used
> > G_GNUC_PRINTF which, as the name implies, uses __gnu_printf__ when
> > possible.
>
> This was not always true: before this commit from 2018
>
> https://github.com/GNOME/glib/commit/98a0ab929d8c59ee27e5f470f11d077bb6a5=
6749
> G_GNUC_PRINTF used always used __printf__.
> I think that change only landed in glib 2.58, so since our current
> minimum glib version is 2.56 we need to retain this workaround.
>
>
Oops


> > Apparently, the workaound is no longer relevant though, I don't see
> > the warnings.
>
> You're probably building with a newer glib, and possibly also
> a newer mingw.
>
> I've cc'd Stefan Weil who might know whether we can drop this
> workaround as far as the mingw part is concerned.
>

Probably safer to keep it until we bump glib dependency to >=3D2.58.

I would move it to glib-compat.h though, and leave a note there, as it is
(or should be ) an old glib specific workaround.


>
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  include/qemu/compiler.h | 8 --------
> >  1 file changed, 8 deletions(-)
> >
> > diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> > index 2704c314dcac..eb29b72c14d7 100644
> > --- a/include/qemu/compiler.h
> > +++ b/include/qemu/compiler.h
> > @@ -73,14 +73,6 @@
> >  #define QEMU_BUILD_BUG_ON_ZERO(x) (sizeof(QEMU_BUILD_BUG_ON_STRUCT(x))
> - \
> >                                     sizeof(QEMU_BUILD_BUG_ON_STRUCT(x))=
)
> >
> > -#if !defined(__clang__) && defined(_WIN32)
> > -/*
> > - * Map __printf__ to __gnu_printf__ because we want standard format
> strings even
> > - * when MinGW or GLib include files use __printf__.
> > - */
> > -# define __printf__ __gnu_printf__
> > -#endif
> > -
> >  #ifndef __has_warning
> >  #define __has_warning(x) 0 /* compatibility with non-clang compilers *=
/
> >  #endif
> > --
> > 2.35.1.273.ge6ebfd0e8cbb
>
> thanks
> -- PMM
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000006dbe4605d8c8e5e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Peter<br></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 24, 2022 at 11:23=
 PM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.may=
dell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Thu, 24 Feb 2022 at 18:38, &lt;<a href=3D"mailto:marcandr=
e.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt; =
wrote:<br>
&gt;<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; This workaround was added in commit 95df51a4 (&quot;w32: Always use st=
andard<br>
&gt; instead of native format strings&quot;), as it claimed glib was using<=
br>
&gt; __printf__ attribute. This is surprising, since glib has always used<b=
r>
&gt; G_GNUC_PRINTF which, as the name implies, uses __gnu_printf__ when<br>
&gt; possible.<br>
<br>
This was not always true: before this commit from 2018<br>
<a href=3D"https://github.com/GNOME/glib/commit/98a0ab929d8c59ee27e5f470f11=
d077bb6a56749" rel=3D"noreferrer" target=3D"_blank">https://github.com/GNOM=
E/glib/commit/98a0ab929d8c59ee27e5f470f11d077bb6a56749</a><br>
G_GNUC_PRINTF used always used __printf__.<br>
I think that change only landed in glib 2.58, so since our current<br>
minimum glib version is 2.56 we need to retain this workaround.<br>
<br></blockquote><div><br></div><div>Oops</div><div>=C2=A0<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
&gt; Apparently, the workaound is no longer relevant though, I don&#39;t se=
e<br>
&gt; the warnings.<br>
<br>
You&#39;re probably building with a newer glib, and possibly also<br>
a newer mingw.<br>
<br>
I&#39;ve cc&#39;d Stefan Weil who might know whether we can drop this<br>
workaround as far as the mingw part is concerned.<br></blockquote><div><br>=
</div><div>Probably safer to keep it until we bump glib dependency to &gt;=
=3D2.58.</div><div><br></div><div>I would move it to glib-compat.h though, =
and leave a note there, as it is (or should be ) an old glib specific worka=
round.<br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 include/qemu/compiler.h | 8 --------<br>
&gt;=C2=A0 1 file changed, 8 deletions(-)<br>
&gt;<br>
&gt; diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h<br>
&gt; index 2704c314dcac..eb29b72c14d7 100644<br>
&gt; --- a/include/qemu/compiler.h<br>
&gt; +++ b/include/qemu/compiler.h<br>
&gt; @@ -73,14 +73,6 @@<br>
&gt;=C2=A0 #define QEMU_BUILD_BUG_ON_ZERO(x) (sizeof(QEMU_BUILD_BUG_ON_STRU=
CT(x)) - \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(QEMU_B=
UILD_BUG_ON_STRUCT(x)))<br>
&gt;<br>
&gt; -#if !defined(__clang__) &amp;&amp; defined(_WIN32)<br>
&gt; -/*<br>
&gt; - * Map __printf__ to __gnu_printf__ because we want standard format s=
trings even<br>
&gt; - * when MinGW or GLib include files use __printf__.<br>
&gt; - */<br>
&gt; -# define __printf__ __gnu_printf__<br>
&gt; -#endif<br>
&gt; -<br>
&gt;=C2=A0 #ifndef __has_warning<br>
&gt;=C2=A0 #define __has_warning(x) 0 /* compatibility with non-clang compi=
lers */<br>
&gt;=C2=A0 #endif<br>
&gt; --<br>
&gt; 2.35.1.273.ge6ebfd0e8cbb<br>
<br>
thanks<br>
-- PMM<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000006dbe4605d8c8e5e6--

