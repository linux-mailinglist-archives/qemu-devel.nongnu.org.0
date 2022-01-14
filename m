Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC93048F1C1
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 21:56:33 +0100 (CET)
Received: from localhost ([::1]:54168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Tce-0008Ex-Qu
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 15:56:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n8TaN-0006nn-Tp
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 15:54:12 -0500
Received: from [2607:f8b0:4864:20::935] (port=33668
 helo=mail-ua1-x935.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n8TaL-0007Hi-Lx
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 15:54:11 -0500
Received: by mail-ua1-x935.google.com with SMTP id u6so19207299uaq.0
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 12:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wZgbcVzc00aQmNc7nhTNX8FMeuBWvlg2HNgntJ6BN6w=;
 b=hlamQ0vttoTSpLn+/fV/3YjHTKoBgUm+z1Hn5/HWTTqN9EcIVAY1NGJqwbPaotLLR6
 WR2YAqUIzPeRSxPD2xw3QuHg5k0VYOCyDKYaTE8XjiFK5wQ09rGUhlHrFpIGO7YXqG9Z
 j96+pONfnFyauC9bSiPLFjDvKLglmgWIpil4Dv+IoM5uuFK13W/wTIotJlkOGFn+b9SS
 n1EdYPtYoP4DqvycSyKhcUYYSehbfWNpdOwdLsCyGdYkwz8dBrAlN1D8Ckb+3DJ388ZU
 LKlwlDR1iJ/fImsGir1WUx2jFa5Az1yKiYJEVbotaURQFSQPF9L6bm4Q2l5ZZfazR2H1
 uhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wZgbcVzc00aQmNc7nhTNX8FMeuBWvlg2HNgntJ6BN6w=;
 b=YfWnSZudMGSFHVsXqQYZQRyCo5Q8bJ/IsQye4KKs1jrf+RpgJIm4Jvb3doeKhCwYnS
 jGaxsHQO4zpq9Zyr6ag5mgWmTQE9McNL9dz2l0AoMXWB9k0WZ3v3pc+K2Gt1eQCCq4Vy
 4fnragfJd9xOCaRoYFE0I5KicskWhy32ecvrpnSbaiRiM+5XGmMsunwFDtjHMRWT+Eoo
 akKMvsioyQuaj4I0eNMUqJXUaiDKkCXFwL8hZeLXjw9zt+VqhOyyCbsgUWDxdARpYD6M
 PKiKBbtz4lUcbxOGHrNm85WG6mv0OJnqVsext0kQc/34XrHneaW0PGhqxTGun+tdAVGA
 fGvw==
X-Gm-Message-State: AOAM530Mv7/+cupQNFHjkyxK/hhuGsc8uXumNjWFTWdwwjkt/35n93X5
 5DOiiW9Rt1p6ejvUy6FWMUkrqH7smuAg2/L7IEzJUw==
X-Google-Smtp-Source: ABdhPJyumTwXjT7lh2NpENwaTf4b3S2tIt2quu31Ayhfqwz/D/7laDwIjlJWrCjDtXqAtcfQIavsG+JEkzU58HTXvPo=
X-Received: by 2002:a05:6102:3e86:: with SMTP id
 m6mr4618485vsv.77.1642193647934; 
 Fri, 14 Jan 2022 12:54:07 -0800 (PST)
MIME-Version: 1.0
References: <20220114182535.3804783-1-peter.maydell@linaro.org>
In-Reply-To: <20220114182535.3804783-1-peter.maydell@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 14 Jan 2022 13:53:57 -0700
Message-ID: <CANCZdfqCPxpzoM6_efXdT8wB1KZyRRTA8+PptP1RPb6WQhj0-Q@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Fix comment typo in arm cpu_loop code
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000009b9e105d59101e6"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::935
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::935;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x935.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000009b9e105d59101e6
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 14, 2022 at 11:25 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> Fix a typo in a comment in the arm cpu_loop code.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  linux-user/arm/cpu_loop.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
> index f153ab503a8..032e1ffddfb 100644
> --- a/linux-user/arm/cpu_loop.c
> +++ b/linux-user/arm/cpu_loop.c
> @@ -434,8 +434,8 @@ void cpu_loop(CPUARMState *env)
>              case 0x6: /* Access flag fault, level 2 */
>              case 0x9: /* Domain fault, level 1 */
>              case 0xb: /* Domain fault, level 2 */
> -            case 0xd: /* Permision fault, level 1 */
> -            case 0xf: /* Permision fault, level 2 */
> +            case 0xd: /* Permission fault, level 1 */
> +            case 0xf: /* Permission fault, level 2 */
>                  si_signo = TARGET_SIGSEGV;
>                  si_code = TARGET_SEGV_ACCERR;
>                  break;
> --
> 2.25.1
>
>

--00000000000009b9e105d59101e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 14, 2022 at 11:25 AM Pete=
r Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Fix a typo in a comment in the arm cpu_loop code.<br>
<br>
Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
---<br>
=C2=A0linux-user/arm/cpu_loop.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br></blockquote><div>=
<br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.co=
m">imp@bsdimp.com</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c<br>
index f153ab503a8..032e1ffddfb 100644<br>
--- a/linux-user/arm/cpu_loop.c<br>
+++ b/linux-user/arm/cpu_loop.c<br>
@@ -434,8 +434,8 @@ void cpu_loop(CPUARMState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 0x6: /* Access flag fa=
ult, level 2 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 0x9: /* Domain fault, =
level 1 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 0xb: /* Domain fault, =
level 2 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0xd: /* Permision fault, le=
vel 1 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0xf: /* Permision fault, le=
vel 2 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0xd: /* Permission fault, l=
evel 1 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0xf: /* Permission fault, l=
evel 2 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0si_signo =3D =
TARGET_SIGSEGV;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0si_code =3D T=
ARGET_SEGV_ACCERR;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--00000000000009b9e105d59101e6--

