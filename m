Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BFE4011FE
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 00:47:20 +0200 (CEST)
Received: from localhost ([::1]:42884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mN0v1-0001DD-80
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 18:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mN0st-0000Hq-4S
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 18:45:07 -0400
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e]:46948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mN0sr-0004GU-3o
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 18:45:06 -0400
Received: by mail-vk1-xa2e.google.com with SMTP id s71so1629644vke.13
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 15:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=izMuFldgOzJBRPVU71IqUaKcY6eBABAuTHtvzt81FmE=;
 b=Cjk6g6qpFxOAZCYU6Rrh+DATRF4Qkc0EJhh9wkXfgkeKzZWvhd+jRyMjaYPcgPF7od
 lElsiDidtENX1R/LfoypQ/AHpjgm88nv5h0n0JVtOiNQowNStWl2+0UWZAWHvAnQbMRh
 M93RWILf14oxZ0QSW3/FrkXRCbQZH6vk8NVKlURZlqEyYu16G6Q6wwvBkQhcqrQt1KdF
 iqujfkWmIajIRxwGjmykpmpQw789ah1tqcfKOyD4+YNKMtm/tfAYvK5fQf42y3eQuHwh
 RRsBHdxWN0yb9QCUrqX2+3IA/jhX1ohtpeotWmo7P/xYkqM5klVfa9gl7K7gt+GufHK3
 UEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=izMuFldgOzJBRPVU71IqUaKcY6eBABAuTHtvzt81FmE=;
 b=mzex5OxWvfpxFebc2DtrkbdV8Z4GMTQvaXzyir6SgYl3Cuu5WM6J8EeuYCJ03rD3UM
 pHlomCcWDNMGhDbaXogopoICvwJRcmElPUD7onLokd5XvgMJ5JaZVA/ZpL8KsZeCngl+
 ZLqFSwGbCBynigmazdj4JwZo5qgqFSd3ZqAymjWoZ3hbd2uiaGS4uw702UoELropqIeR
 5xOpJMDfi5XqfR7BKaso6K5fcXkKQvcDKdrJFbZMaLxSVNb7aTCuVEL6KdVGFUhhGS47
 7uUxtMJ3oTYGekuM6GTpIXcnMUmZlzWcVoGuSfb4RPRFVzrh1b4U45KJreBcDUyPKWjw
 BnFw==
X-Gm-Message-State: AOAM532k0986OEac0YIbkjHed/ahteH9rdUQM6ZXbvVEtsxc2LKAAkzY
 t2msuquQ/WqGAI1tmZ7JASXQI+jD7kI7asi6023s+g==
X-Google-Smtp-Source: ABdhPJwM8qBr8k8QNjEmb+S40of8omP7xQusJsupIexwBK/TDNMmDXl2xfCwdY+48lWv1CkzCbhJrf+My0cUI2oGGu4=
X-Received: by 2002:a05:6122:d95:: with SMTP id
 bc21mr3850089vkb.23.1630881903513; 
 Sun, 05 Sep 2021 15:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210902234729.76141-1-imp@bsdimp.com>
 <20210902234729.76141-34-imp@bsdimp.com>
 <CACNAnaGJnkZPyG6NEjfgj9A3sp5TxF7z6prAN_dU3fdd=wrhyA@mail.gmail.com>
In-Reply-To: <CACNAnaGJnkZPyG6NEjfgj9A3sp5TxF7z6prAN_dU3fdd=wrhyA@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 5 Sep 2021 16:44:52 -0600
Message-ID: <CANCZdfpUVquC_8SHNke_hXf03vijZ=gWGjjf+Y4m0TsYzYUvEQ@mail.gmail.com>
Subject: Re: [PATCH v3 33/43] bsd-user: Make cpu_model and cpu_type visible to
 all of main.c
To: Kyle Evans <kevans@freebsd.org>
Content-Type: multipart/alternative; boundary="00000000000087a4ad05cb47481f"
Received-SPF: none client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa2e.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000087a4ad05cb47481f
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 5, 2021 at 12:57 PM Kyle Evans <kevans@freebsd.org> wrote:

> On Thu, Sep 2, 2021 at 6:53 PM <imp@bsdimp.com> wrote:
> >
> > From: Warner Losh <imp@FreeBSD.org>
> >
> > cpu_model and cpu_type will be used future commits, so move them from
> > main() scoped to file scoped.
> >
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > Acked-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  bsd-user/main.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> I think we should reduce this one to just moving cpu_type. cpu_model
> is really only used in main() to derive the appropriate cpu_type,
> which we do use later
>

Fair point. I think I'm going to drop this patch from the series (yea, back
to 42)
and work it out with you on the bsd-user 'blitz' branch and try again in a
future
patch round.

Warner


> >
> > diff --git a/bsd-user/main.c b/bsd-user/main.c
> > index 71fd9d5aba..50c8fdc1e2 100644
> > --- a/bsd-user/main.c
> > +++ b/bsd-user/main.c
> > @@ -54,6 +54,8 @@
> >  int singlestep;
> >  unsigned long mmap_min_addr;
> >  uintptr_t guest_base;
> > +static const char *cpu_model;
> > +static const char *cpu_type;
> >  bool have_guest_base;
> >  unsigned long reserved_va;
> >
> > @@ -201,8 +203,6 @@ static void save_proc_pathname(char *argv0)
> >  int main(int argc, char **argv)
> >  {
> >      const char *filename;
> > -    const char *cpu_model;
> > -    const char *cpu_type;
> >      const char *log_file = NULL;
> >      const char *log_mask = NULL;
> >      const char *seed_optarg = NULL;
> > --
> > 2.32.0
> >
>

--00000000000087a4ad05cb47481f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 5, 2021 at 12:57 PM Kyle =
Evans &lt;<a href=3D"mailto:kevans@freebsd.org">kevans@freebsd.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, S=
ep 2, 2021 at 6:53 PM &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"_blan=
k">imp@bsdimp.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Warner Losh &lt;imp@FreeBSD.org&gt;<br>
&gt;<br>
&gt; cpu_model and cpu_type will be used future commits, so move them from<=
br>
&gt; main() scoped to file scoped.<br>
&gt;<br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; Acked-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 bsd-user/main.c | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
I think we should reduce this one to just moving cpu_type. cpu_model<br>
is really only used in main() to derive the appropriate cpu_type,<br>
which we do use later<br></blockquote><div><br></div><div>Fair point. I thi=
nk=C2=A0I&#39;m going to drop this patch from the series (yea, back to 42)<=
/div><div>and work it out with you on the bsd-user &#39;blitz&#39; branch a=
nd try again in a future</div><div>patch round.</div><div><br></div><div>Wa=
rner</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
&gt;<br>
&gt; diff --git a/bsd-user/main.c b/bsd-user/main.c<br>
&gt; index 71fd9d5aba..50c8fdc1e2 100644<br>
&gt; --- a/bsd-user/main.c<br>
&gt; +++ b/bsd-user/main.c<br>
&gt; @@ -54,6 +54,8 @@<br>
&gt;=C2=A0 int singlestep;<br>
&gt;=C2=A0 unsigned long mmap_min_addr;<br>
&gt;=C2=A0 uintptr_t guest_base;<br>
&gt; +static const char *cpu_model;<br>
&gt; +static const char *cpu_type;<br>
&gt;=C2=A0 bool have_guest_base;<br>
&gt;=C2=A0 unsigned long reserved_va;<br>
&gt;<br>
&gt; @@ -201,8 +203,6 @@ static void save_proc_pathname(char *argv0)<br>
&gt;=C2=A0 int main(int argc, char **argv)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 const char *filename;<br>
&gt; -=C2=A0 =C2=A0 const char *cpu_model;<br>
&gt; -=C2=A0 =C2=A0 const char *cpu_type;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 const char *log_file =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 const char *log_mask =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 const char *seed_optarg =3D NULL;<br>
&gt; --<br>
&gt; 2.32.0<br>
&gt;<br>
</blockquote></div></div>

--00000000000087a4ad05cb47481f--

