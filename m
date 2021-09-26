Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CC6418A58
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 19:25:40 +0200 (CEST)
Received: from localhost ([::1]:33888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUXuF-0004IA-Ra
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 13:25:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mUXqG-0001W1-Nd
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 13:21:33 -0400
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934]:39631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mUXqE-00035r-TO
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 13:21:32 -0400
Received: by mail-ua1-x934.google.com with SMTP id 20so2418436uaj.6
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 10:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vw3Wjn1UFMN46k8RAfv3FNLnBes/UjS5POs9K9FPzAU=;
 b=jVgAJ31bNs70JhfZgs5zregTDnPeudisWiVGj7AugG+OlQQSRayO5McCnWlKvXehrZ
 e6hzBYnyYRCUoezavbvfuqdQV8l9s+EDMWL5EIxce40kT0aMcn/ZIewxbctEaargVTL2
 rlOnSQXJqnAkHeVnlxNVTG98VSf3wLoCfvVxuZM/vI0tZ97nPLV5i+Np3//5zrveY6K+
 G1feWFudlFjgP+zKiaRgwRsp8bBYILECA+whz+QZBC7U769my7HG+3YRBZ4d4LUAv3tO
 J5Tqi2Z2KuQNnt45uEKLKAZhqmF4DOVt8/CtDMWySmG7yiNS+izVEmhRoxGVeBgoyM64
 kkMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vw3Wjn1UFMN46k8RAfv3FNLnBes/UjS5POs9K9FPzAU=;
 b=Dg7WJpvtgVXc0Vaj6foiCZHkU3Wqij/HVoTFIs1YlbmWfWNARCq7zubVSx+iBm0cNr
 0cRdyzh02w0KeU928NqpcJPOgBpZJhvWsTEicQYOv2ndVgHOnFrEV1qZ3SfbIpm2/p+f
 Wk+8f74ONjeu1q15JYF8pJzDbQ28JEVMrPvXyGVCRJwI2l/7X+2FXJSRjuZnBNRpQIEq
 ApPKM+yO0ow9JUDYPnuelBwib7WBQHmMSrexYiZrxrLBG/nX+EXOArVbD8XkMaprQ2PD
 BhIsWUwtfJYqH56OQ+Ge5iFZIuuRRjHtJSFAomKtiKKFWtBFlxSXs2RCc9mHRfoFGl1G
 b+hw==
X-Gm-Message-State: AOAM533EA+6or4bxVICrP4lOSFjFDk/zywlH9W+4OzBEIrZvB4YOPy5U
 27+WVylRbdJRpo+CfdPbTuFxotkpqmkly6Xya9ulyw==
X-Google-Smtp-Source: ABdhPJz7YbIzbO+Hnr6Zo26Ev/3trZwJYzc+c5aUyBpZR6dQ9qHpE3ZtQep43vttdSDYs/F40654QpFGkjLLl48bDBs=
X-Received: by 2002:ab0:471d:: with SMTP id h29mr16010447uac.11.1632676889667; 
 Sun, 26 Sep 2021 10:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-13-imp@bsdimp.com>
 <64e8f0f5-1239-fc04-1c58-189421212f2c@amsat.org>
In-Reply-To: <64e8f0f5-1239-fc04-1c58-189421212f2c@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 26 Sep 2021 11:21:18 -0600
Message-ID: <CANCZdfprC16ezJQCWJmYEApX6eym9nxSOqAtBAGr+cziS4r2qw@mail.gmail.com>
Subject: Re: [PATCH 12/14] bsd-user/sysarch: Provide a per-arch framework for
 sysarch syscall
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000000abcc805cce93654"
Received-SPF: none client-ip=2607:f8b0:4864:20::934;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x934.google.com
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
 QEMU Developers <qemu-devel@nongnu.org>, Stacey Son <sson@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000abcc805cce93654
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 25, 2021 at 4:46 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> Hi Warner,
>
> On 9/22/21 08:14, Warner Losh wrote:
> > Add the missing glue to pull in do_freebsd_sysarch to call
> > do_freebsd_arch_sysarch. Put it in os-sys.c, which will be used for
> > sysctl and sysarch system calls because they are mostly arch specific.
> >
> > Signed-off-by: Stacey Son <sson@FreeBSD.org>
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >   bsd-user/freebsd/meson.build |  3 +++
> >   bsd-user/freebsd/os-sys.c    | 28 ++++++++++++++++++++++++++++
> >   bsd-user/meson.build         |  6 ++++++
> >   bsd-user/qemu.h              |  3 +++
> >   bsd-user/syscall.c           |  7 -------
> >   5 files changed, 40 insertions(+), 7 deletions(-)
> >   create mode 100644 bsd-user/freebsd/meson.build
> >   create mode 100644 bsd-user/freebsd/os-sys.c
>
> > +/* sysarch() is architecture dependent. */
> > +abi_long do_freebsd_sysarch(void *cpu_env, abi_long arg1, abi_long arg=
2)
> > +{
> > +
> > +    return do_freebsd_arch_sysarch(cpu_env, arg1, arg2);
> > +}
> > diff --git a/bsd-user/meson.build b/bsd-user/meson.build
> > index 0369549340..561913de05 100644
> > --- a/bsd-user/meson.build
> > +++ b/bsd-user/meson.build
> > @@ -8,3 +8,9 @@ bsd_user_ss.add(files(
> >     'syscall.c',
> >     'uaccess.c',
> >   ))
> > +
> > +# Pull in the OS-specific build glue, if any
> > +if fs.exists(targetos)
> > +   subdir(targetos)
>
> I am a bit confused here, we have an optional implementation ...
>
> > +endif
> > +
> > diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> > index 4ee57b91f0..3dde381d5d 100644
> > --- a/bsd-user/qemu.h
> > +++ b/bsd-user/qemu.h
> > @@ -239,6 +239,9 @@ extern unsigned long target_sgrowsiz;
> >   abi_long get_errno(abi_long ret);
> >   int is_error(abi_long ret);
> >
> > +/* os-sys.c */
> > +abi_long do_freebsd_sysarch(void *cpu_env, abi_long arg1, abi_long
> arg2);
>
> ... that is declared as non-optional.
>
> In fact it is called by do_freebsd_syscall(), not restricted to
> TARGET_I386.
>
> This shouldn't be (meson) optional IMO.
>

I made it optional because we descend into this directory even
for linux targets when building linux-user on at least ubuntu (and
I think all linux targets).

Your comment suggests that I need to have a different meson fix
for this situation...

Warner


> > +
> >   /* user access */
> >
> >   #define VERIFY_READ  PAGE_READ
> > diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
> > index 9bc72501b2..9f51563abd 100644
> > --- a/bsd-user/syscall.c
> > +++ b/bsd-user/syscall.c
> > @@ -88,13 +88,6 @@ static abi_long do_obreak(abi_ulong new_brk)
> >       return 0;
> >   }
> >
> > -#if defined(TARGET_I386)
> > -static abi_long do_freebsd_sysarch(CPUX86State *env, int op, abi_ulong
> parms)
> > -{
> > -    do_freebsd_arch_sysarch(env, op, parms);
> > -}
> > -#endif
> > -
> >   #ifdef __FreeBSD__
> >   /*
> >    * XXX this uses the undocumented oidfmt interface to find the kind o=
f
> >
>

--0000000000000abcc805cce93654
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Sep 25, 2021 at 4:46 AM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Hi Warner,<br>
<br>
On 9/22/21 08:14, Warner Losh wrote:<br>
&gt; Add the missing glue to pull in do_freebsd_sysarch to call<br>
&gt; do_freebsd_arch_sysarch. Put it in os-sys.c, which will be used for<br=
>
&gt; sysctl and sysarch system calls because they are mostly arch specific.=
<br>
&gt; <br>
&gt; Signed-off-by: Stacey Son &lt;sson@FreeBSD.org&gt;<br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/freebsd/meson.build |=C2=A0 3 +++<br>
&gt;=C2=A0 =C2=A0bsd-user/freebsd/os-sys.c=C2=A0 =C2=A0 | 28 ++++++++++++++=
++++++++++++++<br>
&gt;=C2=A0 =C2=A0bsd-user/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 6 ++++++<br>
&gt;=C2=A0 =C2=A0bsd-user/qemu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 3 +++<br>
&gt;=C2=A0 =C2=A0bsd-user/syscall.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 7 -------<br>
&gt;=C2=A0 =C2=A05 files changed, 40 insertions(+), 7 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 bsd-user/freebsd/meson.build<br>
&gt;=C2=A0 =C2=A0create mode 100644 bsd-user/freebsd/os-sys.c<br>
<br>
&gt; +/* sysarch() is architecture dependent. */<br>
&gt; +abi_long do_freebsd_sysarch(void *cpu_env, abi_long arg1, abi_long ar=
g2)<br>
&gt; +{<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return do_freebsd_arch_sysarch(cpu_env, arg1, arg2);<br=
>
&gt; +}<br>
&gt; diff --git a/bsd-user/meson.build b/bsd-user/meson.build<br>
&gt; index 0369549340..561913de05 100644<br>
&gt; --- a/bsd-user/meson.build<br>
&gt; +++ b/bsd-user/meson.build<br>
&gt; @@ -8,3 +8,9 @@ bsd_user_ss.add(files(<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;syscall.c&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;uaccess.c&#39;,<br>
&gt;=C2=A0 =C2=A0))<br>
&gt; +<br>
&gt; +# Pull in the OS-specific build glue, if any<br>
&gt; +if fs.exists(targetos)<br>
&gt; +=C2=A0 =C2=A0subdir(targetos)<br>
<br>
I am a bit confused here, we have an optional implementation ...<br>
<br>
&gt; +endif<br>
&gt; +<br>
&gt; diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h<br>
&gt; index 4ee57b91f0..3dde381d5d 100644<br>
&gt; --- a/bsd-user/qemu.h<br>
&gt; +++ b/bsd-user/qemu.h<br>
&gt; @@ -239,6 +239,9 @@ extern unsigned long target_sgrowsiz;<br>
&gt;=C2=A0 =C2=A0abi_long get_errno(abi_long ret);<br>
&gt;=C2=A0 =C2=A0int is_error(abi_long ret);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +/* os-sys.c */<br>
&gt; +abi_long do_freebsd_sysarch(void *cpu_env, abi_long arg1, abi_long ar=
g2);<br>
<br>
... that is declared as non-optional.<br>
<br>
In fact it is called by do_freebsd_syscall(), not restricted to TARGET_I386=
.<br>
<br>
This shouldn&#39;t be (meson) optional IMO.<br></blockquote><div><br></div>=
<div>I made it optional because we descend into this directory even</div><d=
iv>for linux targets when building linux-user on at least ubuntu (and</div>=
<div>I think all linux targets).</div><div><br></div><div>Your comment sugg=
ests that I need to have a different meson fix</div><div>for this situation=
...</div><div><br></div><div>Warner</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
&gt; +<br>
&gt;=C2=A0 =C2=A0/* user access */<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#define VERIFY_READ=C2=A0 PAGE_READ<br>
&gt; diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c<br>
&gt; index 9bc72501b2..9f51563abd 100644<br>
&gt; --- a/bsd-user/syscall.c<br>
&gt; +++ b/bsd-user/syscall.c<br>
&gt; @@ -88,13 +88,6 @@ static abi_long do_obreak(abi_ulong new_brk)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -#if defined(TARGET_I386)<br>
&gt; -static abi_long do_freebsd_sysarch(CPUX86State *env, int op, abi_ulon=
g parms)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 do_freebsd_arch_sysarch(env, op, parms);<br>
&gt; -}<br>
&gt; -#endif<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0#ifdef __FreeBSD__<br>
&gt;=C2=A0 =C2=A0/*<br>
&gt;=C2=A0 =C2=A0 * XXX this uses the undocumented oidfmt interface to find=
 the kind of<br>
&gt; <br>
</blockquote></div></div>

--0000000000000abcc805cce93654--

