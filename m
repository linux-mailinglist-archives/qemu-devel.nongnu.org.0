Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C6027021C
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 18:30:00 +0200 (CEST)
Received: from localhost ([::1]:38810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJJGp-0004XV-DE
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 12:29:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kJIwr-0000iq-IC; Fri, 18 Sep 2020 12:09:21 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:37419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kJIwp-0003QG-LP; Fri, 18 Sep 2020 12:09:21 -0400
Received: by mail-lj1-x244.google.com with SMTP id n25so5548393ljj.4;
 Fri, 18 Sep 2020 09:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=rsYfhxRLSpWgsr9CzxyA1x6Nm0my2NfvcK+oJ7qbYu0=;
 b=Ig1fXr4sgKcpbiaZM63NnhbETvUFl7TBGD6R/SVliIe0lpsdNZ5EELEnJrxl/LWeb8
 mr9trAoVds30HYy3G2pi1kHPAxPzB1SET0g19nD/TBgIWSiM0aC49T/t3QETkCBqJe9L
 7eWAwuJAIS9wXLJ3hvfd8YYp1ccz+oEmMk0ZVtInltDN2bfFOuE2rLAph2blc/Whic7I
 gdmDPYGq3/pFknmmXGC4RO9cbeTiQEgE3wfP7JFd0XRx7uEqj9uPhmWItreIyorlfB+t
 3VGNRRPUGA7wvHMKyurEnKavQX1ITTAc/TqjzQ9S3PUuoSk7cef2e+iwoVpUXyc7HOkK
 i76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=rsYfhxRLSpWgsr9CzxyA1x6Nm0my2NfvcK+oJ7qbYu0=;
 b=Ot9bkbMdjb0bhEf8m4H9588j4XgnBFfR54Xw+SD2PYn1odOnlEFzT5yKCFrbureG/R
 5kOjsA6jHqbvTtox11FkybJY6nwWsiy1Je61NXkHEnAKXak0lqCj+bgb7NyxmXWu5EZy
 ZR/rnLb1Da4on8me11ZC+fx5eJmw2APSTkRdvaas1Gq1NhfC9yeRXnNrdY1hh7C57iDu
 boHMiagFNj2y0BAop4jIZJ4IYqQA+eZVCQoLNApjncDzoTUpx/JhNZ7dXQ+gy6pLsZdd
 mRI+at3KBlVAGx2Ru/e097eu/3/KcU3nWXBxCF/4YVoWhS5HnWcACZ9mU17Dv77ByqS8
 TLig==
X-Gm-Message-State: AOAM533FxEqAjo/8/R4j4P2sZG+d1faq/FI2HgabASSSC8xnCmfPPwlS
 wmEk5wxyE9IIsQQuJLwCgFAsLEmnC1Am/RkukAnaWBR7cx4=
X-Google-Smtp-Source: ABdhPJwLZTU6bbC9V63Dp8YpdJU5BzcMP3LddfyrFnOW1QVdYlT08xREnnltcHcoSXqnJseoisqzKfNgaT46E2J8yUQ=
X-Received: by 2002:a2e:89d6:: with SMTP id c22mr12825907ljk.242.1600445356240; 
 Fri, 18 Sep 2020 09:09:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200918144512.978-1-luoyonggang@gmail.com>
In-Reply-To: <20200918144512.978-1-luoyonggang@gmail.com>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Sat, 19 Sep 2020 00:09:04 +0800
Message-ID: <CAE2XoE-GoYSFWjaprHH_y__=u0mhp+hK2CaPrOQ=ApWELewCKQ@mail.gmail.com>
Subject: Re: [PATCH] configure: fixes indent of $meson setup
To: qemu-level <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000f0f45605af98b861"
Received-SPF: pass client-ip=2a00:1450:4864:20::244;
 envelope-from=luoyonggang@gmail.com; helo=mail-lj1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f0f45605af98b861
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bonzini, please queue this

On Fri, Sep 18, 2020 at 10:45 PM Yonggang Luo <luoyonggang@gmail.com> wrote=
:
>
> convert these line from tab to space
>
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  configure | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/configure b/configure
> index 3757e48b17..422b1ef2a3 100755
> --- a/configure
> +++ b/configure
> @@ -7850,10 +7850,10 @@ NINJA=3D${ninja:-$PWD/ninjatool} $meson setup \
>          -Dstrip=3D$(if test "$strip_opt" =3D yes; then echo true; else e=
cho
false; fi) \
>          -Db_pie=3D$(if test "$pie" =3D yes; then echo true; else echo fa=
lse;
fi) \
>          -Db_coverage=3D$(if test "$gcov" =3D yes; then echo true; else e=
cho
false; fi) \
> -       -Dmalloc=3D$malloc -Dmalloc_trim=3D$malloc_trim \
> -       -Dcocoa=3D$cocoa -Dmpath=3D$mpath -Dsdl=3D$sdl -Dsdl_image=3D$sdl=
_image \
> -       -Dvnc=3D$vnc -Dvnc_sasl=3D$vnc_sasl -Dvnc_jpeg=3D$vnc_jpeg
-Dvnc_png=3D$vnc_png \
> -       -Dgettext=3D$gettext -Dxkbcommon=3D$xkbcommon -Du2f=3D$u2f\
> +        -Dmalloc=3D$malloc -Dmalloc_trim=3D$malloc_trim \
> +        -Dcocoa=3D$cocoa -Dmpath=3D$mpath -Dsdl=3D$sdl -Dsdl_image=3D$sd=
l_image \
> +        -Dvnc=3D$vnc -Dvnc_sasl=3D$vnc_sasl -Dvnc_jpeg=3D$vnc_jpeg
-Dvnc_png=3D$vnc_png \
> +        -Dgettext=3D$gettext -Dxkbcommon=3D$xkbcommon -Du2f=3D$u2f \
>          $cross_arg \
>          "$PWD" "$source_path"
>
> --
> 2.28.0.windows.1
>


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--000000000000f0f45605af98b861
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Bonzini, please queue this<br><br>On Fri, Sep 18, 2020 =
at 10:45 PM Yonggang Luo &lt;<a href=3D"mailto:luoyonggang@gmail.com">luoyo=
nggang@gmail.com</a>&gt; wrote:<br>&gt;<br>&gt; convert these line from tab=
 to space<br>&gt;<br>&gt; Signed-off-by: Yonggang Luo &lt;<a href=3D"mailto=
:luoyonggang@gmail.com">luoyonggang@gmail.com</a>&gt;<br>&gt; ---<br>&gt; =
=C2=A0configure | 8 ++++----<br>&gt; =C2=A01 file changed, 4 insertions(+),=
 4 deletions(-)<br>&gt;<br>&gt; diff --git a/configure b/configure<br>&gt; =
index 3757e48b17..422b1ef2a3 100755<br>&gt; --- a/configure<br>&gt; +++ b/c=
onfigure<br>&gt; @@ -7850,10 +7850,10 @@ NINJA=3D${ninja:-$PWD/ninjatool} $=
meson setup \<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dstrip=3D$(if test=
 &quot;$strip_opt&quot; =3D yes; then echo true; else echo false; fi) \<br>=
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Db_pie=3D$(if test &quot;$pie&quot;=
 =3D yes; then echo true; else echo false; fi) \<br>&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0-Db_coverage=3D$(if test &quot;$gcov&quot; =3D yes; then e=
cho true; else echo false; fi) \<br>&gt; - =C2=A0 =C2=A0 =C2=A0 -Dmalloc=3D=
$malloc -Dmalloc_trim=3D$malloc_trim \<br>&gt; - =C2=A0 =C2=A0 =C2=A0 -Dcoc=
oa=3D$cocoa -Dmpath=3D$mpath -Dsdl=3D$sdl -Dsdl_image=3D$sdl_image \<br>&gt=
; - =C2=A0 =C2=A0 =C2=A0 -Dvnc=3D$vnc -Dvnc_sasl=3D$vnc_sasl -Dvnc_jpeg=3D$=
vnc_jpeg -Dvnc_png=3D$vnc_png \<br>&gt; - =C2=A0 =C2=A0 =C2=A0 -Dgettext=3D=
$gettext -Dxkbcommon=3D$xkbcommon -Du2f=3D$u2f\<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-Dmalloc=3D$malloc -Dmalloc_trim=3D$malloc_trim \<br>&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0-Dcocoa=3D$cocoa -Dmpath=3D$mpath -Dsdl=3D$sdl -Dsd=
l_image=3D$sdl_image \<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dvnc=3D$vnc -D=
vnc_sasl=3D$vnc_sasl -Dvnc_jpeg=3D$vnc_jpeg -Dvnc_png=3D$vnc_png \<br>&gt; =
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dgettext=3D$gettext -Dxkbcommon=3D$xkbcommon =
-Du2f=3D$u2f \<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$cross_arg \<br>&g=
t; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$PWD&quot; &quot;$source_path&qu=
ot;<br>&gt;<br>&gt; --<br>&gt; 2.28.0.windows.1<br>&gt;<br><br><br>--<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=
=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo<=
/div>

--000000000000f0f45605af98b861--

