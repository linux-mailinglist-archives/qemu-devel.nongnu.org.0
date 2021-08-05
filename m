Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DCB3E1771
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 16:59:30 +0200 (CEST)
Received: from localhost ([::1]:55058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBeqH-0007KL-BM
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 10:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mBeos-0006En-Qg
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 10:58:02 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:40663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mBeoq-0001HW-Ma
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 10:58:02 -0400
Received: by mail-ej1-x62c.google.com with SMTP id oz16so10078312ejc.7
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 07:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wuhuylTnNEfj6OMEW3ZFqeh6a6aCV1stSvvyPPwiR/0=;
 b=R3Ojl5LIArOQdjBCO3euNs307WlCD7hlTDR3uOXgLRBe4v/n6Tu0F9mUO3mXrDJklD
 IoZgUXIsGpFBa+8KIjGUGMZhPJeWtRAt68r2NsyEN/FpRnmyHR7MQ7G4XM7QDYrzmS2u
 CD9of6wyeDT1U3CWyuW1K6fNg2t68ohYmw9x5+6Beu8PZnp48mf40mdQlHxY17tSkHlZ
 oLg0l9HAxGBSrXTkf/Vh+9v3Zz6pbgeFHwOv7Yve8nK/2yyxMJe+rfhFi3okD1Db0QkH
 mzw6XcjS0cNrp5pNyF4xjHAR9HBcGh+Nxr1JpPbmfpwYjtrIeTemjygyz19SG0rGJ5FH
 tsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wuhuylTnNEfj6OMEW3ZFqeh6a6aCV1stSvvyPPwiR/0=;
 b=gHu6yzhUEfxfr/waHoMYed2wPNLWIwTzZDTr544P02yS89VXSUc6PNVbQv4/WcPF+d
 3B1WiWMKmO1TDQAw1jryBpi8fov0gqb4tOwseWmU0GiVS02vwlJsD6BkWwh+f7zGneNK
 1fyQYqoSq4TXYHzc85v5lJWm75TjqRtlWGbzrbJPGk4G/Pd9wuLtTwID8aI6laMWXOq+
 REktgPW1twovevw1o6mQNbL3sSjv7+6z1kC9Nb1LSr4bj4I9JyOTqhE0FEc2pjFl2k2W
 0pyXBYFL4RkcXT9PLzF4fQtCrxnfos1whQQX5jHGBVAPn7x++pM0HbvyocmIEEojsT9H
 T1pA==
X-Gm-Message-State: AOAM532cMIgdE+8Aj+hPyGFC5GrCCSbIk8ft9blx8BYaCFpDEyOyaxaR
 PYZ5ytaeeT6MtjVQkoB+a+y6d6VS3s1TH9w+Hm5z6RkHWFRFow==
X-Google-Smtp-Source: ABdhPJx1uRdgovX8IOszDa3uFDwqn+4W0667Ax6ti84VQAJmi1D+OhHIvMWOWivHwRCkvUf7e3GyWlaxf6uG0yE6U/M=
X-Received: by 2002:a17:906:c013:: with SMTP id
 e19mr5342538ejz.389.1628175478738; 
 Thu, 05 Aug 2021 07:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210805135715.857938-1-marcandre.lureau@redhat.com>
 <20210805135715.857938-19-marcandre.lureau@redhat.com>
In-Reply-To: <20210805135715.857938-19-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 5 Aug 2021 18:57:46 +0400
Message-ID: <CAJ+F1CJkDd+nvzP0vJn6GVZGBqg95eL-GDaUMb8yb7yBKB+M2g@mail.gmail.com>
Subject: Re: [PATCH v3 18/18] ui/vdagent: add a migration blocker
To: QEMU <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000000ad75905c8d125d6"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62c.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000ad75905c8d125d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 5, 2021 at 6:06 PM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The current implementation lacks migration support. After migration,
> vdagent support will be broken (even after a restart of the daemons).
> Let's try to fix it in 6.2.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  ui/vdagent.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/ui/vdagent.c b/ui/vdagent.c
> index 7d8cb963ff..603a2a7bd2 100644
> --- a/ui/vdagent.c
> +++ b/ui/vdagent.c
> @@ -6,6 +6,7 @@
>  #include "qemu/option.h"
>  #include "qemu/units.h"
>  #include "hw/qdev-core.h"
> +#include "migration/blocker.h"
>  #include "ui/clipboard.h"
>  #include "ui/console.h"
>  #include "ui/input.h"
> @@ -23,6 +24,9 @@
>  struct VDAgentChardev {
>      Chardev parent;
>
> +    /* TODO: migration isn't yet supported */
> +    Error *migration_blocker;
> +
>      /* config */
>      bool mouse;
>      bool clipboard;
> @@ -599,6 +603,10 @@ static void vdagent_chr_open(Chardev *chr,
>      return;
>  #endif
>
> +    if (migrate_add_blocker(vd->migration_blocker, errp) !=3D 0) {
> +        return;
> +    }
> +
>      vd->mouse =3D VDAGENT_MOUSE_DEFAULT;
>      if (cfg->has_mouse) {
>          vd->mouse =3D cfg->mouse;
> @@ -832,6 +840,8 @@ static void vdagent_chr_init(Object *obj)
>      VDAgentChardev *vd =3D QEMU_VDAGENT_CHARDEV(obj);
>
>      buffer_init(&vd->outbuf, "vdagent-outbuf");
> +    error_setg(&vd->migration_blocker,
> +               "The vdagent chardev doesn't yet support migration");
>  }
>
>  static void vdagent_chr_fini(Object *obj)
> @@ -840,6 +850,7 @@ static void vdagent_chr_fini(Object *obj)
>
>
Missing
 +    migrate_del_blocker(vd->migration_blocker);

     vdagent_disconnect(vd);
>      buffer_free(&vd->outbuf);
> +    error_free(vd->migration_blocker);
>  }
>
>  static const TypeInfo vdagent_chr_type_info =3D {
> --
> 2.32.0.264.g75ae10bc75
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000000ad75905c8d125d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 5, 2021 at 6:06 PM &lt;<a=
 href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fro=
m: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com=
" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
The current implementation lacks migration support. After migration,<br>
vdagent support will be broken (even after a restart of the daemons).<br>
Let&#39;s try to fix it in 6.2.<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
---<br>
=C2=A0ui/vdagent.c | 11 +++++++++++<br>
=C2=A01 file changed, 11 insertions(+)<br>
<br>
diff --git a/ui/vdagent.c b/ui/vdagent.c<br>
index 7d8cb963ff..603a2a7bd2 100644<br>
--- a/ui/vdagent.c<br>
+++ b/ui/vdagent.c<br>
@@ -6,6 +6,7 @@<br>
=C2=A0#include &quot;qemu/option.h&quot;<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
=C2=A0#include &quot;hw/qdev-core.h&quot;<br>
+#include &quot;migration/blocker.h&quot;<br>
=C2=A0#include &quot;ui/clipboard.h&quot;<br>
=C2=A0#include &quot;ui/console.h&quot;<br>
=C2=A0#include &quot;ui/input.h&quot;<br>
@@ -23,6 +24,9 @@<br>
=C2=A0struct VDAgentChardev {<br>
=C2=A0 =C2=A0 =C2=A0Chardev parent;<br>
<br>
+=C2=A0 =C2=A0 /* TODO: migration isn&#39;t yet supported */<br>
+=C2=A0 =C2=A0 Error *migration_blocker;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* config */<br>
=C2=A0 =C2=A0 =C2=A0bool mouse;<br>
=C2=A0 =C2=A0 =C2=A0bool clipboard;<br>
@@ -599,6 +603,10 @@ static void vdagent_chr_open(Chardev *chr,<br>
=C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0#endif<br>
<br>
+=C2=A0 =C2=A0 if (migrate_add_blocker(vd-&gt;migration_blocker, errp) !=3D=
 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0vd-&gt;mouse =3D VDAGENT_MOUSE_DEFAULT;<br>
=C2=A0 =C2=A0 =C2=A0if (cfg-&gt;has_mouse) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vd-&gt;mouse =3D cfg-&gt;mouse;<br>
@@ -832,6 +840,8 @@ static void vdagent_chr_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0VDAgentChardev *vd =3D QEMU_VDAGENT_CHARDEV(obj);<br>
<br>
=C2=A0 =C2=A0 =C2=A0buffer_init(&amp;vd-&gt;outbuf, &quot;vdagent-outbuf&qu=
ot;);<br>
+=C2=A0 =C2=A0 error_setg(&amp;vd-&gt;migration_blocker,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;The vdagent c=
hardev doesn&#39;t yet support migration&quot;);<br>
=C2=A0}<br>
<br>
=C2=A0static void vdagent_chr_fini(Object *obj)<br>
@@ -840,6 +850,7 @@ static void vdagent_chr_fini(Object *obj)<br>
<br></blockquote><div><br></div><div>Missing<br></div><div>=C2=A0+ =C2=A0 =
=C2=A0migrate_del_blocker(vd-&gt;migration_blocker);</div><div><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0vdagent_disconnect(vd);<br>
=C2=A0 =C2=A0 =C2=A0buffer_free(&amp;vd-&gt;outbuf);<br>
+=C2=A0 =C2=A0 error_free(vd-&gt;migration_blocker);<br>
=C2=A0}<br>
<br>
=C2=A0static const TypeInfo vdagent_chr_type_info =3D {<br>
-- <br>
2.32.0.264.g75ae10bc75<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000000ad75905c8d125d6--

