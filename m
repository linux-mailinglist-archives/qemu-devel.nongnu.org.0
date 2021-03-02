Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B5F3296EF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 09:30:43 +0100 (CET)
Received: from localhost ([::1]:40642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH0QU-00058i-Jq
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 03:30:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lH0PM-0004hO-9V
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 03:29:33 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:44902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lH0PI-000295-6t
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 03:29:31 -0500
Received: by mail-ej1-x629.google.com with SMTP id w1so33606543ejf.11
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 00:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2fBCCKG/k6GcJMNRzCQO3iKOV9gBLH33P4bidfyXHNQ=;
 b=T3DMo3rfZswbG90162zHbYbfkLLb4ikyTYKUe9z6vbDq2CN8CgG4XM4OauvZOEJaWH
 dERTfZCsFeKD0y4nst/yPhkC6E8EuhB5eWznITkEPvY2OiKILwN50ELWHXiehemyqJTN
 8a3yFfQU69zDNu3Xq25E55NUmaaAxctNzmUthBLaH5elk6gFCVwb0NBaHCbZjZVPERAi
 4G8ScsDOFW2Oj3DtZ2u5kw89XySOPt2LfVzqg+Wc/+6+egRAnF8DLN/q8kvGA+8G9qv3
 0Zez/UVd5ujxeDzNRR8BleedbkP+7uIXEXv6ubBy7uv5Qr8o8SdlEPsUh2ZMXjVnLdRT
 h+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2fBCCKG/k6GcJMNRzCQO3iKOV9gBLH33P4bidfyXHNQ=;
 b=EvholPeK/I1Rj20N12qfKV1FGgXMxIvSCyoT1DK4AK8JVLcAeZq+TIA4Jrc20l9iei
 xfw2DtCjcnRuDFdoSiJbqCqLZaR3JU/raeF+bg6v+N7XGN29/ArqYuASMBS+75JYc3a+
 IjOOAn+vNos5Y2PFb/60KaPd3oMYKe1bhvgRjWOO8TCA1Vcelt8Gglve6P3jOwtQZ8Ep
 KfsahS9QVAD6VwhX3c2MfIpD8pzlpY1ZMZ/KQrYKXTpeJkoT7XXAXLUfIQROH9JJwS5F
 Qn/qK9+y02SPado2FXNQMVqoubDBtEIzsjDSv4wBiT2Y5d8CBHZDFOGwfl8GyWspGgTB
 8o+w==
X-Gm-Message-State: AOAM532Yst3snuItM09YbuwjwXBl+mmw0FQ3wzn3DeT24/+hYYJLhyeC
 8mVwr9/c4XoT9JQDpclneP4gL29CHXTF+q4lTT+3NSfrV5k=
X-Google-Smtp-Source: ABdhPJyOQ1iU7VPv+XAhs+b/cxbmi011yU8XwPLF3fl+YSWCa+BDZvQjI4zqr4/QsELCQN3mli+0j/v54yJ+L5/CLfA=
X-Received: by 2002:a17:906:cf90:: with SMTP id
 um16mr20103257ejb.389.1614673765735; 
 Tue, 02 Mar 2021 00:29:25 -0800 (PST)
MIME-Version: 1.0
References: <20210302080358.3095748-1-vivek.kasireddy@intel.com>
 <20210302080358.3095748-2-vivek.kasireddy@intel.com>
In-Reply-To: <20210302080358.3095748-2-vivek.kasireddy@intel.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 2 Mar 2021 12:29:14 +0400
Message-ID: <CAJ+F1C+fFt_ve39kxuQfG+WS_TEKgWKwvB6m0ymUfTkoa7Stiw@mail.gmail.com>
Subject: Re: [RFC 1/1] virtio-gpu: Use dmabuf for display updates if possible
 instead of pixman
To: QEMU <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000003c206b05bc8988f5"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x629.google.com
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003c206b05bc8988f5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

(adding the maintainer, Gerd, in CC)

On Tue, Mar 2, 2021 at 12:17 PM Vivek Kasireddy <vivek.kasireddy@intel.com>
wrote:

> If a dmabuf can be created using Udmabuf driver for non-Virgil rendered
> resources, then this should be preferred over pixman. If a dmabuf cannot
> be created then we can fallback to pixman.
>
> The dmabuf create and release functions are inspired by similar
> functions in vfio/display.c.
>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  hw/display/virtio-gpu.c        | 133 +++++++++++++++++++++++++++++++++
>  include/hw/virtio/virtio-gpu.h |  12 +++
>  2 files changed, 145 insertions(+)
>
> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index 2e4a9822b6..399d46eac3 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -18,6 +18,7 @@
>  #include "trace.h"
>  #include "sysemu/dma.h"
>  #include "sysemu/sysemu.h"
> +#include "exec/ramblock.h"
>  #include "hw/virtio/virtio.h"
>  #include "migration/qemu-file-types.h"
>  #include "hw/virtio/virtio-gpu.h"
> @@ -30,9 +31,14 @@
>  #include "qemu/module.h"
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
> +#include "standard-headers/drm/drm_fourcc.h"
> +#include <sys/ioctl.h>
> +
> +#include <linux/udmabuf.h>
>
>  #define VIRTIO_GPU_VM_VERSION 1
>
> +static int udmabuf_fd;
>  static struct virtio_gpu_simple_resource*
>  virtio_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id);
>
> @@ -519,6 +525,119 @@ static void virtio_unref_resource(pixman_image_t
> *image, void *data)
>      pixman_image_unref(data);
>  }
>
> +static VGPUDMABuf *virtio_gpu_get_dmabuf(VirtIOGPU *g,
> +                                         struct
> virtio_gpu_simple_resource *res)
> +{
> +    VGPUDMABuf *dmabuf;
> +    RAMBlock *rb;
> +    ram_addr_t offset;
> +    struct udmabuf_create_list *create;
> +    uint32_t modifier_hi, modifier_lo;
> +    uint64_t modifier;
> +    static uint64_t ids =3D 1;
> +    int i, dmabuf_fd;
> +
> +    create =3D g_malloc0(sizeof(*create) +
> +                       res->iov_cnt * sizeof (struct
> udmabuf_create_item));
> +    if (!create)
> +        return NULL;
>

Pointless allocation check (g_malloc will abort if it failed to allocate)

+
> +    create->count =3D res->iov_cnt;
> +    create->flags =3D UDMABUF_FLAGS_CLOEXEC;
> +    for (i =3D 0; i < res->iov_cnt; i++) {
> +        rb =3D qemu_ram_block_from_host(res->iov[i].iov_base, false,
> &offset);
> +        if (!rb || rb->fd < 0) {
> +                g_free(create);
> +                return NULL;
> +        }
> +
> +        create->list[i].memfd =3D rb->fd;
> +        create->list[i].__pad =3D 0;
> +        create->list[i].offset =3D offset;
> +        create->list[i].size =3D res->iov[i].iov_len;
> +    }
> +
> +    dmabuf_fd =3D ioctl(udmabuf_fd, UDMABUF_CREATE_LIST, create);
> +    if (dmabuf_fd < 0) {
>

It would be useful to print the error with errno.


> +        g_free(create);
>

(we now like new code to use g_auto)

+        return NULL;
> +    }
> +
> +    /* FIXME: We should get the modifier and format info with blob
> resources */
> +    modifier_hi =3D fourcc_mod_code(INTEL, I915_FORMAT_MOD_X_TILED) >> 3=
2;
> +    modifier_lo =3D fourcc_mod_code(INTEL,I915_FORMAT_MOD_X_TILED) &
> 0xFFFFFFFF;
>

I have no idea if this format is going to work with various drivers and
matches the underlying memory representation.


> +    modifier =3D ((uint64_t)modifier_hi << 32) | modifier_lo;
> +
> +    dmabuf =3D g_new0(VGPUDMABuf, 1);
> +    dmabuf->dmabuf_id =3D ids++;
> +    dmabuf->buf.width =3D res->width;
> +    dmabuf->buf.height =3D res->height;
> +    dmabuf->buf.stride =3D pixman_image_get_stride(res->image);
> +    dmabuf->buf.fourcc =3D DRM_FORMAT_XRGB8888;
> +    dmabuf->buf.modifier =3D modifier;
> +    dmabuf->buf.fd =3D dmabuf_fd;
> +
> +    QTAILQ_INSERT_HEAD(&g->dmabuf.bufs, dmabuf, next);
> +    g_free(create);
> +
> +    return dmabuf;
> +}
> +
> +static void virtio_gpu_free_one_dmabuf(VirtIOGPU *g, VGPUDMABuf *dmabuf,
> +                                       struct virtio_gpu_scanout *scanou=
t)
> +{
> +    QTAILQ_REMOVE(&g->dmabuf.bufs, dmabuf, next);
> +    dpy_gl_release_dmabuf(scanout->con, &dmabuf->buf);
> +
> +    close(dmabuf->buf.fd);
> +    g_free(dmabuf);
> +}
> +
> +static void virtio_gpu_free_dmabufs(VirtIOGPU *g,
> +                                    struct virtio_gpu_scanout *scanout)
> +{
> +    VGPUDMABuf *dmabuf, *tmp;
> +    uint32_t keep =3D 1;
> +
> +    QTAILQ_FOREACH_SAFE(dmabuf, &g->dmabuf.bufs, next, tmp) {
> +        if (keep > 0) {
> +            keep--;
> +            continue;
> +        }
> +        assert(dmabuf !=3D g->dmabuf.primary);
> +        virtio_gpu_free_one_dmabuf(g, dmabuf, scanout);
> +    }
> +}
> +
> +static int virtio_gpu_dmabuf_update(VirtIOGPU *g,
> +                                    struct virtio_gpu_simple_resource
> *res,
> +                                    struct virtio_gpu_scanout *scanout)
> +{
> +    VGPUDMABuf *primary;
> +    bool free_bufs =3D false;
> +
> +    primary =3D virtio_gpu_get_dmabuf(g, res);
> +    if (!primary) {
> +        return -EINVAL;
> +    }
> +
> +    if (g->dmabuf.primary !=3D primary) {
> +        g->dmabuf.primary =3D primary;
> +        qemu_console_resize(scanout->con,
> +                            primary->buf.width, primary->buf.height);
> +        dpy_gl_scanout_dmabuf(scanout->con, &primary->buf);
> +        free_bufs =3D true;
> +    }
> +
> +    dpy_gl_update(scanout->con, 0, 0, primary->buf.width,
> primary->buf.height);
> +
> +    if (free_bufs) {
> +        virtio_gpu_free_dmabufs(g, scanout);
> +    }
> +
> +    return 0;
> +}
> +
>  static void virtio_gpu_set_scanout(VirtIOGPU *g,
>                                     struct virtio_gpu_ctrl_command *cmd)
>  {
> @@ -528,6 +647,7 @@ static void virtio_gpu_set_scanout(VirtIOGPU *g,
>      uint32_t offset;
>      int bpp;
>      struct virtio_gpu_set_scanout ss;
> +    int ret;
>
>      VIRTIO_GPU_FILL_CMD(ss);
>      virtio_gpu_bswap_32(&ss, sizeof(ss));
> @@ -574,6 +694,12 @@ static void virtio_gpu_set_scanout(VirtIOGPU *g,
>
>      scanout =3D &g->parent_obj.scanout[ss.scanout_id];
>
> +    if (udmabuf_fd > 0) {
> +        ret =3D virtio_gpu_dmabuf_update(g, res, scanout);
> +        if (!ret)
> +            return;
> +    }
> +
>      format =3D pixman_image_get_format(res->image);
>      bpp =3D DIV_ROUND_UP(PIXMAN_FORMAT_BPP(format), 8);
>      offset =3D (ss.r.x * bpp) + ss.r.y *
> pixman_image_get_stride(res->image);
> @@ -1139,6 +1265,13 @@ static void virtio_gpu_device_realize(DeviceState
> *qdev, Error **errp)
>          return;
>      }
>
> +    udmabuf_fd =3D open("/dev/udmabuf", O_RDWR);
>

If udmabuf_fd is already opened, this will leak fds.


> +    if (udmabuf_fd < 0) {
> +        error_setg_errno(errp, errno,
> +                         "udmabuf: failed to open vhost device");
> +        return;
>

The fallback path should keep working

+    }
> +
>      g->ctrl_vq =3D virtio_get_queue(vdev, 0);
>      g->cursor_vq =3D virtio_get_queue(vdev, 1);
>      g->ctrl_bh =3D qemu_bh_new(virtio_gpu_ctrl_bh, g);
> diff --git a/include/hw/virtio/virtio-gpu.h
> b/include/hw/virtio/virtio-gpu.h
> index fae149235c..153f3364a9 100644
> --- a/include/hw/virtio/virtio-gpu.h
> +++ b/include/hw/virtio/virtio-gpu.h
> @@ -131,6 +131,13 @@ struct VirtIOGPUBaseClass {
>      DEFINE_PROP_UINT32("xres", _state, _conf.xres, 1024), \
>      DEFINE_PROP_UINT32("yres", _state, _conf.yres, 768)
>
> +typedef struct VGPUDMABuf {
> +    QemuDmaBuf buf;
> +    uint32_t x, y;
> +    uint64_t dmabuf_id;
> +    QTAILQ_ENTRY(VGPUDMABuf) next;
> +} VGPUDMABuf;
> +
>  struct VirtIOGPU {
>      VirtIOGPUBase parent_obj;
>
> @@ -161,6 +168,11 @@ struct VirtIOGPU {
>          uint32_t req_3d;
>          uint32_t bytes_3d;
>      } stats;
> +
> +    struct {
> +        QTAILQ_HEAD(, VGPUDMABuf) bufs;
> +        VGPUDMABuf *primary;
> +    } dmabuf;
>  };
>
>  struct VhostUserGPU {
> --
> 2.26.2
>
>
>
It would be worth doing a similar change in vhost-user-gpu.

--=20
Marc-Andr=C3=A9 Lureau

--0000000000003c206b05bc8988f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><div><br></div><div>(adding t=
he maintainer, Gerd, in CC)</div><div><br></div><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 2, 2021 at 12:17 PM Vivek=
 Kasireddy &lt;<a href=3D"mailto:vivek.kasireddy@intel.com">vivek.kasireddy=
@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">If a dmabuf can be created using Udmabuf driver for non-Virgil r=
endered<br>
resources, then this should be preferred over pixman. If a dmabuf cannot<br=
>
be created then we can fallback to pixman.<br>
<br>
The dmabuf create and release functions are inspired by similar<br>
functions in vfio/display.c.<br>
<br>
Signed-off-by: Vivek Kasireddy &lt;<a href=3D"mailto:vivek.kasireddy@intel.=
com" target=3D"_blank">vivek.kasireddy@intel.com</a>&gt;<br>
---<br>
=C2=A0hw/display/virtio-gpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 133 ++++++++++++=
+++++++++++++++++++++<br>
=C2=A0include/hw/virtio/virtio-gpu.h |=C2=A0 12 +++<br>
=C2=A02 files changed, 145 insertions(+)<br>
<br>
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c<br>
index 2e4a9822b6..399d46eac3 100644<br>
--- a/hw/display/virtio-gpu.c<br>
+++ b/hw/display/virtio-gpu.c<br>
@@ -18,6 +18,7 @@<br>
=C2=A0#include &quot;trace.h&quot;<br>
=C2=A0#include &quot;sysemu/dma.h&quot;<br>
=C2=A0#include &quot;sysemu/sysemu.h&quot;<br>
+#include &quot;exec/ramblock.h&quot;<br>
=C2=A0#include &quot;hw/virtio/virtio.h&quot;<br>
=C2=A0#include &quot;migration/qemu-file-types.h&quot;<br>
=C2=A0#include &quot;hw/virtio/virtio-gpu.h&quot;<br>
@@ -30,9 +31,14 @@<br>
=C2=A0#include &quot;qemu/module.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
+#include &quot;standard-headers/drm/drm_fourcc.h&quot;<br>
+#include &lt;sys/ioctl.h&gt;<br>
+<br>
+#include &lt;linux/udmabuf.h&gt;<br>
<br>
=C2=A0#define VIRTIO_GPU_VM_VERSION 1<br>
<br>
+static int udmabuf_fd;<br>
=C2=A0static struct virtio_gpu_simple_resource*<br>
=C2=A0virtio_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id);<br>
<br>
@@ -519,6 +525,119 @@ static void virtio_unref_resource(pixman_image_t *ima=
ge, void *data)<br>
=C2=A0 =C2=A0 =C2=A0pixman_image_unref(data);<br>
=C2=A0}<br>
<br>
+static VGPUDMABuf *virtio_gpu_get_dmabuf(VirtIOGPU *g,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0st=
ruct virtio_gpu_simple_resource *res)<br>
+{<br>
+=C2=A0 =C2=A0 VGPUDMABuf *dmabuf;<br>
+=C2=A0 =C2=A0 RAMBlock *rb;<br>
+=C2=A0 =C2=A0 ram_addr_t offset;<br>
+=C2=A0 =C2=A0 struct udmabuf_create_list *create;<br>
+=C2=A0 =C2=A0 uint32_t modifier_hi, modifier_lo;<br>
+=C2=A0 =C2=A0 uint64_t modifier;<br>
+=C2=A0 =C2=A0 static uint64_t ids =3D 1;<br>
+=C2=A0 =C2=A0 int i, dmabuf_fd;<br>
+<br>
+=C2=A0 =C2=A0 create =3D g_malloc0(sizeof(*create) +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0res-&gt;iov_cnt * sizeof (struct udmabuf_create_item));<br>
+=C2=A0 =C2=A0 if (!create)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br></blockquote><div><br></div><d=
iv>Pointless allocation check (g_malloc will abort if it failed to allocate=
)</div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 create-&gt;count =3D res-&gt;iov_cnt;<br>
+=C2=A0 =C2=A0 create-&gt;flags =3D UDMABUF_FLAGS_CLOEXEC;<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; res-&gt;iov_cnt; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rb =3D qemu_ram_block_from_host(res-&gt;iov[i]=
.iov_base, false, &amp;offset);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!rb || rb-&gt;fd &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(create);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 create-&gt;list[i].memfd =3D rb-&gt;fd;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 create-&gt;list[i].__pad =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 create-&gt;list[i].offset =3D offset;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 create-&gt;list[i].size =3D res-&gt;iov[i].iov=
_len;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 dmabuf_fd =3D ioctl(udmabuf_fd, UDMABUF_CREATE_LIST, create)=
;<br>
+=C2=A0 =C2=A0 if (dmabuf_fd &lt; 0) {<br></blockquote><div><br></div><div>=
It would be useful to print the error with errno.<br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(create);<br></blockquote><div><br></div=
><div>(we now like new code to use g_auto)</div><div><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* FIXME: We should get the modifier and format info with bl=
ob resources */<br>
+=C2=A0 =C2=A0 modifier_hi =3D fourcc_mod_code(INTEL, I915_FORMAT_MOD_X_TIL=
ED) &gt;&gt; 32;<br>
+=C2=A0 =C2=A0 modifier_lo =3D fourcc_mod_code(INTEL,I915_FORMAT_MOD_X_TILE=
D) &amp; 0xFFFFFFFF;<br></blockquote><div><br></div><div>I have no idea if =
this format is going to work with various drivers and matches the underlyin=
g memory representation.<br></div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
+=C2=A0 =C2=A0 modifier =3D ((uint64_t)modifier_hi &lt;&lt; 32) | modifier_=
lo;<br>
+<br>
+=C2=A0 =C2=A0 dmabuf =3D g_new0(VGPUDMABuf, 1);<br>
+=C2=A0 =C2=A0 dmabuf-&gt;dmabuf_id =3D ids++;<br>
+=C2=A0 =C2=A0 dmabuf-&gt;buf.width =3D res-&gt;width;<br>
+=C2=A0 =C2=A0 dmabuf-&gt;buf.height =3D res-&gt;height;<br>
+=C2=A0 =C2=A0 dmabuf-&gt;buf.stride =3D pixman_image_get_stride(res-&gt;im=
age);<br>
+=C2=A0 =C2=A0 dmabuf-&gt;buf.fourcc =3D DRM_FORMAT_XRGB8888;<br>
+=C2=A0 =C2=A0 dmabuf-&gt;buf.modifier =3D modifier;<br>
+=C2=A0 =C2=A0 dmabuf-&gt;buf.fd =3D dmabuf_fd;<br>
+<br>
+=C2=A0 =C2=A0 QTAILQ_INSERT_HEAD(&amp;g-&gt;dmabuf.bufs, dmabuf, next);<br=
>
+=C2=A0 =C2=A0 g_free(create);<br>
+<br>
+=C2=A0 =C2=A0 return dmabuf;<br>
+}<br>
+<br>
+static void virtio_gpu_free_one_dmabuf(VirtIOGPU *g, VGPUDMABuf *dmabuf,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct vi=
rtio_gpu_scanout *scanout)<br>
+{<br>
+=C2=A0 =C2=A0 QTAILQ_REMOVE(&amp;g-&gt;dmabuf.bufs, dmabuf, next);<br>
+=C2=A0 =C2=A0 dpy_gl_release_dmabuf(scanout-&gt;con, &amp;dmabuf-&gt;buf);=
<br>
+<br>
+=C2=A0 =C2=A0 close(dmabuf-&gt;buf.fd);<br>
+=C2=A0 =C2=A0 g_free(dmabuf);<br>
+}<br>
+<br>
+static void virtio_gpu_free_dmabufs(VirtIOGPU *g,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_scan=
out *scanout)<br>
+{<br>
+=C2=A0 =C2=A0 VGPUDMABuf *dmabuf, *tmp;<br>
+=C2=A0 =C2=A0 uint32_t keep =3D 1;<br>
+<br>
+=C2=A0 =C2=A0 QTAILQ_FOREACH_SAFE(dmabuf, &amp;g-&gt;dmabuf.bufs, next, tm=
p) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (keep &gt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 keep--;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(dmabuf !=3D g-&gt;dmabuf.primary);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_gpu_free_one_dmabuf(g, dmabuf, scanout)=
;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static int virtio_gpu_dmabuf_update(VirtIOGPU *g,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_simp=
le_resource *res,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_scan=
out *scanout)<br>
+{<br>
+=C2=A0 =C2=A0 VGPUDMABuf *primary;<br>
+=C2=A0 =C2=A0 bool free_bufs =3D false;<br>
+<br>
+=C2=A0 =C2=A0 primary =3D virtio_gpu_get_dmabuf(g, res);<br>
+=C2=A0 =C2=A0 if (!primary) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (g-&gt;dmabuf.primary !=3D primary) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g-&gt;dmabuf.primary =3D primary;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_console_resize(scanout-&gt;con,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 primary-&gt;buf.width, primary-&gt;buf.height);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dpy_gl_scanout_dmabuf(scanout-&gt;con, &amp;pr=
imary-&gt;buf);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 free_bufs =3D true;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 dpy_gl_update(scanout-&gt;con, 0, 0, primary-&gt;buf.width, =
primary-&gt;buf.height);<br>
+<br>
+=C2=A0 =C2=A0 if (free_bufs) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_gpu_free_dmabufs(g, scanout);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
=C2=A0static void virtio_gpu_set_scanout(VirtIOGPU *g,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_ctrl=
_command *cmd)<br>
=C2=A0{<br>
@@ -528,6 +647,7 @@ static void virtio_gpu_set_scanout(VirtIOGPU *g,<br>
=C2=A0 =C2=A0 =C2=A0uint32_t offset;<br>
=C2=A0 =C2=A0 =C2=A0int bpp;<br>
=C2=A0 =C2=A0 =C2=A0struct virtio_gpu_set_scanout ss;<br>
+=C2=A0 =C2=A0 int ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0VIRTIO_GPU_FILL_CMD(ss);<br>
=C2=A0 =C2=A0 =C2=A0virtio_gpu_bswap_32(&amp;ss, sizeof(ss));<br>
@@ -574,6 +694,12 @@ static void virtio_gpu_set_scanout(VirtIOGPU *g,<br>
<br>
=C2=A0 =C2=A0 =C2=A0scanout =3D &amp;g-&gt;parent_obj.scanout[ss.scanout_id=
];<br>
<br>
+=C2=A0 =C2=A0 if (udmabuf_fd &gt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D virtio_gpu_dmabuf_update(g, res, scano=
ut);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0format =3D pixman_image_get_format(res-&gt;image);<br>
=C2=A0 =C2=A0 =C2=A0bpp =3D DIV_ROUND_UP(PIXMAN_FORMAT_BPP(format), 8);<br>
=C2=A0 =C2=A0 =C2=A0offset =3D (ss.r.x * bpp) + ss.r.y * pixman_image_get_s=
tride(res-&gt;image);<br>
@@ -1139,6 +1265,13 @@ static void virtio_gpu_device_realize(DeviceState *q=
dev, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 udmabuf_fd =3D open(&quot;/dev/udmabuf&quot;, O_RDWR);<br></=
blockquote><div><br></div><div>If udmabuf_fd is already opened, this will l=
eak fds.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+=C2=A0 =C2=A0 if (udmabuf_fd &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;udmabuf: failed to open vhost device&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br></blockquote><div><br></div><div>Th=
e fallback path should keep working</div><div> <br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0g-&gt;ctrl_vq =3D virtio_get_queue(vdev, 0);<br>
=C2=A0 =C2=A0 =C2=A0g-&gt;cursor_vq =3D virtio_get_queue(vdev, 1);<br>
=C2=A0 =C2=A0 =C2=A0g-&gt;ctrl_bh =3D qemu_bh_new(virtio_gpu_ctrl_bh, g);<b=
r>
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.=
h<br>
index fae149235c..153f3364a9 100644<br>
--- a/include/hw/virtio/virtio-gpu.h<br>
+++ b/include/hw/virtio/virtio-gpu.h<br>
@@ -131,6 +131,13 @@ struct VirtIOGPUBaseClass {<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_UINT32(&quot;xres&quot;, _state, _conf.xres=
, 1024), \<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_UINT32(&quot;yres&quot;, _state, _conf.yres=
, 768)<br>
<br>
+typedef struct VGPUDMABuf {<br>
+=C2=A0 =C2=A0 QemuDmaBuf buf;<br>
+=C2=A0 =C2=A0 uint32_t x, y;<br>
+=C2=A0 =C2=A0 uint64_t dmabuf_id;<br>
+=C2=A0 =C2=A0 QTAILQ_ENTRY(VGPUDMABuf) next;<br>
+} VGPUDMABuf;<br>
+<br>
=C2=A0struct VirtIOGPU {<br>
=C2=A0 =C2=A0 =C2=A0VirtIOGPUBase parent_obj;<br>
<br>
@@ -161,6 +168,11 @@ struct VirtIOGPU {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t req_3d;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t bytes_3d;<br>
=C2=A0 =C2=A0 =C2=A0} stats;<br>
+<br>
+=C2=A0 =C2=A0 struct {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QTAILQ_HEAD(, VGPUDMABuf) bufs;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VGPUDMABuf *primary;<br>
+=C2=A0 =C2=A0 } dmabuf;<br>
=C2=A0};<br>
<br>
=C2=A0struct VhostUserGPU {<br>
-- <br>
2.26.2<br>
<br>
<br>
</blockquote></div><div><br></div><div>It would be worth doing a similar ch=
ange in vhost-user-gpu.<br></div><br>-- <br><div dir=3D"ltr" class=3D"gmail=
_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000003c206b05bc8988f5--

