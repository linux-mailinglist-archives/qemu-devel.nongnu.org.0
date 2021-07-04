Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B127E3BADD9
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 18:41:15 +0200 (CEST)
Received: from localhost ([::1]:55762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m05BC-0001Aj-O5
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 12:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1m05A6-0000Qk-Oh
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 12:40:06 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29]:41584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1m05A3-0005xW-BE
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 12:40:06 -0400
Received: by mail-vs1-xe29.google.com with SMTP id c26so8784560vso.8
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 09:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2UZzBDXzkqD1HDPNgBrd5yeebF6h+Fj9Vmnoo5x9w1Y=;
 b=ZXiTNwNkXUn/iuGzAj/HSCWvFcloSkJGLs/nCCXbwuy+EjogPz3+jz5NREp1DqK41e
 60LmewMwXLhJ/2hGChnaEXSKudCkr8jHYndg7fh+XpbWo3y/IlfLO8ufJncMK2ZMVBxH
 ByOffu1ygMBvyV0qUDw6AM7VsgstAfWNkmv0S24/oqDyb7CVzFJTGKBt/IrXJeSeUXzA
 2dni3NZoWZW4eUFkYrmNWSNmGMvwDmh03ve6Q5Ddwb3Kpm3F0rROo7OvInNrZoEd8CCO
 bGsYdWCZdkVpudUPe9tmZT20AoNugMfx8Dzr8G5PbhdeVxxXG+pj2JFmNYtVS2tpWcdu
 J34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2UZzBDXzkqD1HDPNgBrd5yeebF6h+Fj9Vmnoo5x9w1Y=;
 b=A0Hz1IKECD/OiY+VYwqvIG8s5ShZXNP+KwYxR42PiYdrzEj2zKrAH9S0gEBgd8iSiu
 1ZOQrDNMjlpj8kFdNnXISaGM9QYeH031ySjysqMKni6zOUrwhhQ85yzjfBPoE81iQaHQ
 qyMvHA+gsi+smmH2RvkonLgEotXzOdtFLuiHqjk55mnIdTgnv86SOMdJAf/111rhzTrf
 Wk0/7jJ55j5Enlguk/HiYXIp6L5wgzQqE58xLTINJ6t2qZUDFXdyf4032rtzxrNwL5Gg
 cnAkg4vdNW/ZMM4+ptcgK6g3sew7P07lGMyD1lx0JW3g0ZFaJROD3O6Lav9yMJZgoiZt
 xvKg==
X-Gm-Message-State: AOAM5315fMvdggKMnM75zZwDj7FpbBkyspM0yE9OvhxlorED5hFgdreW
 ToyzJBe1m31A+ITLLPgEv6tvFFQs4ZhHOtSYVFEnjIM9
X-Google-Smtp-Source: ABdhPJyrQFb4IN6ilrTeDG8gD4pvPsYUJI+7+SFta/F1Vj5wM5NmlfMhQxRod6EqNKXEI4hmvZ9L2pTVlV1+HGBGIRM=
X-Received: by 2002:a67:7d06:: with SMTP id y6mr7190481vsc.1.1625416802064;
 Sun, 04 Jul 2021 09:40:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAOakUfOhn43BUUGoJPahxmxxTk8vcPeyrgsX0GDmzt46ZriNeA@mail.gmail.com>
 <CAFEAcA-rhL_BEJMi7a2tCoVE61OV2o5QeDdDfz1JXL9fLvM_cQ@mail.gmail.com>
 <CAOakUfNpv_7TE+86R0+Ng=10mXtx2=pyZUZG8jPDgOdLbqrqKQ@mail.gmail.com>
 <5c47cf07-f02e-f7d8-2725-5ae0a240e37b@amsat.org>
 <975f0d41-be4e-7e8c-2fc6-64eafc7c11a8@amsat.org>
 <951cdc26-1f4f-68d0-0187-e31513fa00c9@amsat.org>
 <CAOakUfMmxSrBcQTQaRBB1g3qFCrpm-BLDVvfgoRm2Ww_-Pe3mQ@mail.gmail.com>
 <0a17d006-b1ef-ab1e-8616-50e29681f998@redhat.com>
In-Reply-To: <0a17d006-b1ef-ab1e-8616-50e29681f998@redhat.com>
From: Richard Zak <richard.j.zak@gmail.com>
Date: Sun, 4 Jul 2021 12:39:51 -0400
Message-ID: <CAOakUfNZ5K-tVNQZZZWQ2U7-fbw_4TnFSfKXXV2nRpTGVC-LLA@mail.gmail.com>
Subject: Re: [PATCH 1/2] Fix for Haiku
To: Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000195def05c64ed7e3"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=richard.j.zak@gmail.com; helo=mail-vs1-xe29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000195def05c64ed7e3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Regarding upside down text, where did that occur? I certainly didn't do
that intentionally. Maybe an encoding error somewhere?

I'll work on incorporating the changes in the patch file. I'll make another
post where the other configure changes are in place, without the target
exclude list.

=C3=8En dum., 4 iul. 2021 la 12:23, Thomas Huth <thuth@redhat.com> a scris:

>
> Meta comment: Please avoid
> =C6=83u=C4=B1=CA=87sod u=CA=8Dop =C7=9Dp=C4=B1sdn
> ... it makes threads much harder to read.
>
> On 04/07/2021 16.20, Richard Zak wrote:
> > Exactly. One of the developers on the Haiku forum shared with me the
> patch
> > that Haiku uses for qemu, and it has a few lines concerning error codes=
.
> > I'll look into this.
> >
> https://github.com/haikuports/haikuports/blob/14c2cab5428145b93232cb69683=
a67bbe68a9f06/app-emulation/qemu/patches/qemu-3.1.1.1.patchset
>
> So something like the change in target/xtensa/xtensa-semi.c is the right
> way
> to go - using a switch-case statement looks like the right fix instead of
> disabling the targets in the configure script.
>
> > This is a stopper for the configure script changes?
>
> Well, if anyhow possible, we should avoid hacks like disabling a target i=
n
> the configure script. Since this problem seems to be understood, you
> should
> aim for the right fix instead.
>
>   Thomas
>
> > =C3=8En dum., 4 iul. 2021 la 05:30, Philippe Mathieu-Daud=C3=A9 <f4bug@=
amsat.org
> > <mailto:f4bug@amsat.org>> a scris:
> >
> >     On 7/4/21 11:27 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> >      > On 7/4/21 11:03 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> >      >> On 7/4/21 12:06 AM, Richard Zak wrote:
> >      >>> For MIPS (all sub-targets, 64-bit and EL) & xtensa(eb), the
> compiler
> >      >>> complains about running out of memory. Best I can see, that's
> not what
> >      >>> actually happens, but that's the error message. I was going to
> >      >>> investigate this later, but this was the error which was
> causing the
> >      >>> test with the Haiku VM with that corresponding make target. My
> >     desktop &
> >      >>> laptop have 64 GB, and I'm pretty sure it didn't get to that
> point.
> >      >>>
> >      >>>
> >      >
> >
>  /boot/system/develop/tools/bin/../lib/gcc/x86_64-unknown-haiku/8.3.0/../=
../../../x86_64-unknown-haiku/bin/ld:
> >      >>> final link failed: memory exhausted
> >      >
> >      >> See how Haiku handles POSIX errno:
> >      >>
> >      >>
> >
> https://github.com/haiku/haiku/blob/master/headers/os/support/Errors.h
> >     <
> https://github.com/haiku/haiku/blob/master/headers/os/support/Errors.h>
> >      >>
> >      >> #define B_GENERAL_ERROR_BASE   INT_MIN
> >      >>
> >      >> #define B_POSIX_ERROR_BASE     (B_GENERAL_ERROR_BASE + 0x7000)
> >      >>
> >      >> #define B_POSIX_ENOMEM  B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 0=
)
> >      >> #define E2BIG           B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 1=
)
> >      >> #define ECHILD          B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 2=
)
> >      >> ...
> >      >>
> >      >
> >      > Same problem with Xtensa:
> >      >
> >      > static uint32_t errno_h2g(int host_errno)
> >      > {
> >      >     static const uint32_t guest_errno[] =3D {
> >      >         [EPERM]         =3D TARGET_EPERM,
> >      >         [ENOENT]        =3D TARGET_ENOENT,
> >      >         [ESRCH]         =3D TARGET_ESRCH,
> >      >         [EINTR]         =3D TARGET_EINTR,
> >      >         [EIO]           =3D TARGET_EIO,
> >      >         [ENXIO]         =3D TARGET_ENXIO,
> >      >         [E2BIG]         =3D TARGET_E2BIG,
> >      >         [ENOEXEC]       =3D TARGET_ENOEXEC,
> >      > ...
> >
> >     Annoyingly enough this is also how linux-user/syscall.c does
> >     (thinking about code re-use):
> >
> >     /*
> >       * This list is the union of errno values overridden in
> asm-<arch>/errno.h
> >       * minus the errnos that are not actually generic to all archs.
> >       */
> >     static uint16_t host_to_target_errno_table[ERRNO_TABLE_SIZE] =3D {
> >          [EAGAIN]            =3D TARGET_EAGAIN,
> >          [EIDRM]             =3D TARGET_EIDRM,
> >          [ECHRNG]            =3D TARGET_ECHRNG,
> >          [EL2NSYNC]          =3D TARGET_EL2NSYNC,
> >          [EL3HLT]            =3D TARGET_EL3HLT,
> >          [EL3RST]            =3D TARGET_EL3RST,
> >     ...
> >
> >
> >
> > --
> > Regards,
> >
> > Richard J. Zak
> > Professional Genius
> > PGP Key: https://keybase.io/rjzak/key.asc <
> https://keybase.io/rjzak/key.asc>
>
>

--=20
Regards,

Richard J. Zak
Professional Genius
PGP Key: https://keybase.io/rjzak/key.asc

--000000000000195def05c64ed7e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Regarding upside down text, where did that occur? I c=
ertainly didn&#39;t do that intentionally. Maybe an encoding error somewher=
e?</div><div><br></div><div>I&#39;ll work on incorporating the changes in t=
he patch file. I&#39;ll make another post where the other configure changes=
 are in place, without the target exclude list.<br></div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=C3=8En dum., 4 iu=
l. 2021 la 12:23, Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth=
@redhat.com</a>&gt; a scris:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><br>
Meta comment: Please avoid<br>
=C6=83u=C4=B1=CA=87sod u=CA=8Dop =C7=9Dp=C4=B1sdn<br>
... it makes threads much harder to read.<br>
<br>
On 04/07/2021 16.20, Richard Zak wrote:<br>
&gt; Exactly. One of the developers on the Haiku forum shared with me the p=
atch <br>
&gt; that Haiku uses for qemu, and it has a few lines concerning error code=
s. <br>
&gt; I&#39;ll look into this.<br>
&gt; <a href=3D"https://github.com/haikuports/haikuports/blob/14c2cab542814=
5b93232cb69683a67bbe68a9f06/app-emulation/qemu/patches/qemu-3.1.1.1.patchse=
t" rel=3D"noreferrer" target=3D"_blank">https://github.com/haikuports/haiku=
ports/blob/14c2cab5428145b93232cb69683a67bbe68a9f06/app-emulation/qemu/patc=
hes/qemu-3.1.1.1.patchset</a> <br>
<br>
So something like the change in target/xtensa/xtensa-semi.c is the right wa=
y <br>
to go - using a switch-case statement looks like the right fix instead of <=
br>
disabling the targets in the configure script.<br>
<br>
&gt; This is a stopper for the configure script changes?<br>
<br>
Well, if anyhow possible, we should avoid hacks like disabling a target in =
<br>
the configure script. Since this problem seems to be understood, you should=
 <br>
aim for the right fix instead.<br>
<br>
=C2=A0 Thomas<br>
<br>
&gt; =C3=8En dum., 4 iul. 2021 la 05:30, Philippe Mathieu-Daud=C3=A9 &lt;<a=
 href=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4bug@amsat.org</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4bug@=
amsat.org</a>&gt;&gt; a scris:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 7/4/21 11:27 AM, Philippe Mathieu-Daud=C3=A9 wro=
te:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On 7/4/21 11:03 AM, Philippe Mathieu-Daud=C3=
=A9 wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; On 7/4/21 12:06 AM, Richard Zak wrote:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; For MIPS (all sub-targets, 64-bit and=
 EL) &amp; xtensa(eb), the compiler<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; complains about running out of memory=
. Best I can see, that&#39;s not what<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; actually happens, but that&#39;s the =
error message. I was going to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; investigate this later, but this was =
the error which was causing the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; test with the Haiku VM with that corr=
esponding make target. My<br>
&gt;=C2=A0 =C2=A0 =C2=A0desktop &amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; laptop have 64 GB, and I&#39;m pretty=
 sure it didn&#39;t get to that point.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/boot/system/develop/tools/bin/../lib/gcc/x86_64-un=
known-haiku/8.3.0/../../../../x86_64-unknown-haiku/bin/ld:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; final link failed: memory exhausted<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; See how Haiku handles POSIX errno:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/haiku/haiku/blob/mast=
er/headers/os/support/Errors.h" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/haiku/haiku/blob/master/headers/os/support/Errors.h</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/haiku/haiku/blob/=
master/headers/os/support/Errors.h" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/haiku/haiku/blob/master/headers/os/support/Errors.h</a>&gt=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; #define B_GENERAL_ERROR_BASE=C2=A0 =C2=A0=
INT_MIN<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; #define B_POSIX_ERROR_BASE=C2=A0 =C2=A0 =
=C2=A0(B_GENERAL_ERROR_BASE + 0x7000)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; #define B_POSIX_ENOMEM=C2=A0 B_TO_POSIX_E=
RROR(B_POSIX_ERROR_BASE + 0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; #define E2BIG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 1)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; #define ECHILD=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 2)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; ...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Same problem with Xtensa:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; static uint32_t errno_h2g(int host_errno)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0static const uint32_t gues=
t_errno[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[EPERM]=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D TARGET_EPERM,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ENOENT]=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D TARGET_ENOENT,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ESRCH]=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D TARGET_ESRCH,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[EINTR]=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D TARGET_EINTR,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[EIO]=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D TARGET_EIO,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ENXIO]=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D TARGET_ENXIO,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[E2BIG]=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D TARGET_E2BIG,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ENOEXEC]=C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D TARGET_ENOEXEC,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ...<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Annoyingly enough this is also how linux-user/sysca=
ll.c does<br>
&gt;=C2=A0 =C2=A0 =C2=A0(thinking about code re-use):<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* This list is the union of errno values ove=
rridden in asm-&lt;arch&gt;/errno.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* minus the errnos that are not actually gen=
eric to all archs.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0static uint16_t host_to_target_errno_table[ERRNO_TA=
BLE_SIZE] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [EAGAIN]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =3D TARGET_EAGAIN,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [EIDRM]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D TARGET_EIDRM,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ECHRNG]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =3D TARGET_ECHRNG,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [EL2NSYNC]=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D TARGET_EL2NSYNC,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [EL3HLT]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =3D TARGET_EL3HLT,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [EL3RST]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =3D TARGET_EL3RST,<br>
&gt;=C2=A0 =C2=A0 =C2=A0...<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Regards,<br>
&gt; <br>
&gt; Richard J. Zak<br>
&gt; Professional Genius<br>
&gt; PGP Key: <a href=3D"https://keybase.io/rjzak/key.asc" rel=3D"noreferre=
r" target=3D"_blank">https://keybase.io/rjzak/key.asc</a> &lt;<a href=3D"ht=
tps://keybase.io/rjzak/key.asc" rel=3D"noreferrer" target=3D"_blank">https:=
//keybase.io/rjzak/key.asc</a>&gt;<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr=
"><div>Regards,<br><br>Richard J. Zak<br>Professional Genius</div><div>PGP =
Key:=C2=A0<a href=3D"https://keybase.io/rjzak/key.asc" target=3D"_blank">ht=
tps://keybase.io/rjzak/key.asc</a></div></div></div></div></div></div></div=
>

--000000000000195def05c64ed7e3--

