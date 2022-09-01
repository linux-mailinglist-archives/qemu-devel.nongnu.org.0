Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD4A5A9685
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 14:17:56 +0200 (CEST)
Received: from localhost ([::1]:34836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTj8s-00055v-Gg
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 08:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTipG-0008Pf-7P
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 07:57:38 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:35378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTipD-0002sC-2A
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 07:57:36 -0400
Received: by mail-lj1-x22d.google.com with SMTP id k22so17609249ljg.2
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 04:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=lU2s+pWh5LxEHnlfGWw6DLuYRRTKEAOQIMCQASlNMgM=;
 b=qsIvBfD87HEml84RkumSFaqz/BV0+VeJjed0CE4p7aaZeVowzJSmU8BJv54hBiMAMs
 RRpopDbzqwpsXnGP7igg6V+hylLRHzE6ANXZJH2wIBz7QLrbN69FBq5WWvpd9E/r5l4f
 TSw9tg2xakw4gklYml2D4gCSwE4bLO8BFVwnzrZKw4C+aAktzOEDAljIUTSPa0pE85l6
 c4/YUEfK0GywzV2PNUfrr9kflMJ8oWq4uh3s5lq1D6PKvl467Bm070Cxtx+snXcWhj1H
 YJvmxBVgGJxlSFIL4/X/RlB+XvIiZfDvpTPHfosyQ/8+QWW3qqRhGiXzICfi7KaUxh9/
 LD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=lU2s+pWh5LxEHnlfGWw6DLuYRRTKEAOQIMCQASlNMgM=;
 b=fMFj0HvCbarCpIOvHYTHjltmFTYt9Dzwmg/wNhfUx0iusXGdQgQzANk52BxFnPMj3P
 WArwEFHkXzKAdS0yWntW6a+jUYQGn5cc0OcoUVbywP23YeJCH48sQ3DqILBCDTNwFpCw
 7NkR1pl/OrfXqNkrCZPFLem87qimNAeabEysd8nc3phBaAurcwqW1yWwbj8JBcgdvfLZ
 NDtMiLcupi60cSRvSaru9bbNBWynF40zEAm/tuQTYmLAxYv6Nf85TaSCDLiNp9+22f4b
 iqhQQzZqXBUpcpL+ig87CTff28kl0Yzphw8obSH/kUBFVeG/CWLcvgVU5o63lKoFTFNu
 0mJg==
X-Gm-Message-State: ACgBeo22wYOabTXILfOVcGvxsXrPpdnyUrbFmUjeYCpfB7id0RTXzvPs
 iHC5QAspi5Fj9qKBqtD9v0UXv3VDvbSw0h34crQ=
X-Google-Smtp-Source: AA6agR6VnIETCPj//+Ap6WV2d+8b4FCbylOcMku2tUs2iNkpMXScK62NqIWhMs1qMCj/2o9JAShyCyF3lQuChDIBFqY=
X-Received: by 2002:a2e:9346:0:b0:261:8a31:b40c with SMTP id
 m6-20020a2e9346000000b002618a31b40cmr9128682ljh.267.1662033453366; Thu, 01
 Sep 2022 04:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-48-bmeng.cn@gmail.com>
In-Reply-To: <20220824094029.1634519-48-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 1 Sep 2022 15:57:21 +0400
Message-ID: <CAJ+F1CLg6BXA30e=9VnrWm5HpgyHDhOg=kFrh-iOmMGO2zrfOQ@mail.gmail.com>
Subject: Re: [PATCH 47/51] tests/qtest: libqtest: Correct the timeout unit of
 blocking receive calls for win32
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000097c44005e79c513c"
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22d.google.com
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

--00000000000097c44005e79c513c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Aug 24, 2022 at 3:44 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> Some qtest cases don't get response from the the QEMU executable
>

"the the"


> under test in time on Windows. It turns out that the socket receive
> call got timeout before it receive the complete response.
>
> The timeout value is supposed to be set to 50 seconds via the
> setsockopt() call, but there is a difference among platforms.
> The timeout unit of blocking receive calls is measured in
> seconds on non-Windows platforms but milliseconds on Windows.
>

Ahah, interesting :) Well, it's not the only difference, windows uses DWORD
instead of timeval


>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>
>  tests/qtest/libqtest.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 918f4657ed..7b41971347 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -36,13 +36,14 @@
>  #include "qapi/qmp/qstring.h"
>
>  #define MAX_IRQ 256
> -#define SOCKET_TIMEOUT 50
>
>  #ifndef _WIN32
> +# define SOCKET_TIMEOUT 50
>  # define CMD_EXEC   "exec "
>  # define DEV_STDERR "/dev/fd/2"
>  # define DEV_NULL   "/dev/null"
>  #else
> +# define SOCKET_TIMEOUT 50000
>  # define CMD_EXEC   ""
>  # define DEV_STDERR "2"
>  # define DEV_NULL   "nul"
> @@ -108,8 +109,16 @@ static int socket_accept(int sock)
>      struct sockaddr_un addr;
>      socklen_t addrlen;
>      int ret;
> +    /*
> +     * timeout unit of blocking receive calls is different among platfom=
s.
> +     * It's in seconds on non-Windows platforms but milliseconds on
> Windows.
> +     */
> +#ifndef _WIN32
>      struct timeval timeout =3D { .tv_sec =3D SOCKET_TIMEOUT,
>                                 .tv_usec =3D 0 };
> +#else
> +    DWORD timeout =3D SOCKET_TIMEOUT;
> +#endif
>
>      if (setsockopt(sock, SOL_SOCKET, SO_RCVTIMEO,
>                     (void *)&timeout, sizeof(timeout))) {
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000097c44005e79c513c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 24, 2022 at 3:44 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin=
 Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.m=
eng@windriver.com</a>&gt;<br>
<br>
Some qtest cases don&#39;t get response from the the QEMU executable<br></b=
lockquote><div><br></div><div>&quot;the the&quot;</div><div>=C2=A0<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
under test in time on Windows. It turns out that the socket receive<br>
call got timeout before it receive the complete response.<br>
<br>
The timeout value is supposed to be set to 50 seconds via the<br>
setsockopt() call, but there is a difference among platforms.<br>
The timeout unit of blocking receive calls is measured in<br>
seconds on non-Windows platforms but milliseconds on Windows.<br></blockquo=
te><div><br></div><div>Ahah, interesting :) Well, it&#39;s not the only dif=
ference, windows uses DWORD instead of timeval<br></div><div>=C2=A0<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
</blockquote><div><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a=
 href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a=
>&gt;<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">---<br>
<br>
=C2=A0tests/qtest/libqtest.c | 11 ++++++++++-<br>
=C2=A01 file changed, 10 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c<br>
index 918f4657ed..7b41971347 100644<br>
--- a/tests/qtest/libqtest.c<br>
+++ b/tests/qtest/libqtest.c<br>
@@ -36,13 +36,14 @@<br>
=C2=A0#include &quot;qapi/qmp/qstring.h&quot;<br>
<br>
=C2=A0#define MAX_IRQ 256<br>
-#define SOCKET_TIMEOUT 50<br>
<br>
=C2=A0#ifndef _WIN32<br>
+# define SOCKET_TIMEOUT 50<br>
=C2=A0# define CMD_EXEC=C2=A0 =C2=A0&quot;exec &quot;<br>
=C2=A0# define DEV_STDERR &quot;/dev/fd/2&quot;<br>
=C2=A0# define DEV_NULL=C2=A0 =C2=A0&quot;/dev/null&quot;<br>
=C2=A0#else<br>
+# define SOCKET_TIMEOUT 50000<br>
=C2=A0# define CMD_EXEC=C2=A0 =C2=A0&quot;&quot;<br>
=C2=A0# define DEV_STDERR &quot;2&quot;<br>
=C2=A0# define DEV_NULL=C2=A0 =C2=A0&quot;nul&quot;<br>
@@ -108,8 +109,16 @@ static int socket_accept(int sock)<br>
=C2=A0 =C2=A0 =C2=A0struct sockaddr_un addr;<br>
=C2=A0 =C2=A0 =C2=A0socklen_t addrlen;<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* timeout unit of blocking receive calls is different =
among platfoms.<br>
+=C2=A0 =C2=A0 =C2=A0* It&#39;s in seconds on non-Windows platforms but mil=
liseconds on Windows.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+#ifndef _WIN32<br>
=C2=A0 =C2=A0 =C2=A0struct timeval timeout =3D { .tv_sec =3D SOCKET_TIMEOUT=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .tv_usec =3D 0 };<br>
+#else<br>
+=C2=A0 =C2=A0 DWORD timeout =3D SOCKET_TIMEOUT;<br>
+#endif<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (setsockopt(sock, SOL_SOCKET, SO_RCVTIMEO,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void=
 *)&amp;timeout, sizeof(timeout))) {<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000097c44005e79c513c--

