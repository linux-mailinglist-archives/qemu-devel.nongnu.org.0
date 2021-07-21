Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8CF3D0A79
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 10:26:49 +0200 (CEST)
Received: from localhost ([::1]:38380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m67Z2-00065e-Vd
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 04:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m67XK-00052N-VD
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:25:03 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:37736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m67XI-0007XV-T8
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:25:02 -0400
Received: by mail-ej1-x636.google.com with SMTP id hc15so1993520ejc.4
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 01:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E5ruM/0SiPImVU1z3Cutuj7Guv9B0/6xmjynmDQ7q9o=;
 b=qwRPffBYhbYxauTlwcMioPVRbzfYfTG9PCtdp8EnHEbNibMQZz6hY13jh+rYZ9vNrd
 PHyS1EIoiMHY1tWwj/I5jDXgQ9o2m6zX6aDfxejTE/G/rAr9mK9a1vKXaHJ93QjU6IY5
 zT5CeV+t1N/ltMPbTBqMqidOQGgcYEx3NiyCLFVSzBeNUctNXkR+8wje9dBZ3lVr4xFB
 mXZVf3/0HcLDzm1v9oBjkYG1vXdlAU3nEb4AMpDgriaypdY/sW8js+uLaLpnOuslxgaa
 uD+cokXeTYDH/65kU+5liUCQmYC0ZcWY0MBLKw9JO0cE1syVcTVFuLdlel4y5yMvQ8b3
 EHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E5ruM/0SiPImVU1z3Cutuj7Guv9B0/6xmjynmDQ7q9o=;
 b=NF4KROlRp7cgxnCrXROPVBqy1LgabBagRgqBPlAFZxFed/GzfYa1k2e6kTlMQwquyX
 Si9GYfjRTumHZikUiKUqAkjMtyY9NFPAeYbm7HyJ0rL0dW01l3eMIZMXaGhie6lGcYrD
 meKR2HIBrhELDeOkVqSUaT+HsVff/ME4DJuog0biURDUpJnqbP6qrmgRCYZUG2S/u83E
 IsLDzuGZbEOBU0nMR1zMOYz+RKhPIFkM6mrj3AcsOx2GWGBJkqY/7z8ufMpcMaGtUXyC
 ZaBDDqhSIhGeVCq0olPw/WnIU4MlcRO9T7g8GoC7Rgha+/j7KBt4WKtPGkAP2+OycwF1
 ebeg==
X-Gm-Message-State: AOAM533W6mSdKbRc7Vv3Ig/U3aPykqXaD2rqQhPwNn2M1iC9cgZeEE8W
 PUr68XbXc22olBpgmzZFaQwox8v2edj5XQU1rRJia5h1aSA=
X-Google-Smtp-Source: ABdhPJzNE09amlHNASlK0s2MjTkFw2j08f/jWnl/c0izxhmdrs582MPrJV4xFMsnlXFnVOvKdBVls536dLtiGzuQ6vk=
X-Received: by 2002:a17:906:9742:: with SMTP id
 o2mr37450642ejy.532.1626855898899; 
 Wed, 21 Jul 2021 01:24:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210719072654.845901-1-marcandre.lureau@redhat.com>
 <20210719072654.845901-8-marcandre.lureau@redhat.com>
In-Reply-To: <20210719072654.845901-8-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 21 Jul 2021 12:24:46 +0400
Message-ID: <CAJ+F1CLMRcYkoOJTUHevvJt7xPct9D7qvuYafNdLxxGiG65Kvg@mail.gmail.com>
Subject: Re: [PATCH 07/12] ui/vdagent: unregister clipboard peer on finalize
To: QEMU <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000f46a5005c79de757"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x636.google.com
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

--000000000000f46a5005c79de757
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Jul 19, 2021 at 11:30 AM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  ui/vdagent.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/ui/vdagent.c b/ui/vdagent.c
> index 5ae5734c81..bce9f44b7b 100644
> --- a/ui/vdagent.c
> +++ b/ui/vdagent.c
> @@ -782,6 +782,7 @@ static void vdagent_chr_fini(Object *obj)
>      VDAgentChardev *vd =3D QEMU_VDAGENT_CHARDEV(obj);
>
>      buffer_free(&vd->outbuf);
> +    qemu_clipboard_peer_unregister(&vd->cbpeer);
>

The call needs to be guarded, as notifier_remove() crashes on non-added
notifiers. The mouse handler should also be deactivated. Similarly to
set_fe_open(false). And I realize that outbuf should also be reset in that
case.

 }
>
>  static const TypeInfo vdagent_chr_type_info =3D {
> --
> 2.32.0.93.g670b81a890
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000f46a5005c79de757
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 19, 2021 at 11:30 AM &l=
t;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat=
.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
---<br>
=C2=A0ui/vdagent.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/ui/vdagent.c b/ui/vdagent.c<br>
index 5ae5734c81..bce9f44b7b 100644<br>
--- a/ui/vdagent.c<br>
+++ b/ui/vdagent.c<br>
@@ -782,6 +782,7 @@ static void vdagent_chr_fini(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0VDAgentChardev *vd =3D QEMU_VDAGENT_CHARDEV(obj);<br>
<br>
=C2=A0 =C2=A0 =C2=A0buffer_free(&amp;vd-&gt;outbuf);<br>
+=C2=A0 =C2=A0 qemu_clipboard_peer_unregister(&amp;vd-&gt;cbpeer);<br></blo=
ckquote><div><br></div><div>The call needs to be guarded, as notifier_remov=
e() crashes on non-added notifiers. The mouse handler should also be deacti=
vated. Similarly to set_fe_open(false). And I realize that outbuf should al=
so be reset in that case.</div><div><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
=C2=A0}<br>
<br>
=C2=A0static const TypeInfo vdagent_chr_type_info =3D {<br>
-- <br>
2.32.0.93.g670b81a890<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000f46a5005c79de757--

