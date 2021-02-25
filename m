Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBD9325569
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 19:26:49 +0100 (CET)
Received: from localhost ([::1]:54006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFLLb-0001as-Jt
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 13:26:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lFLJh-0000rw-RV
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 13:24:49 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:42230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lFLJZ-00027X-3B
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 13:24:49 -0500
Received: by mail-ed1-x529.google.com with SMTP id h19so8137152edb.9
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 10:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ql0gRrZBLzqzLRpo0NeqwnoE0anIZD2xI4+oLCI8lQU=;
 b=WT9nd1Cv7qa0Qy1Vx+OqGd8hNb5oirNFPbdjYIu5sk0S6wHPXGZPFhhblI8q98fKZv
 U8dmxNE93HaA3alFe0ynjTo5BVuaVQNko35IDi6zEfXwXOMU/b7H03wP1CpnekdN9WVN
 +iuEUTph9BgULZQFMnEJaGhniA6hF7XjVOCBnKev0iaC5DGbCf5CqNEAZ8Eurnv7+rqe
 uc+wC6t6ixNKn6DvGgZFeJnhFlfKOFSMErpQ+ruKwZBAnUmIDqfiY220nPqDx2b1P97E
 BzB+r3Y3132yQPMEnBl1S07qimEMRK3ev0KFDSFqZJ9Mxv3BI8yMVskZIbmJOL/igUqq
 lV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ql0gRrZBLzqzLRpo0NeqwnoE0anIZD2xI4+oLCI8lQU=;
 b=efkgEnylQn5hy/3nUDLr6M9JhmEUVD5q9IFAHmhgVBhjzDGIHVHL2tk8b41PIsTgdh
 lojxtssHQR62rlmh+T7UqwgrZGFwUn08FgIU4zC0u2ji/jhaxOqzPEVtzfNWk1SB3MGU
 tgq8ZV0Z87+rXvV3BBGSRdqzvkWBPI8igU4suAy1qg6v3sSdqLve7yBlBoCATbmmRAiN
 fW4Fi4qiNiDOcsk8/DlSgAhiNZMb7nfjZZ9Mix3+tgSh5rojFAjn+er4AGuFXf215VkD
 AyvHXnz1jvgq/5y3nPjfJvL+4n86IwowUg4bQsJBdPMKSAKAnV5Y3uaAR5htucB3tM+p
 uekA==
X-Gm-Message-State: AOAM532xn1F2KRI9D9dDfRlrn5z/mY6wteWk902+GllCle7ep4GqzeXW
 0BhVNpgAn1ep1Cc6S8V7rASSJwFsQXRZr6Anx47EitubMqM3Wg==
X-Google-Smtp-Source: ABdhPJzuwYthV9VkdIcMDGDlKS4OBuJ44mrJ1Aj1LbVT/defrNXywZgkh0iTlvC6KDu19VOWcHazE+rpY5OUZFOttM4=
X-Received: by 2002:a05:6402:3094:: with SMTP id
 de20mr4470316edb.30.1614277478497; 
 Thu, 25 Feb 2021 10:24:38 -0800 (PST)
MIME-Version: 1.0
References: <20210219131349.3993192-1-kraxel@redhat.com>
 <20210219131349.3993192-3-kraxel@redhat.com>
In-Reply-To: <20210219131349.3993192-3-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 25 Feb 2021 22:24:26 +0400
Message-ID: <CAJ+F1CJHhoauTcsmHrrvUshiJ+6kU0zTprLkoyu1yUNOm+fpTQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] ui/vdagent: core infrastructure
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000acc05505bc2d431a"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x529.google.com
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

--000000000000acc05505bc2d431a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Feb 19, 2021 at 5:17 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> The vdagent protocol allows the guest agent (spice-vdagent) and the
> spice client exchange messages to implement features which require
> guest cooperation, for example clipboard support.
>
> This is a qemu implementation of the spice client side.  This allows
> the spice guest agent talk to qemu directly when not using the spice
> protocol.
>
> usage: qemu \
>   -chardev vdagent,id=3Dvdagent \
>   -device virtserialport,chardev=3Dvdagent,name=3Dcom.redhat.spice.0
>
> This patch adds just the protocol basics: initial handshake and
> capability negotiation.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  ui/vdagent.c    | 240 ++++++++++++++++++++++++++++++++++++++++++++++++
>  qapi/char.json  |  13 +++
>  ui/meson.build  |   1 +
>  ui/trace-events |   7 ++
>  4 files changed, 261 insertions(+)
>  create mode 100644 ui/vdagent.c
>
> diff --git a/ui/vdagent.c b/ui/vdagent.c
> new file mode 100644
> index 000000000000..9ef4ed3f4dd8
> --- /dev/null
> +++ b/ui/vdagent.c
> @@ -0,0 +1,240 @@
> +#include "qemu/osdep.h"
> +#include "include/qemu-common.h"
> +#include "chardev/char.h"
> +#include "trace.h"
> +
> +#include "qapi/qapi-types-char.h"
> +
> +#include "spice/vd_agent.h"
> +
> +#define MSGSIZE_MAX (sizeof(VDIChunkHeader) + \
> +                     sizeof(VDAgentMessage) + \
> +                     VD_AGENT_MAX_DATA_SIZE)
> +
> +struct VDAgentChardev {
> +    Chardev parent;
> +
> +    /* guest vdagent */
> +    uint32_t caps;
> +    uint8_t msgbuf[MSGSIZE_MAX];
> +    uint32_t msgsize;
> +};
> +typedef struct VDAgentChardev VDAgentChardev;
> +
> +#define TYPE_CHARDEV_VDAGENT "chardev-vdagent"
> +
> +DECLARE_INSTANCE_CHECKER(VDAgentChardev, VDAGENT_CHARDEV,
> +                         TYPE_CHARDEV_VDAGENT);
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
> +}
> +
> +static void vdagent_send_msg(VDAgentChardev *vd, VDAgentMessage *msg)
> +{
> +    uint8_t *msgbuf =3D (void *)msg;
> +    uint32_t msgsize =3D sizeof(VDAgentMessage) + msg->size;
> +    VDIChunkHeader chunk;
> +
> +    trace_vdagent_send(GET_NAME(msg_name, msg->type));
> +
> +    chunk.port =3D VDP_CLIENT_PORT;
> +    chunk.size =3D msgsize;
> +    vdagent_send_buf(vd, &chunk, sizeof(chunk));
> +
> +    msg->protocol =3D VD_AGENT_PROTOCOL;
> +    vdagent_send_buf(vd, msgbuf, msgsize);
> +    g_free(msg);
> +}
> +
> +static void vdagent_send_caps(VDAgentChardev *vd)
> +{
> +    VDAgentMessage *msg =3D g_malloc0(sizeof(VDAgentMessage) +
> +                                    sizeof(VDAgentAnnounceCapabilities) =
+
> +                                    sizeof(uint32_t));
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
> +    *be_opened =3D true;
> +}
> +
> +static void vdagent_chr_recv_caps(VDAgentChardev *vd, VDAgentMessage *ms=
g)
> +{
> +    VDAgentAnnounceCapabilities *caps =3D (void *)msg->data;
>

It's missing some boundary checks for vd->msgsize (-
sizeof(VDIChunkHeader)), since vdagent_chr_recv() doesn't check for >=3D
sizeof(VDAgentAnnounceCapabilities) + sizeof(uint32).

In the following patches, there are similar concerns for other messages.

+    int i;
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
> +static uint32_t vdagent_chr_recv(VDAgentChardev *vd)
> +{
> +    VDIChunkHeader *chunk =3D (void *)vd->msgbuf;
> +    VDAgentMessage *msg =3D (void *)vd->msgbuf + sizeof(VDIChunkHeader);
> +
> +    if (sizeof(VDIChunkHeader) + chunk->size > vd->msgsize) {
> +        return 0;
> +    }
> +
> +    trace_vdagent_recv(GET_NAME(msg_name, msg->type));
> +
> +    switch (msg->type) {
> +    case VD_AGENT_ANNOUNCE_CAPABILITIES:
> +        vdagent_chr_recv_caps(vd, msg);
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    return sizeof(VDIChunkHeader) + chunk->size;
> +}
> +
> +static int vdagent_chr_write(Chardev *chr, const uint8_t *buf, int len)
> +{
> +    VDAgentChardev *vd =3D VDAGENT_CHARDEV(chr);
> +    uint32_t copy, move;
> +
> +    copy =3D MSGSIZE_MAX - vd->msgsize;
> +    if (copy > len) {
> +        copy =3D len;
> +    }
> +
> +    memcpy(vd->msgbuf + vd->msgsize, buf, copy);
> +    vd->msgsize +=3D copy;
> +
> +    while (vd->msgsize > sizeof(VDIChunkHeader)) {
> +        move =3D vdagent_chr_recv(vd);
> +        if (move =3D=3D 0) {
> +            break;
> +        }
> +
> +        memmove(vd->msgbuf, vd->msgbuf + move, vd->msgsize - move);
> +        vd->msgsize -=3D move;
> +    }
> +
> +    return copy;
> +}
> +
> +static void vdagent_chr_set_fe_open(struct Chardev *chr, int fe_open)
> +{
> +    VDAgentChardev *vd =3D VDAGENT_CHARDEV(chr);
> +
> +    if (!fe_open) {
> +        trace_vdagent_close();
> +        /* reset state */
> +        vd->msgsize =3D 0;
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
> +    .name =3D TYPE_CHARDEV_VDAGENT,
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
> index 58338ed62d43..62e161aea343 100644
> --- a/qapi/char.json
> +++ b/qapi/char.json
> @@ -390,6 +390,17 @@
>    'data': { '*size': 'int' },
>    'base': 'ChardevCommon' }
>
> +##
> +# @ChardevVDAgent:
> +#
> +# Configuration info for vdagent.
> +#
> +# Since: 6.0
> +##
> +{ 'struct': 'ChardevVDAgent',
> +  'data': { },
> +  'base': 'ChardevCommon' }
> +
>  ##
>  # @ChardevBackend:
>  #
> @@ -417,6 +428,8 @@
>                            'if': 'defined(CONFIG_SPICE)' },
>              'spiceport': { 'type': 'ChardevSpicePort',
>                             'if': 'defined(CONFIG_SPICE)' },
> +            'vdagent': { 'type': 'ChardevVDAgent',
> +                         'if': 'defined(CONFIG_SPICE)' },
>              'vc': 'ChardevVC',
>              'ringbuf': 'ChardevRingbuf',
>              # next one is just for compatibility
> diff --git a/ui/meson.build b/ui/meson.build
> index fbb9a512042a..08447ac15c5e 100644
> --- a/ui/meson.build
> +++ b/ui/meson.build
> @@ -14,6 +14,7 @@ softmmu_ss.add(files(
>    'qemu-pixman.c',
>  ))
>  softmmu_ss.add([spice_headers, files('spice-module.c')])
> +softmmu_ss.add(when: spice_headers, if_true: files('vdagent.c'))
>
>  softmmu_ss.add(when: 'CONFIG_LINUX', if_true: files('input-linux.c'))
>  softmmu_ss.add(when: cocoa, if_true: files('cocoa.m'))
> diff --git a/ui/trace-events b/ui/trace-events
> index 0ffcdb4408a6..1a5bd3861da5 100644
> --- a/ui/trace-events
> +++ b/ui/trace-events
> @@ -108,3 +108,10 @@ xkeymap_extension(const char *name) "extension '%s'"
>  xkeymap_vendor(const char *name) "vendor '%s'"
>  xkeymap_keycodes(const char *name) "keycodes '%s'"
>  xkeymap_keymap(const char *name) "keymap '%s'"
> +
> +# vdagent.c
> +vdagent_open(void) ""
> +vdagent_close(void) ""
> +vdagent_send(const char *name) "msg %s"
> +vdagent_recv(const char *name) "msg %s"
> +vdagent_peer_cap(const char *name) "cap %s"
> --
> 2.29.2
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000acc05505bc2d431a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Feb 19, 2021 at 5:17 PM Gerd Hoffmann=
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
=C2=A0 -chardev vdagent,id=3Dvdagent \<br>
=C2=A0 -device virtserialport,chardev=3Dvdagent,name=3Dcom.redhat.spice.0<b=
r>
<br>
This patch adds just the protocol basics: initial handshake and<br>
capability negotiation.<br>
<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br>
---<br>
=C2=A0ui/vdagent.c=C2=A0 =C2=A0 | 240 +++++++++++++++++++++++++++++++++++++=
+++++++++++<br>
=C2=A0qapi/char.json=C2=A0 |=C2=A0 13 +++<br>
=C2=A0ui/meson.build=C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0ui/trace-events |=C2=A0 =C2=A07 ++<br>
=C2=A04 files changed, 261 insertions(+)<br>
=C2=A0create mode 100644 ui/vdagent.c<br>
<br>
diff --git a/ui/vdagent.c b/ui/vdagent.c<br>
new file mode 100644<br>
index 000000000000..9ef4ed3f4dd8<br>
--- /dev/null<br>
+++ b/ui/vdagent.c<br>
@@ -0,0 +1,240 @@<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;include/qemu-common.h&quot;<br>
+#include &quot;chardev/char.h&quot;<br>
+#include &quot;trace.h&quot;<br>
+<br>
+#include &quot;qapi/qapi-types-char.h&quot;<br>
+<br>
+#include &quot;spice/vd_agent.h&quot;<br>
+<br>
+#define MSGSIZE_MAX (sizeof(VDIChunkHeader) + \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0sizeof(VDAgentMessage) + \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0VD_AGENT_MAX_DATA_SIZE)<br>
+<br>
+struct VDAgentChardev {<br>
+=C2=A0 =C2=A0 Chardev parent;<br>
+<br>
+=C2=A0 =C2=A0 /* guest vdagent */<br>
+=C2=A0 =C2=A0 uint32_t caps;<br>
+=C2=A0 =C2=A0 uint8_t msgbuf[MSGSIZE_MAX];<br>
+=C2=A0 =C2=A0 uint32_t msgsize;<br>
+};<br>
+typedef struct VDAgentChardev VDAgentChardev;<br>
+<br>
+#define TYPE_CHARDEV_VDAGENT &quot;chardev-vdagent&quot;<br>
+<br>
+DECLARE_INSTANCE_CHECKER(VDAgentChardev, VDAGENT_CHARDEV,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0TYPE_CHARDEV_VDAGENT);<br>
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
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void vdagent_send_msg(VDAgentChardev *vd, VDAgentMessage *msg)<br>
+{<br>
+=C2=A0 =C2=A0 uint8_t *msgbuf =3D (void *)msg;<br>
+=C2=A0 =C2=A0 uint32_t msgsize =3D sizeof(VDAgentMessage) + msg-&gt;size;<=
br>
+=C2=A0 =C2=A0 VDIChunkHeader chunk;<br>
+<br>
+=C2=A0 =C2=A0 trace_vdagent_send(GET_NAME(msg_name, msg-&gt;type));<br>
+<br>
+=C2=A0 =C2=A0 chunk.port =3D VDP_CLIENT_PORT;<br>
+=C2=A0 =C2=A0 chunk.size =3D msgsize;<br>
+=C2=A0 =C2=A0 vdagent_send_buf(vd, &amp;chunk, sizeof(chunk));<br>
+<br>
+=C2=A0 =C2=A0 msg-&gt;protocol =3D VD_AGENT_PROTOCOL;<br>
+=C2=A0 =C2=A0 vdagent_send_buf(vd, msgbuf, msgsize);<br>
+=C2=A0 =C2=A0 g_free(msg);<br>
+}<br>
+<br>
+static void vdagent_send_caps(VDAgentChardev *vd)<br>
+{<br>
+=C2=A0 =C2=A0 VDAgentMessage *msg =3D g_malloc0(sizeof(VDAgentMessage) +<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(VDAgentAnnounce=
Capabilities) +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(uint32_t));<br>
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
+=C2=A0 =C2=A0 *be_opened =3D true;<br>
+}<br>
+<br>
+static void vdagent_chr_recv_caps(VDAgentChardev *vd, VDAgentMessage *msg)=
<br>
+{<br>
+=C2=A0 =C2=A0 VDAgentAnnounceCapabilities *caps =3D (void *)msg-&gt;data;<=
br></blockquote><div><br></div><div>It&#39;s missing some boundary checks f=
or vd-&gt;msgsize (- sizeof(VDIChunkHeader)), since vdagent_chr_recv() does=
n&#39;t check for &gt;=3D sizeof(VDAgentAnnounceCapabilities) + sizeof(uint=
32). <br></div><div><br></div><div>In the following patches, there are simi=
lar concerns for other messages.<br></div><div> <br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 int i;<br>
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
+static uint32_t vdagent_chr_recv(VDAgentChardev *vd)<br>
+{<br>
+=C2=A0 =C2=A0 VDIChunkHeader *chunk =3D (void *)vd-&gt;msgbuf;<br>
+=C2=A0 =C2=A0 VDAgentMessage *msg =3D (void *)vd-&gt;msgbuf + sizeof(VDICh=
unkHeader);<br>
+<br>
+=C2=A0 =C2=A0 if (sizeof(VDIChunkHeader) + chunk-&gt;size &gt; vd-&gt;msgs=
ize) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 trace_vdagent_recv(GET_NAME(msg_name, msg-&gt;type));<br>
+<br>
+=C2=A0 =C2=A0 switch (msg-&gt;type) {<br>
+=C2=A0 =C2=A0 case VD_AGENT_ANNOUNCE_CAPABILITIES:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vdagent_chr_recv_caps(vd, msg);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return sizeof(VDIChunkHeader) + chunk-&gt;size;<br>
+}<br>
+<br>
+static int vdagent_chr_write(Chardev *chr, const uint8_t *buf, int len)<br=
>
+{<br>
+=C2=A0 =C2=A0 VDAgentChardev *vd =3D VDAGENT_CHARDEV(chr);<br>
+=C2=A0 =C2=A0 uint32_t copy, move;<br>
+<br>
+=C2=A0 =C2=A0 copy =3D MSGSIZE_MAX - vd-&gt;msgsize;<br>
+=C2=A0 =C2=A0 if (copy &gt; len) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 copy =3D len;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 memcpy(vd-&gt;msgbuf + vd-&gt;msgsize, buf, copy);<br>
+=C2=A0 =C2=A0 vd-&gt;msgsize +=3D copy;<br>
+<br>
+=C2=A0 =C2=A0 while (vd-&gt;msgsize &gt; sizeof(VDIChunkHeader)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 move =3D vdagent_chr_recv(vd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (move =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memmove(vd-&gt;msgbuf, vd-&gt;msgbuf + move, v=
d-&gt;msgsize - move);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vd-&gt;msgsize -=3D move;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return copy;<br>
+}<br>
+<br>
+static void vdagent_chr_set_fe_open(struct Chardev *chr, int fe_open)<br>
+{<br>
+=C2=A0 =C2=A0 VDAgentChardev *vd =3D VDAGENT_CHARDEV(chr);<br>
+<br>
+=C2=A0 =C2=A0 if (!fe_open) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_vdagent_close();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* reset state */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vd-&gt;msgsize =3D 0;<br>
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
+=C2=A0 =C2=A0 .name =3D TYPE_CHARDEV_VDAGENT,<br>
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
index 58338ed62d43..62e161aea343 100644<br>
--- a/qapi/char.json<br>
+++ b/qapi/char.json<br>
@@ -390,6 +390,17 @@<br>
=C2=A0 =C2=A0&#39;data&#39;: { &#39;*size&#39;: &#39;int&#39; },<br>
=C2=A0 =C2=A0&#39;base&#39;: &#39;ChardevCommon&#39; }<br>
<br>
+##<br>
+# @ChardevVDAgent:<br>
+#<br>
+# Configuration info for vdagent.<br>
+#<br>
+# Since: 6.0<br>
+##<br>
+{ &#39;struct&#39;: &#39;ChardevVDAgent&#39;,<br>
+=C2=A0 &#39;data&#39;: { },<br>
+=C2=A0 &#39;base&#39;: &#39;ChardevCommon&#39; }<br>
+<br>
=C2=A0##<br>
=C2=A0# @ChardevBackend:<br>
=C2=A0#<br>
@@ -417,6 +428,8 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&#39;if&#39;: &#39;defined(CONFIG_SPICE)&#39; },<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;spiceport&#39;: { &#39=
;type&#39;: &#39;ChardevSpicePort&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &#39;if&#39;: &#39;defined(CONFIG_SPICE)&#39; },<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;vdagent&#39;: { &#39;type&#=
39;: &#39;ChardevVDAgent&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;if&#39;: &#39;defined(CONFIG_SPICE)&#39; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;vc&#39;: &#39;ChardevV=
C&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;ringbuf&#39;: &#39;Cha=
rdevRingbuf&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# next one is just for comp=
atibility<br>
diff --git a/ui/meson.build b/ui/meson.build<br>
index fbb9a512042a..08447ac15c5e 100644<br>
--- a/ui/meson.build<br>
+++ b/ui/meson.build<br>
@@ -14,6 +14,7 @@ softmmu_ss.add(files(<br>
=C2=A0 =C2=A0&#39;qemu-pixman.c&#39;,<br>
=C2=A0))<br>
=C2=A0softmmu_ss.add([spice_headers, files(&#39;spice-module.c&#39;)])<br>
+softmmu_ss.add(when: spice_headers, if_true: files(&#39;vdagent.c&#39;))<b=
r>
<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_LINUX&#39;, if_true: files(&#39;inpu=
t-linux.c&#39;))<br>
=C2=A0softmmu_ss.add(when: cocoa, if_true: files(&#39;cocoa.m&#39;))<br>
diff --git a/ui/trace-events b/ui/trace-events<br>
index 0ffcdb4408a6..1a5bd3861da5 100644<br>
--- a/ui/trace-events<br>
+++ b/ui/trace-events<br>
@@ -108,3 +108,10 @@ xkeymap_extension(const char *name) &quot;extension &#=
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
+vdagent_recv(const char *name) &quot;msg %s&quot;<br>
+vdagent_peer_cap(const char *name) &quot;cap %s&quot;<br>
-- <br>
2.29.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000acc05505bc2d431a--

