Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA2936C8EB
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 17:55:37 +0200 (CEST)
Received: from localhost ([::1]:52714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbQ3k-00064b-Ep
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 11:55:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lbQ2B-0004vF-5s
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 11:53:59 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:33365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lbQ27-0002Ye-3E
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 11:53:57 -0400
Received: by mail-ej1-x62a.google.com with SMTP id t4so6924345ejo.0
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 08:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SIKK+nTMReNUMFSUAb7T9a1NloaQaH0M0cnzUFQOdxo=;
 b=ned6eq1vsySPeSUoF7PkCmQe8rPXNoaCH4MHzqPCTEyt53GoZDrZ2yyJ06a1aRcw3c
 UoNN1OV4sTZhnnEhLtuivS1VKc+Nuvaq3OWG5cMfRJcTBS4SI3vyQoxiwLSmpH4wqJyW
 Pwg6svdFwwyIh9rv4eBM3K7Bq3PX5/sWN6f0OMESx6KQU75iv9LYP3J7q0yCwnGsiJxg
 Hxu70s7elqpQggib125extXrznjb2IVfl3huXpeofvUYlL8JqKmocwpVIz+BOHK3l0os
 7jkwrHlTBf4zmc+Nv2KFUuKzLPzPtDenPY2AaCP50AQqr5bkpGAwPSX81qX1XIWTgSKA
 7ECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SIKK+nTMReNUMFSUAb7T9a1NloaQaH0M0cnzUFQOdxo=;
 b=nq/DoRdz3q3GHnQktq3PQEYfWIpmhvTCFXRiKOcuSgcqXl68LLNi3t5kwVr05lU574
 QX0HuT0OyTcLCvuccHsgfxv8zQGI/if5kSttWO8K/y/mKswlIfDXWbiUykD8gWVSgUDB
 2K2vG4v/4YtkI+pja70/2dJr/6vCLMn6DAnuO5+oBQuN/2mVGL/ncYUL4ELq7zqJMMrj
 N9lBU1wXcAXMZ6ljy6NN6qIocYy/6jEdLn6c91sGa3YdIaroSyBe8H+2L1/ZgwuySKat
 I8qtHQW+Ot2fMwtkUOEq/Aoi+sN8ZGDg1HagtqsyrHTsKzeSeAybPdQaacZDZittwxhi
 GxaQ==
X-Gm-Message-State: AOAM532VpUBYPUHDQZYpvbLCK8KVzE0cPTkwKoFynvIIgoGwuYkSccJ4
 hva4Q5Ni6pfrnAUH2IW49ZKdBcsen20gnUTC8l8=
X-Google-Smtp-Source: ABdhPJzMbZP9R3VsTKGDYx4uXk2U0CjHY3hgDTTIQhKVvTAD7o5vCPISR0n5cP4tgz/fua8IC7Bg+GARNWxuXXZqe60=
X-Received: by 2002:a17:907:961d:: with SMTP id
 gb29mr23504755ejc.381.1619538833759; 
 Tue, 27 Apr 2021 08:53:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210427150824.638359-1-kraxel@redhat.com>
 <20210427150824.638359-3-kraxel@redhat.com>
In-Reply-To: <20210427150824.638359-3-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 27 Apr 2021 19:53:41 +0400
Message-ID: <CAJ+F1CKfZqBScrExTitW0e5=vyOV6Qo_PX+WPEVhodH-B52uPw@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] edid: edid_desc_next
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e2e44d05c0f644bb"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62a.google.com
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

--000000000000e2e44d05c0f644bb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 27, 2021 at 7:09 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> Add helper function to find the next free desc block.
> Needed when we start to use the dta descriptor entries.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  hw/display/edid-generate.c | 41 ++++++++++++++++++++++++--------------
>  1 file changed, 26 insertions(+), 15 deletions(-)
>
> diff --git a/hw/display/edid-generate.c b/hw/display/edid-generate.c
> index a1bea9a3aa35..ae34999f9eb5 100644
> --- a/hw/display/edid-generate.c
> +++ b/hw/display/edid-generate.c
> @@ -144,6 +144,17 @@ static void edid_checksum(uint8_t *edid)
>      }
>  }
>
> +static uint8_t *edid_desc_next(uint8_t *edid, uint8_t *dta, uint8_t *des=
c)
> +{
> +    if (desc =3D=3D NULL) {
> +        return NULL;
> +    }
> +    if (desc + 18 + 18 < edid + 127) {
> +        return desc + 18;
> +    }
> +    return NULL;
> +}
> +
>  static void edid_desc_type(uint8_t *desc, uint8_t type)
>  {
>      desc[0] =3D 0;
> @@ -300,7 +311,7 @@ uint32_t qemu_edid_dpi_to_mm(uint32_t dpi, uint32_t
> res)
>  void qemu_edid_generate(uint8_t *edid, size_t size,
>                          qemu_edid_info *info)
>  {
> -    uint32_t desc =3D 54;
> +    uint8_t *desc =3D edid + 54;
>      uint8_t *xtra3 =3D NULL;
>      uint8_t *dta =3D NULL;
>      uint32_t width_mm, height_mm;
> @@ -401,32 +412,32 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
>
>      /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D descriptor blocks =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
>
> -    edid_desc_timing(edid + desc, info->prefx, info->prefy,
> +    edid_desc_timing(desc, info->prefx, info->prefy,
>                       width_mm, height_mm);
> -    desc +=3D 18;
> +    desc =3D edid_desc_next(edid, dta, desc);
>
> -    edid_desc_ranges(edid + desc);
> -    desc +=3D 18;
> +    edid_desc_ranges(desc);
> +    desc =3D edid_desc_next(edid, dta, desc);
>
>      if (info->name) {
> -        edid_desc_text(edid + desc, 0xfc, info->name);
> -        desc +=3D 18;
> +        edid_desc_text(desc, 0xfc, info->name);
> +        desc =3D edid_desc_next(edid, dta, desc);
>      }
>
>      if (info->serial) {
> -        edid_desc_text(edid + desc, 0xff, info->serial);
> -        desc +=3D 18;
> +        edid_desc_text(desc, 0xff, info->serial);
> +        desc =3D edid_desc_next(edid, dta, desc);
>      }
>
> -    if (desc < 126) {
> -        xtra3 =3D edid + desc;
> +    if (desc) {
> +        xtra3 =3D desc;
>          edid_desc_xtra3_std(xtra3);
> -        desc +=3D 18;
> +        desc =3D edid_desc_next(edid, dta, desc);
>      }
>
> -    while (desc < 126) {
> -        edid_desc_dummy(edid + desc);
> -        desc +=3D 18;
> +    while (desc) {
> +        edid_desc_dummy(desc);
> +        desc =3D edid_desc_next(edid, dta, desc);
>      }
>
>      /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D finish up =3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
> --
> 2.30.2
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000e2e44d05c0f644bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 27, 2021 at 7:09 PM Gerd =
Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add help=
er function to find the next free desc block.<br>
Needed when we start to use the dta descriptor entries.<br>
<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br></blockquote><div><br></div><div>=
Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0hw/display/edid-generate.c | 41 ++++++++++++++++++++++++-------------=
-<br>
=C2=A01 file changed, 26 insertions(+), 15 deletions(-)<br>
<br>
diff --git a/hw/display/edid-generate.c b/hw/display/edid-generate.c<br>
index a1bea9a3aa35..ae34999f9eb5 100644<br>
--- a/hw/display/edid-generate.c<br>
+++ b/hw/display/edid-generate.c<br>
@@ -144,6 +144,17 @@ static void edid_checksum(uint8_t *edid)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+static uint8_t *edid_desc_next(uint8_t *edid, uint8_t *dta, uint8_t *desc)=
<br>
+{<br>
+=C2=A0 =C2=A0 if (desc =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (desc + 18 + 18 &lt; edid + 127) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return desc + 18;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return NULL;<br>
+}<br>
+<br>
=C2=A0static void edid_desc_type(uint8_t *desc, uint8_t type)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0desc[0] =3D 0;<br>
@@ -300,7 +311,7 @@ uint32_t qemu_edid_dpi_to_mm(uint32_t dpi, uint32_t res=
)<br>
=C2=A0void qemu_edid_generate(uint8_t *edid, size_t size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0qemu_edid_info *info)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 uint32_t desc =3D 54;<br>
+=C2=A0 =C2=A0 uint8_t *desc =3D edid + 54;<br>
=C2=A0 =C2=A0 =C2=A0uint8_t *xtra3 =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0uint8_t *dta =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t width_mm, height_mm;<br>
@@ -401,32 +412,32 @@ void qemu_edid_generate(uint8_t *edid, size_t size,<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D descri=
ptor blocks =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */<br>
<br>
-=C2=A0 =C2=A0 edid_desc_timing(edid + desc, info-&gt;prefx, info-&gt;prefy=
,<br>
+=C2=A0 =C2=A0 edid_desc_timing(desc, info-&gt;prefx, info-&gt;prefy,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 width_mm, height_mm);<br>
-=C2=A0 =C2=A0 desc +=3D 18;<br>
+=C2=A0 =C2=A0 desc =3D edid_desc_next(edid, dta, desc);<br>
<br>
-=C2=A0 =C2=A0 edid_desc_ranges(edid + desc);<br>
-=C2=A0 =C2=A0 desc +=3D 18;<br>
+=C2=A0 =C2=A0 edid_desc_ranges(desc);<br>
+=C2=A0 =C2=A0 desc =3D edid_desc_next(edid, dta, desc);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (info-&gt;name) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 edid_desc_text(edid + desc, 0xfc, info-&gt;nam=
e);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 desc +=3D 18;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 edid_desc_text(desc, 0xfc, info-&gt;name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 desc =3D edid_desc_next(edid, dta, desc);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (info-&gt;serial) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 edid_desc_text(edid + desc, 0xff, info-&gt;ser=
ial);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 desc +=3D 18;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 edid_desc_text(desc, 0xff, info-&gt;serial);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 desc =3D edid_desc_next(edid, dta, desc);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (desc &lt; 126) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 xtra3 =3D edid + desc;<br>
+=C2=A0 =C2=A0 if (desc) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xtra3 =3D desc;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0edid_desc_xtra3_std(xtra3);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 desc +=3D 18;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 desc =3D edid_desc_next(edid, dta, desc);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 while (desc &lt; 126) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 edid_desc_dummy(edid + desc);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 desc +=3D 18;<br>
+=C2=A0 =C2=A0 while (desc) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 edid_desc_dummy(desc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 desc =3D edid_desc_next(edid, dta, desc);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D finish=
 up =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */<br>
-- <br>
2.30.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000e2e44d05c0f644bb--

