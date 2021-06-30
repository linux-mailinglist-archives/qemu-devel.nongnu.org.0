Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C4A3B87CA
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 19:35:34 +0200 (CEST)
Received: from localhost ([::1]:44436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lye7Y-0004Lh-Tx
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 13:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lye6a-0003cO-HR
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 13:34:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lye6R-0007Ok-TM
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 13:34:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625074461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pSDEAXly11JEDOSsBMTcPlWOS3kg/m0MTzKvTatjhCw=;
 b=T8Re5rsj2/i0BIqX3j/2cTTVEFdp19CHQ1roSx0ndyNwjj+CKugFNaefJPgceTGZT3J+m6
 /6eD163mCZWStqSXqj0udqANj2OFDG4fBwuDeFHvoBKSPxTt6WT69hqUIOfxwXkQpnbhgU
 xKhJjC/bWav+Y+OTOE0qUAockFmrKoc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-Spd73HkKPt-0cAGusoYFSw-1; Wed, 30 Jun 2021 13:34:19 -0400
X-MC-Unique: Spd73HkKPt-0cAGusoYFSw-1
Received: by mail-qv1-f71.google.com with SMTP id
 k4-20020ad442040000b02902961c39935cso1926042qvp.8
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 10:34:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pSDEAXly11JEDOSsBMTcPlWOS3kg/m0MTzKvTatjhCw=;
 b=HrWsZ/DHi63BcKmnQZpuUGYKBQovbc2a6G97myqwu9iae8xIJVKFacceryPdDzJcEx
 0ZAzLAVly0dQVxU+/8BzrDKFEtocLxVa+59Skv7y5hEhttfZd/vgOVpFLYov+eFyXe6/
 C9cXt7UcjLNeRBRLrRKj+UNaFd5cnqTI4E3Np0tv9JQJGA7Y66YwVvtBWOKxq51ZQzw8
 2JXu3lgMzIwYSggSk5FYkVcuVNtlfVUvnPSYpYqD1ixH97O4fWdfn9T2iruGf4iSJmp/
 712tTRI3ao/enlCJEu1md/sD9A4WpGixA2Rqkz/rwcm0HwwT1bBsr0kk8BKHv6Vy8CIV
 NFeg==
X-Gm-Message-State: AOAM531bYdOsuwyAC7dhGm/bTQoVn9++64u7RfPV2OvhMFU/RYAy7v6R
 kNL0ogmCM2tjCGYT62JFksM5+tEDPCjAyzhTmbUWdlnmMXqWQ3wLFl9dtd8c6sGNVArnYWd3x9Y
 zkI/xfhz08qAJF7/7ST/CiHS+yI+Zt9k=
X-Received: by 2002:ac8:474e:: with SMTP id k14mr25458642qtp.384.1625074458986; 
 Wed, 30 Jun 2021 10:34:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLXm1smLz7eAiVSWbgSCR/5kFUMEFQ6PoAmU6g3+3tu5BtRkCAmNji2S5txGiUAzYVQGQeq9WAqnNQMK8W/7s=
X-Received: by 2002:ac8:474e:: with SMTP id k14mr25458628qtp.384.1625074458808; 
 Wed, 30 Jun 2021 10:34:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210621041650.5826-1-jasowang@redhat.com>
 <20210621041650.5826-16-jasowang@redhat.com>
In-Reply-To: <20210621041650.5826-16-jasowang@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 30 Jun 2021 19:33:42 +0200
Message-ID: <CAJaqyWcAbH_X_nK6FqSd4Rt7CipsHLM7=_fcmsO8EajrjOxzXQ@mail.gmail.com>
Subject: Re: [PATCH 15/18] vhost-net: control virtqueue support
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eli Cohen <elic@nvidia.com>, Cindy Lu <lulu@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, lingshan.zhu@intel.com,
 Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 21, 2021 at 6:18 AM Jason Wang <jasowang@redhat.com> wrote:
>
> We assume there's no cvq in the past, this is not true when we need
> control virtqueue support for vhost-user backends. So this patch
> implements the control virtqueue support for vhost-net. As datapath,
> the control virtqueue is also required to be coupled with the
> NetClientState. The vhost_net_start/stop() are tweaked to accept the
> number of datapath queue pairs plus the the number of control
> virtqueue for us to start and stop the vhost device.
>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/net/vhost_net.c      | 43 ++++++++++++++++++++++++++++++-----------
>  hw/net/virtio-net.c     |  4 ++--
>  include/net/vhost_net.h |  6 ++++--
>  3 files changed, 38 insertions(+), 15 deletions(-)
>
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index ef1370bd92..fe2fd7e3d5 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -311,11 +311,14 @@ static void vhost_net_stop_one(struct vhost_net *net,
>  }
>
>  int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
> -                    int total_queues)
> +                    int data_qps, int cvq)

I can see the convenience of being an int, but maybe it is more clear
to use a boolean?

>  {
>      BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(dev)));
>      VirtioBusState *vbus = VIRTIO_BUS(qbus);
>      VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(vbus);
> +    int total_notifiers = data_qps * 2 + cvq;
> +    VirtIONet *n = VIRTIO_NET(dev);
> +    int nvhosts = data_qps + cvq;
>      struct vhost_net *net;
>      int r, e, i;
>      NetClientState *peer;
> @@ -325,9 +328,14 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>          return -ENOSYS;
>      }
>
> -    for (i = 0; i < total_queues; i++) {
> +    for (i = 0; i < nvhosts; i++) {
> +
> +        if (i < data_qps) {
> +            peer = qemu_get_peer(ncs, i);
> +        } else { /* Control Virtqueue */
> +            peer = qemu_get_peer(ncs, n->max_qps);

The field max_qps should be max_queues until the next patch, or maybe
we can reorder the commits and then rename the field before this
commit?

Same comment later on this function and in vhost_net_stop.

Thanks!

> +        }
>
> -        peer = qemu_get_peer(ncs, i);
>          net = get_vhost_net(peer);
>          vhost_net_set_vq_index(net, i * 2);
>
> @@ -340,14 +348,18 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>          }
>       }
>
> -    r = k->set_guest_notifiers(qbus->parent, total_queues * 2, true);
> +    r = k->set_guest_notifiers(qbus->parent, total_notifiers, true);
>      if (r < 0) {
>          error_report("Error binding guest notifier: %d", -r);
>          goto err;
>      }
>
> -    for (i = 0; i < total_queues; i++) {
> -        peer = qemu_get_peer(ncs, i);
> +    for (i = 0; i < nvhosts; i++) {
> +        if (i < data_qps) {
> +            peer = qemu_get_peer(ncs, i);
> +        } else {
> +            peer = qemu_get_peer(ncs, n->max_qps);
> +        }
>          r = vhost_net_start_one(get_vhost_net(peer), dev);
>
>          if (r < 0) {
> @@ -371,7 +383,7 @@ err_start:
>          peer = qemu_get_peer(ncs , i);
>          vhost_net_stop_one(get_vhost_net(peer), dev);
>      }
> -    e = k->set_guest_notifiers(qbus->parent, total_queues * 2, false);
> +    e = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
>      if (e < 0) {
>          fprintf(stderr, "vhost guest notifier cleanup failed: %d\n", e);
>          fflush(stderr);
> @@ -381,18 +393,27 @@ err:
>  }
>
>  void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
> -                    int total_queues)
> +                    int data_qps, int cvq)
>  {
>      BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(dev)));
>      VirtioBusState *vbus = VIRTIO_BUS(qbus);
>      VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(vbus);
> +    VirtIONet *n = VIRTIO_NET(dev);
> +    NetClientState *peer;
> +    int total_notifiers = data_qps * 2 + cvq;
> +    int nvhosts = data_qps + cvq;
>      int i, r;
>
> -    for (i = 0; i < total_queues; i++) {
> -        vhost_net_stop_one(get_vhost_net(ncs[i].peer), dev);
> +    for (i = 0; i < nvhosts; i++) {
> +        if (i < data_qps) {
> +            peer = qemu_get_peer(ncs, i);
> +        } else {
> +            peer = qemu_get_peer(ncs, n->max_qps);
> +        }
> +        vhost_net_stop_one(get_vhost_net(peer), dev);
>      }
>
> -    r = k->set_guest_notifiers(qbus->parent, total_queues * 2, false);
> +    r = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
>      if (r < 0) {
>          fprintf(stderr, "vhost guest notifier cleanup failed: %d\n", r);
>          fflush(stderr);
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index bd7958b9f0..614660274c 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -285,14 +285,14 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
>          }
>
>          n->vhost_started = 1;
> -        r = vhost_net_start(vdev, n->nic->ncs, queues);
> +        r = vhost_net_start(vdev, n->nic->ncs, queues, 0);
>          if (r < 0) {
>              error_report("unable to start vhost net: %d: "
>                           "falling back on userspace virtio", -r);
>              n->vhost_started = 0;
>          }
>      } else {
> -        vhost_net_stop(vdev, n->nic->ncs, queues);
> +        vhost_net_stop(vdev, n->nic->ncs, queues, 0);
>          n->vhost_started = 0;
>      }
>  }
> diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
> index fba40cf695..e656e38af9 100644
> --- a/include/net/vhost_net.h
> +++ b/include/net/vhost_net.h
> @@ -21,8 +21,10 @@ typedef struct VhostNetOptions {
>  uint64_t vhost_net_get_max_queues(VHostNetState *net);
>  struct vhost_net *vhost_net_init(VhostNetOptions *options);
>
> -int vhost_net_start(VirtIODevice *dev, NetClientState *ncs, int total_queues);
> -void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs, int total_queues);
> +int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
> +                    int data_qps, int cvq);
> +void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
> +                    int data_qps, int cvq);
>
>  void vhost_net_cleanup(VHostNetState *net);
>
> --
> 2.25.1
>


