Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A5A5A6144
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 12:59:43 +0200 (CEST)
Received: from localhost ([::1]:58498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSyy6-00034E-BC
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 06:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oSyuZ-0008JF-7c
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 06:56:08 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:39863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oSyuW-0000vb-AY
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 06:56:02 -0400
Received: by mail-lf1-x132.google.com with SMTP id p5so11838655lfc.6
 for <qemu-devel@nongnu.org>; Tue, 30 Aug 2022 03:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=xPjUNX+CSXVabqJt8HSXk/CaFzsVKOsS76J5qhdAb5I=;
 b=OVQiZrVUqH57QiHIsN+KYlOX68tHN2jiJvwNF0nl/W7LLuE+KogyGjAO5zQrwJNGBN
 FeLcXHgyvY/ljqVx1qyAmLLAUM1R/Qq5NdxSPZFHQx15r21vrobpJoQJXCC4Qu5fG2XY
 9yXf+GN4LTJbo1uHjzjtTieI5WdMUNJVADDVyq036qeFYn0pfwdspKfvqTfcQStqoUIs
 10ThYWyWbccbh/nRBpcAFz9XEWm4MfciBel7HFDrntzDZocxkNjnlerhAbXVB2nn7qm1
 EGHrbOdw+BqcN+i/Oi9IPlZH3UI+xjSY+MyV5WYQGU4lS7k1+zU+eUXUtM5phoj1NN4x
 Yzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=xPjUNX+CSXVabqJt8HSXk/CaFzsVKOsS76J5qhdAb5I=;
 b=G9FoNLbj06V/jfQGHEKGolmaKHyeurm5iRn32EUoNMMjvga4bkwQaXxV/HaooON2Pa
 GS9QjfXiRYkAT/Fl2me5900pkZTG4tOCXsnhtWXpRvOW9CZLFHPKknDK/fJfvPs0N1e+
 IQ7OP+JwF0gfTKLG5ihT3H/o/SUDE4iGfChG/CCmo2hCnXKJLFC8uBvRJ6XwwCTOG8mO
 fHiUq7F8BCR8yvpzQKuBRzsI9kx1mvbEFpGLpQRGfd8ci1la5bZSZsQYH3NUmZvkV3Ip
 Q2S6IhIx/VCP7WrnfRmPVXUhNuS0p2uEdx0tT5eBeXzYfwJFW9+RJyZS/IZ4D9ktJvzf
 NPRw==
X-Gm-Message-State: ACgBeo012+cYQJnVj1osdZYV7TUzXX1UpTpr+tJhKv9QMCbLOCsFc1Vi
 0Srnnd6eoQzJ/QZgnrfpCY6ynTX0oiBq6x6ld+g=
X-Google-Smtp-Source: AA6agR6ID5UACsTfE0fDXk8GmZ8ZOeIiWfOQlR/HdpfYlui4f9EVfs01yNacucke8LKzUDnInPRY2whw74mSBNLLt4A=
X-Received: by 2002:ac2:4f03:0:b0:48b:2179:5249 with SMTP id
 k3-20020ac24f03000000b0048b21795249mr8706033lfr.356.1661856956471; Tue, 30
 Aug 2022 03:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220829154058.524413-1-antonio.caggiano@collabora.com>
 <20220829154058.524413-5-antonio.caggiano@collabora.com>
In-Reply-To: <20220829154058.524413-5-antonio.caggiano@collabora.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 30 Aug 2022 14:55:44 +0400
Message-ID: <CAJ+F1CL1S1bTwyhKKuCj_YnR2Ke_pEq6Ajc5Sp=RMZz9eciC=A@mail.gmail.com>
Subject: Re: [PATCH 4/5] virtio-gpu: Handle resource blob commands
To: Antonio Caggiano <antonio.caggiano@collabora.com>
Cc: qemu-devel@nongnu.org, gert.wollny@collabora.com, 
 dmitry.osipenko@collabora.com, Gerd Hoffmann <kraxel@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000008edf5705e7733931"
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008edf5705e7733931
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Aug 29, 2022 at 7:44 PM Antonio Caggiano <
antonio.caggiano@collabora.com> wrote:

> Support BLOB resources creation by calling
> virgl_renderer_resource_create_blob.
>
> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  hw/display/virtio-gpu-virgl.c        | 169 +++++++++++++++++++++++++++
>  hw/display/virtio-gpu.c              |   8 +-
>  include/hw/virtio/virtio-gpu-bswap.h |  18 +++
>  include/hw/virtio/virtio-gpu.h       |   6 +
>  meson.build                          |   5 +
>  5 files changed, 202 insertions(+), 4 deletions(-)
>
> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.=
c
> index 73cb92c8d5..c4c2c31d76 100644
> --- a/hw/display/virtio-gpu-virgl.c
> +++ b/hw/display/virtio-gpu-virgl.c
> @@ -16,6 +16,8 @@
>  #include "trace.h"
>  #include "hw/virtio/virtio.h"
>  #include "hw/virtio/virtio-gpu.h"
> +#include "hw/virtio/virtio-gpu-bswap.h"
> +#include "hw/virtio/virtio-iommu.h"
>
>  #include <virglrenderer.h>
>
> @@ -398,6 +400,162 @@ static void virgl_cmd_get_capset(VirtIOGPU *g,
>      g_free(resp);
>  }
>
> +#ifdef HAVE_VIRGL_RESOURCE_BLOB
> +
> +static void virgl_cmd_resource_create_blob(VirtIOGPU *g,
> +                                           struct virtio_gpu_ctrl_comman=
d
> *cmd)
> +{
> +    struct virtio_gpu_simple_resource *res;
> +    struct virtio_gpu_resource_create_blob cblob;
> +    int ret;
> +
> +    VIRTIO_GPU_FILL_CMD(cblob);
> +    virtio_gpu_create_blob_bswap(&cblob);
> +    trace_virtio_gpu_cmd_res_create_blob(cblob.resource_id, cblob.size);
> +
> +    if (cblob.resource_id =3D=3D 0) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not
> allowed\n",
> +                      __func__);
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    res =3D virtio_gpu_find_resource(g, cblob.resource_id);
> +    if (res) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already exists %d\n=
",
> +                      __func__, cblob.resource_id);
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    res =3D g_new0(struct virtio_gpu_simple_resource, 1);
> +    res->resource_id =3D cblob.resource_id;
> +    res->blob_size =3D cblob.size;
> +
> +    if (res->iov) {
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_UNSPEC;
>

res is leaked


> +        return;
> +    }
> +
> +    if (cblob.blob_mem !=3D VIRTIO_GPU_BLOB_MEM_HOST3D) {
> +        ret =3D virtio_gpu_create_mapping_iov(g, cblob.nr_entries,
> sizeof(cblob),
> +                                            cmd, &res->addrs, &res->iov,
> +                                            &res->iov_cnt);
> +        if (ret !=3D 0) {
> +            cmd->error =3D VIRTIO_GPU_RESP_ERR_UNSPEC;
>

same


> +            return;
> +        }
> +    }
> +
> +    if (cblob.blob_mem =3D=3D VIRTIO_GPU_BLOB_MEM_GUEST) {
> +        virtio_gpu_init_udmabuf(res);
>

I wonder what happens when the command fails, but this is ignored by
virtio_gpu_resource_create_blob as well, ok.


> +    }
> +    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
> +
> +    const struct virgl_renderer_resource_create_blob_args virgl_args =3D=
 {
> +        .res_handle =3D cblob.resource_id,
> +        .ctx_id =3D cblob.hdr.ctx_id,
> +        .blob_mem =3D cblob.blob_mem,
> +        .blob_id =3D cblob.blob_id,
> +        .blob_flags =3D cblob.blob_flags,
> +        .size =3D cblob.size,
> +        .iovecs =3D res->iov,
> +        .num_iovs =3D res->iov_cnt,
> +    };
> +    ret =3D virgl_renderer_resource_create_blob(&virgl_args);
> +    if (ret) {
> +        g_print("Virgl blob create error: %s\n", strerror(-ret));
>

why g_print?  If not qemu_log_mask, then warn_report() perhaps?



> +    }
> +}
> +
> +static void virgl_cmd_resource_map_blob(VirtIOGPU *g,
> +                                        struct virtio_gpu_ctrl_command
> *cmd)
> +{
> +    struct virtio_gpu_simple_resource *res;
> +    struct virtio_gpu_resource_map_blob mblob;
> +    int ret;
> +    void *data;
> +    uint64_t size;
> +    struct virtio_gpu_resp_map_info resp;
> +
> +    VIRTIO_GPU_FILL_CMD(mblob);
> +    virtio_gpu_map_blob_bswap(&mblob);
> +
> +    if (mblob.resource_id =3D=3D 0) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not
> allowed\n",
> +                      __func__);
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    res =3D virtio_gpu_find_resource(g, mblob.resource_id);
> +    if (!res) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource does not exist %d\n=
",
> +                      __func__, mblob.resource_id);
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    ret =3D virgl_renderer_resource_map(res->resource_id, &data, &size);
> +    if (ret) {
> +        g_print("Virgl blob resource map error: %s\n", strerror(-ret));
>

same about g_print


> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    memory_region_init_ram_device_ptr(&res->region, OBJECT(g), NULL,
> size, data);
> +    memory_region_add_subregion(&g->parent_obj.hostmem, mblob.offset,
> &res->region);
> +    memory_region_set_enabled(&res->region, true);
> +
> +    memset(&resp, 0, sizeof(resp));
> +    resp.hdr.type =3D VIRTIO_GPU_RESP_OK_MAP_INFO;
> +    virgl_renderer_resource_get_map_info(mblob.resource_id,
> &resp.map_info);
> +    virtio_gpu_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
> +
> +    res->mapped =3D true;
> +}
> +
> +static void virgl_cmd_resource_unmap_blob(VirtIOGPU *g,
> +                                        struct virtio_gpu_ctrl_command
> *cmd)
> +{
> +    struct virtio_gpu_simple_resource *res;
> +    struct virtio_gpu_resource_unmap_blob ublob;
> +    VIRTIO_GPU_FILL_CMD(ublob);
> +    virtio_gpu_unmap_blob_bswap(&ublob);
> +
> +    if (ublob.resource_id =3D=3D 0) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not
> allowed\n",
> +                      __func__);
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    res =3D virtio_gpu_find_resource(g, ublob.resource_id);
> +    if (!res) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource does not exist %d\n=
",
> +                      __func__, ublob.resource_id);
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    if (!res->mapped) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already unmapped
> %d\n",
> +                      __func__, ublob.resource_id);
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    memory_region_set_enabled(&res->region, false);
> +    memory_region_del_subregion(&g->parent_obj.hostmem, &res->region);
> +    object_unparent(OBJECT(&res->region));
> +
> +    virgl_renderer_resource_unmap(ublob.resource_id);
>


Shouldn't the mapped resources be unmap during unrealize?


> +
> +    res->mapped =3D false;
> +}
> +
> +#endif /* HAVE_VIRGL_RESOURCE_BLOB */
> +
>  void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
>                                        struct virtio_gpu_ctrl_command *cm=
d)
>  {
> @@ -464,6 +622,17 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
>      case VIRTIO_GPU_CMD_GET_EDID:
>          virtio_gpu_get_edid(g, cmd);
>          break;
> +#ifdef HAVE_VIRGL_RESOURCE_BLOB
> +    case VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB:
> +        virgl_cmd_resource_create_blob(g, cmd);
> +        break;
> +    case VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB:
> +        virgl_cmd_resource_map_blob(g, cmd);
> +        break;
> +    case VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB:
> +        virgl_cmd_resource_unmap_blob(g, cmd);
> +        break;
> +#endif /* HAVE_VIRGL_RESOURCE_BLOB */
>      default:
>          cmd->error =3D VIRTIO_GPU_RESP_ERR_UNSPEC;
>          break;
> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index 506b3b8eef..527c0aeede 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -33,8 +33,6 @@
>
>  #define VIRTIO_GPU_VM_VERSION 1
>
> -static struct virtio_gpu_simple_resource*
> -virtio_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id);
>  static struct virtio_gpu_simple_resource *
>  virtio_gpu_find_check_resource(VirtIOGPU *g, uint32_t resource_id,
>                                 bool require_backing,
> @@ -115,7 +113,7 @@ static void update_cursor(VirtIOGPU *g, struct
> virtio_gpu_update_cursor *cursor)
>                    cursor->resource_id ? 1 : 0);
>  }
>
> -static struct virtio_gpu_simple_resource *
> +struct virtio_gpu_simple_resource *
>  virtio_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id)
>  {
>      struct virtio_gpu_simple_resource *res;
> @@ -1323,10 +1321,12 @@ void virtio_gpu_device_realize(DeviceState *qdev,
> Error **errp)
>              return;
>          }
>
> +#ifndef HAVE_VIRGL_RESOURCE_BLOB
>          if (virtio_gpu_virgl_enabled(g->parent_obj.conf)) {
> -            error_setg(errp, "blobs and virgl are not compatible (yet)")=
;
> +            error_setg(errp, "Linked virglrenderer does not support blob
> resources");
>              return;
>          }
> +#endif
>      }
>
>      if (!virtio_gpu_base_device_realize(qdev,
> diff --git a/include/hw/virtio/virtio-gpu-bswap.h
> b/include/hw/virtio/virtio-gpu-bswap.h
> index 9124108485..dd1975e2d4 100644
> --- a/include/hw/virtio/virtio-gpu-bswap.h
> +++ b/include/hw/virtio/virtio-gpu-bswap.h
> @@ -63,10 +63,28 @@ virtio_gpu_create_blob_bswap(struct
> virtio_gpu_resource_create_blob *cblob)
>  {
>      virtio_gpu_ctrl_hdr_bswap(&cblob->hdr);
>      le32_to_cpus(&cblob->resource_id);
> +    le32_to_cpus(&cblob->blob_mem);
>      le32_to_cpus(&cblob->blob_flags);
> +    le32_to_cpus(&cblob->nr_entries);
> +    le64_to_cpus(&cblob->blob_id);
>      le64_to_cpus(&cblob->size);
>  }
>
> +static inline void
> +virtio_gpu_map_blob_bswap(struct virtio_gpu_resource_map_blob *mblob)
> +{
> +    virtio_gpu_ctrl_hdr_bswap(&mblob->hdr);
> +    le32_to_cpus(&mblob->resource_id);
> +    le64_to_cpus(&mblob->offset);
> +}
> +
> +static inline void
> +virtio_gpu_unmap_blob_bswap(struct virtio_gpu_resource_unmap_blob *ublob=
)
> +{
> +    virtio_gpu_ctrl_hdr_bswap(&ublob->hdr);
> +    le32_to_cpus(&ublob->resource_id);
> +}
> +
>  static inline void
>  virtio_gpu_scanout_blob_bswap(struct virtio_gpu_set_scanout_blob *ssb)
>  {
> diff --git a/include/hw/virtio/virtio-gpu.h
> b/include/hw/virtio/virtio-gpu.h
> index eafce75b04..4f4cabf3b3 100644
> --- a/include/hw/virtio/virtio-gpu.h
> +++ b/include/hw/virtio/virtio-gpu.h
> @@ -55,6 +55,9 @@ struct virtio_gpu_simple_resource {
>      int dmabuf_fd;
>      uint8_t *remapped;
>
> +    MemoryRegion region;
> +    bool mapped;
> +
>      QTAILQ_ENTRY(virtio_gpu_simple_resource) next;
>  };
>
> @@ -245,6 +248,9 @@ void virtio_gpu_base_fill_display_info(VirtIOGPUBase
> *g,
>                          struct virtio_gpu_resp_display_info *dpy_info);
>
>  /* virtio-gpu.c */
> +struct virtio_gpu_simple_resource *
> +virtio_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id);
> +
>  void virtio_gpu_ctrl_response(VirtIOGPU *g,
>                                struct virtio_gpu_ctrl_command *cmd,
>                                struct virtio_gpu_ctrl_hdr *resp,
> diff --git a/meson.build b/meson.build
> index 20fddbd707..058fe03fd7 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -718,6 +718,11 @@ if not get_option('virglrenderer').auto() or
> have_system or have_vhost_user_gpu
>                       method: 'pkg-config',
>                       required: get_option('virglrenderer'),
>                       kwargs: static_kwargs)
> +
> +  config_host_data.set('HAVE_VIRGL_RESOURCE_BLOB',
> +
>  cc.has_function('virgl_renderer_resource_create_blob',
> +                                       prefix: '#include
> <virglrenderer.h>',
> +                                       dependencies: virgl))
>  endif
>  curl =3D not_found
>  if not get_option('curl').auto() or have_block
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000008edf5705e7733931
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 29, 2022 at 7:44 PM Ant=
onio Caggiano &lt;<a href=3D"mailto:antonio.caggiano@collabora.com">antonio=
.caggiano@collabora.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Support BLOB resources creation by calling virgl_ren=
derer_resource_create_blob.<br>
<br>
Signed-off-by: Antonio Caggiano &lt;<a href=3D"mailto:antonio.caggiano@coll=
abora.com" target=3D"_blank">antonio.caggiano@collabora.com</a>&gt;<br>
Signed-off-by: Dmitry Osipenko &lt;<a href=3D"mailto:dmitry.osipenko@collab=
ora.com" target=3D"_blank">dmitry.osipenko@collabora.com</a>&gt;<br>
---<br>
=C2=A0hw/display/virtio-gpu-virgl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 169 ++++++=
+++++++++++++++++++++<br>
=C2=A0hw/display/virtio-gpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A08 +-<br>
=C2=A0include/hw/virtio/virtio-gpu-bswap.h |=C2=A0 18 +++<br>
=C2=A0include/hw/virtio/virtio-gpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A06 +<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 +<br>
=C2=A05 files changed, 202 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c<=
br>
index 73cb92c8d5..c4c2c31d76 100644<br>
--- a/hw/display/virtio-gpu-virgl.c<br>
+++ b/hw/display/virtio-gpu-virgl.c<br>
@@ -16,6 +16,8 @@<br>
=C2=A0#include &quot;trace.h&quot;<br>
=C2=A0#include &quot;hw/virtio/virtio.h&quot;<br>
=C2=A0#include &quot;hw/virtio/virtio-gpu.h&quot;<br>
+#include &quot;hw/virtio/virtio-gpu-bswap.h&quot;<br>
+#include &quot;hw/virtio/virtio-iommu.h&quot;<br>
<br>
=C2=A0#include &lt;virglrenderer.h&gt;<br>
<br>
@@ -398,6 +400,162 @@ static void virgl_cmd_get_capset(VirtIOGPU *g,<br>
=C2=A0 =C2=A0 =C2=A0g_free(resp);<br>
=C2=A0}<br>
<br>
+#ifdef HAVE_VIRGL_RESOURCE_BLOB<br>
+<br>
+static void virgl_cmd_resource_create_blob(VirtIOGPU *g,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0struct virtio_gpu_ctrl_command *cmd)<br>
+{<br>
+=C2=A0 =C2=A0 struct virtio_gpu_simple_resource *res;<br>
+=C2=A0 =C2=A0 struct virtio_gpu_resource_create_blob cblob;<br>
+=C2=A0 =C2=A0 int ret;<br>
+<br>
+=C2=A0 =C2=A0 VIRTIO_GPU_FILL_CMD(cblob);<br>
+=C2=A0 =C2=A0 virtio_gpu_create_blob_bswap(&amp;cblob);<br>
+=C2=A0 =C2=A0 trace_virtio_gpu_cmd_res_create_blob(cblob.resource_id, cblo=
b.size);<br>
+<br>
+=C2=A0 =C2=A0 if (cblob.resource_id =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: resou=
rce id 0 is not allowed\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd-&gt;error =3D VIRTIO_GPU_RESP_ERR_INVALID_=
RESOURCE_ID;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 res =3D virtio_gpu_find_resource(g, cblob.resource_id);<br>
+=C2=A0 =C2=A0 if (res) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: resou=
rce already exists %d\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__, cblob.resource_id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd-&gt;error =3D VIRTIO_GPU_RESP_ERR_INVALID_=
RESOURCE_ID;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 res =3D g_new0(struct virtio_gpu_simple_resource, 1);<br>
+=C2=A0 =C2=A0 res-&gt;resource_id =3D cblob.resource_id;<br>
+=C2=A0 =C2=A0 res-&gt;blob_size =3D cblob.size;<br>
+<br>
+=C2=A0 =C2=A0 if (res-&gt;iov) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd-&gt;error =3D VIRTIO_GPU_RESP_ERR_UNSPEC;<=
br></blockquote><div><br></div><div>res is leaked</div><div>=C2=A0<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (cblob.blob_mem !=3D VIRTIO_GPU_BLOB_MEM_HOST3D) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D virtio_gpu_create_mapping_iov(g, cblob=
.nr_entries, sizeof(cblob),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 cmd, &amp;res-&gt;addrs, &amp;res-&gt;iov,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &amp;res-&gt;iov_cnt);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd-&gt;error =3D VIRTIO_GPU_RES=
P_ERR_UNSPEC;<br></blockquote><div><br></div><div>same</div><div>=C2=A0<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (cblob.blob_mem =3D=3D VIRTIO_GPU_BLOB_MEM_GUEST) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_gpu_init_udmabuf(res);<br>
</blockquote><div><br></div><div>I wonder what happens when the command fai=
ls, but this is ignored by virtio_gpu_resource_create_blob as well, ok.<br>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+=
=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 QTAILQ_INSERT_HEAD(&amp;g-&gt;reslist, res, next);<br>
+<br>
+=C2=A0 =C2=A0 const struct virgl_renderer_resource_create_blob_args virgl_=
args =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .res_handle =3D cblob.resource_id,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .ctx_id =3D cblob.hdr.ctx_id,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .blob_mem =3D cblob.blob_mem,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .blob_id =3D cblob.blob_id,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .blob_flags =3D cblob.blob_flags,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .size =3D cblob.size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .iovecs =3D res-&gt;iov,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .num_iovs =3D res-&gt;iov_cnt,<br>
+=C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 ret =3D virgl_renderer_resource_create_blob(&amp;virgl_args)=
;<br>
+=C2=A0 =C2=A0 if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_print(&quot;Virgl blob create error: %s\n&qu=
ot;, strerror(-ret));<br></blockquote><div><br></div><div>why g_print?=C2=
=A0 If not qemu_log_mask, then warn_report() perhaps?</div><div><br></div><=
div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void virgl_cmd_resource_map_blob(VirtIOGPU *g,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct v=
irtio_gpu_ctrl_command *cmd)<br>
+{<br>
+=C2=A0 =C2=A0 struct virtio_gpu_simple_resource *res;<br>
+=C2=A0 =C2=A0 struct virtio_gpu_resource_map_blob mblob;<br>
+=C2=A0 =C2=A0 int ret;<br>
+=C2=A0 =C2=A0 void *data;<br>
+=C2=A0 =C2=A0 uint64_t size;<br>
+=C2=A0 =C2=A0 struct virtio_gpu_resp_map_info resp;<br>
+<br>
+=C2=A0 =C2=A0 VIRTIO_GPU_FILL_CMD(mblob);<br>
+=C2=A0 =C2=A0 virtio_gpu_map_blob_bswap(&amp;mblob);<br>
+<br>
+=C2=A0 =C2=A0 if (mblob.resource_id =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: resou=
rce id 0 is not allowed\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd-&gt;error =3D VIRTIO_GPU_RESP_ERR_INVALID_=
RESOURCE_ID;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 res =3D virtio_gpu_find_resource(g, mblob.resource_id);<br>
+=C2=A0 =C2=A0 if (!res) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: resou=
rce does not exist %d\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__, mblob.resource_id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd-&gt;error =3D VIRTIO_GPU_RESP_ERR_INVALID_=
RESOURCE_ID;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 ret =3D virgl_renderer_resource_map(res-&gt;resource_id, &am=
p;data, &amp;size);<br>
+=C2=A0 =C2=A0 if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_print(&quot;Virgl blob resource map error: %=
s\n&quot;, strerror(-ret));<br></blockquote><div><br></div><div>same about =
g_print</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd-&gt;error =3D VIRTIO_GPU_RESP_ERR_INVALID_=
RESOURCE_ID;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 memory_region_init_ram_device_ptr(&amp;res-&gt;region, OBJEC=
T(g), NULL, size, data);<br>
+=C2=A0 =C2=A0 memory_region_add_subregion(&amp;g-&gt;parent_obj.hostmem, m=
blob.offset, &amp;res-&gt;region);<br>
+=C2=A0 =C2=A0 memory_region_set_enabled(&amp;res-&gt;region, true);<br>
+<br>
+=C2=A0 =C2=A0 memset(&amp;resp, 0, sizeof(resp));<br>
+=C2=A0 =C2=A0 resp.hdr.type =3D VIRTIO_GPU_RESP_OK_MAP_INFO;<br>
+=C2=A0 =C2=A0 virgl_renderer_resource_get_map_info(mblob.resource_id, &amp=
;resp.map_info);<br>
+=C2=A0 =C2=A0 virtio_gpu_ctrl_response(g, cmd, &amp;resp.hdr, sizeof(resp)=
);<br>
+<br>
+=C2=A0 =C2=A0 res-&gt;mapped =3D true;<br>
+}<br>
+<br>
+static void virgl_cmd_resource_unmap_blob(VirtIOGPU *g,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct v=
irtio_gpu_ctrl_command *cmd)<br>
+{<br>
+=C2=A0 =C2=A0 struct virtio_gpu_simple_resource *res;<br>
+=C2=A0 =C2=A0 struct virtio_gpu_resource_unmap_blob ublob;<br>
+=C2=A0 =C2=A0 VIRTIO_GPU_FILL_CMD(ublob);<br>
+=C2=A0 =C2=A0 virtio_gpu_unmap_blob_bswap(&amp;ublob);<br>
+<br>
+=C2=A0 =C2=A0 if (ublob.resource_id =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: resou=
rce id 0 is not allowed\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd-&gt;error =3D VIRTIO_GPU_RESP_ERR_INVALID_=
RESOURCE_ID;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 res =3D virtio_gpu_find_resource(g, ublob.resource_id);<br>
+=C2=A0 =C2=A0 if (!res) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: resou=
rce does not exist %d\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__, ublob.resource_id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd-&gt;error =3D VIRTIO_GPU_RESP_ERR_INVALID_=
RESOURCE_ID;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (!res-&gt;mapped) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: resou=
rce already unmapped %d\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__, ublob.resource_id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd-&gt;error =3D VIRTIO_GPU_RESP_ERR_INVALID_=
RESOURCE_ID;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 memory_region_set_enabled(&amp;res-&gt;region, false);<br>
+=C2=A0 =C2=A0 memory_region_del_subregion(&amp;g-&gt;parent_obj.hostmem, &=
amp;res-&gt;region);<br>
+=C2=A0 =C2=A0 object_unparent(OBJECT(&amp;res-&gt;region));<br>
+<br>
+=C2=A0 =C2=A0 virgl_renderer_resource_unmap(ublob.resource_id);<br></block=
quote><div><br></div><div><br></div><div>Shouldn&#39;t the mapped resources=
 be unmap during unrealize?</div><div>=C2=A0<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 res-&gt;mapped =3D false;<br>
+}<br>
+<br>
+#endif /* HAVE_VIRGL_RESOURCE_BLOB */<br>
+<br>
=C2=A0void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct vi=
rtio_gpu_ctrl_command *cmd)<br>
=C2=A0{<br>
@@ -464,6 +622,17 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,<br>
=C2=A0 =C2=A0 =C2=A0case VIRTIO_GPU_CMD_GET_EDID:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virtio_gpu_get_edid(g, cmd);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+#ifdef HAVE_VIRGL_RESOURCE_BLOB<br>
+=C2=A0 =C2=A0 case VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 virgl_cmd_resource_create_blob(g, cmd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 virgl_cmd_resource_map_blob(g, cmd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 virgl_cmd_resource_unmap_blob(g, cmd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+#endif /* HAVE_VIRGL_RESOURCE_BLOB */<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd-&gt;error =3D VIRTIO_GPU_RESP_ERR_UNS=
PEC;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c<br>
index 506b3b8eef..527c0aeede 100644<br>
--- a/hw/display/virtio-gpu.c<br>
+++ b/hw/display/virtio-gpu.c<br>
@@ -33,8 +33,6 @@<br>
<br>
=C2=A0#define VIRTIO_GPU_VM_VERSION 1<br>
<br>
-static struct virtio_gpu_simple_resource*<br>
-virtio_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id);<br>
=C2=A0static struct virtio_gpu_simple_resource *<br>
=C2=A0virtio_gpu_find_check_resource(VirtIOGPU *g, uint32_t resource_id,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool require_backing,<br>
@@ -115,7 +113,7 @@ static void update_cursor(VirtIOGPU *g, struct virtio_g=
pu_update_cursor *cursor)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cursor=
-&gt;resource_id ? 1 : 0);<br>
=C2=A0}<br>
<br>
-static struct virtio_gpu_simple_resource *<br>
+struct virtio_gpu_simple_resource *<br>
=C2=A0virtio_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0struct virtio_gpu_simple_resource *res;<br>
@@ -1323,10 +1321,12 @@ void virtio_gpu_device_realize(DeviceState *qdev, E=
rror **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
+#ifndef HAVE_VIRGL_RESOURCE_BLOB<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (virtio_gpu_virgl_enabled(g-&gt;parent=
_obj.conf)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;blobs and=
 virgl are not compatible (yet)&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Linked vi=
rglrenderer does not support blob resources&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!virtio_gpu_base_device_realize(qdev,<br>
diff --git a/include/hw/virtio/virtio-gpu-bswap.h b/include/hw/virtio/virti=
o-gpu-bswap.h<br>
index 9124108485..dd1975e2d4 100644<br>
--- a/include/hw/virtio/virtio-gpu-bswap.h<br>
+++ b/include/hw/virtio/virtio-gpu-bswap.h<br>
@@ -63,10 +63,28 @@ virtio_gpu_create_blob_bswap(struct virtio_gpu_resource=
_create_blob *cblob)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0virtio_gpu_ctrl_hdr_bswap(&amp;cblob-&gt;hdr);<br>
=C2=A0 =C2=A0 =C2=A0le32_to_cpus(&amp;cblob-&gt;resource_id);<br>
+=C2=A0 =C2=A0 le32_to_cpus(&amp;cblob-&gt;blob_mem);<br>
=C2=A0 =C2=A0 =C2=A0le32_to_cpus(&amp;cblob-&gt;blob_flags);<br>
+=C2=A0 =C2=A0 le32_to_cpus(&amp;cblob-&gt;nr_entries);<br>
+=C2=A0 =C2=A0 le64_to_cpus(&amp;cblob-&gt;blob_id);<br>
=C2=A0 =C2=A0 =C2=A0le64_to_cpus(&amp;cblob-&gt;size);<br>
=C2=A0}<br>
<br>
+static inline void<br>
+virtio_gpu_map_blob_bswap(struct virtio_gpu_resource_map_blob *mblob)<br>
+{<br>
+=C2=A0 =C2=A0 virtio_gpu_ctrl_hdr_bswap(&amp;mblob-&gt;hdr);<br>
+=C2=A0 =C2=A0 le32_to_cpus(&amp;mblob-&gt;resource_id);<br>
+=C2=A0 =C2=A0 le64_to_cpus(&amp;mblob-&gt;offset);<br>
+}<br>
+<br>
+static inline void<br>
+virtio_gpu_unmap_blob_bswap(struct virtio_gpu_resource_unmap_blob *ublob)<=
br>
+{<br>
+=C2=A0 =C2=A0 virtio_gpu_ctrl_hdr_bswap(&amp;ublob-&gt;hdr);<br>
+=C2=A0 =C2=A0 le32_to_cpus(&amp;ublob-&gt;resource_id);<br>
+}<br>
+<br>
=C2=A0static inline void<br>
=C2=A0virtio_gpu_scanout_blob_bswap(struct virtio_gpu_set_scanout_blob *ssb=
)<br>
=C2=A0{<br>
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.=
h<br>
index eafce75b04..4f4cabf3b3 100644<br>
--- a/include/hw/virtio/virtio-gpu.h<br>
+++ b/include/hw/virtio/virtio-gpu.h<br>
@@ -55,6 +55,9 @@ struct virtio_gpu_simple_resource {<br>
=C2=A0 =C2=A0 =C2=A0int dmabuf_fd;<br>
=C2=A0 =C2=A0 =C2=A0uint8_t *remapped;<br>
<br>
+=C2=A0 =C2=A0 MemoryRegion region;<br>
+=C2=A0 =C2=A0 bool mapped;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0QTAILQ_ENTRY(virtio_gpu_simple_resource) next;<br>
=C2=A0};<br>
<br>
@@ -245,6 +248,9 @@ void virtio_gpu_base_fill_display_info(VirtIOGPUBase *g=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0struct virtio_gpu_resp_display_info *dpy_info);<br>
<br>
=C2=A0/* virtio-gpu.c */<br>
+struct virtio_gpu_simple_resource *<br>
+virtio_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id);<br>
+<br>
=C2=A0void virtio_gpu_ctrl_response(VirtIOGPU *g,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_ctrl_command *cmd,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_ctrl_hdr *resp,<br>
diff --git a/meson.build b/meson.build<br>
index 20fddbd707..058fe03fd7 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -718,6 +718,11 @@ if not get_option(&#39;virglrenderer&#39;).auto() or h=
ave_system or have_vhost_user_gpu<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 method: &#39;pkg-config&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 required: get_option(&#39;virglrenderer&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kwargs: static_kwargs)<br>
+<br>
+=C2=A0 config_host_data.set(&#39;HAVE_VIRGL_RESOURCE_BLOB&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0cc.has_function(&#39;virgl_renderer_resource_create_blob&#39;,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prefix: &=
#39;#include &lt;virglrenderer.h&gt;&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dependenc=
ies: virgl))<br>
=C2=A0endif<br>
=C2=A0curl =3D not_found<br>
=C2=A0if not get_option(&#39;curl&#39;).auto() or have_block<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000008edf5705e7733931--

