Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 532B42E80C5
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 16:07:01 +0100 (CET)
Received: from localhost ([::1]:49158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuzXX-0003et-SQ
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 10:06:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kuzWM-000336-9y
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 10:05:46 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:38617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kuzWK-0001GF-Bo
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 10:05:45 -0500
Received: by mail-lf1-x135.google.com with SMTP id h205so44517721lfd.5
 for <qemu-devel@nongnu.org>; Thu, 31 Dec 2020 07:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=oxrzgWIUQi2/PmrUSHy9MxX9kn5ql6wK621m7TFNr70=;
 b=YdB87dhPzb4gKwmr/V/+46eanUIXUd2UXe7aBpMrOiD2qxL+boVLTp2hhB9LRfkPx1
 91osBQT01MmMIOKWsEZEyn2PcZ/qoXY/w/T29YLwLy0A7Bdz1Um3mKRnuSSHD9TSTlsE
 o//Aav++5z+mIsC7UtvTOd02OrXogBLOKtaJ+cYToJPvLBtT4+/YbqcKmIoO0p02oI90
 VypPvWvvkN8QxH8S+U7KgtHkhn01zb7AX9k173du5UWZSx+NU35UCTIebkyGvlqEEs5m
 kEw6juMzCusBQzqgC/v326bkcQ4q4bMdzwaL9ACxMvq6B/MbZQxowFcfBFfLdhi7YBFZ
 VIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=oxrzgWIUQi2/PmrUSHy9MxX9kn5ql6wK621m7TFNr70=;
 b=XLPA8+amC55e8ywdWqWyPf8FET9c5pX2UkiKRRYqjKMGHsijaW7h9Dah9fJxW+uZs9
 t1edF56y/FyRHdDyHDz+NFkk/d9fBIb0z1fHrjc7PtbP7h070dkW4P6wsi0nvYm+kUvp
 fw2jyxQYxbB3pe1DxHKK1Tzw6Zngci5W2f8u/12/FeRu+lLbn/nu29zdrP7pOw3sknix
 n7c9q6GKvzyncCituuQbVdt/DdSI7tVoAEpQjn4gFv8TCB0HyOHF7epzitGebSutccCN
 1nkjhIpUJ0CmZ1eoWnIG6jwNvxKfUtk99Q02znPnmB2iOFARvw4CMxUpWKgOal/YUXFs
 19zQ==
X-Gm-Message-State: AOAM533Y9NCXN+4oU7lJs/29ZN3AybOdTq6aYBS6lCAI7IceBZexa82u
 Hc8tmTmT5Ouzyr/nHHobeC5mdFG+VJPppHvnlz4=
X-Google-Smtp-Source: ABdhPJzfrD6i0ty81rpPPQ0Bb9CLAUJA90DcoSs0do8w9PfW/DFTv4nRia0uUawOsHP5xogjzVZzUa3EztL+6y0GkiU=
X-Received: by 2002:a05:6512:6d0:: with SMTP id
 u16mr26078641lff.497.1609427141991; 
 Thu, 31 Dec 2020 07:05:41 -0800 (PST)
MIME-Version: 1.0
References: <20201230221727.60579-1-chris@hofstaedtler.name>
In-Reply-To: <20201230221727.60579-1-chris@hofstaedtler.name>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Thu, 31 Dec 2020 07:05:20 -0800
Message-ID: <CAE2XoE8KfX3h8RRvcNS-Y-QhJqEJ+cyZB=uLPR5O7X4bhLSHHw@mail.gmail.com>
Subject: Re: [PATCH v2] meson: fix ncurses detection on macOS
To: Chris Hofstaedtler <chris@hofstaedtler.name>
Content-Type: multipart/alternative; boundary="00000000000017237d05b7c3f5d3"
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=luoyonggang@gmail.com; helo=mail-lf1-x135.google.com
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
Reply-To: luoyonggang@gmail.com
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Samuel Thibault <samuel.thibault@gnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000017237d05b7c3f5d3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 30, 2020 at 2:17 PM Chris Hofstaedtler <chris@hofstaedtler.name=
>
wrote:
>
> Without this, meson fails with "curses package not usable" when using
ncurses
> 6.2. Apparently the wide functions (addwstr, etc) are hidden behind the
extra
> define, and meson does not define it at that detection stage.
>
> Regression from b01a4fd3bd7d6f2 ("configure: Define NCURSES_WIDECHAR if
we're
> using curses"). The meson conversion has seen many iterations of the
curses
> check, so pinpointing the exact commit breaking this is not so easy.
>
> Signed-off-by: Chris Hofstaedtler <chris@hofstaedtler.name>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Cc: Samuel Thibault <samuel.thibault@gnu.org>
> Cc: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  meson.build | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index 372576f82c..fd74728674 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -500,16 +500,16 @@ if have_system and not
get_option('curses').disabled()
>      endif
>    endforeach
>    msg =3D get_option('curses').enabled() ? 'curses library not found' : =
''
> +  curses_compile_args =3D ['-DNCURSES_WIDECHAR']
>    if curses.found()
> -    if cc.links(curses_test, dependencies: [curses])
> -      curses =3D declare_dependency(compile_args: '-DNCURSES_WIDECHAR',
dependencies: [curses])
> +    if cc.links(curses_test, args: curses_compile_args, dependencies:
[curses])
> +      curses =3D declare_dependency(compile_args: curses_compile_args,
dependencies: [curses])
>      else
>        msg =3D 'curses package not usable'
>        curses =3D not_found
>      endif
>    endif
>    if not curses.found()
> -    curses_compile_args =3D ['-DNCURSES_WIDECHAR']
>      has_curses_h =3D cc.has_header('curses.h', args: curses_compile_args=
)
>      if targetos !=3D 'windows' and not has_curses_h
>        message('Trying with /usr/include/ncursesw')
> --
> 2.29.2
>

Reviewed-by: Yonggang Luo <luoyonggang@gmail.com>

--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--00000000000017237d05b7c3f5d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Wed, Dec 30, 2020 at 2:17 PM Chris Hofstaedtler=
 &lt;<a href=3D"mailto:chris@hofstaedtler.name">chris@hofstaedtler.name</a>=
&gt; wrote:<br>&gt;<br>&gt; Without this, meson fails with &quot;curses pac=
kage not usable&quot; when using ncurses<br>&gt; 6.2. Apparently the wide f=
unctions (addwstr, etc) are hidden behind the extra<br>&gt; define, and mes=
on does not define it at that detection stage.<br>&gt;<br>&gt; Regression f=
rom b01a4fd3bd7d6f2 (&quot;configure: Define NCURSES_WIDECHAR if we&#39;re<=
br>&gt; using curses&quot;). The meson conversion has seen many iterations =
of the curses<br>&gt; check, so pinpointing the exact commit breaking this =
is not so easy.<br>&gt;<br>&gt; Signed-off-by: Chris Hofstaedtler &lt;<a hr=
ef=3D"mailto:chris@hofstaedtler.name">chris@hofstaedtler.name</a>&gt;<br>&g=
t; Cc: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.=
maydell@linaro.org</a>&gt;<br>&gt; Cc: Philippe Mathieu-Daud=C3=A9 &lt;<a h=
ref=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt;<br>&gt; Cc: Samu=
el Thibault &lt;<a href=3D"mailto:samuel.thibault@gnu.org">samuel.thibault@=
gnu.org</a>&gt;<br>&gt; Cc: Yonggang Luo &lt;<a href=3D"mailto:luoyonggang@=
gmail.com">luoyonggang@gmail.com</a>&gt;<br>&gt; ---<br>&gt; =C2=A0meson.bu=
ild | 6 +++---<br>&gt; =C2=A01 file changed, 3 insertions(+), 3 deletions(-=
)<br>&gt;<br>&gt; diff --git a/meson.build b/meson.build<br>&gt; index 3725=
76f82c..fd74728674 100644<br>&gt; --- a/meson.build<br>&gt; +++ b/meson.bui=
ld<br>&gt; @@ -500,16 +500,16 @@ if have_system and not get_option(&#39;cur=
ses&#39;).disabled()<br>&gt; =C2=A0 =C2=A0 =C2=A0endif<br>&gt; =C2=A0 =C2=
=A0endforeach<br>&gt; =C2=A0 =C2=A0msg =3D get_option(&#39;curses&#39;).ena=
bled() ? &#39;curses library not found&#39; : &#39;&#39;<br>&gt; + =C2=A0cu=
rses_compile_args =3D [&#39;-DNCURSES_WIDECHAR&#39;]<br>&gt; =C2=A0 =C2=A0i=
f curses.found()<br>&gt; - =C2=A0 =C2=A0if cc.links(curses_test, dependenci=
es: [curses])<br>&gt; - =C2=A0 =C2=A0 =C2=A0curses =3D declare_dependency(c=
ompile_args: &#39;-DNCURSES_WIDECHAR&#39;, dependencies: [curses])<br>&gt; =
+ =C2=A0 =C2=A0if cc.links(curses_test, args: curses_compile_args, dependen=
cies: [curses])<br>&gt; + =C2=A0 =C2=A0 =C2=A0curses =3D declare_dependency=
(compile_args: curses_compile_args, dependencies: [curses])<br>&gt; =C2=A0 =
=C2=A0 =C2=A0else<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0msg =3D &#39;curses pa=
ckage not usable&#39;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0curses =3D not_fou=
nd<br>&gt; =C2=A0 =C2=A0 =C2=A0endif<br>&gt; =C2=A0 =C2=A0endif<br>&gt; =C2=
=A0 =C2=A0if not curses.found()<br>&gt; - =C2=A0 =C2=A0curses_compile_args =
=3D [&#39;-DNCURSES_WIDECHAR&#39;]<br>&gt; =C2=A0 =C2=A0 =C2=A0has_curses_h=
 =3D cc.has_header(&#39;curses.h&#39;, args: curses_compile_args)<br>&gt; =
=C2=A0 =C2=A0 =C2=A0if targetos !=3D &#39;windows&#39; and not has_curses_h=
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0message(&#39;Trying with /usr/include/n=
cursesw&#39;)<br>&gt; --<br>&gt; 2.29.2<br>&gt;<div><br>Reviewed-by: Yongga=
ng Luo &lt;<a href=3D"mailto:luoyonggang@gmail.com">luoyonggang@gmail.com</=
a>&gt;</div><div><br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=
=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=A0 =C2=
=A0 sincerely,<br>Yonggang Luo</div></div>

--00000000000017237d05b7c3f5d3--

