Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B2747D2F5
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 14:16:52 +0100 (CET)
Received: from localhost ([::1]:37472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n01UA-0003rx-Sj
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 08:16:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1n01OV-0002Es-Mr
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 08:11:00 -0500
Received: from [2a00:1450:4864:20::431] (port=41496
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1n01OU-0008Eh-3I
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 08:10:59 -0500
Received: by mail-wr1-x431.google.com with SMTP id a9so4812738wrr.8
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 05:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uNcFgp0jFoXjtfQEAhTs7yl5BgxDg6d7beMniuugV1k=;
 b=XiFeKJCL34Z2P0kItCckbDLDw15f1iDhNMMPhsssPvSB6rX/iUZT/548KQzu6Ay8JY
 qIQEwH+Pm4E2QC1tmcvH1Y2t2QXJfxQmI4qK5tzcPfH60XMjEWfdouP3W48zLisfBVNA
 z4oCieShOWfW7lAcOBCPAI1z4e0irggJ2lPYQS/0Se3q59iDuweQLZ3OSljGNNL4p6LP
 aJOSG1UYIlVjM4uDOUTrJNTIi/pL9y4F2Jza11wTp9N3UzSYtaR9je3InteiWGmwVbKn
 xpNCPlCJa/gcdTzoSrgzn2YRdKAMCUVtmSJaH27rJNrLYvS2KdehVhBXhpAHoOlq0Z2d
 QvFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uNcFgp0jFoXjtfQEAhTs7yl5BgxDg6d7beMniuugV1k=;
 b=UIBum/8d6ScHUgpBFZ6LPaHoOG5QPzTm8NiNE2RG0gnz2ORPukdfs2s1XDCBEbbtC5
 jel2UXMtrD96aWOV269fZiOOzlnRFKq+W4k9AX9incaVdbMiNN7Sr9y6OFm9sWvkqWFp
 ae30WWtPkJbFgocMPSPtOBn5gE6EIpufbRlI8wboemjl2IJCQqWqcbbLWoujLVRCgBxJ
 mbtMecX/zKHgTz/HrG6ajleK+0UzJmZIVnHZJefTnfA31xYAbryfBbI80w6nPRADK06L
 LaJJKEORua+BR4UT+kbE/s1bC0xJE/oCR97Hlw0XPpoIS2nHSehb0nT0ePvj+2vTK7WZ
 AHSw==
X-Gm-Message-State: AOAM531cOMDnlmGscNMU6KFKtNNtpv78e3IAOR4uMlaydp0OdfBZ0TAD
 kHfEDpd/5ZR0q4rBF57GEo3jbF25obGU6VpNdkM=
X-Google-Smtp-Source: ABdhPJxVD6Y7HlOKL5zmUPPo+WHH7WSX/GJYbzCSCkESKQDb3cpmTYc7WhMpThvVJ9iUZQdrf24J5lvRDFHRYafOq/o=
X-Received: by 2002:a5d:5887:: with SMTP id n7mr2108076wrf.436.1640178656234; 
 Wed, 22 Dec 2021 05:10:56 -0800 (PST)
MIME-Version: 1.0
References: <20211222010647.1332479-1-dpetroff@gmail.com>
 <20211222010647.1332479-5-dpetroff@gmail.com>
In-Reply-To: <20211222010647.1332479-5-dpetroff@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 22 Dec 2021 17:10:43 +0400
Message-ID: <CAJ+F1CKgN7G5f452c8b7T-nHJ24zx4CgtemdAqmh4utUPw_PkA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] ui/input-legacy: pass horizontal scroll information
To: Dmitry Petrov <dpetroff@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000002c4e8105d3bbda92"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002c4e8105d3bbda92
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Dec 22, 2021 at 5:31 AM Dmitry Petrov <dpetroff@gmail.com> wrote:

> This code seems to be used by vmport hack, passing these values allows
> to implement horizontal scroll support even when using vmport.
> In case it's not supported horizontal scroll will act as a vertical one.
>
> Signed-off-by: Dmitry Petrov <dpetroff@gmail.com>
>

Hmm, apparently Linux kernel handles PSMOUSE_VMMOUSE as a generic ps/2
mouse without the extensions.

And there is no horizontal scrolling in vmmouse protocol I can find.

---
>  ui/input-legacy.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/ui/input-legacy.c b/ui/input-legacy.c
> index 9fc78a639b..2c9a215d7f 100644
> --- a/ui/input-legacy.c
> +++ b/ui/input-legacy.c
> @@ -23,6 +23,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/log.h"
>  #include "qapi/qapi-commands-ui.h"
>  #include "ui/console.h"
>  #include "keymaps.h"
> @@ -179,6 +180,20 @@ static void legacy_mouse_event(DeviceState *dev,
> QemuConsole *src,
>                                      1,
>                                      s->buttons);
>          }
> +        if (btn->down && btn->button =3D=3D INPUT_BUTTON_WHEEL_RIGHT) {
> +            s->qemu_put_mouse_event(s->qemu_put_mouse_event_opaque,
> +                                    s->axis[INPUT_AXIS_X],
> +                                    s->axis[INPUT_AXIS_Y],
> +                                    -2,
> +                                    s->buttons);
> +        }
> +        if (btn->down && btn->button =3D=3D INPUT_BUTTON_WHEEL_LEFT) {
> +            s->qemu_put_mouse_event(s->qemu_put_mouse_event_opaque,
> +                                    s->axis[INPUT_AXIS_X],
> +                                    s->axis[INPUT_AXIS_Y],
> +                                    2,
> +                                    s->buttons);
> +        }
>

So I think mapping to vertical makes sense, although I am not sure it's
necessary.

         break;
>      case INPUT_EVENT_KIND_ABS:
>          move =3D evt->u.abs.data;
> @@ -216,6 +231,7 @@ QEMUPutMouseEntry
> *qemu_add_mouse_event_handler(QEMUPutMouseEvent *func,
>      QEMUPutMouseEntry *s;
>
>      s =3D g_new0(QEMUPutMouseEntry, 1);
> +    qemu_log("qemu_add_mouse_event_handler %s", name);
>
>
Please remove that logging


>      s->qemu_put_mouse_event =3D func;
>      s->qemu_put_mouse_event_opaque =3D opaque;
> --
> 2.32.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000002c4e8105d3bbda92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 22, 2021 at 5:31 AM Dmi=
try Petrov &lt;<a href=3D"mailto:dpetroff@gmail.com">dpetroff@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This=
 code seems to be used by vmport hack, passing these values allows<br>
to implement horizontal scroll support even when using vmport.<br>
In case it&#39;s not supported horizontal scroll will act as a vertical one=
.<br>
<br>
Signed-off-by: Dmitry Petrov &lt;<a href=3D"mailto:dpetroff@gmail.com" targ=
et=3D"_blank">dpetroff@gmail.com</a>&gt;<br></blockquote><div><br></div><di=
v>Hmm, apparently Linux kernel handles PSMOUSE_VMMOUSE as a generic ps/2 mo=
use without the extensions.</div><div><br></div><div>And there is no horizo=
ntal scrolling in vmmouse protocol I can find.</div><div><br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0ui/input-legacy.c | 16 ++++++++++++++++<br>
=C2=A01 file changed, 16 insertions(+)<br>
<br>
diff --git a/ui/input-legacy.c b/ui/input-legacy.c<br>
index 9fc78a639b..2c9a215d7f 100644<br>
--- a/ui/input-legacy.c<br>
+++ b/ui/input-legacy.c<br>
@@ -23,6 +23,7 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu/log.h&quot;<br>
=C2=A0#include &quot;qapi/qapi-commands-ui.h&quot;<br>
=C2=A0#include &quot;ui/console.h&quot;<br>
=C2=A0#include &quot;keymaps.h&quot;<br>
@@ -179,6 +180,20 @@ static void legacy_mouse_event(DeviceState *dev, QemuC=
onsole *src,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;buttons);<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (btn-&gt;down &amp;&amp; btn-&gt;button =3D=
=3D INPUT_BUTTON_WHEEL_RIGHT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;qemu_put_mouse_event(s-&gt=
;qemu_put_mouse_event_opaque,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;axis[INPUT_AXIS_=
X],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;axis[INPUT_AXIS_=
Y],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;buttons);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (btn-&gt;down &amp;&amp; btn-&gt;button =3D=
=3D INPUT_BUTTON_WHEEL_LEFT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;qemu_put_mouse_event(s-&gt=
;qemu_put_mouse_event_opaque,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;axis[INPUT_AXIS_=
X],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;axis[INPUT_AXIS_=
Y],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;buttons);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>So I thi=
nk mapping to vertical makes sense, although I am not sure it&#39;s necessa=
ry.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case INPUT_EVENT_KIND_ABS:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0move =3D evt-&gt;u.abs.data;<br>
@@ -216,6 +231,7 @@ QEMUPutMouseEntry *qemu_add_mouse_event_handler(QEMUPut=
MouseEvent *func,<br>
=C2=A0 =C2=A0 =C2=A0QEMUPutMouseEntry *s;<br>
<br>
=C2=A0 =C2=A0 =C2=A0s =3D g_new0(QEMUPutMouseEntry, 1);<br>
+=C2=A0 =C2=A0 qemu_log(&quot;qemu_add_mouse_event_handler %s&quot;, name);=
<br>
<br></blockquote><div><br></div><div>Please remove that logging<br></div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0s-&gt;qemu_put_mouse_event =3D func;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;qemu_put_mouse_event_opaque =3D opaque;<br>
-- <br>
2.32.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000002c4e8105d3bbda92--

