Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE6836C135
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 10:52:36 +0200 (CEST)
Received: from localhost ([::1]:56814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbJSN-0000HT-Cc
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 04:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lbJR9-0008Jy-HK
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 04:51:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lbJR0-0006nY-Ac
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 04:51:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619513468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ysheOM7/QtLjQOcykboVaX3+U99aPRqJtAE+jqSZabE=;
 b=Tcme42Nr3rW5T1ecslf3d3UzHUCW8XRpznlD8FanS3f/5zWvzXOz1kFc90hizhDTF81LL9
 mCisArsQRKzAclwD2qwATT4Z1Xqu3jZsg1V0tPsJwRcsu+E2bDr6NsAdUPkCpwvqP3adz0
 IqJYF3CYoMZ5KFgZVleYuXXQULTFpjY=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-iwL_GZ60Pn6jscXg5pGvCw-1; Tue, 27 Apr 2021 04:51:06 -0400
X-MC-Unique: iwL_GZ60Pn6jscXg5pGvCw-1
Received: by mail-pj1-f69.google.com with SMTP id
 t16-20020a17090a0d10b029014e4569c8b6so8950801pja.4
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 01:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ysheOM7/QtLjQOcykboVaX3+U99aPRqJtAE+jqSZabE=;
 b=uDDOYKUmyUVDgfoqjJnSDSOqb2kZCK0cVAuHyfQfCWzKEE+g2KZv9UBnRcUKtPkTwt
 CU5a6aDwKhlATMiEqXcKDYEmSgvj1XtGR/8NuQEI6ELNOKUWHbGf0noFsHh7sq53mOY7
 a/QTVkoE8t2ttJBqNZepghUJSUeqAWvH1WfDjDDKb9t71/SKu9JgBY2tTDGfZgzVanlR
 K0qJOsSacTsMfxgodbcieYbOxhmrQvlLlYdF4xUp1lthU/CGr8/Bxwiwfsf8lT6dEiIm
 02E1nLUEBneRq+/UKbte30gxET6dROQqmMsBlFW72eokHq5QxOxFx7HcbSmDDf1IIQVR
 LsGw==
X-Gm-Message-State: AOAM533gWAhOtYBMJdjlH6DIcWKjxOWbhZsLMuIg4B4pLnwRIIIfIcqM
 IY/IcU/E7efHNgRhs4IfMTQsg21LhJ6ZqB+IYOjj59mQz7PK8CdlvDYONGuO4KQeb1kOcB/tkEL
 7n8H3CtE10DdpXeQu8FCOGfakIfcMA10=
X-Received: by 2002:a17:90a:8d82:: with SMTP id
 d2mr25729364pjo.200.1619513464900; 
 Tue, 27 Apr 2021 01:51:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTqgqAKuMbOT7QrWRta8WLFnVSDCpnSvg5ybOp6/LJFSC4cD/l+mx1h5XefhSXY08yT/0LYPsE//mAKmsHwQQ=
X-Received: by 2002:a17:90a:8d82:: with SMTP id
 d2mr25729341pjo.200.1619513464611; 
 Tue, 27 Apr 2021 01:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210423083351.2096734-1-kraxel@redhat.com>
 <20210423083351.2096734-5-kraxel@redhat.com>
In-Reply-To: <20210423083351.2096734-5-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 27 Apr 2021 12:50:53 +0400
Message-ID: <CAMxuvayYUPuqF9PmM7CevJ0MaH1Asp1bsjyU_4ho8tdeVzMZ0g@mail.gmail.com>
Subject: Re: [PATCH v4 4/9] ui/vdagent: core infrastructure
To: Gerd Hoffmann <kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000c4716f05c0f05c6f"
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

--000000000000c4716f05c0f05c6f
Content-Type: text/plain; charset="UTF-8"

Hi

On Fri, Apr 23, 2021 at 12:34 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> The vdagent protocol allows the guest agent (spice-vdagent) and the
> spice client exchange messages to implement features which require
> guest cooperation, for example clipboard support.
>
> This is a qemu implementation of the spice client side.  This allows
> the spice guest agent talk to qemu directly when not using the spice
> protocol.
>
> usage: qemu \
>   -chardev vdagent,id=vdagent \
>   -device virtserialport,chardev=vdagent,name=com.redhat.spice.0
>
> This patch adds just the protocol basics: initial handshake and
> capability negotiation.  The following patches will add actual
> functionality and also add fields to the initially empty
> ChardevVDAgent qapi struct.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>

(this kind of buffer manipulation below makes me feel uneasy, these days
where I spent most of my time with Rust..)

---
>  ui/vdagent.c    | 314 ++++++++++++++++++++++++++++++++++++++++++++++++
>  qapi/char.json  |  17 ++-
>  ui/meson.build  |   1 +
>  ui/trace-events |   8 ++
>  4 files changed, 339 insertions(+), 1 deletion(-)
>  create mode 100644 ui/vdagent.c
>
> diff --git a/ui/vdagent.c b/ui/vdagent.c
> new file mode 100644
> index 000000000000..98d1a2ee3415
> --- /dev/null
> +++ b/ui/vdagent.c
> @@ -0,0 +1,314 @@
> +#include "qemu/osdep.h"
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
> +#define TYPE_CHARDEV_VDAGENT "chardev-vdagent"
> +
> +DECLARE_INSTANCE_CHECKER(VDAgentChardev, VDAGENT_CHARDEV,
> +                         TYPE_CHARDEV_VDAGENT);
> +
> +/* ------------------------------------------------------------------ */
> +/* names, for debug logging                                           */
> +
> +static const char *cap_name[] = {
> +    [VD_AGENT_CAP_MOUSE_STATE]                    = "mouse-state",
> +    [VD_AGENT_CAP_MONITORS_CONFIG]                = "monitors-config",
> +    [VD_AGENT_CAP_REPLY]                          = "reply",
> +    [VD_AGENT_CAP_CLIPBOARD]                      = "clipboard",
> +    [VD_AGENT_CAP_DISPLAY_CONFIG]                 = "display-config",
> +    [VD_AGENT_CAP_CLIPBOARD_BY_DEMAND]            = "clipboard-by-demand",
> +    [VD_AGENT_CAP_CLIPBOARD_SELECTION]            = "clipboard-selection",
> +    [VD_AGENT_CAP_SPARSE_MONITORS_CONFIG]         =
> "sparse-monitors-config",
> +    [VD_AGENT_CAP_GUEST_LINEEND_LF]               = "guest-lineend-lf",
> +    [VD_AGENT_CAP_GUEST_LINEEND_CRLF]             = "guest-lineend-crlf",
> +    [VD_AGENT_CAP_MAX_CLIPBOARD]                  = "max-clipboard",
> +    [VD_AGENT_CAP_AUDIO_VOLUME_SYNC]              = "audio-volume-sync",
> +    [VD_AGENT_CAP_MONITORS_CONFIG_POSITION]       =
> "monitors-config-position",
> +    [VD_AGENT_CAP_FILE_XFER_DISABLED]             = "file-xfer-disabled",
> +    [VD_AGENT_CAP_FILE_XFER_DETAILED_ERRORS]      =
> "file-xfer-detailed-errors",
> +#if 0
> +    [VD_AGENT_CAP_GRAPHICS_DEVICE_INFO]           =
> "graphics-device-info",
> +    [VD_AGENT_CAP_CLIPBOARD_NO_RELEASE_ON_REGRAB] =
> "clipboard-no-release-on-regrab",
> +    [VD_AGENT_CAP_CLIPBOARD_GRAB_SERIAL]          =
> "clipboard-grab-serial",
> +#endif
> +};
> +
> +static const char *msg_name[] = {
> +    [VD_AGENT_MOUSE_STATE]           = "mouse-state",
> +    [VD_AGENT_MONITORS_CONFIG]       = "monitors-config",
> +    [VD_AGENT_REPLY]                 = "reply",
> +    [VD_AGENT_CLIPBOARD]             = "clipboard",
> +    [VD_AGENT_DISPLAY_CONFIG]        = "display-config",
> +    [VD_AGENT_ANNOUNCE_CAPABILITIES] = "announce-capabilities",
> +    [VD_AGENT_CLIPBOARD_GRAB]        = "clipboard-grab",
> +    [VD_AGENT_CLIPBOARD_REQUEST]     = "clipboard-request",
> +    [VD_AGENT_CLIPBOARD_RELEASE]     = "clipboard-release",
> +    [VD_AGENT_FILE_XFER_START]       = "file-xfer-start",
> +    [VD_AGENT_FILE_XFER_STATUS]      = "file-xfer-status",
> +    [VD_AGENT_FILE_XFER_DATA]        = "file-xfer-data",
> +    [VD_AGENT_CLIENT_DISCONNECTED]   = "client-disconnected",
> +    [VD_AGENT_MAX_CLIPBOARD]         = "max-clipboard",
> +    [VD_AGENT_AUDIO_VOLUME_SYNC]     = "audio-volume-sync",
> +#if 0
> +    [VD_AGENT_GRAPHICS_DEVICE_INFO]  = "graphics-device-info",
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
> +    uint8_t *msgbuf = ptr;
> +    uint32_t len, pos = 0;
> +
> +    while (pos < msgsize) {
> +        len = qemu_chr_be_can_write(CHARDEV(vd));
> +        if (len > msgsize - pos) {
> +            len = msgsize - pos;
> +        }
> +        qemu_chr_be_write(CHARDEV(vd), msgbuf + pos, len);
> +        pos += len;
> +    }
> +}
> +
> +static void vdagent_send_msg(VDAgentChardev *vd, VDAgentMessage *msg)
> +{
> +    uint8_t *msgbuf = (void *)msg;
> +    uint32_t msgsize = sizeof(VDAgentMessage) + msg->size;
> +    uint32_t msgoff = 0;
> +    VDIChunkHeader chunk;
> +
> +    trace_vdagent_send(GET_NAME(msg_name, msg->type));
> +
> +    msg->protocol = VD_AGENT_PROTOCOL;
> +
> +    while (msgoff < msgsize) {
> +        chunk.port = VDP_CLIENT_PORT;
> +        chunk.size = msgsize - msgoff;
> +        if (chunk.size > 1024) {
> +            chunk.size = 1024;
> +        }
> +        vdagent_send_buf(vd, &chunk, sizeof(chunk));
> +        vdagent_send_buf(vd, msgbuf + msgoff, chunk.size);
> +        msgoff += chunk.size;
> +    }
> +}
> +
> +static void vdagent_send_caps(VDAgentChardev *vd)
> +{
> +    g_autofree VDAgentMessage *msg = g_malloc0(sizeof(VDAgentMessage) +
> +
>  sizeof(VDAgentAnnounceCapabilities) +
> +                                               sizeof(uint32_t));
> +
> +    msg->type = VD_AGENT_ANNOUNCE_CAPABILITIES;
> +    msg->size = sizeof(VDAgentAnnounceCapabilities) + sizeof(uint32_t);
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
> +    *be_opened = true;
> +}
> +
> +static void vdagent_chr_recv_caps(VDAgentChardev *vd, VDAgentMessage *msg)
> +{
> +    VDAgentAnnounceCapabilities *caps = (void *)msg->data;
> +    int i;
> +
> +    if (msg->size < (sizeof(VDAgentAnnounceCapabilities) +
> +                     sizeof(uint32_t))) {
> +        return;
> +    }
> +
> +    for (i = 0; i < ARRAY_SIZE(cap_name); i++) {
> +        if (caps->caps[0] & (1 << i)) {
> +            trace_vdagent_peer_cap(GET_NAME(cap_name, i));
> +        }
> +    }
> +
> +    vd->caps = caps->caps[0];
> +    if (caps->request) {
> +        vdagent_send_caps(vd);
> +    }
> +}
> +
> +static void vdagent_chr_recv_msg(VDAgentChardev *vd, VDAgentMessage *msg)
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
> +    g_free(vd->xbuf);
>

I would use g_clear_pointer(&vd->xbuf, g_free), to avoid misleading
dangling pointers.

+    vd->xoff = 0;
> +    vd->xsize = 0;
> +    vd->xbuf = NULL;
>

ah ok..!

+}
> +
> +static void vdagent_chr_recv_chunk(VDAgentChardev *vd)
> +{
> +    VDAgentMessage *msg = (void *)vd->msgbuf;
> +
> +    if (!vd->xsize) {
> +        if (vd->msgsize < sizeof(*msg)) {
> +            fprintf(stderr, "%s: message too small: %d < %zd\n", __func__,
> +                    vd->msgsize, sizeof(*msg));
>

 docs/devel/style.rst discourage usage of fprintf, and recommends
error_report.

+            return;
> +        }
> +        if (vd->msgsize == msg->size + sizeof(*msg)) {
> +            vdagent_chr_recv_msg(vd, msg);
> +            return;
> +        }
> +    }
> +
> +    if (!vd->xsize) {
> +        vd->xsize = msg->size + sizeof(*msg);
> +        vd->xbuf = g_malloc0(vd->xsize);
> +    }
> +
> +    if (vd->xoff + vd->msgsize > vd->xsize) {
> +        fprintf(stderr, "%s: Oops: %d+%d > %d\n", __func__,
> +                vd->xoff, vd->msgsize, vd->xsize);
> +        vdagent_reset_xbuf(vd);
> +        return;
> +    }
> +
> +    memcpy(vd->xbuf + vd->xoff, vd->msgbuf, vd->msgsize);
> +    vd->xoff += vd->msgsize;
> +    if (vd->xoff < vd->xsize) {
> +        return;
> +    }
> +
> +    msg = (void *)vd->xbuf;
> +    vdagent_chr_recv_msg(vd, msg);
> +    vdagent_reset_xbuf(vd);
> +}
> +
> +static void vdagent_reset_bufs(VDAgentChardev *vd)
> +{
> +    memset(&vd->chunk, 0, sizeof(vd->chunk));
> +    vd->chunksize = 0;
> +    g_free(vd->msgbuf);
> +    vd->msgbuf = NULL;
> +    vd->msgsize = 0;
> +}
> +
> +static int vdagent_chr_write(Chardev *chr, const uint8_t *buf, int len)
> +{
> +    VDAgentChardev *vd = VDAGENT_CHARDEV(chr);
> +    uint32_t copy, ret = len;
> +
> +    while (len) {
> +        if (vd->chunksize < sizeof(vd->chunk)) {
> +            copy = sizeof(vd->chunk) - vd->chunksize;
> +            if (copy > len) {
> +                copy = len;
> +            }
> +            memcpy((void *)(&vd->chunk) + vd->chunksize, buf, copy);
> +            vd->chunksize += copy;
> +            buf += copy;
> +            len -= copy;
> +            if (vd->chunksize < sizeof(vd->chunk)) {
> +                break;
> +            }
> +
> +            assert(vd->msgbuf == NULL);
> +            vd->msgbuf = g_malloc0(vd->chunk.size);
> +        }
> +
> +        copy = vd->chunk.size - vd->msgsize;
> +        if (copy > len) {
> +            copy = len;
> +        }
> +        memcpy(vd->msgbuf + vd->msgsize, buf, copy);
> +        vd->msgsize += copy;
> +        buf += copy;
> +        len -= copy;
> +
> +        if (vd->msgsize == vd->chunk.size) {
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
> +    VDAgentChardev *vd = VDAGENT_CHARDEV(chr);
> +
> +    if (!fe_open) {
> +        trace_vdagent_close();
> +        /* reset state */
> +        vdagent_reset_bufs(vd);
> +        vd->caps = 0;
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
> +    ChardevClass *cc = CHARDEV_CLASS(oc);
> +
> +    cc->open             = vdagent_chr_open;
> +    cc->chr_write        = vdagent_chr_write;
> +    cc->chr_set_fe_open  = vdagent_chr_set_fe_open;
> +}
> +
> +static const TypeInfo vdagent_chr_type_info = {
> +    .name = TYPE_CHARDEV_VDAGENT,
> +    .parent = TYPE_CHARDEV,
> +    .instance_size = sizeof(VDAgentChardev),
> +    .class_init = vdagent_chr_class_init,
> +};
> +
> +static void register_types(void)
> +{
> +    type_register_static(&vdagent_chr_type_info);
> +}
> +
> +type_init(register_types);
> diff --git a/qapi/char.json b/qapi/char.json
> index 6413970fa73b..ca5a85f76b3e 100644
> --- a/qapi/char.json
> +++ b/qapi/char.json
> @@ -390,12 +390,25 @@
>    'data': { '*size': 'int' },
>    'base': 'ChardevCommon' }
>
> +##
> +# @ChardevVDAgent:
> +#
> +# Configuration info for vdagent.
> +#
> +# Since: 6.1
> +#
> +##
> +{ 'struct': 'ChardevVDAgent',
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
> +            'vdagent': { 'type': 'ChardevVDAgent',
> +                         'if': 'defined(CONFIG_SPICE_PROTOCOL)' },
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
> 2.30.2
>
>

--000000000000c4716f05c0f05c6f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 23, 2021 at 12:34 PM Ge=
rd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The v=
dagent protocol allows the guest agent (spice-vdagent) and the<br>
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
capability negotiation.=C2=A0 The following patches will add actual<br>
functionality and also add fields to the initially empty<br>
ChardevVDAgent qapi struct.<br>
<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br></blockquote><div><br></div><div>=
(this kind of buffer manipulation below makes me feel uneasy, these days wh=
ere I spent most of my time with Rust..)</div><div><br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0ui/vdagent.c=C2=A0 =C2=A0 | 314 +++++++++++++++++++++++++++++++++++++=
+++++++++++<br>
=C2=A0qapi/char.json=C2=A0 |=C2=A0 17 ++-<br>
=C2=A0ui/meson.build=C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0ui/trace-events |=C2=A0 =C2=A08 ++<br>
=C2=A04 files changed, 339 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 ui/vdagent.c<br>
<br>
diff --git a/ui/vdagent.c b/ui/vdagent.c<br>
new file mode 100644<br>
index 000000000000..98d1a2ee3415<br>
--- /dev/null<br>
+++ b/ui/vdagent.c<br>
@@ -0,0 +1,314 @@<br>
+#include &quot;qemu/osdep.h&quot;<br>
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
+=C2=A0 =C2=A0 g_free(vd-&gt;xbuf);<br></blockquote><div><br></div><div>I w=
ould use g_clear_pointer(&amp;vd-&gt;xbuf, g_free), to avoid misleading dan=
gling pointers.<br></div><div><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
+=C2=A0 =C2=A0 vd-&gt;xoff =3D 0;<br>
+=C2=A0 =C2=A0 vd-&gt;xsize =3D 0;<br>
+=C2=A0 =C2=A0 vd-&gt;xbuf =3D NULL;<br></blockquote><div><br></div><div>ah=
 ok..!<br></div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
+}<br>
+<br>
+static void vdagent_chr_recv_chunk(VDAgentChardev *vd)<br>
+{<br>
+=C2=A0 =C2=A0 VDAgentMessage *msg =3D (void *)vd-&gt;msgbuf;<br>
+<br>
+=C2=A0 =C2=A0 if (!vd-&gt;xsize) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vd-&gt;msgsize &lt; sizeof(*msg)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;%s: messag=
e too small: %d &lt; %zd\n&quot;, __func__,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vd-&=
gt;msgsize, sizeof(*msg));<br></blockquote><div><br></div><div>=C2=A0docs/d=
evel/style.rst discourage usage of fprintf, and recommends error_report.</d=
iv><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;%s: Oops: %d+%d &gt; %d\=
n&quot;, __func__,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vd-&gt;xoff, vd-&g=
t;msgsize, vd-&gt;xsize);<br>
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
+=C2=A0 =C2=A0 VDAgentChardev *vd =3D VDAGENT_CHARDEV(chr);<br>
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
+=C2=A0 =C2=A0 VDAgentChardev *vd =3D VDAGENT_CHARDEV(chr);<br>
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
index 6413970fa73b..ca5a85f76b3e 100644<br>
--- a/qapi/char.json<br>
+++ b/qapi/char.json<br>
@@ -390,12 +390,25 @@<br>
=C2=A0 =C2=A0&#39;data&#39;: { &#39;*size&#39;: &#39;int&#39; },<br>
=C2=A0 =C2=A0&#39;base&#39;: &#39;ChardevCommon&#39; }<br>
<br>
+##<br>
+# @ChardevVDAgent:<br>
+#<br>
+# Configuration info for vdagent.<br>
+#<br>
+# Since: 6.1<br>
+#<br>
+##<br>
+{ &#39;struct&#39;: &#39;ChardevVDAgent&#39;,<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;vdagent&#39;: { &#39;type&#=
39;: &#39;ChardevVDAgent&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;if&#39;: &#39;defined(CONFIG_SPICE_PROTOCOL)&#39; },<=
br>
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
2.30.2<br>
<br>
</blockquote></div></div>

--000000000000c4716f05c0f05c6f--


