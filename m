Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5E14F7B76
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 11:19:55 +0200 (CEST)
Received: from localhost ([::1]:49668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncOIz-0004Yk-Ok
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 05:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ncOFx-0002pV-FB
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 05:16:45 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ncOFv-0005WE-J4
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 05:16:45 -0400
Received: by mail-wr1-x42d.google.com with SMTP id r13so6865803wrr.9
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 02:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K3CZPKrxABxUCT8XwfgG60S2UCTJs2xJe6Y8/xgFtrM=;
 b=OFZdr+NQeiQ28AgtxvKx9vhVBh2rKcZiti68pmVEr6x6qUmdy/hPTaZWJSFK8DZN78
 MHV8dJhfacSYLMMJY8+u3J1u0TFqfpNK7lfTTTYQQ9bRXYJC2Il4NEuup0ZNuEr8shKc
 86lci78md+7h48VTCeE89+J4dxsUSTwLdLKC3fMVIjojHReJkyHnE99O0wDcDey/X/Ul
 9AMGuHxXUt9GUCppcL1iN+6LWN5K3e3giVCN7MB/NKwXyLfp3KEYnuyH/AyyTR+wWqCs
 bckbHiieAAnuX806S6tZsc3fmNHrC64Cdaes0VqOkzNjIhD8+vsUUAeiKvf1FlBpW8w5
 tfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K3CZPKrxABxUCT8XwfgG60S2UCTJs2xJe6Y8/xgFtrM=;
 b=InIwzgBdBBhuW8AkQLHxMbIFl9rl6WjNg1AwrdvdWQXUFl5n59tceLXaZNRnTCe2OM
 /NMi0lDl5kDB9Ahoghw5ZkwIMTX1Rfja4o5ejz6T2yMf37c+7ynpozI8GeiOZ7Anh3uS
 piKgp/rpFvlU1WzzILzyv/8jxGALeoWdU0H7u8rfezY1jnwxgXLUTcTQ92b1cSPg09pk
 WM7lGZMtCzT7JWop67AvMbedLuhwbzkBRKozTA+QnTYfHLWpuIHRzh4Mg2TF3GJW5atI
 SA+aJxGJkEx3vlDHZMm3rIuRUWuDvxc6FVbnpm3Ky+ERV4nhhsBmoeNJuqXaqYF7k2YX
 zyXQ==
X-Gm-Message-State: AOAM530iTLW3R0/vLJeSbsMhjpPAwm7LbMeRXGch2gOfZ36CL+UJkNbL
 8WU2GnB00R36jOLopcU8xOifJYlvoK6+sYJC7Pk=
X-Google-Smtp-Source: ABdhPJzn0InFt0E0e/U1nipfmE93nPRWk8smA5OsNuxyn8tw48mMD7/uNyI+dbYsLPTRSVcta03cV91VcCrn2+E4fiI=
X-Received: by 2002:a5d:6b8e:0:b0:206:1d5f:b8dd with SMTP id
 n14-20020a5d6b8e000000b002061d5fb8ddmr9855325wrx.187.1649323001673; Thu, 07
 Apr 2022 02:16:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220407081106.343235-1-mcascell@redhat.com>
In-Reply-To: <20220407081106.343235-1-mcascell@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 7 Apr 2022 13:16:29 +0400
Message-ID: <CAJ+F1C+iHH8ANtwE+BwDvT4icb5K6kaP4ii8-Cym7OwbnwjH9w@mail.gmail.com>
Subject: Re: [PATCH v2] display/qxl-render: fix race condition in qxl_cursor
 (CVE-2021-4207)
To: Mauro Matteo Cascella <mcascell@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000a279db05dc0cefc4"
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

--000000000000a279db05dc0cefc4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 7, 2022 at 12:11 PM Mauro Matteo Cascella <mcascell@redhat.com>
wrote:

> Avoid fetching 'width' and 'height' a second time to prevent possible
> race condition. Refer to security advisory
> https://starlabs.sg/advisories/22-4207/ for more information.
>
> Fixes: CVE-2021-4207
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
> v2:
> - fix CVE id (CVE-2021-4207 instead of CVE-2022-4207)
>
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

--000000000000a279db05dc0cefc4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 7, 2022 at 12:11 PM Mauro=
 Matteo Cascella &lt;<a href=3D"mailto:mcascell@redhat.com">mcascell@redhat=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Avoid fetching &#39;width&#39; and &#39;height&#39; a second time to pr=
event possible<br>
race condition. Refer to security advisory<br>
<a href=3D"https://starlabs.sg/advisories/22-4207/" rel=3D"noreferrer" targ=
et=3D"_blank">https://starlabs.sg/advisories/22-4207/</a> for more informat=
ion.<br>
<br>
Fixes: CVE-2021-4207<br>
Signed-off-by: Mauro Matteo Cascella &lt;<a href=3D"mailto:mcascell@redhat.=
com" target=3D"_blank">mcascell@redhat.com</a>&gt;<br></blockquote><div><br=
></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marca=
ndre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=
=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
v2:<br>
- fix CVE id (CVE-2021-4207 instead of CVE-2022-4207)<br>
<br>
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

--000000000000a279db05dc0cefc4--

