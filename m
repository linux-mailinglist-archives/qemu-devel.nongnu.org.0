Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EFF5A96EA
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 14:31:08 +0200 (CEST)
Received: from localhost ([::1]:40806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTjLf-0007F0-Bf
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 08:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTiek-0000DI-Ud
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 07:46:47 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:44626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTiei-0000xZ-Tm
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 07:46:46 -0400
Received: by mail-lf1-x129.google.com with SMTP id g7so7050577lfe.11
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 04:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=I+6Ir3rQp/2WlWsU362rJmsaMCbX21JRRrMjwKHqPXM=;
 b=Z6SccB3rTbbTFxgiVwEAq1w1tVe9Zm6aiVc/HcPon1J26oG3c+BRskOHdYOgDKk9be
 LVacI5vXVBFrlfa0y8ukNmkpdrQdQkZ4u4iLSMMC1gVz/pg8Uvu3bqyZd7wE2LgD2DR/
 qZ17YQc3q4UHNM7r3okRPNjcg6bMXSB/PVjPKuN/CQvEWDwDpwcAkTaKGlGWZNGtZrf4
 kZWqbSYjye+OfEwD5Zx/sVfdFQFOWsVTjQZ4+SG6W06iPEraMJNwGrySI6p7O7wertK3
 rDCqsLuuCv6QYGzznRjOqg9KD7tiOqHZxMy2Ls6iy3AOHmnqiNHFn/LZbd9CQn550uvL
 o9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=I+6Ir3rQp/2WlWsU362rJmsaMCbX21JRRrMjwKHqPXM=;
 b=qBH569alEojAAyY2rf/RSU+4zjqYWjtFMIwX73BDsg1PgTyEqd9dWUJfbdymRYeMwa
 y0izKm+/v4LZLdPBU4BiBUaEPi5HgyzEQkwq3XToWJ+mh9AF6MeDlA4hkwYqIdcgiro7
 wEdoZXkhFJLdATZdrdEHIyzXy3L4VyN+kmORlQK9LnDspbuNP7jHszgFj0IQXokJw9RK
 QqQUvDmmDKdIYgeNvzVIwXy2fZwvWO/JOM5uJhdv00ttipfEzj+c9mQF2SIdhMO9lwfM
 4qwz7xofHQgKyXk6NpDjFS23706NR5wkFix8liT2C+fFVTqNPFa96Mmefy9f+1qmCD1x
 GNUQ==
X-Gm-Message-State: ACgBeo2AN7w5nfC3vZ0nb7v5jNP+ZKcSmpyr3njA7UkAGXPr/kb1m6oJ
 9OAoybAUjV5dih8mMM5t0zw6fz80vWJhmM5slPY=
X-Google-Smtp-Source: AA6agR5Hj8WqE4Mwf99drat2F4b1KEGf40faJaXJ9JhO14AZJZ2trDWgrmu5wpGNIq/D8MB81b/P4D4TSuAlCx3q14k=
X-Received: by 2002:a05:6512:1395:b0:48d:81c:5159 with SMTP id
 p21-20020a056512139500b0048d081c5159mr12015731lfa.375.1662032803326; Thu, 01
 Sep 2022 04:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-47-bmeng.cn@gmail.com>
In-Reply-To: <20220824094029.1634519-47-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 1 Sep 2022 15:46:31 +0400
Message-ID: <CAJ+F1CJQOpT3bNJ-UiDm_woppH020ps2+QcxZ65eTyLHqjQECw@mail.gmail.com>
Subject: Re: [PATCH 46/51] tests/qtest: libqtest: Replace the call to close a
 socket with closesocket()
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d8f23005e79c2afd"
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x129.google.com
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

--000000000000d8f23005e79c2afd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2022 at 3:09 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> close() is a *nix function. It works on any file descriptor, and
> sockets in *nix are an example of a file descriptor.
>
> closesocket() is a Windows-specific function, which works only
> specifically with sockets. Sockets on Windows do not use *nix-style
> file descriptors, and socket() returns a handle to a kernel object
> instead, so it must be closed with closesocket().
>
> In QEMU there is already a logic to handle such platform difference
> in os-posix.h and os-win32.h, that:
>
>   * closesocket maps to close on POSIX
>   * closesocket maps to a wrapper that calls the real closesocket()
>     on Windows
>
> Replace the call to close a socket with closesocket() instead.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>
>  tests/qtest/libqtest.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 99e52ff571..918f4657ed 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -115,7 +115,7 @@ static int socket_accept(int sock)
>                     (void *)&timeout, sizeof(timeout))) {
>          fprintf(stderr, "%s failed to set SO_RCVTIMEO: %s\n",
>                  __func__, strerror(errno));
> -        close(sock);
> +        closesocket(sock);
>          return -1;
>      }
>
> @@ -126,7 +126,7 @@ static int socket_accept(int sock)
>      if (ret =3D=3D -1) {
>          fprintf(stderr, "%s failed: %s\n", __func__, strerror(errno));
>      }
> -    close(sock);
> +    closesocket(sock);
>
>      return ret;
>  }
> @@ -512,8 +512,8 @@ void qtest_quit(QTestState *s)
>      qtest_remove_abrt_handler(s);
>
>      qtest_kill_qemu(s);
> -    close(s->fd);
> -    close(s->qmp_fd);
> +    closesocket(s->fd);
> +    closesocket(s->qmp_fd);
>      g_string_free(s->rx, true);
>
>      for (GList *it =3D s->pending_events; it !=3D NULL; it =3D it->next)=
 {
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000d8f23005e79c2afd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 24, 2022 at 3:09 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin M=
eng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.men=
g@windriver.com</a>&gt;<br>
<br>
close() is a *nix function. It works on any file descriptor, and<br>
sockets in *nix are an example of a file descriptor.<br>
<br>
closesocket() is a Windows-specific function, which works only<br>
specifically with sockets. Sockets on Windows do not use *nix-style<br>
file descriptors, and socket() returns a handle to a kernel object<br>
instead, so it must be closed with closesocket().<br>
<br>
In QEMU there is already a logic to handle such platform difference<br>
in os-posix.h and os-win32.h, that:<br>
<br>
=C2=A0 * closesocket maps to close on POSIX<br>
=C2=A0 * closesocket maps to a wrapper that calls the real closesocket()<br=
>
=C2=A0 =C2=A0 on Windows<br>
<br>
Replace the call to close a socket with closesocket() instead.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
=C2=A0tests/qtest/libqtest.c | 8 ++++----<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c<br>
index 99e52ff571..918f4657ed 100644<br>
--- a/tests/qtest/libqtest.c<br>
+++ b/tests/qtest/libqtest.c<br>
@@ -115,7 +115,7 @@ static int socket_accept(int sock)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void=
 *)&amp;timeout, sizeof(timeout))) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;%s failed to set SO=
_RCVTIMEO: %s\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__func__, str=
error(errno));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(sock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 closesocket(sock);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -126,7 +126,7 @@ static int socket_accept(int sock)<br>
=C2=A0 =C2=A0 =C2=A0if (ret =3D=3D -1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;%s failed: %s\n&quo=
t;, __func__, strerror(errno));<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 close(sock);<br>
+=C2=A0 =C2=A0 closesocket(sock);<br>
<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
@@ -512,8 +512,8 @@ void qtest_quit(QTestState *s)<br>
=C2=A0 =C2=A0 =C2=A0qtest_remove_abrt_handler(s);<br>
<br>
=C2=A0 =C2=A0 =C2=A0qtest_kill_qemu(s);<br>
-=C2=A0 =C2=A0 close(s-&gt;fd);<br>
-=C2=A0 =C2=A0 close(s-&gt;qmp_fd);<br>
+=C2=A0 =C2=A0 closesocket(s-&gt;fd);<br>
+=C2=A0 =C2=A0 closesocket(s-&gt;qmp_fd);<br>
=C2=A0 =C2=A0 =C2=A0g_string_free(s-&gt;rx, true);<br>
<br>
=C2=A0 =C2=A0 =C2=A0for (GList *it =3D s-&gt;pending_events; it !=3D NULL; =
it =3D it-&gt;next) {<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000d8f23005e79c2afd--

