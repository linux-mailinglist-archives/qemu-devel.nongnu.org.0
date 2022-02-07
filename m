Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 536EB4AC1E3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 15:53:03 +0100 (CET)
Received: from localhost ([::1]:60418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH5O2-0001sO-FF
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 09:53:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nH4oE-0001pi-Lb
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 09:16:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nH4oB-0004Pt-2x
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 09:16:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644243358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nrkVjdO1LDIiRZt7W4IshryT6F86q70qwwqB4ZrCmgo=;
 b=OBx70tp+xi99z7LhTawHT7+7H7yWhw/ZsR9Hb+l2sMfNW2lZwwrP/hSAFzFFdCqK2nZ87u
 qgf6zrIg6SbWkJuxfGEhGtTmquklETrC8SES6QlzY1t7M4I2FYXDD6qbqeckVJuCfcC2W7
 Cobu2Oz4GODMZJxIt6T3j/azUH5kgso=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-oKhruE2_Pwa00VW839MLsw-1; Mon, 07 Feb 2022 09:15:54 -0500
X-MC-Unique: oKhruE2_Pwa00VW839MLsw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83FF883DEA8;
 Mon,  7 Feb 2022 14:15:53 +0000 (UTC)
Received: from localhost (unknown [10.39.194.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CAF57DE21;
 Mon,  7 Feb 2022 14:15:52 +0000 (UTC)
Date: Mon, 7 Feb 2022 14:15:50 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [PATCH 3/5] vduse-blk: implements vduse-blk export
Message-ID: <YgEplgqZ9JWVPvEc@stefanha-x1.localdomain>
References: <20220125131800.91-1-xieyongji@bytedance.com>
 <20220125131800.91-4-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="h/by6pWcdyScrsTh"
Content-Disposition: inline
In-Reply-To: <20220125131800.91-4-xieyongji@bytedance.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 jasowang@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 mlureau@redhat.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--h/by6pWcdyScrsTh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2022 at 09:17:58PM +0800, Xie Yongji wrote:
> This implements a VDUSE block backends based on
> the libvduse library. We can use it to export the BDSs
> for both VM and container (host) usage.
>=20
> The new command-line syntax is:
>=20
> $ qemu-storage-daemon \
>     --blockdev file,node-name=3Ddrive0,filename=3Dtest.img \
>     --export vduse-blk,node-name=3Ddrive0,id=3Dvduse-export0,writable=3Don
>=20
> After the qemu-storage-daemon started, we need to use
> the "vdpa" command to attach the device to vDPA bus:
>=20
> $ vdpa dev add name vduse-export0 mgmtdev vduse
>=20
> Also the device must be removed via the "vdpa" command
> before we stop the qemu-storage-daemon.
>=20
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> ---
>  block/export/export.c         |   6 +
>  block/export/meson.build      |   5 +
>  block/export/vduse-blk.c      | 427 ++++++++++++++++++++++++++++++++++
>  block/export/vduse-blk.h      |  20 ++
>  meson.build                   |  13 ++
>  meson_options.txt             |   2 +
>  qapi/block-export.json        |  24 +-
>  scripts/meson-buildoptions.sh |   4 +
>  8 files changed, 499 insertions(+), 2 deletions(-)
>  create mode 100644 block/export/vduse-blk.c
>  create mode 100644 block/export/vduse-blk.h
>=20
> diff --git a/block/export/export.c b/block/export/export.c
> index 6d3b9964c8..00dd505540 100644
> --- a/block/export/export.c
> +++ b/block/export/export.c
> @@ -26,6 +26,9 @@
>  #ifdef CONFIG_VHOST_USER_BLK_SERVER
>  #include "vhost-user-blk-server.h"
>  #endif
> +#ifdef CONFIG_VDUSE_BLK_EXPORT
> +#include "vduse-blk.h"
> +#endif
> =20
>  static const BlockExportDriver *blk_exp_drivers[] =3D {
>      &blk_exp_nbd,
> @@ -35,6 +38,9 @@ static const BlockExportDriver *blk_exp_drivers[] =3D {
>  #ifdef CONFIG_FUSE
>      &blk_exp_fuse,
>  #endif
> +#ifdef CONFIG_VDUSE_BLK_EXPORT
> +    &blk_exp_vduse_blk,
> +#endif
>  };
> =20
>  /* Only accessed from the main thread */
> diff --git a/block/export/meson.build b/block/export/meson.build
> index 0a08e384c7..cf311d2b1b 100644
> --- a/block/export/meson.build
> +++ b/block/export/meson.build
> @@ -5,3 +5,8 @@ if have_vhost_user_blk_server
>  endif
> =20
>  blockdev_ss.add(when: fuse, if_true: files('fuse.c'))
> +
> +if have_vduse_blk_export
> +    blockdev_ss.add(files('vduse-blk.c'))
> +    blockdev_ss.add(libvduse)
> +endif
> diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
> new file mode 100644
> index 0000000000..5a8d289685
> --- /dev/null
> +++ b/block/export/vduse-blk.c
> @@ -0,0 +1,427 @@
> +/*
> + * Export QEMU block device via VDUSE
> + *
> + * Copyright (C) 2022 Bytedance Inc. and/or its affiliates. All rights r=
eserved.
> + *   Portions of codes and concepts borrowed from vhost-user-blk-server.=
c, so:
> + *     Copyright (c) 2020 Red Hat, Inc.
> + *
> + * Author:
> + *   Xie Yongji <xieyongji@bytedance.com>
> + *   Coiby Xu <coiby.xu@gmail.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> + * later.  See the COPYING file in the top-level directory.
> + */
> +
> +#include <sys/eventfd.h>
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "sysemu/block-backend.h"
> +#include "block/export.h"
> +#include "qemu/error-report.h"
> +#include "util/block-helpers.h"
> +#include "subprojects/libvduse/libvduse.h"
> +
> +#include "standard-headers/linux/virtio_ring.h"
> +#include "standard-headers/linux/virtio_blk.h"
> +
> +#define VIRTIO_BLK_SECTOR_BITS 9
> +#define VIRTIO_BLK_SECTOR_SIZE (1ULL << VIRTIO_BLK_SECTOR_BITS)
> +
> +#define VDUSE_DEFAULT_NUM_QUEUE 1
> +#define VDUSE_DEFAULT_QUEUE_SIZE 128

QEMU's virtio-blk emulation has increased this limit to 256 for better
performance with large block size I/O patterns. I think it would be okay
to increase it here too.

> +
> +typedef struct VduseBlkExport {
> +    BlockExport export;
> +    VduseDev *dev;
> +    uint16_t num_queues;
> +    uint32_t blk_size;
> +    bool writable;
> +} VduseBlkExport;
> +
> +struct virtio_blk_inhdr {
> +    unsigned char status;
> +};
> +
> +typedef struct VduseBlkReq {
> +    VduseVirtqElement elem;
> +    int64_t sector_num;
> +    size_t in_len;
> +    struct virtio_blk_inhdr *in;
> +    struct virtio_blk_outhdr out;
> +    VduseVirtq *vq;
> +} VduseBlkReq;
> +
> +static void vduse_blk_req_complete(VduseBlkReq *req)
> +{
> +    vduse_queue_push(req->vq, &req->elem, req->in_len);
> +    vduse_queue_notify(req->vq);
> +
> +    free(req);
> +}
> +
> +static bool vduse_blk_sect_range_ok(VduseBlkExport *vblk_exp,
> +                                    uint64_t sector, size_t size)
> +{
> +    uint64_t nb_sectors;
> +    uint64_t total_sectors;
> +
> +    if (size % VIRTIO_BLK_SECTOR_SIZE) {
> +        return false;
> +    }
> +
> +    nb_sectors =3D size >> VIRTIO_BLK_SECTOR_BITS;
> +
> +    QEMU_BUILD_BUG_ON(BDRV_SECTOR_SIZE !=3D VIRTIO_BLK_SECTOR_SIZE);
> +    if (nb_sectors > BDRV_REQUEST_MAX_SECTORS) {
> +        return false;
> +    }
> +    if ((sector << VIRTIO_BLK_SECTOR_BITS) % vblk_exp->blk_size) {
> +        return false;
> +    }
> +    blk_get_geometry(vblk_exp->export.blk, &total_sectors);
> +    if (sector > total_sectors || nb_sectors > total_sectors - sector) {
> +        return false;
> +    }
> +    return true;
> +}
> +
> +static void coroutine_fn vduse_blk_virtio_process_req(void *opaque)
> +{
> +    VduseBlkReq *req =3D opaque;
> +    VduseVirtq *vq =3D req->vq;
> +    VduseDev *dev =3D vduse_queue_get_dev(vq);
> +    VduseBlkExport *vblk_exp =3D vduse_dev_get_priv(dev);
> +    BlockBackend *blk =3D vblk_exp->export.blk;
> +    VduseVirtqElement *elem =3D &req->elem;
> +    struct iovec *in_iov =3D elem->in_sg;
> +    struct iovec *out_iov =3D elem->out_sg;
> +    unsigned in_num =3D elem->in_num;
> +    unsigned out_num =3D elem->out_num;
> +    uint32_t type;
> +
> +    if (elem->out_num < 1 || elem->in_num < 1) {
> +        error_report("virtio-blk request missing headers");
> +        goto err;
> +    }
> +
> +    if (unlikely(iov_to_buf(out_iov, out_num, 0, &req->out,
> +                            sizeof(req->out)) !=3D sizeof(req->out))) {
> +        error_report("virtio-blk request outhdr too short");
> +        goto err;
> +    }
> +
> +    iov_discard_front(&out_iov, &out_num, sizeof(req->out));
> +
> +    if (in_iov[in_num - 1].iov_len < sizeof(struct virtio_blk_inhdr)) {
> +        error_report("virtio-blk request inhdr too short");
> +        goto err;
> +    }
> +
> +    /* We always touch the last byte, so just see how big in_iov is. */
> +    req->in_len =3D iov_size(in_iov, in_num);
> +    req->in =3D (void *)in_iov[in_num - 1].iov_base
> +              + in_iov[in_num - 1].iov_len
> +              - sizeof(struct virtio_blk_inhdr);
> +    iov_discard_back(in_iov, &in_num, sizeof(struct virtio_blk_inhdr));
> +
> +    type =3D le32_to_cpu(req->out.type);
> +    switch (type & ~VIRTIO_BLK_T_BARRIER) {
> +    case VIRTIO_BLK_T_IN:
> +    case VIRTIO_BLK_T_OUT: {
> +        QEMUIOVector qiov;
> +        int64_t offset;
> +        ssize_t ret =3D 0;
> +        bool is_write =3D type & VIRTIO_BLK_T_OUT;
> +        req->sector_num =3D le64_to_cpu(req->out.sector);
> +
> +        if (is_write && !vblk_exp->writable) {
> +            req->in->status =3D VIRTIO_BLK_S_IOERR;
> +            break;
> +        }
> +
> +        if (is_write) {
> +            qemu_iovec_init_external(&qiov, out_iov, out_num);
> +        } else {
> +            qemu_iovec_init_external(&qiov, in_iov, in_num);
> +        }
> +
> +        if (unlikely(!vduse_blk_sect_range_ok(vblk_exp,
> +                                              req->sector_num,
> +                                              qiov.size))) {
> +            req->in->status =3D VIRTIO_BLK_S_IOERR;
> +            break;
> +        }
> +
> +        offset =3D req->sector_num << VIRTIO_BLK_SECTOR_BITS;
> +
> +        if (is_write) {
> +            ret =3D blk_co_pwritev(blk, offset, qiov.size, &qiov, 0);
> +        } else {
> +            ret =3D blk_co_preadv(blk, offset, qiov.size, &qiov, 0);
> +        }
> +        if (ret >=3D 0) {
> +            req->in->status =3D VIRTIO_BLK_S_OK;
> +        } else {
> +            req->in->status =3D VIRTIO_BLK_S_IOERR;
> +        }
> +        break;
> +    }
> +    case VIRTIO_BLK_T_FLUSH:
> +        if (blk_co_flush(blk) =3D=3D 0) {
> +            req->in->status =3D VIRTIO_BLK_S_OK;
> +        } else {
> +            req->in->status =3D VIRTIO_BLK_S_IOERR;
> +        }
> +        break;
> +    case VIRTIO_BLK_T_GET_ID: {
> +        size_t size =3D MIN(iov_size(&elem->in_sg[0], in_num),
> +                          VIRTIO_BLK_ID_BYTES);
> +        snprintf(elem->in_sg[0].iov_base, size, "%s", vblk_exp->export.i=
d);
> +        req->in->status =3D VIRTIO_BLK_S_OK;
> +        break;
> +    }
> +    default:
> +        req->in->status =3D VIRTIO_BLK_S_UNSUPP;
> +        break;
> +    }
> +
> +    vduse_blk_req_complete(req);
> +    return;
> +
> +err:
> +    free(req);
> +}
> +
> +static void vduse_blk_vq_handler(VduseDev *dev, VduseVirtq *vq)
> +{
> +    while (1) {
> +        VduseBlkReq *req;
> +
> +        req =3D vduse_queue_pop(vq, sizeof(VduseBlkReq));
> +        if (!req) {
> +            break;
> +        }
> +        req->vq =3D vq;
> +
> +        Coroutine *co =3D
> +            qemu_coroutine_create(vduse_blk_virtio_process_req, req);
> +        qemu_coroutine_enter(co);
> +    }
> +}
> +
> +static void on_vduse_vq_kick(void *opaque)
> +{
> +    VduseVirtq *vq =3D opaque;
> +    VduseDev *dev =3D vduse_queue_get_dev(vq);
> +    int fd =3D vduse_queue_get_fd(vq);
> +    eventfd_t kick_data;
> +
> +    if (eventfd_read(fd, &kick_data) =3D=3D -1) {
> +        error_report("failed to read data from eventfd");
> +        return;
> +    }
> +
> +    vduse_blk_vq_handler(dev, vq);
> +}
> +
> +static void vduse_blk_enable_queue(VduseDev *dev, VduseVirtq *vq)
> +{
> +    VduseBlkExport *vblk_exp =3D vduse_dev_get_priv(dev);
> +
> +    aio_set_fd_handler(vblk_exp->export.ctx, vduse_queue_get_fd(vq),
> +                       true, on_vduse_vq_kick, NULL, NULL, NULL, vq);
> +}
> +
> +static void vduse_blk_disable_queue(VduseDev *dev, VduseVirtq *vq)
> +{
> +    VduseBlkExport *vblk_exp =3D vduse_dev_get_priv(dev);
> +
> +    aio_set_fd_handler(vblk_exp->export.ctx, vduse_queue_get_fd(vq),
> +                       true, NULL, NULL, NULL, NULL, NULL);
> +}
> +
> +static const VduseOps vduse_blk_ops =3D {
> +    .enable_queue =3D vduse_blk_enable_queue,
> +    .disable_queue =3D vduse_blk_disable_queue,
> +};
> +
> +static void on_vduse_dev_kick(void *opaque)
> +{
> +    VduseDev *dev =3D opaque;
> +
> +    vduse_dev_handler(dev);
> +}
> +
> +static void blk_aio_attached(AioContext *ctx, void *opaque)
> +{
> +    VduseBlkExport *vblk_exp =3D opaque;
> +    int i;
> +
> +    vblk_exp->export.ctx =3D ctx;
> +
> +    aio_set_fd_handler(vblk_exp->export.ctx, vduse_dev_get_fd(vblk_exp->=
dev),
> +                       true, on_vduse_dev_kick, NULL, NULL, NULL,
> +                       vblk_exp->dev);
> +
> +    for (i =3D 0; i < vblk_exp->num_queues; i++) {
> +        VduseVirtq *vq =3D vduse_dev_get_queue(vblk_exp->dev, i);
> +        int fd =3D vduse_queue_get_fd(vq);
> +
> +        if (fd < 0) {
> +            continue;
> +        }
> +        aio_set_fd_handler(vblk_exp->export.ctx, fd, true,
> +                           on_vduse_vq_kick, NULL, NULL, NULL, vq);
> +    }
> +}
> +
> +static void blk_aio_detach(void *opaque)
> +{
> +    VduseBlkExport *vblk_exp =3D opaque;
> +    int i;
> +
> +    for (i =3D 0; i < vblk_exp->num_queues; i++) {
> +        VduseVirtq *vq =3D vduse_dev_get_queue(vblk_exp->dev, i);
> +        int fd =3D vduse_queue_get_fd(vq);
> +
> +        if (fd < 0) {
> +            continue;
> +        }
> +        aio_set_fd_handler(vblk_exp->export.ctx, fd,
> +                           true, NULL, NULL, NULL, NULL, NULL);
> +    }
> +    aio_set_fd_handler(vblk_exp->export.ctx, vduse_dev_get_fd(vblk_exp->=
dev),
> +                       true, NULL, NULL, NULL, NULL, NULL);
> +    vblk_exp->export.ctx =3D NULL;
> +}
> +
> +static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *op=
ts,
> +                                Error **errp)
> +{
> +    VduseBlkExport *vblk_exp =3D container_of(exp, VduseBlkExport, expor=
t);
> +    BlockExportOptionsVduseBlk *vblk_opts =3D &opts->u.vduse_blk;
> +    uint64_t logical_block_size =3D VIRTIO_BLK_SECTOR_SIZE;
> +    uint16_t num_queues =3D VDUSE_DEFAULT_NUM_QUEUE;
> +    uint16_t queue_size =3D VDUSE_DEFAULT_QUEUE_SIZE;
> +    Error *local_err =3D NULL;
> +    struct virtio_blk_config config;

Please zero-initialize this with "=3D { 0 }" because this struct can grow
when Linux adds virtio-blk features and our function may not have code
to fill in the new fields.

> +    uint64_t features;
> +    int i;
> +
> +    if (vblk_opts->has_num_queues) {
> +        num_queues =3D vblk_opts->num_queues;
> +        if (num_queues =3D=3D 0) {
> +            error_setg(errp, "num-queues must be greater than 0");
> +            return -EINVAL;
> +        }
> +    }
> +
> +    if (vblk_opts->has_queue_size) {
> +        queue_size =3D vblk_opts->queue_size;
> +        if (queue_size =3D=3D 0) {
> +            error_setg(errp, "queue-size must be greater than 0");
> +            return -EINVAL;
> +        }
> +    }
> +
> +    if (vblk_opts->has_logical_block_size) {
> +        logical_block_size =3D vblk_opts->logical_block_size;
> +        check_block_size(exp->id, "logical-block-size", logical_block_si=
ze,
> +                         &local_err);
> +        if (local_err) {
> +            error_propagate(errp, local_err);
> +            return -EINVAL;
> +        }
> +    }
> +    blk_set_guest_block_size(exp->blk, logical_block_size);
> +
> +    vblk_exp->blk_size =3D logical_block_size;
> +    vblk_exp->writable =3D opts->writable;
> +    vblk_exp->num_queues =3D num_queues;
> +
> +    config.capacity =3D
> +            cpu_to_le64(blk_getlength(exp->blk) >> VIRTIO_BLK_SECTOR_BIT=
S);
> +    config.seg_max =3D cpu_to_le32(queue_size - 2);

What is queue_size is 1 or 2?

> +    config.size_max =3D cpu_to_le32(0);
> +    config.min_io_size =3D cpu_to_le16(1);
> +    config.opt_io_size =3D cpu_to_le32(1);
> +    config.num_queues =3D cpu_to_le16(num_queues);
> +    config.blk_size =3D cpu_to_le32(logical_block_size);
> +
> +    features =3D (1ULL << VIRTIO_F_IOMMU_PLATFORM) |
> +               (1ULL << VIRTIO_F_VERSION_1) |
> +               (1ULL << VIRTIO_RING_F_EVENT_IDX) |
> +               (1ULL << VIRTIO_F_NOTIFY_ON_EMPTY) |
> +               (1ULL << VIRTIO_RING_F_INDIRECT_DESC) |
> +               (1ULL << VIRTIO_BLK_F_SIZE_MAX) |
> +               (1ULL << VIRTIO_BLK_F_SEG_MAX) |
> +               (1ULL << VIRTIO_BLK_F_TOPOLOGY) |
> +               (1ULL << VIRTIO_BLK_F_BLK_SIZE);
> +
> +    if (num_queues > 1) {
> +        features |=3D 1ULL << VIRTIO_BLK_F_MQ;
> +    }
> +    if (!vblk_exp->writable) {
> +        features |=3D 1ULL << VIRTIO_BLK_F_RO;
> +    }
> +
> +    vblk_exp->dev =3D vduse_dev_create(exp->id, VIRTIO_ID_BLOCK, 0,
> +                                     features, num_queues,
> +                                     sizeof(struct virtio_blk_config),
> +                                     (char *)&config, &vduse_blk_ops,
> +                                     vblk_exp);
> +    if (!vblk_exp->dev) {
> +        error_setg(errp, "failed to create vduse device");
> +        return -ENOMEM;
> +    }
> +
> +    for (i =3D 0; i < num_queues; i++) {
> +        vduse_dev_setup_queue(vblk_exp->dev, i, queue_size);
> +    }
> +
> +    aio_set_fd_handler(exp->ctx, vduse_dev_get_fd(vblk_exp->dev), true,
> +                       on_vduse_dev_kick, NULL, NULL, NULL, vblk_exp->de=
v);
> +
> +    blk_add_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_det=
ach,
> +                                 vblk_exp);
> +
> +    return 0;
> +}
> +
> +static void vduse_blk_exp_delete(BlockExport *exp)
> +{
> +    VduseBlkExport *vblk_exp =3D container_of(exp, VduseBlkExport, expor=
t);
> +
> +    vduse_dev_destroy(vblk_exp->dev);
> +}
> +
> +static void vduse_blk_exp_request_shutdown(BlockExport *exp)
> +{
> +    VduseBlkExport *vblk_exp =3D container_of(exp, VduseBlkExport, expor=
t);
> +    int i;
> +
> +    blk_remove_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_=
detach,
> +                                    vblk_exp);
> +
> +    for (i =3D 0; i < vblk_exp->num_queues; i++) {
> +        VduseVirtq *vq =3D vduse_dev_get_queue(vblk_exp->dev, i);
> +        int fd =3D vduse_queue_get_fd(vq);
> +
> +        if (fd < 0) {
> +            continue;
> +        }
> +        aio_set_fd_handler(exp->ctx, fd, true, NULL, NULL, NULL, NULL, N=
ULL);
> +    }
> +    aio_set_fd_handler(exp->ctx, vduse_dev_get_fd(vblk_exp->dev),
> +                       true, NULL, NULL, NULL, NULL, NULL);

Call blk_aio_detach() instead of duplicating this code?

> +}
> +
> +const BlockExportDriver blk_exp_vduse_blk =3D {
> +    .type               =3D BLOCK_EXPORT_TYPE_VDUSE_BLK,
> +    .instance_size      =3D sizeof(VduseBlkExport),
> +    .create             =3D vduse_blk_exp_create,
> +    .delete             =3D vduse_blk_exp_delete,
> +    .request_shutdown   =3D vduse_blk_exp_request_shutdown,
> +};
> diff --git a/block/export/vduse-blk.h b/block/export/vduse-blk.h
> new file mode 100644
> index 0000000000..c4eeb1b70e
> --- /dev/null
> +++ b/block/export/vduse-blk.h
> @@ -0,0 +1,20 @@
> +/*
> + * Export QEMU block device via VDUSE
> + *
> + * Copyright (C) 2022 Bytedance Inc. and/or its affiliates. All rights r=
eserved.
> + *
> + * Author:
> + *   Xie Yongji <xieyongji@bytedance.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> + * later.  See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef VDUSE_BLK_H
> +#define VDUSE_BLK_H
> +
> +#include "block/export.h"
> +
> +extern const BlockExportDriver blk_exp_vduse_blk;
> +
> +#endif /* VDUSE_BLK_H */
> diff --git a/meson.build b/meson.build
> index 864fb50ade..472e3947c6 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1320,6 +1320,17 @@ if have_libvduse
>    libvduse =3D libvduse_proj.get_variable('libvduse_dep')
>  endif
> =20
> +have_vduse_blk_export =3D (have_libvduse and targetos =3D=3D 'linux')
> +if get_option('vduse_blk_export').enabled()
> +    if targetos !=3D 'linux'
> +        error('vduse_blk_export requires linux')
> +    elif have_libvduse
> +        error('vduse_blk_export requires libvduse support')
> +    endif
> +elif get_option('vduse_blk_export').disabled()
> +    have_vduse_blk_export =3D false
> +endif
> +
>  # libbpf
>  libbpf =3D dependency('libbpf', required: get_option('bpf'), method: 'pk=
g-config')
>  if libbpf.found() and not cc.links('''
> @@ -1514,6 +1525,7 @@ config_host_data.set('CONFIG_SNAPPY', snappy.found(=
))
>  config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
>  config_host_data.set('CONFIG_VDE', vde.found())
>  config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk=
_server)
> +config_host_data.set('CONFIG_VDUSE_BLK_EXPORT', have_vduse_blk_export)
>  config_host_data.set('CONFIG_VNC', vnc.found())
>  config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
>  config_host_data.set('CONFIG_VNC_PNG', png.found())
> @@ -3407,6 +3419,7 @@ if have_block
>    summary_info +=3D {'qed support':       config_host.has_key('CONFIG_QE=
D')}
>    summary_info +=3D {'parallels support': config_host.has_key('CONFIG_PA=
RALLELS')}
>    summary_info +=3D {'FUSE exports':      fuse}
> +  summary_info +=3D {'VDUSE block exports': have_vduse_blk_export}
>  endif
>  summary(summary_info, bool_yn: true, section: 'Block layer support')
> =20
> diff --git a/meson_options.txt b/meson_options.txt
> index 16790d1814..be1682c4d2 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -197,6 +197,8 @@ option('virtiofsd', type: 'feature', value: 'auto',
>         description: 'build virtiofs daemon (virtiofsd)')
>  option('libvduse', type: 'feature', value: 'auto',
>         description: 'build VDUSE Library')
> +option('vduse_blk_export', type: 'feature', value: 'auto',
> +       description: 'VDUSE block export support')
> =20
>  option('capstone', type: 'combo', value: 'auto',
>         choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
> diff --git a/qapi/block-export.json b/qapi/block-export.json
> index f9ce79a974..f88e90baab 100644
> --- a/qapi/block-export.json
> +++ b/qapi/block-export.json
> @@ -170,6 +170,22 @@
>              '*allow-other': 'FuseExportAllowOther' },
>    'if': 'CONFIG_FUSE' }
> =20
> +##
> +# @BlockExportOptionsVduseBlk:
> +#
> +# A vduse-blk block export.
> +#
> +# @num-queues: the number of virtqueues. Defaults to 1.
> +# @queue-size: the size of virtqueue. Defaults to 128.
> +# @logical-block-size: Logical block size in bytes. Defaults to 512 byte=
s.
> +#
> +# Since: 7.0
> +##
> +{ 'struct': 'BlockExportOptionsVduseBlk',
> +  'data': { '*num-queues': 'uint16',
> +            '*queue-size': 'uint16',
> +            '*logical-block-size': 'size'} }
> +
>  ##
>  # @NbdServerAddOptions:
>  #
> @@ -273,13 +289,15 @@
>  # @nbd: NBD export
>  # @vhost-user-blk: vhost-user-blk export (since 5.2)
>  # @fuse: FUSE export (since: 6.0)
> +# @vduse-blk: vduse-blk export (since 7.0)
>  #
>  # Since: 4.2
>  ##
>  { 'enum': 'BlockExportType',
>    'data': [ 'nbd',
>              { 'name': 'vhost-user-blk', 'if': 'CONFIG_VHOST_USER_BLK_SER=
VER' },
> -            { 'name': 'fuse', 'if': 'CONFIG_FUSE' } ] }
> +            { 'name': 'fuse', 'if': 'CONFIG_FUSE' },
> +            { 'name': 'vduse-blk', 'if': 'CONFIG_VDUSE_BLK_EXPORT' } ] }
> =20
>  ##
>  # @BlockExportOptions:
> @@ -323,7 +341,9 @@
>        'vhost-user-blk': { 'type': 'BlockExportOptionsVhostUserBlk',
>                            'if': 'CONFIG_VHOST_USER_BLK_SERVER' },
>        'fuse': { 'type': 'BlockExportOptionsFuse',
> -                'if': 'CONFIG_FUSE' }
> +                'if': 'CONFIG_FUSE' },
> +      'vduse-blk': { 'type': 'BlockExportOptionsVduseBlk',
> +                     'if': 'CONFIG_VDUSE_BLK_EXPORT' }
>     } }
> =20
>  ##
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
> index af5c75d758..615fc17ec3 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -86,6 +86,8 @@ meson_options_help() {
>    printf "%s\n" '  u2f             U2F emulation support'
>    printf "%s\n" '  usb-redir       libusbredir support'
>    printf "%s\n" '  vde             vde network backend support'
> +  printf "%s\n" '  vduse-blk-export'
> +  printf "%s\n" '                  VDUSE block export support'
>    printf "%s\n" '  vhost-user-blk-server'
>    printf "%s\n" '                  build vhost-user-blk server'
>    printf "%s\n" '  virglrenderer   virgl rendering support'
> @@ -254,6 +256,8 @@ _meson_option_parse() {
>      --disable-usb-redir) printf "%s" -Dusb_redir=3Ddisabled ;;
>      --enable-vde) printf "%s" -Dvde=3Denabled ;;
>      --disable-vde) printf "%s" -Dvde=3Ddisabled ;;
> +    --enable-vduse-blk-export) printf "%s" -Dvduse_blk_export=3Denabled =
;;
> +    --disable-vduse-blk-export) printf "%s" -Dvduse_blk_export=3Ddisable=
d ;;
>      --enable-vhost-user-blk-server) printf "%s" -Dvhost_user_blk_server=
=3Denabled ;;
>      --disable-vhost-user-blk-server) printf "%s" -Dvhost_user_blk_server=
=3Ddisabled ;;
>      --enable-virglrenderer) printf "%s" -Dvirglrenderer=3Denabled ;;
> --=20
> 2.20.1
>=20

--h/by6pWcdyScrsTh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIBKZYACgkQnKSrs4Gr
c8h9sAgApClBE28+/qg5a3HzD1BT5opsZc7rqgi6e7XfnnDUVZOIcec0/rGlpnit
OYFTHuS879dcJ3Buyk4BVSgVYFbhjpIc4S8b7zoh1l3NBBkAFWF8mv3JaufpjApP
Q25O4iiRQwvwos10WpQ5HHjwHAx3k+2xkGgcpkY8G6uENobJrvqt9RA2qxgzZoUl
v826IJrI7LP0Pu8Ex0Ouiq/FEv6RHesLwZbksrl9kHn0ilQWPvd3gX8O41KJsKPM
nDT3S2/EPFECBEs5DcOjO0nnrT4r5wqUwgOZ6FMeNaYSmyOJbP5z07y0clW5TK+e
YhDXVpV1+zk7B1rWaTJHGizvWUn9uQ==
=aVl/
-----END PGP SIGNATURE-----

--h/by6pWcdyScrsTh--


