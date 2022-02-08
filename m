Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CC44AD2C9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 09:08:10 +0100 (CET)
Received: from localhost ([::1]:45270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHLXk-0002n4-LD
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 03:08:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nHKR3-0002wn-RI
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 01:57:10 -0500
Received: from [2a00:1450:4864:20::62b] (port=35428
 helo=mail-ej1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nHKQy-0006dh-ME
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 01:57:08 -0500
Received: by mail-ej1-x62b.google.com with SMTP id y3so28554222ejf.2
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 22:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tS8RoKh/sz4vzniouNrbzFBkwel6a/B3xkR9XVplB8k=;
 b=IqBtNQqpr+sDd7soN13jtqFtdx1JYXCjGN8P5bxdLfDeStLEzk4KaZKEI5QPmElqvy
 Yyv6vj8aBaKmtLe2ggcn5oyrtrigTa5gPJbDIuBFLqHwqHGg21RJOh9u1/6gkOr9H8yU
 aX/8IgC6EMisH+BD3UKTuh4hcfaaiYt68cO5AV3GG2KGmM1iS+BdgEe0EcxNaVcUZIu6
 IvRKGA1BlqZSDTNDDOLfWtkVwcPzNE4dOJRL5iopgjLvO2G0DpD6DFwoeNMdjz/WabJx
 BO8xmEO0hl2L1xc0n9Mp0Bo++i6P2fP73SoO1lGXLBmF5q7Vv388ra/ObWh1FtK9hrbR
 Zcmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tS8RoKh/sz4vzniouNrbzFBkwel6a/B3xkR9XVplB8k=;
 b=yuwWtLOWYnxpOHTHze5+YI2pfms38nO3zImCqm5qpHUKao+wNxFa5+YIzso0ahEDBC
 ZlakWs9Bg6RHJ4P5iHdBsHoe36QnVYDAWem0Kj2iG01ZRiPIiyVOCjxFIUHtmKXxCXr6
 P8wbrYEx6WVKCwx6UlQB65zmaAXUWwA5lbxQdlSkhdVfBs9nCYH89nbQaQJ4Btsm64Ro
 qtR07WTYhBnSgrXCf6sFQ2VkQPuIrwBmMzTzWwgCdQz1DH1vcP5ETT4jvJDbJVACic8Q
 V8l/OAXLs3bJeOohYurf0P1cNDM61HyQyJ2TNQyBGenCYmCy++tfyMEu2ImwEpkj6DGq
 5+9A==
X-Gm-Message-State: AOAM533Gi/csCbMBJOxiFJ3YBkHQR4UC02qMizZoA7IYn80NVB8nRvtz
 eEJrNLnwFAFXndjJmO9y8uzZraW9AxtcZunzDoGN
X-Google-Smtp-Source: ABdhPJz3YFUlgoFLMzc/S4DpUuVYCyX9mjIkGNBs/sITyEg2tD/f+bG8wUOHSqr9CbXd09H74WKs6c7zkFDxIDK7ewo=
X-Received: by 2002:a17:906:d550:: with SMTP id
 cr16mr2452799ejc.257.1644303422844; 
 Mon, 07 Feb 2022 22:57:02 -0800 (PST)
MIME-Version: 1.0
References: <20220125131800.91-1-xieyongji@bytedance.com>
 <20220125131800.91-4-xieyongji@bytedance.com>
 <YgEplgqZ9JWVPvEc@stefanha-x1.localdomain>
In-Reply-To: <YgEplgqZ9JWVPvEc@stefanha-x1.localdomain>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Tue, 8 Feb 2022 14:56:51 +0800
Message-ID: <CACycT3sokc6f-+GoMpd8xq6Feg8LZi_xgDumw1VCCoaja6hb9Q@mail.gmail.com>
Subject: Re: [PATCH 3/5] vduse-blk: implements vduse-blk export
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=xieyongji@bytedance.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, mreitz@redhat.com, mlureau@redhat.com,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 7, 2022 at 10:15 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Tue, Jan 25, 2022 at 09:17:58PM +0800, Xie Yongji wrote:
> > This implements a VDUSE block backends based on
> > the libvduse library. We can use it to export the BDSs
> > for both VM and container (host) usage.
> >
> > The new command-line syntax is:
> >
> > $ qemu-storage-daemon \
> >     --blockdev file,node-name=drive0,filename=test.img \
> >     --export vduse-blk,node-name=drive0,id=vduse-export0,writable=on
> >
> > After the qemu-storage-daemon started, we need to use
> > the "vdpa" command to attach the device to vDPA bus:
> >
> > $ vdpa dev add name vduse-export0 mgmtdev vduse
> >
> > Also the device must be removed via the "vdpa" command
> > before we stop the qemu-storage-daemon.
> >
> > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> > ---
> >  block/export/export.c         |   6 +
> >  block/export/meson.build      |   5 +
> >  block/export/vduse-blk.c      | 427 ++++++++++++++++++++++++++++++++++
> >  block/export/vduse-blk.h      |  20 ++
> >  meson.build                   |  13 ++
> >  meson_options.txt             |   2 +
> >  qapi/block-export.json        |  24 +-
> >  scripts/meson-buildoptions.sh |   4 +
> >  8 files changed, 499 insertions(+), 2 deletions(-)
> >  create mode 100644 block/export/vduse-blk.c
> >  create mode 100644 block/export/vduse-blk.h
> >
> > diff --git a/block/export/export.c b/block/export/export.c
> > index 6d3b9964c8..00dd505540 100644
> > --- a/block/export/export.c
> > +++ b/block/export/export.c
> > @@ -26,6 +26,9 @@
> >  #ifdef CONFIG_VHOST_USER_BLK_SERVER
> >  #include "vhost-user-blk-server.h"
> >  #endif
> > +#ifdef CONFIG_VDUSE_BLK_EXPORT
> > +#include "vduse-blk.h"
> > +#endif
> >
> >  static const BlockExportDriver *blk_exp_drivers[] = {
> >      &blk_exp_nbd,
> > @@ -35,6 +38,9 @@ static const BlockExportDriver *blk_exp_drivers[] = {
> >  #ifdef CONFIG_FUSE
> >      &blk_exp_fuse,
> >  #endif
> > +#ifdef CONFIG_VDUSE_BLK_EXPORT
> > +    &blk_exp_vduse_blk,
> > +#endif
> >  };
> >
> >  /* Only accessed from the main thread */
> > diff --git a/block/export/meson.build b/block/export/meson.build
> > index 0a08e384c7..cf311d2b1b 100644
> > --- a/block/export/meson.build
> > +++ b/block/export/meson.build
> > @@ -5,3 +5,8 @@ if have_vhost_user_blk_server
> >  endif
> >
> >  blockdev_ss.add(when: fuse, if_true: files('fuse.c'))
> > +
> > +if have_vduse_blk_export
> > +    blockdev_ss.add(files('vduse-blk.c'))
> > +    blockdev_ss.add(libvduse)
> > +endif
> > diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
> > new file mode 100644
> > index 0000000000..5a8d289685
> > --- /dev/null
> > +++ b/block/export/vduse-blk.c
> > @@ -0,0 +1,427 @@
> > +/*
> > + * Export QEMU block device via VDUSE
> > + *
> > + * Copyright (C) 2022 Bytedance Inc. and/or its affiliates. All rights reserved.
> > + *   Portions of codes and concepts borrowed from vhost-user-blk-server.c, so:
> > + *     Copyright (c) 2020 Red Hat, Inc.
> > + *
> > + * Author:
> > + *   Xie Yongji <xieyongji@bytedance.com>
> > + *   Coiby Xu <coiby.xu@gmail.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or
> > + * later.  See the COPYING file in the top-level directory.
> > + */
> > +
> > +#include <sys/eventfd.h>
> > +
> > +#include "qemu/osdep.h"
> > +#include "qapi/error.h"
> > +#include "sysemu/block-backend.h"
> > +#include "block/export.h"
> > +#include "qemu/error-report.h"
> > +#include "util/block-helpers.h"
> > +#include "subprojects/libvduse/libvduse.h"
> > +
> > +#include "standard-headers/linux/virtio_ring.h"
> > +#include "standard-headers/linux/virtio_blk.h"
> > +
> > +#define VIRTIO_BLK_SECTOR_BITS 9
> > +#define VIRTIO_BLK_SECTOR_SIZE (1ULL << VIRTIO_BLK_SECTOR_BITS)
> > +
> > +#define VDUSE_DEFAULT_NUM_QUEUE 1
> > +#define VDUSE_DEFAULT_QUEUE_SIZE 128
>
> QEMU's virtio-blk emulation has increased this limit to 256 for better
> performance with large block size I/O patterns. I think it would be okay
> to increase it here too.
>

Sure.

> > +
> > +typedef struct VduseBlkExport {
> > +    BlockExport export;
> > +    VduseDev *dev;
> > +    uint16_t num_queues;
> > +    uint32_t blk_size;
> > +    bool writable;
> > +} VduseBlkExport;
> > +
> > +struct virtio_blk_inhdr {
> > +    unsigned char status;
> > +};
> > +
> > +typedef struct VduseBlkReq {
> > +    VduseVirtqElement elem;
> > +    int64_t sector_num;
> > +    size_t in_len;
> > +    struct virtio_blk_inhdr *in;
> > +    struct virtio_blk_outhdr out;
> > +    VduseVirtq *vq;
> > +} VduseBlkReq;
> > +
> > +static void vduse_blk_req_complete(VduseBlkReq *req)
> > +{
> > +    vduse_queue_push(req->vq, &req->elem, req->in_len);
> > +    vduse_queue_notify(req->vq);
> > +
> > +    free(req);
> > +}
> > +
> > +static bool vduse_blk_sect_range_ok(VduseBlkExport *vblk_exp,
> > +                                    uint64_t sector, size_t size)
> > +{
> > +    uint64_t nb_sectors;
> > +    uint64_t total_sectors;
> > +
> > +    if (size % VIRTIO_BLK_SECTOR_SIZE) {
> > +        return false;
> > +    }
> > +
> > +    nb_sectors = size >> VIRTIO_BLK_SECTOR_BITS;
> > +
> > +    QEMU_BUILD_BUG_ON(BDRV_SECTOR_SIZE != VIRTIO_BLK_SECTOR_SIZE);
> > +    if (nb_sectors > BDRV_REQUEST_MAX_SECTORS) {
> > +        return false;
> > +    }
> > +    if ((sector << VIRTIO_BLK_SECTOR_BITS) % vblk_exp->blk_size) {
> > +        return false;
> > +    }
> > +    blk_get_geometry(vblk_exp->export.blk, &total_sectors);
> > +    if (sector > total_sectors || nb_sectors > total_sectors - sector) {
> > +        return false;
> > +    }
> > +    return true;
> > +}
> > +
> > +static void coroutine_fn vduse_blk_virtio_process_req(void *opaque)
> > +{
> > +    VduseBlkReq *req = opaque;
> > +    VduseVirtq *vq = req->vq;
> > +    VduseDev *dev = vduse_queue_get_dev(vq);
> > +    VduseBlkExport *vblk_exp = vduse_dev_get_priv(dev);
> > +    BlockBackend *blk = vblk_exp->export.blk;
> > +    VduseVirtqElement *elem = &req->elem;
> > +    struct iovec *in_iov = elem->in_sg;
> > +    struct iovec *out_iov = elem->out_sg;
> > +    unsigned in_num = elem->in_num;
> > +    unsigned out_num = elem->out_num;
> > +    uint32_t type;
> > +
> > +    if (elem->out_num < 1 || elem->in_num < 1) {
> > +        error_report("virtio-blk request missing headers");
> > +        goto err;
> > +    }
> > +
> > +    if (unlikely(iov_to_buf(out_iov, out_num, 0, &req->out,
> > +                            sizeof(req->out)) != sizeof(req->out))) {
> > +        error_report("virtio-blk request outhdr too short");
> > +        goto err;
> > +    }
> > +
> > +    iov_discard_front(&out_iov, &out_num, sizeof(req->out));
> > +
> > +    if (in_iov[in_num - 1].iov_len < sizeof(struct virtio_blk_inhdr)) {
> > +        error_report("virtio-blk request inhdr too short");
> > +        goto err;
> > +    }
> > +
> > +    /* We always touch the last byte, so just see how big in_iov is. */
> > +    req->in_len = iov_size(in_iov, in_num);
> > +    req->in = (void *)in_iov[in_num - 1].iov_base
> > +              + in_iov[in_num - 1].iov_len
> > +              - sizeof(struct virtio_blk_inhdr);
> > +    iov_discard_back(in_iov, &in_num, sizeof(struct virtio_blk_inhdr));
> > +
> > +    type = le32_to_cpu(req->out.type);
> > +    switch (type & ~VIRTIO_BLK_T_BARRIER) {
> > +    case VIRTIO_BLK_T_IN:
> > +    case VIRTIO_BLK_T_OUT: {
> > +        QEMUIOVector qiov;
> > +        int64_t offset;
> > +        ssize_t ret = 0;
> > +        bool is_write = type & VIRTIO_BLK_T_OUT;
> > +        req->sector_num = le64_to_cpu(req->out.sector);
> > +
> > +        if (is_write && !vblk_exp->writable) {
> > +            req->in->status = VIRTIO_BLK_S_IOERR;
> > +            break;
> > +        }
> > +
> > +        if (is_write) {
> > +            qemu_iovec_init_external(&qiov, out_iov, out_num);
> > +        } else {
> > +            qemu_iovec_init_external(&qiov, in_iov, in_num);
> > +        }
> > +
> > +        if (unlikely(!vduse_blk_sect_range_ok(vblk_exp,
> > +                                              req->sector_num,
> > +                                              qiov.size))) {
> > +            req->in->status = VIRTIO_BLK_S_IOERR;
> > +            break;
> > +        }
> > +
> > +        offset = req->sector_num << VIRTIO_BLK_SECTOR_BITS;
> > +
> > +        if (is_write) {
> > +            ret = blk_co_pwritev(blk, offset, qiov.size, &qiov, 0);
> > +        } else {
> > +            ret = blk_co_preadv(blk, offset, qiov.size, &qiov, 0);
> > +        }
> > +        if (ret >= 0) {
> > +            req->in->status = VIRTIO_BLK_S_OK;
> > +        } else {
> > +            req->in->status = VIRTIO_BLK_S_IOERR;
> > +        }
> > +        break;
> > +    }
> > +    case VIRTIO_BLK_T_FLUSH:
> > +        if (blk_co_flush(blk) == 0) {
> > +            req->in->status = VIRTIO_BLK_S_OK;
> > +        } else {
> > +            req->in->status = VIRTIO_BLK_S_IOERR;
> > +        }
> > +        break;
> > +    case VIRTIO_BLK_T_GET_ID: {
> > +        size_t size = MIN(iov_size(&elem->in_sg[0], in_num),
> > +                          VIRTIO_BLK_ID_BYTES);
> > +        snprintf(elem->in_sg[0].iov_base, size, "%s", vblk_exp->export.id);
> > +        req->in->status = VIRTIO_BLK_S_OK;
> > +        break;
> > +    }
> > +    default:
> > +        req->in->status = VIRTIO_BLK_S_UNSUPP;
> > +        break;
> > +    }
> > +
> > +    vduse_blk_req_complete(req);
> > +    return;
> > +
> > +err:
> > +    free(req);
> > +}
> > +
> > +static void vduse_blk_vq_handler(VduseDev *dev, VduseVirtq *vq)
> > +{
> > +    while (1) {
> > +        VduseBlkReq *req;
> > +
> > +        req = vduse_queue_pop(vq, sizeof(VduseBlkReq));
> > +        if (!req) {
> > +            break;
> > +        }
> > +        req->vq = vq;
> > +
> > +        Coroutine *co =
> > +            qemu_coroutine_create(vduse_blk_virtio_process_req, req);
> > +        qemu_coroutine_enter(co);
> > +    }
> > +}
> > +
> > +static void on_vduse_vq_kick(void *opaque)
> > +{
> > +    VduseVirtq *vq = opaque;
> > +    VduseDev *dev = vduse_queue_get_dev(vq);
> > +    int fd = vduse_queue_get_fd(vq);
> > +    eventfd_t kick_data;
> > +
> > +    if (eventfd_read(fd, &kick_data) == -1) {
> > +        error_report("failed to read data from eventfd");
> > +        return;
> > +    }
> > +
> > +    vduse_blk_vq_handler(dev, vq);
> > +}
> > +
> > +static void vduse_blk_enable_queue(VduseDev *dev, VduseVirtq *vq)
> > +{
> > +    VduseBlkExport *vblk_exp = vduse_dev_get_priv(dev);
> > +
> > +    aio_set_fd_handler(vblk_exp->export.ctx, vduse_queue_get_fd(vq),
> > +                       true, on_vduse_vq_kick, NULL, NULL, NULL, vq);
> > +}
> > +
> > +static void vduse_blk_disable_queue(VduseDev *dev, VduseVirtq *vq)
> > +{
> > +    VduseBlkExport *vblk_exp = vduse_dev_get_priv(dev);
> > +
> > +    aio_set_fd_handler(vblk_exp->export.ctx, vduse_queue_get_fd(vq),
> > +                       true, NULL, NULL, NULL, NULL, NULL);
> > +}
> > +
> > +static const VduseOps vduse_blk_ops = {
> > +    .enable_queue = vduse_blk_enable_queue,
> > +    .disable_queue = vduse_blk_disable_queue,
> > +};
> > +
> > +static void on_vduse_dev_kick(void *opaque)
> > +{
> > +    VduseDev *dev = opaque;
> > +
> > +    vduse_dev_handler(dev);
> > +}
> > +
> > +static void blk_aio_attached(AioContext *ctx, void *opaque)
> > +{
> > +    VduseBlkExport *vblk_exp = opaque;
> > +    int i;
> > +
> > +    vblk_exp->export.ctx = ctx;
> > +
> > +    aio_set_fd_handler(vblk_exp->export.ctx, vduse_dev_get_fd(vblk_exp->dev),
> > +                       true, on_vduse_dev_kick, NULL, NULL, NULL,
> > +                       vblk_exp->dev);
> > +
> > +    for (i = 0; i < vblk_exp->num_queues; i++) {
> > +        VduseVirtq *vq = vduse_dev_get_queue(vblk_exp->dev, i);
> > +        int fd = vduse_queue_get_fd(vq);
> > +
> > +        if (fd < 0) {
> > +            continue;
> > +        }
> > +        aio_set_fd_handler(vblk_exp->export.ctx, fd, true,
> > +                           on_vduse_vq_kick, NULL, NULL, NULL, vq);
> > +    }
> > +}
> > +
> > +static void blk_aio_detach(void *opaque)
> > +{
> > +    VduseBlkExport *vblk_exp = opaque;
> > +    int i;
> > +
> > +    for (i = 0; i < vblk_exp->num_queues; i++) {
> > +        VduseVirtq *vq = vduse_dev_get_queue(vblk_exp->dev, i);
> > +        int fd = vduse_queue_get_fd(vq);
> > +
> > +        if (fd < 0) {
> > +            continue;
> > +        }
> > +        aio_set_fd_handler(vblk_exp->export.ctx, fd,
> > +                           true, NULL, NULL, NULL, NULL, NULL);
> > +    }
> > +    aio_set_fd_handler(vblk_exp->export.ctx, vduse_dev_get_fd(vblk_exp->dev),
> > +                       true, NULL, NULL, NULL, NULL, NULL);
> > +    vblk_exp->export.ctx = NULL;
> > +}
> > +
> > +static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
> > +                                Error **errp)
> > +{
> > +    VduseBlkExport *vblk_exp = container_of(exp, VduseBlkExport, export);
> > +    BlockExportOptionsVduseBlk *vblk_opts = &opts->u.vduse_blk;
> > +    uint64_t logical_block_size = VIRTIO_BLK_SECTOR_SIZE;
> > +    uint16_t num_queues = VDUSE_DEFAULT_NUM_QUEUE;
> > +    uint16_t queue_size = VDUSE_DEFAULT_QUEUE_SIZE;
> > +    Error *local_err = NULL;
> > +    struct virtio_blk_config config;
>
> Please zero-initialize this with "= { 0 }" because this struct can grow
> when Linux adds virtio-blk features and our function may not have code
> to fill in the new fields.
>

Looks good to me.

> > +    uint64_t features;
> > +    int i;
> > +
> > +    if (vblk_opts->has_num_queues) {
> > +        num_queues = vblk_opts->num_queues;
> > +        if (num_queues == 0) {
> > +            error_setg(errp, "num-queues must be greater than 0");
> > +            return -EINVAL;
> > +        }
> > +    }
> > +
> > +    if (vblk_opts->has_queue_size) {
> > +        queue_size = vblk_opts->queue_size;
> > +        if (queue_size == 0) {
> > +            error_setg(errp, "queue-size must be greater than 0");
> > +            return -EINVAL;
> > +        }
> > +    }
> > +
> > +    if (vblk_opts->has_logical_block_size) {
> > +        logical_block_size = vblk_opts->logical_block_size;
> > +        check_block_size(exp->id, "logical-block-size", logical_block_size,
> > +                         &local_err);
> > +        if (local_err) {
> > +            error_propagate(errp, local_err);
> > +            return -EINVAL;
> > +        }
> > +    }
> > +    blk_set_guest_block_size(exp->blk, logical_block_size);
> > +
> > +    vblk_exp->blk_size = logical_block_size;
> > +    vblk_exp->writable = opts->writable;
> > +    vblk_exp->num_queues = num_queues;
> > +
> > +    config.capacity =
> > +            cpu_to_le64(blk_getlength(exp->blk) >> VIRTIO_BLK_SECTOR_BITS);
> > +    config.seg_max = cpu_to_le32(queue_size - 2);
>
> What is queue_size is 1 or 2?
>

OK, will validate the queue_size in v2.

> > +    config.size_max = cpu_to_le32(0);
> > +    config.min_io_size = cpu_to_le16(1);
> > +    config.opt_io_size = cpu_to_le32(1);
> > +    config.num_queues = cpu_to_le16(num_queues);
> > +    config.blk_size = cpu_to_le32(logical_block_size);
> > +
> > +    features = (1ULL << VIRTIO_F_IOMMU_PLATFORM) |
> > +               (1ULL << VIRTIO_F_VERSION_1) |
> > +               (1ULL << VIRTIO_RING_F_EVENT_IDX) |
> > +               (1ULL << VIRTIO_F_NOTIFY_ON_EMPTY) |
> > +               (1ULL << VIRTIO_RING_F_INDIRECT_DESC) |
> > +               (1ULL << VIRTIO_BLK_F_SIZE_MAX) |
> > +               (1ULL << VIRTIO_BLK_F_SEG_MAX) |
> > +               (1ULL << VIRTIO_BLK_F_TOPOLOGY) |
> > +               (1ULL << VIRTIO_BLK_F_BLK_SIZE);
> > +
> > +    if (num_queues > 1) {
> > +        features |= 1ULL << VIRTIO_BLK_F_MQ;
> > +    }
> > +    if (!vblk_exp->writable) {
> > +        features |= 1ULL << VIRTIO_BLK_F_RO;
> > +    }
> > +
> > +    vblk_exp->dev = vduse_dev_create(exp->id, VIRTIO_ID_BLOCK, 0,
> > +                                     features, num_queues,
> > +                                     sizeof(struct virtio_blk_config),
> > +                                     (char *)&config, &vduse_blk_ops,
> > +                                     vblk_exp);
> > +    if (!vblk_exp->dev) {
> > +        error_setg(errp, "failed to create vduse device");
> > +        return -ENOMEM;
> > +    }
> > +
> > +    for (i = 0; i < num_queues; i++) {
> > +        vduse_dev_setup_queue(vblk_exp->dev, i, queue_size);
> > +    }
> > +
> > +    aio_set_fd_handler(exp->ctx, vduse_dev_get_fd(vblk_exp->dev), true,
> > +                       on_vduse_dev_kick, NULL, NULL, NULL, vblk_exp->dev);
> > +
> > +    blk_add_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_detach,
> > +                                 vblk_exp);
> > +
> > +    return 0;
> > +}
> > +
> > +static void vduse_blk_exp_delete(BlockExport *exp)
> > +{
> > +    VduseBlkExport *vblk_exp = container_of(exp, VduseBlkExport, export);
> > +
> > +    vduse_dev_destroy(vblk_exp->dev);
> > +}
> > +
> > +static void vduse_blk_exp_request_shutdown(BlockExport *exp)
> > +{
> > +    VduseBlkExport *vblk_exp = container_of(exp, VduseBlkExport, export);
> > +    int i;
> > +
> > +    blk_remove_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_detach,
> > +                                    vblk_exp);
> > +
> > +    for (i = 0; i < vblk_exp->num_queues; i++) {
> > +        VduseVirtq *vq = vduse_dev_get_queue(vblk_exp->dev, i);
> > +        int fd = vduse_queue_get_fd(vq);
> > +
> > +        if (fd < 0) {
> > +            continue;
> > +        }
> > +        aio_set_fd_handler(exp->ctx, fd, true, NULL, NULL, NULL, NULL, NULL);
> > +    }
> > +    aio_set_fd_handler(exp->ctx, vduse_dev_get_fd(vblk_exp->dev),
> > +                       true, NULL, NULL, NULL, NULL, NULL);
>
> Call blk_aio_detach() instead of duplicating this code?
>

Sure.

Thanks,
Yongji

