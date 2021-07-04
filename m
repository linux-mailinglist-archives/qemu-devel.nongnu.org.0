Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4703BAD5E
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 16:21:56 +0200 (CEST)
Received: from localhost ([::1]:57934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m030M-0007u1-LJ
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 10:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1m02zM-0007D3-AN
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 10:20:52 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d]:40841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1m02zH-0000q2-07
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 10:20:52 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id u11so3933134vsl.7
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 07:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SSbCzGORR/MDkPJ/XUhKSXkY0kRbYjH2SMGhqtVcvQ8=;
 b=jcycnyJMu2jQVH/56SUPhjoTwAjPbxmLnGzfO8QslNyVsIpzNyk9kTMnwbljC0amo5
 QEbNfAt1A/tbFcTl/lb/bylFnrZzbXM5vdI41c6kM30yhUoMoc+HIf2fbr6Q3wCEOson
 tB55zwNTUfeUmz4vBljSinVp6lHJrOvjQBGLW/t+BfWlLPhQbcjeCtW4X4CYKUm/TezJ
 p9gkAQCxJz99TckKoBu5me+BHGUYDXbf9nFGDjIsMIZ3k7p23GM0pd6yunuuFfIvRRj+
 YLKDCAJkbEG0BOsT6pzLeo0o5C42dpzWQENsJb7wmIaErEYru6NMDM4V3D65FHUx1WAG
 mgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SSbCzGORR/MDkPJ/XUhKSXkY0kRbYjH2SMGhqtVcvQ8=;
 b=Dq4MaOKl8/sJJakyTW4A9m6MoqwLo7AOeyF7dyLW/SjmWZUWZ+Wx58b2CVpsKmDcy1
 acTyvRlzwS/KUGS2GvrsN7HjelgdROgilrHzUgqH7e0iVUGCwZ6xCs0KNGoSneZlFtru
 Tpk9eJEwWcEk1AYKmjgDLd8NtLRtXx0wPFiWRkFc/kHRaX/7LnVq4dyHNLUVlXvEQjeY
 eVJPOABC01aNMknpNz0Lm7xfJk2CT3cZh+BAefHuQBCoP9tLismfVdkPZL/e0VvDG8Te
 4XrQO0X4fwn5BjsMybCJdpz6jCvKlxkITBsj8A9O/PY2zdvb5a4XrfbowPmdusyIt/Dd
 VZNQ==
X-Gm-Message-State: AOAM533NLLy9lg9cc4JIOfotA+rm2HhmrGKHtDg3y9OVkkZ31woH2sPv
 vvUfKIfGwbwbiYJY5gTKXFw0xkxIOegb+z61GnUqVn+A0XE=
X-Google-Smtp-Source: ABdhPJzpAsbStIqDsBhgD17eEOsUyEZ8NWsTzNKiXR/mLZAKU2kktAhyYhwfHQmQKwYLpPvpV+sXBIXNUfkjqjJiwzY=
X-Received: by 2002:a67:7142:: with SMTP id m63mr4351553vsc.59.1625408445815; 
 Sun, 04 Jul 2021 07:20:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAOakUfOhn43BUUGoJPahxmxxTk8vcPeyrgsX0GDmzt46ZriNeA@mail.gmail.com>
 <CAFEAcA-rhL_BEJMi7a2tCoVE61OV2o5QeDdDfz1JXL9fLvM_cQ@mail.gmail.com>
 <CAOakUfNpv_7TE+86R0+Ng=10mXtx2=pyZUZG8jPDgOdLbqrqKQ@mail.gmail.com>
 <5c47cf07-f02e-f7d8-2725-5ae0a240e37b@amsat.org>
 <975f0d41-be4e-7e8c-2fc6-64eafc7c11a8@amsat.org>
 <951cdc26-1f4f-68d0-0187-e31513fa00c9@amsat.org>
In-Reply-To: <951cdc26-1f4f-68d0-0187-e31513fa00c9@amsat.org>
From: Richard Zak <richard.j.zak@gmail.com>
Date: Sun, 4 Jul 2021 10:20:34 -0400
Message-ID: <CAOakUfMmxSrBcQTQaRBB1g3qFCrpm-BLDVvfgoRm2Ww_-Pe3mQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] Fix for Haiku
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000007201605c64ce57c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=richard.j.zak@gmail.com; helo=mail-vs1-xe2d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000007201605c64ce57c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Exactly. One of the developers on the Haiku forum shared with me the patch
that Haiku uses for qemu, and it has a few lines concerning error codes.
I'll look into this.
https://github.com/haikuports/haikuports/blob/14c2cab5428145b93232cb69683a6=
7bbe68a9f06/app-emulation/qemu/patches/qemu-3.1.1.1.patchset

This is a stopper for the configure script changes? I was thinking that
smaller changes would be best to keep the review more manageable. I'm also
still new around here :)

=C3=8En dum., 4 iul. 2021 la 05:30, Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org> a
scris:

> On 7/4/21 11:27 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 7/4/21 11:03 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> >> On 7/4/21 12:06 AM, Richard Zak wrote:
> >>> For MIPS (all sub-targets, 64-bit and EL) & xtensa(eb), the compiler
> >>> complains about running out of memory. Best I can see, that's not wha=
t
> >>> actually happens, but that's the error message. I was going to
> >>> investigate this later, but this was the error which was causing the
> >>> test with the Haiku VM with that corresponding make target. My deskto=
p
> &
> >>> laptop have 64 GB, and I'm pretty sure it didn't get to that point.
> >>>
> >>>
> >
> /boot/system/develop/tools/bin/../lib/gcc/x86_64-unknown-haiku/8.3.0/../.=
./../../x86_64-unknown-haiku/bin/ld:
> >>> final link failed: memory exhausted
> >
> >> See how Haiku handles POSIX errno:
> >>
> >> https://github.com/haiku/haiku/blob/master/headers/os/support/Errors.h
> >>
> >> #define B_GENERAL_ERROR_BASE   INT_MIN
> >>
> >> #define B_POSIX_ERROR_BASE     (B_GENERAL_ERROR_BASE + 0x7000)
> >>
> >> #define B_POSIX_ENOMEM  B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 0)
> >> #define E2BIG           B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 1)
> >> #define ECHILD          B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 2)
> >> ...
> >>
> >
> > Same problem with Xtensa:
> >
> > static uint32_t errno_h2g(int host_errno)
> > {
> >     static const uint32_t guest_errno[] =3D {
> >         [EPERM]         =3D TARGET_EPERM,
> >         [ENOENT]        =3D TARGET_ENOENT,
> >         [ESRCH]         =3D TARGET_ESRCH,
> >         [EINTR]         =3D TARGET_EINTR,
> >         [EIO]           =3D TARGET_EIO,
> >         [ENXIO]         =3D TARGET_ENXIO,
> >         [E2BIG]         =3D TARGET_E2BIG,
> >         [ENOEXEC]       =3D TARGET_ENOEXEC,
> > ...
>
> Annoyingly enough this is also how linux-user/syscall.c does
> (thinking about code re-use):
>
> /*
>  * This list is the union of errno values overridden in asm-<arch>/errno.=
h
>  * minus the errnos that are not actually generic to all archs.
>  */
> static uint16_t host_to_target_errno_table[ERRNO_TABLE_SIZE] =3D {
>     [EAGAIN]            =3D TARGET_EAGAIN,
>     [EIDRM]             =3D TARGET_EIDRM,
>     [ECHRNG]            =3D TARGET_ECHRNG,
>     [EL2NSYNC]          =3D TARGET_EL2NSYNC,
>     [EL3HLT]            =3D TARGET_EL3HLT,
>     [EL3RST]            =3D TARGET_EL3RST,
> ...
>


--=20
Regards,

Richard J. Zak
Professional Genius
PGP Key: https://keybase.io/rjzak/key.asc

--00000000000007201605c64ce57c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Exactly. One of the developers on the Haiku forum sha=
red with me the patch that Haiku uses for qemu, and it has a few lines conc=
erning error codes. I&#39;ll look into this.</div><div><a href=3D"https://g=
ithub.com/haikuports/haikuports/blob/14c2cab5428145b93232cb69683a67bbe68a9f=
06/app-emulation/qemu/patches/qemu-3.1.1.1.patchset">https://github.com/hai=
kuports/haikuports/blob/14c2cab5428145b93232cb69683a67bbe68a9f06/app-emulat=
ion/qemu/patches/qemu-3.1.1.1.patchset</a></div><div><br></div><div>This is=
 a stopper for the configure script changes? I was thinking that smaller ch=
anges would be best to keep the review more manageable. I&#39;m also still =
new around here :)<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">=C3=8En dum., 4 iul. 2021 la 05:30, Philippe =
Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</=
a>&gt; a scris:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On 7/4/21 11:27 AM, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt; On 7/4/21 11:03 AM, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt;&gt; On 7/4/21 12:06 AM, Richard Zak wrote:<br>
&gt;&gt;&gt; For MIPS (all sub-targets, 64-bit and EL) &amp; xtensa(eb), th=
e compiler<br>
&gt;&gt;&gt; complains about running out of memory. Best I can see, that&#3=
9;s not what<br>
&gt;&gt;&gt; actually happens, but that&#39;s the error message. I was goin=
g to<br>
&gt;&gt;&gt; investigate this later, but this was the error which was causi=
ng the<br>
&gt;&gt;&gt; test with the Haiku VM with that corresponding make target. My=
 desktop &amp;<br>
&gt;&gt;&gt; laptop have 64 GB, and I&#39;m pretty sure it didn&#39;t get t=
o that point.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt; /boot/system/develop/tools/bin/../lib/gcc/x86_64-unknown-haiku/8.3.0/.=
./../../../x86_64-unknown-haiku/bin/ld:<br>
&gt;&gt;&gt; final link failed: memory exhausted<br>
&gt; <br>
&gt;&gt; See how Haiku handles POSIX errno:<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://github.com/haiku/haiku/blob/master/headers/os/s=
upport/Errors.h" rel=3D"noreferrer" target=3D"_blank">https://github.com/ha=
iku/haiku/blob/master/headers/os/support/Errors.h</a><br>
&gt;&gt;<br>
&gt;&gt; #define B_GENERAL_ERROR_BASE=C2=A0 =C2=A0INT_MIN<br>
&gt;&gt;<br>
&gt;&gt; #define B_POSIX_ERROR_BASE=C2=A0 =C2=A0 =C2=A0(B_GENERAL_ERROR_BAS=
E + 0x7000)<br>
&gt;&gt;<br>
&gt;&gt; #define B_POSIX_ENOMEM=C2=A0 B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE +=
 0)<br>
&gt;&gt; #define E2BIG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0B_TO_POSIX_E=
RROR(B_POSIX_ERROR_BASE + 1)<br>
&gt;&gt; #define ECHILD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 B_TO_POSIX_ERROR(=
B_POSIX_ERROR_BASE + 2)<br>
&gt;&gt; ...<br>
&gt;&gt;<br>
&gt; <br>
&gt; Same problem with Xtensa:<br>
&gt; <br>
&gt; static uint32_t errno_h2g(int host_errno)<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0static const uint32_t guest_errno[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[EPERM]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D TARGET_EPERM,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ENOENT]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D TARGET_ENOENT,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ESRCH]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D TARGET_ESRCH,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[EINTR]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D TARGET_EINTR,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[EIO]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D TARGET_EIO,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ENXIO]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D TARGET_ENXIO,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[E2BIG]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D TARGET_E2BIG,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ENOEXEC]=C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D TARGET_ENOEXEC,<br>
&gt; ...<br>
<br>
Annoyingly enough this is also how linux-user/syscall.c does<br>
(thinking about code re-use):<br>
<br>
/*<br>
=C2=A0* This list is the union of errno values overridden in asm-&lt;arch&g=
t;/errno.h<br>
=C2=A0* minus the errnos that are not actually generic to all archs.<br>
=C2=A0*/<br>
static uint16_t host_to_target_errno_table[ERRNO_TABLE_SIZE] =3D {<br>
=C2=A0 =C2=A0 [EAGAIN]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TARGET_=
EAGAIN,<br>
=C2=A0 =C2=A0 [EIDRM]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D TA=
RGET_EIDRM,<br>
=C2=A0 =C2=A0 [ECHRNG]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TARGET_=
ECHRNG,<br>
=C2=A0 =C2=A0 [EL2NSYNC]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TARGET_EL2NS=
YNC,<br>
=C2=A0 =C2=A0 [EL3HLT]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TARGET_=
EL3HLT,<br>
=C2=A0 =C2=A0 [EL3RST]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TARGET_=
EL3RST,<br>
...<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr=
"><div>Regards,<br><br>Richard J. Zak<br>Professional Genius</div><div>PGP =
Key:=C2=A0<a href=3D"https://keybase.io/rjzak/key.asc" target=3D"_blank">ht=
tps://keybase.io/rjzak/key.asc</a></div></div></div></div></div></div></div=
>

--00000000000007201605c64ce57c--

