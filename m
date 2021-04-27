Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7587E36C16A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 11:01:35 +0200 (CEST)
Received: from localhost ([::1]:46814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbJb4-00082I-H6
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 05:01:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lbJWo-0003gc-8o
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 04:57:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lbJWj-0001s4-EW
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 04:57:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619513824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ibRhOTDmX9mTWUtXSW8sZSvW+9+pCI58p8Vn/EBY/Ew=;
 b=SUKXf8Ck5xXGEJ2N7ddp7kxPv/PKZ3IgdtKONbbGkpGrLVO1EcG3It2oP5fdZgtEGathmv
 XJuWYq619kK1XQgz+VYIEldL5zVHhZt/eYaMy0LlcJ5syZ1s1TS7uEqiGT5Utvbj3mkzEb
 jhTnvSJq3HzoxBxH4rGL9/hRruVHNhY=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-ngtc_65lOOS1mPccCUgr2w-1; Tue, 27 Apr 2021 04:57:00 -0400
X-MC-Unique: ngtc_65lOOS1mPccCUgr2w-1
Received: by mail-pj1-f69.google.com with SMTP id
 p11-20020a17090ad30bb029014dcd9154e1so806200pju.0
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 01:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ibRhOTDmX9mTWUtXSW8sZSvW+9+pCI58p8Vn/EBY/Ew=;
 b=IK6SE69Xv3RkRwzAYsBUsNwt/4bh5iXNwnwKEXnog2c0ZE3LK9frooxd6iHFzTXGSB
 QZ275zNB4WvQBU/CuIGL/W8mrEjn/cCnIR2Iy86FVCQcgXPI8NhxMJCEomqLGtlPWsXj
 y2JrsaoJ0gGrTvVLwt0tkFnFYFkbIeOK7YnunwyWogGJ+QstzMe4r9eNmhvcKMpFjLCZ
 hFGTD2hKNvqZ2mkKYHhABoKHPdB3890ceC4hhYIIbeJt+onR7nOsfSYi4mI7aNt3bViP
 o+Dy6SGPmIEeYBu3JCvcKjEqUweBETLnMm8Wa4zjRHRY7YGwPMmjbCfSOKxb1eCBrG95
 LRLw==
X-Gm-Message-State: AOAM530y7WEhQMaCZYlClZIZRKHRlhQJyoYhtPqPzcidmq1W42t6KkoO
 BtcjQTW8kg0Ga0QHxa9pBfMA9o5/TYNoSV9pHqjK1c8deL3hBEN2iBKEBkdZtpqsJzU6jm04l8e
 yss9YPQEVfZ5VDqgoQKFBfusgoo7D3pE=
X-Received: by 2002:a17:90a:510d:: with SMTP id
 t13mr25018894pjh.97.1619513819144; 
 Tue, 27 Apr 2021 01:56:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQjaQ9qyFHDOFUzN8AwMjglzGUqEbDWwlCb8cYSvZxXE73GgiT3nUHKoLdl2soY4wnXxrwxxec52vmvm8p44o=
X-Received: by 2002:a17:90a:510d:: with SMTP id
 t13mr25018876pjh.97.1619513818839; 
 Tue, 27 Apr 2021 01:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210423083351.2096734-1-kraxel@redhat.com>
 <20210423083351.2096734-6-kraxel@redhat.com>
In-Reply-To: <20210423083351.2096734-6-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 27 Apr 2021 12:56:47 +0400
Message-ID: <CAMxuvaxOgK9wAvOU=PSpnnr-Se-uku08iTy2ODuG+g=pF3Ugaw@mail.gmail.com>
Subject: Re: [PATCH v4 5/9] ui/vdagent: add mouse support
To: Gerd Hoffmann <kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000e1eae805c0f0714f"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e1eae805c0f0714f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 23, 2021 at 12:34 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> This patch adds support for mouse messages to the vdagent
> implementation.  This can be enabled/disabled using the new
> 'mouse' parameter for the vdagent chardev.  Default is on.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  chardev/char.c |   3 +
>  ui/vdagent.c   | 150 +++++++++++++++++++++++++++++++++++++++++++++++++
>  qapi/char.json |   4 +-
>  3 files changed, 156 insertions(+), 1 deletion(-)
>
> diff --git a/chardev/char.c b/chardev/char.c
> index 398f09df19cd..9714057541fb 100644
> --- a/chardev/char.c
> +++ b/chardev/char.c
> @@ -932,6 +932,9 @@ QemuOptsList qemu_chardev_opts =3D {
>          },{
>              .name =3D "logappend",
>              .type =3D QEMU_OPT_BOOL,
> +        },{
> +            .name =3D "mouse",
> +            .type =3D QEMU_OPT_BOOL,
>  #ifdef CONFIG_LINUX
>          },{
>              .name =3D "tight",
> diff --git a/ui/vdagent.c b/ui/vdagent.c
> index 98d1a2ee3415..e914a33bae20 100644
> --- a/ui/vdagent.c
> +++ b/ui/vdagent.c
> @@ -1,15 +1,25 @@
>  #include "qemu/osdep.h"
>  #include "include/qemu-common.h"
>  #include "chardev/char.h"
> +#include "hw/qdev-core.h"
> +#include "qemu/option.h"
> +#include "ui/console.h"
> +#include "ui/input.h"
>  #include "trace.h"
>
>  #include "qapi/qapi-types-char.h"
> +#include "qapi/qapi-types-ui.h"
>
>  #include "spice/vd_agent.h"
>
> +#define VDAGENT_MOUSE_DEFAULT true
> +
>  struct VDAgentChardev {
>      Chardev parent;
>
> +    /* config */
> +    bool mouse;
> +
>      /* guest vdagent */
>      uint32_t caps;
>      VDIChunkHeader chunk;
> @@ -18,6 +28,14 @@ struct VDAgentChardev {
>      uint32_t msgsize;
>      uint8_t *xbuf;
>      uint32_t xoff, xsize;
> +
> +    /* mouse */
> +    DeviceState mouse_dev;
> +    uint32_t mouse_x;
> +    uint32_t mouse_y;
> +    uint32_t mouse_btn;
> +    uint32_t mouse_display;
> +    QemuInputHandlerState *mouse_hs;
>  };
>  typedef struct VDAgentChardev VDAgentChardev;
>
> @@ -122,13 +140,113 @@ static void vdagent_send_caps(VDAgentChardev *vd)
>      g_autofree VDAgentMessage *msg =3D g_malloc0(sizeof(VDAgentMessage) =
+
>
> sizeof(VDAgentAnnounceCapabilities) +
>                                                 sizeof(uint32_t));
> +    VDAgentAnnounceCapabilities *caps =3D (void *)msg->data;
>
>      msg->type =3D VD_AGENT_ANNOUNCE_CAPABILITIES;
>      msg->size =3D sizeof(VDAgentAnnounceCapabilities) + sizeof(uint32_t)=
;
> +    if (vd->mouse) {
> +        caps->caps[0] |=3D (1 << VD_AGENT_CAP_MOUSE_STATE);
> +    }
>
>      vdagent_send_msg(vd, msg);
>  }
>
> +/* ------------------------------------------------------------------ */
> +/* mouse events                                                       */
> +
> +static bool have_mouse(VDAgentChardev *vd)
> +{
> +    return vd->mouse &&
> +        (vd->caps & (1 << VD_AGENT_CAP_MOUSE_STATE));
> +}
> +
> +static void vdagent_send_mouse(VDAgentChardev *vd)
> +{
> +    g_autofree VDAgentMessage *msg =3D g_malloc0(sizeof(VDAgentMessage) =
+
> +                                               sizeof(VDAgentMouseState)=
);
> +    VDAgentMouseState *mouse =3D (void *)msg->data;
> +
> +    msg->type =3D VD_AGENT_MOUSE_STATE;
> +    msg->size =3D sizeof(VDAgentMouseState);
> +
> +    mouse->x          =3D vd->mouse_x;
> +    mouse->y          =3D vd->mouse_y;
> +    mouse->buttons    =3D vd->mouse_btn;
> +    mouse->display_id =3D vd->mouse_display;
> +
> +    vdagent_send_msg(vd, msg);
> +}
> +
> +static void vdagent_pointer_event(DeviceState *dev, QemuConsole *src,
> +                                  InputEvent *evt)
> +{
> +    static const int bmap[INPUT_BUTTON__MAX] =3D {
> +        [INPUT_BUTTON_LEFT]        =3D VD_AGENT_LBUTTON_MASK,
> +        [INPUT_BUTTON_RIGHT]       =3D VD_AGENT_RBUTTON_MASK,
> +        [INPUT_BUTTON_MIDDLE]      =3D VD_AGENT_MBUTTON_MASK,
> +        [INPUT_BUTTON_WHEEL_UP]    =3D VD_AGENT_UBUTTON_MASK,
> +        [INPUT_BUTTON_WHEEL_DOWN]  =3D VD_AGENT_DBUTTON_MASK,
> +#if 0
> +        [INPUT_BUTTON_SIDE]        =3D VD_AGENT_SBUTTON_MASK,
> +        [INPUT_BUTTON_EXTRA]       =3D VD_AGENT_EBUTTON_MASK,
> +#endif
> +    };
> +
> +    VDAgentChardev *vd =3D container_of(dev, struct VDAgentChardev,
> mouse_dev);
> +    InputMoveEvent *move;
> +    InputBtnEvent *btn;
> +    uint32_t xres, yres;
> +
> +    switch (evt->type) {
> +    case INPUT_EVENT_KIND_ABS:
> +        move =3D evt->u.abs.data;
> +        xres =3D qemu_console_get_width(src, 1024);
> +        yres =3D qemu_console_get_height(src, 768);
> +        if (move->axis =3D=3D INPUT_AXIS_X) {
> +            vd->mouse_x =3D qemu_input_scale_axis(move->value,
> +                                                INPUT_EVENT_ABS_MIN,
> +                                                INPUT_EVENT_ABS_MAX,
> +                                                0, xres);
> +        } else if (move->axis =3D=3D INPUT_AXIS_Y) {
> +            vd->mouse_y =3D qemu_input_scale_axis(move->value,
> +                                                INPUT_EVENT_ABS_MIN,
> +                                                INPUT_EVENT_ABS_MAX,
> +                                                0, yres);
> +        }
> +        vd->mouse_display =3D qemu_console_get_index(src);
> +        break;
> +
> +    case INPUT_EVENT_KIND_BTN:
> +        btn =3D evt->u.btn.data;
> +        if (btn->down) {
> +            vd->mouse_btn |=3D bmap[btn->button];
> +        } else {
> +            vd->mouse_btn &=3D ~bmap[btn->button];
> +        }
> +        break;
> +
> +    default:
> +        /* keep gcc happy */
> +        break;
> +    }
> +}
> +
> +static void vdagent_pointer_sync(DeviceState *dev)
> +{
> +    VDAgentChardev *vd =3D container_of(dev, struct VDAgentChardev,
> mouse_dev);
> +
> +    if (vd->caps & (1 << VD_AGENT_CAP_MOUSE_STATE)) {
> +        vdagent_send_mouse(vd);
> +    }
> +}
> +
> +static QemuInputHandler vdagent_mouse_handler =3D {
> +    .name  =3D "vdagent mouse",
> +    .mask  =3D INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_ABS,
> +    .event =3D vdagent_pointer_event,
> +    .sync  =3D vdagent_pointer_sync,
> +};
> +
>  /* ------------------------------------------------------------------ */
>  /* chardev backend                                                    */
>
> @@ -137,6 +255,19 @@ static void vdagent_chr_open(Chardev *chr,
>                               bool *be_opened,
>                               Error **errp)
>  {
> +    VDAgentChardev *vd =3D VDAGENT_CHARDEV(chr);
> +    ChardevVDAgent *cfg =3D backend->u.vdagent.data;
> +
> +    vd->mouse =3D VDAGENT_MOUSE_DEFAULT;
> +    if (cfg->has_mouse) {
> +        vd->mouse =3D cfg->mouse;
> +    }
> +
> +    if (vd->mouse) {
> +        vd->mouse_hs =3D qemu_input_handler_register(&vd->mouse_dev,
> +
>  &vdagent_mouse_handler);
> +    }
> +
>      *be_opened =3D true;
>  }
>
> @@ -160,6 +291,9 @@ static void vdagent_chr_recv_caps(VDAgentChardev *vd,
> VDAgentMessage *msg)
>      if (caps->request) {
>          vdagent_send_caps(vd);
>      }
> +    if (have_mouse(vd) && vd->mouse_hs) {
> +        qemu_input_handler_activate(vd->mouse_hs);
> +    }
>  }
>
>  static void vdagent_chr_recv_msg(VDAgentChardev *vd, VDAgentMessage *msg=
)
> @@ -282,18 +416,34 @@ static void vdagent_chr_set_fe_open(struct Chardev
> *chr, int fe_open)
>          /* reset state */
>          vdagent_reset_bufs(vd);
>          vd->caps =3D 0;
> +        if (vd->mouse_hs) {
> +            qemu_input_handler_deactivate(vd->mouse_hs);
> +        }
>          return;
>      }
>
>      trace_vdagent_open();
>  }
>
> +static void vdagent_chr_parse(QemuOpts *opts, ChardevBackend *backend,
> +                              Error **errp)
> +{
> +    ChardevVDAgent *cfg;
> +
> +    backend->type =3D CHARDEV_BACKEND_KIND_VDAGENT;
> +    cfg =3D backend->u.vdagent.data =3D g_new0(ChardevVDAgent, 1);
> +    qemu_chr_parse_common(opts, qapi_ChardevVDAgent_base(cfg));
> +    cfg->has_mouse =3D true;
> +    cfg->mouse =3D qemu_opt_get_bool(opts, "mouse", VDAGENT_MOUSE_DEFAUL=
T);
> +}
> +
>  /* ------------------------------------------------------------------ */
>
>  static void vdagent_chr_class_init(ObjectClass *oc, void *data)
>  {
>      ChardevClass *cc =3D CHARDEV_CLASS(oc);
>
> +    cc->parse            =3D vdagent_chr_parse;
>      cc->open             =3D vdagent_chr_open;
>      cc->chr_write        =3D vdagent_chr_write;
>      cc->chr_set_fe_open  =3D vdagent_chr_set_fe_open;
> diff --git a/qapi/char.json b/qapi/char.json
> index ca5a85f76b3e..880aa8f73333 100644
> --- a/qapi/char.json
> +++ b/qapi/char.json
> @@ -395,11 +395,13 @@
>  #
>  # Configuration info for vdagent.
>  #
> +# @mouse: enable/disable mouse, default is enabled.
> +#
>  # Since: 6.1
>  #
>  ##
>  { 'struct': 'ChardevVDAgent',
> -  'data': { },
> +  'data': { '*mouse': 'bool' },
>    'base': 'ChardevCommon',
>    'if': 'defined(CONFIG_SPICE_PROTOCOL)' }
>
> --
> 2.30.2
>
>

--000000000000e1eae805c0f0714f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 23, 2021 at 12:34 PM Gerd=
 Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This pa=
tch adds support for mouse messages to the vdagent<br>
implementation.=C2=A0 This can be enabled/disabled using the new<br>
&#39;mouse&#39; parameter for the vdagent chardev.=C2=A0 Default is on.<br>
<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br></blockquote><div><br></div><div>=
Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0chardev/char.c |=C2=A0 =C2=A03 +<br>
=C2=A0ui/vdagent.c=C2=A0 =C2=A0| 150 ++++++++++++++++++++++++++++++++++++++=
+++++++++++<br>
=C2=A0qapi/char.json |=C2=A0 =C2=A04 +-<br>
=C2=A03 files changed, 156 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/chardev/char.c b/chardev/char.c<br>
index 398f09df19cd..9714057541fb 100644<br>
--- a/chardev/char.c<br>
+++ b/chardev/char.c<br>
@@ -932,6 +932,9 @@ QemuOptsList qemu_chardev_opts =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;logappend&q=
uot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.type =3D QEMU_OPT_BOOL,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;mouse&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .type =3D QEMU_OPT_BOOL,<br>
=C2=A0#ifdef CONFIG_LINUX<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;tight&quot;=
,<br>
diff --git a/ui/vdagent.c b/ui/vdagent.c<br>
index 98d1a2ee3415..e914a33bae20 100644<br>
--- a/ui/vdagent.c<br>
+++ b/ui/vdagent.c<br>
@@ -1,15 +1,25 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;include/qemu-common.h&quot;<br>
=C2=A0#include &quot;chardev/char.h&quot;<br>
+#include &quot;hw/qdev-core.h&quot;<br>
+#include &quot;qemu/option.h&quot;<br>
+#include &quot;ui/console.h&quot;<br>
+#include &quot;ui/input.h&quot;<br>
=C2=A0#include &quot;trace.h&quot;<br>
<br>
=C2=A0#include &quot;qapi/qapi-types-char.h&quot;<br>
+#include &quot;qapi/qapi-types-ui.h&quot;<br>
<br>
=C2=A0#include &quot;spice/vd_agent.h&quot;<br>
<br>
+#define VDAGENT_MOUSE_DEFAULT true<br>
+<br>
=C2=A0struct VDAgentChardev {<br>
=C2=A0 =C2=A0 =C2=A0Chardev parent;<br>
<br>
+=C2=A0 =C2=A0 /* config */<br>
+=C2=A0 =C2=A0 bool mouse;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* guest vdagent */<br>
=C2=A0 =C2=A0 =C2=A0uint32_t caps;<br>
=C2=A0 =C2=A0 =C2=A0VDIChunkHeader chunk;<br>
@@ -18,6 +28,14 @@ struct VDAgentChardev {<br>
=C2=A0 =C2=A0 =C2=A0uint32_t msgsize;<br>
=C2=A0 =C2=A0 =C2=A0uint8_t *xbuf;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t xoff, xsize;<br>
+<br>
+=C2=A0 =C2=A0 /* mouse */<br>
+=C2=A0 =C2=A0 DeviceState mouse_dev;<br>
+=C2=A0 =C2=A0 uint32_t mouse_x;<br>
+=C2=A0 =C2=A0 uint32_t mouse_y;<br>
+=C2=A0 =C2=A0 uint32_t mouse_btn;<br>
+=C2=A0 =C2=A0 uint32_t mouse_display;<br>
+=C2=A0 =C2=A0 QemuInputHandlerState *mouse_hs;<br>
=C2=A0};<br>
=C2=A0typedef struct VDAgentChardev VDAgentChardev;<br>
<br>
@@ -122,13 +140,113 @@ static void vdagent_send_caps(VDAgentChardev *vd)<br=
>
=C2=A0 =C2=A0 =C2=A0g_autofree VDAgentMessage *msg =3D g_malloc0(sizeof(VDA=
gentMessage) +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 sizeof(VDAgentAnnounceCapabilities) +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 sizeof(uint32_t));<br>
+=C2=A0 =C2=A0 VDAgentAnnounceCapabilities *caps =3D (void *)msg-&gt;data;<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0msg-&gt;type =3D VD_AGENT_ANNOUNCE_CAPABILITIES;<br>
=C2=A0 =C2=A0 =C2=A0msg-&gt;size =3D sizeof(VDAgentAnnounceCapabilities) + =
sizeof(uint32_t);<br>
+=C2=A0 =C2=A0 if (vd-&gt;mouse) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 caps-&gt;caps[0] |=3D (1 &lt;&lt; VD_AGENT_CAP=
_MOUSE_STATE);<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0vdagent_send_msg(vd, msg);<br>
=C2=A0}<br>
<br>
+/* ------------------------------------------------------------------ */<b=
r>
+/* mouse events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+<br>
+static bool have_mouse(VDAgentChardev *vd)<br>
+{<br>
+=C2=A0 =C2=A0 return vd-&gt;mouse &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (vd-&gt;caps &amp; (1 &lt;&lt; VD_AGENT_CAP_MO=
USE_STATE));<br>
+}<br>
+<br>
+static void vdagent_send_mouse(VDAgentChardev *vd)<br>
+{<br>
+=C2=A0 =C2=A0 g_autofree VDAgentMessage *msg =3D g_malloc0(sizeof(VDAgentM=
essage) +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0sizeof(VDAgentMouseState));<br>
+=C2=A0 =C2=A0 VDAgentMouseState *mouse =3D (void *)msg-&gt;data;<br>
+<br>
+=C2=A0 =C2=A0 msg-&gt;type =3D VD_AGENT_MOUSE_STATE;<br>
+=C2=A0 =C2=A0 msg-&gt;size =3D sizeof(VDAgentMouseState);<br>
+<br>
+=C2=A0 =C2=A0 mouse-&gt;x=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D vd-&gt;mou=
se_x;<br>
+=C2=A0 =C2=A0 mouse-&gt;y=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D vd-&gt;mou=
se_y;<br>
+=C2=A0 =C2=A0 mouse-&gt;buttons=C2=A0 =C2=A0 =3D vd-&gt;mouse_btn;<br>
+=C2=A0 =C2=A0 mouse-&gt;display_id =3D vd-&gt;mouse_display;<br>
+<br>
+=C2=A0 =C2=A0 vdagent_send_msg(vd, msg);<br>
+}<br>
+<br>
+static void vdagent_pointer_event(DeviceState *dev, QemuConsole *src,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 InputEvent *evt)<br>
+{<br>
+=C2=A0 =C2=A0 static const int bmap[INPUT_BUTTON__MAX] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [INPUT_BUTTON_LEFT]=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =3D VD_AGENT_LBUTTON_MASK,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [INPUT_BUTTON_RIGHT]=C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D VD_AGENT_RBUTTON_MASK,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [INPUT_BUTTON_MIDDLE]=C2=A0 =C2=A0 =C2=A0 =3D =
VD_AGENT_MBUTTON_MASK,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [INPUT_BUTTON_WHEEL_UP]=C2=A0 =C2=A0 =3D VD_AG=
ENT_UBUTTON_MASK,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [INPUT_BUTTON_WHEEL_DOWN]=C2=A0 =3D VD_AGENT_D=
BUTTON_MASK,<br>
+#if 0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [INPUT_BUTTON_SIDE]=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =3D VD_AGENT_SBUTTON_MASK,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [INPUT_BUTTON_EXTRA]=C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D VD_AGENT_EBUTTON_MASK,<br>
+#endif<br>
+=C2=A0 =C2=A0 };<br>
+<br>
+=C2=A0 =C2=A0 VDAgentChardev *vd =3D container_of(dev, struct VDAgentChard=
ev, mouse_dev);<br>
+=C2=A0 =C2=A0 InputMoveEvent *move;<br>
+=C2=A0 =C2=A0 InputBtnEvent *btn;<br>
+=C2=A0 =C2=A0 uint32_t xres, yres;<br>
+<br>
+=C2=A0 =C2=A0 switch (evt-&gt;type) {<br>
+=C2=A0 =C2=A0 case INPUT_EVENT_KIND_ABS:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 move =3D evt-&gt;u.abs.data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xres =3D qemu_console_get_width(src, 1024);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 yres =3D qemu_console_get_height(src, 768);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (move-&gt;axis =3D=3D INPUT_AXIS_X) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vd-&gt;mouse_x =3D qemu_input_sc=
ale_axis(move-&gt;value,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 INPUT_EVENT_ABS_MIN,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 INPUT_EVENT_ABS_MAX,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0, xres);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (move-&gt;axis =3D=3D INPUT_AXIS_Y) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vd-&gt;mouse_y =3D qemu_input_sc=
ale_axis(move-&gt;value,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 INPUT_EVENT_ABS_MIN,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 INPUT_EVENT_ABS_MAX,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0, yres);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vd-&gt;mouse_display =3D qemu_console_get_inde=
x(src);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case INPUT_EVENT_KIND_BTN:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 btn =3D evt-&gt;u.btn.data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (btn-&gt;down) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vd-&gt;mouse_btn |=3D bmap[btn-&=
gt;button];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vd-&gt;mouse_btn &amp;=3D ~bmap[=
btn-&gt;button];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* keep gcc happy */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void vdagent_pointer_sync(DeviceState *dev)<br>
+{<br>
+=C2=A0 =C2=A0 VDAgentChardev *vd =3D container_of(dev, struct VDAgentChard=
ev, mouse_dev);<br>
+<br>
+=C2=A0 =C2=A0 if (vd-&gt;caps &amp; (1 &lt;&lt; VD_AGENT_CAP_MOUSE_STATE))=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vdagent_send_mouse(vd);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static QemuInputHandler vdagent_mouse_handler =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =3D &quot;vdagent mouse&quot;,<br>
+=C2=A0 =C2=A0 .mask=C2=A0 =3D INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_ABS,=
<br>
+=C2=A0 =C2=A0 .event =3D vdagent_pointer_event,<br>
+=C2=A0 =C2=A0 .sync=C2=A0 =3D vdagent_pointer_sync,<br>
+};<br>
+<br>
=C2=A0/* ------------------------------------------------------------------=
 */<br>
=C2=A0/* chardev backend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
<br>
@@ -137,6 +255,19 @@ static void vdagent_chr_open(Chardev *chr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool *be_opened,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 VDAgentChardev *vd =3D VDAGENT_CHARDEV(chr);<br>
+=C2=A0 =C2=A0 ChardevVDAgent *cfg =3D backend-&gt;u.vdagent.data;<br>
+<br>
+=C2=A0 =C2=A0 vd-&gt;mouse =3D VDAGENT_MOUSE_DEFAULT;<br>
+=C2=A0 =C2=A0 if (cfg-&gt;has_mouse) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vd-&gt;mouse =3D cfg-&gt;mouse;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (vd-&gt;mouse) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vd-&gt;mouse_hs =3D qemu_input_handler_registe=
r(&amp;vd-&gt;mouse_dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;vdagent_mouse_handler);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0*be_opened =3D true;<br>
=C2=A0}<br>
<br>
@@ -160,6 +291,9 @@ static void vdagent_chr_recv_caps(VDAgentChardev *vd, V=
DAgentMessage *msg)<br>
=C2=A0 =C2=A0 =C2=A0if (caps-&gt;request) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vdagent_send_caps(vd);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 if (have_mouse(vd) &amp;&amp; vd-&gt;mouse_hs) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_input_handler_activate(vd-&gt;mouse_hs);<=
br>
+=C2=A0 =C2=A0 }<br>
=C2=A0}<br>
<br>
=C2=A0static void vdagent_chr_recv_msg(VDAgentChardev *vd, VDAgentMessage *=
msg)<br>
@@ -282,18 +416,34 @@ static void vdagent_chr_set_fe_open(struct Chardev *c=
hr, int fe_open)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* reset state */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vdagent_reset_bufs(vd);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vd-&gt;caps =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vd-&gt;mouse_hs) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_input_handler_deactivate(vd=
-&gt;mouse_hs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0trace_vdagent_open();<br>
=C2=A0}<br>
<br>
+static void vdagent_chr_parse(QemuOpts *opts, ChardevBackend *backend,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 ChardevVDAgent *cfg;<br>
+<br>
+=C2=A0 =C2=A0 backend-&gt;type =3D CHARDEV_BACKEND_KIND_VDAGENT;<br>
+=C2=A0 =C2=A0 cfg =3D backend-&gt;u.vdagent.data =3D g_new0(ChardevVDAgent=
, 1);<br>
+=C2=A0 =C2=A0 qemu_chr_parse_common(opts, qapi_ChardevVDAgent_base(cfg));<=
br>
+=C2=A0 =C2=A0 cfg-&gt;has_mouse =3D true;<br>
+=C2=A0 =C2=A0 cfg-&gt;mouse =3D qemu_opt_get_bool(opts, &quot;mouse&quot;,=
 VDAGENT_MOUSE_DEFAULT);<br>
+}<br>
+<br>
=C2=A0/* ------------------------------------------------------------------=
 */<br>
<br>
=C2=A0static void vdagent_chr_class_init(ObjectClass *oc, void *data)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0ChardevClass *cc =3D CHARDEV_CLASS(oc);<br>
<br>
+=C2=A0 =C2=A0 cc-&gt;parse=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D vd=
agent_chr_parse;<br>
=C2=A0 =C2=A0 =C2=A0cc-&gt;open=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D vdagent_chr_open;<br>
=C2=A0 =C2=A0 =C2=A0cc-&gt;chr_write=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D vdagent=
_chr_write;<br>
=C2=A0 =C2=A0 =C2=A0cc-&gt;chr_set_fe_open=C2=A0 =3D vdagent_chr_set_fe_ope=
n;<br>
diff --git a/qapi/char.json b/qapi/char.json<br>
index ca5a85f76b3e..880aa8f73333 100644<br>
--- a/qapi/char.json<br>
+++ b/qapi/char.json<br>
@@ -395,11 +395,13 @@<br>
=C2=A0#<br>
=C2=A0# Configuration info for vdagent.<br>
=C2=A0#<br>
+# @mouse: enable/disable mouse, default is enabled.<br>
+#<br>
=C2=A0# Since: 6.1<br>
=C2=A0#<br>
=C2=A0##<br>
=C2=A0{ &#39;struct&#39;: &#39;ChardevVDAgent&#39;,<br>
-=C2=A0 &#39;data&#39;: { },<br>
+=C2=A0 &#39;data&#39;: { &#39;*mouse&#39;: &#39;bool&#39; },<br>
=C2=A0 =C2=A0&#39;base&#39;: &#39;ChardevCommon&#39;,<br>
=C2=A0 =C2=A0&#39;if&#39;: &#39;defined(CONFIG_SPICE_PROTOCOL)&#39; }<br>
<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div></div>

--000000000000e1eae805c0f0714f--


