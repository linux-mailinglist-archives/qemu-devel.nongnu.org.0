Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DA84AC9FF
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 21:02:09 +0100 (CET)
Received: from localhost ([::1]:52748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHADA-0004Gq-Kc
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 15:02:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nH9xy-0007yf-C1
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 14:46:27 -0500
Received: from [2607:f8b0:4864:20::c33] (port=36834
 helo=mail-oo1-xc33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nH9xw-0004PW-7B
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 14:46:25 -0500
Received: by mail-oo1-xc33.google.com with SMTP id
 r15-20020a4ae5cf000000b002edba1d3349so14986426oov.3
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 11:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=em5F2RWGp9J0Vaf7HYBFy+WeFuETcwx0HsCLTkU8z/o=;
 b=AWAB8i+nJ7hTZ9FNkwoZbPdC3QeyvF4O8z1m2H9V5aG7DmWM805LvBLFUGQkvSL/RE
 JNNwd8yGxMymPbz9qccYuSMM2dVHFvnBBazPkYoNNNHbaHzD+AoVTyNgYnW75yyPy+g4
 z1LQmQBi/PFAPL0bmeljzLSv9lXpY7DlOcFS2hwkkq7CvKnhXoDMeh6noznFJyhBZ6Co
 1EhS5qZdGVkdUG1M5T/mTrCOp3Sm/p1hmbP7NzU44HJSWSb0QCBHGz2G3TORdmF9TEJh
 jIO6rb3YtyFMCf0Mor/Oi3nreAZe7+fIr0h19/xzav7Fl9bZgM8BcSbAfRzZ2zDfLTSC
 5/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=em5F2RWGp9J0Vaf7HYBFy+WeFuETcwx0HsCLTkU8z/o=;
 b=dMBuUCxQ2xopqt/IU2KJyDFG1p9KpwsBMiu4XA9x9sgiMxpQmFVoMb1mJjYNmMZ1q/
 hOiaCcmNq/8TpuwCoA51F6gsthGoahg55YSjc+OAh5nprcVjC7/9QdX6wxcMksxhMBbD
 bKqteFsb/Sid/mcZPgDu/JcwqK/RbKojpc0QnXGh01/HO6XS8PBO7VQIUZXGcCktUXZD
 AsyLhkN03IkmtN3v8rXfrnvTgxgt5j+F2h0g+laMaJ5ZfBSlW5JtlMdGZFXGtvcM3i92
 UWJttZtlbYL00Rs75OBt45gRyxq6WW8ZHh/2kTWPOTds2iH4lSOvwKOMPbSotHChQEiO
 Rkzw==
X-Gm-Message-State: AOAM5314rzTXrnBPLSfKAUVUIdZ5y2yyPEYlecmfJGlkoVtVJHBYAePH
 uM41eDQQpgLlDyvVVKFONHQ=
X-Google-Smtp-Source: ABdhPJwNoi7lsnkszKiAlgzRFHTWw/6Veng398YN/1YTod4/47CNn2RGgzBsvwDObFxqD2dI5rSpzw==
X-Received: by 2002:a05:6870:72c3:: with SMTP id
 o3mr182654oak.108.1644263168427; 
 Mon, 07 Feb 2022 11:46:08 -0800 (PST)
Received: from [192.168.10.222] ([191.193.0.12])
 by smtp.gmail.com with ESMTPSA id bb16sm4467932oob.42.2022.02.07.11.46.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 11:46:08 -0800 (PST)
Message-ID: <e1566e82-6990-4d2b-952c-7d59886f7af5@gmail.com>
Date: Mon, 7 Feb 2022 16:46:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 1/1] virtio: fix feature negotiation for
 ACCESS_PLATFORM
Content-Language: en-US
To: Halil Pasic <pasic@linux.ibm.com>
References: <20220203164556.2666565-1-pasic@linux.ibm.com>
 <7df172fe-008a-0b98-2780-5155c98a71ba@gmail.com>
 <20220207154615.72b8756a.pasic@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220207154615.72b8756a.pasic@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc33.google.com
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
Cc: Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/7/22 11:46, Halil Pasic wrote:
> On Mon, 7 Feb 2022 08:46:34 -0300
> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> 
>> On 2/3/22 13:45, Halil Pasic wrote:
>>> Unlike most virtio features ACCESS_PATFORM is considered mandatory, i.e.
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
> I can add that if Michael agrees, and if the patch is deemed worthy.
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
> I'm missing because. I.e. s/not/not becasue/
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
> I have considered this and decided against it. The reason why is
> if that approach is taken, we can't really add more code to the
> end of the function. An early return is good if we want to
> abort the function with an error. My point is !has_iommu does
> not necessarily mean we are done: after a block that handles
> the has_iommu situation, in future, there could be a block that
> handles something different.

And that's fine, but the way this patch is changing it I'm not sure it's better
than what we already have. Today we have:

if (has_iommu) {
   (... assign vdev->dma_as in some cases ...)
} else {
    vdev->dma_as = &address_space_memory;
}


Your patch is doing:

vdev->dma_as = &address_space_memory;

if (has_iommu) {
   (... assign vdev->dma_as in some cases ...)
}


You got rid of an 'else', but ended up adding a double "vdev->dma_as =" assignment
depending on the case (has_iommu = true and klass->get_dma_as != NULL). This is why
I proposed the early exit.

If we're worried about adding more code in the future might as well leave the existing
if/else as is.
        


> 
> Would this patch work for power? Or are there valid scenarios that
> it breaks? I'm asking, because you voiced concern regarding this before.


I'll test it when I have an opportunity and let you know.


Thanks,


Daniel

> 
> Thanks for your feedback!
> 
> Halil

