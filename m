Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B562359214
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 04:39:38 +0200 (CEST)
Received: from localhost ([::1]:48594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUh3Y-0008VF-P6
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 22:39:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1lUh2R-0007xc-DQ
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 22:38:28 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:37759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1lUh2J-0000py-H8
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 22:38:23 -0400
Received: by mail-ej1-x633.google.com with SMTP id w3so6256527ejc.4
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 19:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l4gN8B3e8LEdQvibELzdu2pF1hzvSAItxfOkr+ZVn3w=;
 b=zq+UV/pU9KAgwf/+CEWcF0VDydwG+fZ024aaxQjP7URYeITAv7cPGH0u/oqcvJrzX4
 gpHxnHYtC6HAZKYIBBL5u4BeXqd43r395Fy18PUh8cxb4VDWOG4KE8sua8lyilCl+OH7
 Yy9a2b+WFp3VFnxLoxnAuxmzvtC6rXUuKkQFvxUvPPF2KXd7c0qWxyjtTn9VDo6UmSCU
 ahh41TExkGz2FOM2CITWiKnSwhk7XTg5OzhuqexYz0W2dpVI8D6A4Nol6QrBsre4P1k9
 cHJh0xoial0mPDsGecjMibc2rEnYSJsoJ7eT4UvBZTjDLV59dSWRuOhEfvMK+QyG8Nn4
 7e0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l4gN8B3e8LEdQvibELzdu2pF1hzvSAItxfOkr+ZVn3w=;
 b=aXYRiU2kA1ejI9EfYz3QgwEEN3BuDWSHcTLetkwY5jIcgyxvbnjg+A2yds/SVZE1Nn
 VcvpYI+EzhblUe+JZd53mKo2vKxBnsRfr87uNbZHgN25NG3oTQfu+cbcB3XMBOzV1SwN
 iVs7pfJ4rpccoa8TT8aL15Og7sIzJEDp8eDCWnp+wSB9b8syNTD2yRHwspkHxxg5ewHd
 XDe1KYkK1q80iRjlRX7//kZpGI/xUTnl+pgOB/E1nRRnBTNmRJyPKuUDz1Egud0RFjC0
 ad5ICAebGz0ySoM78aW3p5h+G1Vi8eUwSpXL4J9yq8auDnZKcDjd+Ke74aZEdUEfd3n1
 dp+g==
X-Gm-Message-State: AOAM53055u9zqpmOnEYSzev+nbaH2uK63xhCPlEhpruOdiI6z5GGhjxy
 Rzhq8sC7Q8PWifEWllQZFORilt6hUNnNtna9ZOOc
X-Google-Smtp-Source: ABdhPJyiNBw2K5PPBo58AAcoIHOts3jewv/+O+XbDq925EwCyERyLtzczMFljes/WkKaTocYpD50QiiWC92d6PLM/oA=
X-Received: by 2002:a17:906:36ce:: with SMTP id
 b14mr10275200ejc.395.1617935897002; 
 Thu, 08 Apr 2021 19:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210408101252.552-1-xieyongji@bytedance.com>
 <20210408101252.552-3-xieyongji@bytedance.com>
 <20210408232115.GA17518@raphael-debian-dev>
In-Reply-To: <20210408232115.GA17518@raphael-debian-dev>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Fri, 9 Apr 2021 10:38:05 +0800
Message-ID: <CACycT3u_H5QmQRiGO1xKRMXZBa29Bd+eVCNrn_dDBm8ePm51dg@mail.gmail.com>
Subject: Re: Re: [PATCH 2/3] vhost-blk: Add vhost-blk-common abstraction
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=xieyongji@bytedance.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>,
 "changpeng.liu@intel.com" <changpeng.liu@intel.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 9, 2021 at 7:21 AM Raphael Norwitz
<raphael.norwitz@nutanix.com> wrote:
>
> I'm mostly happy with this. Just some asks on variable renaming and
> comments which need to be fixed because of how you've moved things
> around.
>

OK. Thank you for reviewing!

> Also let's add a MAINTAINERS entry vhost-blk-common.h/c either under
> vhost-user-blk or create a new vhost-blk entry. I'm not sure what the
> best practices are for this.
>

Not sure. Maybe adding vhost-blk-common.h/c under vhost-user-blk entry is OK.

> On Thu, Apr 08, 2021 at 06:12:51PM +0800, Xie Yongji wrote:
> > This commit abstracts part of vhost-user-blk into a common
> > parent class which is useful for the introducation of vhost-vdpa-blk.
> >
> > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> > ---
> >  hw/block/meson.build                 |   2 +-
> >  hw/block/vhost-blk-common.c          | 291 +++++++++++++++++++++++++
> >  hw/block/vhost-user-blk.c            | 306 +++++----------------------
> >  hw/virtio/vhost-user-blk-pci.c       |   7 +-
> >  include/hw/virtio/vhost-blk-common.h |  50 +++++
> >  include/hw/virtio/vhost-user-blk.h   |  20 +-
> >  6 files changed, 396 insertions(+), 280 deletions(-)
> >  create mode 100644 hw/block/vhost-blk-common.c
> >  create mode 100644 include/hw/virtio/vhost-blk-common.h
> >
> > diff --git a/hw/block/meson.build b/hw/block/meson.build
> > index 5b4a7699f9..5862bda4cb 100644
> > --- a/hw/block/meson.build
> > +++ b/hw/block/meson.build
> > @@ -16,6 +16,6 @@ softmmu_ss.add(when: 'CONFIG_TC58128', if_true: files('tc58128.c'))
> >  softmmu_ss.add(when: 'CONFIG_NVME_PCI', if_true: files('nvme.c', 'nvme-ns.c', 'nvme-subsys.c', 'nvme-dif.c'))
> >
> >  specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c'))
> > -specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk.c'))
> > +specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-blk-common.c', 'vhost-user-blk.c'))
> >
> >  subdir('dataplane')
> > diff --git a/hw/block/vhost-blk-common.c b/hw/block/vhost-blk-common.c
> > new file mode 100644
> > index 0000000000..96500f6c89
> > --- /dev/null
> > +++ b/hw/block/vhost-blk-common.c
> > @@ -0,0 +1,291 @@
> > +/*
> > + * Parent class for vhost based block devices
> > + *
> > + * Copyright (C) 2021 Bytedance Inc. and/or its affiliates. All rights reserved.
> > + *
> > + * Author:
> > + *   Xie Yongji <xieyongji@bytedance.com>
> > + *
> > + * Heavily based on the vhost-user-blk.c by:
> > + *   Changpeng Liu <changpeng.liu@intel.com>
>
> You should probably also give credit to Felipe, Setfan and Nicholas, as
> a lot of vhost-user-blk orignally came from their work.
>

Sure.

> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2.  See
> > + * the COPYING file in the top-level directory.
> > + *
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qapi/error.h"
> > +#include "qemu/error-report.h"
> > +#include "qemu/cutils.h"
> > +#include "hw/qdev-core.h"
> > +#include "hw/qdev-properties.h"
> > +#include "hw/qdev-properties-system.h"
> > +#include "hw/virtio/vhost.h"
> > +#include "hw/virtio/virtio.h"
> > +#include "hw/virtio/virtio-bus.h"
> > +#include "hw/virtio/virtio-access.h"
> > +#include "hw/virtio/vhost-blk-common.h"
> > +#include "sysemu/sysemu.h"
> > +#include "sysemu/runstate.h"
> > +
> > +static void vhost_blk_common_update_config(VirtIODevice *vdev, uint8_t *config)
> > +{
> > +    VHostBlkCommon *vbc = VHOST_BLK_COMMON(vdev);
> > +
> > +    /* Our num_queues overrides the device backend */
> > +    virtio_stw_p(vdev, &vbc->blkcfg.num_queues, vbc->num_queues);
> > +
> > +    memcpy(config, &vbc->blkcfg, sizeof(struct virtio_blk_config));
> > +}
> > +
> > +static void vhost_blk_common_set_config(VirtIODevice *vdev,
> > +                                        const uint8_t *config)
> > +{
> > +    VHostBlkCommon *vbc = VHOST_BLK_COMMON(vdev);
> > +    struct virtio_blk_config *blkcfg = (struct virtio_blk_config *)config;
> > +    int ret;
> > +
> > +    if (blkcfg->wce == vbc->blkcfg.wce) {
> > +        return;
> > +    }
> > +
> > +    ret = vhost_dev_set_config(&vbc->dev, &blkcfg->wce,
> > +                               offsetof(struct virtio_blk_config, wce),
> > +                               sizeof(blkcfg->wce),
> > +                               VHOST_SET_CONFIG_TYPE_MASTER);
> > +    if (ret) {
> > +        error_report("set device config space failed");
> > +        return;
> > +    }
> > +
> > +    vbc->blkcfg.wce = blkcfg->wce;
> > +}
> > +
> > +static int vhost_blk_common_handle_config_change(struct vhost_dev *dev)
> > +{
> > +    VHostBlkCommon *vbc = VHOST_BLK_COMMON(dev->vdev);
> > +    struct virtio_blk_config blkcfg;
> > +    int ret;
> > +
> > +    ret = vhost_dev_get_config(dev, (uint8_t *)&blkcfg,
> > +                               sizeof(struct virtio_blk_config));
> > +    if (ret < 0) {
> > +        error_report("get config space failed");
> > +        return ret;
> > +    }
> > +
> > +    /* valid for resize only */
> > +    if (blkcfg.capacity != vbc->blkcfg.capacity) {
> > +        vbc->blkcfg.capacity = blkcfg.capacity;
> > +        memcpy(dev->vdev->config, &vbc->blkcfg,
> > +               sizeof(struct virtio_blk_config));
> > +        virtio_notify_config(dev->vdev);
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +const VhostDevConfigOps blk_ops = {
> > +    .vhost_dev_config_notifier = vhost_blk_common_handle_config_change,
> > +};
> > +
> > +static uint64_t vhost_blk_common_get_features(VirtIODevice *vdev,
> > +                                              uint64_t features,
> > +                                              Error **errp)
> > +{
> > +    VHostBlkCommon *vbc = VHOST_BLK_COMMON(vdev);
> > +
> > +    /* Turn on pre-defined features */
> > +    virtio_add_feature(&features, VIRTIO_BLK_F_SEG_MAX);
> > +    virtio_add_feature(&features, VIRTIO_BLK_F_GEOMETRY);
> > +    virtio_add_feature(&features, VIRTIO_BLK_F_TOPOLOGY);
> > +    virtio_add_feature(&features, VIRTIO_BLK_F_BLK_SIZE);
> > +    virtio_add_feature(&features, VIRTIO_BLK_F_FLUSH);
> > +    virtio_add_feature(&features, VIRTIO_BLK_F_RO);
> > +    virtio_add_feature(&features, VIRTIO_BLK_F_DISCARD);
> > +    virtio_add_feature(&features, VIRTIO_BLK_F_WRITE_ZEROES);
> > +
> > +    if (vbc->config_wce) {
> > +        virtio_add_feature(&features, VIRTIO_BLK_F_CONFIG_WCE);
> > +    }
> > +    if (vbc->num_queues > 1) {
> > +        virtio_add_feature(&features, VIRTIO_BLK_F_MQ);
> > +    }
> > +
> > +    return vhost_get_features(&vbc->dev, vbc->feature_bits, features);
> > +}
> > +
> > +int vhost_blk_common_start(VHostBlkCommon *vbc)
> > +{
> > +    VirtIODevice *vdev = VIRTIO_DEVICE(vbc);
> > +    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
> > +    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
> > +    int i, ret;
> > +
> > +    if (!k->set_guest_notifiers) {
> > +        error_report("binding does not support guest notifiers");
> > +        return -ENOSYS;
> > +    }
> > +
> > +    ret = vhost_dev_enable_notifiers(&vbc->dev, vdev);
> > +    if (ret < 0) {
> > +        error_report("Error enabling host notifiers: %d", -ret);
> > +        return ret;
> > +    }
> > +
> > +    ret = k->set_guest_notifiers(qbus->parent, vbc->dev.nvqs, true);
> > +    if (ret < 0) {
> > +        error_report("Error binding guest notifier: %d", -ret);
> > +        goto err_host_notifiers;
> > +    }
> > +
> > +    vbc->dev.acked_features = vdev->guest_features;
> > +
> > +    ret = vhost_dev_prepare_inflight(&vbc->dev, vdev);
> > +    if (ret < 0) {
> > +        error_report("Error set inflight format: %d", -ret);
> > +        goto err_guest_notifiers;
> > +    }
> > +
> > +    if (!vbc->inflight->addr) {
> > +        ret = vhost_dev_get_inflight(&vbc->dev, vbc->queue_size, vbc->inflight);
> > +        if (ret < 0) {
> > +            error_report("Error get inflight: %d", -ret);
> > +            goto err_guest_notifiers;
> > +        }
> > +    }
> > +
> > +    ret = vhost_dev_set_inflight(&vbc->dev, vbc->inflight);
> > +    if (ret < 0) {
> > +        error_report("Error set inflight: %d", -ret);
> > +        goto err_guest_notifiers;
> > +    }
> > +
> > +    ret = vhost_dev_start(&vbc->dev, vdev);
> > +    if (ret < 0) {
> > +        error_report("Error starting vhost: %d", -ret);
> > +        goto err_guest_notifiers;
> > +    }
>
> I think this will create confusion with vhost_dev->started, which is why
> I wanted it named started_vu. Can we change this to started_vbc or
> something like that?
>

OK, I see. Will do it.

> > +    vbc->started = true;
> > +
> > +    /* guest_notifier_mask/pending not used yet, so just unmask
> > +     * everything here. virtio-pci will do the right thing by
> > +     * enabling/disabling irqfd.
> > +     */
> > +    for (i = 0; i < vbc->dev.nvqs; i++) {
> > +        vhost_virtqueue_mask(&vbc->dev, vdev, i, false);
> > +    }
> > +
> > +    return ret;
> > +
> > +err_guest_notifiers:
> > +    k->set_guest_notifiers(qbus->parent, vbc->dev.nvqs, false);
> > +err_host_notifiers:
> > +    vhost_dev_disable_notifiers(&vbc->dev, vdev);
> > +    return ret;
> > +}
> > +
> > +void vhost_blk_common_stop(VHostBlkCommon *vbc)
> > +{
> > +    VirtIODevice *vdev = VIRTIO_DEVICE(vbc);
> > +    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
> > +    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
> > +    int ret;
> > +
> > +    if (!vbc->started) {
> > +        return;
> > +    }
> > +    vbc->started = false;
> > +
> > +    if (!k->set_guest_notifiers) {
> > +        return;
> > +    }
> > +
> > +    vhost_dev_stop(&vbc->dev, vdev);
> > +
> > +    ret = k->set_guest_notifiers(qbus->parent, vbc->dev.nvqs, false);
> > +    if (ret < 0) {
> > +        error_report("vhost guest notifier cleanup failed: %d", ret);
> > +        return;
> > +    }
> > +
> > +    vhost_dev_disable_notifiers(&vbc->dev, vdev);
> > +}
> > +
> > +void vhost_blk_common_realize(VHostBlkCommon *vbc,
> > +                              VirtIOHandleOutput handle_output,
> > +                              Error **errp)
> > +{
> > +    VirtIODevice *vdev = VIRTIO_DEVICE(vbc);
> > +    int i;
> > +
> > +    if (vbc->num_queues == VHOST_BLK_AUTO_NUM_QUEUES) {
> > +        vbc->num_queues = 1;
> > +    }
> > +
> > +    if (!vbc->num_queues || vbc->num_queues > VIRTIO_QUEUE_MAX) {
> > +        error_setg(errp, "vhost-blk-common: invalid number of IO queues");
> > +        return;
> > +    }
> > +
> > +    if (!vbc->queue_size) {
> > +        error_setg(errp, "vhost-blk-common: queue size must be non-zero");
> > +        return;
> > +    }
> > +
> > +    virtio_init(vdev, "virtio-blk", VIRTIO_ID_BLOCK,
> > +                sizeof(struct virtio_blk_config));
> > +
> > +    vbc->virtqs = g_new(VirtQueue *, vbc->num_queues);
> > +    for (i = 0; i < vbc->num_queues; i++) {
> > +        vbc->virtqs[i] = virtio_add_queue(vdev, vbc->queue_size,
> > +                                          handle_output);
> > +    }
> > +
> > +    vbc->inflight = g_new0(struct vhost_inflight, 1);
> > +    vbc->vhost_vqs = g_new0(struct vhost_virtqueue, vbc->num_queues);
> > +}
> > +
> > +void vhost_blk_common_unrealize(VHostBlkCommon *vbc)
> > +{
> > +    VirtIODevice *vdev = VIRTIO_DEVICE(vbc);
> > +    int i;
> > +
> > +    g_free(vbc->vhost_vqs);
> > +    vbc->vhost_vqs = NULL;
> > +    g_free(vbc->inflight);
> > +    vbc->inflight = NULL;
> > +
> > +    for (i = 0; i < vbc->num_queues; i++) {
> > +        virtio_delete_queue(vbc->virtqs[i]);
> > +    }
> > +    g_free(vbc->virtqs);
> > +    virtio_cleanup(vdev);
> > +}
> > +
> > +static void vhost_blk_common_class_init(ObjectClass *klass, void *data)
> > +{
> > +    DeviceClass *dc = DEVICE_CLASS(klass);
> > +    VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
> > +
> > +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> > +    vdc->get_config = vhost_blk_common_update_config;
> > +    vdc->set_config = vhost_blk_common_set_config;
> > +    vdc->get_features = vhost_blk_common_get_features;
> > +}
> > +
> > +static const TypeInfo vhost_blk_common_info = {
> > +    .name = TYPE_VHOST_BLK_COMMON,
> > +    .parent = TYPE_VIRTIO_DEVICE,
> > +    .instance_size = sizeof(VHostBlkCommon),
> > +    .class_init = vhost_blk_common_class_init,
> > +    .abstract = true,
> > +};
> > +
> > +static void virtio_register_types(void)
> > +{
> > +    type_register_static(&vhost_blk_common_info);
> > +}
> > +
> > +type_init(virtio_register_types)
> > diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> > index 0b5b9d44cd..0ad2cc030a 100644
> > --- a/hw/block/vhost-user-blk.c
> > +++ b/hw/block/vhost-user-blk.c
> > @@ -50,165 +50,10 @@ static const int user_feature_bits[] = {
> >      VHOST_INVALID_FEATURE_BIT
> >  };
> >
> > -static void vhost_user_blk_update_config(VirtIODevice *vdev, uint8_t *config)
> > -{
> > -    VHostUserBlk *s = VHOST_USER_BLK(vdev);
> > -
> > -    /* Our num_queues overrides the device backend */
> > -    virtio_stw_p(vdev, &s->blkcfg.num_queues, s->num_queues);
> > -
> > -    memcpy(config, &s->blkcfg, sizeof(struct virtio_blk_config));
> > -}
> > -
> > -static void vhost_user_blk_set_config(VirtIODevice *vdev, const uint8_t *config)
> > -{
> > -    VHostUserBlk *s = VHOST_USER_BLK(vdev);
> > -    struct virtio_blk_config *blkcfg = (struct virtio_blk_config *)config;
> > -    int ret;
> > -
> > -    if (blkcfg->wce == s->blkcfg.wce) {
> > -        return;
> > -    }
> > -
> > -    ret = vhost_dev_set_config(&s->dev, &blkcfg->wce,
> > -                               offsetof(struct virtio_blk_config, wce),
> > -                               sizeof(blkcfg->wce),
> > -                               VHOST_SET_CONFIG_TYPE_MASTER);
> > -    if (ret) {
> > -        error_report("set device config space failed");
> > -        return;
> > -    }
> > -
> > -    s->blkcfg.wce = blkcfg->wce;
> > -}
> > -
> > -static int vhost_user_blk_handle_config_change(struct vhost_dev *dev)
> > -{
> > -    int ret;
> > -    struct virtio_blk_config blkcfg;
> > -    VHostUserBlk *s = VHOST_USER_BLK(dev->vdev);
> > -
> > -    ret = vhost_dev_get_config(dev, (uint8_t *)&blkcfg,
> > -                               sizeof(struct virtio_blk_config));
> > -    if (ret < 0) {
> > -        error_report("get config space failed");
> > -        return -1;
> > -    }
> > -
> > -    /* valid for resize only */
> > -    if (blkcfg.capacity != s->blkcfg.capacity) {
> > -        s->blkcfg.capacity = blkcfg.capacity;
> > -        memcpy(dev->vdev->config, &s->blkcfg, sizeof(struct virtio_blk_config));
> > -        virtio_notify_config(dev->vdev);
> > -    }
> > -
> > -    return 0;
> > -}
> > -
> > -const VhostDevConfigOps blk_ops = {
> > -    .vhost_dev_config_notifier = vhost_user_blk_handle_config_change,
> > -};
> > -
> > -static int vhost_user_blk_start(VirtIODevice *vdev)
> > -{
> > -    VHostUserBlk *s = VHOST_USER_BLK(vdev);
> > -    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
> > -    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
> > -    int i, ret;
> > -
> > -    if (!k->set_guest_notifiers) {
> > -        error_report("binding does not support guest notifiers");
> > -        return -ENOSYS;
> > -    }
> > -
> > -    ret = vhost_dev_enable_notifiers(&s->dev, vdev);
> > -    if (ret < 0) {
> > -        error_report("Error enabling host notifiers: %d", -ret);
> > -        return ret;
> > -    }
> > -
> > -    ret = k->set_guest_notifiers(qbus->parent, s->dev.nvqs, true);
> > -    if (ret < 0) {
> > -        error_report("Error binding guest notifier: %d", -ret);
> > -        goto err_host_notifiers;
> > -    }
> > -
> > -    s->dev.acked_features = vdev->guest_features;
> > -
> > -    ret = vhost_dev_prepare_inflight(&s->dev, vdev);
> > -    if (ret < 0) {
> > -        error_report("Error set inflight format: %d", -ret);
> > -        goto err_guest_notifiers;
> > -    }
> > -
> > -    if (!s->inflight->addr) {
> > -        ret = vhost_dev_get_inflight(&s->dev, s->queue_size, s->inflight);
> > -        if (ret < 0) {
> > -            error_report("Error get inflight: %d", -ret);
> > -            goto err_guest_notifiers;
> > -        }
> > -    }
> > -
> > -    ret = vhost_dev_set_inflight(&s->dev, s->inflight);
> > -    if (ret < 0) {
> > -        error_report("Error set inflight: %d", -ret);
> > -        goto err_guest_notifiers;
> > -    }
> > -
> > -    ret = vhost_dev_start(&s->dev, vdev);
> > -    if (ret < 0) {
> > -        error_report("Error starting vhost: %d", -ret);
> > -        goto err_guest_notifiers;
> > -    }
> > -    s->started_vu = true;
> > -
> > -    /* guest_notifier_mask/pending not used yet, so just unmask
> > -     * everything here. virtio-pci will do the right thing by
> > -     * enabling/disabling irqfd.
> > -     */
> > -    for (i = 0; i < s->dev.nvqs; i++) {
> > -        vhost_virtqueue_mask(&s->dev, vdev, i, false);
> > -    }
> > -
> > -    return ret;
> > -
> > -err_guest_notifiers:
> > -    k->set_guest_notifiers(qbus->parent, s->dev.nvqs, false);
> > -err_host_notifiers:
> > -    vhost_dev_disable_notifiers(&s->dev, vdev);
> > -    return ret;
> > -}
> > -
> > -static void vhost_user_blk_stop(VirtIODevice *vdev)
> > -{
> > -    VHostUserBlk *s = VHOST_USER_BLK(vdev);
> > -    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
> > -    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
> > -    int ret;
> > -
> > -    if (!s->started_vu) {
> > -        return;
> > -    }
> > -    s->started_vu = false;
> > -
> > -    if (!k->set_guest_notifiers) {
> > -        return;
> > -    }
> > -
> > -    vhost_dev_stop(&s->dev, vdev);
> > -
> > -    ret = k->set_guest_notifiers(qbus->parent, s->dev.nvqs, false);
> > -    if (ret < 0) {
> > -        error_report("vhost guest notifier cleanup failed: %d", ret);
> > -        return;
> > -    }
> > -
> > -    vhost_dev_disable_notifiers(&s->dev, vdev);
> > -}
> > -
> >  static void vhost_user_blk_set_status(VirtIODevice *vdev, uint8_t status)
> >  {
> >      VHostUserBlk *s = VHOST_USER_BLK(vdev);
> > +    VHostBlkCommon *vbc = VHOST_BLK_COMMON(s);
> >      bool should_start = virtio_device_started(vdev, status);
> >      int ret;
> >
> > @@ -220,52 +65,27 @@ static void vhost_user_blk_set_status(VirtIODevice *vdev, uint8_t status)
> >          return;
> >      }
> >
> > -    if (s->dev.started == should_start) {
> > +    if (vbc->dev.started == should_start) {
> >          return;
> >      }
> >
> >      if (should_start) {
> > -        ret = vhost_user_blk_start(vdev);
> > +        ret = vhost_blk_common_start(vbc);
> >          if (ret < 0) {
> >              error_report("vhost-user-blk: vhost start failed: %s",
> >                           strerror(-ret));
> >              qemu_chr_fe_disconnect(&s->chardev);
> >          }
> >      } else {
> > -        vhost_user_blk_stop(vdev);
> > +        vhost_blk_common_stop(vbc);
> >      }
> >
> >  }
> >
> > -static uint64_t vhost_user_blk_get_features(VirtIODevice *vdev,
> > -                                            uint64_t features,
> > -                                            Error **errp)
> > -{
> > -    VHostUserBlk *s = VHOST_USER_BLK(vdev);
> > -
> > -    /* Turn on pre-defined features */
> > -    virtio_add_feature(&features, VIRTIO_BLK_F_SEG_MAX);
> > -    virtio_add_feature(&features, VIRTIO_BLK_F_GEOMETRY);
> > -    virtio_add_feature(&features, VIRTIO_BLK_F_TOPOLOGY);
> > -    virtio_add_feature(&features, VIRTIO_BLK_F_BLK_SIZE);
> > -    virtio_add_feature(&features, VIRTIO_BLK_F_FLUSH);
> > -    virtio_add_feature(&features, VIRTIO_BLK_F_RO);
> > -    virtio_add_feature(&features, VIRTIO_BLK_F_DISCARD);
> > -    virtio_add_feature(&features, VIRTIO_BLK_F_WRITE_ZEROES);
> > -
> > -    if (s->config_wce) {
> > -        virtio_add_feature(&features, VIRTIO_BLK_F_CONFIG_WCE);
> > -    }
> > -    if (s->num_queues > 1) {
> > -        virtio_add_feature(&features, VIRTIO_BLK_F_MQ);
> > -    }
> > -
> > -    return vhost_get_features(&s->dev, user_feature_bits, features);
> > -}
> > -
> >  static void vhost_user_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
> >  {
> >      VHostUserBlk *s = VHOST_USER_BLK(vdev);
> > +    VHostBlkCommon *vbc = VHOST_BLK_COMMON(s);
> >      int i, ret;
> >
> >      if (!vdev->start_on_kick) {
> > @@ -276,14 +96,14 @@ static void vhost_user_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
> >          return;
> >      }
> >
> > -    if (s->dev.started) {
> > +    if (vbc->dev.started) {
> >          return;
> >      }
> >
> >      /* Some guests kick before setting VIRTIO_CONFIG_S_DRIVER_OK so start
> >       * vhost here instead of waiting for .set_status().
> >       */
> > -    ret = vhost_user_blk_start(vdev);
> > +    ret = vhost_blk_common_start(vbc);
> >      if (ret < 0) {
> >          error_report("vhost-user-blk: vhost start failed: %s",
> >                       strerror(-ret));
> > @@ -292,7 +112,7 @@ static void vhost_user_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
> >      }
> >
> >      /* Kick right away to begin processing requests already in vring */
> > -    for (i = 0; i < s->dev.nvqs; i++) {
> > +    for (i = 0; i < vbc->dev.nvqs; i++) {
> >          VirtQueue *kick_vq = virtio_get_queue(vdev, i);
> >
> >          if (!virtio_queue_get_desc_addr(vdev, i)) {
> > @@ -305,14 +125,16 @@ static void vhost_user_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
> >  static void vhost_user_blk_reset(VirtIODevice *vdev)
> >  {
> >      VHostUserBlk *s = VHOST_USER_BLK(vdev);
> > +    VHostBlkCommon *vbc = VHOST_BLK_COMMON(s);
> >
> > -    vhost_dev_free_inflight(s->inflight);
> > +    vhost_dev_free_inflight(vbc->inflight);
> >  }
> >
> >  static int vhost_user_blk_connect(DeviceState *dev)
> >  {
> >      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> >      VHostUserBlk *s = VHOST_USER_BLK(vdev);
> > +    VHostBlkCommon *vbc = VHOST_BLK_COMMON(s);
> >      int ret = 0;
> >
> >      if (s->connected) {
> > @@ -320,14 +142,15 @@ static int vhost_user_blk_connect(DeviceState *dev)
> >      }
> >      s->connected = true;
> >
> > -    s->dev.nvqs = s->num_queues;
> > -    s->dev.vqs = s->vhost_vqs;
> > -    s->dev.vq_index = 0;
> > -    s->dev.backend_features = 0;
> > +    vbc->dev.nvqs = vbc->num_queues;
> > +    vbc->dev.vqs = vbc->vhost_vqs;
> > +    vbc->dev.vq_index = 0;
> > +    vbc->dev.backend_features = 0;
> >
> > -    vhost_dev_set_config_notifier(&s->dev, &blk_ops);
> > +    vhost_dev_set_config_notifier(&vbc->dev, &blk_ops);
> >
> > -    ret = vhost_dev_init(&s->dev, &s->vhost_user, VHOST_BACKEND_TYPE_USER, 0);
> > +    ret = vhost_dev_init(&vbc->dev, &s->vhost_user,
> > +                         VHOST_BACKEND_TYPE_USER, 0);
> >      if (ret < 0) {
> >          error_report("vhost-user-blk: vhost initialization failed: %s",
> >                       strerror(-ret));
> > @@ -336,7 +159,7 @@ static int vhost_user_blk_connect(DeviceState *dev)
> >
> >      /* restore vhost state */
> >      if (virtio_device_started(vdev, vdev->status)) {
> > -        ret = vhost_user_blk_start(vdev);
> > +        ret = vhost_blk_common_start(vbc);
> >          if (ret < 0) {
> >              error_report("vhost-user-blk: vhost start failed: %s",
> >                           strerror(-ret));
> > @@ -351,15 +174,16 @@ static void vhost_user_blk_disconnect(DeviceState *dev)
> >  {
> >      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> >      VHostUserBlk *s = VHOST_USER_BLK(vdev);
> > +    VHostBlkCommon *vbc = VHOST_BLK_COMMON(s);
> >
> >      if (!s->connected) {
> >          return;
> >      }
> >      s->connected = false;
> >
> > -    vhost_user_blk_stop(vdev);
> > +    vhost_blk_common_stop(vbc);
> >
> > -    vhost_dev_cleanup(&s->dev);
> > +    vhost_dev_cleanup(&vbc->dev);
> >  }
> >
> >  static void vhost_user_blk_event(void *opaque, QEMUChrEvent event,
> > @@ -392,6 +216,7 @@ static void vhost_user_blk_event(void *opaque, QEMUChrEvent event,
> >      DeviceState *dev = opaque;
> >      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> >      VHostUserBlk *s = VHOST_USER_BLK(vdev);
> > +    VHostBlkCommon *vbc = VHOST_BLK_COMMON(s);
> >
> >      switch (event) {
> >      case CHR_EVENT_OPENED:
> > @@ -430,7 +255,7 @@ static void vhost_user_blk_event(void *opaque, QEMUChrEvent event,
> >               * option for the general vhost code to get the dev state without
> >               * knowing its type (in this case vhost-user).
> >               */
> > -            s->dev.started = false;
> > +            vbc->dev.started = false;
> >          } else {
> >              vhost_user_blk_disconnect(dev);
> >          }
> > @@ -447,42 +272,24 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
> >  {
> >      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> >      VHostUserBlk *s = VHOST_USER_BLK(vdev);
> > +    VHostBlkCommon *vbc = VHOST_BLK_COMMON(s);
> >      Error *err = NULL;
> > -    int i, ret;
> > +    int ret;
> >
> >      if (!s->chardev.chr) {
> >          error_setg(errp, "vhost-user-blk: chardev is mandatory");
> >          return;
> >      }
> >
> > -    if (s->num_queues == VHOST_USER_BLK_AUTO_NUM_QUEUES) {
> > -        s->num_queues = 1;
> > -    }
> > -    if (!s->num_queues || s->num_queues > VIRTIO_QUEUE_MAX) {
> > -        error_setg(errp, "vhost-user-blk: invalid number of IO queues");
> > -        return;
> > -    }
> > -
> > -    if (!s->queue_size) {
> > -        error_setg(errp, "vhost-user-blk: queue size must be non-zero");
> > -        return;
> > -    }
> > -
> >      if (!vhost_user_init(&s->vhost_user, &s->chardev, errp)) {
> >          return;
> >      }
> >
> > -    virtio_init(vdev, "virtio-blk", VIRTIO_ID_BLOCK,
> > -                sizeof(struct virtio_blk_config));
> > -
> > -    s->virtqs = g_new(VirtQueue *, s->num_queues);
> > -    for (i = 0; i < s->num_queues; i++) {
> > -        s->virtqs[i] = virtio_add_queue(vdev, s->queue_size,
> > -                                        vhost_user_blk_handle_output);
> > +    vhost_blk_common_realize(vbc, vhost_user_blk_handle_output, &err);
> > +    if (err != NULL) {
> > +        error_propagate(errp, err);
> > +        goto blk_err;
> >      }
> > -
> > -    s->inflight = g_new0(struct vhost_inflight, 1);
> > -    s->vhost_vqs = g_new0(struct vhost_virtqueue, s->num_queues);
> >      s->connected = false;
> >
> >      qemu_chr_fe_set_handlers(&s->chardev,  NULL, NULL,
> > @@ -492,7 +299,7 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
> >  reconnect:
> >      if (qemu_chr_fe_wait_connected(&s->chardev, &err) < 0) {
> >          error_report_err(err);
> > -        goto virtio_err;
> > +        goto connect_err;
> >      }
> >
> >      /* check whether vhost_user_blk_connect() failed or not */
> > @@ -500,7 +307,7 @@ reconnect:
> >          goto reconnect;
> >      }
> >
> > -    ret = vhost_dev_get_config(&s->dev, (uint8_t *)&s->blkcfg,
> > +    ret = vhost_dev_get_config(&vbc->dev, (uint8_t *)&vbc->blkcfg,
> >                                 sizeof(struct virtio_blk_config));
> >      if (ret < 0) {
> >          error_report("vhost-user-blk: get block config failed");
> > @@ -513,16 +320,9 @@ reconnect:
> >                               NULL, true);
> >      return;
> >
> > -virtio_err:
> > -    g_free(s->vhost_vqs);
> > -    s->vhost_vqs = NULL;
> > -    g_free(s->inflight);
> > -    s->inflight = NULL;
> > -    for (i = 0; i < s->num_queues; i++) {
> > -        virtio_delete_queue(s->virtqs[i]);
> > -    }
> > -    g_free(s->virtqs);
> > -    virtio_cleanup(vdev);
> > +connect_err:
> > +    vhost_blk_common_unrealize(vbc);
> > +blk_err:
> >      vhost_user_cleanup(&s->vhost_user);
> >  }
> >
> > @@ -530,31 +330,24 @@ static void vhost_user_blk_device_unrealize(DeviceState *dev)
> >  {
> >      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> >      VHostUserBlk *s = VHOST_USER_BLK(dev);
> > -    int i;
> > +    VHostBlkCommon *vbc = VHOST_BLK_COMMON(s);
> >
> >      virtio_set_status(vdev, 0);
> >      qemu_chr_fe_set_handlers(&s->chardev,  NULL, NULL, NULL,
> >                               NULL, NULL, NULL, false);
> > -    vhost_dev_cleanup(&s->dev);
> > -    vhost_dev_free_inflight(s->inflight);
> > -    g_free(s->vhost_vqs);
> > -    s->vhost_vqs = NULL;
> > -    g_free(s->inflight);
> > -    s->inflight = NULL;
> > -
> > -    for (i = 0; i < s->num_queues; i++) {
> > -        virtio_delete_queue(s->virtqs[i]);
> > -    }
> > -    g_free(s->virtqs);
> > -    virtio_cleanup(vdev);
> > +    vhost_dev_cleanup(&vbc->dev);
> > +    vhost_dev_free_inflight(vbc->inflight);
> > +    vhost_blk_common_unrealize(vbc);
> >      vhost_user_cleanup(&s->vhost_user);
> >  }
> >
> >  static void vhost_user_blk_instance_init(Object *obj)
> >  {
> > -    VHostUserBlk *s = VHOST_USER_BLK(obj);
> > +    VHostBlkCommon *vbc = VHOST_BLK_COMMON(obj);
> > +
> > +    vbc->feature_bits = user_feature_bits;
> >
> > -    device_add_bootindex_property(obj, &s->bootindex, "bootindex",
> > +    device_add_bootindex_property(obj, &vbc->bootindex, "bootindex",
> >                                    "/disk@0,0", DEVICE(obj));
> >  }
> >
> > @@ -570,10 +363,10 @@ static const VMStateDescription vmstate_vhost_user_blk = {
> >
> >  static Property vhost_user_blk_properties[] = {
> >      DEFINE_PROP_CHR("chardev", VHostUserBlk, chardev),
> > -    DEFINE_PROP_UINT16("num-queues", VHostUserBlk, num_queues,
> > -                       VHOST_USER_BLK_AUTO_NUM_QUEUES),
> > -    DEFINE_PROP_UINT32("queue-size", VHostUserBlk, queue_size, 128),
> > -    DEFINE_PROP_BIT("config-wce", VHostUserBlk, config_wce, 0, true),
> > +    DEFINE_PROP_UINT16("num-queues", VHostBlkCommon, num_queues,
> > +                       VHOST_BLK_AUTO_NUM_QUEUES),
> > +    DEFINE_PROP_UINT32("queue-size", VHostBlkCommon, queue_size, 128),
> > +    DEFINE_PROP_BIT("config-wce", VHostBlkCommon, config_wce, 0, true),
> >      DEFINE_PROP_END_OF_LIST(),
> >  };
> >
> > @@ -587,16 +380,13 @@ static void vhost_user_blk_class_init(ObjectClass *klass, void *data)
> >      set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> >      vdc->realize = vhost_user_blk_device_realize;
> >      vdc->unrealize = vhost_user_blk_device_unrealize;
> > -    vdc->get_config = vhost_user_blk_update_config;
> > -    vdc->set_config = vhost_user_blk_set_config;
> > -    vdc->get_features = vhost_user_blk_get_features;
> >      vdc->set_status = vhost_user_blk_set_status;
> >      vdc->reset = vhost_user_blk_reset;
> >  }
> >
> >  static const TypeInfo vhost_user_blk_info = {
> >      .name = TYPE_VHOST_USER_BLK,
> > -    .parent = TYPE_VIRTIO_DEVICE,
> > +    .parent = TYPE_VHOST_BLK_COMMON,
> >      .instance_size = sizeof(VHostUserBlk),
> >      .instance_init = vhost_user_blk_instance_init,
> >      .class_init = vhost_user_blk_class_init,
> > diff --git a/hw/virtio/vhost-user-blk-pci.c b/hw/virtio/vhost-user-blk-pci.c
> > index 33b404d8a2..8fb01552f5 100644
> > --- a/hw/virtio/vhost-user-blk-pci.c
> > +++ b/hw/virtio/vhost-user-blk-pci.c
> > @@ -54,13 +54,14 @@ static void vhost_user_blk_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
> >  {
> >      VHostUserBlkPCI *dev = VHOST_USER_BLK_PCI(vpci_dev);
> >      DeviceState *vdev = DEVICE(&dev->vdev);
> > +    VHostBlkCommon *vbc = VHOST_BLK_COMMON(&dev->vdev);
> >
> > -    if (dev->vdev.num_queues == VHOST_USER_BLK_AUTO_NUM_QUEUES) {
> > -        dev->vdev.num_queues = virtio_pci_optimal_num_queues(0);
> > +    if (vbc->num_queues == VHOST_BLK_AUTO_NUM_QUEUES) {
> > +        vbc->num_queues = virtio_pci_optimal_num_queues(0);
> >      }
> >
> >      if (vpci_dev->nvectors == DEV_NVECTORS_UNSPECIFIED) {
> > -        vpci_dev->nvectors = dev->vdev.num_queues + 1;
> > +        vpci_dev->nvectors = vbc->num_queues + 1;
> >      }
> >
> >      qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
> > diff --git a/include/hw/virtio/vhost-blk-common.h b/include/hw/virtio/vhost-blk-common.h
> > new file mode 100644
> > index 0000000000..1a12a58b60
> > --- /dev/null
> > +++ b/include/hw/virtio/vhost-blk-common.h
> > @@ -0,0 +1,50 @@
> > +/*
> > + * Parent class for vhost based block devices
> > + *
> > + * Copyright (C) 2021 Bytedance Inc. and/or its affiliates. All rights reserved.
> > + *
> > + * Author:
> > + *   Xie Yongji <xieyongji@bytedance.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2.  See
> > + * the COPYING file in the top-level directory.
> > + *
> > + */
> > +
> > +#ifndef VHOST_BLK_COMMON_H
> > +#define VHOST_BLK_COMMON_H
> > +
> > +#include "standard-headers/linux/virtio_blk.h"
> > +#include "hw/virtio/vhost.h"
> > +#include "qom/object.h"
> > +
> > +#define TYPE_VHOST_BLK_COMMON "vhost-blk-common"
> > +OBJECT_DECLARE_SIMPLE_TYPE(VHostBlkCommon, VHOST_BLK_COMMON)
> > +
> > +#define VHOST_BLK_AUTO_NUM_QUEUES UINT16_MAX
> > +
> > +struct VHostBlkCommon {
> > +    VirtIODevice parent_obj;
> > +    int32_t bootindex;
> > +    struct virtio_blk_config blkcfg;
> > +    uint16_t num_queues;
> > +    uint32_t queue_size;
> > +    const int *feature_bits;
> > +    uint32_t config_wce;
> > +    struct vhost_dev dev;
> > +    struct vhost_inflight *inflight;
> > +    struct vhost_virtqueue *vhost_vqs;
> > +    VirtQueue **virtqs;
>
> As discussed above please rename this, and add a comment explaining that
> it prevents stopping an already stopped device.
>

Will do it.

> > +    bool started;
> > +};
> > +
> > +extern const VhostDevConfigOps blk_ops;
> > +
> > +int vhost_blk_common_start(VHostBlkCommon *vbc);
> > +void vhost_blk_common_stop(VHostBlkCommon *vbc);
> > +void vhost_blk_common_realize(VHostBlkCommon *vbc,
> > +                              VirtIOHandleOutput handle_output,
> > +                              Error **errp);
> > +void vhost_blk_common_unrealize(VHostBlkCommon *vbc);
> > +
> > +#endif
> > diff --git a/include/hw/virtio/vhost-user-blk.h b/include/hw/virtio/vhost-user-blk.h
> > index 7c91f15040..100275602f 100644
> > --- a/include/hw/virtio/vhost-user-blk.h
> > +++ b/include/hw/virtio/vhost-user-blk.h
> > @@ -15,32 +15,18 @@
> >  #ifndef VHOST_USER_BLK_H
> >  #define VHOST_USER_BLK_H
> >
> > -#include "standard-headers/linux/virtio_blk.h"
> > -#include "hw/block/block.h"
> >  #include "chardev/char-fe.h"
> > -#include "hw/virtio/vhost.h"
> >  #include "hw/virtio/vhost-user.h"
> > +#include "hw/virtio/vhost-blk-common.h"
> >  #include "qom/object.h"
> >
> >  #define TYPE_VHOST_USER_BLK "vhost-user-blk"
> >  OBJECT_DECLARE_SIMPLE_TYPE(VHostUserBlk, VHOST_USER_BLK)
> >
> > -#define VHOST_USER_BLK_AUTO_NUM_QUEUES UINT16_MAX
> > -
> >  struct VHostUserBlk {
> > -    VirtIODevice parent_obj;
> > +    VHostBlkCommon parent_obj;
> >      CharBackend chardev;
> > -    int32_t bootindex;
> > -    struct virtio_blk_config blkcfg;
> > -    uint16_t num_queues;
> > -    uint32_t queue_size;
> > -    uint32_t config_wce;
> > -    struct vhost_dev dev;
> > -    struct vhost_inflight *inflight;
> >      VhostUserState vhost_user;
> > -    struct vhost_virtqueue *vhost_vqs;
> > -    VirtQueue **virtqs;
> > -
>
> Please fix this comment to explain that the started_vu now lives in
> vhost-blk-common.
>

Fine.

Thanks,
Yongji

