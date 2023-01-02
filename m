Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC7765B167
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 12:44:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCJDH-0004p7-O9; Mon, 02 Jan 2023 06:42:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pCJDG-0004oy-1o
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 06:42:42 -0500
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pCJDE-0001f1-Bk
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 06:42:41 -0500
Received: by mail-lj1-x230.google.com with SMTP id x37so21943925ljq.1
 for <qemu-devel@nongnu.org>; Mon, 02 Jan 2023 03:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q5k8lx/wBRwrEHPXb2Y7WGmdB9oPwuapV7VPFe0QVY4=;
 b=Cx5lXDUqN6oyEJfTTKC2hwA6rL2R3/dOJRUtlfFBw406DtljF5fLhHG/b3CTlpGB7Y
 IfpA96n077memOtGbKPgN4tKpHzIMrgD5BEdjKmH+4Pr6eo75Bq4OOgbslSdC3cMEGCV
 YX56feYJ4HIwduv/qwuYNmYn4wI1K5YyqUlH0EJ2WmOLZqFOqVX7Ke9FGedlHoQjzxkq
 FumwObjvqgmDPehqntrKrLyyAk8WI0oC8EIKaPZtxWIC23Kf/cCIN5FNcPSELG9yHfbV
 Zwl7jk7QLJw7GbyF5DphSxhPdEw0EW9ySCcolNv+6z4NgBF1zgvQONtj3bTdpzZrGUmP
 ZQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q5k8lx/wBRwrEHPXb2Y7WGmdB9oPwuapV7VPFe0QVY4=;
 b=zjcSYaJxGOT3BcDxf/sp7eZIja/8p8zfwp58rWhxSzL7P7aodwvAaRmR5tQ0yKzZcT
 ibyF0f/QhYaCjs7vXOVvqOT/NaBiZdE/ngFajzen6HFJ9N+h1KEa8rkR9h93OoPsqwwD
 BJDXNdFPbVUwUYsPQ5AoMWl6b7yZpvDhbF3R7NxeviIkdYQiHesfjYz0+/gECqlpM9E8
 04S7j17ih6RPNClcsVpLnFDmZcHW0C6KXgdumMkCv8wPfeOiwM9lemnWNQuZc/JxpiAo
 FKm/b9+maci+BORamHi8CONCIZJA5+ugAXoKP7XRW9YbqGAahtUWV6ML7q9Dsm/I6dLZ
 Q5dw==
X-Gm-Message-State: AFqh2kpMvuuh0wAazos21ZcMEffAhIfFlxkbV3U/fcv6aZ2b9QNVFHlX
 fZdWFsE/pz/AhlxX1NFG09hB1F5x20cZzg4lJEA=
X-Google-Smtp-Source: AMrXdXvqYVRV73pulXuUGyB49w5bBgmsMCoQL06IVjrISDQZ63AdHPp1P4p6D8ctZDscsxuO7emPHVqV+r2hsL6tnAQ=
X-Received: by 2002:a2e:9586:0:b0:27f:e145:bffe with SMTP id
 w6-20020a2e9586000000b0027fe145bffemr582412ljh.529.1672659758421; Mon, 02 Jan
 2023 03:42:38 -0800 (PST)
MIME-Version: 1.0
References: <20221230092758.281805-1-dengpc12@chinatelecom.cn>
 <20221230092758.281805-4-dengpc12@chinatelecom.cn>
In-Reply-To: <20221230092758.281805-4-dengpc12@chinatelecom.cn>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 2 Jan 2023 15:42:26 +0400
Message-ID: <CAJ+F1CK0DW+hr-7KkYt_E+qNRtPjaL3x_PwPZgT9tFS5nGB=Rw@mail.gmail.com>
Subject: Re: [PATCH RFC 3/4] vdagent: add live migration support
To: dengpc12@chinatelecom.cn
Cc: qemu-devel@nongnu.org, huangy81@chinatelecom.cn, liuym16@chinatelecom.cn, 
 kraxel@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi


On Fri, Dec 30, 2022 at 6:49 PM <dengpc12@chinatelecom.cn> wrote:
>
> From: "dengpc12@chinatelecom.cn" <dengpc12@chinatelecom.cn>
>
> To support live migration, we made the following 2 modifications:
> 1. save the caps field of VDAgentChardev.
> 2. register vdagent to qemu-clipboard after
>    vm device state being reloaded during live migration.
>
> Signed-off-by: dengpc12@chinatelecom.cn <dengpc12@chinatelecom.cn>
> Signed-off-by: liuym16@chinatelecom.cn <liuym16@chinatelecom.cn>
> ---
>  ui/trace-events |  1 +
>  ui/vdagent.c    | 28 ++++++++++++++++++++++++++++
>  2 files changed, 29 insertions(+)
>
> diff --git a/ui/trace-events b/ui/trace-events
> index 5e50b60da5..ccacd867d1 100644
> --- a/ui/trace-events
> +++ b/ui/trace-events
> @@ -144,6 +144,7 @@ vdagent_cb_grab_discard(const char *name, int cur, in=
t recv) "selection %s, cur:
>  vdagent_cb_grab_type(const char *name) "type %s"
>  vdagent_cb_serial_discard(uint32_t current, uint32_t received) "current=
=3D%u, received=3D%u"
>  vdagent_recv_caps(uint32_t caps) "received caps %u"
> +vdagent_migration_caps(uint32_t caps) "migrated caps %u"
>
>  # dbus.c
>  dbus_registered_listener(const char *bus_name) "peer %s"
> diff --git a/ui/vdagent.c b/ui/vdagent.c
> index 38061d5b38..1193abe348 100644
> --- a/ui/vdagent.c
> +++ b/ui/vdagent.c
> @@ -6,6 +6,7 @@
>  #include "qemu/units.h"
>  #include "hw/qdev-core.h"
>  #include "migration/blocker.h"
> +#include "migration/vmstate.h"
>  #include "ui/clipboard.h"
>  #include "ui/console.h"
>  #include "ui/input.h"
> @@ -906,6 +907,31 @@ static void vdagent_chr_parse(QemuOpts *opts, Charde=
vBackend *backend,
>
>  /* ------------------------------------------------------------------ */
>
> +static int vdagent_post_load(void *opaque, int version_id)
> +{
> +    VDAgentChardev *vd =3D QEMU_VDAGENT_CHARDEV(opaque);
> +
> +    trace_vdagent_migration_caps(vd->caps);
> +
> +    if (vd->caps) {
> +        vdagent_register_to_qemu_clipboard(vd);
> +        qemu_input_handler_activate(vd->mouse_hs);
> +    }
> +
> +    return 0;
> +}
> +
> +static const VMStateDescription vmstate_vdagent =3D {
> +    .name =3D "vdagent",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .post_load =3D vdagent_post_load,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINT32(caps, VDAgentChardev),

You are missing a lot of states from VDAgentChardev. Most of the
fields must be saved/restored.

> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
>  static void vdagent_chr_class_init(ObjectClass *oc, void *data)
>  {
>      ChardevClass *cc =3D CHARDEV_CLASS(oc);
> @@ -922,6 +948,8 @@ static void vdagent_chr_init(Object *obj)
>      VDAgentChardev *vd =3D QEMU_VDAGENT_CHARDEV(obj);
>
>      buffer_init(&vd->outbuf, "vdagent-outbuf");
> +
> +    vmstate_register(NULL, 0, &vmstate_vdagent, vd);
>      error_setg(&vd->migration_blocker,
>                 "The vdagent chardev doesn't yet support migration");
>  }
> --
> 2.27.0
>
>


--
Marc-Andr=C3=A9 Lureau

