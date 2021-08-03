Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA603DEF72
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 15:56:55 +0200 (CEST)
Received: from localhost ([::1]:46896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAuub-0000oW-Ur
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 09:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mAutO-0007x4-72
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 09:55:38 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:42634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mAutM-0005hX-Hb
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 09:55:37 -0400
Received: by mail-qt1-x82e.google.com with SMTP id h27so13937318qtu.9
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 06:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AkG34daRftz3GJaJHI20SVUkXJkCanFLV1GLvG9rgJs=;
 b=TxTHSKnq6YZYTwV1VX7BOEir9r5FK3+xTvkNs2GziejqINp8z2XD5ObRsFU7oFmNNW
 hkjgeN4/oDxKSkAhyMlG/S3UJyHlo6DRycAu2uVSHmx7IYrwQRFBoqXHEQ/nekyjmfFe
 MzFarVhk9YbFeBE1kLIws7ppabv/CRVMOgTkZeh4/Hc0/wZbf8eejjSy2Ez/LEApvMlP
 1FwtN/bO8+iG4eoXyEBPSPeY1PUHfECO8ZzVj9bEzYc5edDBUS4hwGXAEj7NGGs8QS1l
 CLTbJ2tcvP3YffOoSM2dGvQt4S52UXbhMUhbBOfSwHmsNfOgcYy77bOtNesy80D4DaLO
 vmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AkG34daRftz3GJaJHI20SVUkXJkCanFLV1GLvG9rgJs=;
 b=WitS8RznaXmylpMuhDUE36VqukHuqIdCeOE/6b5NWJCHAttXy8zS49QF1EH0AZYBKU
 VTEM5lMvC29g7mip2D8e49sb96CTv3E/kAkGCJsyelIF9vm1lLuHUj/amx4rshKESHNx
 yYwqgqzJgKMAsueE9wdYsN6efRMBAPVmka1Tl9UJ3e6If58537FjoTZUksN+f0xYtl+l
 etBrdnNvSTClpnXhgr50WGX8DIAKzzSJ7d+D/KLzb1mk8Hht+Jio2lCRZ6IxfH/SIljy
 p30ikASn3C80jIuAqidNHMLOI25x07qmC4KPT0NI84jlGAJYjMwtqP77L9GYmzwrSoab
 vf8Q==
X-Gm-Message-State: AOAM533wZv/kz9qwbCMLp+Guvz2vxep1DQ6dd7As1gHsYZcTKiYt1lMG
 fdnrnPhiknD8TqhH78yh9PXr+RKVdMxztEQx6i2Qtw==
X-Google-Smtp-Source: ABdhPJwF/NddDAUv4hTRNlA0DcqslQU3Y9UyFVNE0j+zKbcrH9yMJ6f1ag2xzIsOo/FNdfnSOHPOjxFg2IT1SFMaQqo=
X-Received: by 2002:ac8:6645:: with SMTP id j5mr18429721qtp.244.1627998934698; 
 Tue, 03 Aug 2021 06:55:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210803110237.1051032-1-alex.bennee@linaro.org>
 <20210803110237.1051032-3-alex.bennee@linaro.org>
In-Reply-To: <20210803110237.1051032-3-alex.bennee@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 3 Aug 2021 07:55:22 -0600
Message-ID: <CANCZdfr+LLSiXZcmUHyNJNuLkb60StWJpWwtvQw2GY3+TwoHrw@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] tests/tcg/sha1: remove endian include
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000032a3e205c8a80a86"
Received-SPF: none client-ip=2607:f8b0:4864:20::82e;
 envelope-from=wlosh@bsdimp.com; helo=mail-qt1-x82e.google.com
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
Cc: fam@euphon.net, "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000032a3e205c8a80a86
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 3, 2021, 5:02 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:

> This doesn't exist in BSD world and doesn't seem to be needed by
> either.
>

Sys/endian.h is common. FreeBSD has endian.h, but others don't.

Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Warner Losh <imp@bsdimp.com>
>

Acked by: Warner Losh <imp@bsdimp.com>

> ---
>  tests/tcg/multiarch/sha1.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/tests/tcg/multiarch/sha1.c b/tests/tcg/multiarch/sha1.c
> index 87bfbcdf52..0081bd7657 100644
> --- a/tests/tcg/multiarch/sha1.c
> +++ b/tests/tcg/multiarch/sha1.c
> @@ -43,7 +43,6 @@ void SHA1Init(SHA1_CTX* context);
>  void SHA1Update(SHA1_CTX* context, const unsigned char* data, uint32_t
> len);
>  void SHA1Final(unsigned char digest[20], SHA1_CTX* context);
>  /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D end of sha1.h =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
> -#include <endian.h>
>
>  #define rol(value, bits) (((value) << (bits)) | ((value) >> (32 -
> (bits))))
>
> --
> 2.30.2
>
>

--00000000000032a3e205c8a80a86
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Aug 3, 2021, 5:02 AM Alex Benn=C3=A9e &lt;<a h=
ref=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">This doesn&#39;t exist in BSD worl=
d and doesn&#39;t seem to be needed by<br>
either.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Sys/endian.h is common. FreeBSD has endian.h, but others don&#39;t.=
=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank" rel=3D"noreferrer">alex.bennee@linaro.org</a>&gt;<br>
Cc: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"_blank" rel=
=3D"noreferrer">imp@bsdimp.com</a>&gt;<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Acked by: Warner Losh &lt;<a href=3D"=
mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt;</div><div dir=3D"auto"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
---<br>
=C2=A0tests/tcg/multiarch/sha1.c | 1 -<br>
=C2=A01 file changed, 1 deletion(-)<br>
<br>
diff --git a/tests/tcg/multiarch/sha1.c b/tests/tcg/multiarch/sha1.c<br>
index 87bfbcdf52..0081bd7657 100644<br>
--- a/tests/tcg/multiarch/sha1.c<br>
+++ b/tests/tcg/multiarch/sha1.c<br>
@@ -43,7 +43,6 @@ void SHA1Init(SHA1_CTX* context);<br>
=C2=A0void SHA1Update(SHA1_CTX* context, const unsigned char* data, uint32_=
t len);<br>
=C2=A0void SHA1Final(unsigned char digest[20], SHA1_CTX* context);<br>
=C2=A0/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D end of sha1.h =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */<br>
-#include &lt;endian.h&gt;<br>
<br>
=C2=A0#define rol(value, bits) (((value) &lt;&lt; (bits)) | ((value) &gt;&g=
t; (32 - (bits))))<br>
<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div></div></div>

--00000000000032a3e205c8a80a86--

