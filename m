Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD39B2F2091
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 21:19:22 +0100 (CET)
Received: from localhost ([::1]:33650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz3er-0003Zn-Kk
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 15:19:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kz3ch-0002xZ-HD
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 15:17:07 -0500
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:38501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kz3cf-0008S8-Na
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 15:17:07 -0500
Received: by mail-lj1-x22d.google.com with SMTP id n11so318365lji.5
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 12:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=YGXpRdhXG/ywLP6PGAi2Ot+XO7X4ZkvEC8bz5dKCyn0=;
 b=loRJIgPE8l1KId6vCy+Dhg3VDBOfavv5LRJmS56wLdH9DMvqWvki/KCsQe3HKUEVLx
 1A4LM90kUE7P2jFmuu5uedxMKrrjc62SAtVpVP7QZuIsm2EwfKIClfz1lAp/Yv0rc+zT
 f/xZnbSKfisgZMeu26D5vT5tYLt9D0h7FIf8W0sIYsgdAjfwJ008DeVjzZqxcz1BKeZe
 gdfxmHJ8MGvDPNK5vqOTYypL9BwR2Gm6+Dg0MPACbA0DWQwW+RfYabG8dSQR+6Y2JlEx
 3sOjWY1lqu/StHOnk5xHh3KIiTQ7uV+urK6J33kRNuBa+LEKhePA1BC3S/2G70bMXFxc
 /1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=YGXpRdhXG/ywLP6PGAi2Ot+XO7X4ZkvEC8bz5dKCyn0=;
 b=gx2277TJBHIQ6hhkLUzeZDV5C4Amv69KRKsXt0xXuhIUN+wwxB2TqQi5IPBknW3HwH
 EKlgprXVIJD4yL/QCqFx4qkkriL0ROWIAxGBOjUFw7XSjvlQCNGubqhTsTM/aQfgA4Vy
 1KHlsRSmzDVdKVc/elG8ida6FV2AOCqMdPywddq05bKUubJoV4Z5hQKL+EMJAHtWgCaH
 SBEQfrehZtrDWRvijrxHOn93OUXvwnmHSKAYSUDtvVHvuPq+rneUld+qTSBpAVDr95nd
 WPBzbmkJB2JNRT+fwoJ6Wv58pIDYGmwQw5lKGzo4sHlNDa/km7dH0Z8yBsJf+myDAyO6
 2eFw==
X-Gm-Message-State: AOAM5330QOQt2xkD0w1SxtLk5FhvCdnJb3j7mtCwYK3FOp90dGNl3v3E
 g2RUHfsgrD8OJI415WvmSZ3QiK1b9COWtaM5S0Q=
X-Google-Smtp-Source: ABdhPJwlTOK01ejecrA5lzRxPS8uWCw7sTmob5/AvlUWWBHY19njo1kdS/+K7c2BkGvw5sZftfBqtHnS+ZHLg0km+GI=
X-Received: by 2002:a2e:9214:: with SMTP id k20mr488556ljg.45.1610396223909;
 Mon, 11 Jan 2021 12:17:03 -0800 (PST)
MIME-Version: 1.0
References: <20210111103410.144797-1-thuth@redhat.com>
In-Reply-To: <20210111103410.144797-1-thuth@redhat.com>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Tue, 12 Jan 2021 04:16:52 +0800
Message-ID: <CAE2XoE_pKkoW9=CojK1TumH10uf_rCDSKNLS-AAPH51QXP2DzA@mail.gmail.com>
Subject: Re: [PATCH] cirrus.yml: Replace the hard-coded python-sphinx version
 with the generic one
To: Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000dfb32205b8a59601"
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=luoyonggang@gmail.com; helo=mail-lj1-x22d.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000dfb32205b8a59601
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 11, 2021 at 6:34 PM Thomas Huth <thuth@redhat.com> wrote:
>
> The mingw-w64-x86_64-python-sphinx-2.3.1 package has been removed from
> the server, so the windows_msys2_task is currently failing. Replace the
> old version with the current generic one to fix the issue (the current
> version seems to work fine now, too).
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Successful run (with sphinx building the docs) can be seen here:
>  https://cirrus-ci.com/task/6568987054047232
>
>  .cirrus.yml | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/.cirrus.yml b/.cirrus.yml
> index 3907e036da..886addedd3 100644
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -117,12 +117,8 @@ windows_msys2_task:
>            mingw-w64-x86_64-curl \
>            mingw-w64-x86_64-gnutls \
>            mingw-w64-x86_64-libnfs \
> +          mingw-w64-x86_64-python-sphinx
>            "
> -        bitsadmin /transfer msys_download /dynamic /download /priority
FOREGROUND `
> -
https://repo.msys2.org/mingw/x86_64/mingw-w64-x86_64-python-sphinx-2.3.1-1-=
any.pkg.tar.xz
`
> -          C:\tools\mingw-w64-x86_64-python-sphinx-2.3.1-1-any.pkg.tar.xz
> -        C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -U
/c/tools/mingw-w64-x86_64-python-sphinx-2.3.1-1-any.pkg.tar.xz"
> -        del
C:\tools\mingw-w64-x86_64-python-sphinx-2.3.1-1-any.pkg.tar.xz
>          C:\tools\msys64\usr\bin\bash.exe -lc "rm -rf
/var/cache/pacman/pkg/*"
>          cd C:\tools\msys64
>          echo "Start archive"
> --
> 2.27.0
>
Hi, I've done that in my previous patch and queued by Paolo Bonzini 4 days,
8 hours ago

https://patchew.org/QEMU/20210107101919.80-1-luoyonggang@gmail.com/
--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--000000000000dfb32205b8a59601
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Mon, Jan 11, 2021 at 6:34 PM Thomas Huth &lt;<a=
 href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wrote:<br>&gt;<b=
r>&gt; The mingw-w64-x86_64-python-sphinx-2.3.1 package has been removed fr=
om<br>&gt; the server, so the windows_msys2_task is currently failing. Repl=
ace the<br>&gt; old version with the current generic one to fix the issue (=
the current<br>&gt; version seems to work fine now, too).<br>&gt;<br>&gt; S=
igned-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@red=
hat.com</a>&gt;<br>&gt; ---<br>&gt; =C2=A0Successful run (with sphinx build=
ing the docs) can be seen here:<br>&gt; =C2=A0<a href=3D"https://cirrus-ci.=
com/task/6568987054047232">https://cirrus-ci.com/task/6568987054047232</a><=
br>&gt;<br>&gt; =C2=A0.cirrus.yml | 6 +-----<br>&gt; =C2=A01 file changed, =
1 insertion(+), 5 deletions(-)<br>&gt;<br>&gt; diff --git a/.cirrus.yml b/.=
cirrus.yml<br>&gt; index 3907e036da..886addedd3 100644<br>&gt; --- a/.cirru=
s.yml<br>&gt; +++ b/.cirrus.yml<br>&gt; @@ -117,12 +117,8 @@ windows_msys2_=
task:<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mingw-w64-x86_64-cur=
l \<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mingw-w64-x86_64-gnutl=
s \<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mingw-w64-x86_64-libnf=
s \<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mingw-w64-x86_64-python-sph=
inx<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>&gt; - =C2=
=A0 =C2=A0 =C2=A0 =C2=A0bitsadmin /transfer msys_download /dynamic /downloa=
d /priority FOREGROUND `<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a hre=
f=3D"https://repo.msys2.org/mingw/x86_64/mingw-w64-x86_64-python-sphinx-2.3=
.1-1-any.pkg.tar.xz">https://repo.msys2.org/mingw/x86_64/mingw-w64-x86_64-p=
ython-sphinx-2.3.1-1-any.pkg.tar.xz</a> `<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0C:\tools\mingw-w64-x86_64-python-sphinx-2.3.1-1-any.pkg.tar.xz=
<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0C:\tools\msys64\usr\bin\bash.exe -lc =
&quot;pacman --noconfirm -U /c/tools/mingw-w64-x86_64-python-sphinx-2.3.1-1=
-any.pkg.tar.xz&quot;<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0del C:\tools\min=
gw-w64-x86_64-python-sphinx-2.3.1-1-any.pkg.tar.xz<br>&gt; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0C:\tools\msys64\usr\bin\bash.exe -lc &quot;rm -rf /var/=
cache/pacman/pkg/*&quot;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd C:\to=
ols\msys64<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Start archi=
ve&quot;<br>&gt; --<br>&gt; 2.27.0<br>&gt;<br>Hi, I&#39;ve done that in my =
previous patch and queued by Paolo Bonzini 4 days, 8 hours ago<br><br><div>=
<a href=3D"https://patchew.org/QEMU/20210107101919.80-1-luoyonggang@gmail.c=
om/">https://patchew.org/QEMU/20210107101919.80-1-luoyonggang@gmail.com/</a=
><br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=
=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>=
Yonggang Luo</div></div>

--000000000000dfb32205b8a59601--

