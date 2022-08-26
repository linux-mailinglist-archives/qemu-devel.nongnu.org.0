Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AA25A22E5
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 10:23:16 +0200 (CEST)
Received: from localhost ([::1]:46774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRUcV-0003aL-Kk
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 04:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oRUah-00026v-9X
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 04:21:23 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:43757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oRUaf-0000GL-53
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 04:21:22 -0400
Received: by mail-lf1-x136.google.com with SMTP id m3so1046844lfg.10
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 01:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=MLzV11SS3oVxNRF5wBjRZko24dy6Cc8IX/2jxGWGxTA=;
 b=XsIRLWuzPua2bahBrARdKWSEgEyFVbbWf5fSpoelBpQChyhQAc5vLytHgpgKAq0LED
 iNIWtCaHhaHLXWIKAF+OmapnFfTjAxwjRL+796YEwQ40QVmwZa0deDL+VcLqDZpru4zr
 lkatbomBRJsDlQOm4om0kaKM1VjHH9oQp42tUOkRuLJvikSVEQL8oTK8RswQLtDhv1OU
 /7SKGoguazjh7T5djvY+4HXNKOuGRJsUd22joP67RBYDeq93UYmAjdm5qIq9nY2toAc+
 SB8Jtom+apzK6FcQIcs+X3MB8i+rp7wsfe44/+8rzN3MxU6cj8/40H1s45+JMfYrnifv
 GE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=MLzV11SS3oVxNRF5wBjRZko24dy6Cc8IX/2jxGWGxTA=;
 b=uxA7X6qD5tP1J9HzjqKPzIdCuq856O1vtcyW4xIEC6k2yMtclA58WEyvSjJHtVSK4V
 9H9VVaaaSuU+9mIIV6zxPxZa7NEpp69wiqSBHZi38hvx78nuvaovLrLf8TDvsll1dU3g
 fKPhxvnVN+ZRYr5QEFbbDF3r6dycHJv9h2icIi8TmHP9svkmXAHvUy9KgwniewC+4ejE
 1UjbzQ4IVwv4OTp21xv9SOgq0Vrk4JFxLWGPk+9WiH3KPVJzX5u9UsKVklW+F9gpxCPt
 caePtBbaq+gj61a0sWsvMQCMJ0nadq10BVvcTumHdR2b8jG9rt+AXCMwNey9KWbMeXwU
 ChLQ==
X-Gm-Message-State: ACgBeo1swOxT8W60anEzxDnffIhGns4kFnOHALok+Qs3MS0AQs115RsW
 KrxksQn4FL/zHk69/eBa4+2kfWcS0MH1e6ZODzU=
X-Google-Smtp-Source: AA6agR53aQCu7rDQFzUWbpoIHzUGp+nJDEXcMagLWTxjtY1j7wmUemOEtNhweZ3L0B4WT/glpDimZHjvFKHmq7w8Q38=
X-Received: by 2002:a05:6512:1395:b0:48d:81c:5159 with SMTP id
 p21-20020a056512139500b0048d081c5159mr2494903lfa.375.1661502079013; Fri, 26
 Aug 2022 01:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220825165247.33704-1-davydov-max@yandex-team.ru>
In-Reply-To: <20220825165247.33704-1-davydov-max@yandex-team.ru>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 26 Aug 2022 12:21:07 +0400
Message-ID: <CAJ+F1CKj5zELJ=HHOde4FMk_q9P3-o4qD+0J0iO-LaSKJZievw@mail.gmail.com>
Subject: Re: [PATCH] chardev: fix segfault in finalize
To: Maksim Davydov <davydov-max@yandex-team.ru>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, yc-core@yandex-team.ru
Content-Type: multipart/alternative; boundary="0000000000003697ed05e72099e2"
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x136.google.com
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

--0000000000003697ed05e72099e2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi


On Thu, Aug 25, 2022 at 9:02 PM Maksim Davydov <davydov-max@yandex-team.ru>
wrote:

> If finalize chardev-msmouse or chardev-wctable is called immediately afte=
r
> init it cases QEMU to crash with segfault. This happens because of
> QTAILQ_REMOVE in qemu_input_handler_unregister tries to dereference
> NULL pointer.
> For instance, this error can be reproduced via `qom-list-properties`
> command.
>
> Signed-off-by: Maksim Davydov <davydov-max@yandex-team.ru>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  chardev/msmouse.c  | 4 +++-
>  chardev/wctablet.c | 4 +++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/chardev/msmouse.c b/chardev/msmouse.c
> index eb9231dcdb..2cc1b16561 100644
> --- a/chardev/msmouse.c
> +++ b/chardev/msmouse.c
> @@ -146,7 +146,9 @@ static void char_msmouse_finalize(Object *obj)
>  {
>      MouseChardev *mouse =3D MOUSE_CHARDEV(obj);
>
> -    qemu_input_handler_unregister(mouse->hs);
> +    if (mouse->hs) {
> +        qemu_input_handler_unregister(mouse->hs);
> +    }
>  }
>
>  static QemuInputHandler msmouse_handler =3D {
> diff --git a/chardev/wctablet.c b/chardev/wctablet.c
> index e8b292c43c..43bdf6b608 100644
> --- a/chardev/wctablet.c
> +++ b/chardev/wctablet.c
> @@ -319,7 +319,9 @@ static void wctablet_chr_finalize(Object *obj)
>  {
>      TabletChardev *tablet =3D WCTABLET_CHARDEV(obj);
>
> -    qemu_input_handler_unregister(tablet->hs);
> +    if (tablet->hs) {
> +        qemu_input_handler_unregister(tablet->hs);
> +    }
>  }
>
>  static void wctablet_chr_open(Chardev *chr,
> --
> 2.25.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000003697ed05e72099e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi<div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 25, 2022 at 9:02 PM Mak=
sim Davydov &lt;<a href=3D"mailto:davydov-max@yandex-team.ru">davydov-max@y=
andex-team.ru</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">If finalize chardev-msmouse or chardev-wctable is called immed=
iately after<br>
init it cases QEMU to crash with segfault. This happens because of<br>
QTAILQ_REMOVE in qemu_input_handler_unregister tries to dereference<br>
NULL pointer.<br>
For instance, this error can be reproduced via `qom-list-properties`<br>
command.<br>
<br>
Signed-off-by: Maksim Davydov &lt;<a href=3D"mailto:davydov-max@yandex-team=
.ru" target=3D"_blank">davydov-max@yandex-team.ru</a>&gt;<br></blockquote><=
div><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailt=
o:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><di=
v>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0chardev/msmouse.c=C2=A0 | 4 +++-<br>
=C2=A0chardev/wctablet.c | 4 +++-<br>
=C2=A02 files changed, 6 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/chardev/msmouse.c b/chardev/msmouse.c<br>
index eb9231dcdb..2cc1b16561 100644<br>
--- a/chardev/msmouse.c<br>
+++ b/chardev/msmouse.c<br>
@@ -146,7 +146,9 @@ static void char_msmouse_finalize(Object *obj)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0MouseChardev *mouse =3D MOUSE_CHARDEV(obj);<br>
<br>
-=C2=A0 =C2=A0 qemu_input_handler_unregister(mouse-&gt;hs);<br>
+=C2=A0 =C2=A0 if (mouse-&gt;hs) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_input_handler_unregister(mouse-&gt;hs);<b=
r>
+=C2=A0 =C2=A0 }<br>
=C2=A0}<br>
<br>
=C2=A0static QemuInputHandler msmouse_handler =3D {<br>
diff --git a/chardev/wctablet.c b/chardev/wctablet.c<br>
index e8b292c43c..43bdf6b608 100644<br>
--- a/chardev/wctablet.c<br>
+++ b/chardev/wctablet.c<br>
@@ -319,7 +319,9 @@ static void wctablet_chr_finalize(Object *obj)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0TabletChardev *tablet =3D WCTABLET_CHARDEV(obj);<br>
<br>
-=C2=A0 =C2=A0 qemu_input_handler_unregister(tablet-&gt;hs);<br>
+=C2=A0 =C2=A0 if (tablet-&gt;hs) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_input_handler_unregister(tablet-&gt;hs);<=
br>
+=C2=A0 =C2=A0 }<br>
=C2=A0}<br>
<br>
=C2=A0static void wctablet_chr_open(Chardev *chr,<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000003697ed05e72099e2--

