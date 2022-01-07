Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8084870CB
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 03:54:36 +0100 (CET)
Received: from localhost ([::1]:51358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5fOk-0004Ur-W9
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 21:54:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n5fNp-0003iG-RE
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 21:53:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n5fNn-0007hW-LQ
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 21:53:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641524014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EJlmubLHciVONv7lMmxcOpTQyj3Tz4XlHxHjMVmUPh0=;
 b=EmvarhEktJxHBpj3J3mQbWVL2BHy0QYB9620BDPX3JZjztTqSvJ5o75oysO7i7C+M3NH34
 zzD0XIzyqiCaOvsFN8OYKDKFbuxWGq/j69dZtLIyZ/760YfMR3lDhjd3csMFujzhRfHas7
 6MC50WY4LqY3GWGi6P9WNxoY5G38PFU=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-gm4uMJOBPCi-b9BWIRG2CA-1; Thu, 06 Jan 2022 21:53:33 -0500
X-MC-Unique: gm4uMJOBPCi-b9BWIRG2CA-1
Received: by mail-pj1-f69.google.com with SMTP id
 j5-20020a17090a738500b001b33f47e757so3234679pjg.5
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 18:53:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EJlmubLHciVONv7lMmxcOpTQyj3Tz4XlHxHjMVmUPh0=;
 b=DQwjTzfYAlvqbory8+rouDJD/Rbz319cKwNS2DzqQknO2FSmw+PXtxNZ+aDJedu9lb
 8BHcCc9dGhsSCqDRA1VW3M5CIMv/MJativyz5iJYeXwHPivHy6/HXioTr527ziAxj7TH
 l1DSn74VM2k68IrZejha4gf3ghYFPE18DIE1BW+03Z3MSxJBe3rKlpMcZ8BeHxaVPnoR
 SnefO8sYYDnpo8ja8M1wO81GIWW+RiYrpsCG39BnkaRZ5s9TwBA5xTDrWytbZ+/44sKX
 rE2FDIBXGqMj87sVfafW72RX7ML89XqxxsNpNmksdbSn/5SP+IvOrbSanQ45LJvnczc0
 aIVg==
X-Gm-Message-State: AOAM530BfY+yW77kiMzLKq+9GBSMtSPobBmjkK2rui0G3VBY39ZVgkgc
 m1n+NWR5Wiqqh5W4OJ4BBy3Ff6HWkUX9uhZt0UzTD3h43HN0xK6iWCrxmljdEoN4nxpKnNVQd1I
 QVl+MwfW/V63PzFI=
X-Received: by 2002:a17:90b:4c8c:: with SMTP id
 my12mr13725258pjb.50.1641524011971; 
 Thu, 06 Jan 2022 18:53:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKMQXTMYfJqGw+yfAgtp6hQN+AxGhJQu2lewhwffWzwq21A6xQZuq/C+18tsM0mj9o/58Ryw==
X-Received: by 2002:a17:90b:4c8c:: with SMTP id
 my12mr13725226pjb.50.1641524011659; 
 Thu, 06 Jan 2022 18:53:31 -0800 (PST)
Received: from [10.72.13.245] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id lw5sm7781099pjb.13.2022.01.06.18.53.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 18:53:31 -0800 (PST)
Message-ID: <477612e9-c20c-073c-afc9-bad7844850e0@redhat.com>
Date: Fri, 7 Jan 2022 10:53:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [RFC 02/10] vhost: add 3 commands for vhost-vdpa
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20220105005900.860-1-longpeng2@huawei.com>
 <20220105005900.860-3-longpeng2@huawei.com>
 <CACGkMEtL7Qkb65Wj4vw-W9h7Lu1Mh7fWGMEkw+0e=Ce=LfD=FA@mail.gmail.com>
 <20220105020008-mutt-send-email-mst@kernel.org>
 <CACGkMEsPqADAR1LhjP=Y4ShhSogdrf2T8O2Km22G7FwGCe+hrQ@mail.gmail.com>
 <1d157f74fdac49ff8ae734808bd3c518@huawei.com>
 <CACGkMEukEBFYrmJjj-jXR_UdamFbjrFkj7PbdfQJOGMzekAvSg@mail.gmail.com>
 <20220105072321-mutt-send-email-mst@kernel.org>
 <CACGkMEt+A5-rSq20qTbideO39q-rZ5RKoK8H77OihFQ8VDgUfw@mail.gmail.com>
 <20220106090804-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220106090804-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.691, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Cornelia Huck <cohuck@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Yechuan <yechuan@huawei.com>, "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Huangzhichao <huangzhichao@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 pbonzini <pbonzini@redhat.com>, "Longpeng \(Mike,
 Cloud Infrastructure Service Product Dept.\)" <longpeng2@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/1/6 下午10:09, Michael S. Tsirkin 写道:
> On Thu, Jan 06, 2022 at 10:34:20AM +0800, Jason Wang wrote:
>> On Wed, Jan 5, 2022 at 8:26 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>>> On Wed, Jan 05, 2022 at 05:09:07PM +0800, Jason Wang wrote:
>>>> On Wed, Jan 5, 2022 at 4:37 PM Longpeng (Mike, Cloud Infrastructure
>>>> Service Product Dept.) <longpeng2@huawei.com> wrote:
>>>>>
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Jason Wang [mailto:jasowang@redhat.com]
>>>>>> Sent: Wednesday, January 5, 2022 3:54 PM
>>>>>> To: Michael S. Tsirkin <mst@redhat.com>
>>>>>> Cc: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
>>>>>> <longpeng2@huawei.com>; Stefan Hajnoczi <stefanha@redhat.com>; Stefano
>>>>>> Garzarella <sgarzare@redhat.com>; Cornelia Huck <cohuck@redhat.com>; pbonzini
>>>>>> <pbonzini@redhat.com>; Gonglei (Arei) <arei.gonglei@huawei.com>; Yechuan
>>>>>> <yechuan@huawei.com>; Huangzhichao <huangzhichao@huawei.com>; qemu-devel
>>>>>> <qemu-devel@nongnu.org>
>>>>>> Subject: Re: [RFC 02/10] vhost: add 3 commands for vhost-vdpa
>>>>>>
>>>>>> On Wed, Jan 5, 2022 at 3:02 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>>>>>>> On Wed, Jan 05, 2022 at 12:35:53PM +0800, Jason Wang wrote:
>>>>>>>> On Wed, Jan 5, 2022 at 8:59 AM Longpeng(Mike) <longpeng2@huawei.com> wrote:
>>>>>>>>> From: Longpeng <longpeng2@huawei.com>
>>>>>>>>>
>>>>>>>>> To support generic vdpa deivce, we need add the following ioctls:
>>>>>>>>> - GET_VECTORS_NUM: the count of vectors that supported
>>>>>>>> Does this mean MSI vectors? If yes, it looks like a layer violation:
>>>>>>>> vhost is transport independent.
>>>>>>> Well *guest* needs to know how many vectors device supports.
>>>>>>> I don't think there's a way around that. Do you?
>>>>>> We have VHOST_SET_VRING/CONFIG_CALL which is per vq. I think we can
>>>>>> simply assume #vqs + 1?
>>>>>>
>>>>>>> Otherwise guests will at best be suboptimal.
>>>>>>>
>>>>>>>>   And it reveals device implementation
>>>>>>>> details which block (cross vendor) migration.
>>>>>>>>
>>>>>>>> Thanks
>>>>>>> Not necessarily, userspace can hide this from guest if it
>>>>>>> wants to, just validate.
>>>>>> If we can hide it at vhost/uAPI level, it would be even better?
>>>>>>
>>>>> Not only MSI vectors, but also queue-size, #vqs, etc.
>>>> MSI is PCI specific, we have non PCI vDPA parent e.g VDUSE/simulator/mlx5
>>>>
>>>> And it's something that is not guaranteed to be not changed. E.g some
>>>> drivers may choose to allocate MSI during set_status() which can fail
>>>> for various reasons.
>>>>
>>>>> Maybe the vhost level could expose the hardware's real capabilities
>>>>> and let the userspace (QEMU) do the hiding? The userspace know how
>>>>> to process them.
>>>> #MSI vectors is much more easier to be mediated than queue-size and #vqs.
>>>>
>>>> For interrupts, we've already had VHOST_SET_X_KICK, we can keep
>>>> allocating eventfd based on #MSI vectors to make it work with any
>>>> number of MSI vectors that the virtual device had.
>>> Right but if hardware does not support so many then what?
>>> Just fail?
>> Or just trigger the callback of vqs that shares the vector.
>
> Right but we want userspace to be able to report this to guest accurately
> if it wants to. Guest can then configure itself correctly.
>
>
>>> Having a query API would make things somewhat cleaner imho.
>> I may miss something,  even if we know #vectors, we still don't know
>> the associated virtqueues for a dedicated vector?
> This is up to the guest.


Just to clarify the possible issue, this only works if vDPA parent is 
using the same irq binding policy as what viritio-pci did in the guest.

Consider vDPA has 3 vectors allocated:

host vector 0: tx/rx
host vector 1: cvq
host vector 2: config

So we return 3 for get_vectors. So the virtual device will have 3 
vectors in this case.

But a guest driver may do:

guest vector 0: tx (eventfd0)
guest vector 1: rx (eventfd1)
guest vector 2: cvq/config (eventfd2)

The irq handler of host vector0 will notify both eventfd0(guest vector0) 
and eventfd1(guest vector1) in this case.

And using such "vectors passthrough" may block migration between the 
vDPA device where the #vectors is the only difference.

Thanks


>
>>>> For queue-size, it's Ok to have a new uAPI but it's not a must, Qemu
>>>> can simply fail if SET_VRING_NUM fail.
>>>>
>>>> For #vqs, it's OK to have a new uAPI since the emulated virtio-pci
>>>> device requires knowledge the #vqs in the config space. (still not a
>>>> must, we can enumerate #vqs per device type)
>>>>
>>>> For the config size, it's OK but not a must, technically we can simply
>>>> relay what guest write to vhost-vdpa. It's just because current Qemu
>>>> require to have it during virtio device initialization.
>>>>
>>>> Thanks
>>>
>>> I agree but these ok things make for a cleaner API I think.
>> Right.
>>
>> Thanks
>>
>>>>>> Thanks
>>>>>>
>>>>>>>
>>>>>>>>> - GET_CONFIG_SIZE: the size of the virtio config space
>>>>>>>>> - GET_VQS_NUM: the count of virtqueues that exported
>>>>>>>>>
>>>>>>>>> Signed-off-by: Longpeng <longpeng2@huawei.com>
>>>>>>>>> ---
>>>>>>>>>   linux-headers/linux/vhost.h | 10 ++++++++++
>>>>>>>>>   1 file changed, 10 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/linux-headers/linux/vhost.h b/linux-headers/linux/vhost.h
>>>>>>>>> index c998860d7b..c5edd75d15 100644
>>>>>>>>> --- a/linux-headers/linux/vhost.h
>>>>>>>>> +++ b/linux-headers/linux/vhost.h
>>>>>>>>> @@ -150,4 +150,14 @@
>>>>>>>>>   /* Get the valid iova range */
>>>>>>>>>   #define VHOST_VDPA_GET_IOVA_RANGE      _IOR(VHOST_VIRTIO, 0x78, \
>>>>>>>>>                                               struct vhost_vdpa_iova_range)
>>>>>>>>> +
>>>>>>>>> +/* Get the number of vectors */
>>>>>>>>> +#define VHOST_VDPA_GET_VECTORS_NUM     _IOR(VHOST_VIRTIO, 0x79, int)
>>>>>>>>> +
>>>>>>>>> +/* Get the virtio config size */
>>>>>>>>> +#define VHOST_VDPA_GET_CONFIG_SIZE     _IOR(VHOST_VIRTIO, 0x80, int)
>>>>>>>>> +
>>>>>>>>> +/* Get the number of virtqueues */
>>>>>>>>> +#define VHOST_VDPA_GET_VQS_NUM         _IOR(VHOST_VIRTIO, 0x81, int)
>>>>>>>>> +
>>>>>>>>>   #endif
>>>>>>>>> --
>>>>>>>>> 2.23.0
>>>>>>>>>


