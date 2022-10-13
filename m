Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F085FE3C0
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 23:07:40 +0200 (CEST)
Received: from localhost ([::1]:41076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj5QY-0005Oo-NP
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 17:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oj5LC-00014B-Qi
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:02:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oj5L8-0006zY-Qt
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:02:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665694921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jlSuHx9ms+rvayv+swwAWLlX+4ah/zIPAIMuy4hOdDk=;
 b=arJ2b9ikYQmBDlNqLgkKr43lWKD2lbBq4DMtG9itEJQJ5zqKX/Z8kaabfYXcGIUIlqvGzz
 uqrCLOCEAfjk2m+FuGoVS/ZfWeyX4zIcEx0wOHuudZWZPRzxQHiY6yU3e1U43BI/K99gnc
 sYc3V3AeK3h+gRSlU6JleTlteWjRibg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-623-gAxd-ddLOSCnTMXAZbJm6A-1; Thu, 13 Oct 2022 17:02:00 -0400
X-MC-Unique: gAxd-ddLOSCnTMXAZbJm6A-1
Received: by mail-wm1-f69.google.com with SMTP id
 k22-20020a05600c0b5600b003c6cf5c5592so1320121wmr.3
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 14:02:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jlSuHx9ms+rvayv+swwAWLlX+4ah/zIPAIMuy4hOdDk=;
 b=EZH635ynrZx8nOCHCfZgX4sbnOMNS1tjtzQGvw+FUMSswCuqtIc1/JkKueBJdG/9hD
 mVqNRD36/qcduq8GSBoYskaxP7OnfgpqZ3PItO+bIPn3IRG02NBr11c7mGnRLGDfiyYz
 n3mKTPgzqgc0Bk5gVIG0wHvl+e1BwQ3eS+KOwgjCP5RafvHDZGjJb0GpwWn/gaLbg/9+
 r4VjInbfCL/A8zgWCmzH+wSmKNK8ZeBR8U3I/XGqb83Je0NDAvrRHQWxrk2CaPJS+XJ8
 ck8veGpuyQp9mwp+CFN75WxrKFWn71tgX9M89SH21JSsOSCfS7LQHsS7D+qpIcAUHDx/
 VwLg==
X-Gm-Message-State: ACrzQf3hzgsAnCXDpfXfj3y9jS9RMmCOB2rRRg48peOGUOWMUJjdH0HM
 OhpMGcne9zELSgWt2rfHwRHiMhrwRrzZgd/D36cWtvT8z68RexNwXwayMzOGEhjheKauwjYdoFK
 pYDtLuIsPcZRuNQo=
X-Received: by 2002:a05:600c:190a:b0:3a8:43b8:53e3 with SMTP id
 j10-20020a05600c190a00b003a843b853e3mr1244962wmq.4.1665694918355; 
 Thu, 13 Oct 2022 14:01:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5ra+7rVMtEtn5fl6My+bnELtHcPXLUPjrytvQXK3Ez51sAfx+2pwlAAXaU8cln2ww4Rzt5Eg==
X-Received: by 2002:a05:600c:190a:b0:3a8:43b8:53e3 with SMTP id
 j10-20020a05600c190a00b003a843b853e3mr1244922wmq.4.1665694917796; 
 Thu, 13 Oct 2022 14:01:57 -0700 (PDT)
Received: from redhat.com ([2.54.162.123]) by smtp.gmail.com with ESMTPSA id
 o13-20020a5d670d000000b0022cd0c8c696sm398482wru.103.2022.10.13.14.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 14:01:56 -0700 (PDT)
Date: Thu, 13 Oct 2022 17:01:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
Cc: stefanha@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 kwolf@redhat.com, hreitz@redhat.com, den@virtuozzo.com,
 andrey.drobyshev@virtuozzo.com
Subject: Re: [RFC PATCH v2 1/1] block: add vhost-blk backend
Message-ID: <20221013170128-mutt-send-email-mst@kernel.org>
References: <20221013203130.690327-1-andrey.zhadchenko@virtuozzo.com>
 <20221013203130.690327-2-andrey.zhadchenko@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013203130.690327-2-andrey.zhadchenko@virtuozzo.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Oct 13, 2022 at 11:31:30PM +0300, Andrey Zhadchenko wrote:
> Although QEMU virtio is quite fast, there is still some room for
> improvements. Disk latency can be reduced if we handle virito-blk requests
> in host kernel istead of passing them to QEMU. The patch adds vhost-blk
> backend which sets up vhost-blk kernel module to process requests.
> 
> test setup and results:
> fio --direct=1 --rw=randread  --bs=4k  --ioengine=libaio --iodepth=128
> QEMU drive options: cache=none
> filesystem: xfs
> 
> SSD:
>                | randread, IOPS  | randwrite, IOPS |
> Host           |      95.8k	 |	85.3k	   |
> QEMU virtio    |      61.5k	 |	79.9k	   |
> QEMU vhost-blk |      95.6k	 |	84.3k	   |
> 
> RAMDISK (vq == vcpu == numjobs):
>                  | randread, IOPS | randwrite, IOPS |
> virtio, 1vcpu    |	133k	  |	 133k       |
> virtio, 2vcpu    |	305k	  |	 306k       |
> virtio, 4vcpu    |	310k	  |	 298k       |
> virtio, 8vcpu    |	271k	  |	 252k       |
> vhost-blk, 1vcpu |      110k      |      113k       |
> vhost-blk, 2vcpu |      247k      |      252k       |
> vhost-blk, 4vcpu |      558k      |      556k       |
> vhost-blk, 8vcpu |      576k      |      575k       | *single kernel thread
> vhost-blk, 8vcpu |	803k	  |	 779k       | *two kernel threads
> 
> v2:
>  - fix g_new() to g_new0() for vq allocations
>  - add multithreading support
>  - fix last agrument in vhost_dev_init()
>  - kick all vqueues in start, not only the first one
> 
> Signed-off-by: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>

Could we get feedback from block maintainers on this please?

> ---
>  hw/block/Kconfig              |   5 +
>  hw/block/meson.build          |   4 +
>  hw/block/vhost-blk.c          | 403 ++++++++++++++++++++++++++++++++++
>  hw/virtio/meson.build         |   3 +
>  hw/virtio/vhost-blk-pci.c     | 102 +++++++++
>  include/hw/virtio/vhost-blk.h |  52 +++++
>  meson.build                   |   6 +
>  meson_options.txt             |   2 +
>  scripts/meson-buildoptions.sh |   3 +
>  9 files changed, 580 insertions(+)
>  create mode 100644 hw/block/vhost-blk.c
>  create mode 100644 hw/virtio/vhost-blk-pci.c
>  create mode 100644 include/hw/virtio/vhost-blk.h
> 
> diff --git a/hw/block/Kconfig b/hw/block/Kconfig
> index 9e8f28f982..b4286ad10e 100644
> --- a/hw/block/Kconfig
> +++ b/hw/block/Kconfig
> @@ -36,6 +36,11 @@ config VIRTIO_BLK
>      default y
>      depends on VIRTIO
>  
> +config VHOST_BLK
> +    bool
> +    default y
> +    depends on VIRTIO && LINUX
> +
>  config VHOST_USER_BLK
>      bool
>      # Only PCI devices are provided for now
> diff --git a/hw/block/meson.build b/hw/block/meson.build
> index 2389326112..caf9bedff3 100644
> --- a/hw/block/meson.build
> +++ b/hw/block/meson.build
> @@ -19,4 +19,8 @@ softmmu_ss.add(when: 'CONFIG_TC58128', if_true: files('tc58128.c'))
>  specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c'))
>  specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk.c'))
>  
> +if have_vhost_blk
> +  specific_ss.add(files('vhost-blk.c'))
> +endif
> +
>  subdir('dataplane')
> diff --git a/hw/block/vhost-blk.c b/hw/block/vhost-blk.c
> new file mode 100644
> index 0000000000..2ebd09299c
> --- /dev/null
> +++ b/hw/block/vhost-blk.c
> @@ -0,0 +1,403 @@
> +/*
> + * Copyright (c) 2022 Virtuozzo International GmbH.
> + * Author: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
> + *
> + * vhost-blk is host kernel accelerator for virtio-blk.
> + *
> + * This work is licensed under the terms of the GNU LGPL, version 2 or later.
> + * See the COPYING.LIB file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qemu/error-report.h"
> +#include "qom/object.h"
> +#include "hw/qdev-core.h"
> +#include "hw/boards.h"
> +#include "hw/virtio/vhost.h"
> +#include "hw/virtio/vhost-blk.h"
> +#include "hw/virtio/virtio.h"
> +#include "hw/virtio/virtio-blk.h"
> +#include "hw/virtio/virtio-bus.h"
> +#include "hw/virtio/virtio-access.h"
> +#include "hw/virtio/virtio-pci.h"
> +#include "sysemu/sysemu.h"
> +#include "linux-headers/linux/vhost.h"
> +#include <sys/ioctl.h>
> +#include <linux/fs.h>
> +
> +static int vhost_blk_start(VirtIODevice *vdev)
> +{
> +    VHostBlk *s = VHOST_BLK(vdev);
> +    struct vhost_vring_file backend;
> +    int ret, i, nworkers;
> +    int *fd = blk_bs(s->conf.conf.blk)->file->bs->opaque;
> +    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
> +    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
> +
> +    if (!k->set_guest_notifiers) {
> +        error_report("vhost-blk: binding does not support guest notifiers");
> +        return -ENOSYS;
> +    }
> +
> +    if (s->vhost_started) {
> +        return 0;
> +    }
> +
> +    if (ioctl(s->vhostfd, VHOST_SET_OWNER, NULL)) {
> +        error_report("vhost-blk: unable to set owner");
> +        return -ENOSYS;
> +    }
> +
> +    nworkers = s->conf.num_threads;
> +    if (nworkers != 1 && ioctl(s->vhostfd, VHOST_SET_NWORKERS, &nworkers)) {
> +        error_report("vhost-blk: unable to set number of kernel threads");
> +        return -ENOSYS;
> +    }
> +
> +    ret = k->set_guest_notifiers(qbus->parent, s->dev.nvqs, true);
> +    if (ret < 0) {
> +        error_report("vhost-blk: unable to bind guest notifiers");
> +        goto out;
> +    }
> +
> +    ret = vhost_dev_enable_notifiers(&s->dev, vdev);
> +    if (ret < 0) {
> +        error_report("vhost-blk: unable to enable dev notifiers", errno);
> +        return ret;
> +    }
> +
> +    s->dev.acked_features = vdev->guest_features & s->dev.backend_features;
> +
> +    ret = vhost_dev_start(&s->dev, vdev);
> +    if (ret < 0) {
> +        error_report("vhost-blk: unable to start vhost dev");
> +        return ret;
> +    }
> +
> +    memset(&backend, 0, sizeof(backend));
> +    backend.index = 0;
> +    backend.fd = *fd;
> +    if (ioctl(s->vhostfd, VHOST_BLK_SET_BACKEND, &backend)) {
> +        error_report("vhost-blk: unable to set backend");
> +        ret = -errno;
> +        goto out;
> +    }
> +
> +    for (i = 0; i < s->dev.nvqs; i++) {
> +        vhost_virtqueue_mask(&s->dev, vdev, i, false);
> +    }
> +
> +    for (i = 0; i < s->dev.nvqs; i++) {
> +        event_notifier_set(virtio_queue_get_host_notifier(virtio_get_queue(vdev, i)));
> +    }
> +
> +    s->vhost_started = true;
> +
> +    return 0;
> +
> +out:
> +    vhost_dev_stop(&s->dev, vdev);
> +    return ret;
> +
> +}
> +
> +static void vhost_blk_stop(VirtIODevice *vdev)
> +{
> +    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
> +    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
> +    VHostBlk *s = VHOST_BLK(vdev);
> +    int ret;
> +
> +    if (!s->vhost_started) {
> +        return;
> +    }
> +
> +    ret = k->set_guest_notifiers(qbus->parent, s->dev.nvqs, false);
> +    if (ret < 0) {
> +        error_report("vhost-blk: unable to unbind guest notifiers");
> +    }
> +    vhost_dev_disable_notifiers(&s->dev, vdev);
> +    vhost_dev_stop(&s->dev, vdev);
> +
> +    s->vhost_started = false;
> +}
> +
> +static void vhost_blk_reset(VirtIODevice *vdev)
> +{
> +    VHostBlk *s = VHOST_BLK(vdev);
> +    int ret;
> +
> +    vhost_blk_stop(vdev);
> +    ret = ioctl(s->vhostfd, VHOST_RESET_OWNER, NULL);
> +    if (ret && errno != EPERM) {
> +            error_report("vhost-blk: failed to reset owner %d", errno);
> +    }
> +}
> +
> +static void vhost_blk_set_status(VirtIODevice *vdev, uint8_t status)
> +{
> +    if (status & (VIRTIO_CONFIG_S_NEEDS_RESET | VIRTIO_CONFIG_S_FAILED)) {
> +        vhost_blk_stop(vdev);
> +        return;
> +    }
> +
> +    if (!(status & VIRTIO_CONFIG_S_DRIVER_OK)) {
> +        return;
> +    }
> +
> +    if (vhost_blk_start(vdev)) {
> +        error_report("vhost-blk: failed to start");
> +    }
> +}
> +
> +static void vhost_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
> +{
> +}
> +
> +static void vhost_blk_device_realize(DeviceState *dev, Error **errp)
> +{
> +    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> +    VHostBlk *s = VHOST_BLK(vdev);
> +    VhostBlkConf *conf = &s->conf;
> +    int i, ret;
> +
> +    if (!conf->conf.blk) {
> +        error_setg(errp, "vhost-blk: drive property not set");
> +        return;
> +    }
> +
> +    if (!blk_is_inserted(conf->conf.blk)) {
> +        error_setg(errp, "vhost-blk: device needs media, but drive is empty");
> +        return;
> +    }
> +
> +    if (conf->num_queues == VHOST_BLK_AUTO_NUM_QUEUES) {
> +        conf->num_queues = MIN(virtio_pci_optimal_num_queues(0),
> +                               VHOST_BLK_MAX_QUEUES);
> +    }
> +
> +    if (!conf->num_queues) {
> +        error_setg(errp, "vhost-blk: num-queues property must be larger than 0");
> +        return;
> +    }
> +
> +    if (conf->queue_size <= 2) {
> +        error_setg(errp, "vhost-blk: invalid queue-size property (%" PRIu16 "), "
> +                   "must be > 2", conf->queue_size);
> +        return;
> +    }
> +
> +    if (!is_power_of_2(conf->queue_size) ||
> +        conf->queue_size > VIRTQUEUE_MAX_SIZE) {
> +        error_setg(errp, "vhost_blk: invalid queue-size property (%" PRIu16 "), "
> +                   "must be a power of 2 (max %d)",
> +                   conf->queue_size, VIRTQUEUE_MAX_SIZE);
> +        return;
> +    }
> +
> +    if (!blkconf_apply_backend_options(&conf->conf,
> +                                       !blk_supports_write_perm(conf->conf.blk),
> +                                       true, errp)) {
> +        return;
> +    }
> +
> +    if (!blkconf_geometry(&conf->conf, NULL, 65535, 255, 255, errp)) {
> +        return;
> +    }
> +
> +    if (!blkconf_blocksizes(&conf->conf, errp)) {
> +        return;
> +    }
> +
> +    s->dev.nvqs = conf->num_queues;
> +    s->dev.max_queues = conf->num_queues;
> +    s->dev.vqs = g_new0(struct vhost_virtqueue, s->dev.nvqs);
> +    s->dev.vq_index = 0;
> +
> +    virtio_init(vdev, VIRTIO_ID_BLOCK, sizeof(struct virtio_blk_config));
> +
> +    for (i = 0; i < conf->num_queues; i++) {
> +        virtio_add_queue(vdev, conf->queue_size, vhost_blk_handle_output);
> +    }
> +
> +    s->vhostfd = open("/dev/vhost-blk", O_RDWR);
> +    if (s->vhostfd < 0) {
> +        error_setg(errp, "vhost-blk: unable to open /dev/vhost-blk");
> +        goto cleanup;
> +    }
> +
> +    s->dev.acked_features = 0;
> +    ret = ioctl(s->vhostfd, VHOST_GET_FEATURES, &s->dev.backend_features);
> +    if (ret < 0) {
> +        error_setg(errp, "vhost-blk: unable to get backend features");
> +        goto cleanup;
> +    }
> +
> +    ret = vhost_dev_init(&s->dev, (void *)((size_t)s->vhostfd),
> +                         VHOST_BACKEND_TYPE_KERNEL, 0, NULL);
> +    if (ret < 0) {
> +        error_setg(errp, "vhost-blk: vhost initialization failed: %s",
> +                strerror(-ret));
> +        goto cleanup;
> +    }
> +
> +    return;
> +
> +cleanup:
> +    g_free(s->dev.vqs);
> +    close(s->vhostfd);
> +    for (i = 0; i < conf->num_queues; i++) {
> +        virtio_del_queue(vdev, i);
> +    }
> +    virtio_cleanup(vdev);
> +    return;
> +}
> +
> +static void vhost_blk_device_unrealize(DeviceState *dev)
> +{
> +    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> +    VHostBlk *s = VHOST_BLK(dev);
> +
> +    vhost_blk_set_status(vdev, 0);
> +    vhost_dev_cleanup(&s->dev);
> +    g_free(s->dev.vqs);
> +    virtio_cleanup(vdev);
> +}
> +
> +static const int user_feature_bits[] = {
> +    VIRTIO_BLK_F_FLUSH,
> +    VIRTIO_RING_F_INDIRECT_DESC,
> +    VIRTIO_RING_F_EVENT_IDX,
> +    VHOST_INVALID_FEATURE_BIT
> +};
> +
> +
> +static uint64_t vhost_blk_get_features(VirtIODevice *vdev,
> +                                            uint64_t features,
> +                                            Error **errp)
> +{
> +    VHostBlk *s = VHOST_BLK(vdev);
> +    uint64_t res;
> +
> +    features |= s->host_features;
> +
> +    virtio_add_feature(&features, VIRTIO_BLK_F_BLK_SIZE);
> +    virtio_add_feature(&features, VIRTIO_BLK_F_SEG_MAX);
> +    virtio_add_feature(&features, VIRTIO_BLK_F_GEOMETRY);
> +    virtio_add_feature(&features, VIRTIO_BLK_F_TOPOLOGY);
> +    virtio_add_feature(&features, VIRTIO_BLK_F_SIZE_MAX);
> +
> +    virtio_add_feature(&features, VIRTIO_F_VERSION_1);
> +
> +    if (!blk_is_writable(s->conf.conf.blk)) {
> +        virtio_add_feature(&features, VIRTIO_BLK_F_RO);
> +    }
> +
> +    if (s->conf.num_queues > 1) {
> +        virtio_add_feature(&features, VIRTIO_BLK_F_MQ);
> +    }
> +
> +    res = vhost_get_features(&s->dev, user_feature_bits, features);
> +
> +    return res;
> +}
> +
> +static void vhost_blk_update_config(VirtIODevice *vdev, uint8_t *config)
> +{
> +    VHostBlk *s = VHOST_BLK(vdev);
> +    BlockConf *conf = &s->conf.conf;
> +    struct virtio_blk_config blkcfg;
> +    uint64_t capacity;
> +    int64_t length;
> +    int blk_size = conf->logical_block_size;
> +
> +    blk_get_geometry(s->conf.conf.blk, &capacity);
> +    memset(&blkcfg, 0, sizeof(blkcfg));
> +    virtio_stq_p(vdev, &blkcfg.capacity, capacity);
> +    virtio_stl_p(vdev, &blkcfg.seg_max, s->conf.queue_size - 2);
> +    virtio_stw_p(vdev, &blkcfg.geometry.cylinders, conf->cyls);
> +    virtio_stl_p(vdev, &blkcfg.blk_size, blk_size);
> +    blkcfg.geometry.heads = conf->heads;
> +
> +    length = blk_getlength(s->conf.conf.blk);
> +    if (length > 0 && length / conf->heads / conf->secs % blk_size) {
> +        unsigned short mask;
> +
> +        mask = (s->conf.conf.logical_block_size / BDRV_SECTOR_SIZE) - 1;
> +        blkcfg.geometry.sectors = conf->secs & ~mask;
> +    } else {
> +        blkcfg.geometry.sectors = conf->secs;
> +    }
> +
> +    blkcfg.size_max = 0;
> +    blkcfg.physical_block_exp = get_physical_block_exp(conf);
> +    blkcfg.alignment_offset = 0;
> +    virtio_stw_p(vdev, &blkcfg.num_queues, s->conf.num_queues);
> +
> +    memcpy(config, &blkcfg, sizeof(struct virtio_blk_config));
> +}
> +
> +static Property vhost_blk_properties[] = {
> +    DEFINE_BLOCK_PROPERTIES(VHostBlk, conf.conf),
> +    DEFINE_PROP_UINT16("num-queues", VHostBlk, conf.num_queues,
> +                       VHOST_BLK_AUTO_NUM_QUEUES),
> +    DEFINE_PROP_UINT16("queue-size", VHostBlk, conf.queue_size, 256),
> +    DEFINE_PROP_UINT16("num-threads", VHostBlk, conf.num_threads, 1),
> +/* Discard and write-zeroes not yet implemented in kernel module */
> +    DEFINE_PROP_BIT64("discard", VHostBlk, host_features,
> +                      VIRTIO_BLK_F_DISCARD, false),
> +    DEFINE_PROP_BIT64("write-zeroes", VHostBlk, host_features,
> +                      VIRTIO_BLK_F_WRITE_ZEROES, false),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static const VMStateDescription vmstate_vhost_blk = {
> +    .name = "vhost-blk",
> +    .minimum_version_id = 1,
> +    .version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_VIRTIO_DEVICE,
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
> +static void vhost_blk_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
> +
> +    device_class_set_props(dc, vhost_blk_properties);
> +    dc->vmsd = &vmstate_vhost_blk;
> +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> +    vdc->realize = vhost_blk_device_realize;
> +    vdc->unrealize = vhost_blk_device_unrealize;
> +    vdc->get_config = vhost_blk_update_config;
> +    vdc->get_features = vhost_blk_get_features;
> +    vdc->set_status = vhost_blk_set_status;
> +    vdc->reset = vhost_blk_reset;
> +}
> +
> +static void vhost_blk_instance_init(Object *obj)
> +{
> +    VHostBlk *s = VHOST_BLK(obj);
> +
> +    device_add_bootindex_property(obj, &s->conf.conf.bootindex,
> +                                  "bootindex", "/disk@0,0",
> +                                  DEVICE(obj));
> +}
> +
> +static const TypeInfo vhost_blk_info = {
> +    .name = TYPE_VHOST_BLK,
> +    .parent = TYPE_VIRTIO_DEVICE,
> +    .instance_size = sizeof(VHostBlk),
> +    .instance_init = vhost_blk_instance_init,
> +    .class_init = vhost_blk_class_init,
> +};
> +
> +static void virtio_register_types(void)
> +{
> +    type_register_static(&vhost_blk_info);
> +}
> +
> +type_init(virtio_register_types)
> diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
> index 7e8877fd64..fb2c0e7242 100644
> --- a/hw/virtio/meson.build
> +++ b/hw/virtio/meson.build
> @@ -40,6 +40,9 @@ virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_RNG', if_true: files('vhost-user-rng-
>  virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_SCSI', if_true: files('vhost-user-scsi-pci.c'))
>  virtio_pci_ss.add(when: 'CONFIG_VHOST_SCSI', if_true: files('vhost-scsi-pci.c'))
>  virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('vhost-user-fs-pci.c'))
> +if have_vhost_blk
> +  virtio_ss.add(files('vhost-blk-pci.c'))
> +endif
>  
>  virtio_pci_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('virtio-crypto-pci.c'))
>  virtio_pci_ss.add(when: 'CONFIG_VIRTIO_INPUT_HOST', if_true: files('virtio-input-host-pci.c'))
> diff --git a/hw/virtio/vhost-blk-pci.c b/hw/virtio/vhost-blk-pci.c
> new file mode 100644
> index 0000000000..f3b6e112b4
> --- /dev/null
> +++ b/hw/virtio/vhost-blk-pci.c
> @@ -0,0 +1,102 @@
> +/*
> + * Copyright (c) 2022 Virtuozzo International GmbH.
> + * Author: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
> + *
> + * vhost-blk PCI bindings
> + *
> + * This work is licensed under the terms of the GNU LGPL, version 2 or later.
> + * See the COPYING.LIB file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "standard-headers/linux/virtio_pci.h"
> +#include "hw/virtio/virtio.h"
> +#include "hw/virtio/vhost-blk.h"
> +#include "hw/pci/pci.h"
> +#include "hw/qdev-properties.h"
> +#include "qapi/error.h"
> +#include "qemu/error-report.h"
> +#include "qemu/module.h"
> +#include "hw/virtio/virtio-pci.h"
> +#include "qom/object.h"
> +
> +typedef struct VHostBlkPCI VHostBlkPCI;
> +
> +/*
> + * vhost-blk-pci: This extends VirtioPCIProxy.
> + */
> +#define TYPE_VHOST_BLK_PCI "vhost-blk-pci-base"
> +DECLARE_INSTANCE_CHECKER(VHostBlkPCI, VHOST_BLK_PCI,
> +                         TYPE_VHOST_BLK_PCI)
> +
> +struct VHostBlkPCI {
> +    VirtIOPCIProxy parent_obj;
> +    VHostBlk vdev;
> +};
> +
> +static Property vhost_blk_pci_properties[] = {
> +    DEFINE_PROP_UINT32("class", VirtIOPCIProxy, class_code, 0),
> +    DEFINE_PROP_UINT32("vectors", VirtIOPCIProxy, nvectors,
> +                       DEV_NVECTORS_UNSPECIFIED),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void vhost_blk_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
> +{
> +    VHostBlkPCI *dev = VHOST_BLK_PCI(vpci_dev);
> +    DeviceState *vdev = DEVICE(&dev->vdev);
> +
> +    if (dev->vdev.conf.num_queues == VHOST_BLK_AUTO_NUM_QUEUES) {
> +        dev->vdev.conf.num_queues = MIN(virtio_pci_optimal_num_queues(0),
> +                                        VHOST_BLK_MAX_QUEUES);
> +    }
> +
> +    if (vpci_dev->nvectors == DEV_NVECTORS_UNSPECIFIED) {
> +        vpci_dev->nvectors = dev->vdev.conf.num_queues + 1;
> +    }
> +
> +    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
> +}
> +
> +static void vhost_blk_pci_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    VirtioPCIClass *k = VIRTIO_PCI_CLASS(klass);
> +    PCIDeviceClass *pcidev_k = PCI_DEVICE_CLASS(klass);
> +
> +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> +    device_class_set_props(dc, vhost_blk_pci_properties);
> +    k->realize = vhost_blk_pci_realize;
> +    pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
> +    pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_BLOCK;
> +    pcidev_k->revision = VIRTIO_PCI_ABI_VERSION;
> +    pcidev_k->class_id = PCI_CLASS_STORAGE_SCSI;
> +}
> +
> +static void vhost_blk_pci_instance_init(Object *obj)
> +{
> +    VHostBlkPCI *dev = VHOST_BLK_PCI(obj);
> +
> +    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
> +                                TYPE_VHOST_BLK);
> +    object_property_add_alias(obj, "bootindex", OBJECT(&dev->vdev),
> +                              "bootindex");
> +}
> +
> +static const VirtioPCIDeviceTypeInfo vhost_blk_pci_info = {
> +    .base_name               = TYPE_VHOST_BLK_PCI,
> +    .generic_name            = "vhost-blk-pci",
> +    .transitional_name       = "vhost-blk-pci-transitional",
> +    .non_transitional_name   = "vhost-blk-pci-non-transitional",
> +    .instance_size  = sizeof(VHostBlkPCI),
> +    .instance_init  = vhost_blk_pci_instance_init,
> +    .class_init     = vhost_blk_pci_class_init,
> +};
> +
> +static void vhost_blk_pci_register(void)
> +{
> +    virtio_pci_types_register(&vhost_blk_pci_info);
> +}
> +
> +type_init(vhost_blk_pci_register)
> diff --git a/include/hw/virtio/vhost-blk.h b/include/hw/virtio/vhost-blk.h
> new file mode 100644
> index 0000000000..58f847077d
> --- /dev/null
> +++ b/include/hw/virtio/vhost-blk.h
> @@ -0,0 +1,52 @@
> +/*
> + * Copyright (c) 2022 Virtuozzo International GmbH.
> + * Author: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
> + *
> + * vhost-blk is host kernel accelerator for virtio-blk.
> + *
> + * This work is licensed under the terms of the GNU LGPL, version 2 or later.
> + * See the COPYING.LIB file in the top-level directory.
> + */
> +
> +#ifndef VHOST_BLK_H
> +#define VHOST_BLK_H
> +
> +#include "standard-headers/linux/virtio_blk.h"
> +#include "hw/block/block.h"
> +#include "hw/virtio/vhost.h"
> +#include "sysemu/block-backend.h"
> +
> +#define TYPE_VHOST_BLK "vhost-blk"
> +#define VHOST_BLK(obj) \
> +        OBJECT_CHECK(VHostBlk, (obj), TYPE_VHOST_BLK)
> +
> +#define VHOST_BLK_AUTO_NUM_QUEUES UINT16_MAX
> +#define VHOST_BLK_MAX_QUEUES 16
> +
> +/*
> + * normally should be visible from imported headers
> + * temporary define here to simplify development
> + */
> +#define VHOST_BLK_SET_BACKEND          _IOW(VHOST_VIRTIO, 0xFF, \
> +                                            struct vhost_vring_file)
> +#define VHOST_SET_NWORKERS             _IOW(VHOST_VIRTIO, 0x1F, int)
> +
> +typedef struct VhostBlkConf {
> +    BlockConf conf;
> +    uint16_t num_queues;
> +    uint16_t queue_size;
> +    uint16_t num_threads;
> +} VhostBlkConf;
> +
> +typedef struct VHostBlk {
> +    VirtIODevice parent_obj;
> +    VhostBlkConf conf;
> +    uint64_t host_features;
> +    uint64_t decided_features;
> +    struct virtio_blk_config blkcfg;
> +    int vhostfd;
> +    struct vhost_dev dev;
> +    bool vhost_started;
> +} VHostBlk;
> +
> +#endif
> diff --git a/meson.build b/meson.build
> index 8a8c415fc1..886b778079 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -336,6 +336,9 @@ have_vhost_kernel = get_option('vhost_kernel') \
>  have_vhost_user_crypto = get_option('vhost_crypto') \
>    .require(have_vhost_user,
>             error_message: 'vhost-crypto requires vhost-user to be enabled').allowed()
> +have_vhost_blk = get_option('vhost_blk') \
> +  .require(targetos == 'linux',
> +           error_message: 'vhost-kernel is only available on Linux').allowed()
>  
>  have_vhost = have_vhost_user or have_vhost_vdpa or have_vhost_kernel
>  
> @@ -1814,6 +1817,7 @@ config_host_data.set('CONFIG_VHOST_KERNEL', have_vhost_kernel)
>  config_host_data.set('CONFIG_VHOST_USER', have_vhost_user)
>  config_host_data.set('CONFIG_VHOST_CRYPTO', have_vhost_user_crypto)
>  config_host_data.set('CONFIG_VHOST_VDPA', have_vhost_vdpa)
> +config_host_data.set('CONFIG_VHOST_BLK', have_vhost_blk)
>  config_host_data.set('CONFIG_VMNET', vmnet.found())
>  config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
>  config_host_data.set('CONFIG_VDUSE_BLK_EXPORT', have_vduse_blk_export)
> @@ -2421,6 +2425,7 @@ host_kconfig = \
>    (x11.found() ? ['CONFIG_X11=y'] : []) + \
>    (have_vhost_user ? ['CONFIG_VHOST_USER=y'] : []) + \
>    (have_vhost_vdpa ? ['CONFIG_VHOST_VDPA=y'] : []) + \
> +  (have_vhost_blk ? ['CONFIG_VHOST_BLK=y'] : []) + \
>    (have_vhost_kernel ? ['CONFIG_VHOST_KERNEL=y'] : []) + \
>    (have_virtfs ? ['CONFIG_VIRTFS=y'] : []) + \
>    ('CONFIG_LINUX' in config_host ? ['CONFIG_LINUX=y'] : []) + \
> @@ -3756,6 +3761,7 @@ summary_info += {'vhost-user support': have_vhost_user}
>  summary_info += {'vhost-user-crypto support': have_vhost_user_crypto}
>  summary_info += {'vhost-user-blk server support': have_vhost_user_blk_server}
>  summary_info += {'vhost-vdpa support': have_vhost_vdpa}
> +summary_info += {'vhost-blk support': have_vhost_blk}
>  summary_info += {'build guest agent': have_ga}
>  summary(summary_info, bool_yn: true, section: 'Configurable features')
>  
> diff --git a/meson_options.txt b/meson_options.txt
> index e58e158396..277bd49525 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -251,6 +251,8 @@ option('vhost_crypto', type: 'feature', value: 'auto',
>         description: 'vhost-user crypto backend support')
>  option('vhost_vdpa', type: 'feature', value: 'auto',
>         description: 'vhost-vdpa kernel backend support')
> +option('vhost_blk', type: 'feature', value: 'auto',
> +       description: 'vhost-blk kernel backend support')
>  option('vhost_user_blk_server', type: 'feature', value: 'auto',
>         description: 'build vhost-user-blk server')
>  option('virtfs', type: 'feature', value: 'auto',
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
> index 359b04e0e6..94afde8f6b 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -156,6 +156,7 @@ meson_options_help() {
>    printf "%s\n" '  vdi             vdi image format support'
>    printf "%s\n" '  vfio-user-server'
>    printf "%s\n" '                  vfio-user server support'
> +  printf "%s\n" '  vhost-blk       vhost-blk kernel backend support'
>    printf "%s\n" '  vhost-crypto    vhost-user crypto backend support'
>    printf "%s\n" '  vhost-kernel    vhost kernel backend support'
>    printf "%s\n" '  vhost-net       vhost-net kernel acceleration support'
> @@ -424,6 +425,8 @@ _meson_option_parse() {
>      --disable-vdi) printf "%s" -Dvdi=disabled ;;
>      --enable-vfio-user-server) printf "%s" -Dvfio_user_server=enabled ;;
>      --disable-vfio-user-server) printf "%s" -Dvfio_user_server=disabled ;;
> +    --enable-vhost-blk) printf "%s" -Dvhost_blk=enabled ;;
> +    --disable-vhost-blk) printf "%s" -Dvhost_blk=disabled ;;
>      --enable-vhost-crypto) printf "%s" -Dvhost_crypto=enabled ;;
>      --disable-vhost-crypto) printf "%s" -Dvhost_crypto=disabled ;;
>      --enable-vhost-kernel) printf "%s" -Dvhost_kernel=enabled ;;
> -- 
> 2.31.1


