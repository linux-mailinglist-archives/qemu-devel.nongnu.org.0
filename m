Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A98144F7B77
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 11:21:08 +0200 (CEST)
Received: from localhost ([::1]:51444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncOK9-0005kH-IJ
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 05:21:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ncOGw-0003Yo-3L
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 05:17:46 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ncOGt-0005bK-Vs
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 05:17:45 -0400
Received: by mail-wr1-x42e.google.com with SMTP id q19so6882473wrc.6
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 02:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/k/5qvv0po7FIIebYswooS7iGbahta8EOHx8UchG/Qg=;
 b=Xgq8nUQAHWJ6DLdJQ3LHVB/S39lAFahel64PU0d4gS6salu96KrixlylC+A5jmmANc
 TFNeyq/qttZFpUvVKwpaJFF0uIWCNiizIqjqtz/e/0+OTZEgsHf2IGrDjKRw2p+BsPKF
 VeLpUGuM5QpYmQ0sGi20sXoFAiQssOcBG/rwie7YcUY6Aj7XFOiAhnWbDeNLhkDZT2PT
 OQO492m1sBkZF3fjD8y5+IeG58x+SSK3mYqB/j25aG0B50q8uFKpfahKt1a7Mrmmr0WG
 d2CC1tPm1P9fI+TLxFOCHyONydcXlPlKWF5xqIIVvbqcj+QTUTdW6cVNmJvWZbLMQN2H
 w05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/k/5qvv0po7FIIebYswooS7iGbahta8EOHx8UchG/Qg=;
 b=iX2NVL7iDGOLl/tLbyno71Tn+r5MQlPw4RkjUGcOTL902QexR/QFeKjnzZK/WTFCv6
 aVtBXvIFvdPVdgCvhTtsQq1OXdkV06v1K5L9e+bR6mIzsWGRrDR55RCZbmmgKt3UReAv
 Vf7rtl2Y96K4LkRV+d6pG/JAvhKKb+tQa9v/xZNaWZHjeKMiuoZDxp0j98zEH7CRX7In
 hK8rQo6XFKAGk9Ui8Q5V2S94U4GKO9YHWV8J4PhX3n5W/372JIaU1bjtDBzOEs0o+NPQ
 Vw0A8bJYQ2ZyCO5MYdyLXwZfdXnFbEKvrhfTgMnxsKi4M4BOrBdwsNA6GzRk+EKqtV2p
 LtKQ==
X-Gm-Message-State: AOAM531+UMH2eS0yYp27V0c3aY4b7C/ESurgBPStm5zCGZS5n31sy5DG
 zQWskDVysHKJdkgImnCBj8C2j/Jo9mQ+66er7pgVFU4sy0m0vA==
X-Google-Smtp-Source: ABdhPJynj4wSPKo7Qlg3L1STeHcRdsSpj4++ooABlT6vEQvnBymQ4oz14bQJ3BtM2sy9gi2/EUYcyHb/GakzJtNw0/Q=
X-Received: by 2002:a5d:6f08:0:b0:206:3ce:4f01 with SMTP id
 ay8-20020a5d6f08000000b0020603ce4f01mr9968674wrb.529.1649323061459; Thu, 07
 Apr 2022 02:17:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220407081712.345609-1-mcascell@redhat.com>
In-Reply-To: <20220407081712.345609-1-mcascell@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 7 Apr 2022 13:17:28 +0400
Message-ID: <CAJ+F1C+HB5Nbsjk4E-KgFQEpyAWFaCkJvswMQj1yu4Rm-rOQ-g@mail.gmail.com>
Subject: Re: [PATCH v3] ui/cursor: fix integer overflow in cursor_alloc
 (CVE-2021-4206)
To: Mauro Matteo Cascella <mcascell@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000032bee205dc0cf3f2"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x42e.google.com
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

--00000000000032bee205dc0cf3f2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 7, 2022 at 12:23 PM Mauro Matteo Cascella <mcascell@redhat.com>
wrote:

> Prevent potential integer overflow by limiting 'width' and 'height' to
> 512x512. Also change 'datasize' type to size_t. Refer to security
> advisory https://starlabs.sg/advisories/22-4206/ for more information.
>
> Fixes: CVE-2021-4206
>

(the Starlabs advisory has 2022, I guess it's wrong then)

Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
> v3:
> - fix CVE id (CVE-2021-4206 instead of CVE-2022-4206)
>
>  hw/display/qxl-render.c | 7 +++++++
>  hw/display/vmware_vga.c | 2 ++
>  ui/cursor.c             | 8 +++++++-
>  3 files changed, 16 insertions(+), 1 deletion(-)
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
> diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
> index 98c83474ad..45d06cbe25 100644
> --- a/hw/display/vmware_vga.c
> +++ b/hw/display/vmware_vga.c
> @@ -515,6 +515,8 @@ static inline void vmsvga_cursor_define(struct
> vmsvga_state_s *s,
>      int i, pixels;
>
>      qc =3D cursor_alloc(c->width, c->height);
> +    assert(qc !=3D NULL);
> +
>      qc->hot_x =3D c->hot_x;
>      qc->hot_y =3D c->hot_y;
>      switch (c->bpp) {
> diff --git a/ui/cursor.c b/ui/cursor.c
> index 1d62ddd4d0..835f0802f9 100644
> --- a/ui/cursor.c
> +++ b/ui/cursor.c
> @@ -46,6 +46,8 @@ static QEMUCursor *cursor_parse_xpm(const char *xpm[])
>
>      /* parse pixel data */
>      c =3D cursor_alloc(width, height);
> +    assert(c !=3D NULL);
> +
>      for (pixel =3D 0, y =3D 0; y < height; y++, line++) {
>          for (x =3D 0; x < height; x++, pixel++) {
>              idx =3D xpm[line][x];
> @@ -91,7 +93,11 @@ QEMUCursor *cursor_builtin_left_ptr(void)
>  QEMUCursor *cursor_alloc(int width, int height)
>  {
>      QEMUCursor *c;
> -    int datasize =3D width * height * sizeof(uint32_t);
> +    size_t datasize =3D width * height * sizeof(uint32_t);
> +
> +    if (width > 512 || height > 512) {
> +        return NULL;
> +    }
>
>      c =3D g_malloc0(sizeof(QEMUCursor) + datasize);
>      c->width  =3D width;
> --
> 2.35.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000032bee205dc0cf3f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 7, 2022 at 12:23 PM Mauro=
 Matteo Cascella &lt;<a href=3D"mailto:mcascell@redhat.com">mcascell@redhat=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Prevent potential integer overflow by limiting &#39;width&#39; and &#39=
;height&#39; to<br>
512x512. Also change &#39;datasize&#39; type to size_t. Refer to security<b=
r>
advisory <a href=3D"https://starlabs.sg/advisories/22-4206/" rel=3D"norefer=
rer" target=3D"_blank">https://starlabs.sg/advisories/22-4206/</a> for more=
 information.<br>
<br>
Fixes: CVE-2021-4206<br></blockquote><div><br></div><div>(the Starlabs advi=
sory has 2022, I guess it&#39;s wrong then)</div><div><br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Mauro Matteo Cascella &lt;<a href=3D"mailto:mcascell@redhat.=
com" target=3D"_blank">mcascell@redhat.com</a>&gt;<br></blockquote><div><br=
></div><div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:=
marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=
<br></div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
v3:<br>
- fix CVE id (CVE-2021-4206 instead of CVE-2022-4206)<br>
<br>
=C2=A0hw/display/qxl-render.c | 7 +++++++<br>
=C2=A0hw/display/vmware_vga.c | 2 ++<br>
=C2=A0ui/cursor.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 8 ++++++=
+-<br>
=C2=A03 files changed, 16 insertions(+), 1 deletion(-)<br>
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
diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c<br>
index 98c83474ad..45d06cbe25 100644<br>
--- a/hw/display/vmware_vga.c<br>
+++ b/hw/display/vmware_vga.c<br>
@@ -515,6 +515,8 @@ static inline void vmsvga_cursor_define(struct vmsvga_s=
tate_s *s,<br>
=C2=A0 =C2=A0 =C2=A0int i, pixels;<br>
<br>
=C2=A0 =C2=A0 =C2=A0qc =3D cursor_alloc(c-&gt;width, c-&gt;height);<br>
+=C2=A0 =C2=A0 assert(qc !=3D NULL);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0qc-&gt;hot_x =3D c-&gt;hot_x;<br>
=C2=A0 =C2=A0 =C2=A0qc-&gt;hot_y =3D c-&gt;hot_y;<br>
=C2=A0 =C2=A0 =C2=A0switch (c-&gt;bpp) {<br>
diff --git a/ui/cursor.c b/ui/cursor.c<br>
index 1d62ddd4d0..835f0802f9 100644<br>
--- a/ui/cursor.c<br>
+++ b/ui/cursor.c<br>
@@ -46,6 +46,8 @@ static QEMUCursor *cursor_parse_xpm(const char *xpm[])<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0/* parse pixel data */<br>
=C2=A0 =C2=A0 =C2=A0c =3D cursor_alloc(width, height);<br>
+=C2=A0 =C2=A0 assert(c !=3D NULL);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0for (pixel =3D 0, y =3D 0; y &lt; height; y++, line++) =
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (x =3D 0; x &lt; height; x++, pixel++=
) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0idx =3D xpm[line][x];<br>
@@ -91,7 +93,11 @@ QEMUCursor *cursor_builtin_left_ptr(void)<br>
=C2=A0QEMUCursor *cursor_alloc(int width, int height)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0QEMUCursor *c;<br>
-=C2=A0 =C2=A0 int datasize =3D width * height * sizeof(uint32_t);<br>
+=C2=A0 =C2=A0 size_t datasize =3D width * height * sizeof(uint32_t);<br>
+<br>
+=C2=A0 =C2=A0 if (width &gt; 512 || height &gt; 512) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0c =3D g_malloc0(sizeof(QEMUCursor) + datasize);<br>
=C2=A0 =C2=A0 =C2=A0c-&gt;width=C2=A0 =3D width;<br>
-- <br>
2.35.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000032bee205dc0cf3f2--

