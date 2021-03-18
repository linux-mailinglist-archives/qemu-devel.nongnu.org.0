Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF41340320
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 11:27:00 +0100 (CET)
Received: from localhost ([::1]:41430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMprn-0004UY-99
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 06:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lMpqD-0003bJ-Pb
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:25:22 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:44832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lMpq3-0002EN-A7
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:25:20 -0400
Received: by mail-ej1-x630.google.com with SMTP id b9so3060679ejc.11
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 03:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VE1pY/U2HZXegbcIMFA94Y4Abxc9E75JjZ0QDCjH5Kc=;
 b=L/SFCvWrgRreR3xnP5EqdM95fw3R3HgQzQUZZNafFKws3imat8wTTRdMp9mOpZWVuH
 ndFhHIo5IrZmEL2yog1KSp8DD7WaFwTafCgj77qigvsqQgTgKx+UTs0xo3pthWzRBZ9e
 2wrNQtEQB7ZaVTBmoICyS7/LyyrQtU0oN02Xmq0YupeJxHqU2z1lmcNY/GaoZjoZKhNs
 bB2q+LDP9hHVHLFC6Gucoe/1T92v0AVuRxZwpDoBNPA+FUiC7CuKXedCGXMYP/MuciWV
 7JpXX7/FviKvF6ZySp8Gomu+LZZv8U0Ep8ah4TjznF4ptHtiYsS9glznYfFwjyEUgHza
 c2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VE1pY/U2HZXegbcIMFA94Y4Abxc9E75JjZ0QDCjH5Kc=;
 b=QuXmk61zUaJNqutjpmSqMxh0pQ3xnyjXxgr7qSEIkeeALP/3Q8ADlCfIH5i2AL1Ae6
 yGuVaBoKd289ySQat47IKyO4ewhJ8kWKI+tjAZNtX6UYO1CvotMyWJFsZBgVHIQduQVG
 6/Oq4gGMtzcwF17vyqN1f5vW7RXEVajFdQpGz2efJfctDb2dc4dZFlVpOnRJMlCipaXF
 GOS3lmFQJdXjq4yWvyta8g3iq6gGmU8SGiNijZYPwLbC1xNQMUN4ic0y54h3s9BpbEdv
 /ZjRHIdWAkKpFv5iFhZMFc4doJez9ZoA0Xo3TYW96Eh1tlapv8rxe5lxMft43JgYITg2
 AYEQ==
X-Gm-Message-State: AOAM533DhhUXE8jRZ5+18JHmTu3MRWbuJgyS52dT93Afx+v+GlIXBfzd
 IOHCQ0TxSu6cfUPspTJAcwXoY8jm+t669LoudJC7dev+Lbk=
X-Google-Smtp-Source: ABdhPJwP9ciL1WeNlPx6IByehfun+R4/JTYdjViWLwNQAa9fwoKjEOk/TvcnDmHoT91oRVLJ3w5YvEPHtySYs6iVmUQ=
X-Received: by 2002:a17:907:3e8c:: with SMTP id
 hs12mr40420663ejc.105.1616063106536; 
 Thu, 18 Mar 2021 03:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210318091647.3233178-1-kraxel@redhat.com>
 <20210318091647.3233178-4-kraxel@redhat.com>
In-Reply-To: <20210318091647.3233178-4-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 18 Mar 2021 14:24:54 +0400
Message-ID: <CAJ+F1C+Dc=L7cQyoVc=p9pe+8Q7PfwzUkv3XifAbsSz+a332sA@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] ui/vdagent: add mouse support
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000066572e05bdcd0342"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x630.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000066572e05bdcd0342
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Mar 18, 2021 at 1:22 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> This patch adds support for mouse messages to the vdagent
> implementation.  This can be enabled/disabled using the new
> 'mouse' parameter for the vdagent chardev.  Default is on.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  chardev/char.c |   3 ++
>  ui/vdagent.c   | 141 +++++++++++++++++++++++++++++++++++++++++++++++++
>  qapi/char.json |   4 +-
>  3 files changed, 147 insertions(+), 1 deletion(-)
>
> diff --git a/chardev/char.c b/chardev/char.c
> index 97cafd68494a..fd4d86d0dd3f 100644
> --- a/chardev/char.c
> +++ b/chardev/char.c
> @@ -927,6 +927,9 @@ QemuOptsList qemu_chardev_opts =3D {
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
> index 146ddb8e31b4..61c12b02b573 100644
> --- a/ui/vdagent.c
> +++ b/ui/vdagent.c
> @@ -1,21 +1,38 @@
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
>      uint32_t chunksize;
>      uint8_t *msgbuf;
>      uint32_t msgsize;
> +
> +    /* mouse */
> +    DeviceState mouse_dev;
> +    uint32_t mouse_x;
> +    uint32_t mouse_y;
> +    uint32_t mouse_btn;
> +    QemuInputHandlerState *mouse_hs;
>  };
>  typedef struct VDAgentChardev VDAgentChardev;
>
> @@ -120,13 +137,105 @@ static void vdagent_send_caps(VDAgentChardev *vd)
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
> +    mouse->x       =3D vd->mouse_x;
> +    mouse->y       =3D vd->mouse_y;
> +    mouse->buttons =3D vd->mouse_btn;
> +
>

Should there be a TODO for device_id support ? If not, it could use a
comment.


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
> @@ -135,6 +244,19 @@ static void vdagent_chr_open(Chardev *chr,
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
> @@ -158,6 +280,9 @@ static void vdagent_chr_recv_caps(VDAgentChardev *vd,
> VDAgentMessage *msg)
>      if (caps->request) {
>          vdagent_send_caps(vd);
>      }
> +    if (vd->caps & (1 << VD_AGENT_CAP_MOUSE_STATE) && vd->mouse_hs) {
> +        qemu_input_handler_activate(vd->mouse_hs);
> +    }
>  }
>
>  static void vdagent_chr_recv(VDAgentChardev *vd)
> @@ -247,18 +372,34 @@ static void vdagent_chr_set_fe_open(struct Chardev
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
> index 6e565ce42753..586ef2137368 100644
> --- a/qapi/char.json
> +++ b/qapi/char.json
> @@ -395,10 +395,12 @@
>  #
>  # Configuration info for vdagent.
>  #
> +# @mouse: enable/disable mouse, default is enabled.
> +#
>  # Since: 6.0
>  ##
>  { 'struct': 'ChardevVDAgent',
> -  'data': { },
> +  'data': { '*mouse'    : 'bool' },
>    'base': 'ChardevCommon' }
>
>  ##
> --
> 2.30.2
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000066572e05bdcd0342
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 18, 2021 at 1:22 PM Ger=
d Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This p=
atch adds support for mouse messages to the vdagent<br>
implementation.=C2=A0 This can be enabled/disabled using the new<br>
&#39;mouse&#39; parameter for the vdagent chardev.=C2=A0 Default is on.<br>
<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br>
---<br>
=C2=A0chardev/char.c |=C2=A0 =C2=A03 ++<br>
=C2=A0ui/vdagent.c=C2=A0 =C2=A0| 141 ++++++++++++++++++++++++++++++++++++++=
+++++++++++<br>
=C2=A0qapi/char.json |=C2=A0 =C2=A04 +-<br>
=C2=A03 files changed, 147 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/chardev/char.c b/chardev/char.c<br>
index 97cafd68494a..fd4d86d0dd3f 100644<br>
--- a/chardev/char.c<br>
+++ b/chardev/char.c<br>
@@ -927,6 +927,9 @@ QemuOptsList qemu_chardev_opts =3D {<br>
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
index 146ddb8e31b4..61c12b02b573 100644<br>
--- a/ui/vdagent.c<br>
+++ b/ui/vdagent.c<br>
@@ -1,21 +1,38 @@<br>
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
=C2=A0 =C2=A0 =C2=A0uint32_t chunksize;<br>
=C2=A0 =C2=A0 =C2=A0uint8_t *msgbuf;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t msgsize;<br>
+<br>
+=C2=A0 =C2=A0 /* mouse */<br>
+=C2=A0 =C2=A0 DeviceState mouse_dev;<br>
+=C2=A0 =C2=A0 uint32_t mouse_x;<br>
+=C2=A0 =C2=A0 uint32_t mouse_y;<br>
+=C2=A0 =C2=A0 uint32_t mouse_btn;<br>
+=C2=A0 =C2=A0 QemuInputHandlerState *mouse_hs;<br>
=C2=A0};<br>
=C2=A0typedef struct VDAgentChardev VDAgentChardev;<br>
<br>
@@ -120,13 +137,105 @@ static void vdagent_send_caps(VDAgentChardev *vd)<br=
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
+=C2=A0 =C2=A0 mouse-&gt;x=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D vd-&gt;mouse_x;<br=
>
+=C2=A0 =C2=A0 mouse-&gt;y=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D vd-&gt;mouse_y;<br=
>
+=C2=A0 =C2=A0 mouse-&gt;buttons =3D vd-&gt;mouse_btn;<br>
+<br></blockquote><div><br></div><div>Should there be a TODO for device_id =
support ? If not, it could use a comment.<br></div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
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
@@ -135,6 +244,19 @@ static void vdagent_chr_open(Chardev *chr,<br>
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
@@ -158,6 +280,9 @@ static void vdagent_chr_recv_caps(VDAgentChardev *vd, V=
DAgentMessage *msg)<br>
=C2=A0 =C2=A0 =C2=A0if (caps-&gt;request) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vdagent_send_caps(vd);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 if (vd-&gt;caps &amp; (1 &lt;&lt; VD_AGENT_CAP_MOUSE_STATE) =
&amp;&amp; vd-&gt;mouse_hs) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_input_handler_activate(vd-&gt;mouse_hs);<=
br>
+=C2=A0 =C2=A0 }<br>
=C2=A0}<br>
<br>
=C2=A0static void vdagent_chr_recv(VDAgentChardev *vd)<br>
@@ -247,18 +372,34 @@ static void vdagent_chr_set_fe_open(struct Chardev *c=
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
index 6e565ce42753..586ef2137368 100644<br>
--- a/qapi/char.json<br>
+++ b/qapi/char.json<br>
@@ -395,10 +395,12 @@<br>
=C2=A0#<br>
=C2=A0# Configuration info for vdagent.<br>
=C2=A0#<br>
+# @mouse: enable/disable mouse, default is enabled.<br>
+#<br>
=C2=A0# Since: 6.0<br>
=C2=A0##<br>
=C2=A0{ &#39;struct&#39;: &#39;ChardevVDAgent&#39;,<br>
-=C2=A0 &#39;data&#39;: { },<br>
+=C2=A0 &#39;data&#39;: { &#39;*mouse&#39;=C2=A0 =C2=A0 : &#39;bool&#39; },=
<br>
=C2=A0 =C2=A0&#39;base&#39;: &#39;ChardevCommon&#39; }<br>
<br>
=C2=A0##<br>
-- <br>
2.30.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000066572e05bdcd0342--

