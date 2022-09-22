Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9374A5E6CDA
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 22:15:44 +0200 (CEST)
Received: from localhost ([::1]:48926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obSbn-0006V8-NV
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 16:15:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obSZq-000574-BA
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 16:13:42 -0400
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:40555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obSZo-0007Es-G4
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 16:13:42 -0400
Received: by mail-lj1-x22a.google.com with SMTP id g20so11115067ljg.7
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 13:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ek8Ty5qOjw1+xJspoFjaQOhrRUjDtw6Pw6tqhjFFhnY=;
 b=hcVRuECGPQvuO4a4gQZ/dy2mFYf6YHi387i3qgiILGIyCU/bfANemaftqgntmierak
 u97R3+BMfDwfHxfsUtwLWe360rkNq3eImqCXl61TmpPPZBwjP8kQmO26kBYw2Jmz9DqA
 rY7WgZqxxkRnUCOqTATfKYaog4KNng13Sjj/xeN6flUNSUO4SLYV/7cGlGwBUUVsXkTz
 crW93VcRgVpFC6QHyxC/B3z7lavScQiaAg1ZMdoKyYOa2guFZ8sZt4bKPSEdiMEJEpvz
 COJXPKS8F+OL7Pqiu7HvWuaKLghENEAEk8JSVPbsXlmPc/KkE6xrYow3Mk8EfRQDebT5
 rnqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ek8Ty5qOjw1+xJspoFjaQOhrRUjDtw6Pw6tqhjFFhnY=;
 b=bDkm+Vt976QiR/sograMvSW6MEVAj7pOGvqLcDadO58BL1CpyFn+IgDvcnPZB5Hfcl
 yU71olC2UyDT+1dO514LE9xIfRh0bCatJyEWsF5c9pyeYhnF61D8ZmjU5EYd5dILQO1v
 8rljaeU1Ttnq7dCW8sOSxJuvCFPMaaTwAO3rtAhym4vsTgpemcmsNBjh2JbQB3qfu7Y3
 1V8BGVEunipoDu5o2pLQA3Jq38TPlOicPexwnD1T8Fy19RgiGxNU99xvxUlA54Ykz/Lm
 fZPVXgvIxLlohiA1Jk/sgvWLi5tqBis6XEGqK+ly32aMD3yeWH8IWQNdbolIDtygJ7oI
 Orlw==
X-Gm-Message-State: ACrzQf33hncv5/u9T7aacS0GaZCgjEMZLu5JqfRRx0WjEakPt6OGX/RC
 aMTvW9H2YAyVuwr+n+zMuv6H5BR4iKmaPONsDXs=
X-Google-Smtp-Source: AMsMyM5QMbXHZDnz1K/zyzzBK0Vgrk3vEJyiO/AP9BEruz5G+FNGVnA5o37Wg64jZ8Oxpo9y+pNP3MnMS868X6i/4XU=
X-Received: by 2002:a2e:95cd:0:b0:26c:3bb0:289f with SMTP id
 y13-20020a2e95cd000000b0026c3bb0289fmr1674920ljh.449.1663877618107; Thu, 22
 Sep 2022 13:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-34-bmeng.cn@gmail.com>
In-Reply-To: <20220920103159.1865256-34-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 22 Sep 2022 22:13:26 +0200
Message-ID: <CAJ+F1CLMmvE0RBEWGX9nBBTmdwNX3efr9jySeMoUEVHy9wdz4g@mail.gmail.com>
Subject: Re: [PATCH v2 33/39] io/channel-watch: Drop the unnecessary cast
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000608f6205e949b290"
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000608f6205e949b290
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 20, 2022 at 2:56 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> There is no need to do a type cast on ssource->socket as it is
> already declared as a SOCKET.
>
> Suggested-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>
> Changes in v2:
> - new patch: "io/channel-watch: Drop the unnecessary cast"
>
>  io/channel-watch.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/io/channel-watch.c b/io/channel-watch.c
> index 89f3c8a88a..43d38494f7 100644
> --- a/io/channel-watch.c
> +++ b/io/channel-watch.c
> @@ -130,13 +130,13 @@ qio_channel_socket_source_check(GSource *source)
>      FD_ZERO(&wfds);
>      FD_ZERO(&xfds);
>      if (ssource->condition & G_IO_IN) {
> -        FD_SET((SOCKET)ssource->socket, &rfds);
> +        FD_SET(ssource->socket, &rfds);
>      }
>      if (ssource->condition & G_IO_OUT) {
> -        FD_SET((SOCKET)ssource->socket, &wfds);
> +        FD_SET(ssource->socket, &wfds);
>      }
>      if (ssource->condition & G_IO_PRI) {
> -        FD_SET((SOCKET)ssource->socket, &xfds);
> +        FD_SET(ssource->socket, &xfds);
>      }
>      ssource->revents =3D 0;
>      if (select(0, &rfds, &wfds, &xfds, &tv0) =3D=3D 0) {
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000608f6205e949b290
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 20, 2022 at 2:56 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin M=
eng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.men=
g@windriver.com</a>&gt;<br>
<br>
There is no need to do a type cast on ssource-&gt;socket as it is<br>
already declared as a SOCKET.<br>
<br>
Suggested-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau=
@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;</div=
><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
Changes in v2:<br>
- new patch: &quot;io/channel-watch: Drop the unnecessary cast&quot;<br>
<br>
=C2=A0io/channel-watch.c | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/io/channel-watch.c b/io/channel-watch.c<br>
index 89f3c8a88a..43d38494f7 100644<br>
--- a/io/channel-watch.c<br>
+++ b/io/channel-watch.c<br>
@@ -130,13 +130,13 @@ qio_channel_socket_source_check(GSource *source)<br>
=C2=A0 =C2=A0 =C2=A0FD_ZERO(&amp;wfds);<br>
=C2=A0 =C2=A0 =C2=A0FD_ZERO(&amp;xfds);<br>
=C2=A0 =C2=A0 =C2=A0if (ssource-&gt;condition &amp; G_IO_IN) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 FD_SET((SOCKET)ssource-&gt;socket, &amp;rfds);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 FD_SET(ssource-&gt;socket, &amp;rfds);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (ssource-&gt;condition &amp; G_IO_OUT) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 FD_SET((SOCKET)ssource-&gt;socket, &amp;wfds);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 FD_SET(ssource-&gt;socket, &amp;wfds);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (ssource-&gt;condition &amp; G_IO_PRI) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 FD_SET((SOCKET)ssource-&gt;socket, &amp;xfds);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 FD_SET(ssource-&gt;socket, &amp;xfds);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0ssource-&gt;revents =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0if (select(0, &amp;rfds, &amp;wfds, &amp;xfds, &amp;tv0=
) =3D=3D 0) {<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000608f6205e949b290--

