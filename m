Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A824A76A7
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 18:19:10 +0100 (CET)
Received: from localhost ([::1]:35764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFJHf-0001BT-KD
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 12:19:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nFIU3-0001CI-L7; Wed, 02 Feb 2022 11:27:52 -0500
Received: from [2607:f8b0:4864:20::334] (port=37679
 helo=mail-ot1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nFIU0-0007PL-5n; Wed, 02 Feb 2022 11:27:49 -0500
Received: by mail-ot1-x334.google.com with SMTP id
 g15-20020a9d6b0f000000b005a062b0dc12so19952161otp.4; 
 Wed, 02 Feb 2022 08:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WtaAN+uxh3EYVxu0D+k1YLdPA8IEYtoCoSGbw7U7yz0=;
 b=gOnL+vTt5qMTE0i6LpmXd08zDpMUAKyBmpwU5tcGJfArT5IwhyhEityJHfNsQvFuEh
 JiP7Hi3XXI3Sa0qBa4d6/JFKKDUAnQhvJrI4wv3L/KTMkNNVu7NscRutNLvmT56QFguM
 cvEzM1CrcHJjsb5qTaxnpBM64WhsI2gAv8AJ31QUAHneuK8CZp4xlrKYytdTkYuEcMXx
 Qkpq/LdC1/BSfeCdd86whOXCjpjbQx8zftrmRObVyRwEpfrf+gnLwaTNJfHQ8CRg5Yru
 e1VN1edZFy/+3DKpJjmQVQNi3nXAftXcaXiPHlnrocjZtscSvCidu7rycQdk4BMT+hNP
 /MqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WtaAN+uxh3EYVxu0D+k1YLdPA8IEYtoCoSGbw7U7yz0=;
 b=NzhjYEn8y5Id1qTz36ya/ywQR98h5TzObw32ciPN7HcAddjd8hkU8snKUM6hda9cKR
 kxnA0AqcAAVNojRV2Grv2zG0OMF2T8hj9384avEtwPYwBhVZz5OhQ4G3tRgp3fBMojY+
 DPBK6zwM0jfcSuzzqJtX2E7QdyNmTsIu/zsY21+mTs88EGoQgRLrGX9fmI5a3SY4So/z
 hs+OfrCmALfs5YSL40/9giPatIDLNvEUywfxqg/j7ebZewxkMqzQoVMLu3IhUDhZ4E88
 pHWMBrGy1GS2RfXRAtlK2ozKM/psiOhQnzvw09tJgm9rOv12ZsRkEV7iT2I9zXkUCgS0
 +1qQ==
X-Gm-Message-State: AOAM531vvnDHDOBbfQ47hmO8iTgzEJheBRp+dDqEx0jcWb5KgYpSyy2L
 VOpB30ulNcrkXn6FaP4pBsE=
X-Google-Smtp-Source: ABdhPJzkaHalFF/8CJlu2wo9jqXbftAcvQqf8WTl6Mp8PIwHZ4gS3dusYClxeFgN0YFoZsgLFJauKA==
X-Received: by 2002:a05:6830:1da2:: with SMTP id
 z2mr17409715oti.364.1643819266535; 
 Wed, 02 Feb 2022 08:27:46 -0800 (PST)
Received: from [192.168.10.222] (189-68-153-170.dsl.telesp.net.br.
 [189.68.153.170])
 by smtp.gmail.com with ESMTPSA id l15sm7010556ots.28.2022.02.02.08.27.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 08:27:46 -0800 (PST)
Message-ID: <1bba9ca1-99c9-96d3-f226-b7b9e2ff6f55@gmail.com>
Date: Wed, 2 Feb 2022 13:27:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/1] virtio: fix the condition for iommu_platform not
 supported
Content-Language: en-US
To: Halil Pasic <pasic@linux.ibm.com>
References: <20220201133915.3764972-1-pasic@linux.ibm.com>
 <f12eeebf-6c9a-d40f-09de-10eb86dd3c26@linux.ibm.com>
 <20220201193309.7da86258.pasic@linux.ibm.com>
 <365305e3-4224-965d-2cb6-496a95802f0e@gmail.com>
 <20220202021547.20dc65c9.pasic@linux.ibm.com>
 <eccb1d4e-dea1-56b7-98d5-78867970a6d4@gmail.com>
 <20220202172353.65ad8325.pasic@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220202172353.65ad8325.pasic@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::334
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, Jakob Naucke <Jakob.Naucke@ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/2/22 13:23, Halil Pasic wrote:
> On Wed, 2 Feb 2022 10:24:51 -0300
> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> 
>> On 2/1/22 22:15, Halil Pasic wrote:
>>> On Tue, 1 Feb 2022 16:31:22 -0300
>>> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
>>>    
>>>> On 2/1/22 15:33, Halil Pasic wrote:
>>>>> On Tue, 1 Feb 2022 12:36:25 -0300
>>>>> Daniel Henrique Barboza <danielhb@linux.ibm.com> wrote:
>>>>>       
>>>>>>> +    vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
>>>>>>>          if (klass->get_dma_as != NULL && has_iommu) {
>>>>>>>              virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
>>>>>>>              vdev->dma_as = klass->get_dma_as(qbus->parent);
>>>>>>> +        if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
>>>>>>> +            error_setg(errp,
>>>>>>> +                       "iommu_platform=true is not supported by the device");
>>>>>>> +        }
>>>>>>
>>>>>>      
>>>>>>>          } else {
>>>>>>>              vdev->dma_as = &address_space_memory;
>>>>>>>          }
>>>>>>
>>>>>>
>>>>>> I struggled to understand what this 'else' clause was doing and I assumed that it was
>>>>>> wrong. Searching through the ML I learned that this 'else' clause is intended to handle
>>>>>> legacy virtio devices that doesn't support the DMA API (introduced in 8607f5c3072caeebb)
>>>>>> and thus shouldn't set  VIRTIO_F_IOMMU_PLATFORM.
>>>>>>
>>>>>>
>>>>>> My suggestion, if a v4 is required for any other reason, is to add a small comment in this
>>>>>> 'else' clause explaining that this is the legacy virtio devices condition and those devices
>>>>>> don't set F_IOMMU_PLATFORM. This would make the code easier to read for a virtio casual like
>>>>>> myself.
>>>>>
>>>>> I do not agree that this is about legacy virtio. In my understanding
>>>>> virtio-ccw simply does not need translation because CCW devices use
>>>>> guest physical addresses as per architecture. It may be considered
>>>>> legacy stuff form PCI perspective, but I don't think it is legacy
>>>>> in general.
>>>>
>>>>
>>>> I wasn't talking about virtio-ccw. I was talking about this piece of code:
>>>>
>>>>
>>>>        if (klass->get_dma_as != NULL && has_iommu) {
>>>>            virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
>>>>            vdev->dma_as = klass->get_dma_as(qbus->parent);
>>>>        } else {
>>>>            vdev->dma_as = &address_space_memory;
>>>>        }
>>>>
>>>>
>>>> I suggested something like this:
>>>>
>>>>
>>>>
>>>>        if (klass->get_dma_as != NULL && has_iommu) {
>>>>            virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
>>>>            vdev->dma_as = klass->get_dma_as(qbus->parent);
>>>>        } else {
>>>>            /*
>>>>             * We don't force VIRTIO_F_IOMMU_PLATFORM for legacy devices, i.e.
>>>>             * devices that don't implement klass->get_dma_as, regardless of
>>>>             * 'has_iommu' setting.
>>>>             */
>>>>            vdev->dma_as = &address_space_memory;
>>>>        }
>>>>
>>>>
>>>> At least from my reading of commits 8607f5c3072 and 2943b53f682 this seems to be
>>>> the case. I spent some time thinking that this IF/ELSE was wrong because I wasn't
>>>> aware of this history.
>>>
>>> With virtio-ccw we take the else branch because we don't implement
>>> ->get_dma_as(). I don't consider all the virtio-ccw to be legacy.
>>>
>>> IMHO there are two ways to think about this:
>>> a) The commit that introduced this needs a fix which implemets
>>> get_dma_as() for virtio-ccw in a way that it simply returns
>>> address_space_memory.
>>> b) The presence of ->get_dma_as() is not indicative of "legacy".
>>>
>>> BTW in virtospeak "legacy" has a special meaning: pre-1.0 virtio. Do you
>>> mean that legacy. And if I read the virtio-pci code correctly
>>> ->get_dma_as is set for legacy, transitional and modern devices alike.
>>
>>
>> Oh ok. I'm not well versed into virtiospeak. My "legacy" comment was a poor choice of
>> word for the situation.
>>
>> We can ignore the "legacy" bit. My idea/suggestion is to put a comment at that point
>> explaining the logic behind into not forcing VIRTIO_F_IOMMU_PLATFORM in devices that
>> doesn't implement ->get_dma_as().
>>
>> I am assuming that this is an intended design that was introduced by 2943b53f682
>> ("virtio: force VIRTIO_F_IOMMU_PLATFORM"), meaning that the implementation of the
>> ->get_dma_as is being used as a parameter to force the feature in the device. And with
>> this code:
>>
>>
>>       if (klass->get_dma_as != NULL && has_iommu) {
>>           virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
>>           vdev->dma_as = klass->get_dma_as(qbus->parent);
>>       } else {
>>           vdev->dma_as = &address_space_memory;
>>       }
>>
>> It is possible that we have 2 vdev devices where ->dma_as = &address_space_memory, but one
>> of them is sitting in a bus where "klass->get_dma_as(qbus->parent) = &address_space_memory",
>> and this device will have VIRTIO_F_IOMMU_PLATFORM forced onto it and the former won't.
>>
>>
>> If this is not an intended design I can only speculate how to fix it. Forcing VIRTIO_F_IOMMU_PLATFORM
>> in all devices, based only on has_iommu, can break stuff. Setting VIRTIO_F_IOMMU_PLATFORM only
>> if "vdev->dma_as != &address_space_memory" make some sense but I am fairly certain it will
>> break stuff the other way. Or perhaps the fix is something else entirely.
>>
>>
>>
>>
>>>
>>> IMHO the important thing to figure out is what impact that
>>> virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
>>> in the first branch (of the if-else) has. IMHO if one examines the
>>> commits 8607f5c307 ("virtio: convert to use DMA api") and 2943b53f68
>>> ("virtio: force VIRTIO_F_IOMMU_PLATFORM") very carefully, one will
>>> probably reach the conclusion that the objective of the latter, is
>>> to prevent the guest form not negotiating the IOMMU_PLATFORM feature
>>> (clearing it as part of the feature negotiation) and trying to use
>>> the device without that feature. In other words, virtio features are
>>> usually optional for the guest for the sake of compatibility, but
>>> IOMMU_PLATFORM is not: for very good reasons. Neither the commit message
>>> nor the patch does mention legacy anywhere.
>>>
>>> In my opinion not forcing the guest to negotiate IOMMU_PLATFORM when
>>> ->get_dma_as() is not set is at least unfortunate. Please observe, that
>>> virtio-pci is not affected by this omission because for virtio-pci
>>> devices ->get_dma_as != NULL always holds. And what is the deal for
>>> devices that don't implement get_dma_as() (and don't need address
>>> translation)? If iommu_platform=on is justified (no user error) then
>>> the device does not have access to the entire guest memory. Which
>>> means it more than likely needs cooperation form the guest (driver).
>>> So detecting that the guest does not support IOMMU_PLATFORM and failing
>>> gracefully via virtio_validate_features() instead of carrying on
>>> in good faith and failing in ugly ways when the host attempts to access
>>> guest memory to which it does not have access to. If we assume user
>>> error, that is the host can access at least all the memory it needs
>>> to access to make that device work, then it is probably still a
>>> good idea to fail the device and thus help the user correct his
>>> error.
>>
>> Yeah, this go back on what I've said about 2943b53f682 up there. There are assumptions
>> being made on the ->get_dma_as() existence that aren't clear.
>>
> 
> I agree. The commit message does not explain.
> 
>>
>>>
>>> IMHO the best course of action is
>>> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
>>> index 34f5a0a664..1d0eb16d1c 100644
>>> --- a/hw/virtio/virtio-bus.c
>>> +++ b/hw/virtio/virtio-bus.c
>>> @@ -80,7 +80,6 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>>>    
>>>        vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
>>>        if (klass->get_dma_as != NULL && has_iommu) {
>>> -        virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
>>>            vdev->dma_as = klass->get_dma_as(qbus->parent);
>>>            if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
>>>                error_setg(errp,
>>> @@ -89,6 +88,7 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>>>        } else {
>>>            vdev->dma_as = &address_space_memory;
>>>        }
>>> +    virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
>>>    }
>>
>>
>> I am fairly confident that forcing VIRTIO_F_IOMMU_PLATFORM all around, based on has_iommu
> 
> Yes I should have made that conditional on has_iommu. It was very late
> when I finished that email.
> 
>> alone, will have consequences all around. This code has been around for almost 5 years and a
>> lot of stuff has been developed on top of it.
>>
> 
> Do you have any particular examples in mind?
> 
>> All that said, if this is the proper way of fixing it I'd say to do it now, document it properly
>> and fix the breakages as they come along. The alternative - hacking around and around a codebase
>> that might not be solid - is worse in the long run.
> 
> IMHO this is a good discussion you triggered. But I see it out of scope
> for the bug I'm trying to fix.

Agree. I'll re-ack the patch given that I did it from another email that isn't
in QEMU devel. All this discussion is pertinent to a separated work.


Thanks,


Daniel


> 
> I can post a proper patch for "IOMMU_PLATFORM is non-negotiable for
> all guests" and we can have proper review and discussion on that. But
> I would like the bug I'm working on here fixed first. There are
> people that want to use virtiofs with confidential guests, and
> we should really make sure they can.
> 
> Regards,
> Halil

