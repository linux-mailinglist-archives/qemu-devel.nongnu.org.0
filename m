Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 878733FE0E3
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 19:06:16 +0200 (CEST)
Received: from localhost ([::1]:54100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLTgl-0007ey-Kf
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 13:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mLTQK-0002Vv-83
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:49:16 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:44658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mLTQF-0002SW-Jr
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:49:15 -0400
Received: by mail-ej1-x633.google.com with SMTP id me10so380525ejb.11
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 09:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NwnVe5j1aN/j6Opq6HEiASCNI55OdWg13Vq7pMyVqZY=;
 b=dddmL1M28Pl3Q2FLGs5T293PgMv+KKd3mkVnIzVANVl5MzIrwp58Q58zlvRGLkEVPp
 MemaMgtztiDNIENMA9tbpv/1Jv22WALhM/rSD1DxkYKounc/8ESqzG52yGKyIGOLTFjp
 A9oZQ8ADwskFF+XvbA7B44V/Nn+tMEm2bzxNV2xpCZlQGA71IP+YgA3raeGlOC87h9Gi
 cqdTI4TzAOWa+ztKt7lZWTto+UXQ5X6qtQ+7riRpmWPphulNFJRvpQrJLM84gQgooFT7
 w1UbxHMR+wloEMsIGjug7ywmATWwQ0QXLO6ykqUOwdt+fuTCvxPGm8dVk0L1YHLXMcxt
 MmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NwnVe5j1aN/j6Opq6HEiASCNI55OdWg13Vq7pMyVqZY=;
 b=Ftnr1fW0AUOfWVhZaKQE//BPo6Ia0MZsvLJfpTWtowh0+R49BgO9tlyhZk1rpSuBP0
 ICs3L295UAzmEjhadvf0so55zln3jCveMKvY/8C2icp1NltKy+J+0u0wKXnyFuSbr/V7
 yqjv9hkNtYoa2/EkDP2srWRzLjlrx0xa6Ye3r3T2WNIQo3zYnspycv1pEaqGfolK0/ix
 kJxrZ+YhK2+7e+SbikdmS42bso1hipp/myEToSWtU7NmWuhB7CG5Qpc1ze7zLrdflpi9
 iNQReEP6Ia9jZqNp4F1xcizO7bMDwQcsVPYmdCJx/NbeMwNVM4JGIW/WeE0QtroS5mDF
 /z5A==
X-Gm-Message-State: AOAM5319LRHPFkggkiUzlIxFVv4CfJtUgZTy4529WxAgoJYkalbm29U1
 LWABqRm+iqv7xm5TiYpNVQ4YBgNoGvPVZXA0r6zort5QJcY=
X-Google-Smtp-Source: ABdhPJx+n2IAWkOHz7dig+4EebyLLEpmOIbIHGqXefW5vpd4fR0whhGFc1l1VJoQO1NCTHA1Ol/aNj3C6tqcW5sCihA=
X-Received: by 2002:a17:906:9742:: with SMTP id
 o2mr412176ejy.532.1630514949301; 
 Wed, 01 Sep 2021 09:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210901152632.25511-1-peter.maydell@linaro.org>
In-Reply-To: <20210901152632.25511-1-peter.maydell@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 1 Sep 2021 20:48:57 +0400
Message-ID: <CAJ+F1CJok+8MvmLLgwb10=+Pz=YetZBBQbuYaHu_5gLSR-hydA@mail.gmail.com>
Subject: Re: [PATCH] tests/vhost-user-bridge.c: Sanity check socket path length
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000005aabb505caf1d8eb"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: QEMU <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005aabb505caf1d8eb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 1, 2021 at 8:36 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> The vhost-user-bridge binary accepts a UNIX socket path on
> the command line. Sanity check that this is short enough to
> fit into a sockaddr_un before copying it in.
>
> Fixes: Coverity CID 1432866
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  tests/vhost-user-bridge.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/tests/vhost-user-bridge.c b/tests/vhost-user-bridge.c
> index 24815920b2b..cb009545fa5 100644
> --- a/tests/vhost-user-bridge.c
> +++ b/tests/vhost-user-bridge.c
> @@ -540,6 +540,11 @@ vubr_new(const char *path, bool client)
>      CallbackFunc cb;
>      size_t len;
>
> +    if (strlen(path) >=3D sizeof(un.sun_path)) {
> +        fprintf(stderr, "unix domain socket path '%s' is too long\n",
> path);
> +        exit(1);
> +    }
> +
>      /* Get a UNIX socket. */
>      dev->sock =3D socket(AF_UNIX, SOCK_STREAM, 0);
>      if (dev->sock =3D=3D -1) {
> --
> 2.20.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000005aabb505caf1d8eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 1, 2021 at 8:36 PM Peter =
Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">The vhost-user-bridge binary accepts a UNIX socket path on<br>
the command line. Sanity check that this is short enough to<br>
fit into a sockaddr_un before copying it in.<br>
<br>
Fixes: Coverity CID 1432866<br>
Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br></blockquote><div><=
br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:mar=
candre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div> <b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0tests/vhost-user-bridge.c | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/tests/vhost-user-bridge.c b/tests/vhost-user-bridge.c<br>
index 24815920b2b..cb009545fa5 100644<br>
--- a/tests/vhost-user-bridge.c<br>
+++ b/tests/vhost-user-bridge.c<br>
@@ -540,6 +540,11 @@ vubr_new(const char *path, bool client)<br>
=C2=A0 =C2=A0 =C2=A0CallbackFunc cb;<br>
=C2=A0 =C2=A0 =C2=A0size_t len;<br>
<br>
+=C2=A0 =C2=A0 if (strlen(path) &gt;=3D sizeof(un.sun_path)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;unix domain socket path =
&#39;%s&#39; is too long\n&quot;, path);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* Get a UNIX socket. */<br>
=C2=A0 =C2=A0 =C2=A0dev-&gt;sock =3D socket(AF_UNIX, SOCK_STREAM, 0);<br>
=C2=A0 =C2=A0 =C2=A0if (dev-&gt;sock =3D=3D -1) {<br>
-- <br>
2.20.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000005aabb505caf1d8eb--

