Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 328221CBC74
	for <lists+qemu-devel@lfdr.de>; Sat,  9 May 2020 04:26:36 +0200 (CEST)
Received: from localhost ([::1]:37164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jXFCF-0006MZ-AH
	for lists+qemu-devel@lfdr.de; Fri, 08 May 2020 22:26:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jXFBW-0005b3-M2
 for qemu-devel@nongnu.org; Fri, 08 May 2020 22:25:50 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:48939
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jXFBV-0000qi-FM
 for qemu-devel@nongnu.org; Fri, 08 May 2020 22:25:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588991147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eRQa5lA1uWE3URC6Ka4fV9OUO3EcgfDKX3eRfEwubs8=;
 b=WMGZZx/xtXG4S2QqJySoR0e4GLFPUK7NGQLoxEfQfoUlR8llv66+xgq5r8sneb0kZbsRcv
 1036rUhOgqudaJcWbCanDFDXnaLpG/5ZpHGxxVnOELcZgL/tXMLtMK/gxV7B5NguLHPCba
 9vhNb3yZMrKucreYDHtWstcVHdh9tF8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-hFaqb6gANQmcghVfCjqCOQ-1; Fri, 08 May 2020 22:25:46 -0400
X-MC-Unique: hFaqb6gANQmcghVfCjqCOQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A0371895A37;
 Sat,  9 May 2020 02:25:43 +0000 (UTC)
Received: from [10.72.13.128] (ovpn-13-128.pek2.redhat.com [10.72.13.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D107325262;
 Sat,  9 May 2020 02:25:25 +0000 (UTC)
Subject: Re: [RFC v2 3/9] virtio_net: introduce vhost_set_state
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, armbru@redhat.com,
 eblake@redhat.com, cohuck@redhat.com
References: <20200508163218.22592-1-lulu@redhat.com>
 <20200508163218.22592-4-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b6988abd-d79a-8af4-4ab0-7f96a37f3c41@redhat.com>
Date: Sat, 9 May 2020 10:25:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200508163218.22592-4-lulu@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/08 22:25:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: mhabets@solarflare.com, qemu-devel@nongnu.org, rob.miller@broadcom.com,
 saugatm@xilinx.com, hanand@xilinx.com, hch@infradead.org, eperezma@redhat.com,
 jgg@mellanox.com, shahafs@mellanox.com, kevin.tian@intel.com,
 parav@mellanox.com, vmireyno@marvell.com, cunming.liang@intel.com,
 gdawar@xilinx.com, jiri@mellanox.com, xiao.w.wang@intel.com,
 stefanha@redhat.com, zhihong.wang@intel.com, aadam@redhat.com,
 rdunlap@infradead.org, maxime.coquelin@redhat.com, lingshan.zhu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/5/9 上午12:32, Cindy Lu wrote:
> Introduce a function to set the state to the vhost driver.
> vDPA need to sync the driver's state to NIC


Let's split this patch into two.

1) introduce vhost_set_state
2) make virtio-net use of vhost_set_state


>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>   hw/net/vhost_net.c                | 9 +++++++++
>   hw/net/virtio-net.c               | 9 +++++++++
>   include/hw/virtio/vhost-backend.h | 2 ++
>   include/net/vhost_net.h           | 2 +-
>   4 files changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index d1d421e3d9..63b2a85d6e 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -465,3 +465,12 @@ int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu)
>   
>       return vhost_ops->vhost_net_set_mtu(&net->dev, mtu);
>   }
> +int vhost_set_state(NetClientState *nc, uint8_t state)
> +{
> +    struct vhost_net *net = get_vhost_net(nc);
> +    struct vhost_dev *hdev = &net->dev;
> +        if (hdev->vhost_ops->vhost_set_state) {


Indentation looks wrong.


> +                return hdev->vhost_ops->vhost_set_state(hdev, state);
> +        }
> +    return 0;
> +}
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index db3d7c38e6..1bddb4b4af 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -206,6 +206,9 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
>       VirtIODevice *vdev = VIRTIO_DEVICE(n);
>       NetClientState *nc = qemu_get_queue(n->nic);
>       int queues = n->multiqueue ? n->max_queues : 1;
> +    NetClientState *peer = qemu_get_peer(nc, 0);
> +    uint8_t status_set  = vdev->status ;
> +    uint8_t vhost_started_pre = n->vhost_started;
>   
>       if (!get_vhost_net(nc->peer)) {
>           return;
> @@ -245,6 +248,7 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
>                   return;
>               }
>           }
> +        status_set = status_set | VIRTIO_CONFIG_S_DRIVER_OK;
>   
>           n->vhost_started = 1;
>           r = vhost_net_start(vdev, n->nic->ncs, queues);
> @@ -252,11 +256,16 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
>               error_report("unable to start vhost net: %d: "
>                            "falling back on userspace virtio", -r);
>               n->vhost_started = 0;
> +            status_set = status_set & ~VIRTIO_CONFIG_S_DRIVER_OK;
>           }
>       } else {
>           vhost_net_stop(vdev, n->nic->ncs, queues);
> +        status_set = status_set & ~VIRTIO_CONFIG_S_DRIVER_OK;
>           n->vhost_started = 0;
>       }
> +    if (vhost_started_pre != n->vhost_started) {
> +            vhost_set_state(peer, status_set);


Any reason why not just passing virtio device status to vhost-vdpa?


> +    }
>   }
>   
>   static int virtio_net_set_vnet_endian_one(VirtIODevice *vdev,
> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
> index 6f6670783f..f823055167 100644
> --- a/include/hw/virtio/vhost-backend.h
> +++ b/include/hw/virtio/vhost-backend.h
> @@ -112,6 +112,7 @@ typedef int (*vhost_get_inflight_fd_op)(struct vhost_dev *dev,
>   typedef int (*vhost_set_inflight_fd_op)(struct vhost_dev *dev,
>                                           struct vhost_inflight *inflight);
>   
> +typedef int (*vhost_set_state_op)(struct vhost_dev *dev, uint8_t state);


Need document what's the meaning of state here, is it e.g virtio device 
status? If yes, is it better to rename it to vhost_set_status()?

Thanks


>   typedef struct VhostOps {
>       VhostBackendType backend_type;
>       vhost_backend_init vhost_backend_init;
> @@ -152,6 +153,7 @@ typedef struct VhostOps {
>       vhost_backend_mem_section_filter_op vhost_backend_mem_section_filter;
>       vhost_get_inflight_fd_op vhost_get_inflight_fd;
>       vhost_set_inflight_fd_op vhost_set_inflight_fd;
> +    vhost_set_state_op vhost_set_state;
>   } VhostOps;
>   
>   extern const VhostOps user_ops;
> diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
> index 77e47398c4..6548a5a105 100644
> --- a/include/net/vhost_net.h
> +++ b/include/net/vhost_net.h
> @@ -39,5 +39,5 @@ int vhost_set_vring_enable(NetClientState * nc, int enable);
>   uint64_t vhost_net_get_acked_features(VHostNetState *net);
>   
>   int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu);
> -
> +int vhost_set_state(NetClientState *nc, uint8_t state);
>   #endif


