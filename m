Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E3C4AC194
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 15:47:32 +0100 (CET)
Received: from localhost ([::1]:51432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH5Ih-0003yF-6I
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 09:47:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nH4ab-0007OH-Bb
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 09:01:58 -0500
Received: from [2607:f8b0:4864:20::235] (port=44805
 helo=mail-oi1-x235.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nH4aU-0001bm-Sz
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 09:01:56 -0500
Received: by mail-oi1-x235.google.com with SMTP id 4so16972061oil.11
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 06:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=x7iKFxwuVbhRwc3HSEVEMmNBc7UtQfus31104s8i36I=;
 b=nfV8dtajR6w5N9pQ9Z4chIjTWS7+708u7YjbDbUdozczPiP3OXA98V0glz2SgJo1mF
 JtvlQeBLA1vv2YhXcZ18U53KHBhxddholyViuIscG0artFbrrU8PpgG16f2+DvegjYvA
 rsZ84AqsiesVDfDN03xpu5QoGqhDhBTSdllBvP5Brqvc4aGsbcsFvpyjFqk3LE5eBdlY
 Rl5FTjZ8YVDGDzGOhd4fqkZX5YR4pso34DdzKYAQWeS2qk8Ue4jqDUbw3A4ZjR4HPFnA
 wn+dSi6PLkQ4YF1SXuoROHBVirsr/jLUsw+MjGdmRuFzMXGnXm7x/orRYbrITzniCj7L
 zRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x7iKFxwuVbhRwc3HSEVEMmNBc7UtQfus31104s8i36I=;
 b=KIROg1D2cX6d57MqaSJkt2F5EAWaQ2oQt28CQ8I57fbetMO70c08MQjuJwAQrNcJec
 Km/pvkqJLiWD8KR7hdEiuDkOJpLPvPoo7eqr/ebZWa3Ctb6ChxsXs7ncWtWzgy8xxX7A
 dj4l2XWKo+8wh8ZjT9nLTWlEk6B90p5DdEUP6ovYqLp/M0RJHRHqwDxb8N17HDDW8TcT
 FWhVeEEGCX3F2qTyPAtM/opNj61SRgKGku6RQkv27vcUYjpPLY3Evzo4Or0es7DocGl/
 p1rwP065R2aDN/Swh2YWa1lRIwx7EMKGIJWPNYJNOnXxcYWF32pTWgTB2TWVNc+vljD1
 Y9nA==
X-Gm-Message-State: AOAM530Qs/hQSDzXvo6rW3/GsC+IeVON6J4oW7csovi27mS8XrGqnMH9
 sz19AEIYfBf/bcIQtiQZgck=
X-Google-Smtp-Source: ABdhPJxuKUryqXklzCnRsscN9DEMKcHOOKr4L9o2VpcUK86DgiYUXaFURg6Id/qYwEA84zwmGeK8dw==
X-Received: by 2002:a05:6808:e82:: with SMTP id
 k2mr5400867oil.10.1644242509431; 
 Mon, 07 Feb 2022 06:01:49 -0800 (PST)
Received: from [192.168.10.222] ([191.193.0.12])
 by smtp.gmail.com with ESMTPSA id t22sm4311738oiw.2.2022.02.07.06.01.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 06:01:49 -0800 (PST)
Message-ID: <d213277a-0a5d-c046-0617-c29926022244@gmail.com>
Date: Mon, 7 Feb 2022 11:01:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 1/1] virtio: fix feature negotiation for
 ACCESS_PLATFORM
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20220203164556.2666565-1-pasic@linux.ibm.com>
 <7df172fe-008a-0b98-2780-5155c98a71ba@gmail.com> <874k5ax07t.fsf@redhat.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <874k5ax07t.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::235
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x235.google.com
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
Cc: Jason Wang <jasowang@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/7/22 10:41, Cornelia Huck wrote:
> On Mon, Feb 07 2022, Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> 
>> On 2/3/22 13:45, Halil Pasic wrote:
>>> Unlike most virtio features ACCESS_PATFORM is considered mandatory, i.e.
> 
> s/ACCESS_PATFORM/ACCESS_PLATFORM/
> 
>>> the driver must accept it if offered by the device. The virtio
>>> specification says that the driver SHOULD accept the ACCESS_PLATFORM
>>> feature if offered, and that the device MAY fail to operate if
>>> ACCESS_PLATFORM was offered but not negotiated.
>>>
>>> While a SHOULD ain't exactly a MUST, we are certainly allowed to fail
>>> the device when the driver fences ACCESS_PLATFORM. With commit
>>
>>
>> I believe a link to the virtio specification where this is being mentioned would
>> be good to have in the commit message.
> 
> It's in section 6.1 "Driver Requirements: Reserved Feature Bits": "A
> driver SHOULD accept VIRTIO_F_ACCESS_PLATFORM if it is offered" and
> section 6.2 "Device Requirements: Reserved Feature Bits": "A device MAY
> fail to operate further if VIRTIO_F_ACCESS_PLATFORM is not accepted."

If we provide this info in the commit message we can skip adding a doc link.

> 
> That said, I'm not sure the wording in the spec translates to
> "mandatory"... if the driver fails to accept the bit, the device can
> choose to not work with the driver, but it's not forced to. There are
> other instances where the device may reject FEATURES_OK (e.g. when the
> driver does not accept a feature that is a pre-req for another feature),
> I'd say it is up to the device whether something is mandatory or not. If
> the device/setup cannot work without it, it certainly is mandatory, but
> the driver only knows when FEATURES_OK is rejected without the feature.
> 
> OTOH, the decision to make it mandatory is certainly sound, and covered
> by the spec. As the driver must be prepared for the device failing to
> accept FEATURES_OK, we can make it mandatory here -- we should just not
> say that it is considered mandatory from a spec standpoint. The spec
> allows to make it mandatory, and we make it mandatory in our
> implementation.

Fair point.

> 
>>
>>
>>> 2943b53f68 ("virtio: force VIRTIO_F_IOMMU_PLATFORM") we already made the
>>> decision to do so whenever the get_dma_as() callback is implemented (by
>>> the bus), which in practice means for the entirety of virtio-pci.
>>>
>>> That means, if the device needs to translate I/O addresses, then
>>> ACCESS_PLATFORM is mandatory. The aforementioned commit tells us
>>> in the commit message that this is for security reasons.
>>>
>>> If ACCESS_PLATFORM is offered not we want the device to utilize an
>>
>> I think you meant "If ACCESS_PLATFORM is offered".
> 
> I thought it should be "If ACCESS_PLATFORM is offered not because..." ?
> 
>>
>>
>>> IOMMU and do address translation, but because the device does not have
>>> access to the entire guest RAM, and needs the driver to grant access
>>> to the bits it needs access to (e.g. confidential guest support), we
>>> still require the guest to have the corresponding logic and to accept
>>> ACCESS_PLATFORM. If the driver does not accept ACCESS_PLATFORM, then
>>> things are bound to go wrong, and we may see failures much less graceful
>>> than failing the device because the driver didn't negotiate
>>> ACCESS_PLATFORM.
>>>
>>> So let us make ACCESS_PLATFORM mandatory for the driver regardless
>>> of whether the get_dma_as() callback is implemented or not.
>>>
>>> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
>>> Fixes: 2943b53f68 ("virtio: force VIRTIO_F_IOMMU_PLATFORM")
>>>
>>> ---
>>> This patch is based on:
>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg866199.html
>>>
>>> During the review of "virtio: fix the condition for iommu_platform not
>>> supported" Daniel raised the question why do we "force IOMMU_PLATFORM"
>>> iff has_iommu && !!klass->get_dma_as. My answer to that was, that
>>> this logic ain't right.
>>>
>>> While at it I used the opportunity to re-organize the code a little
>>> and provide an explanatory comment.
>>> ---
>>>    hw/virtio/virtio-bus.c | 17 ++++++++++-------
>>>    1 file changed, 10 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
>>> index fbf0dd14b8..359430eb1c 100644
>>> --- a/hw/virtio/virtio-bus.c
>>> +++ b/hw/virtio/virtio-bus.c
>>> @@ -78,16 +78,19 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>>>            return;
>>>        }
>>>    
>>> -    vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
>>> -    if (klass->get_dma_as != NULL && has_iommu) {
>>> +    vdev->dma_as = &address_space_memory;
>>
>> At this point you can also do:
>>
>>      if (!has_iommu) {
>>          return;
>>      }
>>
>> and the rest of the code will have one less indentation level.
> 
> It might make it harder to add code at the tail end of the function in
> the future, though.

True. I suggested that based on an assumption that the "!has_iommu" case is something
that is already covered and we don't need to bother about it. IMO it's fine to keep
the existing if/else code just in case we change our minds later on.


Thanks,


Daniel





> 
>>
>>
>> Thanks,
>>
>>
>> Daniel
>>
>>
>>
>>> +    if (has_iommu) {
>>> +        vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
>>> +        /* Fail FEATURE_OK if the device tries to drop IOMMU_PLATFORM */
>>>            virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
>>> -        vdev->dma_as = klass->get_dma_as(qbus->parent);
>>> -        if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
>>> -            error_setg(errp,
>>> +        if (klass->get_dma_as) {
>>> +            vdev->dma_as = klass->get_dma_as(qbus->parent);
>>> +            if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
>>> +                error_setg(errp,
>>>                           "iommu_platform=true is not supported by the device");
>>> +                return;
>>> +            }
>>>            }
>>> -    } else {
>>> -        vdev->dma_as = &address_space_memory;
>>>        }
>>>    }
>>>    
>>>
>>> base-commit: da89f242b4b774a25eaa16be125cf3e17299c127
> 

