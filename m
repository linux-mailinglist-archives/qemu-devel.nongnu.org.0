Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D30E2CED14
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 12:31:13 +0100 (CET)
Received: from localhost ([::1]:52320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl9Iu-0006Wl-3Y
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 06:31:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kl9Gh-0004pL-Od
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 06:28:55 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:45355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kl9Gg-0001HC-8S
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 06:28:55 -0500
Received: by mail-ej1-x642.google.com with SMTP id qw4so8135371ejb.12
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 03:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oDHjG/G1PIqpPKzznlQczzAN/BH1bAfzIEgbweAi0Sk=;
 b=eNkdD1VqAE2TLlTSAu97WUE/kf7PGT8rxiz2c4pRORJ8FpaG1QWApAziqSd2/qJ98u
 OoyMNsZwIWmhhvUZGAT2L8fsd+6vpN+tsLv/ZGJjn6PsZidFnNOxO5lPTqHNMzDPy9Zz
 5WfV7Kwh+ij3ZvVp2ORalXdaOOeO8OuYvJu9jdPaN3sAW5d0bgqCG+xiytxNFPeo652n
 tcnhols0ilKeg4Jhh+Nfz+LYwYzkopVNxE+dfvAYRpqnVUXaMoAiRiCl2/scrwYeIdEC
 S9fppWpBfiWUso1yBifJxRxCGVsO+9ocGR0sS+Nt9e9gQSK9us02SCXnoWjZ9pTHPRrN
 EFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oDHjG/G1PIqpPKzznlQczzAN/BH1bAfzIEgbweAi0Sk=;
 b=ICoC9rNyqTsiceymBO8FMTeh+T2FNaf9i5xQi+Ahfxi2NYD5I13e7GDUJdfeNeSLDS
 kEykdpgtIMOWOJuyMi5ysd0/LUOmf0k716I8j8NzmQBpp5N0oDcupC0854oAImGa5YGq
 y1xGKVjS2J0y0HyZqk3KiYlDllv0aE9ffmhFcvC2Bx5UkigWushp8caUGTDdbgOAul25
 uTcD3CKQHkDxSOGTndf+M82dIgCbXVRzOosbbTsMKJnhUIC9iCH/JDD/SByNA2u25ite
 N18dXhcPWhOlTf+oK3uG3F3tAzm5e4jLszDjMQYfwj3m+SdlKxyapnMqrOCo6iVrGVvO
 yBIg==
X-Gm-Message-State: AOAM533VDbYWNMw3rmj0FS5GkZMAye8icw1ka+rcxnFgzy1kBhit8dl1
 E4xF7fPVcEiJpZJhxMKv286cTtVTS3nez2QF8zM=
X-Google-Smtp-Source: ABdhPJxIh5RfZpVAu0wwmsyfXphx3tuEi5R6yayYNnFSN96QsrzqFVsCtdsLCVFYVrPEyxSysMPRbzQ+wbnvb89WkS4=
X-Received: by 2002:a17:906:3e02:: with SMTP id
 k2mr6773368eji.92.1607081331828; 
 Fri, 04 Dec 2020 03:28:51 -0800 (PST)
MIME-Version: 1.0
References: <20201203110806.13556-1-kraxel@redhat.com>
 <20201203110806.13556-2-kraxel@redhat.com>
In-Reply-To: <20201203110806.13556-2-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 4 Dec 2020 15:28:38 +0400
Message-ID: <CAJ+F1CKVPWPjV+FVhVqs=v+XaJbGWDoUfxCTi4MKOsUVQVJuXQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] console: allow con==NULL in dpy_set_ui_info
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e8accc05b5a1c77f"
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

--000000000000e8accc05b5a1c77f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Dec 3, 2020 at 3:20 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> Use active_console in that case like we do in many other places.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>

Why not do it for the remaining functions?
At least dpy_get_ui_info() for consistency.

---
>  ui/console.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/ui/console.c b/ui/console.c
> index 53dee8e26b17..16b326854080 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -1556,7 +1556,9 @@ const QemuUIInfo *dpy_get_ui_info(const QemuConsole
> *con)
>
>  int dpy_set_ui_info(QemuConsole *con, QemuUIInfo *info)
>  {
> -    assert(con !=3D NULL);
> +    if (con =3D=3D NULL) {
> +        con =3D active_console;
> +    }
>
>      if (!dpy_ui_info_supported(con)) {
>          return -1;
> --
> 2.27.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000e8accc05b5a1c77f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 3, 2020 at 3:20 PM Gerd=
 Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Use act=
ive_console in that case like we do in many other places.<br>
<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br></blockquote><div><br></div><div>=
Why not do it for the remaining functions?</div><div>At least dpy_get_ui_in=
fo() for consistency.<br></div><div><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
---<br>
=C2=A0ui/console.c | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/ui/console.c b/ui/console.c<br>
index 53dee8e26b17..16b326854080 100644<br>
--- a/ui/console.c<br>
+++ b/ui/console.c<br>
@@ -1556,7 +1556,9 @@ const QemuUIInfo *dpy_get_ui_info(const QemuConsole *=
con)<br>
<br>
=C2=A0int dpy_set_ui_info(QemuConsole *con, QemuUIInfo *info)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 assert(con !=3D NULL);<br>
+=C2=A0 =C2=A0 if (con =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 con =3D active_console;<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!dpy_ui_info_supported(con)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
-- <br>
2.27.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000e8accc05b5a1c77f--

