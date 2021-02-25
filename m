Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0145325659
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 20:13:18 +0100 (CET)
Received: from localhost ([::1]:54102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFM4b-0008Hh-P6
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 14:13:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lFM1X-0007Rf-3O
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 14:10:11 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:41053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lFM1S-00061t-W2
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 14:10:06 -0500
Received: by mail-ej1-x630.google.com with SMTP id lr13so10651680ejb.8
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 11:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CJ0vP2DiS/l/8vEQiTlGj12q0ZSp+XsY8vlGatsYj4c=;
 b=UNZFxY3NgDgSxqikbdyWaKoKhsWCprmz78w1kWnb3BRoGIBliAeeyBTPX4erjylKIs
 qs4WZPUK9SsPctd3ZT9m9f44wRCSaYR4pNug99OtXrIqfAJTZKw6S2u/HLhgbivEkJZx
 Fa/9GguRYnGeoa+nd4Py0uX8daUaPuMw9JsEatC78j1JsDe7uO3lbt5E2OL9X6F6lpcV
 O86NFUMwKiS9lCeE3ODZIE7f15lJJUESiRzW1AYz80qYeKzIIOGQh5UUaSmSZ0LS0c2h
 0DPa5y7VlVeoiExVA8PUkjxCHGKIv/d/VDlBxpLgxUqIENNOYC9zbqIKDdt6ow3Ta5dl
 Dh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CJ0vP2DiS/l/8vEQiTlGj12q0ZSp+XsY8vlGatsYj4c=;
 b=fNsV56Gjdv46139xcfw/v9ym6KYt2XkzUUyGMK7f+3yfZfil1OIeEoF/1llj4Ilpf1
 nSRdjJ0A5xGkqE9y5V6twp238xQn22zdSkNdIkXcEAbi+fVNLs1wbp+k91xon5H8BiMe
 SjVDqwMfg4csj9zY2CZ2wjzYL3ZZLNZMqf4Nqq+Da62T4IjM/aVqZL0cNShGyDwnrT+O
 K00wfufxkRF6pCj+ohxFyLReG5i7o7fiXNSPuvnnNCFFwGi/MgVNCrT8Ykfzvqt0D8wJ
 RcYuOCbjHu50QPCI9XU/E1ixkQttLCoHFP7r7RRQVn1+l9W9d//rz0CGXAocisZL56FO
 kwWQ==
X-Gm-Message-State: AOAM532A7nLnhC2J/S86R0Cb3Lrhpd7t5ZFC9QnZvIUqrTFLONgZc0FK
 IFKH/qXaUIcnsCKzdXy6PmbWBW6hJ0Gut3UlD9A=
X-Google-Smtp-Source: ABdhPJylRZsfE8aj62OoMcvaTLmgyePi1ZFUvFG/6tzyfdMY3fuIS25sWRX3cNgUbEpxnks5r9KJX8DyGVVYJWNhjCU=
X-Received: by 2002:a17:907:7667:: with SMTP id
 kk7mr4220426ejc.92.1614280201624; 
 Thu, 25 Feb 2021 11:10:01 -0800 (PST)
MIME-Version: 1.0
References: <20210219131349.3993192-1-kraxel@redhat.com>
 <20210219131349.3993192-6-kraxel@redhat.com>
In-Reply-To: <20210219131349.3993192-6-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 25 Feb 2021 23:09:49 +0400
Message-ID: <CAJ+F1CLLgnKcr-jRG=2sVnNGjsGjovm+e0bbeTTwHU=CRg1w+Q@mail.gmail.com>
Subject: Re: [PATCH 5/7] ui/vnc: clipboard support
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000fc5f1d05bc2de59d"
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

--000000000000fc5f1d05bc2de59d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 19, 2021 at 5:25 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> This patch adds support for cut+paste to the qemu vnc server, which
> allows the vnc client exchange clipbaord data with qemu and other peers
>

clipboard

like the qemu vdagent implementation.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  ui/vnc.h           |  24 ++++
>  ui/vnc-clipboard.c | 326 +++++++++++++++++++++++++++++++++++++++++++++
>  ui/vnc.c           |  20 ++-
>  ui/meson.build     |   1 +
>  4 files changed, 365 insertions(+), 6 deletions(-)
>  create mode 100644 ui/vnc-clipboard.c
>
> diff --git a/ui/vnc.h b/ui/vnc.h
> index 116463d5f099..f611223859ae 100644
> --- a/ui/vnc.h
> +++ b/ui/vnc.h
> @@ -29,6 +29,7 @@
>
>  #include "qemu/queue.h"
>  #include "qemu/thread.h"
> +#include "ui/clipboard.h"
>  #include "ui/console.h"
>  #include "audio/audio.h"
>  #include "qemu/bitmap.h"
> @@ -347,6 +348,10 @@ struct VncState
>
>      Notifier mouse_mode_notifier;
>
> +    QemuClipboardPeer cbpeer;
> +    QemuClipboardInfo *cbinfo;
> +    uint32_t cbpending;
> +
>      QTAILQ_ENTRY(VncState) next;
>  };
>
> @@ -416,6 +421,7 @@ enum {
>  #define VNC_ENCODING_XVP                  0XFFFFFECB /* -309 */
>  #define VNC_ENCODING_ALPHA_CURSOR         0XFFFFFEC6 /* -314 */
>  #define VNC_ENCODING_WMVi                 0x574D5669
> +#define VNC_ENCODING_CLIPBOARD_EXT        0xc0a1e5ce
>
>
>  /***********************************************************************=
******
>   *
> @@ -457,6 +463,7 @@ enum VncFeatures {
>      VNC_FEATURE_ZYWRLE,
>      VNC_FEATURE_LED_STATE,
>      VNC_FEATURE_XVP,
> +    VNC_FEATURE_CLIPBOARD_EXT,
>  };
>
>  #define VNC_FEATURE_RESIZE_MASK              (1 << VNC_FEATURE_RESIZE)
> @@ -473,6 +480,7 @@ enum VncFeatures {
>  #define VNC_FEATURE_ZYWRLE_MASK              (1 << VNC_FEATURE_ZYWRLE)
>  #define VNC_FEATURE_LED_STATE_MASK           (1 << VNC_FEATURE_LED_STATE=
)
>  #define VNC_FEATURE_XVP_MASK                 (1 << VNC_FEATURE_XVP)
> +#define VNC_FEATURE_CLIPBOARD_EXT_MASK       (1 <<
> VNC_FEATURE_CLIPBOARD_EXT)
>
>
>  /* Client -> Server message IDs */
> @@ -534,6 +542,17 @@ enum VncFeatures {
>  #define VNC_XVP_ACTION_REBOOT 3
>  #define VNC_XVP_ACTION_RESET 4
>
> +/* extended clipboard flags  */
> +#define VNC_CLIPBOARD_TEXT     (1 << 0)
> +#define VNC_CLIPBOARD_RTF      (1 << 1)
> +#define VNC_CLIPBOARD_HTML     (1 << 2)
> +#define VNC_CLIPBOARD_DIB      (1 << 3)
> +#define VNC_CLIPBOARD_FILES    (1 << 4)
> +#define VNC_CLIPBOARD_CAPS     (1 << 24)
> +#define VNC_CLIPBOARD_REQUEST  (1 << 25)
> +#define VNC_CLIPBOARD_PEEK     (1 << 26)
> +#define VNC_CLIPBOARD_NOTIFY   (1 << 27)
> +#define VNC_CLIPBOARD_PROVIDE  (1 << 28)
>
>
>  /***********************************************************************=
******
>   *
> @@ -617,4 +636,9 @@ int vnc_zrle_send_framebuffer_update(VncState *vs, in=
t
> x, int y, int w, int h);
>  int vnc_zywrle_send_framebuffer_update(VncState *vs, int x, int y, int w=
,
> int h);
>  void vnc_zrle_clear(VncState *vs);
>
> +/* vnc-clipboard.c */
> +void vnc_server_cut_text_caps(VncState *vs);
> +void vnc_client_cut_text(VncState *vs, size_t len, uint8_t *text);
> +void vnc_client_cut_text_ext(VncState *vs, int32_t len, uint32_t flags,
> uint8_t *data);
> +
>  #endif /* QEMU_VNC_H */
> diff --git a/ui/vnc-clipboard.c b/ui/vnc-clipboard.c
> new file mode 100644
> index 000000000000..e729120ba360
> --- /dev/null
> +++ b/ui/vnc-clipboard.c
> @@ -0,0 +1,326 @@
> +/*
> + * QEMU VNC display driver -- clipboard support
> + *
> + * Copyright (C) 2021 Gerd Hoffmann <kraxel@redhat.com>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining
> a copy
> + * of this software and associated documentation files (the "Software"),
> to deal
> + * in the Software without restriction, including without limitation the
> rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
> sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S
> IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +#include "vnc.h"
> +#include "vnc-jobs.h"
> +
> +static uint8_t *inflate_buffer(uint8_t *in, uint32_t in_len, uint32_t
> *size)
> +{
> +    z_stream stream =3D {
> +        .next_in  =3D in,
> +        .avail_in =3D in_len,
> +        .zalloc   =3D Z_NULL,
> +        .zfree    =3D Z_NULL,
> +    };
> +    uint32_t out_len =3D 8;
> +    uint8_t *out =3D g_malloc(out_len);
>

g_autofree ?

+    int ret;
> +
> +    stream.next_out =3D out + stream.total_out;
> +    stream.avail_out =3D out_len - stream.total_out;
> +
> +    ret =3D inflateInit(&stream);
> +    if (ret !=3D Z_OK) {
> +        goto err;
> +    }
> +
> +    while (stream.avail_in) {
> +        ret =3D inflate(&stream, Z_FINISH);
> +        switch (ret) {
> +        case Z_OK:
> +        case Z_STREAM_END:
> +            break;
> +        case Z_BUF_ERROR:
> +            out_len <<=3D 1;
> +            if (out_len > (1 << 20)) {
>

1Mb isn't that much, is it? Well, since it handles only text for now it's
probably enough. Would it make sense to make this a #define for clarity ?

+                goto err_end;
> +            }
> +            out =3D g_realloc(out, out_len);
> +            stream.next_out =3D out + stream.total_out;
> +            stream.avail_out =3D out_len - stream.total_out;
> +            break;
> +        default:
> +            goto err_end;
> +        }
> +    }
> +
> +    *size =3D stream.total_out;
> +    inflateEnd(&stream);
> +
> +    return out;
> +
> +err_end:
> +    inflateEnd(&stream);
> +err:
> +    g_free(out);
> +    return NULL;
> +}
> +
> +static uint8_t *deflate_buffer(uint8_t *in, uint32_t in_len, uint32_t
> *size)
> +{
> +    z_stream stream =3D {
> +        .next_in  =3D in,
> +        .avail_in =3D in_len,
> +        .zalloc   =3D Z_NULL,
> +        .zfree    =3D Z_NULL,
> +    };
> +    uint32_t out_len =3D 8;
> +    uint8_t *out =3D g_malloc(out_len);
>

same as inflate

+    int ret;
> +
> +    stream.next_out =3D out + stream.total_out;
> +    stream.avail_out =3D out_len - stream.total_out;
> +
> +    ret =3D deflateInit(&stream, Z_DEFAULT_COMPRESSION);
> +    if (ret !=3D Z_OK) {
> +        goto err;
> +    }
> +
> +    while (ret !=3D Z_STREAM_END) {
> +        ret =3D deflate(&stream, Z_FINISH);
> +        switch (ret) {
> +        case Z_OK:
> +        case Z_STREAM_END:
> +            break;
> +        case Z_BUF_ERROR:
> +            out_len <<=3D 1;
> +            if (out_len > (1 << 20)) {
> +                goto err_end;
> +            }
> +            out =3D g_realloc(out, out_len);
> +            stream.next_out =3D out + stream.total_out;
> +            stream.avail_out =3D out_len - stream.total_out;
> +            break;
> +        default:
> +            goto err_end;
> +        }
> +    }
> +
> +    *size =3D stream.total_out;
> +    deflateEnd(&stream);
> +
> +    return out;
> +
> +err_end:
> +    deflateEnd(&stream);
> +err:
> +    g_free(out);
> +    return NULL;
> +}
> +
> +static void vnc_clipboard_send(VncState *vs, uint32_t count, uint32_t
> *dwords)
> +{
> +    int i;
> +
> +    vnc_lock_output(vs);
> +    vnc_write_u8(vs, VNC_MSG_SERVER_CUT_TEXT);
> +    vnc_write_u8(vs, 0);
> +    vnc_write_u8(vs, 0);
> +    vnc_write_u8(vs, 0);
> +    vnc_write_s32(vs, -(count * sizeof(uint32_t)));  /* -(message length=
)
> */
> +    for (i =3D 0; i < count; i++) {
> +        vnc_write_u32(vs, dwords[i]);
> +    }
> +    vnc_unlock_output(vs);
> +    vnc_flush(vs);
> +}
> +
> +static void vnc_clipboard_provide(VncState *vs,
> +                                  QemuClipboardInfo *info,
> +                                  QemuClipboardType type)
> +{
> +    uint32_t flags =3D 0;
> +    uint8_t *buf;
> +    void *zbuf;
> +    uint32_t zsize;
> +
> +    switch (type) {
> +    case QEMU_CLIPBOARD_TYPE_TEXT:
> +        flags |=3D VNC_CLIPBOARD_TEXT;
> +        break;
> +    default:
> +        return;
> +    }
> +    flags |=3D VNC_CLIPBOARD_PROVIDE;
> +
> +    buf =3D g_malloc(info->types[type].size + 4);
> +    buf[0] =3D (info->types[type].size >> 24) & 0xff;
> +    buf[1] =3D (info->types[type].size >> 16) & 0xff;
> +    buf[2] =3D (info->types[type].size >>  8) & 0xff;
> +    buf[3] =3D (info->types[type].size >>  0) & 0xff;
> +    memcpy(buf + 4, info->types[type].data, info->types[type].size);
> +    zbuf =3D deflate_buffer(buf, info->types[type].size + 4, &zsize);
> +    g_free(buf);
> +
> +    if (!zbuf) {
> +        return;
> +    }
> +
> +    vnc_lock_output(vs);
> +    vnc_write_u8(vs, VNC_MSG_SERVER_CUT_TEXT);
> +    vnc_write_u8(vs, 0);
> +    vnc_write_u8(vs, 0);
> +    vnc_write_u8(vs, 0);
> +    vnc_write_s32(vs, -(sizeof(uint32_t) + zsize));  /* -(message length=
)
> */
> +    vnc_write_u32(vs, flags);
> +    vnc_write(vs, zbuf, zsize);
> +    vnc_unlock_output(vs);
> +    vnc_flush(vs);
>

zbuf is leaked, g_autofree is your friend

+}
> +
> +static void vnc_clipboard_notify(Notifier *notifier, void *data)
> +{
> +    VncState *vs =3D container_of(notifier, VncState, cbpeer.update);
> +    QemuClipboardInfo *info =3D data;
> +    QemuClipboardType type;
> +    bool self_update =3D info->owner =3D=3D &vs->cbpeer;
> +    uint32_t flags =3D 0;
> +
> +    if (info !=3D vs->cbinfo) {
> +        qemu_clipboard_info_put(vs->cbinfo);
> +        vs->cbinfo =3D qemu_clipboard_info_get(info);
> +        vs->cbpending =3D 0;
> +        if (!self_update) {
> +            if (info->types[QEMU_CLIPBOARD_TYPE_TEXT].available) {
> +                flags |=3D VNC_CLIPBOARD_TEXT;
> +            }
> +            flags |=3D VNC_CLIPBOARD_NOTIFY;
> +            vnc_clipboard_send(vs, 1, &flags);
> +        }
> +        return;
> +    }
> +
> +    if (self_update) {
> +        return;
> +    }
> +
> +    for (type =3D 0; type < QEMU_CLIPBOARD_TYPE__COUNT; type++) {
> +        if (vs->cbpending & (1 << type)) {
> +            vs->cbpending &=3D ~(1 << type);
> +            vnc_clipboard_provide(vs, info, type);
> +        }
> +    }
> +}
> +
> +static void vnc_clipboard_request(QemuClipboardInfo *info,
> +                                  QemuClipboardType type)
> +{
> +    VncState *vs =3D container_of(info->owner, VncState, cbpeer);
> +    uint32_t flags =3D 0;
> +
> +    if (type =3D=3D QEMU_CLIPBOARD_TYPE_TEXT) {
> +        flags |=3D VNC_CLIPBOARD_TEXT;
> +    }
> +    if (!flags) {
>

It might be worth noticing an empty clipboard in this case.

+        return;
> +    }
> +    flags |=3D VNC_CLIPBOARD_REQUEST;
> +
> +    vnc_clipboard_send(vs, 1, &flags);
> +}
> +
> +void vnc_client_cut_text_ext(VncState *vs, int32_t len, uint32_t flags,
> uint8_t *data)
> +{
> +    if (flags & VNC_CLIPBOARD_CAPS) {
> +        /* need store caps somewhere ? */
> +        return;
> +    }
> +
> +    if (flags & VNC_CLIPBOARD_NOTIFY) {
> +        QemuClipboardInfo *info =3D
> +            qemu_clipboard_info_new(&vs->cbpeer,
> QEMU_CLIPBOARD_SELECTION_CLIPBOARD);
> +        if (flags & VNC_CLIPBOARD_TEXT) {
> +            info->types[QEMU_CLIPBOARD_TYPE_TEXT].available =3D true;
> +        }
> +        qemu_clipboard_update(info);
> +        qemu_clipboard_info_put(info);
> +        return;
> +    }
> +
> +    if (flags & VNC_CLIPBOARD_PROVIDE &&
> +        vs->cbinfo &&
> +        vs->cbinfo->owner =3D=3D &vs->cbpeer) {
> +        uint32_t size =3D 0;
> +        uint8_t *buf =3D inflate_buffer(data, len - 4, &size);
> +        if ((flags & VNC_CLIPBOARD_TEXT) &&
> +            buf && size >=3D 4) {
> +            uint32_t tsize =3D read_u32(buf, 0);
> +            uint8_t *tbuf =3D buf + 4;
> +            if (tsize < size) {
> +                qemu_clipboard_set_data(&vs->cbpeer, vs->cbinfo,
> +                                        QEMU_CLIPBOARD_TYPE_TEXT,
> +                                        tsize, tbuf, true);
> +            }
> +        }
> +        g_free(buf);
> +    }
> +
> +    if (flags & VNC_CLIPBOARD_REQUEST &&
> +        vs->cbinfo &&
> +        vs->cbinfo->owner !=3D &vs->cbpeer) {
> +        if ((flags & VNC_CLIPBOARD_TEXT) &&
> +            vs->cbinfo->types[QEMU_CLIPBOARD_TYPE_TEXT].available) {
> +            if (vs->cbinfo->types[QEMU_CLIPBOARD_TYPE_TEXT].data) {
> +                vnc_clipboard_provide(vs, vs->cbinfo,
> QEMU_CLIPBOARD_TYPE_TEXT);
> +            } else {
> +                vs->cbpending |=3D (1 << QEMU_CLIPBOARD_TYPE_TEXT);
> +                qemu_clipboard_request(vs->cbinfo,
> QEMU_CLIPBOARD_TYPE_TEXT);
> +            }
> +        }
> +    }
> +}
> +
> +void vnc_client_cut_text(VncState *vs, size_t len, uint8_t *text)
> +{
> +    QemuClipboardInfo *info =3D
> +        qemu_clipboard_info_new(&vs->cbpeer,
> QEMU_CLIPBOARD_SELECTION_CLIPBOARD);
> +
> +    qemu_clipboard_set_data(&vs->cbpeer, info, QEMU_CLIPBOARD_TYPE_TEXT,
> +                            len, text, true);
> +    qemu_clipboard_info_put(info);
> +}
> +
> +void vnc_server_cut_text_caps(VncState *vs)
> +{
> +    uint32_t caps[2];
> +
> +    if (!vnc_has_feature(vs, VNC_FEATURE_CLIPBOARD_EXT)) {
> +        return;
> +    }
> +
> +    caps[0] =3D (VNC_CLIPBOARD_PROVIDE |
> +               VNC_CLIPBOARD_NOTIFY  |
> +               VNC_CLIPBOARD_REQUEST |
> +               VNC_CLIPBOARD_CAPS    |
> +               VNC_CLIPBOARD_TEXT);
> +    caps[1] =3D 0;
> +    vnc_clipboard_send(vs, 2, caps);
> +
> +    vs->cbpeer.name =3D "vnc";
> +    vs->cbpeer.update.notify =3D vnc_clipboard_notify;
> +    vs->cbpeer.request =3D vnc_clipboard_request;
> +    qemu_clipboard_peer_register(&vs->cbpeer);
> +}
> diff --git a/ui/vnc.c b/ui/vnc.c
> index 16bb3be770b2..91ec51c7c67d 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -25,6 +25,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu-common.h"
>  #include "vnc.h"
>  #include "vnc-jobs.h"
>  #include "trace.h"
> @@ -1309,6 +1310,9 @@ void vnc_disconnect_finish(VncState *vs)
>          /* last client gone */
>          vnc_update_server_surface(vs->vd);
>      }
> +    if (vs->cbpeer.update.notify) {
> +        qemu_clipboard_peer_unregister(&vs->cbpeer);
> +    }
>
>      vnc_unlock_output(vs);
>
> @@ -1734,10 +1738,6 @@ uint32_t read_u32(uint8_t *data, size_t offset)
>              (data[offset + 2] << 8) | data[offset + 3]);
>  }
>
> -static void client_cut_text(VncState *vs, size_t len, uint8_t *text)
> -{
> -}
> -
>  static void check_pointer_type_change(Notifier *notifier, void *data)
>  {
>      VncState *vs =3D container_of(notifier, VncState, mouse_mode_notifie=
r);
> @@ -2179,6 +2179,10 @@ static void set_encodings(VncState *vs, int32_t
> *encodings, size_t n_encodings)
>                  send_xvp_message(vs, VNC_XVP_CODE_INIT);
>              }
>              break;
> +        case VNC_ENCODING_CLIPBOARD_EXT:
> +            vs->features |=3D VNC_FEATURE_CLIPBOARD_EXT_MASK;
> +            vnc_server_cut_text_caps(vs);
> +            break;
>          case VNC_ENCODING_COMPRESSLEVEL0 ... VNC_ENCODING_COMPRESSLEVEL0
> + 9:
>              vs->tight->compression =3D (enc & 0x0F);
>              break;
> @@ -2395,7 +2399,7 @@ static int protocol_client_msg(VncState *vs, uint8_=
t
> *data, size_t len)
>              return 8;
>          }
>          if (len =3D=3D 8) {
> -            uint32_t dlen =3D read_u32(data, 4);
> +            uint32_t dlen =3D abs(read_s32(data, 4));
>              if (dlen > (1 << 20)) {
>                  error_report("vnc: client_cut_text msg payload has %u
> bytes"
>                               " which exceeds our limit of 1MB.", dlen);
> @@ -2407,7 +2411,11 @@ static int protocol_client_msg(VncState *vs,
> uint8_t *data, size_t len)
>              }
>          }
>
> -        client_cut_text(vs, read_u32(data, 4), data + 8);
> +        if (read_s32(data, 4) < 0) {
> +            vnc_client_cut_text_ext(vs, abs(read_s32(data, 4)),
> read_u32(data, 8), data + 12);
> +            break;
> +        }
> +        vnc_client_cut_text(vs, read_u32(data, 4), data + 8);
>          break;
>      case VNC_MSG_CLIENT_XVP:
>          if (!(vs->features & VNC_FEATURE_XVP)) {
> diff --git a/ui/meson.build b/ui/meson.build
> index 08447ac15c5e..a98f89b48978 100644
> --- a/ui/meson.build
> +++ b/ui/meson.build
> @@ -30,6 +30,7 @@ vnc_ss.add(files(
>    'vnc-auth-vencrypt.c',
>    'vnc-ws.c',
>    'vnc-jobs.c',
> +  'vnc-clipboard.c',
>  ))
>  vnc_ss.add(zlib, png, jpeg, gnutls)
>  vnc_ss.add(when: sasl, if_true: files('vnc-auth-sasl.c'))
> --
> 2.29.2
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000fc5f1d05bc2de59d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 19, 2021 at 5:25 PM Gerd =
Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This pat=
ch adds support for cut+paste to the qemu vnc server, which<br>
allows the vnc client exchange clipbaord data with qemu and other peers<br>=
</blockquote><div><br></div><div>clipboard</div><div> <br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
like the qemu vdagent implementation.<br>
<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br>
---<br>
=C2=A0ui/vnc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 24 ++++<br>
=C2=A0ui/vnc-clipboard.c | 326 ++++++++++++++++++++++++++++++++++++++++++++=
+<br>
=C2=A0ui/vnc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 20 ++-<br>
=C2=A0ui/meson.build=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A04 files changed, 365 insertions(+), 6 deletions(-)<br>
=C2=A0create mode 100644 ui/vnc-clipboard.c<br>
<br>
diff --git a/ui/vnc.h b/ui/vnc.h<br>
index 116463d5f099..f611223859ae 100644<br>
--- a/ui/vnc.h<br>
+++ b/ui/vnc.h<br>
@@ -29,6 +29,7 @@<br>
<br>
=C2=A0#include &quot;qemu/queue.h&quot;<br>
=C2=A0#include &quot;qemu/thread.h&quot;<br>
+#include &quot;ui/clipboard.h&quot;<br>
=C2=A0#include &quot;ui/console.h&quot;<br>
=C2=A0#include &quot;audio/audio.h&quot;<br>
=C2=A0#include &quot;qemu/bitmap.h&quot;<br>
@@ -347,6 +348,10 @@ struct VncState<br>
<br>
=C2=A0 =C2=A0 =C2=A0Notifier mouse_mode_notifier;<br>
<br>
+=C2=A0 =C2=A0 QemuClipboardPeer cbpeer;<br>
+=C2=A0 =C2=A0 QemuClipboardInfo *cbinfo;<br>
+=C2=A0 =C2=A0 uint32_t cbpending;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0QTAILQ_ENTRY(VncState) next;<br>
=C2=A0};<br>
<br>
@@ -416,6 +421,7 @@ enum {<br>
=C2=A0#define VNC_ENCODING_XVP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0XFFFFFECB /* -309 */<br>
=C2=A0#define VNC_ENCODING_ALPHA_CURSOR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00X=
FFFFFEC6 /* -314 */<br>
=C2=A0#define VNC_ENCODING_WMVi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x574D5669<br>
+#define VNC_ENCODING_CLIPBOARD_EXT=C2=A0 =C2=A0 =C2=A0 =C2=A0 0xc0a1e5ce<b=
r>
<br>
=C2=A0/********************************************************************=
*********<br>
=C2=A0 *<br>
@@ -457,6 +463,7 @@ enum VncFeatures {<br>
=C2=A0 =C2=A0 =C2=A0VNC_FEATURE_ZYWRLE,<br>
=C2=A0 =C2=A0 =C2=A0VNC_FEATURE_LED_STATE,<br>
=C2=A0 =C2=A0 =C2=A0VNC_FEATURE_XVP,<br>
+=C2=A0 =C2=A0 VNC_FEATURE_CLIPBOARD_EXT,<br>
=C2=A0};<br>
<br>
=C2=A0#define VNC_FEATURE_RESIZE_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (1 &lt;&lt; VNC_FEATURE_RESIZE)<br>
@@ -473,6 +480,7 @@ enum VncFeatures {<br>
=C2=A0#define VNC_FEATURE_ZYWRLE_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (1 &lt;&lt; VNC_FEATURE_ZYWRLE)<br>
=C2=A0#define VNC_FEATURE_LED_STATE_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(1 &lt;&lt; VNC_FEATURE_LED_STATE)<br>
=C2=A0#define VNC_FEATURE_XVP_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; VNC_FEATURE_XVP)<br>
+#define VNC_FEATURE_CLIPBOARD_EXT_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&l=
t;=C2=A0 VNC_FEATURE_CLIPBOARD_EXT)<br>
<br>
<br>
=C2=A0/* Client -&gt; Server message IDs */<br>
@@ -534,6 +542,17 @@ enum VncFeatures {<br>
=C2=A0#define VNC_XVP_ACTION_REBOOT 3<br>
=C2=A0#define VNC_XVP_ACTION_RESET 4<br>
<br>
+/* extended clipboard flags=C2=A0 */<br>
+#define VNC_CLIPBOARD_TEXT=C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 0)<br>
+#define VNC_CLIPBOARD_RTF=C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 1)<br>
+#define VNC_CLIPBOARD_HTML=C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 2)<br>
+#define VNC_CLIPBOARD_DIB=C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 3)<br>
+#define VNC_CLIPBOARD_FILES=C2=A0 =C2=A0 (1 &lt;&lt; 4)<br>
+#define VNC_CLIPBOARD_CAPS=C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 24)<br>
+#define VNC_CLIPBOARD_REQUEST=C2=A0 (1 &lt;&lt; 25)<br>
+#define VNC_CLIPBOARD_PEEK=C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 26)<br>
+#define VNC_CLIPBOARD_NOTIFY=C2=A0 =C2=A0(1 &lt;&lt; 27)<br>
+#define VNC_CLIPBOARD_PROVIDE=C2=A0 (1 &lt;&lt; 28)<br>
<br>
=C2=A0/********************************************************************=
*********<br>
=C2=A0 *<br>
@@ -617,4 +636,9 @@ int vnc_zrle_send_framebuffer_update(VncState *vs, int =
x, int y, int w, int h);<br>
=C2=A0int vnc_zywrle_send_framebuffer_update(VncState *vs, int x, int y, in=
t w, int h);<br>
=C2=A0void vnc_zrle_clear(VncState *vs);<br>
<br>
+/* vnc-clipboard.c */<br>
+void vnc_server_cut_text_caps(VncState *vs);<br>
+void vnc_client_cut_text(VncState *vs, size_t len, uint8_t *text);<br>
+void vnc_client_cut_text_ext(VncState *vs, int32_t len, uint32_t flags, ui=
nt8_t *data);<br>
+<br>
=C2=A0#endif /* QEMU_VNC_H */<br>
diff --git a/ui/vnc-clipboard.c b/ui/vnc-clipboard.c<br>
new file mode 100644<br>
index 000000000000..e729120ba360<br>
--- /dev/null<br>
+++ b/ui/vnc-clipboard.c<br>
@@ -0,0 +1,326 @@<br>
+/*<br>
+ * QEMU VNC display driver -- clipboard support<br>
+ *<br>
+ * Copyright (C) 2021 Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.co=
m" target=3D"_blank">kraxel@redhat.com</a>&gt;<br>
+ *<br>
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy<br>
+ * of this software and associated documentation files (the &quot;Software=
&quot;), to deal<br>
+ * in the Software without restriction, including without limitation the r=
ights<br>
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll<br>
+ * copies of the Software, and to permit persons to whom the Software is<b=
r>
+ * furnished to do so, subject to the following conditions:<br>
+ *<br>
+ * The above copyright notice and this permission notice shall be included=
 in<br>
+ * all copies or substantial portions of the Software.<br>
+ *<br>
+ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIN=
D, EXPRESS OR<br>
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,<br>
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL=
<br>
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER<br>
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,<br>
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN<br>
+ * THE SOFTWARE.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu-common.h&quot;<br>
+#include &quot;vnc.h&quot;<br>
+#include &quot;vnc-jobs.h&quot;<br>
+<br>
+static uint8_t *inflate_buffer(uint8_t *in, uint32_t in_len, uint32_t *siz=
e)<br>
+{<br>
+=C2=A0 =C2=A0 z_stream stream =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .next_in=C2=A0 =3D in,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .avail_in =3D in_len,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .zalloc=C2=A0 =C2=A0=3D Z_NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .zfree=C2=A0 =C2=A0 =3D Z_NULL,<br>
+=C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 uint32_t out_len =3D 8;<br>
+=C2=A0 =C2=A0 uint8_t *out =3D g_malloc(out_len);<br></blockquote><div><br=
></div><div>g_autofree ?<br> <br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
+=C2=A0 =C2=A0 int ret;<br>
+<br>
+=C2=A0 =C2=A0 stream.next_out =3D out + stream.total_out;<br>
+=C2=A0 =C2=A0 stream.avail_out =3D out_len - stream.total_out;<br>
+<br>
+=C2=A0 =C2=A0 ret =3D inflateInit(&amp;stream);<br>
+=C2=A0 =C2=A0 if (ret !=3D Z_OK) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 while (stream.avail_in) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D inflate(&amp;stream, Z_FINISH);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case Z_OK:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case Z_STREAM_END:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case Z_BUF_ERROR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out_len &lt;&lt;=3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (out_len &gt; (1 &lt;&lt; 20)=
) {<br></blockquote><div><br></div><div>1Mb isn&#39;t that much, is it? Wel=
l, since it handles only text for now it&#39;s probably enough. Would it ma=
ke sense to make this a #define for clarity ?<br></div><div> <br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_end;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out =3D g_realloc(out, out_len);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stream.next_out =3D out + stream=
.total_out;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stream.avail_out =3D out_len - s=
tream.total_out;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_end;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 *size =3D stream.total_out;<br>
+=C2=A0 =C2=A0 inflateEnd(&amp;stream);<br>
+<br>
+=C2=A0 =C2=A0 return out;<br>
+<br>
+err_end:<br>
+=C2=A0 =C2=A0 inflateEnd(&amp;stream);<br>
+err:<br>
+=C2=A0 =C2=A0 g_free(out);<br>
+=C2=A0 =C2=A0 return NULL;<br>
+}<br>
+<br>
+static uint8_t *deflate_buffer(uint8_t *in, uint32_t in_len, uint32_t *siz=
e)<br>
+{<br>
+=C2=A0 =C2=A0 z_stream stream =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .next_in=C2=A0 =3D in,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .avail_in =3D in_len,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .zalloc=C2=A0 =C2=A0=3D Z_NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .zfree=C2=A0 =C2=A0 =3D Z_NULL,<br>
+=C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 uint32_t out_len =3D 8;<br>
+=C2=A0 =C2=A0 uint8_t *out =3D g_malloc(out_len);<br></blockquote><div><br=
></div><div>same as inflate</div><div> <br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
+=C2=A0 =C2=A0 int ret;<br>
+<br>
+=C2=A0 =C2=A0 stream.next_out =3D out + stream.total_out;<br>
+=C2=A0 =C2=A0 stream.avail_out =3D out_len - stream.total_out;<br>
+<br>
+=C2=A0 =C2=A0 ret =3D deflateInit(&amp;stream, Z_DEFAULT_COMPRESSION);<br>
+=C2=A0 =C2=A0 if (ret !=3D Z_OK) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 while (ret !=3D Z_STREAM_END) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D deflate(&amp;stream, Z_FINISH);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case Z_OK:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case Z_STREAM_END:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case Z_BUF_ERROR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out_len &lt;&lt;=3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (out_len &gt; (1 &lt;&lt; 20)=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_end;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out =3D g_realloc(out, out_len);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stream.next_out =3D out + stream=
.total_out;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stream.avail_out =3D out_len - s=
tream.total_out;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_end;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 *size =3D stream.total_out;<br>
+=C2=A0 =C2=A0 deflateEnd(&amp;stream);<br>
+<br>
+=C2=A0 =C2=A0 return out;<br>
+<br>
+err_end:<br>
+=C2=A0 =C2=A0 deflateEnd(&amp;stream);<br>
+err:<br>
+=C2=A0 =C2=A0 g_free(out);<br>
+=C2=A0 =C2=A0 return NULL;<br>
+}<br>
+<br>
+static void vnc_clipboard_send(VncState *vs, uint32_t count, uint32_t *dwo=
rds)<br>
+{<br>
+=C2=A0 =C2=A0 int i;<br>
+<br>
+=C2=A0 =C2=A0 vnc_lock_output(vs);<br>
+=C2=A0 =C2=A0 vnc_write_u8(vs, VNC_MSG_SERVER_CUT_TEXT);<br>
+=C2=A0 =C2=A0 vnc_write_u8(vs, 0);<br>
+=C2=A0 =C2=A0 vnc_write_u8(vs, 0);<br>
+=C2=A0 =C2=A0 vnc_write_u8(vs, 0);<br>
+=C2=A0 =C2=A0 vnc_write_s32(vs, -(count * sizeof(uint32_t)));=C2=A0 /* -(m=
essage length) */<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; count; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vnc_write_u32(vs, dwords[i]);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 vnc_unlock_output(vs);<br>
+=C2=A0 =C2=A0 vnc_flush(vs);<br>
+}<br>
+<br>
+static void vnc_clipboard_provide(VncState *vs,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QemuClipboardInfo *info,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QemuClipboardType type)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t flags =3D 0;<br>
+=C2=A0 =C2=A0 uint8_t *buf;<br>
+=C2=A0 =C2=A0 void *zbuf;<br>
+=C2=A0 =C2=A0 uint32_t zsize;<br>
+<br>
+=C2=A0 =C2=A0 switch (type) {<br>
+=C2=A0 =C2=A0 case QEMU_CLIPBOARD_TYPE_TEXT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 flags |=3D VNC_CLIPBOARD_TEXT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 flags |=3D VNC_CLIPBOARD_PROVIDE;<br>
+<br>
+=C2=A0 =C2=A0 buf =3D g_malloc(info-&gt;types[type].size + 4);<br>
+=C2=A0 =C2=A0 buf[0] =3D (info-&gt;types[type].size &gt;&gt; 24) &amp; 0xf=
f;<br>
+=C2=A0 =C2=A0 buf[1] =3D (info-&gt;types[type].size &gt;&gt; 16) &amp; 0xf=
f;<br>
+=C2=A0 =C2=A0 buf[2] =3D (info-&gt;types[type].size &gt;&gt;=C2=A0 8) &amp=
; 0xff;<br>
+=C2=A0 =C2=A0 buf[3] =3D (info-&gt;types[type].size &gt;&gt;=C2=A0 0) &amp=
; 0xff;<br>
+=C2=A0 =C2=A0 memcpy(buf + 4, info-&gt;types[type].data, info-&gt;types[ty=
pe].size);<br>
+=C2=A0 =C2=A0 zbuf =3D deflate_buffer(buf, info-&gt;types[type].size + 4, =
&amp;zsize);<br>
+=C2=A0 =C2=A0 g_free(buf);<br>
+<br>
+=C2=A0 =C2=A0 if (!zbuf) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 vnc_lock_output(vs);<br>
+=C2=A0 =C2=A0 vnc_write_u8(vs, VNC_MSG_SERVER_CUT_TEXT);<br>
+=C2=A0 =C2=A0 vnc_write_u8(vs, 0);<br>
+=C2=A0 =C2=A0 vnc_write_u8(vs, 0);<br>
+=C2=A0 =C2=A0 vnc_write_u8(vs, 0);<br>
+=C2=A0 =C2=A0 vnc_write_s32(vs, -(sizeof(uint32_t) + zsize));=C2=A0 /* -(m=
essage length) */<br>
+=C2=A0 =C2=A0 vnc_write_u32(vs, flags);<br>
+=C2=A0 =C2=A0 vnc_write(vs, zbuf, zsize);<br>
+=C2=A0 =C2=A0 vnc_unlock_output(vs);<br>
+=C2=A0 =C2=A0 vnc_flush(vs);<br></blockquote><div><br></div><div>zbuf is l=
eaked, g_autofree is your friend</div><div> <br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
+}<br>
+<br>
+static void vnc_clipboard_notify(Notifier *notifier, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 VncState *vs =3D container_of(notifier, VncState, cbpeer.upd=
ate);<br>
+=C2=A0 =C2=A0 QemuClipboardInfo *info =3D data;<br>
+=C2=A0 =C2=A0 QemuClipboardType type;<br>
+=C2=A0 =C2=A0 bool self_update =3D info-&gt;owner =3D=3D &amp;vs-&gt;cbpee=
r;<br>
+=C2=A0 =C2=A0 uint32_t flags =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 if (info !=3D vs-&gt;cbinfo) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clipboard_info_put(vs-&gt;cbinfo);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vs-&gt;cbinfo =3D qemu_clipboard_info_get(info=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vs-&gt;cbpending =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!self_update) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (info-&gt;types[QEMU_CLIPBOAR=
D_TYPE_TEXT].available) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flags |=3D VNC_CLI=
PBOARD_TEXT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flags |=3D VNC_CLIPBOARD_NOTIFY;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vnc_clipboard_send(vs, 1, &amp;f=
lags);<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vs-&gt;cbpending &amp; (1 &lt;&lt; type)) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vs-&gt;cbpending &amp;=3D ~(1 &l=
t;&lt; type);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vnc_clipboard_provide(vs, info, =
type);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void vnc_clipboard_request(QemuClipboardInfo *info,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QemuClipboardType type)<br>
+{<br>
+=C2=A0 =C2=A0 VncState *vs =3D container_of(info-&gt;owner, VncState, cbpe=
er);<br>
+=C2=A0 =C2=A0 uint32_t flags =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 if (type =3D=3D QEMU_CLIPBOARD_TYPE_TEXT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 flags |=3D VNC_CLIPBOARD_TEXT;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (!flags) {<br></blockquote><div><br></div><div>It might b=
e worth noticing an empty clipboard in this case.</div><div> <br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 flags |=3D VNC_CLIPBOARD_REQUEST;<br>
+<br>
+=C2=A0 =C2=A0 vnc_clipboard_send(vs, 1, &amp;flags);<br>
+}<br>
+<br>
+void vnc_client_cut_text_ext(VncState *vs, int32_t len, uint32_t flags, ui=
nt8_t *data)<br>
+{<br>
+=C2=A0 =C2=A0 if (flags &amp; VNC_CLIPBOARD_CAPS) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* need store caps somewhere ? */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (flags &amp; VNC_CLIPBOARD_NOTIFY) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QemuClipboardInfo *info =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clipboard_info_new(&amp;vs-=
&gt;cbpeer, QEMU_CLIPBOARD_SELECTION_CLIPBOARD);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (flags &amp; VNC_CLIPBOARD_TEXT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;types[QEMU_CLIPBOARD_TY=
PE_TEXT].available =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clipboard_update(info);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clipboard_info_put(info);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (flags &amp; VNC_CLIPBOARD_PROVIDE &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vs-&gt;cbinfo &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vs-&gt;cbinfo-&gt;owner =3D=3D &amp;vs-&gt;cbp=
eer) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t size =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t *buf =3D inflate_buffer(data, len - 4,=
 &amp;size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((flags &amp; VNC_CLIPBOARD_TEXT) &amp;&amp=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf &amp;&amp; size &gt;=3D 4) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t tsize =3D read_u32(buf,=
 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t *tbuf =3D buf + 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tsize &lt; size) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clipboard_set=
_data(&amp;vs-&gt;cbpeer, vs-&gt;cbinfo,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QEMU_CLI=
PBOARD_TYPE_TEXT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tsize, t=
buf, true);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(buf);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (flags &amp; VNC_CLIPBOARD_REQUEST &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vs-&gt;cbinfo &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vs-&gt;cbinfo-&gt;owner !=3D &amp;vs-&gt;cbpee=
r) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((flags &amp; VNC_CLIPBOARD_TEXT) &amp;&amp=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vs-&gt;cbinfo-&gt;types[QEMU_CLI=
PBOARD_TYPE_TEXT].available) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vs-&gt;cbinfo-&gt;types[QEMU=
_CLIPBOARD_TYPE_TEXT].data) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vnc_clipboard_prov=
ide(vs, vs-&gt;cbinfo, QEMU_CLIPBOARD_TYPE_TEXT);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vs-&gt;cbpending |=
=3D (1 &lt;&lt; QEMU_CLIPBOARD_TYPE_TEXT);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clipboard_req=
uest(vs-&gt;cbinfo, QEMU_CLIPBOARD_TYPE_TEXT);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+void vnc_client_cut_text(VncState *vs, size_t len, uint8_t *text)<br>
+{<br>
+=C2=A0 =C2=A0 QemuClipboardInfo *info =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clipboard_info_new(&amp;vs-&gt;cbpeer, QE=
MU_CLIPBOARD_SELECTION_CLIPBOARD);<br>
+<br>
+=C2=A0 =C2=A0 qemu_clipboard_set_data(&amp;vs-&gt;cbpeer, info, QEMU_CLIPB=
OARD_TYPE_TEXT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 len, text, true);<br>
+=C2=A0 =C2=A0 qemu_clipboard_info_put(info);<br>
+}<br>
+<br>
+void vnc_server_cut_text_caps(VncState *vs)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t caps[2];<br>
+<br>
+=C2=A0 =C2=A0 if (!vnc_has_feature(vs, VNC_FEATURE_CLIPBOARD_EXT)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 caps[0] =3D (VNC_CLIPBOARD_PROVIDE |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VNC_CLIPBOARD_NOTIF=
Y=C2=A0 |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VNC_CLIPBOARD_REQUE=
ST |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VNC_CLIPBOARD_CAPS=
=C2=A0 =C2=A0 |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VNC_CLIPBOARD_TEXT)=
;<br>
+=C2=A0 =C2=A0 caps[1] =3D 0;<br>
+=C2=A0 =C2=A0 vnc_clipboard_send(vs, 2, caps);<br>
+<br>
+=C2=A0 =C2=A0 vs-&gt;<a href=3D"http://cbpeer.name" rel=3D"noreferrer" tar=
get=3D"_blank">cbpeer.name</a> =3D &quot;vnc&quot;;<br>
+=C2=A0 =C2=A0 vs-&gt;cbpeer.update.notify =3D vnc_clipboard_notify;<br>
+=C2=A0 =C2=A0 vs-&gt;cbpeer.request =3D vnc_clipboard_request;<br>
+=C2=A0 =C2=A0 qemu_clipboard_peer_register(&amp;vs-&gt;cbpeer);<br>
+}<br>
diff --git a/ui/vnc.c b/ui/vnc.c<br>
index 16bb3be770b2..91ec51c7c67d 100644<br>
--- a/ui/vnc.c<br>
+++ b/ui/vnc.c<br>
@@ -25,6 +25,7 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;vnc.h&quot;<br>
=C2=A0#include &quot;vnc-jobs.h&quot;<br>
=C2=A0#include &quot;trace.h&quot;<br>
@@ -1309,6 +1310,9 @@ void vnc_disconnect_finish(VncState *vs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* last client gone */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vnc_update_server_surface(vs-&gt;vd);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 if (vs-&gt;cbpeer.update.notify) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clipboard_peer_unregister(&amp;vs-&gt;cbp=
eer);<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0vnc_unlock_output(vs);<br>
<br>
@@ -1734,10 +1738,6 @@ uint32_t read_u32(uint8_t *data, size_t offset)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(data[offset + 2] &lt;&lt; =
8) | data[offset + 3]);<br>
=C2=A0}<br>
<br>
-static void client_cut_text(VncState *vs, size_t len, uint8_t *text)<br>
-{<br>
-}<br>
-<br>
=C2=A0static void check_pointer_type_change(Notifier *notifier, void *data)=
<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0VncState *vs =3D container_of(notifier, VncState, mouse=
_mode_notifier);<br>
@@ -2179,6 +2179,10 @@ static void set_encodings(VncState *vs, int32_t *enc=
odings, size_t n_encodings)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0send_xvp_mess=
age(vs, VNC_XVP_CODE_INIT);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case VNC_ENCODING_CLIPBOARD_EXT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vs-&gt;features |=3D VNC_FEATURE=
_CLIPBOARD_EXT_MASK;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vnc_server_cut_text_caps(vs);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case VNC_ENCODING_COMPRESSLEVEL0 ... VNC_=
ENCODING_COMPRESSLEVEL0 + 9:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vs-&gt;tight-&gt;compressio=
n =3D (enc &amp; 0x0F);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
@@ -2395,7 +2399,7 @@ static int protocol_client_msg(VncState *vs, uint8_t =
*data, size_t len)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 8;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (len =3D=3D 8) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t dlen =3D read_u32(data,=
 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t dlen =3D abs(read_s32(d=
ata, 4));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (dlen &gt; (1 &lt;&lt; 2=
0)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_report(=
&quot;vnc: client_cut_text msg payload has %u bytes&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; which exceeds our limit of 1MB.&quot=
;, dlen);<br>
@@ -2407,7 +2411,11 @@ static int protocol_client_msg(VncState *vs, uint8_t=
 *data, size_t len)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 client_cut_text(vs, read_u32(data, 4), data + =
8);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (read_s32(data, 4) &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vnc_client_cut_text_ext(vs, abs(=
read_s32(data, 4)), read_u32(data, 8), data + 12);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vnc_client_cut_text(vs, read_u32(data, 4), dat=
a + 8);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case VNC_MSG_CLIENT_XVP:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(vs-&gt;features &amp; VNC_FEATURE_X=
VP)) {<br>
diff --git a/ui/meson.build b/ui/meson.build<br>
index 08447ac15c5e..a98f89b48978 100644<br>
--- a/ui/meson.build<br>
+++ b/ui/meson.build<br>
@@ -30,6 +30,7 @@ vnc_ss.add(files(<br>
=C2=A0 =C2=A0&#39;vnc-auth-vencrypt.c&#39;,<br>
=C2=A0 =C2=A0&#39;vnc-ws.c&#39;,<br>
=C2=A0 =C2=A0&#39;vnc-jobs.c&#39;,<br>
+=C2=A0 &#39;vnc-clipboard.c&#39;,<br>
=C2=A0))<br>
=C2=A0vnc_ss.add(zlib, png, jpeg, gnutls)<br>
=C2=A0vnc_ss.add(when: sasl, if_true: files(&#39;vnc-auth-sasl.c&#39;))<br>
-- <br>
2.29.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000fc5f1d05bc2de59d--

