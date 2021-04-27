Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0ACF36C8EF
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 17:56:35 +0200 (CEST)
Received: from localhost ([::1]:55754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbQ4g-0007Oq-RV
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 11:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lbQ2U-0005Ag-5C
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 11:54:18 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:43894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lbQ2P-0002fy-K2
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 11:54:17 -0400
Received: by mail-ed1-x52f.google.com with SMTP id e7so70465827edu.10
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 08:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7so0jgmm0bM+jRmFds1yCGRURKJlI+UcklCyCBG34ZA=;
 b=UO5neJipV89MGw4CAzHjB7FB0z57DXFaqv5Cjj0gl5q+zO9+twbU6htbmbEfpYhG3R
 0OA0q5t55c3fmU1brClAcOXj55e6NxXGhhcwLkoQ5FMu0lY7sI4FUjRMzacEwByeq2W6
 jaVm69zliAbF2GjV1+6uRLsJJx+BwmBJWQbz0I50HpcKqDwpOCdcrvf/NBDz14JHqR9J
 ZiJB7ffukA89HgPKhGhIdgccqPfCszgMAmYCl7x7i/TPYyMjTf6P8dqq5a1L+xk7vJyy
 PiBFl49WWDXfkeNig9xmmZde4d16t9Br0DuG6i+ksIgWyCUIfyQLKWkxuhTRGkaPAcdI
 H3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7so0jgmm0bM+jRmFds1yCGRURKJlI+UcklCyCBG34ZA=;
 b=hRCR3Z9yT9XkQLpmv0QyRXRxImSiO+8murgLuZcqClHnJNlsJXmVAJgHKwbAw7BCzu
 uNwkWih0PlqC+hLaqMb61HU6vjJZCdQFbtTA7Tv283wlf29gKxF1ztqGXAnMEiimUL9R
 1/5FGHXo4AVr3bZF//FU1zPOgGSOAa6mBUznp8klgS/aS6VbQ6v0pVjsmNg50lHqJfSy
 NLQh2AJO/gZhbo+UpM3yo0CrT0vjuZBukdjIORoSKQXb26DM9mo+5jwGxdP2WGyWDngY
 gDswJoaArPA2LhJn1KtyOaYhxaXosxlOThBGbIwVQ+NOkkijGs3hBZD6JqPbdVWXiV2J
 ttFw==
X-Gm-Message-State: AOAM531Pkybs/Tq5OxSkGxIO2KTCcURDy91XSvKANxbB0a2ncJojE+0r
 cvlYAEZlHMJEDEvqEc9ShUHsJRHiP7D9AbolxXCfij5n7y4YQQ==
X-Google-Smtp-Source: ABdhPJwtktGhMn5CseL+g20WZmnZSgOyVklqgYFokseEljM54AwDO5BMN1fFoKLrRxCjD7llOkRi3/Sfo6CS0kD1Pd4=
X-Received: by 2002:aa7:dbd3:: with SMTP id v19mr5211568edt.314.1619538851981; 
 Tue, 27 Apr 2021 08:54:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210427150824.638359-1-kraxel@redhat.com>
 <20210427150824.638359-4-kraxel@redhat.com>
In-Reply-To: <20210427150824.638359-4-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 27 Apr 2021 19:54:00 +0400
Message-ID: <CAJ+F1CK4i97gBGTMLzJYG9Ebn-rmOLVKaZ=v+T9-RsqNS8-uBA@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] edid: move xtra3 descriptor
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f8ebe705c0f64560"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52f.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f8ebe705c0f64560
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 27, 2021 at 7:20 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> Initialize the "Established timings III" block earlier.  Also move up
> edid_fill_modes().  That'll make sure the offset for the additional
> descriptors in the dta block don't move any more, which in turn makes it
> easier to actually use them.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  hw/display/edid-generate.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/hw/display/edid-generate.c b/hw/display/edid-generate.c
> index ae34999f9eb5..25f790c7bd85 100644
> --- a/hw/display/edid-generate.c
> +++ b/hw/display/edid-generate.c
> @@ -416,25 +416,28 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
>                       width_mm, height_mm);
>      desc =3D edid_desc_next(edid, dta, desc);
>
> +    xtra3 =3D desc;
> +    edid_desc_xtra3_std(xtra3);
> +    desc =3D edid_desc_next(edid, dta, desc);
> +    edid_fill_modes(edid, xtra3, dta, info->maxx, info->maxy);
> +    /*
> +     * dta video data block is finished at thus point,
> +     * so dta descriptor offsets don't move any more.
> +     */
> +
>      edid_desc_ranges(desc);
>      desc =3D edid_desc_next(edid, dta, desc);
>
> -    if (info->name) {
> +    if (desc && info->name) {
>          edid_desc_text(desc, 0xfc, info->name);
>          desc =3D edid_desc_next(edid, dta, desc);
>      }
>
> -    if (info->serial) {
> +    if (desc && info->serial) {
>          edid_desc_text(desc, 0xff, info->serial);
>          desc =3D edid_desc_next(edid, dta, desc);
>      }
>
> -    if (desc) {
> -        xtra3 =3D desc;
> -        edid_desc_xtra3_std(xtra3);
> -        desc =3D edid_desc_next(edid, dta, desc);
> -    }
> -
>      while (desc) {
>          edid_desc_dummy(desc);
>          desc =3D edid_desc_next(edid, dta, desc);
> @@ -442,7 +445,6 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
>
>      /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D finish up =3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
>
> -    edid_fill_modes(edid, xtra3, dta, info->maxx, info->maxy);
>      edid_checksum(edid);
>      if (dta) {
>          edid_checksum(dta);
> --
> 2.30.2
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000f8ebe705c0f64560
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 27, 2021 at 7:20 PM Gerd =
Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Initiali=
ze the &quot;Established timings III&quot; block earlier.=C2=A0 Also move u=
p<br>
edid_fill_modes().=C2=A0 That&#39;ll make sure the offset for the additiona=
l<br>
descriptors in the dta block don&#39;t move any more, which in turn makes i=
t<br>
easier to actually use them.<br>
<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br></blockquote><div><br></div><div>=
Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0hw/display/edid-generate.c | 20 +++++++++++---------<br>
=C2=A01 file changed, 11 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/hw/display/edid-generate.c b/hw/display/edid-generate.c<br>
index ae34999f9eb5..25f790c7bd85 100644<br>
--- a/hw/display/edid-generate.c<br>
+++ b/hw/display/edid-generate.c<br>
@@ -416,25 +416,28 @@ void qemu_edid_generate(uint8_t *edid, size_t size,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 width_mm, height_mm);<br>
=C2=A0 =C2=A0 =C2=A0desc =3D edid_desc_next(edid, dta, desc);<br>
<br>
+=C2=A0 =C2=A0 xtra3 =3D desc;<br>
+=C2=A0 =C2=A0 edid_desc_xtra3_std(xtra3);<br>
+=C2=A0 =C2=A0 desc =3D edid_desc_next(edid, dta, desc);<br>
+=C2=A0 =C2=A0 edid_fill_modes(edid, xtra3, dta, info-&gt;maxx, info-&gt;ma=
xy);<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* dta video data block is finished at thus point,<br>
+=C2=A0 =C2=A0 =C2=A0* so dta descriptor offsets don&#39;t move any more.<b=
r>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+<br>
=C2=A0 =C2=A0 =C2=A0edid_desc_ranges(desc);<br>
=C2=A0 =C2=A0 =C2=A0desc =3D edid_desc_next(edid, dta, desc);<br>
<br>
-=C2=A0 =C2=A0 if (info-&gt;name) {<br>
+=C2=A0 =C2=A0 if (desc &amp;&amp; info-&gt;name) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0edid_desc_text(desc, 0xfc, info-&gt;name)=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0desc =3D edid_desc_next(edid, dta, desc);=
<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (info-&gt;serial) {<br>
+=C2=A0 =C2=A0 if (desc &amp;&amp; info-&gt;serial) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0edid_desc_text(desc, 0xff, info-&gt;seria=
l);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0desc =3D edid_desc_next(edid, dta, desc);=
<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (desc) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 xtra3 =3D desc;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 edid_desc_xtra3_std(xtra3);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 desc =3D edid_desc_next(edid, dta, desc);<br>
-=C2=A0 =C2=A0 }<br>
-<br>
=C2=A0 =C2=A0 =C2=A0while (desc) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0edid_desc_dummy(desc);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0desc =3D edid_desc_next(edid, dta, desc);=
<br>
@@ -442,7 +445,6 @@ void qemu_edid_generate(uint8_t *edid, size_t size,<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D finish=
 up =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */<br>
<br>
-=C2=A0 =C2=A0 edid_fill_modes(edid, xtra3, dta, info-&gt;maxx, info-&gt;ma=
xy);<br>
=C2=A0 =C2=A0 =C2=A0edid_checksum(edid);<br>
=C2=A0 =C2=A0 =C2=A0if (dta) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0edid_checksum(dta);<br>
-- <br>
2.30.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000f8ebe705c0f64560--

