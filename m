Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F0A5024AD
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 07:46:52 +0200 (CEST)
Received: from localhost ([::1]:50226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfEnD-00071Y-Lw
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 01:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nfEiP-0005YV-1C
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 01:41:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nfEiL-0000wt-Ru
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 01:41:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650001309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZzPh2FVmgVIuWdmdFgnVGXf0yhzyxKWsxXDvhWf/u8E=;
 b=VoQhnetBoeYaPzoLV24rroK/7MIjor1ie2ORSVTpUKFKvO8rPKI47IsmRoa+yERQaQLyYF
 33dTBBaNTSpU9JazGGIa9DzIYKQRzJtexIYJ49vLiX+brkHZ86F20Bygt14Mv1jK3y4eeV
 EfgLxbQo56k+o0go6veG+ThwxQUvEp8=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-QCqjCnM8P6mPzR2cbvv7tQ-1; Fri, 15 Apr 2022 01:41:48 -0400
X-MC-Unique: QCqjCnM8P6mPzR2cbvv7tQ-1
Received: by mail-pf1-f200.google.com with SMTP id
 i2-20020a056a00224200b004fa60c248a1so4175559pfu.13
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 22:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZzPh2FVmgVIuWdmdFgnVGXf0yhzyxKWsxXDvhWf/u8E=;
 b=vGgS2zYrSV5gGRFFJxwJSzTJ3adD8iAQtvgx0WWuw1sVbmGnz2MfO2Q5n3quvNReWn
 xzIJmM666quW8/LNqWwasWaQtKxp3s92xU//JD2JrIh3z/yxJ5ZbaOBvwEaPD4POBNz3
 gSFzFeBIhyGDNotSBqBQYY9UGUIQQ8Ue2Q8QiC0TWF/78O5LEm15YYgLKGnJ0rovOmsc
 dpMCQ0UpR6FZRKgUnGmfo7bav65QmpAB+C2LQuBiw++zv2FrnXGVFDEUlAvvGA2zXm4j
 bVrydY4QAx+akczqlokvIB6DcLwBPydMbSYKxi5yy9X5wVdPciVAV5QanAgVvnK4kyug
 YggQ==
X-Gm-Message-State: AOAM530M9Q4bV5kZBy2behX5NOVXwUCpawmLE1KoEiAjNRfUzTvKTgPO
 KFr9GRO7TDTqP6DQbYfgVDqr6MKo0sTvFsWVI+qV5QUYXg8M4TdL5bP2ixI3ybBYon10Eez0biN
 AylHD4wu75o+cPp4=
X-Received: by 2002:a17:902:ec92:b0:158:74d6:a5fa with SMTP id
 x18-20020a170902ec9200b0015874d6a5famr20334311plg.21.1650001306929; 
 Thu, 14 Apr 2022 22:41:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzc/ANSjjA/XqxY8Q5KKbRMRlAS48wnaognJmb8DYggKWvtuvqLd+omy2s87jB2fLRKgxujA==
X-Received: by 2002:a17:902:ec92:b0:158:74d6:a5fa with SMTP id
 x18-20020a170902ec9200b0015874d6a5famr20334285plg.21.1650001306578; 
 Thu, 14 Apr 2022 22:41:46 -0700 (PDT)
Received: from [10.72.13.51] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 n184-20020a6227c1000000b0050a3bbd36d6sm998227pfn.204.2022.04.14.22.41.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 22:41:46 -0700 (PDT)
Message-ID: <d3d978ee-f12e-24d7-bb05-d0162becc996@redhat.com>
Date: Fri, 15 Apr 2022 13:41:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [PATCH 3/5] virtio-net: add RSS support for Vhost backends
To: Maxime Coquelin <maxime.coquelin@redhat.com>, qemu-devel@nongnu.org,
 mst@redhat.com, andrew@daynix.com, yuri.benditovich@daynix.com,
 dgilbert@redhat.com, quintela@redhat.com
References: <20220408122813.1357045-1-maxime.coquelin@redhat.com>
 <20220408122813.1357045-4-maxime.coquelin@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220408122813.1357045-4-maxime.coquelin@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: chenbo.xia@intel.com, dmarchan@redhat.com, ktraynor@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/4/8 20:28, Maxime Coquelin 写道:
> This patch introduces new Vhost backend callbacks to
> support RSS, and makes them called in Virtio-net
> device.
>
> It will be used by Vhost-user backend implementation to
> support RSS feature.
>
> Signed-off-by: Maxime Coquelin <maxime.coquelin@redhat.com>
> ---
>   hw/net/vhost_net-stub.c           | 10 ++++++
>   hw/net/vhost_net.c                | 22 +++++++++++++
>   hw/net/virtio-net.c               | 53 +++++++++++++++++++++----------
>   include/hw/virtio/vhost-backend.h |  7 ++++
>   include/net/vhost_net.h           |  4 +++
>   5 files changed, 79 insertions(+), 17 deletions(-)
>
> diff --git a/hw/net/vhost_net-stub.c b/hw/net/vhost_net-stub.c
> index 89d71cfb8e..cc05e07c1f 100644
> --- a/hw/net/vhost_net-stub.c
> +++ b/hw/net/vhost_net-stub.c
> @@ -101,3 +101,13 @@ int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu)
>   {
>       return 0;
>   }
> +
> +int vhost_net_get_rss(struct vhost_net *net, VirtioNetRssCapa *rss_capa)
> +{
> +    return 0;
> +}
> +
> +int vhost_net_set_rss(struct vhost_net *net, VirtioNetRssData *rss_data)
> +{
> +    return 0;
> +}
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 30379d2ca4..aa2a1e8e5f 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -512,3 +512,25 @@ int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu)
>   
>       return vhost_ops->vhost_net_set_mtu(&net->dev, mtu);
>   }
> +
> +int vhost_net_get_rss(struct vhost_net *net, VirtioNetRssCapa *rss_capa)
> +{
> +    const VhostOps *vhost_ops = net->dev.vhost_ops;
> +
> +    if (!vhost_ops->vhost_net_get_rss) {
> +        return 0;
> +    }
> +
> +    return vhost_ops->vhost_net_get_rss(&net->dev, rss_capa);
> +}
> +
> +int vhost_net_set_rss(struct vhost_net *net, VirtioNetRssData *rss_data)
> +{
> +    const VhostOps *vhost_ops = net->dev.vhost_ops;
> +
> +    if (!vhost_ops->vhost_net_set_rss) {
> +        return 0;
> +    }
> +
> +    return vhost_ops->vhost_net_set_rss(&net->dev, rss_data);
> +}
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 38436e472b..237bbdb1b3 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -741,8 +741,10 @@ static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
>           return features;
>       }
>   
> -    if (!ebpf_rss_is_loaded(&n->ebpf_rss)) {
> -        virtio_clear_feature(&features, VIRTIO_NET_F_RSS);
> +    if (nc->peer->info->type == NET_CLIENT_DRIVER_TAP) {
> +        if (!ebpf_rss_is_loaded(&n->ebpf_rss)) {
> +            virtio_clear_feature(&features, VIRTIO_NET_F_RSS);
> +        }
>       }
>       features = vhost_net_get_features(get_vhost_net(nc->peer), features);
>       vdev->backend_features = features;
> @@ -1161,11 +1163,17 @@ static void virtio_net_detach_epbf_rss(VirtIONet *n);
>   
>   static void virtio_net_disable_rss(VirtIONet *n)
>   {
> +    NetClientState *nc = qemu_get_queue(n->nic);
> +
>       if (n->rss_data.enabled) {
>           trace_virtio_net_rss_disable();
>       }
>       n->rss_data.enabled = false;
>   
> +    if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
> +        vhost_net_set_rss(get_vhost_net(nc->peer), &n->rss_data);
> +    }
> +
>       virtio_net_detach_epbf_rss(n);
>   }
>   
> @@ -1239,6 +1247,7 @@ static uint16_t virtio_net_handle_rss(VirtIONet *n,
>                                         bool do_rss)
>   {
>       VirtIODevice *vdev = VIRTIO_DEVICE(n);
> +    NetClientState *nc = qemu_get_queue(n->nic);
>       struct virtio_net_rss_config cfg;
>       size_t s, offset = 0, size_get;
>       uint16_t queue_pairs, i;
> @@ -1354,22 +1363,29 @@ static uint16_t virtio_net_handle_rss(VirtIONet *n,
>       }
>       n->rss_data.enabled = true;
>   
> -    if (!n->rss_data.populate_hash) {
> -        if (!virtio_net_attach_epbf_rss(n)) {
> -            /* EBPF must be loaded for vhost */
> -            if (get_vhost_net(qemu_get_queue(n->nic)->peer)) {
> -                warn_report("Can't load eBPF RSS for vhost");
> -                goto error;
> +    if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
> +        if (vhost_net_set_rss(get_vhost_net(nc->peer), &n->rss_data)) {
> +            warn_report("Failed to configure RSS for vhost-user");
> +            goto error;
> +        }
> +    } else {
> +        if (!n->rss_data.populate_hash) {
> +            if (!virtio_net_attach_epbf_rss(n)) {
> +                /* EBPF must be loaded for vhost */
> +                if (get_vhost_net(nc->peer)) {
> +                    warn_report("Can't load eBPF RSS for vhost");
> +                    goto error;
> +                }
> +                /* fallback to software RSS */
> +                warn_report("Can't load eBPF RSS - fallback to software RSS");
> +                n->rss_data.enabled_software_rss = true;
>               }
> -            /* fallback to software RSS */
> -            warn_report("Can't load eBPF RSS - fallback to software RSS");
> +        } else {
> +            /* use software RSS for hash populating */
> +            /* and detach eBPF if was loaded before */
> +            virtio_net_detach_epbf_rss(n);
>               n->rss_data.enabled_software_rss = true;
>           }
> -    } else {
> -        /* use software RSS for hash populating */
> -        /* and detach eBPF if was loaded before */
> -        virtio_net_detach_epbf_rss(n);
> -        n->rss_data.enabled_software_rss = true;
>       }
>   
>       trace_virtio_net_rss_enable(n->rss_data.hash_types,
> @@ -3534,8 +3550,11 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
>           n->rss_capa.max_key_size = VIRTIO_NET_RSS_DEFAULT_KEY_SIZE;
>           n->rss_capa.max_indirection_len = VIRTIO_NET_RSS_DEFAULT_TABLE_LEN;
>           n->rss_capa.supported_hashes = VIRTIO_NET_RSS_SUPPORTED_HASHES;
> -
> -        virtio_net_load_ebpf(n);
> +        if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
> +            vhost_net_get_rss(get_vhost_net(nc->peer), &n->rss_capa);


I wonder if we need a command parameter for the capability instead of 
silently get those from the vhost-user backhand (since there's no 
guarantee that the capability in src and dst are matched).

Thanks



> +        } else {
> +            virtio_net_load_ebpf(n);
> +        }
>       } else {
>           n->rss_capa.max_indirection_len = 1;
>       }
> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
> index 81bf3109f8..0b9e2ea26e 100644
> --- a/include/hw/virtio/vhost-backend.h
> +++ b/include/hw/virtio/vhost-backend.h
> @@ -12,6 +12,7 @@
>   #define VHOST_BACKEND_H
>   
>   #include "exec/memory.h"
> +#include "hw/virtio/virtio-net.h"
>   
>   typedef enum VhostBackendType {
>       VHOST_BACKEND_TYPE_NONE = 0,
> @@ -45,6 +46,10 @@ typedef int (*vhost_backend_memslots_limit)(struct vhost_dev *dev);
>   typedef int (*vhost_net_set_backend_op)(struct vhost_dev *dev,
>                                   struct vhost_vring_file *file);
>   typedef int (*vhost_net_set_mtu_op)(struct vhost_dev *dev, uint16_t mtu);
> +typedef int (*vhost_net_get_rss_op)(struct vhost_dev *dev,
> +                                VirtioNetRssCapa *rss_capa);
> +typedef int (*vhost_net_set_rss_op)(struct vhost_dev *dev,
> +                                VirtioNetRssData *rss_data);
>   typedef int (*vhost_scsi_set_endpoint_op)(struct vhost_dev *dev,
>                                     struct vhost_scsi_target *target);
>   typedef int (*vhost_scsi_clear_endpoint_op)(struct vhost_dev *dev,
> @@ -133,6 +138,8 @@ typedef struct VhostOps {
>       vhost_backend_memslots_limit vhost_backend_memslots_limit;
>       vhost_net_set_backend_op vhost_net_set_backend;
>       vhost_net_set_mtu_op vhost_net_set_mtu;
> +    vhost_net_get_rss_op vhost_net_get_rss;
> +    vhost_net_set_rss_op vhost_net_set_rss;
>       vhost_scsi_set_endpoint_op vhost_scsi_set_endpoint;
>       vhost_scsi_clear_endpoint_op vhost_scsi_clear_endpoint;
>       vhost_scsi_get_abi_version_op vhost_scsi_get_abi_version;
> diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
> index 387e913e4e..9cf702e7e3 100644
> --- a/include/net/vhost_net.h
> +++ b/include/net/vhost_net.h
> @@ -48,4 +48,8 @@ uint64_t vhost_net_get_acked_features(VHostNetState *net);
>   
>   int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu);
>   
> +int vhost_net_get_rss(struct vhost_net *net, VirtioNetRssCapa *rss_capa);
> +
> +int vhost_net_set_rss(struct vhost_net *net, VirtioNetRssData *rss_data);
> +
>   #endif


