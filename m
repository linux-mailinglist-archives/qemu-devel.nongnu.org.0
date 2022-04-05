Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5624F2A77
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 13:02:41 +0200 (CEST)
Received: from localhost ([::1]:56044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbgxN-0000UF-1E
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 07:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nbgsf-0004Ds-F8
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 06:57:50 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:45897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nbgsd-0001Wn-Q8
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 06:57:49 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso1380847wmz.4
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 03:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n2TAiHCF+E1RbALrZ5fisO1tzHhw/2XNeUNsZ6BKA64=;
 b=iQ8B8fexp1t1xKKLDC1ljuA2bm8H+bEKf6xGjFxzKeRA/3hd7zsDcMPaXY+flXmmUj
 5QV2yYJKskJcvEtkBq0DfNo+Q5iLqgGVpnLkO3xcRVk4gI9Tof5afOObu6jsfJNndO2B
 uBWysbaV0+/7/5W1/s1Sj+Q8cevCoYCn05YPlZ2EE5E5AokdCMTbsVwJbiFvAkVNPm+I
 Z67c3GIGy/5D8f9C06w/C+g/HXZwJO+tsrDrB7P8Qml9EpdnifEhT8vVnJhLTFFM2zsM
 Ww/LJZsKtu9HbkfQdXOmRenfg9liFz7bzilbotvigHameUHJuo8pd3gZ8tFJb6wsy6ZR
 AYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n2TAiHCF+E1RbALrZ5fisO1tzHhw/2XNeUNsZ6BKA64=;
 b=udhs9ick1Q1hZW8R5n0SzOHyNaGCMjzCltEd/KyutG8a6LkUYrs1QIxd/vuHuvsb/G
 jEGrPEKbfF3p6gKZt4/rrB5JPMxbl35/iX3aJhZKH0T8UlKwytOAiKewC1ri92h1WHud
 SDxMuYm5vkSKB/L2vufOcvuedetI/oHqI5Nj3kLe1NIlALsn714wC/9GG2ba2TznqxdJ
 JoqLHKB5X4HFfv1XcZlxLFDIeOMtGPnv0x6mcT5++6MHBL6rS2Fr93Nyk+bO3mGd9UFl
 sx8RgbfZwPy6GAvArHLkghY8Wi3oL+dCeTvHRGA9Ewz1I8B5xms9UB7sJtc2xIWzQADo
 y6mA==
X-Gm-Message-State: AOAM530vOaesZnGuKhGDssBRkUQ0hlhG4V7/lc77k6ittJWd544P6QMa
 h5TxYZBtFLEyP2zPzDou5/Yxo6E22uNBYTGDJPZVCTMNu0Q=
X-Google-Smtp-Source: ABdhPJzfd7DMEd+pY5uuYB3/hXwD4lSkWdXWfPhb9c3RyHH0doL0dL2+Phv/kfbTqNKMNGh4a4rxdjOfokxGSOzyx/k=
X-Received: by 2002:a05:600c:4fd4:b0:38c:cc3f:ac01 with SMTP id
 o20-20020a05600c4fd400b0038ccc3fac01mr2617429wmq.206.1649156261190; Tue, 05
 Apr 2022 03:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220405103505.106034-1-mcascell@redhat.com>
In-Reply-To: <20220405103505.106034-1-mcascell@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 5 Apr 2022 14:57:29 +0400
Message-ID: <CAJ+F1CKA6D5Yb3_gcgV4aEty_3JafCDHuDPxkDTp8u59zJuMww@mail.gmail.com>
Subject: Re: [PATCH] display/qxl-render: fix race condition in qxl_cursor
 (CVE-2022-4207)
To: Mauro Matteo Cascella <mcascell@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000020a12105dbe61d3c"
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x335.google.com
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

--00000000000020a12105dbe61d3c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 5, 2022 at 2:55 PM Mauro Matteo Cascella <mcascell@redhat.com>
wrote:

> Avoid fetching 'width' and 'height' a second time to prevent possible
> race condition. Refer to security advisory
> https://starlabs.sg/advisories/22-4207/ for more information.
>
> Fixes: CVE-2022-4207
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  hw/display/qxl-render.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
> index d28849b121..237ed293ba 100644
> --- a/hw/display/qxl-render.c
> +++ b/hw/display/qxl-render.c
> @@ -266,7 +266,7 @@ static QEMUCursor *qxl_cursor(PCIQXLDevice *qxl,
> QXLCursor *cursor,
>          }
>          break;
>      case SPICE_CURSOR_TYPE_ALPHA:
> -        size =3D sizeof(uint32_t) * cursor->header.width *
> cursor->header.height;
> +        size =3D sizeof(uint32_t) * c->width * c->height;
>          qxl_unpack_chunks(c->data, size, qxl, &cursor->chunk, group_id);
>          if (qxl->debug > 2) {
>              cursor_print_ascii_art(c, "qxl/alpha");
> --
> 2.35.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000020a12105dbe61d3c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 5, 2022 at 2:55 PM Mauro =
Matteo Cascella &lt;<a href=3D"mailto:mcascell@redhat.com">mcascell@redhat.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Avoid fetching &#39;width&#39; and &#39;height&#39; a second time to pre=
vent possible<br>
race condition. Refer to security advisory<br>
<a href=3D"https://starlabs.sg/advisories/22-4207/" rel=3D"noreferrer" targ=
et=3D"_blank">https://starlabs.sg/advisories/22-4207/</a> for more informat=
ion.<br>
<br>
Fixes: CVE-2022-4207<br>
Signed-off-by: Mauro Matteo Cascella &lt;<a href=3D"mailto:mcascell@redhat.=
com" target=3D"_blank">mcascell@redhat.com</a>&gt;<br></blockquote><div><br=
></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marca=
ndre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=
=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0hw/display/qxl-render.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c<br>
index d28849b121..237ed293ba 100644<br>
--- a/hw/display/qxl-render.c<br>
+++ b/hw/display/qxl-render.c<br>
@@ -266,7 +266,7 @@ static QEMUCursor *qxl_cursor(PCIQXLDevice *qxl, QXLCur=
sor *cursor,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case SPICE_CURSOR_TYPE_ALPHA:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D sizeof(uint32_t) * cursor-&gt;header.=
width * cursor-&gt;header.height;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D sizeof(uint32_t) * c-&gt;width * c-&g=
t;height;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qxl_unpack_chunks(c-&gt;data, size, qxl, =
&amp;cursor-&gt;chunk, group_id);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (qxl-&gt;debug &gt; 2) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cursor_print_ascii_art(c, &=
quot;qxl/alpha&quot;);<br>
-- <br>
2.35.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000020a12105dbe61d3c--

