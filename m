Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0AC54761F
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 17:31:00 +0200 (CEST)
Received: from localhost ([::1]:43096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o034l-00028n-Dr
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 11:30:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o031N-0001DH-GH; Sat, 11 Jun 2022 11:27:32 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:37414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o031L-0001pB-5D; Sat, 11 Jun 2022 11:27:28 -0400
Received: by mail-qk1-x734.google.com with SMTP id k6so1233418qkf.4;
 Sat, 11 Jun 2022 08:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hf2EYm2WDRjPCgWt5Oe2jgSV5/eWvgjIEAiwrA92OWo=;
 b=XJGd0qcXZoGujhhv882UWk/mQcAIJnmBTMSP1mkH0mVKGerKavE4A8HjHHV00JQ2B+
 UVnLCZMS87hTMwhLZQbENURuBFkEI2ygYO54SygqManpD7dJ7iPvV3sI4RPg3hwUn92I
 6kDtbY4vacTwXvI5AwI6YhLE0cZ0mILiG4E/q6VGOupeF518nRj7eSlyDEy6iPTt229y
 p/RxPKQpQP2/K7EoSU0Jn5dyTQatxjDzMOJhm9sfiiySCc31wFWHXNUdj+NU5aNLASmK
 Bn4BVYnNI0HGbp+YCxSSp6YM0ipo695+Q1j7noG8Hv8p/EU0tgxjjlrLk6k406MuR4tT
 +5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hf2EYm2WDRjPCgWt5Oe2jgSV5/eWvgjIEAiwrA92OWo=;
 b=2St8lJgEpjhW4Eyj3A9u41BT/uDhK3SfO1k79DBFonIDCQlSsmronjEFoMdDPfCrgZ
 9GgEXr4qPc9cgNBbjIslF078lx6tejuSOequw60mVUUyvuPdH3JiF2XhoVvY64L38sue
 sjIxyRT3iC0QVtOQ/rNNWP4oHquzdoGPsqdmrJr3F2/EdTg186TPyNAE6GGb/FOtFSYp
 JPHj7543JCpkGjzcEzGu8zWcGm2PngQ7Eu/ik15SxquNAO6YJgttlI/d6SSwdXZCJE9I
 +XSbmLU8xdH3iZXufaHtNONEnAegYHdNynPZsOxb890/Gtq15Gl6flJLZANZPK/bMO1y
 cdPA==
X-Gm-Message-State: AOAM532wVcj5ch9EJxdzNZjkg5FwQ/FkOpNQJZe1R/VuMRoY5OmPXR1L
 +9nFAnFrqmDUFJBs9VcRYeLJLikNhnMdzbwoFfFAJ6/E5WQ=
X-Google-Smtp-Source: ABdhPJw/BfRlX2XUBabilGmEmMIn/VcTZu2M0Tpj0jBjGLbNxZI2jzDHnQk+IdVoMUCSCUFTdV+h8c5dkftOSvuGYs8=
X-Received: by 2002:a37:a482:0:b0:6a6:7cbf:74b2 with SMTP id
 n124-20020a37a482000000b006a67cbf74b2mr33467630qke.137.1654961244078; Sat, 11
 Jun 2022 08:27:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220605151908.30566-1-shentey@gmail.com>
 <124a4722-01f9-225f-05d3-35bd51713bfe@amsat.org>
In-Reply-To: <124a4722-01f9-225f-05d3-35bd51713bfe@amsat.org>
From: Bernhard Beschow <shentey@gmail.com>
Date: Sat, 11 Jun 2022 17:27:13 +0200
Message-ID: <CAG4p6K74wB1hnT=O2Z8Fyi0yk1W320AjCmYLEWDdcyZvX76oFg@mail.gmail.com>
Subject: Re: [PATCH] hw/mips/boston: Initialize g_autofree pointers
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paul Burton <paulburton@kernel.org>
Content-Type: multipart/alternative; boundary="0000000000001204f905e12db1ee"
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=shentey@gmail.com; helo=mail-qk1-x734.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001204f905e12db1ee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 10, 2022 at 4:04 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> On 5/6/22 17:19, Bernhard Beschow wrote:
> > Fixes compilation due to false positives with -Werror:
> >
> >    In file included from /usr/include/glib-2.0/glib.h:114,
> >                     from qemu/src/include/glib-compat.h:32,
> >                     from qemu/src/include/qemu/osdep.h:144,
> >                     from ../src/hw/mips/boston.c:20:
> >    In function =E2=80=98g_autoptr_cleanup_generic_gfree=E2=80=99,
> >        inlined from =E2=80=98boston_mach_init=E2=80=99 at ../src/hw/mip=
s/boston.c:790:52:
> >    /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error:
> =E2=80=98dtb_load_data=E2=80=99 may be used uninitialized [-Werror=3Dmayb=
e-uninitialized]
> >       28 |   g_free (*pp);
> >          |   ^~~~~~~~~~~~
> >    ../src/hw/mips/boston.c: In function =E2=80=98boston_mach_init=E2=80=
=99:
> >    ../src/hw/mips/boston.c:790:52: note: =E2=80=98dtb_load_data=E2=80=
=99 was declared
> here
> >      790 |             g_autofree const void *dtb_file_data,
> *dtb_load_data;
> >          |
> ^~~~~~~~~~~~~
> >    In function =E2=80=98g_autoptr_cleanup_generic_gfree=E2=80=99,
> >      inlined from =E2=80=98boston_mach_init=E2=80=99 at ../src/hw/mips/=
boston.c:790:36:
> >    /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error:
> =E2=80=98dtb_file_data=E2=80=99 may be used uninitialized [-Werror=3Dmayb=
e-uninitialized]
> >       28 |   g_free (*pp);
> >          |   ^~~~~~~~~~~~
> >    ../src/hw/mips/boston.c: In function =E2=80=98boston_mach_init=E2=80=
=99:
> >    ../src/hw/mips/boston.c:790:36: note: =E2=80=98dtb_file_data=E2=80=
=99 was declared
> here
> >      790 |             g_autofree const void *dtb_file_data,
> *dtb_load_data;
> >          |                                    ^~~~~~~~~~~~~
> >    cc1: all warnings being treated as errors
> >
> > Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> > ---
> >   hw/mips/boston.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
>
> Queued via mips-next.
>

Hi Phil,

shouldn't this patch be visible in your pull request then?
https://patchew.org/QEMU/20220611103312.67773-1-philippe.mathieu.daude@gmai=
l.com/

Best regards,
Bernhard

--0000000000001204f905e12db1ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Jun 10, 2022 at 4:04 PM Philippe =
Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</=
a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On 5/6/22 17:19, Bernhard Beschow wrote:<br>
&gt; Fixes compilation due to false positives with -Werror:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 In file included from /usr/include/glib-2.0/glib.h:114,<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0from qemu/src/include/glib-compat.h:32,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0from qemu/src/include/qemu/osdep.h:144,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0from ../src/hw/mips/boston.c:20:<br>
&gt;=C2=A0 =C2=A0 In function =E2=80=98g_autoptr_cleanup_generic_gfree=E2=
=80=99,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 inlined from =E2=80=98boston_mach_init=E2=
=80=99 at ../src/hw/mips/boston.c:790:52:<br>
&gt;=C2=A0 =C2=A0 /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: erro=
r: =E2=80=98dtb_load_data=E2=80=99 may be used uninitialized [-Werror=3Dmay=
be-uninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A028 |=C2=A0 =C2=A0g_free (*pp);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0^~~~~~~~~~~~<br>
&gt;=C2=A0 =C2=A0 ../src/hw/mips/boston.c: In function =E2=80=98boston_mach=
_init=E2=80=99:<br>
&gt;=C2=A0 =C2=A0 ../src/hw/mips/boston.c:790:52: note: =E2=80=98dtb_load_d=
ata=E2=80=99 was declared here<br>
&gt;=C2=A0 =C2=A0 =C2=A0 790 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0g_autofree const void *dtb_file_data, *dtb_load_data;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^=
~~~~~~~~~~~~<br>
&gt;=C2=A0 =C2=A0 In function =E2=80=98g_autoptr_cleanup_generic_gfree=E2=
=80=99,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 inlined from =E2=80=98boston_mach_init=E2=80=99 at=
 ../src/hw/mips/boston.c:790:36:<br>
&gt;=C2=A0 =C2=A0 /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: erro=
r: =E2=80=98dtb_file_data=E2=80=99 may be used uninitialized [-Werror=3Dmay=
be-uninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A028 |=C2=A0 =C2=A0g_free (*pp);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0^~~~~~~~~~~~<br>
&gt;=C2=A0 =C2=A0 ../src/hw/mips/boston.c: In function =E2=80=98boston_mach=
_init=E2=80=99:<br>
&gt;=C2=A0 =C2=A0 ../src/hw/mips/boston.c:790:36: note: =E2=80=98dtb_file_d=
ata=E2=80=99 was declared here<br>
&gt;=C2=A0 =C2=A0 =C2=A0 790 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0g_autofree const void *dtb_file_data, *dtb_load_data;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~<br>
&gt;=C2=A0 =C2=A0 cc1: all warnings being treated as errors<br>
&gt; <br>
&gt; Signed-off-by: Bernhard Beschow &lt;<a href=3D"mailto:shentey@gmail.co=
m" target=3D"_blank">shentey@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/mips/boston.c | 3 ++-<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
Queued via mips-next.<br></blockquote><div><br></div><div>Hi Phil,</div><di=
v><br></div><div>shouldn&#39;t this patch be visible in your pull request t=
hen? <a href=3D"https://patchew.org/QEMU/20220611103312.67773-1-philippe.ma=
thieu.daude@gmail.com/">https://patchew.org/QEMU/20220611103312.67773-1-phi=
lippe.mathieu.daude@gmail.com/</a></div><div><br></div><div>Best regards,</=
div><div>Bernhard<br></div></div></div>

--0000000000001204f905e12db1ee--

