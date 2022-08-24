Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8218B59F5EE
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 11:10:03 +0200 (CEST)
Received: from localhost ([::1]:59410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQmOg-0002zw-Jc
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 05:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQmBv-0006ed-Pp
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 04:56:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQmBr-0003Gj-JV
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 04:56:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661331406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GX2ghjYx//Mu5qloOQ3rGjoOsBaRBdGDt/MKdo1lDO4=;
 b=TFtCpiRnEVesi9BKxDWNqA6D4ZlMK2UkHPoUgSoljd9oxwrdR9PpFn86L7hDz3OSimtkFz
 CauKCfpzNRCfxVYhFPsPayROw//vk/LpGDWTnuI1QuU3rMK3T3ORo/YwRJPg6y2uystBW9
 sD06Abx1irNhEVMsgcI6gg5xvyAWCo8=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-473-7D9yBIMSMgOzVIFUq2rIHg-1; Wed, 24 Aug 2022 04:56:45 -0400
X-MC-Unique: 7D9yBIMSMgOzVIFUq2rIHg-1
Received: by mail-pl1-f197.google.com with SMTP id
 l3-20020a170902f68300b00172e52e5297so5632011plg.2
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 01:56:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=GX2ghjYx//Mu5qloOQ3rGjoOsBaRBdGDt/MKdo1lDO4=;
 b=cN1uaGtiWNnuTYQju3szymzTLyPr4sqlRwPznnCcYpZspcSa2u4LKFr8NXjup06yp4
 tqGbdt4bvMwvyD5b8UJnQV64OKbLPrrsbNs1XlyenBPO5jFXXvyibPbt7Odwl/dD3+qL
 VdM9VG0HeNix7GnQmvz6fj6GEVbfp3D3OIl67SE2iTw9vAWJU4sptvcDfQb2aZMFKNVy
 cX6s4E0JRfBbi+aMzQ4wyoj1jmjXg3n0Jc0lyWQ3X3VXB79mEY4N3YoS25xtWwYE6sEk
 G8j7OcZYIGZArVGy7dgLjdfz3Vo7jSoeqMTAvX13W/PUBCRnbYPuJjkKszMBPdfk/0mE
 +tOQ==
X-Gm-Message-State: ACgBeo2ux6kgmzQyMMHa++coZs46sL6habRlOvY9qvBbAAY/hcJ5h1Bi
 cxeE9q22lQZ/p3omaQJ5C2es42zn5/TNEYWwZVK1UvlslVr8fOcBynBtZ0sLEA0nsvHRPJiNben
 mX45Zz6Bbq/lHF8c=
X-Received: by 2002:a17:90b:17c2:b0:1fb:7a6f:7977 with SMTP id
 me2-20020a17090b17c200b001fb7a6f7977mr3478623pjb.53.1661331404072; 
 Wed, 24 Aug 2022 01:56:44 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6XYsOr8saOiCjxJKtM//6sLRzfflrqnFsMsjmFkAB6ViClaBF7214ofHC50OJrZKf9eAM1ig==
X-Received: by 2002:a17:90b:17c2:b0:1fb:7a6f:7977 with SMTP id
 me2-20020a17090b17c200b001fb7a6f7977mr3478602pjb.53.1661331403798; 
 Wed, 24 Aug 2022 01:56:43 -0700 (PDT)
Received: from [10.72.13.130] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a170903110e00b0016d6963cb12sm11990979plh.304.2022.08.24.01.56.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 01:56:42 -0700 (PDT)
Message-ID: <e3a55cf5-9569-8bd5-4915-1a901e2f3464@redhat.com>
Date: Wed, 24 Aug 2022 16:56:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 06/24] virtio-pci: support queue reset
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, f4bug@amsat.org,
 wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <d3bbe50c546b55971e87ff4cbc61e049c6800db8.1660611460.git.kangjie.xu@linux.alibaba.com>
 <4553ca4a-6df9-dac4-307e-ccc405744bb9@redhat.com>
 <a63b8cf1-1477-abde-e9a8-168d58426b5c@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <a63b8cf1-1477-abde-e9a8-168d58426b5c@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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


在 2022/8/23 15:52, Kangjie Xu 写道:
>
> 在 2022/8/23 15:40, Jason Wang 写道:
>>
>> 在 2022/8/16 09:06, Kangjie Xu 写道:
>>> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>>>
>>> PCI devices support vq reset.
>>>
>>> Based on this function, the driver can adjust the size of the ring, and
>>> quickly recycle the buffer in the ring.
>>>
>>> The migration of the virtio devices will not happen during a reset
>>> operation. This is becuase the global iothread lock is held. Migration
>>> thread also needs the lock. As a result, we do not need to migrate the
>>> reset state of VirtIOPCIQueue.
>>>
>>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>>> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>>> ---
>>>   hw/virtio/virtio-pci.c         | 19 +++++++++++++++++++
>>>   include/hw/virtio/virtio-pci.h |  1 +
>>>   2 files changed, 20 insertions(+)
>>>
>>> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
>>> index 45327f0b31..ec8e92052f 100644
>>> --- a/hw/virtio/virtio-pci.c
>>> +++ b/hw/virtio/virtio-pci.c
>>> @@ -1246,6 +1246,9 @@ static uint64_t virtio_pci_common_read(void 
>>> *opaque, hwaddr addr,
>>>       case VIRTIO_PCI_COMMON_Q_USEDHI:
>>>           val = proxy->vqs[vdev->queue_sel].used[1];
>>>           break;
>>> +    case VIRTIO_PCI_COMMON_Q_RESET:
>>> +        val = proxy->vqs[vdev->queue_sel].reset;
>>> +        break;
>>>       default:
>>>           val = 0;
>>>       }
>>> @@ -1333,6 +1336,7 @@ static void virtio_pci_common_write(void 
>>> *opaque, hwaddr addr,
>>> ((uint64_t)proxy->vqs[vdev->queue_sel].used[1]) << 32 |
>>> proxy->vqs[vdev->queue_sel].used[0]);
>>>               proxy->vqs[vdev->queue_sel].enabled = 1;
>>> +            proxy->vqs[vdev->queue_sel].reset = 0;
>>>           } else {
>>>               virtio_error(vdev, "wrong value for queue_enable 
>>> %"PRIx64, val);
>>>           }
>>> @@ -1355,6 +1359,20 @@ static void virtio_pci_common_write(void 
>>> *opaque, hwaddr addr,
>>>       case VIRTIO_PCI_COMMON_Q_USEDHI:
>>>           proxy->vqs[vdev->queue_sel].used[1] = val;
>>>           break;
>>> +    case VIRTIO_PCI_COMMON_Q_RESET:
>>> +        if (val == 1) {
>>> +            /*
>>> +             * With the global iothread lock taken, the migration 
>>> will not
>>> +             * happen until the virtqueue reset is done.
>>> +             */
>>
>>
>> This comment applies to all other common cfg operation as well, So it 
>> looks not necessary?
>>
> Get it.
>
>>
>>> + proxy->vqs[vdev->queue_sel].reset = 1;
>>> +
>>> +            virtio_queue_reset(vdev, vdev->queue_sel);
>>> +
>>> +            proxy->vqs[vdev->queue_sel].reset = 0;
>>> +            proxy->vqs[vdev->queue_sel].enabled = 0;
>>> +        }
>>> +        break;
>>>       default:
>>>           break;
>>>       }
>>> @@ -1950,6 +1968,7 @@ static void virtio_pci_reset(DeviceState *qdev)
>>>         for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
>>>           proxy->vqs[i].enabled = 0;
>>> +        proxy->vqs[i].reset = 0;
>>>           proxy->vqs[i].num = 0;
>>>           proxy->vqs[i].desc[0] = proxy->vqs[i].desc[1] = 0;
>>>           proxy->vqs[i].avail[0] = proxy->vqs[i].avail[1] = 0;
>>> diff --git a/include/hw/virtio/virtio-pci.h 
>>> b/include/hw/virtio/virtio-pci.h
>>> index 2446dcd9ae..e9290e2b94 100644
>>> --- a/include/hw/virtio/virtio-pci.h
>>> +++ b/include/hw/virtio/virtio-pci.h
>>> @@ -117,6 +117,7 @@ typedef struct VirtIOPCIRegion {
>>>   typedef struct VirtIOPCIQueue {
>>>     uint16_t num;
>>>     bool enabled;
>>> +  bool reset;
>>
>>
>> Do we need to migrate this?
>>
>> Thanks
>>
> I think we do not need to migrate this because we hold the global 
> iothread lock when virtqueue reset is triggered. The migration of 
> these device states also needs this lock.
>
> On the other hand, the 'reset' state of virtqueue is same(is 0) before 
> and after the process of resetting a virtqueue.
>
> Thus, the migration will not happen when we are resetting a virtqueue 
> and we do not to migrate it.


Ok, let's add a comment above reset to explain this.

Thanks


>
> Thanks
>
>>
>>>     uint32_t desc[2];
>>>     uint32_t avail[2];
>>>     uint32_t used[2];
>


