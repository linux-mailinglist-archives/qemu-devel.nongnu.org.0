Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BF12D2B13
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 13:33:57 +0100 (CET)
Received: from localhost ([::1]:55694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmcBo-0008J8-4W
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 07:33:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kmc6C-0003PZ-RM
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:28:08 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:44126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kmc6B-0007S7-9D
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:28:08 -0500
Received: by mail-ej1-x642.google.com with SMTP id m19so24272594ejj.11
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 04:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yIa5sdX5xHVjy/msXiLoy/v/y66LMSnO0fJz3iTFpyQ=;
 b=LlothcZw23UY7yu++gZmsVcBGecnSAhF5B/onRWZPHp11H46re2ZTnEn8RGSCGim5o
 aJV0/gim2Emjm/WxyFqh5TG2ccHqwnwicstGlqXPrah+BOdAPrws2pvXe/QcYcNAGAv2
 sddCueMhNdqZCWwyLA4wDdVfW7AITkjN1EF9bxe09ob2VB8NRdwVEvxXOI7OBldzRzQN
 Q/ZAorykw98F8AyLl+WdNNyatIahQ2hgSA6YPHeosXFl2KZhWjNLm7Gp1dIAZOt0cLYb
 6thwzu1fCOt+EKLVVx8jzCiZll2UyV0X3KgwBdmLmipxLsJ3P1l+Tng+r3GntFTzC4PL
 9INg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yIa5sdX5xHVjy/msXiLoy/v/y66LMSnO0fJz3iTFpyQ=;
 b=eRqOiCqHJfEA+dx33UHW+L6ognVdIxIUnPSGMB0B2NIzw+gd2QDTtfDhIIb4cbUOg8
 76cMacOdWCyILaUIDS1Hb8Jx3EEXGvHqj97cx2nuucmpAGK7zTKh1bQU1tbHhFv9dcb9
 6NiwZ+TcJvm9lfYjoudJW76HxrqW8DbbYx3pGcNBeY3cQYg/3UvhUl3xRbC93lvC+vpA
 FVZiDcKSS6ggyFrxYQrX+zJxNRobfmkBKevdD87+tsgF+I/mYRwlLRvElKC2MDzD+Zh4
 Rt1iEJKXbn/cV3oVBZAIXsSnWT4BkQ7M9v1LK5Xza7j/OJzsXzuqZYhmIcNWvfJ3Aaj/
 p71Q==
X-Gm-Message-State: AOAM531fZjYASedcuDHKEa5Uh/8UGV9zOc3x/NNxt8gSfmqFMW/sXJpd
 85t1hwloqN3zKjfRbknLkonl06cxSS1wB4vsVYo=
X-Google-Smtp-Source: ABdhPJywX5XjKMy+gixmGNhXyhqY67fNy+ztQehNADRIzlD4W6Pxu/lvCxk37xWtlcUA0T3HZHPAx+zwQQkLvG7pLx8=
X-Received: by 2002:a17:906:9452:: with SMTP id
 z18mr23289078ejx.389.1607430484975; 
 Tue, 08 Dec 2020 04:28:04 -0800 (PST)
MIME-Version: 1.0
References: <20201208115737.18581-1-kraxel@redhat.com>
 <20201208115737.18581-2-kraxel@redhat.com>
In-Reply-To: <20201208115737.18581-2-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 8 Dec 2020 16:27:51 +0400
Message-ID: <CAJ+F1C+Jt26TZU_2KQidsxmFdjVqY0q+3wzr3-f-JW8=_YSEdw@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] console: drop qemu_console_get_ui_info
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000000ee63705b5f31320"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x642.google.com
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

--0000000000000ee63705b5f31320
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 8, 2020 at 4:02 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> Unused and duplicate (there is dpy_get_ui_info).
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>

:)
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  include/ui/console.h | 1 -
>  ui/console.c         | 6 ------
>  2 files changed, 7 deletions(-)
>
> diff --git a/include/ui/console.h b/include/ui/console.h
> index e7303d8b98a8..5dd21976a376 100644
> --- a/include/ui/console.h
> +++ b/include/ui/console.h
> @@ -390,7 +390,6 @@ bool qemu_console_is_gl_blocked(QemuConsole *con);
>  char *qemu_console_get_label(QemuConsole *con);
>  int qemu_console_get_index(QemuConsole *con);
>  uint32_t qemu_console_get_head(QemuConsole *con);
> -QemuUIInfo *qemu_console_get_ui_info(QemuConsole *con);
>  int qemu_console_get_width(QemuConsole *con, int fallback);
>  int qemu_console_get_height(QemuConsole *con, int fallback);
>  /* Return the low-level window id for the console */
> diff --git a/ui/console.c b/ui/console.c
> index 53dee8e26b17..f995639e45f6 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -2122,12 +2122,6 @@ uint32_t qemu_console_get_head(QemuConsole *con)
>      return con ? con->head : -1;
>  }
>
> -QemuUIInfo *qemu_console_get_ui_info(QemuConsole *con)
> -{
> -    assert(con !=3D NULL);
> -    return &con->ui_info;
> -}
> -
>  int qemu_console_get_width(QemuConsole *con, int fallback)
>  {
>      if (con =3D=3D NULL) {
> --
> 2.27.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000000ee63705b5f31320
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 8, 2020 at 4:02 PM Gerd H=
offmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Unused an=
d duplicate (there is dpy_get_ui_info).<br>
<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br></blockquote><div><br></div><div>=
:)<br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:=
marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br>=
</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0include/ui/console.h | 1 -<br>
=C2=A0ui/console.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 ------<br>
=C2=A02 files changed, 7 deletions(-)<br>
<br>
diff --git a/include/ui/console.h b/include/ui/console.h<br>
index e7303d8b98a8..5dd21976a376 100644<br>
--- a/include/ui/console.h<br>
+++ b/include/ui/console.h<br>
@@ -390,7 +390,6 @@ bool qemu_console_is_gl_blocked(QemuConsole *con);<br>
=C2=A0char *qemu_console_get_label(QemuConsole *con);<br>
=C2=A0int qemu_console_get_index(QemuConsole *con);<br>
=C2=A0uint32_t qemu_console_get_head(QemuConsole *con);<br>
-QemuUIInfo *qemu_console_get_ui_info(QemuConsole *con);<br>
=C2=A0int qemu_console_get_width(QemuConsole *con, int fallback);<br>
=C2=A0int qemu_console_get_height(QemuConsole *con, int fallback);<br>
=C2=A0/* Return the low-level window id for the console */<br>
diff --git a/ui/console.c b/ui/console.c<br>
index 53dee8e26b17..f995639e45f6 100644<br>
--- a/ui/console.c<br>
+++ b/ui/console.c<br>
@@ -2122,12 +2122,6 @@ uint32_t qemu_console_get_head(QemuConsole *con)<br>
=C2=A0 =C2=A0 =C2=A0return con ? con-&gt;head : -1;<br>
=C2=A0}<br>
<br>
-QemuUIInfo *qemu_console_get_ui_info(QemuConsole *con)<br>
-{<br>
-=C2=A0 =C2=A0 assert(con !=3D NULL);<br>
-=C2=A0 =C2=A0 return &amp;con-&gt;ui_info;<br>
-}<br>
-<br>
=C2=A0int qemu_console_get_width(QemuConsole *con, int fallback)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (con =3D=3D NULL) {<br>
-- <br>
2.27.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000000ee63705b5f31320--

