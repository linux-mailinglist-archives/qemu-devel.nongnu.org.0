Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0452A6FC043
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 09:13:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwHXQ-0002Gy-Pr; Tue, 09 May 2023 03:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pwHXO-0002Gq-16
 for qemu-devel@nongnu.org; Tue, 09 May 2023 03:13:30 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pwHXM-0007YI-4G
 for qemu-devel@nongnu.org; Tue, 09 May 2023 03:13:29 -0400
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f139de8cefso32079163e87.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 00:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683616406; x=1686208406;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FIyTP7AukarRyl8gsJmhNEZpUZONeJ7pjrAlan7onqw=;
 b=ScAlQvkeku3yPAPbChjorn769FdC0P/VMhO3If9PLpBouRaDMO+OkkDqJcatVsVnRR
 +tuTaIk/C73nwTs/Wex1oQUeqOMJXUE7L7YUZsRD41FSSJC2SiPfWzAYpGfXPnqPu+vZ
 Dd3d4xA9TKBlvpONupsgW377jItkbtDx52GweKbXzpNzb4CVGgvybzWAVPpLxesvcgD4
 KtVjatCZpCidEdkwqU8XsXpnC+a5maVTg78Cb5K1FtJBovnmk/YrQyGLjSy0ZsTN31YV
 F4DERuLSJVjixRo33IbnhRdm0aYkZVXuaUgSzQGCTCM9TmshqCCVme6MdR7cneD/+5Az
 N9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683616406; x=1686208406;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FIyTP7AukarRyl8gsJmhNEZpUZONeJ7pjrAlan7onqw=;
 b=LlV9lPfcVtVP7PRTsZrpg70RTeUBNrE/3wJWK7UTbK8a3lcOewaX9UkhqLSHRZPzGK
 v7SQdyHJ4s7mzdgIzVj/+lUkAaIxRaohLtalTpD4HT6OwShMOsylxw/rd1DNVYLoVYF7
 PRoFhexrHR3WIt+cqDK8ie497sQAfNluQB0s0EBjNjNDHq31wivVQyEW0C5YKCTsDmsy
 IXtNSxKl2JKQ9VX7p/MnDxYYncP5s86lHuX0lki8MSNfVCzTb6R4RSBZz4XxZIwlkqbi
 upejzcv5IwhyZgCpqqVFL0eMJW+v3jLfqzd+yJSMCfz/FU5H0BaAbeGiQGSuJNVxcOSr
 HIYw==
X-Gm-Message-State: AC+VfDyEHrO7s8C+Gx05KdYuM8tnLe9shqKq/x6U2lU5/petMiN24KNM
 sa2arkyhcs1BNUn8r7TtxNWO/Vz42EQJE9I26aI=
X-Google-Smtp-Source: ACHHUZ46pXu9d9AUIiZ2poU1kIdcBU3P6olCDxwv8jBjYVt0ebaNCUoW3xBjTuDn0BgNeUMEjHGlCfj66HwPNwmP2qo=
X-Received: by 2002:a05:6512:b95:b0:4f1:4a14:d97c with SMTP id
 b21-20020a0565120b9500b004f14a14d97cmr587050lfv.16.1683616405513; Tue, 09 May
 2023 00:13:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230508141813.1086562-1-mcascell@redhat.com>
In-Reply-To: <20230508141813.1086562-1-mcascell@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 9 May 2023 11:13:14 +0400
Message-ID: <CAJ+F1CK2V22PMYP4PQwH+VYKhR32GKxFK5eRODE928iu3LVodA@mail.gmail.com>
Subject: Re: [PATCH] ui/cursor: incomplete check for integer overflow in
 cursor_alloc
To: Mauro Matteo Cascella <mcascell@redhat.com>
Cc: qemu-devel@nongnu.org, kraxel@redhat.com, jacek.halon@gmail.com
Content-Type: multipart/alternative; boundary="000000000000c9eb1d05fb3d7d20"
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12f.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000c9eb1d05fb3d7d20
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, May 8, 2023 at 6:21=E2=80=AFPM Mauro Matteo Cascella <mcascell@redh=
at.com>
wrote:

> The cursor_alloc function still accepts a signed integer for both the
> cursor
> width and height. A specially crafted negative width/height could make
> datasize
> wrap around and cause the next allocation to be 0, potentially leading to=
 a
> heap buffer overflow. Modify QEMUCursor struct and cursor_alloc prototype
> to
> accept unsigned ints.
>
> Fixes: CVE-2023-1601
> Fixes: fa892e9a ("ui/cursor: fix integer overflow in cursor_alloc
> (CVE-2021-4206)")
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> Reported-by: Jacek Halon <jacek.halon@gmail.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

It looks like this is not exploitable, QXL code uses u16 types, and VMWare
VGA checks for values > 256. Other paths use fixed size.

---
>  include/ui/console.h | 4 ++--
>  ui/cursor.c          | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/include/ui/console.h b/include/ui/console.h
> index 2a8fab091f..92a4d90a1b 100644
> --- a/include/ui/console.h
> +++ b/include/ui/console.h
> @@ -144,13 +144,13 @@ typedef struct QemuUIInfo {
>
>  /* cursor data format is 32bit RGBA */
>  typedef struct QEMUCursor {
> -    int                 width, height;
> +    uint32_t            width, height;
>      int                 hot_x, hot_y;
>      int                 refcount;
>      uint32_t            data[];
>  } QEMUCursor;
>
> -QEMUCursor *cursor_alloc(int width, int height);
> +QEMUCursor *cursor_alloc(uint32_t width, uint32_t height);
>  QEMUCursor *cursor_ref(QEMUCursor *c);
>  void cursor_unref(QEMUCursor *c);
>  QEMUCursor *cursor_builtin_hidden(void);
> diff --git a/ui/cursor.c b/ui/cursor.c
> index 6fe67990e2..b5fcb64839 100644
> --- a/ui/cursor.c
> +++ b/ui/cursor.c
> @@ -90,7 +90,7 @@ QEMUCursor *cursor_builtin_left_ptr(void)
>      return cursor_parse_xpm(cursor_left_ptr_xpm);
>  }
>
> -QEMUCursor *cursor_alloc(int width, int height)
> +QEMUCursor *cursor_alloc(uint32_t width, uint32_t height)
>  {
>      QEMUCursor *c;
>      size_t datasize =3D width * height * sizeof(uint32_t);
> --
> 2.40.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000c9eb1d05fb3d7d20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 8, 2023 at 6:21=E2=80=
=AFPM Mauro Matteo Cascella &lt;<a href=3D"mailto:mcascell@redhat.com">mcas=
cell@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">The cursor_alloc function still accepts a signed integer for=
 both the cursor<br>
width and height. A specially crafted negative width/height could make data=
size<br>
wrap around and cause the next allocation to be 0, potentially leading to a=
<br>
heap buffer overflow. Modify QEMUCursor struct and cursor_alloc prototype t=
o<br>
accept unsigned ints.<br>
<br>
Fixes: CVE-2023-1601<br>
Fixes: fa892e9a (&quot;ui/cursor: fix integer overflow in cursor_alloc (CVE=
-2021-4206)&quot;)<br>
Signed-off-by: Mauro Matteo Cascella &lt;<a href=3D"mailto:mcascell@redhat.=
com" target=3D"_blank">mcascell@redhat.com</a>&gt;<br>
Reported-by: Jacek Halon &lt;<a href=3D"mailto:jacek.halon@gmail.com" targe=
t=3D"_blank">jacek.halon@gmail.com</a>&gt;<br></blockquote><div><br></div><=
div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lur=
eau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div><br></div><di=
v>It looks like this is not exploitable, QXL code uses u16 types, and VMWar=
e VGA checks for values &gt; 256. Other paths use fixed size.</div><div><br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0include/ui/console.h | 4 ++--<br>
=C2=A0ui/cursor.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A02 files changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/include/ui/console.h b/include/ui/console.h<br>
index 2a8fab091f..92a4d90a1b 100644<br>
--- a/include/ui/console.h<br>
+++ b/include/ui/console.h<br>
@@ -144,13 +144,13 @@ typedef struct QemuUIInfo {<br>
<br>
=C2=A0/* cursor data format is 32bit RGBA */<br>
=C2=A0typedef struct QEMUCursor {<br>
-=C2=A0 =C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0width, height;<br>
+=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 width, hei=
ght;<br>
=C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0hot_x, hot_y;<br>
=C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0refcount;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data[=
];<br>
=C2=A0} QEMUCursor;<br>
<br>
-QEMUCursor *cursor_alloc(int width, int height);<br>
+QEMUCursor *cursor_alloc(uint32_t width, uint32_t height);<br>
=C2=A0QEMUCursor *cursor_ref(QEMUCursor *c);<br>
=C2=A0void cursor_unref(QEMUCursor *c);<br>
=C2=A0QEMUCursor *cursor_builtin_hidden(void);<br>
diff --git a/ui/cursor.c b/ui/cursor.c<br>
index 6fe67990e2..b5fcb64839 100644<br>
--- a/ui/cursor.c<br>
+++ b/ui/cursor.c<br>
@@ -90,7 +90,7 @@ QEMUCursor *cursor_builtin_left_ptr(void)<br>
=C2=A0 =C2=A0 =C2=A0return cursor_parse_xpm(cursor_left_ptr_xpm);<br>
=C2=A0}<br>
<br>
-QEMUCursor *cursor_alloc(int width, int height)<br>
+QEMUCursor *cursor_alloc(uint32_t width, uint32_t height)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0QEMUCursor *c;<br>
=C2=A0 =C2=A0 =C2=A0size_t datasize =3D width * height * sizeof(uint32_t);<=
br>
-- <br>
2.40.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=
=A9 Lureau<br></div></div>

--000000000000c9eb1d05fb3d7d20--

