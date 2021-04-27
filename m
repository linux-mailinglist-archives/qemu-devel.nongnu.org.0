Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DCF36C1A4
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 11:22:53 +0200 (CEST)
Received: from localhost ([::1]:37294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbJvg-0008J4-NI
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 05:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lbJtM-00070q-Ec
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 05:20:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lbJtG-0007QC-Rx
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 05:20:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619515221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=egTdxmNzkFzFcrqj4upvspXYCY8c61pMwWmdbXEWcKM=;
 b=itDS71l+MDQR+1jgVdUHTQ3GaZlaP4ZsdgyNdH2cBjzdGblXT33geOKp2RysFvJCb5vjVj
 iPFXLB8d8EyMDiKaMGOqenE3rzrB8ynwlOEBBZN60CjihcJ4kzTOiQE3FoEG8GGVbOZRsF
 8kVFVmYSxjwjJKqVMzaHrAtTVp49S1g=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-9W0PtYkrMJCoMBaGU7Svng-1; Tue, 27 Apr 2021 05:20:18 -0400
X-MC-Unique: 9W0PtYkrMJCoMBaGU7Svng-1
Received: by mail-pj1-f70.google.com with SMTP id
 b6-20020a17090a4886b0290152505b9487so9774694pjh.6
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 02:20:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=egTdxmNzkFzFcrqj4upvspXYCY8c61pMwWmdbXEWcKM=;
 b=TWHMUADbsx80SSsvYZaRGrsNJJBq979z3creyD3oCHNHlLY1E+2n8RljoesWy6gkHF
 M/+I435id9hjbQUx67pBalUTeJpeqBF0ECM9rSsXb689FQCV5fN3khKc1vK49vopKaFW
 qygPPAPTWITp9o/9F0A2yvGgtoE0FqLSzdhhtIPoYGbfWDs+Bfa6GO4iwGrUj2CaAXFu
 QW8L1CM10nmo3mfuGJto1fn5GEOdBcFxZ4xDbZaSDEi9NrWLDNS03hnapBwfxiksgl4g
 IvclB3vC/gPwVwSZQadx30/05bBvIPwZwcT+gf41kvloPtyRmzDnzT1p2k9uepvUncJS
 86RQ==
X-Gm-Message-State: AOAM530rKERPfoNJae8PO5TiaeTVMXHVNfh8KES93llfCiYvi5rvgcMA
 p2KlggOGvbTG/fr/pUfyXRLsYDAENfDLcqitNdc4USIwmSvHSXompEqoh/Cfp+ZaKGZ4Ds7fYEz
 5WO0dg7bBCx3UVR1mIIAR9er1v+NdXKU=
X-Received: by 2002:a17:90a:8d82:: with SMTP id
 d2mr25835530pjo.200.1619515216724; 
 Tue, 27 Apr 2021 02:20:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywTT+G40QnSndqJOpyMfF5frQV3qM2POHxvNlK3jM5IDeE99uaBfM4Nf4WLT7ilYF33ZzZaMfu9ZKUNpa7zME=
X-Received: by 2002:a17:90a:8d82:: with SMTP id
 d2mr25835508pjo.200.1619515216454; 
 Tue, 27 Apr 2021 02:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210423083351.2096734-1-kraxel@redhat.com>
 <20210423083351.2096734-7-kraxel@redhat.com>
In-Reply-To: <20210423083351.2096734-7-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 27 Apr 2021 13:20:05 +0400
Message-ID: <CAMxuvawnyJ9xXVLp0HPrv6xYP7kRB3Qr-=qXU7mqDA0yo0yStA@mail.gmail.com>
Subject: Re: [PATCH v4 6/9] ui/vdagent: add clipboard support
To: Gerd Hoffmann <kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000002f7df205c0f0c575"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
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

--0000000000002f7df205c0f0c575
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 23, 2021 at 12:34 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> This patch adds support for clipboard messages to the qemu vdagent
> implementation, which allows the guest exchange clipboard data with
> qemu.  Clipboard support can be enabled/disabled using the new
> 'clipboard' parameter for the vdagent chardev.  Default is off.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>

Beside endianness,  lgtm

---
>  chardev/char.c  |   3 +
>  ui/vdagent.c    | 292 ++++++++++++++++++++++++++++++++++++++++++++++++
>  qapi/char.json  |   4 +-
>  ui/trace-events |   2 +
>  4 files changed, 300 insertions(+), 1 deletion(-)
>
> diff --git a/chardev/char.c b/chardev/char.c
> index 9714057541fb..39d41d3df7bb 100644
> --- a/chardev/char.c
> +++ b/chardev/char.c
> @@ -935,6 +935,9 @@ QemuOptsList qemu_chardev_opts = {
>          },{
>              .name = "mouse",
>              .type = QEMU_OPT_BOOL,
> +        },{
> +            .name = "clipboard",
> +            .type = QEMU_OPT_BOOL,
>  #ifdef CONFIG_LINUX
>          },{
>              .name = "tight",
> diff --git a/ui/vdagent.c b/ui/vdagent.c
> index e914a33bae20..67044aa5b9f0 100644
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
> @@ -13,12 +14,14 @@
>  #include "spice/vd_agent.h"
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
> @@ -36,6 +39,11 @@ struct VDAgentChardev {
>      uint32_t mouse_btn;
>      uint32_t mouse_display;
>      QemuInputHandlerState *mouse_hs;
> +
> +    /* clipboard */
> +    QemuClipboardPeer cbpeer;
> +    QemuClipboardInfo *cbinfo[QEMU_CLIPBOARD_SELECTION__COUNT];
> +    uint32_t cbpending[QEMU_CLIPBOARD_SELECTION__COUNT];
>  };
>  typedef struct VDAgentChardev VDAgentChardev;
>
> @@ -91,6 +99,24 @@ static const char *msg_name[] = {
>  #endif
>  };
>
> +static const char *sel_name[] = {
> +    [VD_AGENT_CLIPBOARD_SELECTION_CLIPBOARD] = "clipboard",
> +    [VD_AGENT_CLIPBOARD_SELECTION_PRIMARY]   = "primary",
> +    [VD_AGENT_CLIPBOARD_SELECTION_SECONDARY] = "secondary",
> +};
> +
> +static const char *type_name[] = {
> +    [VD_AGENT_CLIPBOARD_NONE]       = "none",
> +    [VD_AGENT_CLIPBOARD_UTF8_TEXT]  = "text",
> +    [VD_AGENT_CLIPBOARD_IMAGE_PNG]  = "png",
> +    [VD_AGENT_CLIPBOARD_IMAGE_BMP]  = "bmp",
> +    [VD_AGENT_CLIPBOARD_IMAGE_TIFF] = "tiff",
> +    [VD_AGENT_CLIPBOARD_IMAGE_JPG]  = "jpg",
> +#if 0
> +    [VD_AGENT_CLIPBOARD_FILE_LIST]  = "files",
> +#endif
> +};
> +
>  #define GET_NAME(_m, _v) \
>      (((_v) < ARRAY_SIZE(_m) && (_m[_v])) ? (_m[_v]) : "???")
>
> @@ -147,6 +173,10 @@ static void vdagent_send_caps(VDAgentChardev *vd)
>      if (vd->mouse) {
>          caps->caps[0] |= (1 << VD_AGENT_CAP_MOUSE_STATE);
>      }
> +    if (vd->clipboard) {
> +        caps->caps[0] |= (1 << VD_AGENT_CAP_CLIPBOARD_BY_DEMAND);
> +        caps->caps[0] |= (1 << VD_AGENT_CAP_CLIPBOARD_SELECTION);
> +    }
>
>      vdagent_send_msg(vd, msg);
>  }
> @@ -247,6 +277,243 @@ static QemuInputHandler vdagent_mouse_handler = {
>      .sync  = vdagent_pointer_sync,
>  };
>
> +/* ------------------------------------------------------------------ */
> +/* clipboard                                                          */
> +
> +static bool have_clipboard(VDAgentChardev *vd)
> +{
> +    return vd->clipboard &&
> +        (vd->caps & (1 << VD_AGENT_CAP_CLIPBOARD_BY_DEMAND));
> +}
> +
> +static bool have_selection(VDAgentChardev *vd)
> +{
> +    return vd->caps & (1 << VD_AGENT_CAP_CLIPBOARD_SELECTION);
> +}
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
> +    g_autofree VDAgentMessage *msg = g_malloc0(sizeof(VDAgentMessage) +
> +                                               sizeof(uint32_t) *
> (QEMU_CLIPBOARD_TYPE__COUNT + 1));
> +    uint8_t *s = msg->data;
> +    uint32_t *data = (uint32_t *)msg->data;
> +    uint32_t q, type;
> +
> +    if (have_selection(vd)) {
> +        *s = info->selection;
> +        data++;
> +        msg->size += sizeof(uint32_t);
> +    } else if (info->selection != QEMU_CLIPBOARD_SELECTION_CLIPBOARD) {
> +        return;
> +    }
> +
> +    for (q = 0; q < QEMU_CLIPBOARD_TYPE__COUNT; q++) {
> +        type = type_qemu_to_vdagent(q);
> +        if (type != VD_AGENT_CLIPBOARD_NONE && info->types[q].available) {
> +            *data = type;
> +            data++;
> +            msg->size += sizeof(uint32_t);
> +        }
> +    }
> +
> +    msg->type = VD_AGENT_CLIPBOARD_GRAB;
> +    vdagent_send_msg(vd, msg);
> +}
> +
> +static void vdagent_send_clipboard_data(VDAgentChardev *vd,
> +                                        QemuClipboardInfo *info,
> +                                        QemuClipboardType type)
> +{
> +    g_autofree VDAgentMessage *msg = g_malloc0(sizeof(VDAgentMessage) +
> +                                               sizeof(uint32_t) * 2 +
> +                                               info->types[type].size);
> +
> +    uint8_t *s = msg->data;
> +    uint32_t *data = (uint32_t *)msg->data;
> +
> +    if (have_selection(vd)) {
> +        *s = info->selection;
> +        data++;
> +        msg->size += sizeof(uint32_t);
> +    } else if (info->selection != QEMU_CLIPBOARD_SELECTION_CLIPBOARD) {
> +        return;
> +    }
> +
> +    *data = type_qemu_to_vdagent(type);
> +    data++;
> +    msg->size += sizeof(uint32_t);
> +
> +    memcpy(data, info->types[type].data, info->types[type].size);
> +    msg->size += info->types[type].size;
> +
> +    msg->type = VD_AGENT_CLIPBOARD;
> +    vdagent_send_msg(vd, msg);
> +}
> +
> +static void vdagent_clipboard_notify(Notifier *notifier, void *data)
> +{
> +    VDAgentChardev *vd = container_of(notifier, VDAgentChardev,
> cbpeer.update);
> +    QemuClipboardInfo *info = data;
> +    QemuClipboardSelection s = info->selection;
> +    QemuClipboardType type;
> +    bool self_update = info->owner == &vd->cbpeer;
> +
> +    if (info != vd->cbinfo[s]) {
> +        qemu_clipboard_info_put(vd->cbinfo[s]);
> +        vd->cbinfo[s] = qemu_clipboard_info_get(info);
> +        vd->cbpending[s] = 0;
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
> +    for (type = 0; type < QEMU_CLIPBOARD_TYPE__COUNT; type++) {
> +        if (vd->cbpending[s] & (1 << type)) {
> +            vd->cbpending[s] &= ~(1 << type);
> +            vdagent_send_clipboard_data(vd, info, type);
> +        }
> +    }
> +}
> +
> +static void vdagent_clipboard_request(QemuClipboardInfo *info,
> +                                      QemuClipboardType qtype)
> +{
> +    VDAgentChardev *vd = container_of(info->owner, VDAgentChardev,
> cbpeer);
> +    g_autofree VDAgentMessage *msg = g_malloc0(sizeof(VDAgentMessage) +
> +                                               sizeof(uint32_t) * 2);
> +    uint32_t type = type_qemu_to_vdagent(qtype);
> +    uint8_t *s = msg->data;
> +    uint32_t *data = (uint32_t *)msg->data;
> +
> +    if (type == VD_AGENT_CLIPBOARD_NONE) {
> +        return;
> +    }
> +
> +    if (have_selection(vd)) {
> +        *s = info->selection;
> +        data++;
> +        msg->size += sizeof(uint32_t);
> +    }
> +
> +    *data = type;
> +    msg->size += sizeof(uint32_t);
> +
> +    msg->type = VD_AGENT_CLIPBOARD_REQUEST;
> +    vdagent_send_msg(vd, msg);
> +}
> +
> +static void vdagent_chr_recv_clipboard(VDAgentChardev *vd, VDAgentMessage
> *msg)
> +{
> +    uint8_t s = VD_AGENT_CLIPBOARD_SELECTION_CLIPBOARD;
> +    uint32_t size = msg->size;
> +    void *data = msg->data;
> +    QemuClipboardInfo *info;
> +    QemuClipboardType type;
> +
> +    if (have_selection(vd)) {
> +        if (size < 4) {
> +            return;
> +        }
> +        s = *(uint8_t *)data;
> +        if (s >= QEMU_CLIPBOARD_SELECTION__COUNT) {
> +            return;
> +        }
> +        data += 4;
> +        size -= 4;
> +    }
> +
> +    switch (msg->type) {
> +    case VD_AGENT_CLIPBOARD_GRAB:
> +        trace_vdagent_cb_grab_selection(GET_NAME(sel_name, s));
> +        info = qemu_clipboard_info_new(&vd->cbpeer, s);
> +        if (size > sizeof(uint32_t) * 10) {
> +            /*
> +             * spice has 6 types as of 2021. Limiting to 10 entries
> +             * so we we have some wiggle room.
> +             */
> +            return;
> +        }
> +        while (size >= sizeof(uint32_t)) {
> +            trace_vdagent_cb_grab_type(GET_NAME(type_name, *(uint32_t
> *)data));
> +            switch (*(uint32_t *)data) {
> +            case VD_AGENT_CLIPBOARD_UTF8_TEXT:
> +                info->types[QEMU_CLIPBOARD_TYPE_TEXT].available = true;
> +                break;
> +            default:
> +                break;
> +            }
> +            data += sizeof(uint32_t);
> +            size -= sizeof(uint32_t);
> +        }
> +        qemu_clipboard_update(info);
> +        qemu_clipboard_info_put(info);
> +        break;
> +    case VD_AGENT_CLIPBOARD_REQUEST:
> +        if (size < sizeof(uint32_t)) {
> +            return;
> +        }
> +        switch (*(uint32_t *)data) {
> +        case VD_AGENT_CLIPBOARD_UTF8_TEXT:
> +            type = QEMU_CLIPBOARD_TYPE_TEXT;
> +            break;
> +        default:
> +            return;
> +        }
> +        if (vd->cbinfo[s] &&
> +            vd->cbinfo[s]->types[type].available &&
> +            vd->cbinfo[s]->owner != &vd->cbpeer) {
> +            if (vd->cbinfo[s]->types[type].data) {
> +                vdagent_send_clipboard_data(vd, vd->cbinfo[s], type);
> +            } else {
> +                vd->cbpending[s] |= (1 << type);
> +                qemu_clipboard_request(vd->cbinfo[s], type);
> +            }
> +        }
> +        break;
> +    case VD_AGENT_CLIPBOARD: /* data */
> +        if (size < sizeof(uint32_t)) {
> +            return;
> +        }
> +        switch (*(uint32_t *)data) {
> +        case VD_AGENT_CLIPBOARD_UTF8_TEXT:
> +            type = QEMU_CLIPBOARD_TYPE_TEXT;
> +            break;
> +        default:
> +            return;
> +        }
> +        data += 4;
> +        size -= 4;
> +        qemu_clipboard_set_data(&vd->cbpeer, vd->cbinfo[s], type,
> +                                size, data, true);
> +        break;
> +    case VD_AGENT_CLIPBOARD_RELEASE: /* data */
> +        if (vd->cbinfo[s] &&
> +            vd->cbinfo[s]->owner == &vd->cbpeer) {
> +            /* set empty clipboard info */
> +            info = qemu_clipboard_info_new(NULL, s);
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
> @@ -263,6 +530,11 @@ static void vdagent_chr_open(Chardev *chr,
>          vd->mouse = cfg->mouse;
>      }
>
> +    vd->clipboard = VDAGENT_CLIPBOARD_DEFAULT;
> +    if (cfg->has_clipboard) {
> +        vd->clipboard = cfg->clipboard;
> +    }
> +
>      if (vd->mouse) {
>          vd->mouse_hs = qemu_input_handler_register(&vd->mouse_dev,
>
> &vdagent_mouse_handler);
> @@ -294,6 +566,12 @@ static void vdagent_chr_recv_caps(VDAgentChardev *vd,
> VDAgentMessage *msg)
>      if (have_mouse(vd) && vd->mouse_hs) {
>          qemu_input_handler_activate(vd->mouse_hs);
>      }
> +    if (have_clipboard(vd) && vd->cbpeer.update.notify == NULL) {
> +        vd->cbpeer.name = "vdagent";
> +        vd->cbpeer.update.notify = vdagent_clipboard_notify;
> +        vd->cbpeer.request = vdagent_clipboard_request;
> +        qemu_clipboard_peer_register(&vd->cbpeer);
> +    }
>  }
>
>  static void vdagent_chr_recv_msg(VDAgentChardev *vd, VDAgentMessage *msg)
> @@ -304,6 +582,14 @@ static void vdagent_chr_recv_msg(VDAgentChardev *vd,
> VDAgentMessage *msg)
>      case VD_AGENT_ANNOUNCE_CAPABILITIES:
>          vdagent_chr_recv_caps(vd, msg);
>          break;
> +    case VD_AGENT_CLIPBOARD:
> +    case VD_AGENT_CLIPBOARD_GRAB:
> +    case VD_AGENT_CLIPBOARD_REQUEST:
> +    case VD_AGENT_CLIPBOARD_RELEASE:
> +        if (have_clipboard(vd)) {
> +            vdagent_chr_recv_clipboard(vd, msg);
> +        }
> +        break;
>      default:
>          break;
>      }
> @@ -419,6 +705,10 @@ static void vdagent_chr_set_fe_open(struct Chardev
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
> @@ -435,6 +725,8 @@ static void vdagent_chr_parse(QemuOpts *opts,
> ChardevBackend *backend,
>      qemu_chr_parse_common(opts, qapi_ChardevVDAgent_base(cfg));
>      cfg->has_mouse = true;
>      cfg->mouse = qemu_opt_get_bool(opts, "mouse", VDAGENT_MOUSE_DEFAULT);
> +    cfg->has_clipboard = true;
> +    cfg->clipboard = qemu_opt_get_bool(opts, "clipboard",
> VDAGENT_CLIPBOARD_DEFAULT);
>  }
>
>  /* ------------------------------------------------------------------ */
> diff --git a/qapi/char.json b/qapi/char.json
> index 880aa8f73333..a89017c41a63 100644
> --- a/qapi/char.json
> +++ b/qapi/char.json
> @@ -396,12 +396,14 @@
>  # Configuration info for vdagent.
>  #
>  # @mouse: enable/disable mouse, default is enabled.
> +# @clipboard: enable/disable clipboard, default is disabled.
>  #
>  # Since: 6.1
>  #
>  ##
>  { 'struct': 'ChardevVDAgent',
> -  'data': { '*mouse': 'bool' },
> +  'data': { '*mouse': 'bool',
> +            '*clipboard': 'bool' },
>    'base': 'ChardevCommon',
>    'if': 'defined(CONFIG_SPICE_PROTOCOL)' }
>
> diff --git a/ui/trace-events b/ui/trace-events
> index c34cffb0452b..c86542e2b69b 100644
> --- a/ui/trace-events
> +++ b/ui/trace-events
> @@ -132,3 +132,5 @@ vdagent_send(const char *name) "msg %s"
>  vdagent_recv_chunk(uint32_t size) "size %d"
>  vdagent_recv_msg(const char *name, uint32_t size) "msg %s, size %d"
>  vdagent_peer_cap(const char *name) "cap %s"
> +vdagent_cb_grab_selection(const char *name) "selection %s"
> +vdagent_cb_grab_type(const char *name) "type %s"
> --
> 2.30.2
>
>

--0000000000002f7df205c0f0c575
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 23, 2021 at 12:34 PM Gerd=
 Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This pa=
tch adds support for clipboard messages to the qemu vdagent<br>
implementation, which allows the guest exchange clipboard data with<br>
qemu.=C2=A0 Clipboard support can be enabled/disabled using the new<br>
&#39;clipboard&#39; parameter for the vdagent chardev.=C2=A0 Default is off=
.<br>
<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br></blockquote><div><br></div><div>=
Beside endianness,=C2=A0 lgtm</div><div><br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
---<br>
=C2=A0chardev/char.c=C2=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0ui/vdagent.c=C2=A0 =C2=A0 | 292 +++++++++++++++++++++++++++++++++++++=
+++++++++++<br>
=C2=A0qapi/char.json=C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0ui/trace-events |=C2=A0 =C2=A02 +<br>
=C2=A04 files changed, 300 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/chardev/char.c b/chardev/char.c<br>
index 9714057541fb..39d41d3df7bb 100644<br>
--- a/chardev/char.c<br>
+++ b/chardev/char.c<br>
@@ -935,6 +935,9 @@ QemuOptsList qemu_chardev_opts =3D {<br>
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
index e914a33bae20..67044aa5b9f0 100644<br>
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
@@ -13,12 +14,14 @@<br>
=C2=A0#include &quot;spice/vd_agent.h&quot;<br>
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
@@ -36,6 +39,11 @@ struct VDAgentChardev {<br>
=C2=A0 =C2=A0 =C2=A0uint32_t mouse_btn;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t mouse_display;<br>
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
@@ -91,6 +99,24 @@ static const char *msg_name[] =3D {<br>
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
@@ -147,6 +173,10 @@ static void vdagent_send_caps(VDAgentChardev *vd)<br>
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
@@ -247,6 +277,243 @@ static QemuInputHandler vdagent_mouse_handler =3D {<b=
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
+static bool have_clipboard(VDAgentChardev *vd)<br>
+{<br>
+=C2=A0 =C2=A0 return vd-&gt;clipboard &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (vd-&gt;caps &amp; (1 &lt;&lt; VD_AGENT_CAP_CL=
IPBOARD_BY_DEMAND));<br>
+}<br>
+<br>
+static bool have_selection(VDAgentChardev *vd)<br>
+{<br>
+=C2=A0 =C2=A0 return vd-&gt;caps &amp; (1 &lt;&lt; VD_AGENT_CAP_CLIPBOARD_=
SELECTION);<br>
+}<br>
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
+=C2=A0 =C2=A0 g_autofree VDAgentMessage *msg =3D g_malloc0(sizeof(VDAgentM=
essage) +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0sizeof(uint32_t) * (QEMU_CLIPBOARD_TYPE__COUNT + 1));<b=
r>
+=C2=A0 =C2=A0 uint8_t *s =3D msg-&gt;data;<br>
+=C2=A0 =C2=A0 uint32_t *data =3D (uint32_t *)msg-&gt;data;<br>
+=C2=A0 =C2=A0 uint32_t q, type;<br>
+<br>
+=C2=A0 =C2=A0 if (have_selection(vd)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *s =3D info-&gt;selection;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 data++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg-&gt;size +=3D sizeof(uint32_t);<br>
+=C2=A0 =C2=A0 } else if (info-&gt;selection !=3D QEMU_CLIPBOARD_SELECTION_=
CLIPBOARD) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 for (q =3D 0; q &lt; QEMU_CLIPBOARD_TYPE__COUNT; q++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 type =3D type_qemu_to_vdagent(q);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (type !=3D VD_AGENT_CLIPBOARD_NONE &amp;&am=
p; info-&gt;types[q].available) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *data =3D type;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg-&gt;size +=3D sizeof(uint32_=
t);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 msg-&gt;type =3D VD_AGENT_CLIPBOARD_GRAB;<br>
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
+=C2=A0 =C2=A0 g_autofree VDAgentMessage *msg =3D g_malloc0(sizeof(VDAgentM=
essage) +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0sizeof(uint32_t) * 2 +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0info-&gt;types[type].size);<br>
+<br>
+=C2=A0 =C2=A0 uint8_t *s =3D msg-&gt;data;<br>
+=C2=A0 =C2=A0 uint32_t *data =3D (uint32_t *)msg-&gt;data;<br>
+<br>
+=C2=A0 =C2=A0 if (have_selection(vd)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *s =3D info-&gt;selection;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 data++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg-&gt;size +=3D sizeof(uint32_t);<br>
+=C2=A0 =C2=A0 } else if (info-&gt;selection !=3D QEMU_CLIPBOARD_SELECTION_=
CLIPBOARD) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 *data =3D type_qemu_to_vdagent(type);<br>
+=C2=A0 =C2=A0 data++;<br>
+=C2=A0 =C2=A0 msg-&gt;size +=3D sizeof(uint32_t);<br>
+<br>
+=C2=A0 =C2=A0 memcpy(data, info-&gt;types[type].data, info-&gt;types[type]=
.size);<br>
+=C2=A0 =C2=A0 msg-&gt;size +=3D info-&gt;types[type].size;<br>
+<br>
+=C2=A0 =C2=A0 msg-&gt;type =3D VD_AGENT_CLIPBOARD;<br>
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
+=C2=A0 =C2=A0 g_autofree VDAgentMessage *msg =3D g_malloc0(sizeof(VDAgentM=
essage) +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0sizeof(uint32_t) * 2);<br>
+=C2=A0 =C2=A0 uint32_t type =3D type_qemu_to_vdagent(qtype);<br>
+=C2=A0 =C2=A0 uint8_t *s =3D msg-&gt;data;<br>
+=C2=A0 =C2=A0 uint32_t *data =3D (uint32_t *)msg-&gt;data;<br>
+<br>
+=C2=A0 =C2=A0 if (type =3D=3D VD_AGENT_CLIPBOARD_NONE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (have_selection(vd)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *s =3D info-&gt;selection;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 data++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg-&gt;size +=3D sizeof(uint32_t);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 *data =3D type;<br>
+=C2=A0 =C2=A0 msg-&gt;size +=3D sizeof(uint32_t);<br>
+<br>
+=C2=A0 =C2=A0 msg-&gt;type =3D VD_AGENT_CLIPBOARD_REQUEST;<br>
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
+=C2=A0 =C2=A0 if (have_selection(vd)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &lt; 4) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D *(uint8_t *)data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s &gt;=3D QEMU_CLIPBOARD_SELECTION__COUNT)=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 data +=3D 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 size -=3D 4;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 switch (msg-&gt;type) {<br>
+=C2=A0 =C2=A0 case VD_AGENT_CLIPBOARD_GRAB:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_vdagent_cb_grab_selection(GET_NAME(sel_n=
ame, s));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 info =3D qemu_clipboard_info_new(&amp;vd-&gt;c=
bpeer, s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &gt; sizeof(uint32_t) * 10) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* spice has 6 types as of =
2021. Limiting to 10 entries<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* so we we have some wiggl=
e room.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 while (size &gt;=3D sizeof(uint32_t)) {<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data +=3D sizeof(uint32_t);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size -=3D sizeof(uint32_t);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clipboard_update(info);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clipboard_info_put(info);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case VD_AGENT_CLIPBOARD_REQUEST:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &lt; sizeof(uint32_t)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (*(uint32_t *)data) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case VD_AGENT_CLIPBOARD_UTF8_TEXT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type =3D QEMU_CLIPBOARD_TYPE_TEX=
T;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case VD_AGENT_CLIPBOARD: /* data */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &lt; sizeof(uint32_t)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
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
@@ -263,6 +530,11 @@ static void vdagent_chr_open(Chardev *chr,<br>
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
@@ -294,6 +566,12 @@ static void vdagent_chr_recv_caps(VDAgentChardev *vd, =
VDAgentMessage *msg)<br>
=C2=A0 =C2=A0 =C2=A0if (have_mouse(vd) &amp;&amp; vd-&gt;mouse_hs) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_input_handler_activate(vd-&gt;mouse_=
hs);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 if (have_clipboard(vd) &amp;&amp; vd-&gt;cbpeer.update.notif=
y =3D=3D NULL) {<br>
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
=C2=A0static void vdagent_chr_recv_msg(VDAgentChardev *vd, VDAgentMessage *=
msg)<br>
@@ -304,6 +582,14 @@ static void vdagent_chr_recv_msg(VDAgentChardev *vd, V=
DAgentMessage *msg)<br>
=C2=A0 =C2=A0 =C2=A0case VD_AGENT_ANNOUNCE_CAPABILITIES:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vdagent_chr_recv_caps(vd, msg);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 case VD_AGENT_CLIPBOARD:<br>
+=C2=A0 =C2=A0 case VD_AGENT_CLIPBOARD_GRAB:<br>
+=C2=A0 =C2=A0 case VD_AGENT_CLIPBOARD_REQUEST:<br>
+=C2=A0 =C2=A0 case VD_AGENT_CLIPBOARD_RELEASE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (have_clipboard(vd)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vdagent_chr_recv_clipboard(vd, m=
sg);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -419,6 +705,10 @@ static void vdagent_chr_set_fe_open(struct Chardev *ch=
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
@@ -435,6 +725,8 @@ static void vdagent_chr_parse(QemuOpts *opts, ChardevBa=
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
index 880aa8f73333..a89017c41a63 100644<br>
--- a/qapi/char.json<br>
+++ b/qapi/char.json<br>
@@ -396,12 +396,14 @@<br>
=C2=A0# Configuration info for vdagent.<br>
=C2=A0#<br>
=C2=A0# @mouse: enable/disable mouse, default is enabled.<br>
+# @clipboard: enable/disable clipboard, default is disabled.<br>
=C2=A0#<br>
=C2=A0# Since: 6.1<br>
=C2=A0#<br>
=C2=A0##<br>
=C2=A0{ &#39;struct&#39;: &#39;ChardevVDAgent&#39;,<br>
-=C2=A0 &#39;data&#39;: { &#39;*mouse&#39;: &#39;bool&#39; },<br>
+=C2=A0 &#39;data&#39;: { &#39;*mouse&#39;: &#39;bool&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*clipboard&#39;: &#39;bool&=
#39; },<br>
=C2=A0 =C2=A0&#39;base&#39;: &#39;ChardevCommon&#39;,<br>
=C2=A0 =C2=A0&#39;if&#39;: &#39;defined(CONFIG_SPICE_PROTOCOL)&#39; }<br>
<br>
diff --git a/ui/trace-events b/ui/trace-events<br>
index c34cffb0452b..c86542e2b69b 100644<br>
--- a/ui/trace-events<br>
+++ b/ui/trace-events<br>
@@ -132,3 +132,5 @@ vdagent_send(const char *name) &quot;msg %s&quot;<br>
=C2=A0vdagent_recv_chunk(uint32_t size) &quot;size %d&quot;<br>
=C2=A0vdagent_recv_msg(const char *name, uint32_t size) &quot;msg %s, size =
%d&quot;<br>
=C2=A0vdagent_peer_cap(const char *name) &quot;cap %s&quot;<br>
+vdagent_cb_grab_selection(const char *name) &quot;selection %s&quot;<br>
+vdagent_cb_grab_type(const char *name) &quot;type %s&quot;<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div></div>

--0000000000002f7df205c0f0c575--


