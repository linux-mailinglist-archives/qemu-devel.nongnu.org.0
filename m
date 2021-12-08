Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F095846CDC9
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 07:30:56 +0100 (CET)
Received: from localhost ([::1]:46628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muqTd-00087d-0x
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 01:30:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1muqQM-0007QL-U0
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 01:27:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1muqQH-0008SY-Ka
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 01:27:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638944840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QjqBVR9G1YGIVf6Fhb5MBQcGA6PKyeCQtDYuHhCxR64=;
 b=hBQFxVtzObtvn+orAr4XAta7akfkZ9oxztZHHMNKJI6JQSwNuoRpB5qN79BInF01qxWRAc
 c5UHbjZ2C8KyHdvffpx/g1GZrkD0bbVLYiZS7xNMPM7xbmCqlv+KqOboYtE49DTfgxMnd/
 IzHA9nEzsrkWQcY//dmjwhjenjxBssM=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-v6ohhKpMMySNT-kBZK9hhw-1; Wed, 08 Dec 2021 01:27:17 -0500
X-MC-Unique: v6ohhKpMMySNT-kBZK9hhw-1
Received: by mail-lj1-f197.google.com with SMTP id
 2-20020a2e0902000000b00218c22336abso450988ljj.0
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 22:27:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QjqBVR9G1YGIVf6Fhb5MBQcGA6PKyeCQtDYuHhCxR64=;
 b=eEeK82VjzmO9CsKjpWtRP8xp+IMqDWiCEu2m84/+69HrJfrdqkY86DATot8y6haKjh
 FzR2aWaleJbJooNLkEC3MMIVwNWDKXKs6J24GB9yRGdjE5xLxvpHzmL4THY9rzqRNU70
 RKbAYBbgldMRA9w+DH8EHL4u9vtTU04B2u12MrN99BClgC7MNeL0LQx5UdXJW8b6lS0x
 G8dHyIn2/BGL+N1W7pdAExwmXlVR4mpwZdps5CWkTiAPShnZTLj8CwfLjbzQGXCBRaNY
 Ep6A7YE15ME22/SKFoEiZH434D3iIFbIvyCkMy5JR6oKGCKCWQOF+te0qshz1kOprVUE
 HlMQ==
X-Gm-Message-State: AOAM532mwBM1gsizkVVRwHBkIbvD6ilzuAd+Mi/rlXKXC2aRb6j3P/Qm
 gHkb+QF+yj///GhgCgDg3gw223kN2oIWRARCgCyfqliDN1Y2ymFkcojIKENvsuFlWGIgSScAN+u
 9DJ/vStsVoUxk6XmfH8jU/p4AEkCihYc=
X-Received: by 2002:a2e:b742:: with SMTP id k2mr48194532ljo.107.1638944836114; 
 Tue, 07 Dec 2021 22:27:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwigDBFH6KAKYBaqBmmCnx5Mq8H7fQmduzawbSbGOsCvD1uuBONliUqjAhjEFr2p2IbARbupBBdYSISr+rKcEE=
X-Received: by 2002:a2e:b742:: with SMTP id k2mr48194500ljo.107.1638944835736; 
 Tue, 07 Dec 2021 22:27:15 -0800 (PST)
MIME-Version: 1.0
References: <20211208052010.1719-1-longpeng2@huawei.com>
In-Reply-To: <20211208052010.1719-1-longpeng2@huawei.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 8 Dec 2021 14:27:04 +0800
Message-ID: <CACGkMEvW0W-mMU159bUyDo2jK03FYQEn3ZedbC9vaEvDj2v7KQ@mail.gmail.com>
Subject: Re: [RFC] vhost-vdpa-net: add vhost-vdpa-net host device support
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mst <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 yechuan@huawei.com, Yongji Xie <xieyongji@bytedance.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Parav Pandit <parav@nvidia.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 8, 2021 at 1:20 PM Longpeng(Mike) <longpeng2@huawei.com> wrote:
>
> From: Longpeng <longpeng2@huawei.com>
>
> Hi guys,
>
> This patch introduces vhost-vdpa-net device, which is inspired
> by vhost-user-blk and the proposal of vhost-vdpa-blk device [1].
>
> I've tested this patch on Huawei's offload card:
> ./x86_64-softmmu/qemu-system-x86_64 \
>     -device vhost-vdpa-net-pci,vdpa-dev=/dev/vhost-vdpa-0
>
> For virtio hardware offloading, the most important requirement for us
> is to support live migration between offloading cards from different
> vendors, the combination of netdev and virtio-net seems too heavy, we
> prefer a lightweight way.

Could you elaborate more on this? It's mainly the control path when
using with netdev, and it provides a lot of other benefits:

- decouple the transport specific stuff out of the vhost abstraction,
mmio device is supported with 0 line of code
- migration compatibility, reuse the migration stream that is already
supported by Qemu virtio-net, this will allow migration among
different vhost backends.
- software mediation facility, not all the virtqueues are assigned to
guests directly. One example is the virtio-net cvq, qemu may want to
intercept and record the device state for migration. Reusing the
current virtio-net codes simplifies a lot of codes.
- transparent failover (in the future), the nic model can choose to
switch between vhost backends etc.

>
> Maybe we could support both in the future ?

For the net, we need to figure out the advantages of this approach
first. Note that we didn't have vhost-user-net-pci or vhost-pci in the
past.

For the block, I will leave Stefan and Stefano to comment.

> Such as:
>
> * Lightweight
>  Net: vhost-vdpa-net
>  Storage: vhost-vdpa-blk
>
> * Heavy but more powerful
>  Net: netdev + virtio-net + vhost-vdpa
>  Storage: bdrv + virtio-blk + vhost-vdpa
>
> [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg797569.html
>
> Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
> ---
>  hw/net/meson.build                 |   1 +
>  hw/net/vhost-vdpa-net.c            | 338 +++++++++++++++++++++++++++++++++++++
>  hw/virtio/Kconfig                  |   5 +
>  hw/virtio/meson.build              |   1 +
>  hw/virtio/vhost-vdpa-net-pci.c     | 118 +++++++++++++

I'd expect there's no device type specific code in this approach and
any kind of vDPA devices could be used with a general pci device.

Any reason for having net specific types here?

>  include/hw/virtio/vhost-vdpa-net.h |  31 ++++
>  include/net/vhost-vdpa.h           |   2 +
>  net/vhost-vdpa.c                   |   2 +-
>  8 files changed, 497 insertions(+), 1 deletion(-)
>  create mode 100644 hw/net/vhost-vdpa-net.c
>  create mode 100644 hw/virtio/vhost-vdpa-net-pci.c
>  create mode 100644 include/hw/virtio/vhost-vdpa-net.h
>
> diff --git a/hw/net/meson.build b/hw/net/meson.build
> index bdf71f1..139ebc4 100644
> --- a/hw/net/meson.build
> +++ b/hw/net/meson.build
> @@ -44,6 +44,7 @@ specific_ss.add(when: 'CONFIG_XILINX_ETHLITE', if_true: files('xilinx_ethlite.c'
>
>  softmmu_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('net_rx_pkt.c'))
>  specific_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('virtio-net.c'))
> +specific_ss.add(when: 'CONFIG_VHOST_VDPA_NET', if_true: files('vhost-vdpa-net.c'))
>
>  softmmu_ss.add(when: ['CONFIG_VIRTIO_NET', 'CONFIG_VHOST_NET'], if_true: files('vhost_net.c'), if_false: files('vhost_net-stub.c'))
>  softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost_net-stub.c'))
> diff --git a/hw/net/vhost-vdpa-net.c b/hw/net/vhost-vdpa-net.c
> new file mode 100644
> index 0000000..48b99f9
> --- /dev/null
> +++ b/hw/net/vhost-vdpa-net.c
> @@ -0,0 +1,338 @@
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qemu/error-report.h"
> +#include "qemu/cutils.h"
> +#include "hw/qdev-core.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/qdev-properties-system.h"
> +#include "hw/virtio/vhost.h"
> +#include "hw/virtio/vhost-vdpa-net.h"
> +#include "hw/virtio/virtio.h"
> +#include "hw/virtio/virtio-bus.h"
> +#include "hw/virtio/virtio-access.h"
> +#include "sysemu/sysemu.h"
> +#include "sysemu/runstate.h"
> +#include "net/vhost-vdpa.h"
> +
> +static void vhost_vdpa_net_get_config(VirtIODevice *vdev, uint8_t *config)
> +{
> +    VHostVdpaNet *s = VHOST_VDPA_NET(vdev);
> +
> +    memcpy(config, &s->netcfg, sizeof(struct virtio_net_config));
> +}
> +
> +static void vhost_vdpa_net_set_config(VirtIODevice *vdev, const uint8_t *config)
> +{
> +    VHostVdpaNet *s = VHOST_VDPA_NET(vdev);
> +    struct virtio_net_config *netcfg = (struct virtio_net_config *)config;
> +    int ret;
> +
> +    ret = vhost_dev_set_config(&s->dev, (uint8_t *)netcfg, 0, sizeof(*netcfg),
> +                               VHOST_SET_CONFIG_TYPE_MASTER);
> +    if (ret) {
> +        error_report("set device config space failed");
> +        return;
> +    }
> +}
> +
> +static uint64_t vhost_vdpa_net_get_features(VirtIODevice *vdev,
> +                                            uint64_t features,
> +                                            Error **errp)
> +{
> +    VHostVdpaNet *s = VHOST_VDPA_NET(vdev);
> +
> +    virtio_add_feature(&features, VIRTIO_NET_F_CSUM);
> +    virtio_add_feature(&features, VIRTIO_NET_F_GUEST_CSUM);
> +    virtio_add_feature(&features, VIRTIO_NET_F_MAC);
> +    virtio_add_feature(&features, VIRTIO_NET_F_GSO);
> +    virtio_add_feature(&features, VIRTIO_NET_F_GUEST_TSO4);
> +    virtio_add_feature(&features, VIRTIO_NET_F_GUEST_TSO6);
> +    virtio_add_feature(&features, VIRTIO_NET_F_GUEST_ECN);
> +    virtio_add_feature(&features, VIRTIO_NET_F_GUEST_UFO);
> +    virtio_add_feature(&features, VIRTIO_NET_F_GUEST_ANNOUNCE);
> +    virtio_add_feature(&features, VIRTIO_NET_F_HOST_TSO4);
> +    virtio_add_feature(&features, VIRTIO_NET_F_HOST_TSO6);
> +    virtio_add_feature(&features, VIRTIO_NET_F_HOST_ECN);
> +    virtio_add_feature(&features, VIRTIO_NET_F_HOST_UFO);
> +    virtio_add_feature(&features, VIRTIO_NET_F_MRG_RXBUF);
> +    virtio_add_feature(&features, VIRTIO_NET_F_STATUS);
> +    virtio_add_feature(&features, VIRTIO_NET_F_CTRL_VQ);
> +    virtio_add_feature(&features, VIRTIO_NET_F_CTRL_RX);
> +    virtio_add_feature(&features, VIRTIO_NET_F_CTRL_VLAN);
> +    virtio_add_feature(&features, VIRTIO_NET_F_CTRL_RX_EXTRA);
> +    virtio_add_feature(&features, VIRTIO_NET_F_CTRL_MAC_ADDR);
> +    virtio_add_feature(&features, VIRTIO_NET_F_MQ);

Any reason for those hand crafted features?

> +
> +    return vhost_get_features(&s->dev, vdpa_feature_bits, features);
> +}
> +
> +static int vhost_vdpa_net_start(VirtIODevice *vdev, Error **errp)
> +{
> +    VHostVdpaNet *s = VHOST_VDPA_NET(vdev);
> +    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
> +    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
> +    int i, ret;
> +
> +    if (!k->set_guest_notifiers) {
> +        error_setg(errp, "binding does not support guest notifiers");
> +        return -ENOSYS;
> +    }
> +
> +    ret = vhost_dev_enable_notifiers(&s->dev, vdev);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret, "Error enabling host notifiers");
> +        return ret;
> +    }
> +
> +    ret = k->set_guest_notifiers(qbus->parent, s->dev.nvqs, true);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret, "Error binding guest notifier");
> +        goto err_host_notifiers;
> +    }
> +
> +    s->dev.acked_features = vdev->guest_features;
> +
> +    ret = vhost_dev_start(&s->dev, vdev);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret, "Error starting vhost");
> +        goto err_guest_notifiers;
> +    }
> +    s->started = true;
> +
> +    /* guest_notifier_mask/pending not used yet, so just unmask
> +     * everything here. virtio-pci will do the right thing by
> +     * enabling/disabling irqfd.
> +     */
> +    for (i = 0; i < s->dev.nvqs; i++) {
> +        vhost_virtqueue_mask(&s->dev, vdev, i, false);
> +    }
> +
> +    return ret;
> +
> +err_guest_notifiers:
> +    k->set_guest_notifiers(qbus->parent, s->dev.nvqs, false);
> +err_host_notifiers:
> +    vhost_dev_disable_notifiers(&s->dev, vdev);
> +    return ret;
> +}
> +
> +static void vhost_vdpa_net_handle_output(VirtIODevice *vdev, VirtQueue *vq)
> +{
> +    VHostVdpaNet *s = VHOST_VDPA_NET(vdev);
> +    Error *local_err = NULL;
> +    int i, ret;
> +
> +    if (!vdev->start_on_kick) {
> +        return;
> +    }
> +
> +    if (s->dev.started) {
> +        return;
> +    }
> +
> +    /* Some guests kick before setting VIRTIO_CONFIG_S_DRIVER_OK so start
> +     * vhost here instead of waiting for .set_status().
> +     */
> +    ret = vhost_vdpa_net_start(vdev, &local_err);
> +    if (ret < 0) {
> +        error_reportf_err(local_err, "vhost-vdpa-net: start failed: ");
> +        return;
> +    }
> +
> +    /* Kick right away to begin processing requests already in vring */
> +    for (i = 0; i < s->dev.nvqs; i++) {
> +        VirtQueue *kick_vq = virtio_get_queue(vdev, i);
> +
> +        if (!virtio_queue_get_desc_addr(vdev, i)) {
> +            continue;
> +        }
> +        event_notifier_set(virtio_queue_get_host_notifier(kick_vq));
> +    }
> +}
> +
> +static void vhost_vdpa_net_stop(VirtIODevice *vdev)
> +{
> +    VHostVdpaNet *s = VHOST_VDPA_NET(vdev);
> +    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
> +    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
> +    int ret;
> +
> +    if (!s->started) {
> +        return;
> +    }
> +    s->started = false;
> +
> +    if (!k->set_guest_notifiers) {
> +        return;
> +    }
> +
> +    vhost_dev_stop(&s->dev, vdev);
> +
> +    ret = k->set_guest_notifiers(qbus->parent, s->dev.nvqs, false);
> +    if (ret < 0) {
> +        error_report("vhost guest notifier cleanup failed: %d", ret);
> +        return;
> +    }
> +
> +    vhost_dev_disable_notifiers(&s->dev, vdev);
> +}
> +
> +static void vhost_vdpa_net_set_status(VirtIODevice *vdev, uint8_t status)
> +{
> +    VHostVdpaNet *s = VHOST_VDPA_NET(vdev);
> +    bool should_start = virtio_device_started(vdev, status);
> +    Error *local_err = NULL;
> +    int ret;
> +
> +    if (!vdev->vm_running) {
> +        should_start = false;
> +    }
> +
> +    if (s->started == should_start) {
> +        return;
> +    }
> +
> +    if (should_start) {
> +        ret = vhost_vdpa_net_start(vdev, &local_err);
> +        if (ret < 0) {
> +            error_reportf_err(local_err, "vhost-vdpa-net: start failed: ");
> +        }
> +    } else {
> +        vhost_vdpa_net_stop(vdev);
> +    }
> +}
> +
> +static void vhost_vdpa_net_unrealize(VHostVdpaNet *s)
> +{
> +    VirtIODevice *vdev = VIRTIO_DEVICE(s);
> +    int i;
> +
> +    for (i = 0; i < s->queue_pairs * 2; i++) {
> +        virtio_delete_queue(s->virtqs[i]);
> +    }
> +    /* ctrl vq */
> +    virtio_delete_queue(s->virtqs[i]);
> +
> +    g_free(s->virtqs);
> +    virtio_cleanup(vdev);
> +}
> +
> +static void vhost_vdpa_net_device_realize(DeviceState *dev, Error **errp)
> +{
> +    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> +    VHostVdpaNet *s = VHOST_VDPA_NET(vdev);
> +    int i, ret;
> +
> +    s->vdpa.device_fd = qemu_open_old(s->vdpa_dev, O_RDWR);
> +    if (s->vdpa.device_fd == -1) {
> +        error_setg(errp, "vhost-vdpa-net: open %s failed: %s",
> +                   s->vdpa_dev, strerror(errno));
> +        return;
> +    }
> +
> +    virtio_init(vdev, "virtio-net", VIRTIO_ID_NET,
> +                sizeof(struct virtio_net_config));
> +
> +    s->dev.nvqs = s->queue_pairs * 2 + 1;
> +    s->dev.vqs = g_new0(struct vhost_virtqueue, s->dev.nvqs);
> +    s->dev.vq_index = 0;
> +    s->dev.vq_index_end = s->dev.nvqs;
> +    s->dev.backend_features = 0;
> +    s->started = false;
> +
> +    s->virtqs = g_new0(VirtQueue *, s->dev.nvqs);
> +    for (i = 0; i < s->dev.nvqs; i++) {
> +        s->virtqs[i] = virtio_add_queue(vdev, s->queue_size,
> +                                        vhost_vdpa_net_handle_output);

We should check whether MQ is negotiated since the index varies
depending on that.

> +    }
> +
> +    ret = vhost_dev_init(&s->dev, &s->vdpa, VHOST_BACKEND_TYPE_VDPA, 0, NULL);
> +    if (ret < 0) {
> +        error_setg(errp, "vhost-vdpa-net: vhost initialization failed: %s",
> +                   strerror(-ret));
> +        goto init_err;
> +    }
> +
> +    ret = vhost_dev_get_config(&s->dev, (uint8_t *)&s->netcfg,
> +                               sizeof(struct virtio_net_config), NULL);
> +    if (ret < 0) {
> +        error_setg(errp, "vhost-vdpa-net: get network config failed");
> +        goto config_err;
> +    }
> +
> +    return;
> +config_err:
> +    vhost_dev_cleanup(&s->dev);
> +init_err:
> +    vhost_vdpa_net_unrealize(s);
> +    close(s->vdpa.device_fd);
> +}
> +
> +static void vhost_vdpa_net_device_unrealize(DeviceState *dev)
> +{
> +    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> +    VHostVdpaNet *s = VHOST_VDPA_NET(vdev);
> +
> +    virtio_set_status(vdev, 0);
> +    vhost_dev_cleanup(&s->dev);
> +    vhost_vdpa_net_unrealize(s);
> +    close(s->vdpa.device_fd);
> +}
> +
> +static const VMStateDescription vmstate_vhost_vdpa_net = {
> +    .name = "vhost-vdpa-net",
> +    .minimum_version_id = 1,
> +    .version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_VIRTIO_DEVICE,
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
> +static void vhost_vdpa_net_instance_init(Object *obj)
> +{
> +    VHostVdpaNet *s = VHOST_VDPA_NET(obj);
> +
> +    device_add_bootindex_property(obj, &s->bootindex, "bootindex",
> +                                  "/ethernet-phy@0,0", DEVICE(obj));
> +}
> +
> +static Property vhost_vdpa_net_properties[] = {
> +    DEFINE_PROP_STRING("vdpa-dev", VHostVdpaNet, vdpa_dev),
> +    DEFINE_PROP_UINT16("queue-pairs", VHostVdpaNet, queue_pairs,
> +                       VHOST_VDPA_NET_AUTO_QUEUE_PAIRS),

Any reason that we need the queue pairs parameter? Note that it is
expected to be provisioned by the netlink for the management device.

Thanks


