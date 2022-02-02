Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A021C4A7270
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 14:58:56 +0100 (CET)
Received: from localhost ([::1]:56304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFG9v-00076F-6X
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 08:58:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nFFd7-0007mB-0N; Wed, 02 Feb 2022 08:25:01 -0500
Received: from [2607:f8b0:4864:20::22e] (port=43523
 helo=mail-oi1-x22e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nFFd4-0006eY-G3; Wed, 02 Feb 2022 08:25:00 -0500
Received: by mail-oi1-x22e.google.com with SMTP id t199so22994407oie.10;
 Wed, 02 Feb 2022 05:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1i7Ufrwr0+TOQh1Ujs9eI+S278vrrI+USAIi6m3KTNc=;
 b=JyJOljBVukMAEb9SJxqzD2tsA6EvRPrJNVP5dKOeRZDfHKgsojzBhPNBSwX67hQeiE
 Om68OsKB5NOzq1RTrxfKEXpPAdGnDipDbKMslZBD32Bv7nAPzgqApJIRXiGKM2tFFqS1
 tELop5+cypushaai7iZ/61XZ/7qRgIdo1h8ZodYKZ7mtL8pq8VCvebpoMbkYgw7vcaeS
 gPed1hzZXaSM8JVAO1oL8PWVH8kSkPCgzOP1rjpxgh82qNf84tVGxfhpafc8QEW9AkYe
 HD+aVLgHdK0s5UjyOL6mqD6pnae2E4JOiA1ePBnwRPwuEnZ+qgKdfswtWI9F0wKtvNi6
 ReTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1i7Ufrwr0+TOQh1Ujs9eI+S278vrrI+USAIi6m3KTNc=;
 b=xolBlrAJvhwCBeKZNi0VixC62nVLmsJAIISl0+DDnLO48WWyDmKBb3K0V7ze+LZH+z
 WME2FHqALuIkQutUJsXert+L6N0oAyUvlmc3XlghAB83N9HrXHTgVSe+WZSWLTyhtJat
 bq1z+yFgdSHgxD0xpQNRsZGf0lr+SSpazjDJ9Jg77n4dk/8TzD1HC1iBEO1KDqw0L9pP
 /eBijnK0LPhETj8YX/d26Jvn1Qd/agmZU/23/TXXsdL5nMrg9VyisVo4jHm1O3Uhs5Nd
 rsr3f1cezQENHkh/ARTFPXoKhSWt7JdS6PepAyjyrhRcdkMqCwfEhvF/Bg6h8bLRnuOv
 BU0Q==
X-Gm-Message-State: AOAM533PXVytxP+ZkLO3E/wjQmuG3cE52Sa/AqMSw27jYBgOsR+Glo6e
 JspBbh2JWzYbI0+o1EfFg2s=
X-Google-Smtp-Source: ABdhPJwwMBmAsjNo9vBqYK16fN4aXBMEqv3q98eLCdwxRZ6qHs1/zKGZvTv0UHl7+O2heh8DGSi9jQ==
X-Received: by 2002:a54:4011:: with SMTP id x17mr4335195oie.255.1643808296798; 
 Wed, 02 Feb 2022 05:24:56 -0800 (PST)
Received: from [192.168.10.222] (189-68-153-170.dsl.telesp.net.br.
 [189.68.153.170])
 by smtp.gmail.com with ESMTPSA id w20sm8457787ooe.3.2022.02.02.05.24.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 05:24:56 -0800 (PST)
Message-ID: <eccb1d4e-dea1-56b7-98d5-78867970a6d4@gmail.com>
Date: Wed, 2 Feb 2022 10:24:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/1] virtio: fix the condition for iommu_platform not
 supported
Content-Language: en-US
To: Halil Pasic <pasic@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Jason Wang <jasowang@redhat.com>
References: <20220201133915.3764972-1-pasic@linux.ibm.com>
 <f12eeebf-6c9a-d40f-09de-10eb86dd3c26@linux.ibm.com>
 <20220201193309.7da86258.pasic@linux.ibm.com>
 <365305e3-4224-965d-2cb6-496a95802f0e@gmail.com>
 <20220202021547.20dc65c9.pasic@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220202021547.20dc65c9.pasic@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22e.google.com
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
 Daniel Henrique Barboza <danielhb@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, Jakob Naucke <Jakob.Naucke@ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/1/22 22:15, Halil Pasic wrote:
> On Tue, 1 Feb 2022 16:31:22 -0300
> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> 
>> On 2/1/22 15:33, Halil Pasic wrote:
>>> On Tue, 1 Feb 2022 12:36:25 -0300
>>> Daniel Henrique Barboza <danielhb@linux.ibm.com> wrote:
>>>    
>>>>> +    vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
>>>>>         if (klass->get_dma_as != NULL && has_iommu) {
>>>>>             virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
>>>>>             vdev->dma_as = klass->get_dma_as(qbus->parent);
>>>>> +        if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
>>>>> +            error_setg(errp,
>>>>> +                       "iommu_platform=true is not supported by the device");
>>>>> +        }
>>>>
>>>>   
>>>>>         } else {
>>>>>             vdev->dma_as = &address_space_memory;
>>>>>         }
>>>>
>>>>
>>>> I struggled to understand what this 'else' clause was doing and I assumed that it was
>>>> wrong. Searching through the ML I learned that this 'else' clause is intended to handle
>>>> legacy virtio devices that doesn't support the DMA API (introduced in 8607f5c3072caeebb)
>>>> and thus shouldn't set  VIRTIO_F_IOMMU_PLATFORM.
>>>>
>>>>
>>>> My suggestion, if a v4 is required for any other reason, is to add a small comment in this
>>>> 'else' clause explaining that this is the legacy virtio devices condition and those devices
>>>> don't set F_IOMMU_PLATFORM. This would make the code easier to read for a virtio casual like
>>>> myself.
>>>
>>> I do not agree that this is about legacy virtio. In my understanding
>>> virtio-ccw simply does not need translation because CCW devices use
>>> guest physical addresses as per architecture. It may be considered
>>> legacy stuff form PCI perspective, but I don't think it is legacy
>>> in general.
>>
>>
>> I wasn't talking about virtio-ccw. I was talking about this piece of code:
>>
>>
>>       if (klass->get_dma_as != NULL && has_iommu) {
>>           virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
>>           vdev->dma_as = klass->get_dma_as(qbus->parent);
>>       } else {
>>           vdev->dma_as = &address_space_memory;
>>       }
>>
>>
>> I suggested something like this:
>>
>>
>>
>>       if (klass->get_dma_as != NULL && has_iommu) {
>>           virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
>>           vdev->dma_as = klass->get_dma_as(qbus->parent);
>>       } else {
>>           /*
>>            * We don't force VIRTIO_F_IOMMU_PLATFORM for legacy devices, i.e.
>>            * devices that don't implement klass->get_dma_as, regardless of
>>            * 'has_iommu' setting.
>>            */
>>           vdev->dma_as = &address_space_memory;
>>       }
>>
>>
>> At least from my reading of commits 8607f5c3072 and 2943b53f682 this seems to be
>> the case. I spent some time thinking that this IF/ELSE was wrong because I wasn't
>> aware of this history.
> 
> With virtio-ccw we take the else branch because we don't implement
> ->get_dma_as(). I don't consider all the virtio-ccw to be legacy.
> 
> IMHO there are two ways to think about this:
> a) The commit that introduced this needs a fix which implemets
> get_dma_as() for virtio-ccw in a way that it simply returns
> address_space_memory.
> b) The presence of ->get_dma_as() is not indicative of "legacy".
> 
> BTW in virtospeak "legacy" has a special meaning: pre-1.0 virtio. Do you
> mean that legacy. And if I read the virtio-pci code correctly
> ->get_dma_as is set for legacy, transitional and modern devices alike.


Oh ok. I'm not well versed into virtiospeak. My "legacy" comment was a poor choice of
word for the situation.

We can ignore the "legacy" bit. My idea/suggestion is to put a comment at that point
explaining the logic behind into not forcing VIRTIO_F_IOMMU_PLATFORM in devices that
doesn't implement ->get_dma_as().

I am assuming that this is an intended design that was introduced by 2943b53f682
("virtio: force VIRTIO_F_IOMMU_PLATFORM"), meaning that the implementation of the
->get_dma_as is being used as a parameter to force the feature in the device. And with
this code:


     if (klass->get_dma_as != NULL && has_iommu) {
         virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
         vdev->dma_as = klass->get_dma_as(qbus->parent);
     } else {
         vdev->dma_as = &address_space_memory;
     }

It is possible that we have 2 vdev devices where ->dma_as = &address_space_memory, but one
of them is sitting in a bus where "klass->get_dma_as(qbus->parent) = &address_space_memory",
and this device will have VIRTIO_F_IOMMU_PLATFORM forced onto it and the former won't.


If this is not an intended design I can only speculate how to fix it. Forcing VIRTIO_F_IOMMU_PLATFORM
in all devices, based only on has_iommu, can break stuff. Setting VIRTIO_F_IOMMU_PLATFORM only
if "vdev->dma_as != &address_space_memory" make some sense but I am fairly certain it will
break stuff the other way. Or perhaps the fix is something else entirely.




> 
> IMHO the important thing to figure out is what impact that
> virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
> in the first branch (of the if-else) has. IMHO if one examines the
> commits 8607f5c307 ("virtio: convert to use DMA api") and 2943b53f68
> ("virtio: force VIRTIO_F_IOMMU_PLATFORM") very carefully, one will
> probably reach the conclusion that the objective of the latter, is
> to prevent the guest form not negotiating the IOMMU_PLATFORM feature
> (clearing it as part of the feature negotiation) and trying to use
> the device without that feature. In other words, virtio features are
> usually optional for the guest for the sake of compatibility, but
> IOMMU_PLATFORM is not: for very good reasons. Neither the commit message
> nor the patch does mention legacy anywhere.
> 
> In my opinion not forcing the guest to negotiate IOMMU_PLATFORM when
> ->get_dma_as() is not set is at least unfortunate. Please observe, that
> virtio-pci is not affected by this omission because for virtio-pci
> devices ->get_dma_as != NULL always holds. And what is the deal for
> devices that don't implement get_dma_as() (and don't need address
> translation)? If iommu_platform=on is justified (no user error) then
> the device does not have access to the entire guest memory. Which
> means it more than likely needs cooperation form the guest (driver).
> So detecting that the guest does not support IOMMU_PLATFORM and failing
> gracefully via virtio_validate_features() instead of carrying on
> in good faith and failing in ugly ways when the host attempts to access
> guest memory to which it does not have access to. If we assume user
> error, that is the host can access at least all the memory it needs
> to access to make that device work, then it is probably still a
> good idea to fail the device and thus help the user correct his
> error.

Yeah, this go back on what I've said about 2943b53f682 up there. There are assumptions
being made on the ->get_dma_as() existence that aren't clear.


> 
> IMHO the best course of action is
> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> index 34f5a0a664..1d0eb16d1c 100644
> --- a/hw/virtio/virtio-bus.c
> +++ b/hw/virtio/virtio-bus.c
> @@ -80,7 +80,6 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>   
>       vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
>       if (klass->get_dma_as != NULL && has_iommu) {
> -        virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
>           vdev->dma_as = klass->get_dma_as(qbus->parent);
>           if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
>               error_setg(errp,
> @@ -89,6 +88,7 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>       } else {
>           vdev->dma_as = &address_space_memory;
>       }
> +    virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
>   }


I am fairly confident that forcing VIRTIO_F_IOMMU_PLATFORM all around, based on has_iommu
alone, will have consequences all around. This code has been around for almost 5 years and a
lot of stuff has been developed on top of it.

All that said, if this is the proper way of fixing it I'd say to do it now, document it properly
and fix the breakages as they come along. The alternative - hacking around and around a codebase
that might not be solid - is worse in the long run.


Thanks,


Daniel

> 
> which would be a separate patch, as this is a separate issue. Jason,
> Michael, Connie, what do you think?
> 
> Regards,
> Halil

