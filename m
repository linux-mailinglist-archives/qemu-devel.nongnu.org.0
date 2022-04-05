Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BE84F2BB5
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 13:17:39 +0200 (CEST)
Received: from localhost ([::1]:49816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbhBq-0008Bw-Ju
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 07:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nbgqT-0002IJ-LU
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 06:55:35 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:46671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nbgqR-0001Ej-Jj
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 06:55:33 -0400
Received: by mail-wr1-x42d.google.com with SMTP id h4so18638446wrc.13
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 03:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AauQ3wG4dRINs5Y/d+wVPVU9cmMeHkq0bs+F/Rk6h3k=;
 b=nIbxFZSoYpWCmRlRU3+PiJxuZJ309UyQnd9OEf4N8jJ3qvt/N2HDVYkmWA6znWkHYd
 SvP/aL5BPCFyR+Jeg9cU/fe+zWlibaRcD7o+uzIgRNF1gxDasrqNUUKau3s8iY2N4ASU
 RK+6c/Fh2MHPeadzw/GuP3QxkEIrWxt0owoSuFUu8fkzMY9LZigTzWmiXxsyqn/x81Ou
 9abJltu7jd+pPbfUMekvTs8CUcuHzHzWc1t6pl0wfLZeKYavO4UD0ckHU8mFzS81GinU
 CY1dhUA9zBxsM6K9+Hx3v1lMqLzXtYLq2X7/XCB2BWZW4CbAXYfQUbzNICbMd3QpUQ7e
 WN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AauQ3wG4dRINs5Y/d+wVPVU9cmMeHkq0bs+F/Rk6h3k=;
 b=Mrhtv0BT64jtM5D3mQfJf5lp8j4bq7BkwJgm+KkOWGAoYQhs2xp0LKJMZXJ/PG/hy0
 N9WuZGCEExUJ1w3c/snJEJ89GVkPuptI4gegRuPpCUVTLpYzNAC09yJAmA8domPEiu/O
 Kd2Wxxm7V4svGQDHHPp2OfUzLCBVEbZAYGNz5pH9a3MQTCL4r7JBMVLfWBwonxhi/fkM
 PhxWqGa3QwrUbFWKPEB5VZds7Ocsg39lyL4AC0YQVHnluA0dIqG6owyQZh1+3kfrDO7H
 3b274I4cQ7+MGwr39eVFCDvkaJCo27GZPSeJ8fIPi9x0lXwDbfFthFcZqJDOh+UKDgsl
 wjgw==
X-Gm-Message-State: AOAM5315c0AiATuft+TI5poQTazh9IlbMoM2eaYA4jRejepWpyuZS8iT
 OOpzFbqCbKrCIeajQ/Vtj+NM273/6LHC/SzHBdc=
X-Google-Smtp-Source: ABdhPJw0Pgs0U+PJed3sf6M5nz8CdInobgrKoFur/xNnRI/9ayzd4aWOkZ2fjHxjzAbnp6vvEY7GEdoEYPtW4Js1Des=
X-Received: by 2002:a05:6000:1449:b0:204:6d5:fb2b with SMTP id
 v9-20020a056000144900b0020406d5fb2bmr2205277wrx.421.1649156128762; Tue, 05
 Apr 2022 03:55:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220405103258.105701-1-mcascell@redhat.com>
In-Reply-To: <20220405103258.105701-1-mcascell@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 5 Apr 2022 14:55:16 +0400
Message-ID: <CAJ+F1CKKyAg-d+3F_H+Q9gBTT0fz5txXkg0bsaRgu=qGkxRN1Q@mail.gmail.com>
Subject: Re: [PATCH] ui/cursor: fix integer overflow in cursor_alloc
 (CVE-2022-4206)
To: Mauro Matteo Cascella <mcascell@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000003bf12c05dbe6154c"
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x42d.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003bf12c05dbe6154c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Apr 5, 2022 at 2:43 PM Mauro Matteo Cascella <mcascell@redhat.com>
wrote:

> Prevent potential integer overflow by limiting 'width' and 'height' to
> 512x512. Also change 'datasize' type to size_t. Refer to security
> advisory https://starlabs.sg/advisories/22-4206/ for more information.
>
> Fixes: CVE-2022-4206
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> ---
>  hw/display/qxl-render.c |  7 +++++++
>  ui/cursor.c             | 12 +++++++++++-
>  2 files changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
> index d28849b121..dc3c4edd05 100644
> --- a/hw/display/qxl-render.c
> +++ b/hw/display/qxl-render.c
> @@ -247,6 +247,13 @@ static QEMUCursor *qxl_cursor(PCIQXLDevice *qxl,
> QXLCursor *cursor,
>      size_t size;
>
>      c =3D cursor_alloc(cursor->header.width, cursor->header.height);
> +
> +    if (!c) {
> +        qxl_set_guest_bug(qxl, "%s: cursor %ux%u alloc error", __func__,
> +                cursor->header.width, cursor->header.height);
> +        goto fail;
> +    }
> +
>      c->hot_x =3D cursor->header.hot_spot_x;
>      c->hot_y =3D cursor->header.hot_spot_y;
>      switch (cursor->header.type) {
> diff --git a/ui/cursor.c b/ui/cursor.c
> index 1d62ddd4d0..7cfb08a030 100644
> --- a/ui/cursor.c
> +++ b/ui/cursor.c
> @@ -46,6 +46,13 @@ static QEMUCursor *cursor_parse_xpm(const char *xpm[])
>
>      /* parse pixel data */
>      c =3D cursor_alloc(width, height);
> +
> +    if (!c) {
> +        fprintf(stderr, "%s: cursor %ux%u alloc error\n",
> +                __func__, width, height);
> +        return NULL;
> +    }
>

I think you could simply abort() in this function. It is used with static
data (ui/cursor*.xpm)

+
>      for (pixel =3D 0, y =3D 0; y < height; y++, line++) {
>          for (x =3D 0; x < height; x++, pixel++) {
>              idx =3D xpm[line][x];
> @@ -91,7 +98,10 @@ QEMUCursor *cursor_builtin_left_ptr(void)
>  QEMUCursor *cursor_alloc(int width, int height)
>  {
>      QEMUCursor *c;
> -    int datasize =3D width * height * sizeof(uint32_t);
> +    size_t datasize =3D width * height * sizeof(uint32_t);
> +
> +    if (width > 512 || height > 512)
> +        return NULL;
>
>      c =3D g_malloc0(sizeof(QEMUCursor) + datasize);
>      c->width  =3D width;
> --
> 2.35.1
>
>
>
lgtm otherwise

--=20
Marc-Andr=C3=A9 Lureau

--0000000000003bf12c05dbe6154c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 5, 2022 at 2:43 PM Maur=
o Matteo Cascella &lt;<a href=3D"mailto:mcascell@redhat.com">mcascell@redha=
t.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Prevent potential integer overflow by limiting &#39;width&#39; and &#3=
9;height&#39; to<br>
512x512. Also change &#39;datasize&#39; type to size_t. Refer to security<b=
r>
advisory <a href=3D"https://starlabs.sg/advisories/22-4206/" rel=3D"norefer=
rer" target=3D"_blank">https://starlabs.sg/advisories/22-4206/</a> for more=
 information.<br>
<br>
Fixes: CVE-2022-4206<br>
Signed-off-by: Mauro Matteo Cascella &lt;<a href=3D"mailto:mcascell@redhat.=
com" target=3D"_blank">mcascell@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/display/qxl-render.c |=C2=A0 7 +++++++<br>
=C2=A0ui/cursor.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 +++++=
++++++-<br>
=C2=A02 files changed, 18 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c<br>
index d28849b121..dc3c4edd05 100644<br>
--- a/hw/display/qxl-render.c<br>
+++ b/hw/display/qxl-render.c<br>
@@ -247,6 +247,13 @@ static QEMUCursor *qxl_cursor(PCIQXLDevice *qxl, QXLCu=
rsor *cursor,<br>
=C2=A0 =C2=A0 =C2=A0size_t size;<br>
<br>
=C2=A0 =C2=A0 =C2=A0c =3D cursor_alloc(cursor-&gt;header.width, cursor-&gt;=
header.height);<br>
+<br>
+=C2=A0 =C2=A0 if (!c) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qxl_set_guest_bug(qxl, &quot;%s: cursor %ux%u =
alloc error&quot;, __func__,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cursor-&gt;header.=
width, cursor-&gt;header.height);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0c-&gt;hot_x =3D cursor-&gt;header.hot_spot_x;<br>
=C2=A0 =C2=A0 =C2=A0c-&gt;hot_y =3D cursor-&gt;header.hot_spot_y;<br>
=C2=A0 =C2=A0 =C2=A0switch (cursor-&gt;header.type) {<br>
diff --git a/ui/cursor.c b/ui/cursor.c<br>
index 1d62ddd4d0..7cfb08a030 100644<br>
--- a/ui/cursor.c<br>
+++ b/ui/cursor.c<br>
@@ -46,6 +46,13 @@ static QEMUCursor *cursor_parse_xpm(const char *xpm[])<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0/* parse pixel data */<br>
=C2=A0 =C2=A0 =C2=A0c =3D cursor_alloc(width, height);<br>
+<br>
+=C2=A0 =C2=A0 if (!c) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;%s: cursor %ux%u alloc e=
rror\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__, width, h=
eight);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>I think you could simp=
ly abort() in this function. It is used with static data (ui/cursor*.xpm) <=
br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
=C2=A0 =C2=A0 =C2=A0for (pixel =3D 0, y =3D 0; y &lt; height; y++, line++) =
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (x =3D 0; x &lt; height; x++, pixel++=
) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0idx =3D xpm[line][x];<br>
@@ -91,7 +98,10 @@ QEMUCursor *cursor_builtin_left_ptr(void)<br>
=C2=A0QEMUCursor *cursor_alloc(int width, int height)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0QEMUCursor *c;<br>
-=C2=A0 =C2=A0 int datasize =3D width * height * sizeof(uint32_t);<br>
+=C2=A0 =C2=A0 size_t datasize =3D width * height * sizeof(uint32_t);<br>
+<br>
+=C2=A0 =C2=A0 if (width &gt; 512 || height &gt; 512)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
<br>
=C2=A0 =C2=A0 =C2=A0c =3D g_malloc0(sizeof(QEMUCursor) + datasize);<br>
=C2=A0 =C2=A0 =C2=A0c-&gt;width=C2=A0 =3D width;<br>
-- <br>
2.35.1<br>
<br>
<br>
</blockquote></div><div><br></div><div>lgtm otherwise<br></div><br>-- <br><=
div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div><=
/div>

--0000000000003bf12c05dbe6154c--

