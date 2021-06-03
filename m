Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E6B399A50
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 07:53:07 +0200 (CEST)
Received: from localhost ([::1]:54090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1logHx-0007dp-Tf
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 01:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1logGf-0006TO-PN
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 01:51:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1logGc-0000wj-Dk
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 01:51:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622699500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=scWH6bq/zEUGZzv1hDjTEeHcwLrcRRgUv2FLIw2C/xY=;
 b=P0cgcS9VclT356+phw8WQ6Jod4gO7AvuKMKxpPcqSSJrutesYEJK4Mr5+wvQrZIR4hV/Cm
 UM5MbLip2XIE+yH0TZ6P0H3h62OE8uP89KxmH1srRIyHrTEwcKp2AJ46bnK0TagHdcMqvs
 YD61OpSuOKImJbrhHLFNzgAqVV6Z9Hk=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-xtflgOXgN5ugYIUkTTCAew-1; Thu, 03 Jun 2021 01:51:39 -0400
X-MC-Unique: xtflgOXgN5ugYIUkTTCAew-1
Received: by mail-pl1-f198.google.com with SMTP id
 t10-20020a1709027fcab02900fd1eb0b2e8so2159063plb.22
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 22:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=scWH6bq/zEUGZzv1hDjTEeHcwLrcRRgUv2FLIw2C/xY=;
 b=ht9BGiNRohaWao5AcbivgZR16XuQSAZADrcq35dHRJhhCQeyx6rsO0fFJoA1ElsNlm
 zL0u+otPUayTJuwgAC+NqxuXEJFpFfGkccRJ+51T0/KGVKeWHUEELu4pSzZrdyFDgzO1
 Qh1umRc59Vk7p1i+I2VJPgU33U8L19SSJcpoGX+ANMa+MfEgw16pu3G7mu9JWdTKzX4T
 GTJxmsPP+EbdC1Qihk9m9xpoahKmxFFWnnOj7uZF/cHPbMzu/eeKdj3mGlU+3G+8+mQd
 Pt7qkyPXwXisihQVuvUBwmRKI8UEn3m9nZDlH/ZsummuL6jL3nZvgRQ8n4R4UiQpOmZw
 MoJQ==
X-Gm-Message-State: AOAM530PCvZhkasAGLMySAlVFPnvUtLZWuvM2gNY9E2WUmOxKFR1eAHI
 bZhmfv5nkegxgoB79jcAQSNwMyhSMM15STW/D+psxYlTdgj28/rhQJMeQcwanRXtBy9WmVa2L5O
 3Sz36+0xL1SDvcui3WwcUh34fDuvcToiY6gGp/q5FeyfwUX3ZoJmV1TUoi65A2ebrKcM=
X-Received: by 2002:aa7:80d3:0:b029:28e:f117:4961 with SMTP id
 a19-20020aa780d30000b029028ef1174961mr30877849pfn.37.1622699497805; 
 Wed, 02 Jun 2021 22:51:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPCmKyv4/Vzrxxwjti8l30MiZMv0sKrpgqoPKc7W32vsx+g7xciqaS5KeRGU3c+QwvwQZ5cw==
X-Received: by 2002:aa7:80d3:0:b029:28e:f117:4961 with SMTP id
 a19-20020aa780d30000b029028ef1174961mr30877826pfn.37.1622699497353; 
 Wed, 02 Jun 2021 22:51:37 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id x6sm1247154pfd.173.2021.06.02.22.51.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 22:51:36 -0700 (PDT)
Subject: Re: [PATCH v7 02/10] virtio-pci:decouple virtqueue from interrupt
 setting process
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210602034750.23377-1-lulu@redhat.com>
 <20210602034750.23377-3-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f64b31dc-eab2-0e5f-17f0-6e60c74084ad@redhat.com>
Date: Thu, 3 Jun 2021 13:51:30 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210602034750.23377-3-lulu@redhat.com>
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
> Decouple virtqueue from interrupt setting process to support config interrupt
> Now the code for interrupt/vector are coupling
> with the vq number, this patch will decouple the vritqueue
> numbers from these functions.
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>   hw/virtio/virtio-pci.c | 51 ++++++++++++++++++++++++------------------
>   1 file changed, 29 insertions(+), 22 deletions(-)
>
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index b321604d9b..c5c080ec94 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -693,23 +693,17 @@ static void kvm_virtio_pci_vq_vector_release(VirtIOPCIProxy *proxy,
>   }
>   
>   static int kvm_virtio_pci_irqfd_use(VirtIOPCIProxy *proxy,
> -                                 unsigned int queue_no,
> +                                 EventNotifier *n,
>                                    unsigned int vector)
>   {
>       VirtIOIRQFD *irqfd = &proxy->vector_irqfd[vector];
> -    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> -    VirtQueue *vq = virtio_get_queue(vdev, queue_no);
> -    EventNotifier *n = virtio_queue_get_guest_notifier(vq);
>       return kvm_irqchip_add_irqfd_notifier_gsi(kvm_state, n, NULL, irqfd->virq);
>   }
>   
>   static void kvm_virtio_pci_irqfd_release(VirtIOPCIProxy *proxy,
> -                                      unsigned int queue_no,
> +                                      EventNotifier *n ,
>                                         unsigned int vector)
>   {
> -    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> -    VirtQueue *vq = virtio_get_queue(vdev, queue_no);
> -    EventNotifier *n = virtio_queue_get_guest_notifier(vq);
>       VirtIOIRQFD *irqfd = &proxy->vector_irqfd[vector];
>       int ret;
>   
> @@ -724,7 +718,8 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
>       VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
>       unsigned int vector;
>       int ret, queue_no;
> -
> +    VirtQueue *vq;
> +    EventNotifier *n;


Let's leave a newline here.


>       for (queue_no = 0; queue_no < nvqs; queue_no++) {
>           if (!virtio_queue_get_num(vdev, queue_no)) {
>               break;
> @@ -741,7 +736,9 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
>            * Otherwise, delay until unmasked in the frontend.
>            */
>           if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
> -            ret = kvm_virtio_pci_irqfd_use(proxy, queue_no, vector);
> +            vq = virtio_get_queue(vdev, queue_no);
> +            n = virtio_queue_get_guest_notifier(vq);
> +            ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
>               if (ret < 0) {
>                   kvm_virtio_pci_vq_vector_release(proxy, vector);
>                   goto undo;
> @@ -757,7 +754,9 @@ undo:
>               continue;
>           }
>           if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
> -            kvm_virtio_pci_irqfd_release(proxy, queue_no, vector);
> +            vq = virtio_get_queue(vdev, queue_no);
> +            n = virtio_queue_get_guest_notifier(vq);
> +            kvm_virtio_pci_irqfd_release(proxy, n, vector);
>           }
>           kvm_virtio_pci_vq_vector_release(proxy, vector);
>       }
> @@ -771,7 +770,8 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
>       unsigned int vector;
>       int queue_no;
>       VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> -
> +    VirtQueue *vq;
> +    EventNotifier *n;


Similar here.


>       for (queue_no = 0; queue_no < nvqs; queue_no++) {
>           if (!virtio_queue_get_num(vdev, queue_no)) {
>               break;
> @@ -784,7 +784,9 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
>            * Otherwise, it was cleaned when masked in the frontend.
>            */
>           if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
> -            kvm_virtio_pci_irqfd_release(proxy, queue_no, vector);
> +            vq = virtio_get_queue(vdev, queue_no);
> +            n = virtio_queue_get_guest_notifier(vq);
> +            kvm_virtio_pci_irqfd_release(proxy, n, vector);
>           }
>           kvm_virtio_pci_vq_vector_release(proxy, vector);
>       }
> @@ -793,12 +795,11 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
>   static int virtio_pci_vq_vector_unmask(VirtIOPCIProxy *proxy,
>                                          unsigned int queue_no,
>                                          unsigned int vector,
> -                                       MSIMessage msg)
> +                                       MSIMessage msg,
> +                                       EventNotifier *n)
>   {


A question: if this function needs to be used by configure interrupt, it 
needs rename. Otherwise we don't need to bother since it only deal with 
vq vector.


>       VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
>       VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> -    VirtQueue *vq = virtio_get_queue(vdev, queue_no);
> -    EventNotifier *n = virtio_queue_get_guest_notifier(vq);
>       VirtIOIRQFD *irqfd;
>       int ret = 0;
>   
> @@ -825,14 +826,15 @@ static int virtio_pci_vq_vector_unmask(VirtIOPCIProxy *proxy,
>               event_notifier_set(n);
>           }
>       } else {
> -        ret = kvm_virtio_pci_irqfd_use(proxy, queue_no, vector);
> +        ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
>       }
>       return ret;
>   }
>   
>   static void virtio_pci_vq_vector_mask(VirtIOPCIProxy *proxy,
>                                                unsigned int queue_no,
> -                                             unsigned int vector)
> +                                             unsigned int vector,
> +                                             EventNotifier *n)
>   {
>       VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
>       VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> @@ -843,7 +845,7 @@ static void virtio_pci_vq_vector_mask(VirtIOPCIProxy *proxy,
>       if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
>           k->guest_notifier_mask(vdev, queue_no, true);
>       } else {
> -        kvm_virtio_pci_irqfd_release(proxy, queue_no, vector);
> +        kvm_virtio_pci_irqfd_release(proxy, n, vector);
>       }
>   }
>   
> @@ -853,6 +855,7 @@ static int virtio_pci_vector_unmask(PCIDevice *dev, unsigned vector,
>       VirtIOPCIProxy *proxy = container_of(dev, VirtIOPCIProxy, pci_dev);
>       VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
>       VirtQueue *vq = virtio_vector_first_queue(vdev, vector);
> +    EventNotifier *n;
>       int ret, index, unmasked = 0;
>   
>       while (vq) {
> @@ -861,7 +864,8 @@ static int virtio_pci_vector_unmask(PCIDevice *dev, unsigned vector,
>               break;
>           }
>           if (index < proxy->nvqs_with_notifiers) {
> -            ret = virtio_pci_vq_vector_unmask(proxy, index, vector, msg);
> +            n = virtio_queue_get_guest_notifier(vq);
> +            ret = virtio_pci_vq_vector_unmask(proxy, index, vector, msg, n);
>               if (ret < 0) {
>                   goto undo;
>               }
> @@ -877,7 +881,8 @@ undo:
>       while (vq && unmasked >= 0) {
>           index = virtio_get_queue_index(vq);
>           if (index < proxy->nvqs_with_notifiers) {
> -            virtio_pci_vq_vector_mask(proxy, index, vector);
> +            n = virtio_queue_get_guest_notifier(vq);
> +            virtio_pci_vq_vector_mask(proxy, index, vector, n);
>               --unmasked;
>           }
>           vq = virtio_vector_next_queue(vq);
> @@ -890,15 +895,17 @@ static void virtio_pci_vector_mask(PCIDevice *dev, unsigned vector)
>       VirtIOPCIProxy *proxy = container_of(dev, VirtIOPCIProxy, pci_dev);
>       VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
>       VirtQueue *vq = virtio_vector_first_queue(vdev, vector);
> +    EventNotifier *n;
>       int index;
>   
>       while (vq) {
>           index = virtio_get_queue_index(vq);
> +         n = virtio_queue_get_guest_notifier(vq);


Indentation looks wrong.

Thanks


>           if (!virtio_queue_get_num(vdev, index)) {
>               break;
>           }
>           if (index < proxy->nvqs_with_notifiers) {
> -            virtio_pci_vq_vector_mask(proxy, index, vector);
> +            virtio_pci_vq_vector_mask(proxy, index, vector, n);
>           }
>           vq = virtio_vector_next_queue(vq);
>       }


