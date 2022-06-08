Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C5354211F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 06:27:44 +0200 (CEST)
Received: from localhost ([::1]:49708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nynIF-0004sZ-3N
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 00:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nynGS-0003c2-H8
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 00:25:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nynGQ-0003FN-JE
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 00:25:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654662348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NO4R/4zhr5afEWpg9qTQn7GkyQ/307+md3HVhGy+Pek=;
 b=auzUoNuZmNqr12qr2YnKtlYdLhe+1bbGikeJowIHTDiL6x/s/hYL0hbYc0WVPHxLUqmKyl
 uihzx3gnt3J0rHFF/+SVGuzIEFikf28s6vcw0/mg82Lj1kFkH83LWI4HTY04rpKHYYEOON
 aH/ga4eOgdprUGAQY0GXSvaur4pjScc=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-5wij5wSRMaCUguWn_MA76A-1; Wed, 08 Jun 2022 00:25:47 -0400
X-MC-Unique: 5wij5wSRMaCUguWn_MA76A-1
Received: by mail-pg1-f198.google.com with SMTP id
 y63-20020a638a42000000b003fd47b6f280so5781983pgd.12
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 21:25:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NO4R/4zhr5afEWpg9qTQn7GkyQ/307+md3HVhGy+Pek=;
 b=edJVn6tve1llQZj+hZyy/u6QegKuUi0MftcrOdWBB4TUa5M9LJgfBfKl1aFiE58Sol
 twDIXzXa3Fl/e67ZL8krkj4cbjlCgtunF1X0oHkHJxIduIIhG444+NJOh9hVEkNKb7+V
 irDjMRsWRCZkLT/PnbdJD8opr0TAVygQOFWtk2opppKOsqHlxpfDM/YGTEi3erSS0Tjv
 1x4AIw9dNAjMn72BgOA14Fa7YgZ2wW53MNOpoZDpRLb4EOV6/AL+h4p9jWDyJvfY0kaf
 WhFjhUAn0zHdk3D+8x12+58jB5T2AsXTHMK9mplZSQ6cRMeNtA5v0X7+d2VpGHqic3JB
 qxAg==
X-Gm-Message-State: AOAM532UPxGhcfyJ1NC7g9YbSWC1Ws22SdNDganYs0ERRa71QOCjFM9W
 ZOmZ135MYZpqXpGdAB+p9K/yTMamVAUNnZaMxXYifXVXEPK/9mB8hqwbxrfgsr933Zikc2KogLu
 jxvO+vKkcu2bSqpc=
X-Received: by 2002:a17:902:ce06:b0:15f:a51a:cdec with SMTP id
 k6-20020a170902ce0600b0015fa51acdecmr31970796plg.53.1654662346247; 
 Tue, 07 Jun 2022 21:25:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyC70OIvmqZDIIWNLUywNhd6dYDkQKHAhrRZdeszcbR1FaxidTfPcuB9oXrJaq+eVQG6Ni0Wg==
X-Received: by 2002:a17:902:ce06:b0:15f:a51a:cdec with SMTP id
 k6-20020a170902ce0600b0015fa51acdecmr31970771plg.53.1654662345989; 
 Tue, 07 Jun 2022 21:25:45 -0700 (PDT)
Received: from [10.72.13.97] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 g196-20020a6252cd000000b0051b9e224623sm14435532pfb.141.2022.06.07.21.25.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 21:25:45 -0700 (PDT)
Message-ID: <7a8468b5-f709-4b74-cbe3-8e87b257e41c@redhat.com>
Date: Wed, 8 Jun 2022 12:25:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [RFC PATCH v8 14/21] vhost: Make possible to check for device
 exclusive vq group
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Cornelia Huck <cohuck@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Laurent Vivier <lvivier@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Eric Blake <eblake@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Parav Pandit <parav@mellanox.com>
References: <20220519191306.821774-1-eperezma@redhat.com>
 <20220519191306.821774-15-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220519191306.821774-15-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


在 2022/5/20 03:12, Eugenio Pérez 写道:
> CVQ needs to be in its own group, not shared with any data vq. Enable
> the checking of it here, before introducing address space id concepts.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   include/hw/virtio/vhost.h |  2 +
>   hw/net/vhost_net.c        |  4 +-
>   hw/virtio/vhost-vdpa.c    | 79 ++++++++++++++++++++++++++++++++++++++-
>   hw/virtio/trace-events    |  1 +
>   4 files changed, 84 insertions(+), 2 deletions(-)
>
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index b291fe4e24..cebec1d817 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -84,6 +84,8 @@ struct vhost_dev {
>       int vq_index_end;
>       /* if non-zero, minimum required value for max_queues */
>       int num_queues;
> +    /* Must be a vq group different than any other vhost dev */
> +    bool independent_vq_group;


We probably need a better abstraction here.

E.g having a parent vhost_dev_group structure.


>       uint64_t features;
>       uint64_t acked_features;
>       uint64_t backend_features;
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index ccac5b7a64..1c2386c01c 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -339,14 +339,16 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>       }
>   
>       for (i = 0; i < nvhosts; i++) {
> +        bool cvq_idx = i >= data_queue_pairs;
>   
> -        if (i < data_queue_pairs) {
> +        if (!cvq_idx) {
>               peer = qemu_get_peer(ncs, i);
>           } else { /* Control Virtqueue */
>               peer = qemu_get_peer(ncs, n->max_queue_pairs);
>           }
>   
>           net = get_vhost_net(peer);
> +        net->dev.independent_vq_group = !!cvq_idx;
>           vhost_net_set_vq_index(net, i * 2, index_end);
>   
>           /* Suppress the masking guest notifiers on vhost user
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index eec6d544e9..52dd8baa8d 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -685,7 +685,8 @@ static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
>   {
>       uint64_t features;
>       uint64_t f = 0x1ULL << VHOST_BACKEND_F_IOTLB_MSG_V2 |
> -        0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH;
> +        0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH |
> +        0x1ULL << VHOST_BACKEND_F_IOTLB_ASID;
>       int r;
>   
>       if (vhost_vdpa_call(dev, VHOST_GET_BACKEND_FEATURES, &features)) {
> @@ -1110,6 +1111,78 @@ static bool vhost_vdpa_svqs_stop(struct vhost_dev *dev)
>       return true;
>   }
>   
> +static int vhost_vdpa_get_vring_group(struct vhost_dev *dev,
> +                                      struct vhost_vring_state *state)
> +{
> +    int ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_VRING_GROUP, state);
> +    trace_vhost_vdpa_get_vring_group(dev, state->index, state->num);
> +    return ret;
> +}
> +
> +static bool vhost_dev_is_independent_group(struct vhost_dev *dev)
> +{
> +    struct vhost_vdpa *v = dev->opaque;
> +    struct vhost_vring_state this_vq_group = {
> +        .index = dev->vq_index,
> +    };
> +    int ret;
> +
> +    if (!(dev->backend_cap & VHOST_BACKEND_F_IOTLB_ASID)) {
> +        return true;
> +    }


This should be false?


> +
> +    if (!v->shadow_vqs_enabled) {
> +        return true;
> +    }


And here?


> +
> +    ret = vhost_vdpa_get_vring_group(dev, &this_vq_group);
> +    if (unlikely(ret)) {
> +        goto call_err;
> +    }
> +
> +    for (int i = 1; i < dev->nvqs; ++i) {
> +        struct vhost_vring_state vq_group = {
> +            .index = dev->vq_index + i,
> +        };
> +
> +        ret = vhost_vdpa_get_vring_group(dev, &vq_group);
> +        if (unlikely(ret)) {
> +            goto call_err;
> +        }
> +        if (unlikely(vq_group.num != this_vq_group.num)) {
> +            error_report("VQ %d group is different than VQ %d one",
> +                         this_vq_group.index, vq_group.index);


Not sure this is needed. The group id is not tied to vq index if I 
understand correctly.

E.g we have 1 qp with cvq, we can have

group 0 cvq

group 1 tx/rx

Thanks


> +            return false;
> +        }
> +    }
> +
> +    for (int i = 0; i < dev->vq_index_end; ++i) {
> +        struct vhost_vring_state vq_group = {
> +            .index = i,
> +        };
> +
> +        if (dev->vq_index <= i && i < dev->vq_index + dev->nvqs) {
> +            continue;
> +        }
> +
> +        ret = vhost_vdpa_get_vring_group(dev, &vq_group);
> +        if (unlikely(ret)) {
> +            goto call_err;
> +        }
> +        if (unlikely(vq_group.num == this_vq_group.num)) {
> +            error_report("VQ %d group is the same as VQ %d one",
> +                         this_vq_group.index, vq_group.index);
> +            return false;
> +        }
> +    }
> +
> +    return true;
> +
> +call_err:
> +    error_report("Can't read vq group, errno=%d (%s)", ret, g_strerror(-ret));
> +    return false;
> +}
> +
>   static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>   {
>       struct vhost_vdpa *v = dev->opaque;
> @@ -1118,6 +1191,10 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>   
>       if (started) {
>           vhost_vdpa_host_notifiers_init(dev);
> +        if (dev->independent_vq_group &&
> +            !vhost_dev_is_independent_group(dev)) {
> +            return -1;
> +        }
>           ok = vhost_vdpa_svqs_start(dev);
>           if (unlikely(!ok)) {
>               return -1;
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index ab8e095b73..ffb8eb26e7 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -46,6 +46,7 @@ vhost_vdpa_set_vring_ready(void *dev) "dev: %p"
>   vhost_vdpa_dump_config(void *dev, const char *line) "dev: %p %s"
>   vhost_vdpa_set_config(void *dev, uint32_t offset, uint32_t size, uint32_t flags) "dev: %p offset: %"PRIu32" size: %"PRIu32" flags: 0x%"PRIx32
>   vhost_vdpa_get_config(void *dev, void *config, uint32_t config_len) "dev: %p config: %p config_len: %"PRIu32
> +vhost_vdpa_get_vring_group(void *dev, unsigned int index, unsigned int num) "dev: %p index: %u num: %u"
>   vhost_vdpa_dev_start(void *dev, bool started) "dev: %p started: %d"
>   vhost_vdpa_set_log_base(void *dev, uint64_t base, unsigned long long size, int refcnt, int fd, void *log) "dev: %p base: 0x%"PRIx64" size: %llu refcnt: %d fd: %d log: %p"
>   vhost_vdpa_set_vring_addr(void *dev, unsigned int index, unsigned int flags, uint64_t desc_user_addr, uint64_t used_user_addr, uint64_t avail_user_addr, uint64_t log_guest_addr) "dev: %p index: %u flags: 0x%x desc_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" log_guest_addr: 0x%"PRIx64


