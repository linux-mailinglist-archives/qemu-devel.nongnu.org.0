Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E94B83C1F21
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:54:01 +0200 (CEST)
Received: from localhost ([::1]:50656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1jSa-0001TO-Vo
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m1jGJ-0005Am-P9
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 01:41:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m1jGG-0004D9-7p
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 01:41:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625809274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8LPZWZ9Ya/57FqBn6pYa+6s6ietZNpJ4tmKP1VfJa10=;
 b=IUDMY7Eo3V59GWRy4AeIUR2eEMefMNRufZ+XT9S2r9zQXpWDD0oWyLY2oT5czrJ457B6jF
 1he+w9tFjI30xO64aCfIFpwOVWUemYCtV5YWj9pg+dnsipaLQRIx9XWJ40MqT2UkusEarm
 oRjdhqijtIsUetERjv7x0ooBGt4OCEU=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-yIzcC030MjePULFkL-m4jQ-1; Fri, 09 Jul 2021 01:41:13 -0400
X-MC-Unique: yIzcC030MjePULFkL-m4jQ-1
Received: by mail-pj1-f69.google.com with SMTP id
 cp14-20020a17090afb8eb029017094b4d856so5284195pjb.7
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 22:41:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=8LPZWZ9Ya/57FqBn6pYa+6s6ietZNpJ4tmKP1VfJa10=;
 b=kNcNMzERKl0UZZR6ywNlf8Xmfmkg4RtePTQlRRCe2DHc2zEIZWsVoUsRe7HePcSRz7
 6Cm9a0pOWCf5ieXMLuD+dq8LFxN+a1Gru1VzhuUjy92oSBQHI6YZvd+jvMgc48SOzY4i
 2fsVRUDSqU5mqoNhvBsSRcV4K4DWk3O04tgiXiTCJADA6eXDK4YyuD4voI2Ze+lsGWJV
 cvSZxY3mH3T/xC5jq09k8cz8HOfA8z9NTXBIVQvgZItPngd4M7u0G4rbWXfz5ZYlSk2R
 qxbXJyosPEufT3t9qFA/dWRzxayDa+OvDF58dOn9w1mFgHQDzgbl8BnC2pV3yqBf8MGh
 BZwA==
X-Gm-Message-State: AOAM530qO30BDp//Ymxb5Ca9axSzO5sddPjrCYiSA5nf42JW9qrSedI4
 sLA1bqWDMpFS38Iv7+MjHQTSJ0erZpjd7O1Ah1O6KjJZsBQUn9sQVdJGGRZMNZMhw3dtUCX3GzU
 3ksoNJrCGP3xdZErcw4rVjYbrc28hQs28kLyTTsx1gbI0G8LX90/627VRedVTfhSUoEI=
X-Received: by 2002:a17:902:d505:b029:12a:d79e:7010 with SMTP id
 b5-20020a170902d505b029012ad79e7010mr2332876plg.5.1625809271671; 
 Thu, 08 Jul 2021 22:41:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTlJ64RKxbWybTB/nzQpnp6V/A8OVA6rU/zy6WKZOlY3fxhH7F/niT3niBDQX5DePD9w3KGQ==
X-Received: by 2002:a17:902:d505:b029:12a:d79e:7010 with SMTP id
 b5-20020a170902d505b029012ad79e7010mr2332856plg.5.1625809271263; 
 Thu, 08 Jul 2021 22:41:11 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id y5sm10382296pjy.2.2021.07.08.22.41.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 22:41:10 -0700 (PDT)
Subject: Re: [PATCH v8 5/9] vhost-net:add support for configure interrupt
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210706072030.32365-1-lulu@redhat.com>
 <20210706072030.32365-6-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <9eccde17-673b-1e39-2671-10b21593a689@redhat.com>
Date: Fri, 9 Jul 2021 13:41:04 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706072030.32365-6-lulu@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/7/6 ÏÂÎç3:20, Cindy Lu Ð´µÀ:
> Add configure notifier support in vhost and virtio driver
> When backend support VIRTIO_NET_F_STATUS,setup the configure
> interrupt function in vhost_net_start and release the related
> resource when vhost_net_stop
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>   hw/net/vhost_net.c         | 36 +++++++++++++++++++++++++++++++
>   hw/net/virtio-net.c        |  6 ++++++
>   hw/virtio/vhost.c          | 44 ++++++++++++++++++++++++++++++++++++++
>   hw/virtio/virtio.c         | 33 ++++++++++++++++++++++++++--
>   include/hw/virtio/vhost.h  |  2 ++
>   include/hw/virtio/virtio.h |  5 +++++
>   include/net/vhost_net.h    |  3 +++
>   7 files changed, 127 insertions(+), 2 deletions(-)
>
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 24d555e764..be453717c4 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -310,6 +310,31 @@ static void vhost_net_stop_one(struct vhost_net *net,
>       vhost_dev_disable_notifiers(&net->dev, dev);
>   }
>   
> +static void vhost_net_stop_config_intr(struct vhost_net *net)
> +{
> +    struct vhost_dev *dev = &net->dev;
> +    if (dev->features & (0x1ULL << VIRTIO_NET_F_STATUS)) {
> +        if (dev->vhost_ops->vhost_set_config_call) {
> +            int fd = -1;
> +            dev->vhost_ops->vhost_set_config_call(dev, fd);
> +        }
> +    }
> +}
> +
> +static void vhost_net_start_config_intr(struct vhost_net *net)
> +{
> +    struct vhost_dev *dev = &net->dev;
> +    if (!(dev->features & (0x1ULL << VIRTIO_NET_F_STATUS))) {
> +        return;
> +    }


Rethink about this, I don't think we need such whitelist. Config 
interrupt works like a basic device facility.


> +    if (dev->vhost_ops->vhost_set_config_call) {
> +        int fd = event_notifier_get_fd(&dev->vdev->config_notifier);
> +        int r = dev->vhost_ops->vhost_set_config_call(dev, fd);
> +        if (!r) {
> +            event_notifier_set(&dev->vdev->config_notifier);
> +        }
> +    }
> +}
>   int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>                       int total_queues)
>   {
> @@ -364,6 +389,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>           }
>       }
>   
> +    vhost_net_start_config_intr(get_vhost_net(ncs[0].peer));


I think we can reuse vhost_vdpa_dev_start()?


>       return 0;
>   
>   err_start:
> @@ -397,6 +423,7 @@ void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
>           fprintf(stderr, "vhost guest notifier cleanup failed: %d\n", r);
>           fflush(stderr);
>       }
> +    vhost_net_stop_config_intr(get_vhost_net(ncs[0].peer));
>       assert(r >= 0);
>   }
>   
> @@ -426,6 +453,15 @@ void vhost_net_virtqueue_mask(VHostNetState *net, VirtIODevice *dev,
>       vhost_virtqueue_mask(&net->dev, dev, idx, mask);
>   }
>   
> +bool vhost_net_config_pending(VHostNetState *net, int idx)
> +{
> +    return vhost_config_pending(&net->dev, idx);
> +}


Blank line is needed.


> +void vhost_net_config_mask(VHostNetState *net, VirtIODevice *dev,
> +                              bool mask)
> +{
> +    vhost_config_mask(&net->dev, dev, mask);
> +}
>   VHostNetState *get_vhost_net(NetClientState *nc)
>   {
>       VHostNetState *vhost_net = 0;
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index f50235b5d6..02033be748 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -3055,6 +3055,9 @@ static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
>       if (idx != VIRTIO_CONFIG_IRQ_IDX) {
>           return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
>       }
> +    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> +        return vhost_net_config_pending(get_vhost_net(nc->peer), idx);


I think there's no need to pass idx to vhost_net_config_pending.


> +   }
>       return false;
>   }
>   
> @@ -3067,6 +3070,9 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
>       if (idx != VIRTIO_CONFIG_IRQ_IDX) {
>           vhost_net_virtqueue_mask(get_vhost_net(nc->peer), vdev, idx, mask);
>       }
> +    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> +        vhost_net_config_mask(get_vhost_net(nc->peer), vdev, mask);
> +     }
>   }
>   
>   static void virtio_net_set_config_size(VirtIONet *n, uint64_t host_features)
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index e2163a0d63..6716109448 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -1505,6 +1505,16 @@ bool vhost_virtqueue_pending(struct vhost_dev *hdev, int n)
>       return event_notifier_test_and_clear(&vq->masked_notifier);
>   }
>   
> +bool vhost_config_pending(struct vhost_dev *hdev, int n)
> +{
> +    assert(hdev->vhost_ops);
> +    VirtIODevice *vdev = hdev->vdev;
> +    if ((hdev->started == false) ||
> +        (hdev->vhost_ops->vhost_set_config_call == NULL)) {
> +        return false;
> +    }
> +    return event_notifier_test_and_clear(&vdev->masked_config_notifier);


n is not used.


> +}
>   /* Mask/unmask events from this vq. */
>   void vhost_virtqueue_mask(struct vhost_dev *hdev, VirtIODevice *vdev, int n,
>                            bool mask)
> @@ -1529,6 +1539,30 @@ void vhost_virtqueue_mask(struct vhost_dev *hdev, VirtIODevice *vdev, int n,
>           VHOST_OPS_DEBUG("vhost_set_vring_call failed");
>       }
>   }
> +void vhost_config_mask(struct vhost_dev *hdev, VirtIODevice *vdev,
> +                         bool mask)
> +{
> +   int fd;
> +   int r;
> +   EventNotifier *masked_config_notifier = &vdev->masked_config_notifier;
> +   EventNotifier *config_notifier = &vdev->config_notifier;
> +   assert(hdev->vhost_ops);
> +
> +   if ((hdev->started == false) ||


We don't check this in vhost_virtqueue_mask(), any reason for doing this?


> +        (hdev->vhost_ops->vhost_set_config_call == NULL)) {
> +        return ;
> +    }
> +    if (mask) {
> +        assert(vdev->use_guest_notifier_mask);
> +        fd = event_notifier_get_fd(masked_config_notifier);
> +    } else {
> +        fd = event_notifier_get_fd(config_notifier);
> +    }


Please check the indentation above.


> +   r = hdev->vhost_ops->vhost_set_config_call(hdev, fd);
> +   if (r < 0) {
> +        VHOST_OPS_DEBUG("vhost_set_config_call failed");
> +    }
> +}
>   
>   uint64_t vhost_get_features(struct vhost_dev *hdev, const int *feature_bits,
>                               uint64_t features)
> @@ -1740,6 +1774,14 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
>           }
>       }
>   
> +    r = event_notifier_init(&vdev->masked_config_notifier, 0);
> +    if (r < 0) {
> +        return r;
> +    }
> +    event_notifier_test_and_clear(&vdev->masked_config_notifier);


This wont' work in the case of multiqueue. And it's kind of layer 
violation if you initialize the VirtioDevice stuff in the vhost layer.

Note that the virtqueue mask notifiers is embed in structure 
vhost_virtqueue, it means you probably need to embed the 
masked_config_notifier to be embed in struct vhost_dev.

And deal with the multiqueue stuffs, (e.g we will only use the notifier 
for the first queue pair).


> +    if (!vdev->use_guest_notifier_mask) {
> +        vhost_config_mask(hdev, vdev, true);
> +    }
>       if (hdev->log_enabled) {
>           uint64_t log_base;
>   
> @@ -1798,6 +1840,8 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
>   
>       /* should only be called after backend is connected */
>       assert(hdev->vhost_ops);
> +    event_notifier_test_and_clear(&vdev->masked_config_notifier);
> +    event_notifier_test_and_clear(&vdev->config_notifier);
>   
>       if (hdev->vhost_ops->vhost_dev_start) {
>           hdev->vhost_ops->vhost_dev_start(hdev, false);
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 07f4e60b30..dbd2e36403 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -3504,10 +3504,18 @@ static void virtio_queue_guest_notifier_read(EventNotifier *n)
>           virtio_irq(vq);
>       }
>   }
> +static void virtio_config_read(EventNotifier *n)
> +{
> +    VirtIODevice *vdev = container_of(n, VirtIODevice, config_notifier);
>   
> +    if (event_notifier_test_and_clear(n)) {
> +        virtio_notify_config(vdev);
> +    }
> +}


This (the changes in virtio.c) need to be done via an separate patch, it 
belongs to the abstraction layer of guest notifier.

And we need rename this as virtio_config_guest_notifier_read().


>   void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
>                                                   bool with_irqfd)
>   {
> +


Unnecessary change.


>       if (assign && !with_irqfd) {
>           event_notifier_set_handler(&vq->guest_notifier,
>                                      virtio_queue_guest_notifier_read);
> @@ -3515,12 +3523,29 @@ void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
>           event_notifier_set_handler(&vq->guest_notifier, NULL);
>       }
>       if (!assign) {
> -        /* Test and clear notifier before closing it,
> -         * in case poll callback didn't have time to run. */
> +        /* Test and clear notifier before closing it,*/
> +        /* in case poll callback didn't have time to run. */


Unnecessary changes?


>           virtio_queue_guest_notifier_read(&vq->guest_notifier);
>       }
>   }
>   
> +void virtio_set_config_notifier_fd_handler(VirtIODevice *vdev, bool assign,
> +                                              bool with_irqfd)


Let's use "virtio_config_set_guest_notifier_fd_handler()


> +{
> +    EventNotifier *n;
> +    n = &vdev->config_notifier;
> +    if (assign && !with_irqfd) {
> +        event_notifier_set_handler(n, virtio_config_read);
> +    } else {
> +        event_notifier_set_handler(n, NULL);
> +    }
> +    if (!assign) {
> +        /* Test and clear notifier before closing it,*/
> +        /* in case poll callback didn't have time to run. */
> +        virtio_config_read(n);
> +    }
> +}
> +
>   EventNotifier *virtio_queue_get_guest_notifier(VirtQueue *vq)
>   {
>       return &vq->guest_notifier;
> @@ -3594,6 +3619,10 @@ EventNotifier *virtio_queue_get_host_notifier(VirtQueue *vq)
>       return &vq->host_notifier;
>   }
>   
> +EventNotifier *virtio_get_config_notifier(VirtIODevice *vdev)


Let's use "virtio_config_get_guest_notifier" to be consistent with the 
guest notifier abstraction.

Thanks


> +{
> +    return &vdev->config_notifier;
> +}
>   void virtio_queue_set_host_notifier_enabled(VirtQueue *vq, bool enabled)
>   {
>       vq->host_notifier_enabled = enabled;
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index 4a8bc75415..b8814ece32 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -108,6 +108,8 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev);
>   void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev);
>   int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
>   void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
> +bool vhost_config_pending(struct vhost_dev *hdev, int n);
> +void vhost_config_mask(struct vhost_dev *hdev, VirtIODevice *vdev, bool mask);
>   
>   /* Test and clear masked event pending status.
>    * Should be called after unmask to avoid losing events.
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index 63cb9455ed..3bfd0692a4 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -110,6 +110,8 @@ struct VirtIODevice
>       bool use_guest_notifier_mask;
>       AddressSpace *dma_as;
>       QLIST_HEAD(, VirtQueue) *vector_queues;
> +    EventNotifier config_notifier;
> +    EventNotifier masked_config_notifier;
>   };
>   
>   struct VirtioDeviceClass {
> @@ -312,11 +314,14 @@ uint16_t virtio_get_queue_index(VirtQueue *vq);
>   EventNotifier *virtio_queue_get_guest_notifier(VirtQueue *vq);
>   void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
>                                                   bool with_irqfd);
> + void virtio_set_config_notifier_fd_handler(VirtIODevice *vdev, bool assign,
> +                                            bool with_irqfd);
>   int virtio_device_start_ioeventfd(VirtIODevice *vdev);
>   int virtio_device_grab_ioeventfd(VirtIODevice *vdev);
>   void virtio_device_release_ioeventfd(VirtIODevice *vdev);
>   bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev);
>   EventNotifier *virtio_queue_get_host_notifier(VirtQueue *vq);
> +EventNotifier *virtio_get_config_notifier(VirtIODevice *vdev);
>   void virtio_queue_set_host_notifier_enabled(VirtQueue *vq, bool enabled);
>   void virtio_queue_host_notifier_read(EventNotifier *n);
>   void virtio_queue_aio_set_host_notifier_handler(VirtQueue *vq, AioContext *ctx,
> diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
> index 172b0051d8..0d38c97c94 100644
> --- a/include/net/vhost_net.h
> +++ b/include/net/vhost_net.h
> @@ -36,6 +36,9 @@ int vhost_net_set_config(struct vhost_net *net, const uint8_t *data,
>   bool vhost_net_virtqueue_pending(VHostNetState *net, int n);
>   void vhost_net_virtqueue_mask(VHostNetState *net, VirtIODevice *dev,
>                                 int idx, bool mask);
> +bool vhost_net_config_pending(VHostNetState *net, int n);
> +void vhost_net_config_mask(VHostNetState *net, VirtIODevice *dev,
> +                              bool mask);
>   int vhost_net_notify_migration_done(VHostNetState *net, char* mac_addr);
>   VHostNetState *get_vhost_net(NetClientState *nc);
>   


