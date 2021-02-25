Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DAD3255B4
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 19:40:46 +0100 (CET)
Received: from localhost ([::1]:36846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFLZ7-00070t-8M
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 13:40:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lFLVw-00067m-CF
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 13:37:28 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:43310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lFLVs-0007qE-9k
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 13:37:27 -0500
Received: by mail-ed1-x535.google.com with SMTP id d2so8146046edq.10
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 10:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1V9J9PBE/gL2kNQqB75LpC4WA6/H6lszzPWwGpRekyk=;
 b=NRLQZAHlK2B6bZ5V+FPcBobH0DYhQ825iiXhhk167iNDghsedfOmVoM11LdDoHOFW3
 DKzFbitch1TUNea5FzUvq4lxmotJS8jBe+zXw5xBMGm+zWTE4yshf7L3IkHoKNvQlolR
 r9KloZPw9gGj/opXs4nGSJcUusUAjR7YF5+4zs8F8zY4H5JJ0Ua/+XBvFQKpF369W2Wx
 EEfZs+0LujkFTSMJh8tnhUQynrZTmK55ZBAQ4M721OnQ8G/CSSYz4ql4DBDVBC8Xg6wY
 kfVOQOwKWf81/Y0E32jzAchw9wc2+7Ocs2eIZqBtvdXMLcGIXpI4bRL5OfQLHt1tnZzs
 XKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1V9J9PBE/gL2kNQqB75LpC4WA6/H6lszzPWwGpRekyk=;
 b=TayrgZmrL5oPK0QV+Eqbu6Ur+EwR8D765uDGMhR8NNA06ynY40tlleiIJjsvejpF4R
 uHc34+LEzg65Cf05ubCK18iBGlX9RFQsycjrEQI0D2UWYABWOk28acag2VTANkBmDPL7
 Nc+ONEMTF1rFBqfppnVqhE51ZUvDJrt7HaeKpAKvFpQgkeoRji18ERRT0z9hbje16DzE
 nr3wI1kdRSzi2Z34QYLTMyv41sGn2P8/5m+O7GoD2XjpFSH2IxAKWx0Kqs1LAE+1x8VQ
 wpnHJx/8a0jeXGT5wAKmIoL7jXYOBeMTvVSzkFBxeup5fuZeAw0rET3Gb4olr3A4h9HV
 Lefg==
X-Gm-Message-State: AOAM532iwcETEHL3N2Yn+iJQziVaBUPuuWCOlrdQmLh5bqZ/jIeM1l2H
 dTBI/VGe3JGZseYgDcG5iAH2bV1Ob+6cXgruVzg=
X-Google-Smtp-Source: ABdhPJy8raVJDWNy4+PxDIZATqb7x4zikzhnaPBEay9zlC8GRyqQBY/DBoRDAsLowmAGNVAXz3/iMO0Rdc9BMRKQ5O8=
X-Received: by 2002:aa7:cd94:: with SMTP id x20mr4537876edv.53.1614278241935; 
 Thu, 25 Feb 2021 10:37:21 -0800 (PST)
MIME-Version: 1.0
References: <20210219131349.3993192-1-kraxel@redhat.com>
 <20210219131349.3993192-5-kraxel@redhat.com>
In-Reply-To: <20210219131349.3993192-5-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 25 Feb 2021 22:37:10 +0400
Message-ID: <CAJ+F1CJROo_jwb4r=hD1=8iGXfpw88bAm4kgZaN+9tG37+GSCQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] ui/vdagent: add clipboard support
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000002de3e505bc2d7153"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x535.google.com
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

--0000000000002de3e505bc2d7153
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 19, 2021 at 5:19 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> This patch adds support for clipboard messages to the qemu vdagent
> implementation, which allows the guest exchange clipboard data with
> qemu.  Clipboard support can be enabled/disabled using the new
> 'clipboard' parameter for the vdagent chardev.  Default is off.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  chardev/char.c  |   3 +
>  ui/vdagent.c    | 243 ++++++++++++++++++++++++++++++++++++++++++++++++
>  qapi/char.json  |   4 +-
>  ui/trace-events |   2 +
>  4 files changed, 251 insertions(+), 1 deletion(-)
>
> diff --git a/chardev/char.c b/chardev/char.c
> index ea986dac1bff..7f3ee2c11f9d 100644
> --- a/chardev/char.c
> +++ b/chardev/char.c
> @@ -927,6 +927,9 @@ QemuOptsList qemu_chardev_opts =3D {
>          },{
>              .name =3D "mouse",
>              .type =3D QEMU_OPT_BOOL,
> +        },{
> +            .name =3D "clipboard",
> +            .type =3D QEMU_OPT_BOOL,
>  #ifdef CONFIG_LINUX
>          },{
>              .name =3D "tight",
> diff --git a/ui/vdagent.c b/ui/vdagent.c
> index b48b0129b9f2..ee058688027e 100644
> --- a/ui/vdagent.c
> +++ b/ui/vdagent.c
> @@ -3,6 +3,7 @@
>  #include "chardev/char.h"
>  #include "hw/qdev-core.h"
>  #include "qemu/option.h"
> +#include "ui/clipboard.h"
>  #include "ui/console.h"
>  #include "ui/input.h"
>  #include "trace.h"
> @@ -17,12 +18,14 @@
>                       VD_AGENT_MAX_DATA_SIZE)
>
>  #define VDAGENT_MOUSE_DEFAULT true
> +#define VDAGENT_CLIPBOARD_DEFAULT false
>
>  struct VDAgentChardev {
>      Chardev parent;
>
>      /* config */
>      bool mouse;
> +    bool clipboard;
>
>      /* guest vdagent */
>      uint32_t caps;
> @@ -35,6 +38,11 @@ struct VDAgentChardev {
>      uint32_t mouse_y;
>      uint32_t mouse_btn;
>      QemuInputHandlerState *mouse_hs;
> +
> +    /* clipboard */
> +    QemuClipboardPeer cbpeer;
> +    QemuClipboardInfo *cbinfo[QEMU_CLIPBOARD_SELECTION__COUNT];
> +    uint32_t cbpending[QEMU_CLIPBOARD_SELECTION__COUNT];
>  };
>  typedef struct VDAgentChardev VDAgentChardev;
>
> @@ -90,6 +98,24 @@ static const char *msg_name[] =3D {
>  #endif
>  };
>
> +static const char *sel_name[] =3D {
> +    [VD_AGENT_CLIPBOARD_SELECTION_CLIPBOARD] =3D "clipboard",
> +    [VD_AGENT_CLIPBOARD_SELECTION_PRIMARY]   =3D "primary",
> +    [VD_AGENT_CLIPBOARD_SELECTION_SECONDARY] =3D "secondary",
> +};
> +
> +static const char *type_name[] =3D {
> +    [VD_AGENT_CLIPBOARD_NONE]       =3D "none",
> +    [VD_AGENT_CLIPBOARD_UTF8_TEXT]  =3D "text",
> +    [VD_AGENT_CLIPBOARD_IMAGE_PNG]  =3D "png",
> +    [VD_AGENT_CLIPBOARD_IMAGE_BMP]  =3D "bmp",
> +    [VD_AGENT_CLIPBOARD_IMAGE_TIFF] =3D "tiff",
> +    [VD_AGENT_CLIPBOARD_IMAGE_JPG]  =3D "jpg",
> +#if 0
> +    [VD_AGENT_CLIPBOARD_FILE_LIST]  =3D "files",
> +#endif
> +};
> +
>  #define GET_NAME(_m, _v) \
>      (((_v) < ARRAY_SIZE(_m) && (_m[_v])) ? (_m[_v]) : "???")
>
> @@ -140,6 +166,10 @@ static void vdagent_send_caps(VDAgentChardev *vd)
>      if (vd->mouse) {
>          caps->caps[0] |=3D (1 << VD_AGENT_CAP_MOUSE_STATE);
>      }
> +    if (vd->clipboard) {
> +        caps->caps[0] |=3D (1 << VD_AGENT_CAP_CLIPBOARD_BY_DEMAND);
> +        caps->caps[0] |=3D (1 << VD_AGENT_CAP_CLIPBOARD_SELECTION);
> +    }
>
>      vdagent_send_msg(vd, msg);
>  }
> @@ -232,6 +262,193 @@ static QemuInputHandler vdagent_mouse_handler =3D {
>      .sync  =3D vdagent_pointer_sync,
>  };
>
> +/* ------------------------------------------------------------------ */
> +/* clipboard                                                          */
> +
> +static uint32_t type_qemu_to_vdagent(enum QemuClipboardType type)
> +{
> +    switch (type) {
> +    case QEMU_CLIPBOARD_TYPE_TEXT:
> +        return VD_AGENT_CLIPBOARD_UTF8_TEXT;
> +    default:
> +        return VD_AGENT_CLIPBOARD_NONE;
> +    }
> +}
> +
> +static void vdagent_send_clipboard_grab(VDAgentChardev *vd,
> +                                        QemuClipboardInfo *info)
> +{
> +    VDAgentMessage *msg =3D g_malloc0(sizeof(VDAgentMessage) +
> +                                    sizeof(uint32_t) *
> (QEMU_CLIPBOARD_TYPE__COUNT + 1));
> +    uint8_t *s =3D msg->data;
> +    uint32_t *data =3D (uint32_t *)(msg->data + 4);
> +    uint32_t q, v, type;
> +
> +    for (q =3D 0, v =3D 0; q < QEMU_CLIPBOARD_TYPE__COUNT; q++) {
> +        type =3D type_qemu_to_vdagent(q);
> +        if (type !=3D VD_AGENT_CLIPBOARD_NONE && info->types[q].availabl=
e) {
> +            data[v++] =3D type;
> +        }
> +    }
> +
> +    *s =3D info->selection;
> +    msg->type =3D VD_AGENT_CLIPBOARD_GRAB;
> +    msg->size =3D sizeof(uint32_t) * (v + 1);
> +
> +    vdagent_send_msg(vd, msg);
> +}
> +
> +static void vdagent_send_clipboard_data(VDAgentChardev *vd,
> +                                        QemuClipboardInfo *info,
> +                                        QemuClipboardType type)
> +{
> +    VDAgentMessage *msg =3D g_malloc0(sizeof(VDAgentMessage) +
> +                                    sizeof(uint32_t) * 2 +
> +                                    info->types[type].size);
> +
> +    uint8_t *s =3D msg->data;
> +    uint32_t *t =3D (uint32_t *)(msg->data + 4);
> +    uint8_t *d =3D msg->data + 8;
> +
> +    *s =3D info->selection;
> +    *t =3D type_qemu_to_vdagent(type);
> +    memcpy(d, info->types[type].data, info->types[type].size);
> +
> +    msg->type =3D VD_AGENT_CLIPBOARD;
> +    msg->size =3D sizeof(uint32_t) * 2 + info->types[type].size;
> +
> +    vdagent_send_msg(vd, msg);
> +}
> +
> +static void vdagent_clipboard_notify(Notifier *notifier, void *data)
> +{
> +    VDAgentChardev *vd =3D container_of(notifier, VDAgentChardev,
> cbpeer.update);
> +    QemuClipboardInfo *info =3D data;
> +    QemuClipboardSelection s =3D info->selection;
> +    QemuClipboardType type;
> +    bool self_update =3D info->owner =3D=3D &vd->cbpeer;
> +
> +    if (info !=3D vd->cbinfo[s]) {
> +        qemu_clipboard_info_put(vd->cbinfo[s]);
> +        vd->cbinfo[s] =3D qemu_clipboard_info_get(info);
> +        vd->cbpending[s] =3D 0;
> +        if (!self_update) {
> +            vdagent_send_clipboard_grab(vd, info);
> +        }
> +        return;
> +    }
> +
> +    if (self_update) {
> +        return;
> +    }
> +
> +    for (type =3D 0; type < QEMU_CLIPBOARD_TYPE__COUNT; type++) {
> +        if (vd->cbpending[s] & (1 << type)) {
> +            vd->cbpending[s] &=3D ~(1 << type);
> +            vdagent_send_clipboard_data(vd, info, type);
> +        }
> +    }
> +}
> +
> +static void vdagent_clipboard_request(QemuClipboardInfo *info,
> +                                      QemuClipboardType qtype)
> +{
> +    VDAgentChardev *vd =3D container_of(info->owner, VDAgentChardev,
> cbpeer);
> +    VDAgentMessage *msg =3D g_malloc0(sizeof(VDAgentMessage) +
> +                                    sizeof(uint32_t) * 2);
> +    uint32_t type =3D type_qemu_to_vdagent(qtype);
> +    uint8_t *s =3D msg->data;
> +    uint32_t *data =3D (uint32_t *)(msg->data + 4);
> +
> +    if (type =3D=3D VD_AGENT_CLIPBOARD_NONE) {
> +        return;
> +    }
> +
> +    *s =3D info->selection;
> +    *data =3D type;
> +    msg->type =3D VD_AGENT_CLIPBOARD_REQUEST;
> +    msg->size =3D sizeof(uint32_t) * 2;
> +
> +    vdagent_send_msg(vd, msg);
> +}
> +
> +static void vdagent_chr_recv_clipboard(VDAgentChardev *vd, VDAgentMessag=
e
> *msg)
> +{
> +    uint8_t s =3D VD_AGENT_CLIPBOARD_SELECTION_CLIPBOARD;
> +    uint32_t size =3D msg->size;
> +    void *data =3D msg->data;
> +    QemuClipboardInfo *info;
> +    QemuClipboardType type;
> +
> +    if (vd->caps & (1 << VD_AGENT_CAP_CLIPBOARD_SELECTION)) {
> +        s =3D *(uint8_t *)data;
> +        data +=3D 4;
> +        size -=3D 4;
> +    }
>

Here are some other concerns about "size" checks,

+
> +    switch (msg->type) {
> +    case VD_AGENT_CLIPBOARD_GRAB:
> +        trace_vdagent_cb_grab_selection(GET_NAME(sel_name, s));
> +        info =3D qemu_clipboard_info_new(&vd->cbpeer, s);
> +        while (size) {
>

to avoid looping on maxu32 for example,


> +            trace_vdagent_cb_grab_type(GET_NAME(type_name, *(uint32_t
> *)data));
> +            switch (*(uint32_t *)data) {
> +            case VD_AGENT_CLIPBOARD_UTF8_TEXT:
> +                info->types[QEMU_CLIPBOARD_TYPE_TEXT].available =3D true=
;
> +                break;
> +            default:
> +                break;
> +            }
> +            data +=3D 4;
> +            size -=3D 4;
> +        }
> +        qemu_clipboard_update(info);
> +        qemu_clipboard_info_put(info);
> +        break;
> +    case VD_AGENT_CLIPBOARD_REQUEST:
> +        switch (*(uint32_t *)data) {
>

or checking that a u32 still fits

+        case VD_AGENT_CLIPBOARD_UTF8_TEXT:
> +            type =3D QEMU_CLIPBOARD_TYPE_TEXT;
> +            break;
> +        default:
>

Despite what spice-gtk currently seems to do in some code paths, it's
certainly better to reply with  an empty clipboard, rather than not
replying.

+            return;
> +        }
> +        if (vd->cbinfo[s] &&
> +            vd->cbinfo[s]->types[type].available &&
> +            vd->cbinfo[s]->owner !=3D &vd->cbpeer) {
> +            if (vd->cbinfo[s]->types[type].data) {
> +                vdagent_send_clipboard_data(vd, vd->cbinfo[s], type);
> +            } else {
> +                vd->cbpending[s] |=3D (1 << type);
> +                qemu_clipboard_request(vd->cbinfo[s], type);
> +            }
> +        }
>

similarly

+        break;
> +    case VD_AGENT_CLIPBOARD: /* data */
> +        switch (*(uint32_t *)data) {
> +        case VD_AGENT_CLIPBOARD_UTF8_TEXT:
> +            type =3D QEMU_CLIPBOARD_TYPE_TEXT;
> +            break;
> +        default:
> +            return;
> +        }
> +        data +=3D 4;
> +        size -=3D 4;
> +        qemu_clipboard_set_data(&vd->cbpeer, vd->cbinfo[s], type,
> +                                size, data, true);
> +        break;
> +    case VD_AGENT_CLIPBOARD_RELEASE: /* data */
> +        if (vd->cbinfo[s] &&
> +            vd->cbinfo[s]->owner =3D=3D &vd->cbpeer) {
> +            /* set empty clipboard info */
> +            info =3D qemu_clipboard_info_new(NULL, s);
> +            qemu_clipboard_update(info);
> +            qemu_clipboard_info_put(info);
> +        }
> +        break;
> +    }
> +}
> +
>  /* ------------------------------------------------------------------ */
>  /* chardev backend                                                    */
>
> @@ -248,6 +465,11 @@ static void vdagent_chr_open(Chardev *chr,
>          vd->mouse =3D cfg->mouse;
>      }
>
> +    vd->clipboard =3D VDAGENT_CLIPBOARD_DEFAULT;
> +    if (cfg->has_clipboard) {
> +        vd->clipboard =3D cfg->clipboard;
> +    }
> +
>      if (vd->mouse) {
>          vd->mouse_hs =3D qemu_input_handler_register(&vd->mouse_dev,
>
> &vdagent_mouse_handler);
> @@ -274,6 +496,15 @@ static void vdagent_chr_recv_caps(VDAgentChardev *vd=
,
> VDAgentMessage *msg)
>      if (vd->caps & (1 << VD_AGENT_CAP_MOUSE_STATE) && vd->mouse_hs) {
>          qemu_input_handler_activate(vd->mouse_hs);
>      }
> +    if (vd->caps & (1 << VD_AGENT_CAP_CLIPBOARD_BY_DEMAND) &&
> +        vd->caps & (1 << VD_AGENT_CAP_CLIPBOARD_SELECTION) &&
> +        vd->clipboard &&
> +        vd->cbpeer.update.notify =3D=3D NULL) {
> +        vd->cbpeer.name =3D "vdagent";
> +        vd->cbpeer.update.notify =3D vdagent_clipboard_notify;
> +        vd->cbpeer.request =3D vdagent_clipboard_request;
> +        qemu_clipboard_peer_register(&vd->cbpeer);
> +    }
>  }
>
>  static uint32_t vdagent_chr_recv(VDAgentChardev *vd)
> @@ -291,6 +522,12 @@ static uint32_t vdagent_chr_recv(VDAgentChardev *vd)
>      case VD_AGENT_ANNOUNCE_CAPABILITIES:
>          vdagent_chr_recv_caps(vd, msg);
>          break;
> +    case VD_AGENT_CLIPBOARD:
> +    case VD_AGENT_CLIPBOARD_GRAB:
> +    case VD_AGENT_CLIPBOARD_REQUEST:
> +    case VD_AGENT_CLIPBOARD_RELEASE:
> +        vdagent_chr_recv_clipboard(vd, msg);
> +        break;
>      default:
>          break;
>      }
> @@ -336,6 +573,10 @@ static void vdagent_chr_set_fe_open(struct Chardev
> *chr, int fe_open)
>          if (vd->mouse_hs) {
>              qemu_input_handler_deactivate(vd->mouse_hs);
>          }
> +        if (vd->cbpeer.update.notify) {
> +            qemu_clipboard_peer_unregister(&vd->cbpeer);
> +            memset(&vd->cbpeer, 0, sizeof(vd->cbpeer));
> +        }
>          return;
>      }
>
> @@ -352,6 +593,8 @@ static void vdagent_chr_parse(QemuOpts *opts,
> ChardevBackend *backend,
>      qemu_chr_parse_common(opts, qapi_ChardevVDAgent_base(cfg));
>      cfg->has_mouse =3D true;
>      cfg->mouse =3D qemu_opt_get_bool(opts, "mouse", VDAGENT_MOUSE_DEFAUL=
T);
> +    cfg->has_clipboard =3D true;
> +    cfg->clipboard =3D qemu_opt_get_bool(opts, "clipboard",
> VDAGENT_CLIPBOARD_DEFAULT);
>  }
>
>  /* ------------------------------------------------------------------ */
> diff --git a/qapi/char.json b/qapi/char.json
> index d8e96b772523..059c9d634b06 100644
> --- a/qapi/char.json
> +++ b/qapi/char.json
> @@ -396,11 +396,13 @@
>  # Configuration info for vdagent.
>  #
>  # @mouse: enable/disable mouse, default is enabled.
> +# @clipboard: enable/disable clipboard, default is disabled.
>  #
>  # Since: 6.0
>  ##
>  { 'struct': 'ChardevVDAgent',
> -  'data': { '*mouse'    : 'bool' },
> +  'data': { '*mouse'    : 'bool',
> +            '*clipboard': 'bool' },
>    'base': 'ChardevCommon' }
>
>  ##
> diff --git a/ui/trace-events b/ui/trace-events
> index 1a5bd3861da5..90191cc1d285 100644
> --- a/ui/trace-events
> +++ b/ui/trace-events
> @@ -115,3 +115,5 @@ vdagent_close(void) ""
>  vdagent_send(const char *name) "msg %s"
>  vdagent_recv(const char *name) "msg %s"
>  vdagent_peer_cap(const char *name) "cap %s"
> +vdagent_cb_grab_selection(const char *name) "selection %s"
> +vdagent_cb_grab_type(const char *name) "type %s"
> --
> 2.29.2
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000002de3e505bc2d7153
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 19, 2021 at 5:19 PM Gerd =
Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This pat=
ch adds support for clipboard messages to the qemu vdagent<br>
implementation, which allows the guest exchange clipboard data with<br>
qemu.=C2=A0 Clipboard support can be enabled/disabled using the new<br>
&#39;clipboard&#39; parameter for the vdagent chardev.=C2=A0 Default is off=
.<br>
<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br>
---<br>
=C2=A0chardev/char.c=C2=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0ui/vdagent.c=C2=A0 =C2=A0 | 243 +++++++++++++++++++++++++++++++++++++=
+++++++++++<br>
=C2=A0qapi/char.json=C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0ui/trace-events |=C2=A0 =C2=A02 +<br>
=C2=A04 files changed, 251 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/chardev/char.c b/chardev/char.c<br>
index ea986dac1bff..7f3ee2c11f9d 100644<br>
--- a/chardev/char.c<br>
+++ b/chardev/char.c<br>
@@ -927,6 +927,9 @@ QemuOptsList qemu_chardev_opts =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;mouse&quot;=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.type =3D QEMU_OPT_BOOL,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;clipboard&quot;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .type =3D QEMU_OPT_BOOL,<br>
=C2=A0#ifdef CONFIG_LINUX<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;tight&quot;=
,<br>
diff --git a/ui/vdagent.c b/ui/vdagent.c<br>
index b48b0129b9f2..ee058688027e 100644<br>
--- a/ui/vdagent.c<br>
+++ b/ui/vdagent.c<br>
@@ -3,6 +3,7 @@<br>
=C2=A0#include &quot;chardev/char.h&quot;<br>
=C2=A0#include &quot;hw/qdev-core.h&quot;<br>
=C2=A0#include &quot;qemu/option.h&quot;<br>
+#include &quot;ui/clipboard.h&quot;<br>
=C2=A0#include &quot;ui/console.h&quot;<br>
=C2=A0#include &quot;ui/input.h&quot;<br>
=C2=A0#include &quot;trace.h&quot;<br>
@@ -17,12 +18,14 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 VD_AGENT_MAX_DATA_SIZE)<br>
<br>
=C2=A0#define VDAGENT_MOUSE_DEFAULT true<br>
+#define VDAGENT_CLIPBOARD_DEFAULT false<br>
<br>
=C2=A0struct VDAgentChardev {<br>
=C2=A0 =C2=A0 =C2=A0Chardev parent;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* config */<br>
=C2=A0 =C2=A0 =C2=A0bool mouse;<br>
+=C2=A0 =C2=A0 bool clipboard;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* guest vdagent */<br>
=C2=A0 =C2=A0 =C2=A0uint32_t caps;<br>
@@ -35,6 +38,11 @@ struct VDAgentChardev {<br>
=C2=A0 =C2=A0 =C2=A0uint32_t mouse_y;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t mouse_btn;<br>
=C2=A0 =C2=A0 =C2=A0QemuInputHandlerState *mouse_hs;<br>
+<br>
+=C2=A0 =C2=A0 /* clipboard */<br>
+=C2=A0 =C2=A0 QemuClipboardPeer cbpeer;<br>
+=C2=A0 =C2=A0 QemuClipboardInfo *cbinfo[QEMU_CLIPBOARD_SELECTION__COUNT];<=
br>
+=C2=A0 =C2=A0 uint32_t cbpending[QEMU_CLIPBOARD_SELECTION__COUNT];<br>
=C2=A0};<br>
=C2=A0typedef struct VDAgentChardev VDAgentChardev;<br>
<br>
@@ -90,6 +98,24 @@ static const char *msg_name[] =3D {<br>
=C2=A0#endif<br>
=C2=A0};<br>
<br>
+static const char *sel_name[] =3D {<br>
+=C2=A0 =C2=A0 [VD_AGENT_CLIPBOARD_SELECTION_CLIPBOARD] =3D &quot;clipboard=
&quot;,<br>
+=C2=A0 =C2=A0 [VD_AGENT_CLIPBOARD_SELECTION_PRIMARY]=C2=A0 =C2=A0=3D &quot=
;primary&quot;,<br>
+=C2=A0 =C2=A0 [VD_AGENT_CLIPBOARD_SELECTION_SECONDARY] =3D &quot;secondary=
&quot;,<br>
+};<br>
+<br>
+static const char *type_name[] =3D {<br>
+=C2=A0 =C2=A0 [VD_AGENT_CLIPBOARD_NONE]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quo=
t;none&quot;,<br>
+=C2=A0 =C2=A0 [VD_AGENT_CLIPBOARD_UTF8_TEXT]=C2=A0 =3D &quot;text&quot;,<b=
r>
+=C2=A0 =C2=A0 [VD_AGENT_CLIPBOARD_IMAGE_PNG]=C2=A0 =3D &quot;png&quot;,<br=
>
+=C2=A0 =C2=A0 [VD_AGENT_CLIPBOARD_IMAGE_BMP]=C2=A0 =3D &quot;bmp&quot;,<br=
>
+=C2=A0 =C2=A0 [VD_AGENT_CLIPBOARD_IMAGE_TIFF] =3D &quot;tiff&quot;,<br>
+=C2=A0 =C2=A0 [VD_AGENT_CLIPBOARD_IMAGE_JPG]=C2=A0 =3D &quot;jpg&quot;,<br=
>
+#if 0<br>
+=C2=A0 =C2=A0 [VD_AGENT_CLIPBOARD_FILE_LIST]=C2=A0 =3D &quot;files&quot;,<=
br>
+#endif<br>
+};<br>
+<br>
=C2=A0#define GET_NAME(_m, _v) \<br>
=C2=A0 =C2=A0 =C2=A0(((_v) &lt; ARRAY_SIZE(_m) &amp;&amp; (_m[_v])) ? (_m[_=
v]) : &quot;???&quot;)<br>
<br>
@@ -140,6 +166,10 @@ static void vdagent_send_caps(VDAgentChardev *vd)<br>
=C2=A0 =C2=A0 =C2=A0if (vd-&gt;mouse) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0caps-&gt;caps[0] |=3D (1 &lt;&lt; VD_AGEN=
T_CAP_MOUSE_STATE);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 if (vd-&gt;clipboard) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 caps-&gt;caps[0] |=3D (1 &lt;&lt; VD_AGENT_CAP=
_CLIPBOARD_BY_DEMAND);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 caps-&gt;caps[0] |=3D (1 &lt;&lt; VD_AGENT_CAP=
_CLIPBOARD_SELECTION);<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0vdagent_send_msg(vd, msg);<br>
=C2=A0}<br>
@@ -232,6 +262,193 @@ static QemuInputHandler vdagent_mouse_handler =3D {<b=
r>
=C2=A0 =C2=A0 =C2=A0.sync=C2=A0 =3D vdagent_pointer_sync,<br>
=C2=A0};<br>
<br>
+/* ------------------------------------------------------------------ */<b=
r>
+/* clipboard=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+<br>
+static uint32_t type_qemu_to_vdagent(enum QemuClipboardType type)<br>
+{<br>
+=C2=A0 =C2=A0 switch (type) {<br>
+=C2=A0 =C2=A0 case QEMU_CLIPBOARD_TYPE_TEXT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return VD_AGENT_CLIPBOARD_UTF8_TEXT;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return VD_AGENT_CLIPBOARD_NONE;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void vdagent_send_clipboard_grab(VDAgentChardev *vd,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QemuClip=
boardInfo *info)<br>
+{<br>
+=C2=A0 =C2=A0 VDAgentMessage *msg =3D g_malloc0(sizeof(VDAgentMessage) +<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(uint32_t) * (QE=
MU_CLIPBOARD_TYPE__COUNT + 1));<br>
+=C2=A0 =C2=A0 uint8_t *s =3D msg-&gt;data;<br>
+=C2=A0 =C2=A0 uint32_t *data =3D (uint32_t *)(msg-&gt;data + 4);<br>
+=C2=A0 =C2=A0 uint32_t q, v, type;<br>
+<br>
+=C2=A0 =C2=A0 for (q =3D 0, v =3D 0; q &lt; QEMU_CLIPBOARD_TYPE__COUNT; q+=
+) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 type =3D type_qemu_to_vdagent(q);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (type !=3D VD_AGENT_CLIPBOARD_NONE &amp;&am=
p; info-&gt;types[q].available) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data[v++] =3D type;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 *s =3D info-&gt;selection;<br>
+=C2=A0 =C2=A0 msg-&gt;type =3D VD_AGENT_CLIPBOARD_GRAB;<br>
+=C2=A0 =C2=A0 msg-&gt;size =3D sizeof(uint32_t) * (v + 1);<br>
+<br>
+=C2=A0 =C2=A0 vdagent_send_msg(vd, msg);<br>
+}<br>
+<br>
+static void vdagent_send_clipboard_data(VDAgentChardev *vd,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QemuClip=
boardInfo *info,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QemuClip=
boardType type)<br>
+{<br>
+=C2=A0 =C2=A0 VDAgentMessage *msg =3D g_malloc0(sizeof(VDAgentMessage) +<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(uint32_t) * 2 +=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;types[type].s=
ize);<br>
+<br>
+=C2=A0 =C2=A0 uint8_t *s =3D msg-&gt;data;<br>
+=C2=A0 =C2=A0 uint32_t *t =3D (uint32_t *)(msg-&gt;data + 4);<br>
+=C2=A0 =C2=A0 uint8_t *d =3D msg-&gt;data + 8;<br>
+<br>
+=C2=A0 =C2=A0 *s =3D info-&gt;selection;<br>
+=C2=A0 =C2=A0 *t =3D type_qemu_to_vdagent(type);<br>
+=C2=A0 =C2=A0 memcpy(d, info-&gt;types[type].data, info-&gt;types[type].si=
ze);<br>
+<br>
+=C2=A0 =C2=A0 msg-&gt;type =3D VD_AGENT_CLIPBOARD;<br>
+=C2=A0 =C2=A0 msg-&gt;size =3D sizeof(uint32_t) * 2 + info-&gt;types[type]=
.size;<br>
+<br>
+=C2=A0 =C2=A0 vdagent_send_msg(vd, msg);<br>
+}<br>
+<br>
+static void vdagent_clipboard_notify(Notifier *notifier, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 VDAgentChardev *vd =3D container_of(notifier, VDAgentChardev=
, cbpeer.update);<br>
+=C2=A0 =C2=A0 QemuClipboardInfo *info =3D data;<br>
+=C2=A0 =C2=A0 QemuClipboardSelection s =3D info-&gt;selection;<br>
+=C2=A0 =C2=A0 QemuClipboardType type;<br>
+=C2=A0 =C2=A0 bool self_update =3D info-&gt;owner =3D=3D &amp;vd-&gt;cbpee=
r;<br>
+<br>
+=C2=A0 =C2=A0 if (info !=3D vd-&gt;cbinfo[s]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clipboard_info_put(vd-&gt;cbinfo[s]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vd-&gt;cbinfo[s] =3D qemu_clipboard_info_get(i=
nfo);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vd-&gt;cbpending[s] =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!self_update) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vdagent_send_clipboard_grab(vd, =
info);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (self_update) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 for (type =3D 0; type &lt; QEMU_CLIPBOARD_TYPE__COUNT; type+=
+) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vd-&gt;cbpending[s] &amp; (1 &lt;&lt; type=
)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vd-&gt;cbpending[s] &amp;=3D ~(1=
 &lt;&lt; type);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vdagent_send_clipboard_data(vd, =
info, type);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void vdagent_clipboard_request(QemuClipboardInfo *info,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QemuClipboardTy=
pe qtype)<br>
+{<br>
+=C2=A0 =C2=A0 VDAgentChardev *vd =3D container_of(info-&gt;owner, VDAgentC=
hardev, cbpeer);<br>
+=C2=A0 =C2=A0 VDAgentMessage *msg =3D g_malloc0(sizeof(VDAgentMessage) +<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(uint32_t) * 2);=
<br>
+=C2=A0 =C2=A0 uint32_t type =3D type_qemu_to_vdagent(qtype);<br>
+=C2=A0 =C2=A0 uint8_t *s =3D msg-&gt;data;<br>
+=C2=A0 =C2=A0 uint32_t *data =3D (uint32_t *)(msg-&gt;data + 4);<br>
+<br>
+=C2=A0 =C2=A0 if (type =3D=3D VD_AGENT_CLIPBOARD_NONE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 *s =3D info-&gt;selection;<br>
+=C2=A0 =C2=A0 *data =3D type;<br>
+=C2=A0 =C2=A0 msg-&gt;type =3D VD_AGENT_CLIPBOARD_REQUEST;<br>
+=C2=A0 =C2=A0 msg-&gt;size =3D sizeof(uint32_t) * 2;<br>
+<br>
+=C2=A0 =C2=A0 vdagent_send_msg(vd, msg);<br>
+}<br>
+<br>
+static void vdagent_chr_recv_clipboard(VDAgentChardev *vd, VDAgentMessage =
*msg)<br>
+{<br>
+=C2=A0 =C2=A0 uint8_t s =3D VD_AGENT_CLIPBOARD_SELECTION_CLIPBOARD;<br>
+=C2=A0 =C2=A0 uint32_t size =3D msg-&gt;size;<br>
+=C2=A0 =C2=A0 void *data =3D msg-&gt;data;<br>
+=C2=A0 =C2=A0 QemuClipboardInfo *info;<br>
+=C2=A0 =C2=A0 QemuClipboardType type;<br>
+<br>
+=C2=A0 =C2=A0 if (vd-&gt;caps &amp; (1 &lt;&lt; VD_AGENT_CAP_CLIPBOARD_SEL=
ECTION)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D *(uint8_t *)data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 data +=3D 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 size -=3D 4;<br>
+=C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>Here are some other co=
ncerns about &quot;size&quot; checks, </div><div><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 switch (msg-&gt;type) {<br>
+=C2=A0 =C2=A0 case VD_AGENT_CLIPBOARD_GRAB:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_vdagent_cb_grab_selection(GET_NAME(sel_n=
ame, s));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 info =3D qemu_clipboard_info_new(&amp;vd-&gt;c=
bpeer, s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 while (size) {<br></blockquote><div><br></div>=
<div><div>to avoid looping on maxu32 for example, <br></div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_vdagent_cb_grab_type(GET_N=
AME(type_name, *(uint32_t *)data));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (*(uint32_t *)data) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case VD_AGENT_CLIPBOARD_UTF8_TEX=
T:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;types[QEM=
U_CLIPBOARD_TYPE_TEXT].available =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data +=3D 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size -=3D 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clipboard_update(info);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clipboard_info_put(info);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case VD_AGENT_CLIPBOARD_REQUEST:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (*(uint32_t *)data) {<br></blockquote><=
div><br></div><div>or checking that a u32 still fits</div><div> <br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case VD_AGENT_CLIPBOARD_UTF8_TEXT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type =3D QEMU_CLIPBOARD_TYPE_TEX=
T;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br></blockquote><div><br></div><div>D=
espite what spice-gtk currently seems to do in some code paths, it&#39;s ce=
rtainly better to reply with=C2=A0 an empty clipboard, rather than not repl=
ying.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vd-&gt;cbinfo[s] &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vd-&gt;cbinfo[s]-&gt;types[type]=
.available &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vd-&gt;cbinfo[s]-&gt;owner !=3D =
&amp;vd-&gt;cbpeer) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vd-&gt;cbinfo[s]-&gt;types[t=
ype].data) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vdagent_send_clipb=
oard_data(vd, vd-&gt;cbinfo[s], type);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vd-&gt;cbpending[s=
] |=3D (1 &lt;&lt; type);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clipboard_req=
uest(vd-&gt;cbinfo[s], type);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>similarl=
y</div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case VD_AGENT_CLIPBOARD: /* data */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (*(uint32_t *)data) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case VD_AGENT_CLIPBOARD_UTF8_TEXT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type =3D QEMU_CLIPBOARD_TYPE_TEX=
T;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 data +=3D 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 size -=3D 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clipboard_set_data(&amp;vd-&gt;cbpeer, vd=
-&gt;cbinfo[s], type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size, data, true);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case VD_AGENT_CLIPBOARD_RELEASE: /* data */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vd-&gt;cbinfo[s] &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vd-&gt;cbinfo[s]-&gt;owner =3D=
=3D &amp;vd-&gt;cbpeer) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* set empty clipboard info */<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info =3D qemu_clipboard_info_new=
(NULL, s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clipboard_update(info);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clipboard_info_put(info);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
=C2=A0/* ------------------------------------------------------------------=
 */<br>
=C2=A0/* chardev backend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
<br>
@@ -248,6 +465,11 @@ static void vdagent_chr_open(Chardev *chr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vd-&gt;mouse =3D cfg-&gt;mouse;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 vd-&gt;clipboard =3D VDAGENT_CLIPBOARD_DEFAULT;<br>
+=C2=A0 =C2=A0 if (cfg-&gt;has_clipboard) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vd-&gt;clipboard =3D cfg-&gt;clipboard;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (vd-&gt;mouse) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vd-&gt;mouse_hs =3D qemu_input_handler_re=
gister(&amp;vd-&gt;mouse_dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;vdagent_mouse_handler);<br>
@@ -274,6 +496,15 @@ static void vdagent_chr_recv_caps(VDAgentChardev *vd, =
VDAgentMessage *msg)<br>
=C2=A0 =C2=A0 =C2=A0if (vd-&gt;caps &amp; (1 &lt;&lt; VD_AGENT_CAP_MOUSE_ST=
ATE) &amp;&amp; vd-&gt;mouse_hs) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_input_handler_activate(vd-&gt;mouse_=
hs);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 if (vd-&gt;caps &amp; (1 &lt;&lt; VD_AGENT_CAP_CLIPBOARD_BY_=
DEMAND) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vd-&gt;caps &amp; (1 &lt;&lt; VD_AGENT_CAP_CLI=
PBOARD_SELECTION) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vd-&gt;clipboard &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vd-&gt;cbpeer.update.notify =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vd-&gt;<a href=3D"http://cbpeer.name" rel=3D"n=
oreferrer" target=3D"_blank">cbpeer.name</a> =3D &quot;vdagent&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vd-&gt;cbpeer.update.notify =3D vdagent_clipbo=
ard_notify;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vd-&gt;cbpeer.request =3D vdagent_clipboard_re=
quest;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clipboard_peer_register(&amp;vd-&gt;cbpee=
r);<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0}<br>
<br>
=C2=A0static uint32_t vdagent_chr_recv(VDAgentChardev *vd)<br>
@@ -291,6 +522,12 @@ static uint32_t vdagent_chr_recv(VDAgentChardev *vd)<b=
r>
=C2=A0 =C2=A0 =C2=A0case VD_AGENT_ANNOUNCE_CAPABILITIES:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vdagent_chr_recv_caps(vd, msg);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 case VD_AGENT_CLIPBOARD:<br>
+=C2=A0 =C2=A0 case VD_AGENT_CLIPBOARD_GRAB:<br>
+=C2=A0 =C2=A0 case VD_AGENT_CLIPBOARD_REQUEST:<br>
+=C2=A0 =C2=A0 case VD_AGENT_CLIPBOARD_RELEASE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vdagent_chr_recv_clipboard(vd, msg);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -336,6 +573,10 @@ static void vdagent_chr_set_fe_open(struct Chardev *ch=
r, int fe_open)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (vd-&gt;mouse_hs) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_input_handler_deactiva=
te(vd-&gt;mouse_hs);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vd-&gt;cbpeer.update.notify) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clipboard_peer_unregister(&=
amp;vd-&gt;cbpeer);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(&amp;vd-&gt;cbpeer, 0, si=
zeof(vd-&gt;cbpeer));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -352,6 +593,8 @@ static void vdagent_chr_parse(QemuOpts *opts, ChardevBa=
ckend *backend,<br>
=C2=A0 =C2=A0 =C2=A0qemu_chr_parse_common(opts, qapi_ChardevVDAgent_base(cf=
g));<br>
=C2=A0 =C2=A0 =C2=A0cfg-&gt;has_mouse =3D true;<br>
=C2=A0 =C2=A0 =C2=A0cfg-&gt;mouse =3D qemu_opt_get_bool(opts, &quot;mouse&q=
uot;, VDAGENT_MOUSE_DEFAULT);<br>
+=C2=A0 =C2=A0 cfg-&gt;has_clipboard =3D true;<br>
+=C2=A0 =C2=A0 cfg-&gt;clipboard =3D qemu_opt_get_bool(opts, &quot;clipboar=
d&quot;, VDAGENT_CLIPBOARD_DEFAULT);<br>
=C2=A0}<br>
<br>
=C2=A0/* ------------------------------------------------------------------=
 */<br>
diff --git a/qapi/char.json b/qapi/char.json<br>
index d8e96b772523..059c9d634b06 100644<br>
--- a/qapi/char.json<br>
+++ b/qapi/char.json<br>
@@ -396,11 +396,13 @@<br>
=C2=A0# Configuration info for vdagent.<br>
=C2=A0#<br>
=C2=A0# @mouse: enable/disable mouse, default is enabled.<br>
+# @clipboard: enable/disable clipboard, default is disabled.<br>
=C2=A0#<br>
=C2=A0# Since: 6.0<br>
=C2=A0##<br>
=C2=A0{ &#39;struct&#39;: &#39;ChardevVDAgent&#39;,<br>
-=C2=A0 &#39;data&#39;: { &#39;*mouse&#39;=C2=A0 =C2=A0 : &#39;bool&#39; },=
<br>
+=C2=A0 &#39;data&#39;: { &#39;*mouse&#39;=C2=A0 =C2=A0 : &#39;bool&#39;,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*clipboard&#39;: &#39;bool&=
#39; },<br>
=C2=A0 =C2=A0&#39;base&#39;: &#39;ChardevCommon&#39; }<br>
<br>
=C2=A0##<br>
diff --git a/ui/trace-events b/ui/trace-events<br>
index 1a5bd3861da5..90191cc1d285 100644<br>
--- a/ui/trace-events<br>
+++ b/ui/trace-events<br>
@@ -115,3 +115,5 @@ vdagent_close(void) &quot;&quot;<br>
=C2=A0vdagent_send(const char *name) &quot;msg %s&quot;<br>
=C2=A0vdagent_recv(const char *name) &quot;msg %s&quot;<br>
=C2=A0vdagent_peer_cap(const char *name) &quot;cap %s&quot;<br>
+vdagent_cb_grab_selection(const char *name) &quot;selection %s&quot;<br>
+vdagent_cb_grab_type(const char *name) &quot;type %s&quot;<br>
-- <br>
2.29.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000002de3e505bc2d7153--

