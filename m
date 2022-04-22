Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9649C50B46A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 11:49:15 +0200 (CEST)
Received: from localhost ([::1]:37102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhpuc-0006Xm-Mz
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 05:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhph5-0000Kc-7c
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 05:35:15 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:34487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhph3-0006ms-HH
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 05:35:14 -0400
Received: by mail-qk1-x72d.google.com with SMTP id j9so5427145qkg.1
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 02:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iphdWv/LvJ4U0xcfLvIF+wYQpVEaP9LS+ZOYcsEW3A0=;
 b=A0sYhGUkov6yL3Tr2aevKR2YYMWoVZ6C3dg5QO+j0ONn3/DJWr4abLA/ItzNnRCZjC
 HkXzSTXbe7Vy0WJGgeyemGRS4+lZ0k1eYhd243MSe08klwPwxkBwG3Fms8yf8R5RFVTt
 l+BfQgf2joyRGNXMoDzp4VDVqaa4eVJZcakRZyD+Y/jrKM/O4dsl0ZfYZ7RCflWVwMSB
 WucHZlav9LipD2/18lsm0/z/CKAwacLXSm4jOWWkJCaNz8GCJkC4XdNojYakxsD/meyT
 cDuwQBt4F3NfdzQvtUlowDNMwPKhpXd7vH8IN/79O7kIr2wOvIAGlF1rnmrSjQy8t/hC
 XR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iphdWv/LvJ4U0xcfLvIF+wYQpVEaP9LS+ZOYcsEW3A0=;
 b=55qURjBB2dw3utIWvlQQ4G94iMZJB1zVxyjxiG1GS+NiE6TDML3ezOasWMgDNVg9c2
 DNpRkGUTyPl+twrCDHSs+eDz/hEWHBEFuTzDD/wi9xxELRkfvhrjy/oRUriCzUoDQKls
 Vv4O1hbTJy6Lr283Lw4HejvOSs2Kizln3bBtttB1Lukl9GdYSwTiTyVVCA49kP16eiJN
 J5ymueKVBjeDYDLD94qIJ/L3Ir6Dvwq3M7n0W3DXReGxhDzuWUpCxcPziH5i96guvduW
 pCCWj5OATo7MkfQltNmwFJKYss7MsOyYq5v3QR5ycPzbL3OEKs01vj4X/bo0uaKMId+9
 lebA==
X-Gm-Message-State: AOAM531ud0pINo3UoNepLRN08c5ZWLcFdNXdX6TVKzVLK01tbsN4UmcR
 5nw3R8jlXagMR4hujRlI5eWLIk2avN00c7WIU89Ro+9tBXugMg==
X-Google-Smtp-Source: ABdhPJznYPDJgH1XWxOJhs/lCx64QkVuf5ng4jqhDGTWh2YOatImUHpyC/tCGFFY4GedDvaCDfDX9cY2jS8D32BZKy0=
X-Received: by 2002:a05:620a:4093:b0:69c:fda:3cf2 with SMTP id
 f19-20020a05620a409300b0069c0fda3cf2mr1966691qko.245.1650620112606; Fri, 22
 Apr 2022 02:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220422070144.1043697-1-sw@weilnetz.de>
 <20220422070144.1043697-4-sw@weilnetz.de>
In-Reply-To: <20220422070144.1043697-4-sw@weilnetz.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 22 Apr 2022 13:35:01 +0400
Message-ID: <CAJ+F1C+4t6L0xLFgouBN3FM4GDsKyoUjU57yK_z82yx0SrEobQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] libvhost-user: Add format attribute to local function
 vu_panic
To: Stefan Weil <sw@weilnetz.de>
Content-Type: multipart/alternative; boundary="00000000000078985e05dd3af138"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qk1-x72d.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>, Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000078985e05dd3af138
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Apr 22, 2022 at 11:08 AM Stefan Weil <sw@weilnetz.de> wrote:

> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>
> It would be good to add format attributes to local functions, too (like
> it is done here) to avoid future format bugs.
>
> The changes here could be simplified by including a glib header,
> but from the comments I assumed that is unwanted here?
>

For historical reasons, libvhost-user.c doesn't depend on glib. Whether
this is useful to anyone isn't obvious :)


>  subprojects/libvhost-user/libvhost-user.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/subprojects/libvhost-user/libvhost-user.c
> b/subprojects/libvhost-user/libvhost-user.c
> index 94645f9154..29ab85fc9d 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -45,6 +45,17 @@
>  #include "libvhost-user.h"
>
>  /* usually provided by GLib */
> +#if     __GNUC__ > 2 || (__GNUC__ =3D=3D 2 && __GNUC_MINOR__ > 4)
> +#if !defined(__clang__) && (__GNUC__ =3D=3D 4 && __GNUC_MINOR__ =3D=3D 4=
)
> +#define G_GNUC_PRINTF(format_idx, arg_idx) \
> +  __attribute__((__format__(gnu_printf, format_idx, arg_idx)))
> +#else
> +#define G_GNUC_PRINTF(format_idx, arg_idx) \
> +  __attribute__((__format__(__printf__, format_idx, arg_idx)))
> +#endif
> +#else   /* !__GNUC__ */
> +#define G_GNUC_PRINTF(format_idx, arg_idx)
> +#endif  /* !__GNUC__ */
>  #ifndef MIN
>  #define MIN(x, y) ({                            \
>              typeof(x) _min1 =3D (x);              \
> @@ -151,7 +162,7 @@ vu_request_to_string(unsigned int req)
>      }
>  }
>
> -static void
> +static void G_GNUC_PRINTF(2, 3)
>  vu_panic(VuDev *dev, const char *msg, ...)
>  {
>      char *buf =3D NULL;
> --
> 2.30.2
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000078985e05dd3af138
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 22, 2022 at 11:08 AM St=
efan Weil &lt;<a href=3D"mailto:sw@weilnetz.de">sw@weilnetz.de</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by=
: Stefan Weil &lt;<a href=3D"mailto:sw@weilnetz.de" target=3D"_blank">sw@we=
ilnetz.de</a>&gt;<br></blockquote><div><br></div><div><div>Reviewed-by: Mar=
c-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marc=
andre.lureau@redhat.com</a>&gt;</div><div><br></div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
It would be good to add format attributes to local functions, too (like<br>
it is done here) to avoid future format bugs.<br>
<br>
The changes here could be simplified by including a glib header,<br>
but from the comments I assumed that is unwanted here?<br></blockquote><div=
><br></div><div>For historical reasons, libvhost-user.c doesn&#39;t depend =
on glib. Whether this is useful to anyone isn&#39;t obvious :)<br></div><di=
v><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0subprojects/libvhost-user/libvhost-user.c | 13 ++++++++++++-<br>
=C2=A01 file changed, 12 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvho=
st-user/libvhost-user.c<br>
index 94645f9154..29ab85fc9d 100644<br>
--- a/subprojects/libvhost-user/libvhost-user.c<br>
+++ b/subprojects/libvhost-user/libvhost-user.c<br>
@@ -45,6 +45,17 @@<br>
=C2=A0#include &quot;libvhost-user.h&quot;<br>
<br>
=C2=A0/* usually provided by GLib */<br>
+#if=C2=A0 =C2=A0 =C2=A0__GNUC__ &gt; 2 || (__GNUC__ =3D=3D 2 &amp;&amp; __=
GNUC_MINOR__ &gt; 4)<br>
+#if !defined(__clang__) &amp;&amp; (__GNUC__ =3D=3D 4 &amp;&amp; __GNUC_MI=
NOR__ =3D=3D 4)<br>
+#define G_GNUC_PRINTF(format_idx, arg_idx) \<br>
+=C2=A0 __attribute__((__format__(gnu_printf, format_idx, arg_idx)))<br>
+#else<br>
+#define G_GNUC_PRINTF(format_idx, arg_idx) \<br>
+=C2=A0 __attribute__((__format__(__printf__, format_idx, arg_idx)))<br>
+#endif<br>
+#else=C2=A0 =C2=A0/* !__GNUC__ */<br>
+#define G_GNUC_PRINTF(format_idx, arg_idx)<br>
+#endif=C2=A0 /* !__GNUC__ */<br>
=C2=A0#ifndef MIN<br>
=C2=A0#define MIN(x, y) ({=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0typeof(x) _min1 =3D (x);=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
@@ -151,7 +162,7 @@ vu_request_to_string(unsigned int req)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-static void<br>
+static void G_GNUC_PRINTF(2, 3)<br>
=C2=A0vu_panic(VuDev *dev, const char *msg, ...)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0char *buf =3D NULL;<br>
-- <br>
2.30.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000078985e05dd3af138--

