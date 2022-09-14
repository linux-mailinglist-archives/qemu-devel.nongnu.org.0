Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 651E15B7F31
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 05:08:35 +0200 (CEST)
Received: from localhost ([::1]:34894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYIlM-0002Ch-SW
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 23:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oYIjZ-0007w9-GD
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 23:06:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oYIjV-0001Lt-H1
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 23:06:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663124795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TZ68u1Vt0TR8vwXbUG3eIAtZrV99pkT4c+MbFD3qF9A=;
 b=Geh7D8FuCMnCyTkEKFT/MxXEMDh2HnPRF41dJyZ5oHccAdDPrehVUTzESINhaOKfn84xwD
 s09SOoRGUDvceZQLMhrp10uD3/PYUz24SPcbFjtPqiDxT3J2RAtnOJkMUeDrjJhw2NFCKQ
 7Ssnjg+Bp4C+5ndD5IK411Zwvkdd+80=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-651-eWbrWWSZPla0LZWOKyh5Dw-1; Tue, 13 Sep 2022 23:06:34 -0400
X-MC-Unique: eWbrWWSZPla0LZWOKyh5Dw-1
Received: by mail-pl1-f197.google.com with SMTP id
 l2-20020a170902f68200b00177ee7e673eso9462591plg.2
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 20:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=TZ68u1Vt0TR8vwXbUG3eIAtZrV99pkT4c+MbFD3qF9A=;
 b=l585zkhBeUGlBE6HsdSeDSGN4fcYHKXq8TkFs66L8VY+WuNrRdfThoB+fO97BWnD6X
 JRdLWFst6uKcTjOkx8Lrb7G4Qmz8nsOEGvNUQeRjMn5JQlYY635U7Xhwjl+iBou/SH6S
 7zcXyxHoxd39318w0P7A5OSXeyKpHEOPBpdPW5KvDYxBxJMtsKnwID5Wqzr5aF9BN/4w
 bB9OubRL+tsQkd5XXLTZuErRqeNOL+Hv4r+mU64Q4ao60y9Zcm5tvLGbscqLBnzS2BR/
 foHhoH7mDCyUcMxpJkXWDlA2HgjrN7Wv335Gd2Su9zoIBw3x5+otYcPtgbBEKYolKLcK
 KmdA==
X-Gm-Message-State: ACgBeo2V5nVNNZhErxtFO4UAaNHbpirOTcP3wmKICWY+1RzVkFW4Saf4
 AFO/v9rt7F1C9j+fFfsl6AOUXtCUxW6rAuxSzHrhN9f6BaoDG9kinKXwIq/akRLAzaIVjPGgkYq
 aXUzWLCJhdmwVRvQ=
X-Received: by 2002:a17:903:40c9:b0:176:e58c:f082 with SMTP id
 t9-20020a17090340c900b00176e58cf082mr35317866pld.60.1663124793080; 
 Tue, 13 Sep 2022 20:06:33 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4VFRWLKaiJyJl6oLAx2dr28J1fvktVIPH+6lozrMmNXS+2Il8mijh0tZdV6MXdznzfRFc1Bw==
X-Received: by 2002:a17:903:40c9:b0:176:e58c:f082 with SMTP id
 t9-20020a17090340c900b00176e58cf082mr35317834pld.60.1663124792693; 
 Tue, 13 Sep 2022 20:06:32 -0700 (PDT)
Received: from [10.72.13.65] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 u197-20020a6279ce000000b00540e1117c98sm8598418pfc.122.2022.09.13.20.06.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 20:06:32 -0700 (PDT)
Message-ID: <89c49277-c01a-dec8-49d2-8c1335f1d933@redhat.com>
Date: Wed, 14 Sep 2022 11:06:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/6] net: virtio: rename vhost_set_vring_enable to
 vhost_set_dev_enable
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, arei.gonglei@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
References: <cover.1662949366.git.kangjie.xu@linux.alibaba.com>
 <390f63067306a35c669a6d0cb5ad7ad242a3fcfe.1662949366.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <390f63067306a35c669a6d0cb5ad7ad242a3fcfe.1662949366.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.628, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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


在 2022/9/12 11:10, Kangjie Xu 写道:
> Previously, vhost_set_vring_enable will enable/disable all vrings
> in a device,


Nit: It would be more clear to say to disable all vrings for a specific 
vhost device.

Since in the case of multiqueue virtio-net, a single virtio-net device 
may have multiple vhost devices.

Thanks


> which causes ambiguity. So we rename it to
> vhost_set_dev_enable.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   backends/cryptodev-vhost.c        | 12 ++++++------
>   hw/net/vhost_net-stub.c           |  2 +-
>   hw/net/vhost_net.c                |  8 ++++----
>   hw/net/virtio-net.c               |  4 ++--
>   hw/virtio/vhost-user.c            |  4 ++--
>   include/hw/virtio/vhost-backend.h |  6 +++---
>   include/net/vhost_net.h           |  2 +-
>   7 files changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/backends/cryptodev-vhost.c b/backends/cryptodev-vhost.c
> index bc13e466b4..b83e939760 100644
> --- a/backends/cryptodev-vhost.c
> +++ b/backends/cryptodev-vhost.c
> @@ -147,9 +147,9 @@ cryptodev_vhost_set_vq_index(CryptoDevBackendVhost *crypto,
>   }
>   
>   static int
> -vhost_set_vring_enable(CryptoDevBackendClient *cc,
> -                            CryptoDevBackend *b,
> -                            uint16_t queue, int enable)
> +vhost_set_dev_enable(CryptoDevBackendClient *cc,
> +                     CryptoDevBackend *b,
> +                     uint16_t queue, int enable)
>   {
>       CryptoDevBackendVhost *crypto =
>                          cryptodev_get_vhost(cc, b, queue);
> @@ -162,8 +162,8 @@ vhost_set_vring_enable(CryptoDevBackendClient *cc,
>       }
>   
>       vhost_ops = crypto->dev.vhost_ops;
> -    if (vhost_ops->vhost_set_vring_enable) {
> -        return vhost_ops->vhost_set_vring_enable(&crypto->dev, enable);
> +    if (vhost_ops->vhost_set_dev_enable) {
> +        return vhost_ops->vhost_set_dev_enable(&crypto->dev, enable);
>       }
>   
>       return 0;
> @@ -219,7 +219,7 @@ int cryptodev_vhost_start(VirtIODevice *dev, int total_queues)
>   
>           if (cc->vring_enable) {
>               /* restore vring enable state */
> -            r = vhost_set_vring_enable(cc, b, i, cc->vring_enable);
> +            r = vhost_set_dev_enable(cc, b, i, cc->vring_enable);
>   
>               if (r < 0) {
>                   goto err_start;
> diff --git a/hw/net/vhost_net-stub.c b/hw/net/vhost_net-stub.c
> index 89d71cfb8e..ac5f217dc1 100644
> --- a/hw/net/vhost_net-stub.c
> +++ b/hw/net/vhost_net-stub.c
> @@ -92,7 +92,7 @@ VHostNetState *get_vhost_net(NetClientState *nc)
>       return 0;
>   }
>   
> -int vhost_set_vring_enable(NetClientState *nc, int enable)
> +int vhost_set_dev_enable(NetClientState *nc, int enable)
>   {
>       return 0;
>   }
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 97cdf9280b..ea896ea75b 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -396,7 +396,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>   
>           if (peer->vring_enable) {
>               /* restore vring enable state */
> -            r = vhost_set_vring_enable(peer, peer->vring_enable);
> +            r = vhost_set_dev_enable(peer, peer->vring_enable);
>   
>               if (r < 0) {
>                   vhost_net_stop_one(get_vhost_net(peer), dev);
> @@ -508,15 +508,15 @@ VHostNetState *get_vhost_net(NetClientState *nc)
>       return vhost_net;
>   }
>   
> -int vhost_set_vring_enable(NetClientState *nc, int enable)
> +int vhost_set_dev_enable(NetClientState *nc, int enable)
>   {
>       VHostNetState *net = get_vhost_net(nc);
>       const VhostOps *vhost_ops = net->dev.vhost_ops;
>   
>       nc->vring_enable = enable;
>   
> -    if (vhost_ops && vhost_ops->vhost_set_vring_enable) {
> -        return vhost_ops->vhost_set_vring_enable(&net->dev, enable);
> +    if (vhost_ops && vhost_ops->vhost_set_dev_enable) {
> +        return vhost_ops->vhost_set_dev_enable(&net->dev, enable);
>       }
>   
>       return 0;
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 7817206596..6ab796b399 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -696,7 +696,7 @@ static int peer_attach(VirtIONet *n, int index)
>       }
>   
>       if (nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
> -        vhost_set_vring_enable(nc->peer, 1);
> +        vhost_set_dev_enable(nc->peer, 1);
>       }
>   
>       if (nc->peer->info->type != NET_CLIENT_DRIVER_TAP) {
> @@ -719,7 +719,7 @@ static int peer_detach(VirtIONet *n, int index)
>       }
>   
>       if (nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
> -        vhost_set_vring_enable(nc->peer, 0);
> +        vhost_set_dev_enable(nc->peer, 0);
>       }
>   
>       if (nc->peer->info->type !=  NET_CLIENT_DRIVER_TAP) {
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index bd24741be8..794519359b 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -1198,7 +1198,7 @@ static int vhost_user_set_vring_base(struct vhost_dev *dev,
>       return vhost_set_vring(dev, VHOST_USER_SET_VRING_BASE, ring);
>   }
>   
> -static int vhost_user_set_vring_enable(struct vhost_dev *dev, int enable)
> +static int vhost_user_set_dev_enable(struct vhost_dev *dev, int enable)
>   {
>       int i;
>   
> @@ -2627,7 +2627,7 @@ const VhostOps user_ops = {
>           .vhost_set_owner = vhost_user_set_owner,
>           .vhost_reset_device = vhost_user_reset_device,
>           .vhost_get_vq_index = vhost_user_get_vq_index,
> -        .vhost_set_vring_enable = vhost_user_set_vring_enable,
> +        .vhost_set_dev_enable = vhost_user_set_dev_enable,
>           .vhost_requires_shm_log = vhost_user_requires_shm_log,
>           .vhost_migration_done = vhost_user_migration_done,
>           .vhost_backend_can_merge = vhost_user_can_merge,
> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
> index eab46d7f0b..b49432045f 100644
> --- a/include/hw/virtio/vhost-backend.h
> +++ b/include/hw/virtio/vhost-backend.h
> @@ -81,8 +81,8 @@ typedef int (*vhost_set_backend_cap_op)(struct vhost_dev *dev);
>   typedef int (*vhost_set_owner_op)(struct vhost_dev *dev);
>   typedef int (*vhost_reset_device_op)(struct vhost_dev *dev);
>   typedef int (*vhost_get_vq_index_op)(struct vhost_dev *dev, int idx);
> -typedef int (*vhost_set_vring_enable_op)(struct vhost_dev *dev,
> -                                         int enable);
> +typedef int (*vhost_set_dev_enable_op)(struct vhost_dev *dev,
> +                                       int enable);
>   typedef bool (*vhost_requires_shm_log_op)(struct vhost_dev *dev);
>   typedef int (*vhost_migration_done_op)(struct vhost_dev *dev,
>                                          char *mac_addr);
> @@ -155,7 +155,7 @@ typedef struct VhostOps {
>       vhost_set_owner_op vhost_set_owner;
>       vhost_reset_device_op vhost_reset_device;
>       vhost_get_vq_index_op vhost_get_vq_index;
> -    vhost_set_vring_enable_op vhost_set_vring_enable;
> +    vhost_set_dev_enable_op vhost_set_dev_enable;
>       vhost_requires_shm_log_op vhost_requires_shm_log;
>       vhost_migration_done_op vhost_migration_done;
>       vhost_backend_can_merge_op vhost_backend_can_merge;
> diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
> index 40b9a40074..22a1fcd39e 100644
> --- a/include/net/vhost_net.h
> +++ b/include/net/vhost_net.h
> @@ -42,7 +42,7 @@ void vhost_net_virtqueue_mask(VHostNetState *net, VirtIODevice *dev,
>   int vhost_net_notify_migration_done(VHostNetState *net, char* mac_addr);
>   VHostNetState *get_vhost_net(NetClientState *nc);
>   
> -int vhost_set_vring_enable(NetClientState * nc, int enable);
> +int vhost_set_dev_enable(NetClientState *nc, int enable);
>   
>   uint64_t vhost_net_get_acked_features(VHostNetState *net);
>   


