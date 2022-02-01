Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C27F4A696C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 01:57:04 +0100 (CET)
Received: from localhost ([::1]:46206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF3xH-0007BM-8U
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 19:57:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nEysK-0001Dg-CR; Tue, 01 Feb 2022 14:31:40 -0500
Received: from [2607:f8b0:4864:20::332] (port=44887
 helo=mail-ot1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nEysG-0002LR-AI; Tue, 01 Feb 2022 14:31:35 -0500
Received: by mail-ot1-x332.google.com with SMTP id
 s6-20020a0568301e0600b0059ea5472c98so17202688otr.11; 
 Tue, 01 Feb 2022 11:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5OuzkanTD6UV3cHueQnHLN1j0mbjk+km87PB5DacMZ8=;
 b=DgNLtt7S2zx2z4F+y9jsvzNWgRBGcsUi8MyDMljxFSAvb/3EYn+wOkNwy1U+tJyQ02
 rsmQ2lpguUDIvts3bTSBFWDWT+Hq+Dzp7E4Bk29fuAu2fbadVaXFKSChJgkSOHz2Y/SJ
 7IUXNu7zy656wzawqAorSv1kZT6ZZCXQ5mxJODQ1XcMvyPOc0Kaz0XuJf+9XVplbxqx7
 3eZUMDMnMIguraIeTDEbKUTgiYUOW8n1kKxn3ThcEP1/daad3iFWbNHwZ9Xi6p3/81kK
 ad95XWajVbkztCJLLEItVz1PGoRRD5yEZ/EolcHpx8puvMGNZ8evEQ756h4MsAIySTiO
 U2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5OuzkanTD6UV3cHueQnHLN1j0mbjk+km87PB5DacMZ8=;
 b=IUZ+HM647bqcrGdoizJqvTkwlOZCeUdcxcL8atcLXtEuvn4e1mCpxT9yBaKSx3B3Z2
 Uee9TRdDiJv6fF9eFKTVVHIItKp8kiME0vor/Va8/m2+R3jUNFTdp5DSOe9zRWgd/3N6
 TalDybV69g8bvXazsxvrqvuRHXR2dO7v6B8iKUjSvfPOpDXDpo7tJxkVXyG1kNIMCUvV
 lQrZ+xgT2mY2QLfm9AEFwuSEKH5+tk17zvj5IJnXcMuk3urQ0/FKy+u37VIzzEtXMqTD
 vpWalOLi33lfzixzqk1n0cAHVyL0AJq1Zkb+cX7kOixieDpM45v9ai0RYgu8Xc0QdGSk
 7IMg==
X-Gm-Message-State: AOAM532AUbCKcN5iSYtPYyl3BrmZS8GuQFdMIWiySijO4SJsSd3Ops14
 Y3FHTizRKKIyoZPB1omtS8k=
X-Google-Smtp-Source: ABdhPJy3ozagM/5rTHlfKZWUjI866MHgq4LtOkCpW9EukBmS0S9FLzbMWrwbYes0r1JKCUfuGv49UQ==
X-Received: by 2002:a05:6830:92:: with SMTP id
 a18mr15305955oto.373.1643743887430; 
 Tue, 01 Feb 2022 11:31:27 -0800 (PST)
Received: from [192.168.10.222] (189-68-153-170.dsl.telesp.net.br.
 [189.68.153.170])
 by smtp.gmail.com with ESMTPSA id x12sm14039558otq.6.2022.02.01.11.31.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 11:31:27 -0800 (PST)
Message-ID: <365305e3-4224-965d-2cb6-496a95802f0e@gmail.com>
Date: Tue, 1 Feb 2022 16:31:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/1] virtio: fix the condition for iommu_platform not
 supported
Content-Language: en-US
To: Halil Pasic <pasic@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb@linux.ibm.com>
References: <20220201133915.3764972-1-pasic@linux.ibm.com>
 <f12eeebf-6c9a-d40f-09de-10eb86dd3c26@linux.ibm.com>
 <20220201193309.7da86258.pasic@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220201193309.7da86258.pasic@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::332
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x332.google.com
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
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 Jakob Naucke <Jakob.Naucke@ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/1/22 15:33, Halil Pasic wrote:
> On Tue, 1 Feb 2022 12:36:25 -0300
> Daniel Henrique Barboza <danielhb@linux.ibm.com> wrote:
> 
>>> +    vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
>>>        if (klass->get_dma_as != NULL && has_iommu) {
>>>            virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
>>>            vdev->dma_as = klass->get_dma_as(qbus->parent);
>>> +        if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
>>> +            error_setg(errp,
>>> +                       "iommu_platform=true is not supported by the device");
>>> +        }
>>
>>
>>>        } else {
>>>            vdev->dma_as = &address_space_memory;
>>>        }
>>
>>
>> I struggled to understand what this 'else' clause was doing and I assumed that it was
>> wrong. Searching through the ML I learned that this 'else' clause is intended to handle
>> legacy virtio devices that doesn't support the DMA API (introduced in 8607f5c3072caeebb)
>> and thus shouldn't set  VIRTIO_F_IOMMU_PLATFORM.
>>
>>
>> My suggestion, if a v4 is required for any other reason, is to add a small comment in this
>> 'else' clause explaining that this is the legacy virtio devices condition and those devices
>> don't set F_IOMMU_PLATFORM. This would make the code easier to read for a virtio casual like
>> myself.
> 
> I do not agree that this is about legacy virtio. In my understanding
> virtio-ccw simply does not need translation because CCW devices use
> guest physical addresses as per architecture. It may be considered
> legacy stuff form PCI perspective, but I don't think it is legacy
> in general.


I wasn't talking about virtio-ccw. I was talking about this piece of code:


     if (klass->get_dma_as != NULL && has_iommu) {
         virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
         vdev->dma_as = klass->get_dma_as(qbus->parent);
     } else {
         vdev->dma_as = &address_space_memory;
     }


I suggested something like this:



     if (klass->get_dma_as != NULL && has_iommu) {
         virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
         vdev->dma_as = klass->get_dma_as(qbus->parent);
     } else {
         /*
          * We don't force VIRTIO_F_IOMMU_PLATFORM for legacy devices, i.e.
          * devices that don't implement klass->get_dma_as, regardless of
          * 'has_iommu' setting.
          */
         vdev->dma_as = &address_space_memory;
     }


At least from my reading of commits 8607f5c3072 and 2943b53f682 this seems to be
the case. I spent some time thinking that this IF/ELSE was wrong because I wasn't
aware of this history.


Thanks,


Daniel





> 
> And there is a good reason for virtio-ccw devices to use
> F_IOMMU_PLATFORM (secure execution).
> 
> Other opinions?
> 
> Regards,
> Halil

