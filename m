Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0419B3D0C88
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:47:07 +0200 (CEST)
Received: from localhost ([::1]:49834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69kn-0006cY-L1
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m69iO-0003dW-K4
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:44:36 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:35745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m69iM-0001Xh-G7
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:44:36 -0400
Received: by mail-ed1-x52e.google.com with SMTP id ca14so1829237edb.2
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 03:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E7sy4Jub6F61d/U81anJHHb9P4xyrmY5Kz/iblw13Kk=;
 b=qTBHdMjRENpE3ubeXcITzPYcNRi9MW/SqKRfOrs5gVgjuGh8RGXx/8bN524xB9BrzQ
 Pr0zhyQzimKJWOgJbyKI2yLbVdEvqxYXBjXzb5KnZ298lU2/m2AatKcVbwn80ps+Y3lh
 hRHbB4xttYASwqs87ArC9qATVpqVJ930J6LqTl2HQdtSJQE9REn8MmeflBWLCc3VJns7
 fOF5nfMBwHRtfT7t/4svI8f54k7oGSDryKl7gMDnPIS1vbEojALOIVFQZaKmpCC1ooMc
 H7OQWMT9NW9rOPGDUnqrLwXGKsn6v+2X3PTccN/c2mlseXlPRtLTTHZjLHuFMDmY7gt9
 fYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E7sy4Jub6F61d/U81anJHHb9P4xyrmY5Kz/iblw13Kk=;
 b=X+ab/RcYX3xPIMGBF+ZeFJxydC76vYgc1yMVfpb8SBQzfo7HNw3Tt5ZJCejrVeerhS
 6dIlbX35aK0Tobl0pIzLJ6bwtXLhL/LUGLSo7I5q6R8/6fuK3iU5TqZPnM5I7+r3yMQ8
 uHq91OxwW9h+zv3q5sJdWOlfzHmQiadHWNRFXaNv/NhUVjXRaE1jqzi8AFv69wZ7ABOM
 KtQjranOBG3d0Juj14KYXoxDcaIPwjCoGkpW3pmmvHa+1etHYCSLlfPlChDYSD6qGX4P
 GD9Odz8y/wDNclvG/IrugvRUFgg52MC1m5ZTx6l3p7fm0tsk0OdhHj+L3dOX8sctszNb
 EK4Q==
X-Gm-Message-State: AOAM530lyqAN04Ufq9WEErRTRYY/Row1i3TbVCrXbvgchJH5azYQlezj
 7e3XiekmIfYoRPpvoa7sNksfZukF3MPkMXxdiMA=
X-Google-Smtp-Source: ABdhPJwenhtRpVz2DbKgBkQWfuorvaJFQLTNbCdW3MmJq0lTqTg0DU0xUNG8z0W0u74tiTRyFpeNVl2H9zVNxmqpfBI=
X-Received: by 2002:a50:fe95:: with SMTP id d21mr47253228edt.257.1626864273257; 
 Wed, 21 Jul 2021 03:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210721093347.338536-1-kraxel@redhat.com>
 <20210721093347.338536-3-kraxel@redhat.com>
In-Reply-To: <20210721093347.338536-3-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 21 Jul 2021 14:44:20 +0400
Message-ID: <CAJ+F1C++MxpoLDgTsSfSAUf9fYu0ftHbZXFTb+QjmLyTEiGYzQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Revert "qxl: add migration blocker to avoid pre-save
 assert"
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000001af90405c79fdb7a"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52e.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001af90405c79fdb7a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 21, 2021 at 1:34 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> This reverts commit 86dbcdd9c7590d06db89ca256c5eaf0b4aba8858.
>
> The pre-save assert is gone now, so the migration blocker
> is not needed any more.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  hw/display/qxl.h |  1 -
>  hw/display/qxl.c | 31 -------------------------------
>  2 files changed, 32 deletions(-)
>
> diff --git a/hw/display/qxl.h b/hw/display/qxl.h
> index 379d3304abc1..30d21f4d0bdc 100644
> --- a/hw/display/qxl.h
> +++ b/hw/display/qxl.h
> @@ -39,7 +39,6 @@ struct PCIQXLDevice {
>      uint32_t           cmdlog;
>
>      uint32_t           guest_bug;
> -    Error              *migration_blocker;
>
>      enum qxl_mode      mode;
>      uint32_t           cmdflags;
> diff --git a/hw/display/qxl.c b/hw/display/qxl.c
> index 3867b94fe236..43482d4364ba 100644
> --- a/hw/display/qxl.c
> +++ b/hw/display/qxl.c
> @@ -30,7 +30,6 @@
>  #include "qemu/module.h"
>  #include "hw/qdev-properties.h"
>  #include "sysemu/runstate.h"
> -#include "migration/blocker.h"
>  #include "migration/vmstate.h"
>  #include "trace.h"
>
> @@ -666,30 +665,6 @@ static int interface_get_command(QXLInstance *sin,
> struct QXLCommandExt *ext)
>          qxl->guest_primary.commands++;
>          qxl_track_command(qxl, ext);
>          qxl_log_command(qxl, "cmd", ext);
> -        {
> -            /*
> -             * Windows 8 drivers place qxl commands in the vram
> -             * (instead of the ram) bar.  We can't live migrate such a
> -             * guest, so add a migration blocker in case we detect
> -             * this, to avoid triggering the assert in pre_save().
> -             *
> -             *
> https://cgit.freedesktop.org/spice/win32/qxl-wddm-dod/commit/?id=3Df6e099=
db39e7d0787f294d5fd0dce328b5210faa
> -             */
> -            void *msg =3D qxl_phys2virt(qxl, ext->cmd.data, ext->group_i=
d);
> -            if (msg !=3D NULL && (
> -                    msg < (void *)qxl->vga.vram_ptr ||
> -                    msg > ((void *)qxl->vga.vram_ptr +
> qxl->vga.vram_size))) {
> -                if (!qxl->migration_blocker) {
> -                    Error *local_err =3D NULL;
> -                    error_setg(&qxl->migration_blocker,
> -                               "qxl: guest bug: command not in ram bar")=
;
> -                    migrate_add_blocker(qxl->migration_blocker,
> &local_err);
> -                    if (local_err) {
> -                        error_report_err(local_err);
> -                    }
> -                }
> -            }
> -        }
>          trace_qxl_ring_command_get(qxl->id,
> qxl_mode_to_string(qxl->mode));
>          return true;
>      default:
> @@ -1283,12 +1258,6 @@ static void qxl_hard_reset(PCIQXLDevice *d, int
> loadvm)
>      qemu_spice_create_host_memslot(&d->ssd);
>      qxl_soft_reset(d);
>
> -    if (d->migration_blocker) {
> -        migrate_del_blocker(d->migration_blocker);
> -        error_free(d->migration_blocker);
> -        d->migration_blocker =3D NULL;
> -    }
> -
>      if (startstop) {
>          qemu_spice_display_start();
>      }
> --
> 2.31.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000001af90405c79fdb7a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 21, 2021 at 1:34 PM Gerd =
Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This rev=
erts commit 86dbcdd9c7590d06db89ca256c5eaf0b4aba8858.<br>
<br>
The pre-save assert is gone now, so the migration blocker<br>
is not needed any more.<br>
<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br></blockquote><div><br></div><div>=
<div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div> </div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0hw/display/qxl.h |=C2=A0 1 -<br>
=C2=A0hw/display/qxl.c | 31 -------------------------------<br>
=C2=A02 files changed, 32 deletions(-)<br>
<br>
diff --git a/hw/display/qxl.h b/hw/display/qxl.h<br>
index 379d3304abc1..30d21f4d0bdc 100644<br>
--- a/hw/display/qxl.h<br>
+++ b/hw/display/qxl.h<br>
@@ -39,7 +39,6 @@ struct PCIQXLDevice {<br>
=C2=A0 =C2=A0 =C2=A0uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmdlog=
;<br>
<br>
=C2=A0 =C2=A0 =C2=A0uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0guest_=
bug;<br>
-=C2=A0 =C2=A0 Error=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *migra=
tion_blocker;<br>
<br>
=C2=A0 =C2=A0 =C2=A0enum qxl_mode=C2=A0 =C2=A0 =C2=A0 mode;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmdfla=
gs;<br>
diff --git a/hw/display/qxl.c b/hw/display/qxl.c<br>
index 3867b94fe236..43482d4364ba 100644<br>
--- a/hw/display/qxl.c<br>
+++ b/hw/display/qxl.c<br>
@@ -30,7 +30,6 @@<br>
=C2=A0#include &quot;qemu/module.h&quot;<br>
=C2=A0#include &quot;hw/qdev-properties.h&quot;<br>
=C2=A0#include &quot;sysemu/runstate.h&quot;<br>
-#include &quot;migration/blocker.h&quot;<br>
=C2=A0#include &quot;migration/vmstate.h&quot;<br>
=C2=A0#include &quot;trace.h&quot;<br>
<br>
@@ -666,30 +665,6 @@ static int interface_get_command(QXLInstance *sin, str=
uct QXLCommandExt *ext)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qxl-&gt;guest_primary.commands++;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qxl_track_command(qxl, ext);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qxl_log_command(qxl, &quot;cmd&quot;, ext=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Windows 8 drivers place =
qxl commands in the vram<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* (instead of the ram) bar=
.=C2=A0 We can&#39;t live migrate such a<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* guest, so add a migratio=
n blocker in case we detect<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* this, to avoid triggerin=
g the assert in pre_save().<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* <a href=3D"https://cgit.=
freedesktop.org/spice/win32/qxl-wddm-dod/commit/?id=3Df6e099db39e7d0787f294=
d5fd0dce328b5210faa" rel=3D"noreferrer" target=3D"_blank">https://cgit.free=
desktop.org/spice/win32/qxl-wddm-dod/commit/?id=3Df6e099db39e7d0787f294d5fd=
0dce328b5210faa</a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *msg =3D qxl_phys2virt(qxl,=
 ext-&gt;cmd.data, ext-&gt;group_id);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (msg !=3D NULL &amp;&amp; (<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =
&lt; (void *)qxl-&gt;vga.vram_ptr ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =
&gt; ((void *)qxl-&gt;vga.vram_ptr + qxl-&gt;vga.vram_size))) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!qxl-&gt;migra=
tion_blocker) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Erro=
r *local_err =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 erro=
r_setg(&amp;qxl-&gt;migration_blocker,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;qxl: guest bug: command not in =
ram bar&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 migr=
ate_add_blocker(qxl-&gt;migration_blocker, &amp;local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (=
local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 error_report_err(local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_qxl_ring_command_get(qxl-&gt;id, qx=
l_mode_to_string(qxl-&gt;mode));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
@@ -1283,12 +1258,6 @@ static void qxl_hard_reset(PCIQXLDevice *d, int load=
vm)<br>
=C2=A0 =C2=A0 =C2=A0qemu_spice_create_host_memslot(&amp;d-&gt;ssd);<br>
=C2=A0 =C2=A0 =C2=A0qxl_soft_reset(d);<br>
<br>
-=C2=A0 =C2=A0 if (d-&gt;migration_blocker) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 migrate_del_blocker(d-&gt;migration_blocker);<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_free(d-&gt;migration_blocker);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;migration_blocker =3D NULL;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
=C2=A0 =C2=A0 =C2=A0if (startstop) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_spice_display_start();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.31.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000001af90405c79fdb7a--

