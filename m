Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 707A8373832
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 11:55:44 +0200 (CEST)
Received: from localhost ([::1]:51922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leEFr-0005P8-Hy
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 05:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1leEEU-00045y-2c
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:54:18 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:37540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1leEEQ-000722-It
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:54:17 -0400
Received: by mail-ej1-x633.google.com with SMTP id w3so1881639ejc.4
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 02:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=czobLS8rA54RvjOlcUbgsqzq2uTc+uLpxYdYNcMkWKY=;
 b=BcW/gHttW0HJ0MY5UI/ozbJm3SK1mxVJzqDDM8zme0dMKEI9gjAt6WlcdlfC6vxWEA
 YPez7oNJ67SOLl6ZEBIzcHHlhSjpC3iX3ch/8Hnbv1AOtMOrgO7ITFB4B4bAdAygQyxI
 bc6i62Px5oAvTc2OQjqfKldCw1TCAVeHDfmqOHTzSqEMmLD9la+lGaSkOVMv+o0xGDv1
 8ob9NJ8o7BKhCyQEwMEOv9l0vSfIyCPOVbrUdjrYRq3K2RFaeSMQbbr4esbXE8Tx3NsO
 hT/rw84WnWa6ImZ6Di9kNLPJWw53reeckIs6Z+DvUazgItpqESlM7J8URadlZ+L99TMK
 MGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=czobLS8rA54RvjOlcUbgsqzq2uTc+uLpxYdYNcMkWKY=;
 b=ng6OnUqE37lguleaEkYzjF7W79V9y0UMaE7DHlobKBp7DFlh/tAk5idEZdo6aq3bS8
 xU7QXx6nbJ7OC3o6f6SnSm1nBq9kcOLMoZuuD0noyP7X7zVtgFz+9ljD0epXLYjfJRvC
 JWxHWyMlkgUVsZPUBcFr+iimmxGnmIoTeYl4w8sHm5AQhgtAyYUl+GAI8hpe0fRw5Teu
 8UXqH3haQzsG3hkzdDTVvZgAWz37biPibTBfcZFmPjtWWrqGN/6J6JZ+/GJjEkTe5a6G
 6Nk0UbgwW6RuXBXEpAmp+NDBHa/Yooq8L8Zpxa2vtFM3zLId6r4XScbdl7qgXRAYnaHi
 qmnQ==
X-Gm-Message-State: AOAM531E6mrTUympuE4GbvnghsdyxBNPWGF+9kGlzeghecSP7+B3Nt/j
 LWS9Mmi2iYwzAyaLFFccDVZvewDBYX2cPGuU81A=
X-Google-Smtp-Source: ABdhPJw+MWDkVf8Fj3GHfjJ9lFZCexJwII3i8clEo6z0PD5/Z4eZOSdqerTbajr//1nRLw36+xhs6IkeFXKgbPpr+io=
X-Received: by 2002:a17:907:1b1e:: with SMTP id
 mp30mr26808766ejc.532.1620208453103; 
 Wed, 05 May 2021 02:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210505060901.828658-1-kraxel@redhat.com>
 <20210505060901.828658-5-kraxel@redhat.com>
In-Reply-To: <20210505060901.828658-5-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 5 May 2021 13:54:00 +0400
Message-ID: <CAJ+F1CKJyE3P7DX6tewSBHUBrqsc_h5CNZi95VpT9bGu=eVgFQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/9] ui/vdagent: core infrastructure
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000004f398f05c1922de2"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x633.google.com
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

--0000000000004f398f05c1922de2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, May 5, 2021 at 10:14 AM Gerd Hoffmann <kraxel@redhat.com> wrote:

> The vdagent protocol allows the guest agent (spice-vdagent) and the
> spice client exchange messages to implement features which require
> guest cooperation, for example clipboard support.
>
> This is a qemu implementation of the spice client side.  This allows
> the spice guest agent talk to qemu directly when not using the spice
> protocol.
>
> usage: qemu \
>   -chardev qemu-vdagent,id=3Dvdagent \
>   -device virtserialport,chardev=3Dvdagent,name=3Dcom.redhat.spice.0
>
> This patch adds just the protocol basics: initial handshake and
> capability negotiation.  The following patches will add actual
> functionality and also add fields to the initially empty
> ChardevVDAgent qapi struct.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Acked-by: Markus Armbruster <armbru@redhat.com>
>

looks ok to me, but:

---
>  ui/vdagent.c    | 323 ++++++++++++++++++++++++++++++++++++++++++++++++
>  qapi/char.json  |  17 ++-
>  ui/meson.build  |   1 +
>  ui/trace-events |   8 ++
>  4 files changed, 348 insertions(+), 1 deletion(-)
>  create mode 100644 ui/vdagent.c
>
> diff --git a/ui/vdagent.c b/ui/vdagent.c
> new file mode 100644
> index 000000000000..e757a3c9c710
> --- /dev/null
> +++ b/ui/vdagent.c
> @@ -0,0 +1,323 @@
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "include/qemu-common.h"
> +#include "chardev/char.h"
> +#include "trace.h"
> +
> +#include "qapi/qapi-types-char.h"
> +
> +#include "spice/vd_agent.h"
> +
> +struct VDAgentChardev {
> +    Chardev parent;
> +
> +    /* guest vdagent */
> +    uint32_t caps;
> +    VDIChunkHeader chunk;
> +    uint32_t chunksize;
> +    uint8_t *msgbuf;
> +    uint32_t msgsize;
> +    uint8_t *xbuf;
> +    uint32_t xoff, xsize;
> +};
> +typedef struct VDAgentChardev VDAgentChardev;
> +
> +#define TYPE_CHARDEV_QEMU_VDAGENT "chardev-qemu-vdagent"
> +
> +DECLARE_INSTANCE_CHECKER(VDAgentChardev, QEMU_VDAGENT_CHARDEV,
> +                         TYPE_CHARDEV_QEMU_VDAGENT);
> +
> +/* ------------------------------------------------------------------ */
> +/* names, for debug logging                                           */
> +
> +static const char *cap_name[] =3D {
> +    [VD_AGENT_CAP_MOUSE_STATE]                    =3D "mouse-state",
> +    [VD_AGENT_CAP_MONITORS_CONFIG]                =3D "monitors-config",
> +    [VD_AGENT_CAP_REPLY]                          =3D "reply",
> +    [VD_AGENT_CAP_CLIPBOARD]                      =3D "clipboard",
> +    [VD_AGENT_CAP_DISPLAY_CONFIG]                 =3D "display-config",
> +    [VD_AGENT_CAP_CLIPBOARD_BY_DEMAND]            =3D "clipboard-by-dema=
nd",
> +    [VD_AGENT_CAP_CLIPBOARD_SELECTION]            =3D "clipboard-selecti=
on",
> +    [VD_AGENT_CAP_SPARSE_MONITORS_CONFIG]         =3D
> "sparse-monitors-config",
> +    [VD_AGENT_CAP_GUEST_LINEEND_LF]               =3D "guest-lineend-lf"=
,
> +    [VD_AGENT_CAP_GUEST_LINEEND_CRLF]             =3D "guest-lineend-crl=
f",
> +    [VD_AGENT_CAP_MAX_CLIPBOARD]                  =3D "max-clipboard",
> +    [VD_AGENT_CAP_AUDIO_VOLUME_SYNC]              =3D "audio-volume-sync=
",
> +    [VD_AGENT_CAP_MONITORS_CONFIG_POSITION]       =3D
> "monitors-config-position",
> +    [VD_AGENT_CAP_FILE_XFER_DISABLED]             =3D "file-xfer-disable=
d",
> +    [VD_AGENT_CAP_FILE_XFER_DETAILED_ERRORS]      =3D
> "file-xfer-detailed-errors",
> +#if 0
> +    [VD_AGENT_CAP_GRAPHICS_DEVICE_INFO]           =3D
> "graphics-device-info",
> +    [VD_AGENT_CAP_CLIPBOARD_NO_RELEASE_ON_REGRAB] =3D
> "clipboard-no-release-on-regrab",
> +    [VD_AGENT_CAP_CLIPBOARD_GRAB_SERIAL]          =3D
> "clipboard-grab-serial",
> +#endif
> +};
> +
> +static const char *msg_name[] =3D {
> +    [VD_AGENT_MOUSE_STATE]           =3D "mouse-state",
> +    [VD_AGENT_MONITORS_CONFIG]       =3D "monitors-config",
> +    [VD_AGENT_REPLY]                 =3D "reply",
> +    [VD_AGENT_CLIPBOARD]             =3D "clipboard",
> +    [VD_AGENT_DISPLAY_CONFIG]        =3D "display-config",
> +    [VD_AGENT_ANNOUNCE_CAPABILITIES] =3D "announce-capabilities",
> +    [VD_AGENT_CLIPBOARD_GRAB]        =3D "clipboard-grab",
> +    [VD_AGENT_CLIPBOARD_REQUEST]     =3D "clipboard-request",
> +    [VD_AGENT_CLIPBOARD_RELEASE]     =3D "clipboard-release",
> +    [VD_AGENT_FILE_XFER_START]       =3D "file-xfer-start",
> +    [VD_AGENT_FILE_XFER_STATUS]      =3D "file-xfer-status",
> +    [VD_AGENT_FILE_XFER_DATA]        =3D "file-xfer-data",
> +    [VD_AGENT_CLIENT_DISCONNECTED]   =3D "client-disconnected",
> +    [VD_AGENT_MAX_CLIPBOARD]         =3D "max-clipboard",
> +    [VD_AGENT_AUDIO_VOLUME_SYNC]     =3D "audio-volume-sync",
> +#if 0
> +    [VD_AGENT_GRAPHICS_DEVICE_INFO]  =3D "graphics-device-info",
> +#endif
> +};
> +
> +#define GET_NAME(_m, _v) \
> +    (((_v) < ARRAY_SIZE(_m) && (_m[_v])) ? (_m[_v]) : "???")
> +
> +/* ------------------------------------------------------------------ */
> +/* send messages                                                      */
> +
> +static void vdagent_send_buf(VDAgentChardev *vd, void *ptr, uint32_t
> msgsize)
> +{
> +    uint8_t *msgbuf =3D ptr;
> +    uint32_t len, pos =3D 0;
> +
> +    while (pos < msgsize) {
> +        len =3D qemu_chr_be_can_write(CHARDEV(vd));
> +        if (len > msgsize - pos) {
> +            len =3D msgsize - pos;
> +        }
> +        qemu_chr_be_write(CHARDEV(vd), msgbuf + pos, len);
> +        pos +=3D len;
> +    }
>

This looks like it could easily busy loop. Have you thought about fixing
this?

+}
> +
> +static void vdagent_send_msg(VDAgentChardev *vd, VDAgentMessage *msg)
> +{
> +    uint8_t *msgbuf =3D (void *)msg;
> +    uint32_t msgsize =3D sizeof(VDAgentMessage) + msg->size;
> +    uint32_t msgoff =3D 0;
> +    VDIChunkHeader chunk;
> +
> +    trace_vdagent_send(GET_NAME(msg_name, msg->type));
> +
> +    msg->protocol =3D VD_AGENT_PROTOCOL;
> +
> +    while (msgoff < msgsize) {
> +        chunk.port =3D VDP_CLIENT_PORT;
> +        chunk.size =3D msgsize - msgoff;
> +        if (chunk.size > 1024) {
> +            chunk.size =3D 1024;
> +        }
> +        vdagent_send_buf(vd, &chunk, sizeof(chunk));
> +        vdagent_send_buf(vd, msgbuf + msgoff, chunk.size);
> +        msgoff +=3D chunk.size;
> +    }
> +}
> +
> +static void vdagent_send_caps(VDAgentChardev *vd)
> +{
> +    g_autofree VDAgentMessage *msg =3D g_malloc0(sizeof(VDAgentMessage) =
+
> +
>  sizeof(VDAgentAnnounceCapabilities) +
> +                                               sizeof(uint32_t));
> +
> +    msg->type =3D VD_AGENT_ANNOUNCE_CAPABILITIES;
> +    msg->size =3D sizeof(VDAgentAnnounceCapabilities) + sizeof(uint32_t)=
;
> +
> +    vdagent_send_msg(vd, msg);
> +}
> +
> +/* ------------------------------------------------------------------ */
> +/* chardev backend                                                    */
> +
> +static void vdagent_chr_open(Chardev *chr,
> +                             ChardevBackend *backend,
> +                             bool *be_opened,
> +                             Error **errp)
> +{
> +#if defined(HOST_WORDS_BIGENDIAN)
> +    /*
> +     * TODO: vdagent protocol is defined to be LE,
> +     * so we have to byteswap everything on BE hosts.
> +     */
> +    error_setg(errp, "vdagent is not supported on bigendian hosts");
> +    return;
> +#endif
> +
> +    *be_opened =3D true;
> +}
> +
> +static void vdagent_chr_recv_caps(VDAgentChardev *vd, VDAgentMessage *ms=
g)
> +{
> +    VDAgentAnnounceCapabilities *caps =3D (void *)msg->data;
> +    int i;
> +
> +    if (msg->size < (sizeof(VDAgentAnnounceCapabilities) +
> +                     sizeof(uint32_t))) {
> +        return;
> +    }
> +
> +    for (i =3D 0; i < ARRAY_SIZE(cap_name); i++) {
> +        if (caps->caps[0] & (1 << i)) {
> +            trace_vdagent_peer_cap(GET_NAME(cap_name, i));
> +        }
> +    }
> +
> +    vd->caps =3D caps->caps[0];
> +    if (caps->request) {
> +        vdagent_send_caps(vd);
> +    }
> +}
> +
> +static void vdagent_chr_recv_msg(VDAgentChardev *vd, VDAgentMessage *msg=
)
> +{
> +    trace_vdagent_recv_msg(GET_NAME(msg_name, msg->type), msg->size);
> +
> +    switch (msg->type) {
> +    case VD_AGENT_ANNOUNCE_CAPABILITIES:
> +        vdagent_chr_recv_caps(vd, msg);
> +        break;
> +    default:
> +        break;
> +    }
> +}
> +
> +static void vdagent_reset_xbuf(VDAgentChardev *vd)
> +{
> +    g_clear_pointer(&vd->xbuf, g_free);
> +    vd->xoff =3D 0;
> +    vd->xsize =3D 0;
> +}
> +
> +static void vdagent_chr_recv_chunk(VDAgentChardev *vd)
> +{
> +    VDAgentMessage *msg =3D (void *)vd->msgbuf;
> +
> +    if (!vd->xsize) {
> +        if (vd->msgsize < sizeof(*msg)) {
> +            error_report("%s: message too small: %d < %zd", __func__,
> +                         vd->msgsize, sizeof(*msg));
> +            return;
> +        }
> +        if (vd->msgsize =3D=3D msg->size + sizeof(*msg)) {
> +            vdagent_chr_recv_msg(vd, msg);
> +            return;
> +        }
> +    }
> +
> +    if (!vd->xsize) {
> +        vd->xsize =3D msg->size + sizeof(*msg);
> +        vd->xbuf =3D g_malloc0(vd->xsize);
> +    }
> +
> +    if (vd->xoff + vd->msgsize > vd->xsize) {
> +        error_report("%s: Oops: %d+%d > %d", __func__,
> +                     vd->xoff, vd->msgsize, vd->xsize);
> +        vdagent_reset_xbuf(vd);
> +        return;
> +    }
> +
> +    memcpy(vd->xbuf + vd->xoff, vd->msgbuf, vd->msgsize);
> +    vd->xoff +=3D vd->msgsize;
> +    if (vd->xoff < vd->xsize) {
> +        return;
> +    }
> +
> +    msg =3D (void *)vd->xbuf;
> +    vdagent_chr_recv_msg(vd, msg);
> +    vdagent_reset_xbuf(vd);
> +}
> +
> +static void vdagent_reset_bufs(VDAgentChardev *vd)
> +{
> +    memset(&vd->chunk, 0, sizeof(vd->chunk));
> +    vd->chunksize =3D 0;
> +    g_free(vd->msgbuf);
> +    vd->msgbuf =3D NULL;
> +    vd->msgsize =3D 0;
> +}
> +
> +static int vdagent_chr_write(Chardev *chr, const uint8_t *buf, int len)
> +{
> +    VDAgentChardev *vd =3D QEMU_VDAGENT_CHARDEV(chr);
> +    uint32_t copy, ret =3D len;
> +
> +    while (len) {
> +        if (vd->chunksize < sizeof(vd->chunk)) {
> +            copy =3D sizeof(vd->chunk) - vd->chunksize;
> +            if (copy > len) {
> +                copy =3D len;
> +            }
> +            memcpy((void *)(&vd->chunk) + vd->chunksize, buf, copy);
> +            vd->chunksize +=3D copy;
> +            buf +=3D copy;
> +            len -=3D copy;
> +            if (vd->chunksize < sizeof(vd->chunk)) {
> +                break;
> +            }
> +
> +            assert(vd->msgbuf =3D=3D NULL);
> +            vd->msgbuf =3D g_malloc0(vd->chunk.size);
> +        }
> +
> +        copy =3D vd->chunk.size - vd->msgsize;
> +        if (copy > len) {
> +            copy =3D len;
> +        }
> +        memcpy(vd->msgbuf + vd->msgsize, buf, copy);
> +        vd->msgsize +=3D copy;
> +        buf +=3D copy;
> +        len -=3D copy;
> +
> +        if (vd->msgsize =3D=3D vd->chunk.size) {
> +            trace_vdagent_recv_chunk(vd->chunk.size);
> +            vdagent_chr_recv_chunk(vd);
> +            vdagent_reset_bufs(vd);
> +        }
> +    }
> +
> +    return ret;
> +}
> +
> +static void vdagent_chr_set_fe_open(struct Chardev *chr, int fe_open)
> +{
> +    VDAgentChardev *vd =3D QEMU_VDAGENT_CHARDEV(chr);
> +
> +    if (!fe_open) {
> +        trace_vdagent_close();
> +        /* reset state */
> +        vdagent_reset_bufs(vd);
> +        vd->caps =3D 0;
> +        return;
> +    }
> +
> +    trace_vdagent_open();
> +}
> +
> +/* ------------------------------------------------------------------ */
> +
> +static void vdagent_chr_class_init(ObjectClass *oc, void *data)
> +{
> +    ChardevClass *cc =3D CHARDEV_CLASS(oc);
> +
> +    cc->open             =3D vdagent_chr_open;
> +    cc->chr_write        =3D vdagent_chr_write;
> +    cc->chr_set_fe_open  =3D vdagent_chr_set_fe_open;
> +}
> +
> +static const TypeInfo vdagent_chr_type_info =3D {
> +    .name =3D TYPE_CHARDEV_QEMU_VDAGENT,
> +    .parent =3D TYPE_CHARDEV,
> +    .instance_size =3D sizeof(VDAgentChardev),
> +    .class_init =3D vdagent_chr_class_init,
> +};
> +
> +static void register_types(void)
> +{
> +    type_register_static(&vdagent_chr_type_info);
> +}
> +
> +type_init(register_types);
> diff --git a/qapi/char.json b/qapi/char.json
> index 6413970fa73b..990801e642bb 100644
> --- a/qapi/char.json
> +++ b/qapi/char.json
> @@ -390,12 +390,25 @@
>    'data': { '*size': 'int' },
>    'base': 'ChardevCommon' }
>
> +##
> +# @ChardevQemuVDAgent:
> +#
> +# Configuration info for qemu vdagent implementation.
> +#
> +# Since: 6.1
> +#
> +##
> +{ 'struct': 'ChardevQemuVDAgent',
> +  'data': { },
> +  'base': 'ChardevCommon',
> +  'if': 'defined(CONFIG_SPICE_PROTOCOL)' }
> +
>  ##
>  # @ChardevBackend:
>  #
>  # Configuration info for the new chardev backend.
>  #
> -# Since: 1.4 (testdev since 2.2, wctablet since 2.9)
> +# Since: 1.4 (testdev since 2.2, wctablet since 2.9, vdagent since 6.1)
>  ##
>  { 'union': 'ChardevBackend',
>    'data': { 'file': 'ChardevFile',
> @@ -417,6 +430,8 @@
>                            'if': 'defined(CONFIG_SPICE)' },
>              'spiceport': { 'type': 'ChardevSpicePort',
>                             'if': 'defined(CONFIG_SPICE)' },
> +            'qemu-vdagent': { 'type': 'ChardevQemuVDAgent',
> +                              'if': 'defined(CONFIG_SPICE_PROTOCOL)' },
>              'vc': 'ChardevVC',
>              'ringbuf': 'ChardevRingbuf',
>              # next one is just for compatibility
> diff --git a/ui/meson.build b/ui/meson.build
> index fc4fb75c2869..bad49fb6de60 100644
> --- a/ui/meson.build
> +++ b/ui/meson.build
> @@ -14,6 +14,7 @@ softmmu_ss.add(files(
>    'qemu-pixman.c',
>  ))
>  softmmu_ss.add([spice_headers, files('spice-module.c')])
> +softmmu_ss.add(when: spice_protocol, if_true: files('vdagent.c'))
>
>  softmmu_ss.add(when: 'CONFIG_LINUX', if_true: files('input-linux.c'))
>  softmmu_ss.add(when: cocoa, if_true: files('cocoa.m'))
> diff --git a/ui/trace-events b/ui/trace-events
> index 5d1da6f23668..c34cffb0452b 100644
> --- a/ui/trace-events
> +++ b/ui/trace-events
> @@ -124,3 +124,11 @@ xkeymap_extension(const char *name) "extension '%s'"
>  xkeymap_vendor(const char *name) "vendor '%s'"
>  xkeymap_keycodes(const char *name) "keycodes '%s'"
>  xkeymap_keymap(const char *name) "keymap '%s'"
> +
> +# vdagent.c
> +vdagent_open(void) ""
> +vdagent_close(void) ""
> +vdagent_send(const char *name) "msg %s"
> +vdagent_recv_chunk(uint32_t size) "size %d"
> +vdagent_recv_msg(const char *name, uint32_t size) "msg %s, size %d"
> +vdagent_peer_cap(const char *name) "cap %s"
> --
> 2.31.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000004f398f05c1922de2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, May 5, 2021 at 10:14 AM Gerd Hoffmann=
 &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">The vdagent prot=
ocol allows the guest agent (spice-vdagent) and the<br>
spice client exchange messages to implement features which require<br>
guest cooperation, for example clipboard support.<br>
<br>
This is a qemu implementation of the spice client side.=C2=A0 This allows<b=
r>
the spice guest agent talk to qemu directly when not using the spice<br>
protocol.<br>
<br>
usage: qemu \<br>
=C2=A0 -chardev qemu-vdagent,id=3Dvdagent \<br>
=C2=A0 -device virtserialport,chardev=3Dvdagent,name=3Dcom.redhat.spice.0<b=
r>
<br>
This patch adds just the protocol basics: initial handshake and<br>
capability negotiation.=C2=A0 The following patches will add actual<br>
functionality and also add fields to the initially empty<br>
ChardevVDAgent qapi struct.<br>
<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br>
Acked-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" target=
=3D"_blank">armbru@redhat.com</a>&gt; <br></blockquote><div><br></div><div>=
looks ok to me, but:<br></div><div><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
---<br>
=C2=A0ui/vdagent.c=C2=A0 =C2=A0 | 323 +++++++++++++++++++++++++++++++++++++=
+++++++++++<br>
=C2=A0qapi/char.json=C2=A0 |=C2=A0 17 ++-<br>
=C2=A0ui/meson.build=C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0ui/trace-events |=C2=A0 =C2=A08 ++<br>
=C2=A04 files changed, 348 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 ui/vdagent.c<br>
<br>
diff --git a/ui/vdagent.c b/ui/vdagent.c<br>
new file mode 100644<br>
index 000000000000..e757a3c9c710<br>
--- /dev/null<br>
+++ b/ui/vdagent.c<br>
@@ -0,0 +1,323 @@<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+#include &quot;include/qemu-common.h&quot;<br>
+#include &quot;chardev/char.h&quot;<br>
+#include &quot;trace.h&quot;<br>
+<br>
+#include &quot;qapi/qapi-types-char.h&quot;<br>
+<br>
+#include &quot;spice/vd_agent.h&quot;<br>
+<br>
+struct VDAgentChardev {<br>
+=C2=A0 =C2=A0 Chardev parent;<br>
+<br>
+=C2=A0 =C2=A0 /* guest vdagent */<br>
+=C2=A0 =C2=A0 uint32_t caps;<br>
+=C2=A0 =C2=A0 VDIChunkHeader chunk;<br>
+=C2=A0 =C2=A0 uint32_t chunksize;<br>
+=C2=A0 =C2=A0 uint8_t *msgbuf;<br>
+=C2=A0 =C2=A0 uint32_t msgsize;<br>
+=C2=A0 =C2=A0 uint8_t *xbuf;<br>
+=C2=A0 =C2=A0 uint32_t xoff, xsize;<br>
+};<br>
+typedef struct VDAgentChardev VDAgentChardev;<br>
+<br>
+#define TYPE_CHARDEV_QEMU_VDAGENT &quot;chardev-qemu-vdagent&quot;<br>
+<br>
+DECLARE_INSTANCE_CHECKER(VDAgentChardev, QEMU_VDAGENT_CHARDEV,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0TYPE_CHARDEV_QEMU_VDAGENT);<br>
+<br>
+/* ------------------------------------------------------------------ */<b=
r>
+/* names, for debug logging=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+<br>
+static const char *cap_name[] =3D {<br>
+=C2=A0 =C2=A0 [VD_AGENT_CAP_MOUSE_STATE]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;mouse-state&quot;,<br>
+=C2=A0 =C2=A0 [VD_AGENT_CAP_MONITORS_CONFIG]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;monitors-config&quot;,<br>
+=C2=A0 =C2=A0 [VD_AGENT_CAP_REPLY]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;reply&quot;,=
<br>
+=C2=A0 =C2=A0 [VD_AGENT_CAP_CLIPBOARD]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;clipboard&quot;,<br>
+=C2=A0 =C2=A0 [VD_AGENT_CAP_DISPLAY_CONFIG]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;display-config&quot;,<br>
+=C2=A0 =C2=A0 [VD_AGENT_CAP_CLIPBOARD_BY_DEMAND]=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D &quot;clipboard-by-demand&quot;,<br>
+=C2=A0 =C2=A0 [VD_AGENT_CAP_CLIPBOARD_SELECTION]=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D &quot;clipboard-selection&quot;,<br>
+=C2=A0 =C2=A0 [VD_AGENT_CAP_SPARSE_MONITORS_CONFIG]=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D &quot;sparse-monitors-config&quot;,<br>
+=C2=A0 =C2=A0 [VD_AGENT_CAP_GUEST_LINEEND_LF]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;guest-lineend-lf&quot;,<br>
+=C2=A0 =C2=A0 [VD_AGENT_CAP_GUEST_LINEEND_CRLF]=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0=3D &quot;guest-lineend-crlf&quot;,<br>
+=C2=A0 =C2=A0 [VD_AGENT_CAP_MAX_CLIPBOARD]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;max-clipboard&quot;,<br>
+=C2=A0 =C2=A0 [VD_AGENT_CAP_AUDIO_VOLUME_SYNC]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D &quot;audio-volume-sync&quot;,<br>
+=C2=A0 =C2=A0 [VD_AGENT_CAP_MONITORS_CONFIG_POSITION]=C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D &quot;monitors-config-position&quot;,<br>
+=C2=A0 =C2=A0 [VD_AGENT_CAP_FILE_XFER_DISABLED]=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0=3D &quot;file-xfer-disabled&quot;,<br>
+=C2=A0 =C2=A0 [VD_AGENT_CAP_FILE_XFER_DETAILED_ERRORS]=C2=A0 =C2=A0 =C2=A0=
 =3D &quot;file-xfer-detailed-errors&quot;,<br>
+#if 0<br>
+=C2=A0 =C2=A0 [VD_AGENT_CAP_GRAPHICS_DEVICE_INFO]=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D &quot;graphics-device-info&quot;,<br>
+=C2=A0 =C2=A0 [VD_AGENT_CAP_CLIPBOARD_NO_RELEASE_ON_REGRAB] =3D &quot;clip=
board-no-release-on-regrab&quot;,<br>
+=C2=A0 =C2=A0 [VD_AGENT_CAP_CLIPBOARD_GRAB_SERIAL]=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D &quot;clipboard-grab-serial&quot;,<br>
+#endif<br>
+};<br>
+<br>
+static const char *msg_name[] =3D {<br>
+=C2=A0 =C2=A0 [VD_AGENT_MOUSE_STATE]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D &quot;mouse-state&quot;,<br>
+=C2=A0 =C2=A0 [VD_AGENT_MONITORS_CONFIG]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &qu=
ot;monitors-config&quot;,<br>
+=C2=A0 =C2=A0 [VD_AGENT_REPLY]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D &quot;reply&quot;,<br>
+=C2=A0 =C2=A0 [VD_AGENT_CLIPBOARD]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D &quot;clipboard&quot;,<br>
+=C2=A0 =C2=A0 [VD_AGENT_DISPLAY_CONFIG]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &qu=
ot;display-config&quot;,<br>
+=C2=A0 =C2=A0 [VD_AGENT_ANNOUNCE_CAPABILITIES] =3D &quot;announce-capabili=
ties&quot;,<br>
+=C2=A0 =C2=A0 [VD_AGENT_CLIPBOARD_GRAB]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &qu=
ot;clipboard-grab&quot;,<br>
+=C2=A0 =C2=A0 [VD_AGENT_CLIPBOARD_REQUEST]=C2=A0 =C2=A0 =C2=A0=3D &quot;cl=
ipboard-request&quot;,<br>
+=C2=A0 =C2=A0 [VD_AGENT_CLIPBOARD_RELEASE]=C2=A0 =C2=A0 =C2=A0=3D &quot;cl=
ipboard-release&quot;,<br>
+=C2=A0 =C2=A0 [VD_AGENT_FILE_XFER_START]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &qu=
ot;file-xfer-start&quot;,<br>
+=C2=A0 =C2=A0 [VD_AGENT_FILE_XFER_STATUS]=C2=A0 =C2=A0 =C2=A0 =3D &quot;fi=
le-xfer-status&quot;,<br>
+=C2=A0 =C2=A0 [VD_AGENT_FILE_XFER_DATA]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &qu=
ot;file-xfer-data&quot;,<br>
+=C2=A0 =C2=A0 [VD_AGENT_CLIENT_DISCONNECTED]=C2=A0 =C2=A0=3D &quot;client-=
disconnected&quot;,<br>
+=C2=A0 =C2=A0 [VD_AGENT_MAX_CLIPBOARD]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D &quot;max-clipboard&quot;,<br>
+=C2=A0 =C2=A0 [VD_AGENT_AUDIO_VOLUME_SYNC]=C2=A0 =C2=A0 =C2=A0=3D &quot;au=
dio-volume-sync&quot;,<br>
+#if 0<br>
+=C2=A0 =C2=A0 [VD_AGENT_GRAPHICS_DEVICE_INFO]=C2=A0 =3D &quot;graphics-dev=
ice-info&quot;,<br>
+#endif<br>
+};<br>
+<br>
+#define GET_NAME(_m, _v) \<br>
+=C2=A0 =C2=A0 (((_v) &lt; ARRAY_SIZE(_m) &amp;&amp; (_m[_v])) ? (_m[_v]) :=
 &quot;???&quot;)<br>
+<br>
+/* ------------------------------------------------------------------ */<b=
r>
+/* send messages=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+<br>
+static void vdagent_send_buf(VDAgentChardev *vd, void *ptr, uint32_t msgsi=
ze)<br>
+{<br>
+=C2=A0 =C2=A0 uint8_t *msgbuf =3D ptr;<br>
+=C2=A0 =C2=A0 uint32_t len, pos =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 while (pos &lt; msgsize) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D qemu_chr_be_can_write(CHARDEV(vd));<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len &gt; msgsize - pos) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D msgsize - pos;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_chr_be_write(CHARDEV(vd), msgbuf + pos, l=
en);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pos +=3D len;<br>
+=C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>This looks like it cou=
ld easily busy loop. Have you thought about fixing this?<br></div><div><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
+}<br>
+<br>
+static void vdagent_send_msg(VDAgentChardev *vd, VDAgentMessage *msg)<br>
+{<br>
+=C2=A0 =C2=A0 uint8_t *msgbuf =3D (void *)msg;<br>
+=C2=A0 =C2=A0 uint32_t msgsize =3D sizeof(VDAgentMessage) + msg-&gt;size;<=
br>
+=C2=A0 =C2=A0 uint32_t msgoff =3D 0;<br>
+=C2=A0 =C2=A0 VDIChunkHeader chunk;<br>
+<br>
+=C2=A0 =C2=A0 trace_vdagent_send(GET_NAME(msg_name, msg-&gt;type));<br>
+<br>
+=C2=A0 =C2=A0 msg-&gt;protocol =3D VD_AGENT_PROTOCOL;<br>
+<br>
+=C2=A0 =C2=A0 while (msgoff &lt; msgsize) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 chunk.port =3D VDP_CLIENT_PORT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 chunk.size =3D msgsize - msgoff;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (chunk.size &gt; 1024) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chunk.size =3D 1024;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vdagent_send_buf(vd, &amp;chunk, sizeof(chunk)=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vdagent_send_buf(vd, msgbuf + msgoff, chunk.si=
ze);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 msgoff +=3D chunk.size;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void vdagent_send_caps(VDAgentChardev *vd)<br>
+{<br>
+=C2=A0 =C2=A0 g_autofree VDAgentMessage *msg =3D g_malloc0(sizeof(VDAgentM=
essage) +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0sizeof(VDAgentAnnounceCapabilities) +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0sizeof(uint32_t));<br>
+<br>
+=C2=A0 =C2=A0 msg-&gt;type =3D VD_AGENT_ANNOUNCE_CAPABILITIES;<br>
+=C2=A0 =C2=A0 msg-&gt;size =3D sizeof(VDAgentAnnounceCapabilities) + sizeo=
f(uint32_t);<br>
+<br>
+=C2=A0 =C2=A0 vdagent_send_msg(vd, msg);<br>
+}<br>
+<br>
+/* ------------------------------------------------------------------ */<b=
r>
+/* chardev backend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+<br>
+static void vdagent_chr_open(Chardev *chr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ChardevBackend *backend,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool *be_opened,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)<br>
+{<br>
+#if defined(HOST_WORDS_BIGENDIAN)<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* TODO: vdagent protocol is defined to be LE,<br>
+=C2=A0 =C2=A0 =C2=A0* so we have to byteswap everything on BE hosts.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 error_setg(errp, &quot;vdagent is not supported on bigendian=
 hosts&quot;);<br>
+=C2=A0 =C2=A0 return;<br>
+#endif<br>
+<br>
+=C2=A0 =C2=A0 *be_opened =3D true;<br>
+}<br>
+<br>
+static void vdagent_chr_recv_caps(VDAgentChardev *vd, VDAgentMessage *msg)=
<br>
+{<br>
+=C2=A0 =C2=A0 VDAgentAnnounceCapabilities *caps =3D (void *)msg-&gt;data;<=
br>
+=C2=A0 =C2=A0 int i;<br>
+<br>
+=C2=A0 =C2=A0 if (msg-&gt;size &lt; (sizeof(VDAgentAnnounceCapabilities) +=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0sizeof(uint32_t))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; ARRAY_SIZE(cap_name); i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (caps-&gt;caps[0] &amp; (1 &lt;&lt; i)) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_vdagent_peer_cap(GET_NAME(=
cap_name, i));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 vd-&gt;caps =3D caps-&gt;caps[0];<br>
+=C2=A0 =C2=A0 if (caps-&gt;request) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vdagent_send_caps(vd);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void vdagent_chr_recv_msg(VDAgentChardev *vd, VDAgentMessage *msg)<=
br>
+{<br>
+=C2=A0 =C2=A0 trace_vdagent_recv_msg(GET_NAME(msg_name, msg-&gt;type), msg=
-&gt;size);<br>
+<br>
+=C2=A0 =C2=A0 switch (msg-&gt;type) {<br>
+=C2=A0 =C2=A0 case VD_AGENT_ANNOUNCE_CAPABILITIES:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vdagent_chr_recv_caps(vd, msg);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void vdagent_reset_xbuf(VDAgentChardev *vd)<br>
+{<br>
+=C2=A0 =C2=A0 g_clear_pointer(&amp;vd-&gt;xbuf, g_free);<br>
+=C2=A0 =C2=A0 vd-&gt;xoff =3D 0;<br>
+=C2=A0 =C2=A0 vd-&gt;xsize =3D 0;<br>
+}<br>
+<br>
+static void vdagent_chr_recv_chunk(VDAgentChardev *vd)<br>
+{<br>
+=C2=A0 =C2=A0 VDAgentMessage *msg =3D (void *)vd-&gt;msgbuf;<br>
+<br>
+=C2=A0 =C2=A0 if (!vd-&gt;xsize) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vd-&gt;msgsize &lt; sizeof(*msg)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;%s: message t=
oo small: %d &lt; %zd&quot;, __func__,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0vd-&gt;msgsize, sizeof(*msg));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vd-&gt;msgsize =3D=3D msg-&gt;size + sizeo=
f(*msg)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vdagent_chr_recv_msg(vd, msg);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (!vd-&gt;xsize) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vd-&gt;xsize =3D msg-&gt;size + sizeof(*msg);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vd-&gt;xbuf =3D g_malloc0(vd-&gt;xsize);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (vd-&gt;xoff + vd-&gt;msgsize &gt; vd-&gt;xsize) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;%s: Oops: %d+%d &gt; %d&quo=
t;, __func__,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0vd-&gt;xoff, vd-&gt;msgsize, vd-&gt;xsize);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vdagent_reset_xbuf(vd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 memcpy(vd-&gt;xbuf + vd-&gt;xoff, vd-&gt;msgbuf, vd-&gt;msgs=
ize);<br>
+=C2=A0 =C2=A0 vd-&gt;xoff +=3D vd-&gt;msgsize;<br>
+=C2=A0 =C2=A0 if (vd-&gt;xoff &lt; vd-&gt;xsize) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 msg =3D (void *)vd-&gt;xbuf;<br>
+=C2=A0 =C2=A0 vdagent_chr_recv_msg(vd, msg);<br>
+=C2=A0 =C2=A0 vdagent_reset_xbuf(vd);<br>
+}<br>
+<br>
+static void vdagent_reset_bufs(VDAgentChardev *vd)<br>
+{<br>
+=C2=A0 =C2=A0 memset(&amp;vd-&gt;chunk, 0, sizeof(vd-&gt;chunk));<br>
+=C2=A0 =C2=A0 vd-&gt;chunksize =3D 0;<br>
+=C2=A0 =C2=A0 g_free(vd-&gt;msgbuf);<br>
+=C2=A0 =C2=A0 vd-&gt;msgbuf =3D NULL;<br>
+=C2=A0 =C2=A0 vd-&gt;msgsize =3D 0;<br>
+}<br>
+<br>
+static int vdagent_chr_write(Chardev *chr, const uint8_t *buf, int len)<br=
>
+{<br>
+=C2=A0 =C2=A0 VDAgentChardev *vd =3D QEMU_VDAGENT_CHARDEV(chr);<br>
+=C2=A0 =C2=A0 uint32_t copy, ret =3D len;<br>
+<br>
+=C2=A0 =C2=A0 while (len) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vd-&gt;chunksize &lt; sizeof(vd-&gt;chunk)=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copy =3D sizeof(vd-&gt;chunk) - =
vd-&gt;chunksize;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (copy &gt; len) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copy =3D len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy((void *)(&amp;vd-&gt;chun=
k) + vd-&gt;chunksize, buf, copy);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vd-&gt;chunksize +=3D copy;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf +=3D copy;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D copy;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vd-&gt;chunksize &lt; sizeof=
(vd-&gt;chunk)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(vd-&gt;msgbuf =3D=3D NULL=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vd-&gt;msgbuf =3D g_malloc0(vd-&=
gt;chunk.size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 copy =3D vd-&gt;chunk.size - vd-&gt;msgsize;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (copy &gt; len) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copy =3D len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(vd-&gt;msgbuf + vd-&gt;msgsize, buf, co=
py);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vd-&gt;msgsize +=3D copy;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 buf +=3D copy;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D copy;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vd-&gt;msgsize =3D=3D vd-&gt;chunk.size) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_vdagent_recv_chunk(vd-&gt;=
chunk.size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vdagent_chr_recv_chunk(vd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vdagent_reset_bufs(vd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static void vdagent_chr_set_fe_open(struct Chardev *chr, int fe_open)<br>
+{<br>
+=C2=A0 =C2=A0 VDAgentChardev *vd =3D QEMU_VDAGENT_CHARDEV(chr);<br>
+<br>
+=C2=A0 =C2=A0 if (!fe_open) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_vdagent_close();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* reset state */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vdagent_reset_bufs(vd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vd-&gt;caps =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 trace_vdagent_open();<br>
+}<br>
+<br>
+/* ------------------------------------------------------------------ */<b=
r>
+<br>
+static void vdagent_chr_class_init(ObjectClass *oc, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 ChardevClass *cc =3D CHARDEV_CLASS(oc);<br>
+<br>
+=C2=A0 =C2=A0 cc-&gt;open=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D vdagent_chr_open;<br>
+=C2=A0 =C2=A0 cc-&gt;chr_write=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D vdagent_chr_=
write;<br>
+=C2=A0 =C2=A0 cc-&gt;chr_set_fe_open=C2=A0 =3D vdagent_chr_set_fe_open;<br=
>
+}<br>
+<br>
+static const TypeInfo vdagent_chr_type_info =3D {<br>
+=C2=A0 =C2=A0 .name =3D TYPE_CHARDEV_QEMU_VDAGENT,<br>
+=C2=A0 =C2=A0 .parent =3D TYPE_CHARDEV,<br>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(VDAgentChardev),<br>
+=C2=A0 =C2=A0 .class_init =3D vdagent_chr_class_init,<br>
+};<br>
+<br>
+static void register_types(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;vdagent_chr_type_info);<br>
+}<br>
+<br>
+type_init(register_types);<br>
diff --git a/qapi/char.json b/qapi/char.json<br>
index 6413970fa73b..990801e642bb 100644<br>
--- a/qapi/char.json<br>
+++ b/qapi/char.json<br>
@@ -390,12 +390,25 @@<br>
=C2=A0 =C2=A0&#39;data&#39;: { &#39;*size&#39;: &#39;int&#39; },<br>
=C2=A0 =C2=A0&#39;base&#39;: &#39;ChardevCommon&#39; }<br>
<br>
+##<br>
+# @ChardevQemuVDAgent:<br>
+#<br>
+# Configuration info for qemu vdagent implementation.<br>
+#<br>
+# Since: 6.1<br>
+#<br>
+##<br>
+{ &#39;struct&#39;: &#39;ChardevQemuVDAgent&#39;,<br>
+=C2=A0 &#39;data&#39;: { },<br>
+=C2=A0 &#39;base&#39;: &#39;ChardevCommon&#39;,<br>
+=C2=A0 &#39;if&#39;: &#39;defined(CONFIG_SPICE_PROTOCOL)&#39; }<br>
+<br>
=C2=A0##<br>
=C2=A0# @ChardevBackend:<br>
=C2=A0#<br>
=C2=A0# Configuration info for the new chardev backend.<br>
=C2=A0#<br>
-# Since: 1.4 (testdev since 2.2, wctablet since 2.9)<br>
+# Since: 1.4 (testdev since 2.2, wctablet since 2.9, vdagent since 6.1)<br=
>
=C2=A0##<br>
=C2=A0{ &#39;union&#39;: &#39;ChardevBackend&#39;,<br>
=C2=A0 =C2=A0&#39;data&#39;: { &#39;file&#39;: &#39;ChardevFile&#39;,<br>
@@ -417,6 +430,8 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&#39;if&#39;: &#39;defined(CONFIG_SPICE)&#39; },<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;spiceport&#39;: { &#39=
;type&#39;: &#39;ChardevSpicePort&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &#39;if&#39;: &#39;defined(CONFIG_SPICE)&#39; },<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;qemu-vdagent&#39;: { &#39;t=
ype&#39;: &#39;ChardevQemuVDAgent&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;if&#39;: &#39;defined(CONFIG_SPICE_PRO=
TOCOL)&#39; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;vc&#39;: &#39;ChardevV=
C&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;ringbuf&#39;: &#39;Cha=
rdevRingbuf&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# next one is just for comp=
atibility<br>
diff --git a/ui/meson.build b/ui/meson.build<br>
index fc4fb75c2869..bad49fb6de60 100644<br>
--- a/ui/meson.build<br>
+++ b/ui/meson.build<br>
@@ -14,6 +14,7 @@ softmmu_ss.add(files(<br>
=C2=A0 =C2=A0&#39;qemu-pixman.c&#39;,<br>
=C2=A0))<br>
=C2=A0softmmu_ss.add([spice_headers, files(&#39;spice-module.c&#39;)])<br>
+softmmu_ss.add(when: spice_protocol, if_true: files(&#39;vdagent.c&#39;))<=
br>
<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_LINUX&#39;, if_true: files(&#39;inpu=
t-linux.c&#39;))<br>
=C2=A0softmmu_ss.add(when: cocoa, if_true: files(&#39;cocoa.m&#39;))<br>
diff --git a/ui/trace-events b/ui/trace-events<br>
index 5d1da6f23668..c34cffb0452b 100644<br>
--- a/ui/trace-events<br>
+++ b/ui/trace-events<br>
@@ -124,3 +124,11 @@ xkeymap_extension(const char *name) &quot;extension &#=
39;%s&#39;&quot;<br>
=C2=A0xkeymap_vendor(const char *name) &quot;vendor &#39;%s&#39;&quot;<br>
=C2=A0xkeymap_keycodes(const char *name) &quot;keycodes &#39;%s&#39;&quot;<=
br>
=C2=A0xkeymap_keymap(const char *name) &quot;keymap &#39;%s&#39;&quot;<br>
+<br>
+# vdagent.c<br>
+vdagent_open(void) &quot;&quot;<br>
+vdagent_close(void) &quot;&quot;<br>
+vdagent_send(const char *name) &quot;msg %s&quot;<br>
+vdagent_recv_chunk(uint32_t size) &quot;size %d&quot;<br>
+vdagent_recv_msg(const char *name, uint32_t size) &quot;msg %s, size %d&qu=
ot;<br>
+vdagent_peer_cap(const char *name) &quot;cap %s&quot;<br>
-- <br>
2.31.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000004f398f05c1922de2--

