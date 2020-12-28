Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 004F82E6A85
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 20:53:09 +0100 (CET)
Received: from localhost ([::1]:38318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktyZo-0007gZ-Id
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 14:53:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1ktyXE-0006oS-S8
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 14:50:28 -0500
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:33439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1ktyXA-0004SY-H5
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 14:50:28 -0500
Received: by mail-lf1-x134.google.com with SMTP id l11so26304076lfg.0
 for <qemu-devel@nongnu.org>; Mon, 28 Dec 2020 11:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=P+6jjjUfsGCGegC4C3iIIqPqN8tFocUjGGBgNUSuJlk=;
 b=VJHUXh1e6tpPEbAmhyuZNAvYrrWJq3lWZ9ZdRTJspF0gVmhaDmA0hBmQwFLzhceDza
 h1OPvtEoPC4MMP9nFDra1A+/2Ecef9fDDn1aRyonNHMJBB9ES1gwKI/KFoSv15uJVzm8
 uLWERqziz2XB7bEuX9liuVJB7poWcCzhpJxuwjKNSIz0Azi27SY/2T0n2KC1EFa1aNrk
 pG6xINBekF/lJdrpgh9ncOJO1ubb3mbfSKfLKVKefTE6m47ZPucygCmSY6/eVBfgsVEl
 wtkk/swe2nYR0vMXCq1BuEL0+vRv4/cXTr8jHtUqjYH8/lAumi2gP73tbYcbMk0JSg3k
 1ujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=P+6jjjUfsGCGegC4C3iIIqPqN8tFocUjGGBgNUSuJlk=;
 b=q5ykxaTvb5b1N5leoxYMs/KjA9j8bkPSSoYA631mEt88jM0iQ58OAleUm1cFPn/Qna
 XY4DDQX3hhm8+EpaxyNMM5AuLYkQ/zAU1S0+MOH/k4YoII73gk6mnp5by+VEZ9K/SvZd
 toPjEbdbU2LDTdEwv9Ewd51kLfbQhQnLMu2wIULbNmEtQ3RshCjnHC2jiKlL/vh/Nzgz
 PdmeN6fl87w6ffM2pBvnBm1ePkF8VdcIlPDVRN6BZGRG+Pa0k6QJYYxY0lG6xcov0/PZ
 ZpsmBX/Bn2JB1TuCCQ2NooQPmsWGsWYcTTHAgASSWR4vvjA5u/wVlDuYSbKcHWzZZhpN
 VkDA==
X-Gm-Message-State: AOAM530RwsVcEp62g7vFEUzVrhFdmcvL0gIBx39Z9dK0tBvG+R3Foc0t
 Z4Z6V/HeuIXwnWy/94eAWfohhFMc46lnmOQN8/s=
X-Google-Smtp-Source: ABdhPJwHtv5Drp3gS3ybIcQ6R+DimwkZqFwrylVzfGLOLirWylxjWOU7OFyAJ2o4/KFMeY4Ycl6D8PBhOvGaACQgJhM=
X-Received: by 2002:a19:ad4b:: with SMTP id s11mr18762756lfd.427.1609185022214; 
 Mon, 28 Dec 2020 11:50:22 -0800 (PST)
MIME-Version: 1.0
References: <20201228151652.235542-1-chris@hofstaedtler.name>
In-Reply-To: <20201228151652.235542-1-chris@hofstaedtler.name>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Tue, 29 Dec 2020 03:50:11 +0800
Message-ID: <CAE2XoE9goBmOZ=W_huOt5aO07dSM9AFkVjCvtSft-+=6XjPz9Q@mail.gmail.com>
Subject: Re: [PATCH] meson: fix ncurses detection on macOS
To: Chris Hofstaedtler <chris@hofstaedtler.name>
Content-Type: multipart/alternative; boundary="000000000000a086a005b78b9546"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=luoyonggang@gmail.com; helo=mail-lf1-x134.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-level <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a086a005b78b9546
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 28, 2020 at 11:51 PM Chris Hofstaedtler <chris@hofstaedtler.nam=
e>
wrote:
>
> Without this, meson fails with "curses package not usable"
> when using ncurses 6.2. Apparently the wide functions
> (addwstr, etc) are hidden behind the extra define, and
> meson does not define it at that detection stage.
>
> Signed-off-by: Chris Hofstaedtler <chris@hofstaedtler.name>
> ---
>  meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meson.build b/meson.build
> index 9c152a85bd..7b9d92c14a 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -510,7 +510,7 @@ if have_system and not get_option('curses').disabled(=
)
>    endforeach
>    msg =3D get_option('curses').enabled() ? 'curses library not found' : =
''
>    if curses.found()
> -    if cc.links(curses_test, dependencies: [curses])
> +    if cc.links(curses_test, args: '-DNCURSES_WIDECHAR', dependencies:
[curses])
>        curses =3D declare_dependency(compile_args: '-DNCURSES_WIDECHAR',
dependencies: [curses])
>      else
>        msg =3D 'curses package not usable'
> --
> 2.29.2
>
>
Better to share  curses_compile_args

--- a/meson.build
+++ b/meson.build
@@ -504,16 +504,16 @@ if have_system and not get_option('curses').disabled(=
)
     endif
   endforeach
   msg =3D get_option('curses').enabled() ? 'curses library not found' : ''
+  curses_compile_args =3D ['-DNCURSES_WIDECHAR']
   if curses.found()
-    if cc.links(curses_test, dependencies: [curses])
-      curses =3D declare_dependency(compile_args: '-DNCURSES_WIDECHAR',
dependencies: [curses])
+    if cc.links(curses_test, args: curses_compile_args, dependencies:
[curses])
+      curses =3D declare_dependency(compile_args: curses_compile_args,
dependencies: [curses])
     else
       msg =3D 'curses package not usable'
       curses =3D not_found
     endif
   endif
   if not curses.found()
-    curses_compile_args =3D ['-DNCURSES_WIDECHAR']
     has_curses_h =3D cc.has_header('curses.h', args: curses_compile_args)
     if targetos !=3D 'windows' and not has_curses_h
       message('Trying with /usr/include/ncursesw')
--=20
2.29.2.windows.3


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--000000000000a086a005b78b9546
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Mon, Dec 28, 2020 at 11:51 PM Chris Hofstaedtle=
r &lt;<a href=3D"mailto:chris@hofstaedtler.name">chris@hofstaedtler.name</a=
>&gt; wrote:<br>&gt;<br>&gt; Without this, meson fails with &quot;curses pa=
ckage not usable&quot;<br>&gt; when using ncurses 6.2. Apparently the wide =
functions<br>&gt; (addwstr, etc) are hidden behind the extra define, and<br=
>&gt; meson does not define it at that detection stage.<br>&gt;<br>&gt; Sig=
ned-off-by: Chris Hofstaedtler &lt;<a href=3D"mailto:chris@hofstaedtler.nam=
e">chris@hofstaedtler.name</a>&gt;<br>&gt; ---<br>&gt; =C2=A0meson.build | =
2 +-<br>&gt; =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>&gt;<br=
>&gt; diff --git a/meson.build b/meson.build<br>&gt; index 9c152a85bd..7b9d=
92c14a 100644<br>&gt; --- a/meson.build<br>&gt; +++ b/meson.build<br>&gt; @=
@ -510,7 +510,7 @@ if have_system and not get_option(&#39;curses&#39;).disa=
bled()<br>&gt; =C2=A0 =C2=A0endforeach<br>&gt; =C2=A0 =C2=A0msg =3D get_opt=
ion(&#39;curses&#39;).enabled() ? &#39;curses library not found&#39; : &#39=
;&#39;<br>&gt; =C2=A0 =C2=A0if curses.found()<br>&gt; - =C2=A0 =C2=A0if cc.=
links(curses_test, dependencies: [curses])<br>&gt; + =C2=A0 =C2=A0if cc.lin=
ks(curses_test, args: &#39;-DNCURSES_WIDECHAR&#39;, dependencies: [curses])=
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0curses =3D declare_dependency(compile_a=
rgs: &#39;-DNCURSES_WIDECHAR&#39;, dependencies: [curses])<br>&gt; =C2=A0 =
=C2=A0 =C2=A0else<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0msg =3D &#39;curses pa=
ckage not usable&#39;<br>&gt; --<br>&gt; 2.29.2<br>&gt;<br>&gt;<br>Better t=
o share=C2=A0

curses_compile_args=20

<div><br></div><div>--- a/meson.build<br>+++ b/meson.build<br>@@ -504,16 +5=
04,16 @@ if have_system and not get_option(&#39;curses&#39;).disabled()<br>=
=C2=A0 =C2=A0 =C2=A0endif<br>=C2=A0 =C2=A0endforeach<br>=C2=A0 =C2=A0msg =
=3D get_option(&#39;curses&#39;).enabled() ? &#39;curses library not found&=
#39; : &#39;&#39;<br>+ =C2=A0curses_compile_args =3D [&#39;-DNCURSES_WIDECH=
AR&#39;]<br>=C2=A0 =C2=A0if curses.found()<br>- =C2=A0 =C2=A0if cc.links(cu=
rses_test, dependencies: [curses])<br>- =C2=A0 =C2=A0 =C2=A0curses =3D decl=
are_dependency(compile_args: &#39;-DNCURSES_WIDECHAR&#39;, dependencies: [c=
urses])<br>+ =C2=A0 =C2=A0if cc.links(curses_test, args: curses_compile_arg=
s, dependencies: [curses])<br>+ =C2=A0 =C2=A0 =C2=A0curses =3D declare_depe=
ndency(compile_args: curses_compile_args, dependencies: [curses])<br>=C2=A0=
 =C2=A0 =C2=A0else<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0msg =3D &#39;curses packag=
e not usable&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0curses =3D not_found<br>=C2=
=A0 =C2=A0 =C2=A0endif<br>=C2=A0 =C2=A0endif<br>=C2=A0 =C2=A0if not curses.=
found()<br>- =C2=A0 =C2=A0curses_compile_args =3D [&#39;-DNCURSES_WIDECHAR&=
#39;]<br>=C2=A0 =C2=A0 =C2=A0has_curses_h =3D cc.has_header(&#39;curses.h&#=
39;, args: curses_compile_args)<br>=C2=A0 =C2=A0 =C2=A0if targetos !=3D &#3=
9;windows&#39; and not has_curses_h<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0message(&=
#39;Trying with /usr/include/ncursesw&#39;)<br>-- <br>2.29.2.windows.3<br><=
br><br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=
=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>=
Yonggang Luo</div></div>

--000000000000a086a005b78b9546--

