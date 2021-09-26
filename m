Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3261418A4E
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 19:17:02 +0200 (CEST)
Received: from localhost ([::1]:48886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUXls-0003hC-Ux
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 13:17:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mUXjp-00024k-T6
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 13:14:53 -0400
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933]:37554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mUXjn-0005y0-9H
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 13:14:52 -0400
Received: by mail-ua1-x933.google.com with SMTP id p9so10522269uak.4
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 10:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jnxm+fFaZHpp7Zl/vSt0U7fn8D/GF8HVqbsT8xZg4co=;
 b=nPNET2wwikxjGNXnEHSF7Bgr921xoQ23+QKcI1PNtgkazj0yesD3j4ImWZp8u1cp/b
 HH3ROZjSENYJ6F8IUlyrDn2pVsE/dimbFM5mQGLvG/qFRFArHVRWL32aKsV1gmE9E+Ng
 tTakck0+kzw1xhFwc6v9eZHJLMN8ez8lV8X7n3RdChS6xNSgI6nzwxELMQWI3Y8zxXEi
 LdT3JscRvdR66Am2eM486q0HoeACMdxLc98x8Nghmq67hC42ollLd63iaSNrtk+Vs9tD
 fdpg53PMxWeDIuPxPbbuc6/17OdpbtiuRZzHlR8jJhTNPfbJ3od1JFtU/O6DcDucDtVb
 B9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jnxm+fFaZHpp7Zl/vSt0U7fn8D/GF8HVqbsT8xZg4co=;
 b=o7xY3Pfq0gUtixmzEi5rxjMkQgfuhhBee44ZHukPU3FxqHWjOU6v/1NpFHcHPM5rGC
 q2R/vE5+ClgNOZbEEgaB83U2EgNZx8dzbQE4Xy0T9M531P2bWKgYUPSnBQ03LrSfF6Vc
 RPa1Z/KttJo9o34p6xhXqXQT7hyw0adZla95GlOzsWjlUZpgkpXmTraSDUqVxWN2fI62
 LUGulu0WdIZftmFt4/DslXbJD7Six6XIcWe8u52C9N06JyFfeMJ/Kkg/m4EBaaG3P72i
 cf1v/ihgYD2uRFR7le4dJomwgRlvPkVqMyxCgcHlsso/yl6lBMa9gAHEmf6jlcKXIeMe
 97wQ==
X-Gm-Message-State: AOAM5338c46vuWPjJ96C2By6ItqsBhqBFt4OxQaa5j0qOUO6z7+guyJt
 0XI40qHwqOsz29NkQCiPpeJulLkKlDaR4AqCMAKoag==
X-Google-Smtp-Source: ABdhPJyhvRbGyru9H7HNhCeKxbgJ77xsbmk9hqaJHx9yWR1E0gwqMHNDwcFRw1yu8nqc+QR/dtoIgUR3/aQSjZJKHgk=
X-Received: by 2002:ab0:5b5d:: with SMTP id v29mr8472690uae.85.1632676489980; 
 Sun, 26 Sep 2021 10:14:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-5-imp@bsdimp.com>
 <10bb09fe-8995-29ab-e719-616d1a7e6114@amsat.org>
In-Reply-To: <10bb09fe-8995-29ab-e719-616d1a7e6114@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 26 Sep 2021 11:14:39 -0600
Message-ID: <CANCZdfqBvMTAa8d650KzTSKJnuK-RGj_=tvxFjzH47kBfySGxA@mail.gmail.com>
Subject: Re: [PATCH 04/14] bsd-user: export get_errno and is_error from
 syscall.c
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000003800df05cce91ea6"
Received-SPF: none client-ip=2607:f8b0:4864:20::933;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x933.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003800df05cce91ea6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 25, 2021 at 4:33 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> On 9/22/21 08:14, Warner Losh wrote:
> > Make get_errno and is_error global so files other than syscall.c can us=
e
> > them.
> >
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >   bsd-user/qemu.h    |  4 ++++
> >   bsd-user/syscall.c | 10 +++++-----
> >   2 files changed, 9 insertions(+), 5 deletions(-)
> >
> > diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> > index 522d6c4031..22fc3a6c30 100644
> > --- a/bsd-user/qemu.h
> > +++ b/bsd-user/qemu.h
> > @@ -235,6 +235,10 @@ extern unsigned long target_dflssiz;
> >   extern unsigned long target_maxssiz;
> >   extern unsigned long target_sgrowsiz;
> >
> > +/* syscall.c */
> > +abi_long get_errno(abi_long ret);
> > +int is_error(abi_long ret);
> > +
> >   /* user access */
> >
> >   #define VERIFY_READ  PAGE_READ
> > diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
> > index 372836d44d..a579d52ede 100644
> > --- a/bsd-user/syscall.c
> > +++ b/bsd-user/syscall.c
> > @@ -33,18 +33,18 @@
> >   static abi_ulong target_brk;
> >   static abi_ulong target_original_brk;
> >
> > -static inline abi_long get_errno(abi_long ret)
> > +abi_long get_errno(abi_long ret)
> >   {
> > -    if (ret =3D=3D -1)
> > +    if (ret =3D=3D -1) {
> >           /* XXX need to translate host -> target errnos here */
> >           return -(errno);
> > -    else
> > -        return ret;
> > +    }
> > +    return ret;
> >   }
> >
> >   #define target_to_host_bitmask(x, tbl) (x)
> >
> > -static inline int is_error(abi_long ret)
> > +int is_error(abi_long ret)
>
> Since you are modifying this, do you mind having it return
> a boolean type instead?
>

Nah, don't mind. There were no problems caused by making that change.


> >   {
> >       return (abi_ulong)ret >=3D (abi_ulong)(-4096);
> >   }
> >
>
> Preferably having is_error() returning bool:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>

Thanks for the suggestion.

Warner

--0000000000003800df05cce91ea6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Sep 25, 2021 at 4:33 AM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On 9/22/21 08:14, Warner Losh wrote:<br>
&gt; Make get_errno and is_error global so files other than syscall.c can u=
se<br>
&gt; them.<br>
&gt; <br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/qemu.h=C2=A0 =C2=A0 |=C2=A0 4 ++++<br>
&gt;=C2=A0 =C2=A0bsd-user/syscall.c | 10 +++++-----<br>
&gt;=C2=A0 =C2=A02 files changed, 9 insertions(+), 5 deletions(-)<br>
&gt; <br>
&gt; diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h<br>
&gt; index 522d6c4031..22fc3a6c30 100644<br>
&gt; --- a/bsd-user/qemu.h<br>
&gt; +++ b/bsd-user/qemu.h<br>
&gt; @@ -235,6 +235,10 @@ extern unsigned long target_dflssiz;<br>
&gt;=C2=A0 =C2=A0extern unsigned long target_maxssiz;<br>
&gt;=C2=A0 =C2=A0extern unsigned long target_sgrowsiz;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +/* syscall.c */<br>
&gt; +abi_long get_errno(abi_long ret);<br>
&gt; +int is_error(abi_long ret);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0/* user access */<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#define VERIFY_READ=C2=A0 PAGE_READ<br>
&gt; diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c<br>
&gt; index 372836d44d..a579d52ede 100644<br>
&gt; --- a/bsd-user/syscall.c<br>
&gt; +++ b/bsd-user/syscall.c<br>
&gt; @@ -33,18 +33,18 @@<br>
&gt;=C2=A0 =C2=A0static abi_ulong target_brk;<br>
&gt;=C2=A0 =C2=A0static abi_ulong target_original_brk;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -static inline abi_long get_errno(abi_long ret)<br>
&gt; +abi_long get_errno(abi_long ret)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 if (ret =3D=3D -1)<br>
&gt; +=C2=A0 =C2=A0 if (ret =3D=3D -1) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* XXX need to translate host =
-&gt; target errnos here */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -(errno);<br>
&gt; -=C2=A0 =C2=A0 else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 return ret;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#define target_to_host_bitmask(x, tbl) (x)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -static inline int is_error(abi_long ret)<br>
&gt; +int is_error(abi_long ret)<br>
<br>
Since you are modifying this, do you mind having it return<br>
a boolean type instead?<br></blockquote><div><br></div><div>Nah, don&#39;t =
mind. There were no problems caused by making that change.</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return (abi_ulong)ret &gt;=3D (abi_ulong)(-4=
096);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; <br>
<br>
Preferably having is_error() returning bool:<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br></blockquote><div><br></d=
iv><div>Thanks for the suggestion.</div><div><br></div><div>Warner=C2=A0</d=
iv></div></div>

--0000000000003800df05cce91ea6--

