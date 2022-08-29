Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 915235A4AC9
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 13:55:03 +0200 (CEST)
Received: from localhost ([::1]:43252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSdM6-0007eY-MM
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 07:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oSdIo-0003QT-9C
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 07:51:38 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:35471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oSdIm-0006TG-If
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 07:51:38 -0400
Received: by mail-lj1-x22f.google.com with SMTP id k22so7768926ljg.2
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 04:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=7RiowvTgqN4f5B7e6f84J0ZvcPSMKd5Y8EMhatcA4rk=;
 b=hv2DkqUo3xRHAycv6HcszxXcnxTGNl/Hk+D4YBg5wlgGkrC432y8DX/+YwfZZQDWwz
 4n9xe7yvUodiTgoWAtRvyQDBeQ8n7eOn3UKN+p37Ql83YvwK4VSHcsQ6+RoBEP0Q7AGs
 5oUJxmWgfR9YzquaXY1GC9w5E3NlhEgI+hC0j/joaIyMbE+71HvK9720liUQNOWqoF4d
 MMQS1/ebGpe8UrH68W7/PEWX9pwpayC/30Zy/SRyMYmZdtMPWu6WAIeTSMqlscvmusC6
 GV1P0lLi6qqgSXf/f4DDhp7wVypiG+k/ZFvCNq4RocPngZIgoceK/gS3gwJTgnQcuA2m
 c73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=7RiowvTgqN4f5B7e6f84J0ZvcPSMKd5Y8EMhatcA4rk=;
 b=SjJ13d15adIYpjj5yDiEDfOmFJjl6fIHhv4vBOVi/BOhhrz8B9px1OCHczGXeOOZ/M
 SKFckyEubswLU883u3kP0oP+n5AFVzv9m3Rml8UcjprchnCFqqA1gTc0eokxkB3U4lGy
 OvDzc/oOTdll+vwQ+jF3zxC/+LWY/VK2aElzkdmg1jbWzHk6mdsAyVQ7sbGR2CYtA8iK
 bvQ3LK5zZv4FtD3zy827fk9O6CWvJELiLtHWaLBO6zKKnbdoPgvnseswNeHjySESzBwj
 Sumi2uSJUyyFj3wfpcAgSRs9AMgaMYscS02fKbaQt+UAhmOF0NjXsgaUy6b7/dJZ+IUg
 jFCg==
X-Gm-Message-State: ACgBeo13WrDCytb3O37OWuCnJOV40pHMVZwMaJjtDOZlCmAyFUBuRBji
 /7WPqQOyoGNhXTS4OsOMdVOdkre9/LGtT1d9Ypkngp8sXeY=
X-Google-Smtp-Source: AA6agR5oTQMQiygwNEqqVZR72pvM7oMSDtnQo0yx5bn7vjueBPabTCMcq4oQj2FaKN7ceoqh+jKHzXsASw2RmnkPrIc=
X-Received: by 2002:a2e:a78e:0:b0:261:d661:14b8 with SMTP id
 c14-20020a2ea78e000000b00261d66114b8mr5716333ljf.452.1661773894918; Mon, 29
 Aug 2022 04:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220829083120.143415-1-akihiko.odaki@daynix.com>
In-Reply-To: <20220829083120.143415-1-akihiko.odaki@daynix.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 29 Aug 2022 15:51:23 +0400
Message-ID: <CAJ+F1CL_0FkzQKAHMdqqm8yLEsT5MPX16uQ0znSREELQnsu5ag@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update Akihiko Odaki's email address
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
Content-Type: multipart/alternative; boundary="000000000000b4252505e75fe27c"
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b4252505e75fe27c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Aug 29, 2022 at 12:33 PM Akihiko Odaki <akihiko.odaki@gmail.com>
wrote:

> I am now employed by Daynix. Although my role as a reviewer of
> macOS-related change is not very relevant to the employment, I decided
> to use the company email address to avoid confusions from different
> addresses.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>

Congrats :)
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5ce4227ff6..fd9bd1dca5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2451,7 +2451,7 @@ Core Audio framework backend
>  M: Gerd Hoffmann <kraxel@redhat.com>
>  M: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>  R: Christian Schoenebeck <qemu_oss@crudebyte.com>
> -R: Akihiko Odaki <akihiko.odaki@gmail.com>
> +R: Akihiko Odaki <akihiko.odaki@daynix.com>
>  S: Odd Fixes
>  F: audio/coreaudio.c
>
> @@ -2730,7 +2730,7 @@ F: util/drm.c
>  Cocoa graphics
>  M: Peter Maydell <peter.maydell@linaro.org>
>  M: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> -R: Akihiko Odaki <akihiko.odaki@gmail.com>
> +R: Akihiko Odaki <akihiko.odaki@daynix.com>
>  S: Odd Fixes
>  F: ui/cocoa.m
>
> --
> 2.37.2
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000b4252505e75fe27c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 29, 2022 at 12:33 PM Ak=
ihiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com">akihiko.odaki@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">I am now employed by Daynix. Although my role as a reviewer of<br>
macOS-related change is not very relevant to the employment, I decided<br>
to use the company email address to avoid confusions from different<br>
addresses.<br>
<br>
Signed-off-by: Akihiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@daynix.com=
" target=3D"_blank">akihiko.odaki@daynix.com</a>&gt;<br></blockquote><div><=
br></div><div><div>Congrats :)<br></div><div>Reviewed-by: Marc-Andr=C3=A9 L=
ureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@r=
edhat.com</a>&gt;</div><div><br></div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
---<br>
=C2=A0MAINTAINERS | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index 5ce4227ff6..fd9bd1dca5 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -2451,7 +2451,7 @@ Core Audio framework backend<br>
=C2=A0M: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_=
blank">kraxel@redhat.com</a>&gt;<br>
=C2=A0M: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org"=
 target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
=C2=A0R: Christian Schoenebeck &lt;<a href=3D"mailto:qemu_oss@crudebyte.com=
" target=3D"_blank">qemu_oss@crudebyte.com</a>&gt;<br>
-R: Akihiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com" target=3D"=
_blank">akihiko.odaki@gmail.com</a>&gt;<br>
+R: Akihiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@daynix.com" target=3D=
"_blank">akihiko.odaki@daynix.com</a>&gt;<br>
=C2=A0S: Odd Fixes<br>
=C2=A0F: audio/coreaudio.c<br>
<br>
@@ -2730,7 +2730,7 @@ F: util/drm.c<br>
=C2=A0Cocoa graphics<br>
=C2=A0M: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" targ=
et=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
=C2=A0M: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org"=
 target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
-R: Akihiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com" target=3D"=
_blank">akihiko.odaki@gmail.com</a>&gt;<br>
+R: Akihiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@daynix.com" target=3D=
"_blank">akihiko.odaki@daynix.com</a>&gt;<br>
=C2=A0S: Odd Fixes<br>
=C2=A0F: ui/cocoa.m<br>
<br>
-- <br>
2.37.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000b4252505e75fe27c--

