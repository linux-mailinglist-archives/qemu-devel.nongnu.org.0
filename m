Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B481049F343
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 07:06:07 +0100 (CET)
Received: from localhost ([::1]:50408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDKOc-0000g2-QZ
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 01:06:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nDKI8-0007Dj-2D
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 00:59:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nDKI4-0002xm-I8
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 00:59:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643349559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oitSK9I3YZG1rWLNMuU6LMoA46dX5KaaI4ppmXJErZM=;
 b=SCjztOl6TP48/8pMn0hKCahLKPmcCf+ezskHdHvz02HbhMUPCI0ylL1vPip928zxyKrzKQ
 2x20/bp6FII9o5h0J+6a5uF6JDB7+1xZgC17KiNVURh+GP1fn9j6hhWDFVuf5ItCGUuMWi
 Lw2LleQZM39jCd/lvgoWhh3wu5e5Ut4=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-wNFEb6GdMgKlEgU9Sivhfg-1; Fri, 28 Jan 2022 00:59:18 -0500
X-MC-Unique: wNFEb6GdMgKlEgU9Sivhfg-1
Received: by mail-pj1-f69.google.com with SMTP id
 e16-20020a17090a119000b001b28f7b2a3bso3118341pja.8
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 21:59:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oitSK9I3YZG1rWLNMuU6LMoA46dX5KaaI4ppmXJErZM=;
 b=qdD8IJgKVlZgNg1za1yEhIT1VcX6pXzL+OhnNFqwuGnD8fDNzJDwstdlZNYqcqeMnZ
 od+Fj+QTJLZzF0yTpIuahbXcEU6VhIrLC/teb25LxHgob4kYK3t39DsgzIBa50McLyFa
 gQpOph8fqAXOjzV/peg/0jYUIOuPoT7p8/x02qAHEty5cB/NbMvEObYUgtnKGQHqZ/bo
 A+9lHaPi9DA4tJur6LFLRCKdoBQ5YW5bWa5Fd3nRYsYeVNUFoCaow7aAUJauLGsZzRgJ
 ywsvmUh9qDXM5WbTeaQ9q4GFb9m5zHr8Xek8vFoQb1+Vdhv2rQKsPhbUqM8aQuEzqFe3
 sqRA==
X-Gm-Message-State: AOAM5332r6F5tqDH6Phw3+FpL+fm+MxjwR5wqnYruxJSXvCD4T6rTRPX
 9EsPuH8J7648WDqp+BaJgUKJipkENRDoBql/TmrVIvY929E9xwmSvN4RQTrbm4cxfOxmsIKrVY8
 oADCyjhS8K1Fbz/I=
X-Received: by 2002:a05:6a00:1312:: with SMTP id
 j18mr6250483pfu.61.1643349557164; 
 Thu, 27 Jan 2022 21:59:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxM7GtklXiZln7FjKCq9nZUq3JnD3OmTjctC2A2YbpD3k9gYpSmt6jUwUaiKrDlDwzoMg+EuQ==
X-Received: by 2002:a05:6a00:1312:: with SMTP id
 j18mr6250443pfu.61.1643349556884; 
 Thu, 27 Jan 2022 21:59:16 -0800 (PST)
Received: from [10.72.13.185] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id f16sm8147510pfa.147.2022.01.27.21.59.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 21:59:16 -0800 (PST)
Message-ID: <bb5490a4-8fae-0cc8-56dd-0953a2b40922@redhat.com>
Date: Fri, 28 Jan 2022 13:59:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 01/31] vdpa: Reorder virtio/vhost-vdpa.c functions
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-2-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220121202733.404989-2-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/1/22 上午4:27, Eugenio Pérez 写道:
> vhost_vdpa_set_features and vhost_vdpa_init need to use
> vhost_vdpa_get_features in svq mode.
>
> vhost_vdpa_dev_start needs to use almost all _set_ functions:
> vhost_vdpa_set_vring_dev_kick, vhost_vdpa_set_vring_dev_call,
> vhost_vdpa_set_dev_vring_base and vhost_vdpa_set_dev_vring_num.
>
> No functional change intended.


Is it related (a must) to the SVQ code?

Thanks


>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-vdpa.c | 164 ++++++++++++++++++++---------------------
>   1 file changed, 82 insertions(+), 82 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 04ea43704f..6c10a7f05f 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -342,41 +342,6 @@ static bool vhost_vdpa_one_time_request(struct vhost_dev *dev)
>       return v->index != 0;
>   }
>   
> -static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
> -{
> -    struct vhost_vdpa *v;
> -    assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
> -    trace_vhost_vdpa_init(dev, opaque);
> -    int ret;
> -
> -    /*
> -     * Similar to VFIO, we end up pinning all guest memory and have to
> -     * disable discarding of RAM.
> -     */
> -    ret = ram_block_discard_disable(true);
> -    if (ret) {
> -        error_report("Cannot set discarding of RAM broken");
> -        return ret;
> -    }
> -
> -    v = opaque;
> -    v->dev = dev;
> -    dev->opaque =  opaque ;
> -    v->listener = vhost_vdpa_memory_listener;
> -    v->msg_type = VHOST_IOTLB_MSG_V2;
> -
> -    vhost_vdpa_get_iova_range(v);
> -
> -    if (vhost_vdpa_one_time_request(dev)) {
> -        return 0;
> -    }
> -
> -    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> -                               VIRTIO_CONFIG_S_DRIVER);
> -
> -    return 0;
> -}
> -
>   static void vhost_vdpa_host_notifier_uninit(struct vhost_dev *dev,
>                                               int queue_index)
>   {
> @@ -506,24 +471,6 @@ static int vhost_vdpa_set_mem_table(struct vhost_dev *dev,
>       return 0;
>   }
>   
> -static int vhost_vdpa_set_features(struct vhost_dev *dev,
> -                                   uint64_t features)
> -{
> -    int ret;
> -
> -    if (vhost_vdpa_one_time_request(dev)) {
> -        return 0;
> -    }
> -
> -    trace_vhost_vdpa_set_features(dev, features);
> -    ret = vhost_vdpa_call(dev, VHOST_SET_FEATURES, &features);
> -    if (ret) {
> -        return ret;
> -    }
> -
> -    return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_FEATURES_OK);
> -}
> -
>   static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
>   {
>       uint64_t features;
> @@ -646,35 +593,6 @@ static int vhost_vdpa_get_config(struct vhost_dev *dev, uint8_t *config,
>       return ret;
>    }
>   
> -static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
> -{
> -    struct vhost_vdpa *v = dev->opaque;
> -    trace_vhost_vdpa_dev_start(dev, started);
> -
> -    if (started) {
> -        vhost_vdpa_host_notifiers_init(dev);
> -        vhost_vdpa_set_vring_ready(dev);
> -    } else {
> -        vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
> -    }
> -
> -    if (dev->vq_index + dev->nvqs != dev->vq_index_end) {
> -        return 0;
> -    }
> -
> -    if (started) {
> -        memory_listener_register(&v->listener, &address_space_memory);
> -        return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> -    } else {
> -        vhost_vdpa_reset_device(dev);
> -        vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> -                                   VIRTIO_CONFIG_S_DRIVER);
> -        memory_listener_unregister(&v->listener);
> -
> -        return 0;
> -    }
> -}
> -
>   static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,
>                                        struct vhost_log *log)
>   {
> @@ -735,6 +653,35 @@ static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
>       return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
>   }
>   
> +static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
> +{
> +    struct vhost_vdpa *v = dev->opaque;
> +    trace_vhost_vdpa_dev_start(dev, started);
> +
> +    if (started) {
> +        vhost_vdpa_host_notifiers_init(dev);
> +        vhost_vdpa_set_vring_ready(dev);
> +    } else {
> +        vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
> +    }
> +
> +    if (dev->vq_index + dev->nvqs != dev->vq_index_end) {
> +        return 0;
> +    }
> +
> +    if (started) {
> +        memory_listener_register(&v->listener, &address_space_memory);
> +        return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> +    } else {
> +        vhost_vdpa_reset_device(dev);
> +        vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> +                                   VIRTIO_CONFIG_S_DRIVER);
> +        memory_listener_unregister(&v->listener);
> +
> +        return 0;
> +    }
> +}
> +
>   static int vhost_vdpa_get_features(struct vhost_dev *dev,
>                                        uint64_t *features)
>   {
> @@ -745,6 +692,24 @@ static int vhost_vdpa_get_features(struct vhost_dev *dev,
>       return ret;
>   }
>   
> +static int vhost_vdpa_set_features(struct vhost_dev *dev,
> +                                   uint64_t features)
> +{
> +    int ret;
> +
> +    if (vhost_vdpa_one_time_request(dev)) {
> +        return 0;
> +    }
> +
> +    trace_vhost_vdpa_set_features(dev, features);
> +    ret = vhost_vdpa_call(dev, VHOST_SET_FEATURES, &features);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_FEATURES_OK);
> +}
> +
>   static int vhost_vdpa_set_owner(struct vhost_dev *dev)
>   {
>       if (vhost_vdpa_one_time_request(dev)) {
> @@ -772,6 +737,41 @@ static bool  vhost_vdpa_force_iommu(struct vhost_dev *dev)
>       return true;
>   }
>   
> +static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
> +{
> +    struct vhost_vdpa *v;
> +    assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
> +    trace_vhost_vdpa_init(dev, opaque);
> +    int ret;
> +
> +    /*
> +     * Similar to VFIO, we end up pinning all guest memory and have to
> +     * disable discarding of RAM.
> +     */
> +    ret = ram_block_discard_disable(true);
> +    if (ret) {
> +        error_report("Cannot set discarding of RAM broken");
> +        return ret;
> +    }
> +
> +    v = opaque;
> +    v->dev = dev;
> +    dev->opaque =  opaque ;
> +    v->listener = vhost_vdpa_memory_listener;
> +    v->msg_type = VHOST_IOTLB_MSG_V2;
> +
> +    vhost_vdpa_get_iova_range(v);
> +
> +    if (vhost_vdpa_one_time_request(dev)) {
> +        return 0;
> +    }
> +
> +    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> +                               VIRTIO_CONFIG_S_DRIVER);
> +
> +    return 0;
> +}
> +
>   const VhostOps vdpa_ops = {
>           .backend_type = VHOST_BACKEND_TYPE_VDPA,
>           .vhost_backend_init = vhost_vdpa_init,


