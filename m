Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94841399AEA
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 08:41:02 +0200 (CEST)
Received: from localhost ([::1]:57370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loh2L-0005UI-MT
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 02:41:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1loh0v-0004nm-1a
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 02:39:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1loh0t-0008A8-25
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 02:39:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622702370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k2cgKgJBctHa0N/Ajiw9ck61AZDWX5UeTNCeOWXqToE=;
 b=bbHFUKNwQzYMed0CIybwWilZe9UB/SLAhMMhs5+A9lPfZUKo8tmUURIDs1hxEhI6Gtor8s
 XUoq0jmP7zq6xqDo3bfjSDyyAq9CcNR4+pxIFxSjm5xDAD6NOR27kS+c5KXx22MECCmo03
 jp29HAprsWPNKWhv277JQiU7HUiiWrA=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-eDkBzAxJMVid-24lFhaqXg-1; Thu, 03 Jun 2021 02:39:28 -0400
X-MC-Unique: eDkBzAxJMVid-24lFhaqXg-1
Received: by mail-pl1-f197.google.com with SMTP id
 o12-20020a170902778cb02900ff01bc1ddbso2224419pll.2
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 23:39:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=k2cgKgJBctHa0N/Ajiw9ck61AZDWX5UeTNCeOWXqToE=;
 b=T/pdfK++ZIGSJ0VpQlyjOyTWZeaWMPuUwoGrNME0VPRw3VkLNa6MglxgPYuWf7U2M7
 h6U2peHejvZJpxQfB3aA2cMhbRR+1VkA+1qkjp3eOtn0llOHJkKTOQ4NjxdUg57kPCBc
 oQu7bBlLOQo87Jev1I5FgpvyuGUURp1lVG7a3bW33+AwRfgYvHYA8wfVAtLAstqDCeNH
 nuloQ/TWoAOXjgqICQmLDTORgM+3rFmQ3hTQiSgGiMWUenv+DrtQEm3FNUHPzmhVdCPV
 F43puhy5O+n9pNXZQeHl94oxN02vumJ8EcnnTLhyrGev0K7JPbks30+GsBYGl130wkJK
 rzMA==
X-Gm-Message-State: AOAM530EP+8g5GBKCj6dtDPCT4OGHmuzdbS9CnvIvM4FeN3thBMhoz9h
 91IbCvxlxxJPGh0YQC2LQrus0xsRQSKwXGEbDCGRVh/XOtrYSZgGGWyJiIK8GEghAOIDOnR1Yy4
 NmQ3sufGZ9QaAow3KATp2SfLIftoQH3VfRd3Z0KtflIN9MVxvS05dtODEBbPSvpWWyO4=
X-Received: by 2002:a17:902:f704:b029:f4:228d:4dca with SMTP id
 h4-20020a170902f704b02900f4228d4dcamr34773837plo.26.1622702367419; 
 Wed, 02 Jun 2021 23:39:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXZodP7P5FsUbbiXMAQd9KxMCDS3zZ7HQ8XybyC8dGu5OfboSXJkCKwfXRRMYKnzElqa6KUQ==
X-Received: by 2002:a17:902:f704:b029:f4:228d:4dca with SMTP id
 h4-20020a170902f704b02900f4228d4dcamr34773816plo.26.1622702366989; 
 Wed, 02 Jun 2021 23:39:26 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id j5sm1291453pfj.185.2021.06.02.23.39.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 23:39:26 -0700 (PDT)
Subject: Re: [PATCH v7 08/10] virtio-pci: decouple virtqueue from
 kvm_virtio_pci_vector_use
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210602034750.23377-1-lulu@redhat.com>
 <20210602034750.23377-9-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a4dae2fa-a023-5a81-7e9e-5c6164962324@redhat.com>
Date: Thu, 3 Jun 2021 14:39:23 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210602034750.23377-9-lulu@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7,
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


ÔÚ 2021/6/2 ÉÏÎç11:47, Cindy Lu Ð´µÀ:
> inorder


s/inorder/In order/


> to support configure interrupt, we need to decouple
> virtqueue from vector use and vector release function
> this patch introduce vector_release_one and vector_use_one
> to support one vector.
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>


I think we need to reorder the patches to let such decoupling comes 
first in this series.


> ---
>   hw/virtio/virtio-pci.c | 122 ++++++++++++++++++++---------------------
>   1 file changed, 61 insertions(+), 61 deletions(-)
>
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 6a4ef413a4..f863c89de6 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -666,7 +666,6 @@ static uint32_t virtio_read_config(PCIDevice *pci_dev,
>   }
>   
>   static int kvm_virtio_pci_vq_vector_use(VirtIOPCIProxy *proxy,
> -                                        unsigned int queue_no,
>                                           unsigned int vector)
>   {
>       VirtIOIRQFD *irqfd = &proxy->vector_irqfd[vector];
> @@ -710,85 +709,86 @@ static void kvm_virtio_pci_irqfd_release(VirtIOPCIProxy *proxy,
>       ret = kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state, n, irqfd->virq);
>       assert(ret == 0);
>   }
> -
> -static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
> +static int virtio_pci_get_notifier(VirtIOPCIProxy *proxy, int queue_no,
> +                                      EventNotifier **n, unsigned int *vector)
>   {
>       PCIDevice *dev = &proxy->pci_dev;
>       VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> -    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> -    unsigned int vector;
> -    int ret, queue_no;
>       VirtQueue *vq;
> -    EventNotifier *n;
> -    for (queue_no = 0; queue_no < nvqs; queue_no++) {
> +
> +    if (queue_no == VIRTIO_CONFIG_IRQ_IDX) {
> +        return -1;
> +    } else {
>           if (!virtio_queue_get_num(vdev, queue_no)) {
> -            break;
> -        }
> -        vector = virtio_queue_vector(vdev, queue_no);
> -        if (vector >= msix_nr_vectors_allocated(dev)) {
> -            continue;
> -        }
> -        ret = kvm_virtio_pci_vq_vector_use(proxy, queue_no, vector);
> -        if (ret < 0) {
> -            goto undo;
> -        }
> -        /* If guest supports masking, set up irqfd now.
> -         * Otherwise, delay until unmasked in the frontend.
> -         */
> -        if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
> -            vq = virtio_get_queue(vdev, queue_no);
> -            n = virtio_queue_get_guest_notifier(vq);
> -            ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
> -            if (ret < 0) {
> -                kvm_virtio_pci_vq_vector_release(proxy, vector);
> -                goto undo;
> -            }
> +            return -1;
>           }
> +        *vector = virtio_queue_vector(vdev, queue_no);
> +        vq = virtio_get_queue(vdev, queue_no);
> +        *n = virtio_queue_get_guest_notifier(vq);
> +    }
> +    if (*vector >= msix_nr_vectors_allocated(dev)) {
> +        return -1;
>       }
>       return 0;
> +}
>   
> +static int kvm_virtio_pci_vector_use_one(VirtIOPCIProxy *proxy, int queue_no)
> +{


To ease the reviewer, let's separate this patch into two.

1) factoring out the core logic
2) decouple the vq

Thanks


> +    unsigned int vector;
> +    int ret;
> +    EventNotifier *n;
> +    ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +    ret = kvm_virtio_pci_vq_vector_use(proxy, vector);
> +    if (ret < 0) {
> +        goto undo;
> +    }
> +    ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
> +    if (ret < 0) {
> +        goto undo;
> +    }
> +    return 0;
>   undo:
> -    while (--queue_no >= 0) {
> -        vector = virtio_queue_vector(vdev, queue_no);
> -        if (vector >= msix_nr_vectors_allocated(dev)) {
> -            continue;
> -        }
> -        if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
> -            vq = virtio_get_queue(vdev, queue_no);
> -            n = virtio_queue_get_guest_notifier(vq);
> -            kvm_virtio_pci_irqfd_release(proxy, n, vector);
> -        }
> -        kvm_virtio_pci_vq_vector_release(proxy, vector);
> +    kvm_virtio_pci_irqfd_release(proxy, n, vector);
> +    return ret;
> +}
> +static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
> +{
> +    int queue_no;
> +    int ret = 0;
> +    for (queue_no = 0; queue_no < nvqs; queue_no++) {
> +        ret = kvm_virtio_pci_vector_use_one(proxy, queue_no);
>       }
>       return ret;
>   }
>   
> -static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
> +
> +static void kvm_virtio_pci_vector_release_one(VirtIOPCIProxy *proxy,
> +                        int queue_no)
>   {
> -    PCIDevice *dev = &proxy->pci_dev;
>       VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
>       unsigned int vector;
> -    int queue_no;
> -    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> -    VirtQueue *vq;
>       EventNotifier *n;
> +    int ret;
> +    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> +    ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
> +    if (ret < 0) {
> +        return;
> +    }
> +
> +    if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
> +        kvm_virtio_pci_irqfd_release(proxy, n, vector);
> +    }
> +    kvm_virtio_pci_vq_vector_release(proxy, vector);
> +}
> +static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
> +{
> +    int queue_no;
> +
>       for (queue_no = 0; queue_no < nvqs; queue_no++) {
> -        if (!virtio_queue_get_num(vdev, queue_no)) {
> -            break;
> -        }
> -        vector = virtio_queue_vector(vdev, queue_no);
> -        if (vector >= msix_nr_vectors_allocated(dev)) {
> -            continue;
> -        }
> -        /* If guest supports masking, clean up irqfd now.
> -         * Otherwise, it was cleaned when masked in the frontend.
> -         */
> -        if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
> -            vq = virtio_get_queue(vdev, queue_no);
> -            n = virtio_queue_get_guest_notifier(vq);
> -            kvm_virtio_pci_irqfd_release(proxy, n, vector);
> -        }
> -        kvm_virtio_pci_vq_vector_release(proxy, vector);
> +        kvm_virtio_pci_vector_release_one(proxy, queue_no);
>       }
>   }
>   


