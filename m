Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F53A3E3CEA
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 23:44:56 +0200 (CEST)
Received: from localhost ([::1]:41476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCqbH-0000a5-4U
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 17:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mCqaM-0008LD-Jb
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 17:43:58 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:35459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mCqaK-0008Eq-Dj
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 17:43:58 -0400
Received: by mail-qk1-x72d.google.com with SMTP id a19so16319027qkg.2
 for <qemu-devel@nongnu.org>; Sun, 08 Aug 2021 14:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LRQMhUCuJ6tw8C/xPp73puV9i3gH7fjoptXZ1vr2wXg=;
 b=eNIGNtYIi0tDnXAZinCvxg+n+BQfIi2jovODECZRmKst1lwkVv8b6sm3SD0Gl1LaMP
 WR6xxEgN2OxNpsgwXhRDCA9joyLDuXnQsXxUKqq8DTlrNSOdhkApbp+tgYpz14MBfVUX
 eE3gr2LaVrTIzqVvcacviG4YVLlN6uBYg5ATVcrjq6+Qahm04OK9dVhftk/BTqcCFYgv
 M4o/EVn6I/cJYYghnPTMCYe1jPGZUOdFw97PutGIEjKq0PH4fAxGUzXopW1oXDojpN3K
 A7h79xC+lUXX6quMLDfhD3KRpUqUQaWprzA0cTdmdhJkF2yo7qpWcul9N5SBxjo0gETT
 OoDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LRQMhUCuJ6tw8C/xPp73puV9i3gH7fjoptXZ1vr2wXg=;
 b=A9yncouBV4vfiRnjDLs96RzZUnZS599uLpAmU/E4n2qxxUmgYKIFBn5HXCbt9DTo0s
 86CxjBPRouoEvK4Oh5LwFlt/a1RlIW4Cb104Qal2bqrEVYoVRr/B0gpVecJ8DBVtRS0k
 SMWbbYf9C7mYXd7zZl9JCx8su+leH980zk5RRtcskWi/5s/+d6/XlwWfP0eri9oxyIQ3
 n66qp4XwtaKoWs6IAgatxdQAF/10WYrbfDEtDE6AtcCXeiz5tAjmqIdjXKmIDP/YGX8U
 8P4XbX2+ri2lyv47AXIXD2PceGD1tH6BlnOxy3WadesFlGy3LcdScEvcOtR74T1nZ4L1
 Y5rg==
X-Gm-Message-State: AOAM532A9+DA7KBkVHg7qekV3J2/8QH5EkGIxs1HP/pce9U9tTBA/BBu
 w3vtHSPoeGblXo4qL5tFTp9DWLVJhpO4hJPywSZrBA==
X-Google-Smtp-Source: ABdhPJxCfwdSc3RGfa6ROOhNou4Tfat6MjhH8u2phZaUNguZ8sWK72S0DUg0Bk6ISZ0zewu60I9mFsUJy+ZBFmioJ/o=
X-Received: by 2002:a37:9e46:: with SMTP id h67mr8135603qke.195.1628459034894; 
 Sun, 08 Aug 2021 14:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-24-imp@bsdimp.com>
 <d20c2d8b-6020-2f4c-d3b1-ad8e66ec836e@linaro.org>
In-Reply-To: <d20c2d8b-6020-2f4c-d3b1-ad8e66ec836e@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 8 Aug 2021 15:43:43 -0600
Message-ID: <CANCZdfow5E6fAf2Y4AZh_Qxb0FdP-TrvYpLXg-oxFE23pVPDdw@mail.gmail.com>
Subject: Re: [PATCH for 6.2 23/49] bsd-user: pull in target_arch_thread.h
 update target_arch_elf.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000004e786605c9132a77"
Received-SPF: none client-ip=2607:f8b0:4864:20::72d;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x72d.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stacey Son <sson@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004e786605c9132a77
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 8, 2021 at 12:24 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 8/7/21 11:42 AM, Warner Losh wrote:
> > +++ b/bsd-user/x86_64/target_arch_elf.h
> > @@ -19,48 +19,14 @@
> >   #ifndef_TARGET_ARCH_ELF_H_
> >   #define_TARGET_ARCH_ELF_H_
> >
> > -#define ELF_PLATFORM get_elf_platform()
> > -
> > -static const char *get_elf_platform(void)
> > -{
> > -    static char elf_platform[] = "i386";
> > -    int family = object_property_get_int(OBJECT(thread_cpu), "family",
> NULL);
> > -    if (family > 6) {
> > -        family = 6;
> > -    }
> > -    if (family >= 3) {
> > -        elf_platform[1] = '0' + family;
> > -    }
> > -    return elf_platform;
> > -}
> > -
> > -#define ELF_HWCAP get_elf_hwcap()
> > -
> > -static uint32_t get_elf_hwcap(void)
> > -{
> > -    X86CPU *cpu = X86_CPU(thread_cpu);
> > -
> > -    return cpu->env.features[FEAT_1_EDX];
> > -}
> > -
> >   #define ELF_START_MMAP 0x2aaaaab000ULL
> > -#define elf_check_arch(x) (((x) == ELF_ARCH))
> > +#define ELF_ET_DYN_LOAD_ADDR    0x01021000
> > +#define elf_check_arch(x) ( ((x) == ELF_ARCH) )
>
> This appears to be unrelated?  Should this have been in a previous patch?
> Or is this a
> rebase mistake that gets corrected later?
>

This turns out to be a very good question. It's exactly what I intended to
do. It's a
copy of the latest development branch. However, digging into it shows that
it is
none-the-less incorrect. It wasn't a mismerge, but it was code commented
out 8
years ago which I removed in the merge. I had thought this meant it was
unused.
In fact, it had been for some time. However, it's been wrong all that time
and that
code should be restored not only here, but for other architectures I've not
submitted.
It was unused, but not unneeded...


> I'll trust the target_os_thread.h thing becomes useful later.
> So, modulo the target_arch_elf.h weirdness,
>

Yes. It works well enough on x86, but since x86 isn't used by our project
for more
than a basic sanity check, this breakage went unnoticed for some time...

I'll update with the next round. BTW, I've started to notice that many of
the
items flagged by the style commitcheck.pl script originated in the
linux-user
code and it's still that way today...  Do you have any advice for what I
should
do about that, if anything?

Warner


> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> r~
>

--0000000000004e786605c9132a77
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 8, 2021 at 12:24 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 8/7/21 11:42 AM, Warner Losh wrote:<br>
&gt; +++ b/bsd-user/x86_64/target_arch_elf.h<br>
&gt; @@ -19,48 +19,14 @@<br>
&gt;=C2=A0 =C2=A0#ifndef_TARGET_ARCH_ELF_H_<br>
&gt;=C2=A0 =C2=A0#define_TARGET_ARCH_ELF_H_<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -#define ELF_PLATFORM get_elf_platform()<br>
&gt; -<br>
&gt; -static const char *get_elf_platform(void)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 static char elf_platform[] =3D &quot;i386&quot;;<br>
&gt; -=C2=A0 =C2=A0 int family =3D object_property_get_int(OBJECT(thread_cp=
u), &quot;family&quot;, NULL);<br>
&gt; -=C2=A0 =C2=A0 if (family &gt; 6) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 family =3D 6;<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 if (family &gt;=3D 3) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 elf_platform[1] =3D &#39;0&#39; + family;=
<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 return elf_platform;<br>
&gt; -}<br>
&gt; -<br>
&gt; -#define ELF_HWCAP get_elf_hwcap()<br>
&gt; -<br>
&gt; -static uint32_t get_elf_hwcap(void)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 X86CPU *cpu =3D X86_CPU(thread_cpu);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 return cpu-&gt;env.features[FEAT_1_EDX];<br>
&gt; -}<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0#define ELF_START_MMAP 0x2aaaaab000ULL<br>
&gt; -#define elf_check_arch(x) (((x) =3D=3D ELF_ARCH))<br>
&gt; +#define ELF_ET_DYN_LOAD_ADDR=C2=A0 =C2=A0 0x01021000<br>
&gt; +#define elf_check_arch(x) ( ((x) =3D=3D ELF_ARCH) )<br>
<br>
This appears to be unrelated?=C2=A0 Should this have been in a previous pat=
ch?=C2=A0 Or is this a <br>
rebase mistake that gets corrected later?<br></blockquote><div><br></div><d=
iv>This turns out to be a very good question. It&#39;s exactly=C2=A0what I =
intended=C2=A0to do. It&#39;s a</div><div>copy of the latest development br=
anch. However, digging into it shows that it is</div><div>none-the-less inc=
orrect. It wasn&#39;t a mismerge, but it was code commented out 8</div><div=
>years ago which=C2=A0I removed in the merge. I had thought this meant it w=
as unused.</div><div>In fact, it had been for some time. However, it&#39;s =
been wrong all that time and that</div><div>code should be restored not onl=
y here, but for other architectures I&#39;ve not submitted.</div><div>It wa=
s unused, but not unneeded...</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
I&#39;ll trust the target_os_thread.h thing becomes useful later.<br>
So, modulo the target_arch_elf.h weirdness,<br></blockquote><div><br></div>=
<div>Yes. It works well enough on x86, but since x86 isn&#39;t used by our =
project for more</div><div>than a basic sanity check, this breakage went un=
noticed for some time...</div><div><br></div><div>I&#39;ll update with the =
next round. BTW, I&#39;ve started to notice that many of the</div><div>item=
s flagged by the style <a href=3D"http://commitcheck.pl">commitcheck.pl</a>=
 script originated in the linux-user</div><div>code and it&#39;s still that=
 way today...=C2=A0 Do you have any advice for what I should</div><div>do a=
bout that, if anything?</div><div><br></div><div>Warner</div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
<br>
r~<br>
</blockquote></div></div>

--0000000000004e786605c9132a77--

