Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A97E584981
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 03:59:51 +0200 (CEST)
Received: from localhost ([::1]:57506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHFI6-0003ZT-65
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 21:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1oHFGH-0001iU-Ow; Thu, 28 Jul 2022 21:57:57 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32]:40488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1oHFGF-0007QI-QQ; Thu, 28 Jul 2022 21:57:57 -0400
Received: by mail-vs1-xe32.google.com with SMTP id 125so3244479vsx.7;
 Thu, 28 Jul 2022 18:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=n5BMPSZaVmiciNNOqsqksGzFcgWI6WjVm0np7FbSEoo=;
 b=Nh1aBwxyRcH/Lvmyp1jZPA0hSf3c+tK7tskrIDwMwuOro0B+gklVWVgkSq17dIdKJ2
 5Yl3cN8p5SiWEBLZ3JJZCCnWpCSXSm4mXQA2NjZIQ5jqRFxyq0/bi2gDVPiR+C+cWV3F
 FH5F+sQfc82+itgl2wynkfOoDOR3xbUqhXZgq5g9twrtZc6p115s5COKGb49J2o9Le4l
 U4w84gtwl/KBbm8O36nOIq2zrKSSs+oXNOt5Q9OkD3za1jSpnldotCTqx+oEXdVApAOD
 VBYvsqb5TEdjDVm0e3Mbo1VrznqJCABsKdBD5kXSYkioSxz5ofylDmv+ztrXUAbY5HDm
 Gr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=n5BMPSZaVmiciNNOqsqksGzFcgWI6WjVm0np7FbSEoo=;
 b=KjBhz1DgeTDnETUK6kXQP9+gXGN5rEqOo3LdCJKrHWT8BtQhR80OBe8YBdmdYxYnpN
 6wYW+N2Qf4ZFDqYVx3CeqPimXI9PzOzGMfgAfa5/MaKGsmGJBv9QBeGFfoBAEN0jxKAu
 BllakGJamuZT6IfBKJc0bRfbRz25rAnnpAPBi3N7OjpDcoSdac4Ih9vowRH+ah11TjaI
 j+Y56Hb/hM7av7HlR/yF3ftU/kajOScxLMbKEg6PQ6FxN5n5shoDPKc24d0in2prSxuw
 cJ0rOqnA/75AnOcG7zRYU9BJmswNufb1LfyuY7qUXEb3UuKRt+EIzmWKOsCMeoGa9hSy
 YvxA==
X-Gm-Message-State: AJIora9CzcUWPdM+qinbn2gXTiCEaffu3n4ud1BXIY/+epDOSJrVNPeX
 hFBuleoowPrkfeuB+O3umDHh4sNh1KW91XewUpqPC0jYgcI=
X-Google-Smtp-Source: AGRyM1tXEj5w1CWA8AR6aXs9EOIesjWh2rVSnAKJBnhxjhC7Tz1gUNoTdBnu15EBzvB2ppwaXMlXyLuIv3dbwj0Tp1c=
X-Received: by 2002:a05:6102:3177:b0:358:5ba9:683d with SMTP id
 l23-20020a056102317700b003585ba9683dmr536758vsm.17.1659059873137; Thu, 28 Jul
 2022 18:57:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220728200422.1502-1-luoyonggang@gmail.com>
In-Reply-To: <20220728200422.1502-1-luoyonggang@gmail.com>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Fri, 29 Jul 2022 09:57:38 +0800
Message-ID: <CAE2XoE-KAPu_1=6x6m84SXGd0W4nLYjhSVX0MmaYJ3WxPy=EaQ@mail.gmail.com>
Subject: Re: [PATCH v2] ci: Upgrade msys2 release to 20220603
To: qemu-level <qemu-devel@nongnu.org>
Cc: Thomas Huth <thuth@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000066498005e4e7faad"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=luoyonggang@gmail.com; helo=mail-vs1-xe32.google.com
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000066498005e4e7faad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Seems this fixes the gitlab ci
I've running multiple times
https://gitlab.com/lygstate/qemu/-/jobs/2785244516
https://gitlab.com/lygstate/qemu/-/jobs/2785245299
all succeed.

On Fri, Jul 29, 2022 at 4:04 AM Yonggang Luo <luoyonggang@gmail.com> wrote:
>
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  .cirrus.yml              | 2 +-
>  .gitlab-ci.d/windows.yml | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/.cirrus.yml b/.cirrus.yml
> index 20843a420c..4ffef6105b 100644
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -12,7 +12,7 @@ windows_msys2_task:
>      CIRRUS_SHELL: powershell
>      MSYS: winsymlinks:nativestrict
>      MSYSTEM: MINGW64
> -    MSYS2_URL:
https://github.com/msys2/msys2-installer/releases/download/2022-05-03/msys2=
-base-x86_64-20220503.sfx.exe
> +    MSYS2_URL:
https://github.com/msys2/msys2-installer/releases/download/2022-06-03/msys2=
-base-x86_64-20220603.sfx.exe
>      MSYS2_FINGERPRINT: 0
>      MSYS2_PACKAGES: "
>        diffutils git grep make pkg-config sed
> diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
> index 1b2ede49e1..da80fabe2c 100644
> --- a/.gitlab-ci.d/windows.yml
> +++ b/.gitlab-ci.d/windows.yml
> @@ -17,7 +17,7 @@
>      }
>    - If ( !(Test-Path -Path msys64\var\cache\msys2.exe ) ) {
>        Invoke-WebRequest
> -      "
https://github.com/msys2/msys2-installer/releases/download/2022-05-03/msys2=
-base-x86_64-20220503.sfx.exe
"
> +      "
https://github.com/msys2/msys2-installer/releases/download/2022-06-03/msys2=
-base-x86_64-20220603.sfx.exe
"
>        -outfile "msys64\var\cache\msys2.exe"
>      }
>    - msys64\var\cache\msys2.exe -y
> --
> 2.36.1.windows.1
>


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--00000000000066498005e4e7faad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div>Seems this fixes the gitlab ci<div>I&#39;ve=
 running multiple times</div><div><a href=3D"https://gitlab.com/lygstate/qe=
mu/-/jobs/2785244516">https://gitlab.com/lygstate/qemu/-/jobs/2785244516</a=
></div><div><a href=3D"https://gitlab.com/lygstate/qemu/-/jobs/2785245299">=
https://gitlab.com/lygstate/qemu/-/jobs/2785245299</a></div><div>all succee=
d.<br><br>On Fri, Jul 29, 2022 at 4:04 AM Yonggang Luo &lt;<a href=3D"mailt=
o:luoyonggang@gmail.com">luoyonggang@gmail.com</a>&gt; wrote:<br>&gt;<br>&g=
t; Signed-off-by: Yonggang Luo &lt;<a href=3D"mailto:luoyonggang@gmail.com"=
>luoyonggang@gmail.com</a>&gt;<br>&gt; ---<br>&gt; =C2=A0.cirrus.yml =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>&gt; =C2=A0.gitlab-ci.d=
/windows.yml | 2 +-<br>&gt; =C2=A02 files changed, 2 insertions(+), 2 delet=
ions(-)<br>&gt;<br>&gt; diff --git a/.cirrus.yml b/.cirrus.yml<br>&gt; inde=
x 20843a420c..4ffef6105b 100644<br>&gt; --- a/.cirrus.yml<br>&gt; +++ b/.ci=
rrus.yml<br>&gt; @@ -12,7 +12,7 @@ windows_msys2_task:<br>&gt; =C2=A0 =C2=
=A0 =C2=A0CIRRUS_SHELL: powershell<br>&gt; =C2=A0 =C2=A0 =C2=A0MSYS: winsym=
links:nativestrict<br>&gt; =C2=A0 =C2=A0 =C2=A0MSYSTEM: MINGW64<br>&gt; - =
=C2=A0 =C2=A0MSYS2_URL: <a href=3D"https://github.com/msys2/msys2-installer=
/releases/download/2022-05-03/msys2-base-x86_64-20220503.sfx.exe">https://g=
ithub.com/msys2/msys2-installer/releases/download/2022-05-03/msys2-base-x86=
_64-20220503.sfx.exe</a><br>&gt; + =C2=A0 =C2=A0MSYS2_URL: <a href=3D"https=
://github.com/msys2/msys2-installer/releases/download/2022-06-03/msys2-base=
-x86_64-20220603.sfx.exe">https://github.com/msys2/msys2-installer/releases=
/download/2022-06-03/msys2-base-x86_64-20220603.sfx.exe</a><br>&gt; =C2=A0 =
=C2=A0 =C2=A0MSYS2_FINGERPRINT: 0<br>&gt; =C2=A0 =C2=A0 =C2=A0MSYS2_PACKAGE=
S: &quot;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0diffutils git grep make pkg-co=
nfig sed<br>&gt; diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windo=
ws.yml<br>&gt; index 1b2ede49e1..da80fabe2c 100644<br>&gt; --- a/.gitlab-ci=
.d/windows.yml<br>&gt; +++ b/.gitlab-ci.d/windows.yml<br>&gt; @@ -17,7 +17,=
7 @@<br>&gt; =C2=A0 =C2=A0 =C2=A0}<br>&gt; =C2=A0 =C2=A0- If ( !(Test-Path =
-Path msys64\var\cache\msys2.exe ) ) {<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0I=
nvoke-WebRequest<br>&gt; - =C2=A0 =C2=A0 =C2=A0&quot;<a href=3D"https://git=
hub.com/msys2/msys2-installer/releases/download/2022-05-03/msys2-base-x86_6=
4-20220503.sfx.exe">https://github.com/msys2/msys2-installer/releases/downl=
oad/2022-05-03/msys2-base-x86_64-20220503.sfx.exe</a>&quot;<br>&gt; + =C2=
=A0 =C2=A0 =C2=A0&quot;<a href=3D"https://github.com/msys2/msys2-installer/=
releases/download/2022-06-03/msys2-base-x86_64-20220603.sfx.exe">https://gi=
thub.com/msys2/msys2-installer/releases/download/2022-06-03/msys2-base-x86_=
64-20220603.sfx.exe</a>&quot;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0-outfile &=
quot;msys64\var\cache\msys2.exe&quot;<br>&gt; =C2=A0 =C2=A0 =C2=A0}<br>&gt;=
 =C2=A0 =C2=A0- msys64\var\cache\msys2.exe -y<br>&gt; --<br>&gt; 2.36.1.win=
dows.1<br>&gt;<br><br><br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=AD=A4=
=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=A0 =
=C2=A0 sincerely,<br>Yonggang Luo</div></div>

--00000000000066498005e4e7faad--

