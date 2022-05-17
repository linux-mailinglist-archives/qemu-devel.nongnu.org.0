Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BF95297A4
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 05:07:08 +0200 (CEST)
Received: from localhost ([::1]:36966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqnYA-00087G-W5
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 23:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nqnWb-0006XS-9n
 for qemu-devel@nongnu.org; Mon, 16 May 2022 23:05:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nqnWY-000830-2j
 for qemu-devel@nongnu.org; Mon, 16 May 2022 23:05:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652756724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EelOwjaw4TS+XRiPvJytkNJ1z7ZsgkjXM+Dsrb/Ma8s=;
 b=Xt07Id0uS/wXbJOzvilzrzp5ZIS+Ybvx/H1/gspAxEOy/+56N++pVcHTEFHbMRNB8AP+TV
 I/36vC91qWZcUKL1Xluw6M+hvfmz8+7FcTJlJdY4tImSpUeVF/yqnV1chDla8/xMdbHz0A
 xzaWjZ2kQq8TneVUq9DMqKd8XmJGo+I=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-wBvCtwMnOlCfzwhY389aqw-1; Mon, 16 May 2022 23:05:23 -0400
X-MC-Unique: wBvCtwMnOlCfzwhY389aqw-1
Received: by mail-pf1-f198.google.com with SMTP id
 i127-20020a625485000000b0050d3d1cab5fso7036842pfb.5
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 20:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EelOwjaw4TS+XRiPvJytkNJ1z7ZsgkjXM+Dsrb/Ma8s=;
 b=3hMsStaO5TUuaE7hGqfcWNx991iZyFfnf62iFtv78alPVhSHsMekwwa4HujyjbCdD9
 f05f5tg+fpttGuua3Mdv3znCl3lyuN23ynfyxzp1EDO1/DWNlXioUBTGUCvfZRMJxtaH
 b/YvNzbPKl1X5wJ1AYwi+AHFdIX73+6AzrTfrZUH3mT6kJeYDBaizF/6XVY0Qz80/WYI
 jd5NR74nbbIaFEqBDx3RpT7/+xyPtVQAAMzrDyBUzsrfCGcboh42JGZtYqoxLe4vI0Zo
 tR0F/pyERk5K1BpmeqDjTnMg23KnkCgn9Nll9h7X6FzCgttBNmaZwsz5k2upmMN73VVn
 Bazw==
X-Gm-Message-State: AOAM533AiQhwuhBJri6FvcKdzgWXqicMIeyh2j9zDcEV4zR2bb2G3Fku
 lPXA46rDyyk4I6KPTagRnJ8jQeKYKpT0IfHP0W3pNhkKRCVlBCSOHcYeMUqUh+Firt458mCILsa
 f6gr5MT85qh2opj0=
X-Received: by 2002:a17:902:82c7:b0:161:4936:f068 with SMTP id
 u7-20020a17090282c700b001614936f068mr14342966plz.145.1652756722368; 
 Mon, 16 May 2022 20:05:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzk6L81/d20e5TYIJBogw4txS5znfNbyxYwKsMeeXIqeOMLnabcGJ3/YConpbtiAp5i7wV07w==
X-Received: by 2002:a17:902:82c7:b0:161:4936:f068 with SMTP id
 u7-20020a17090282c700b001614936f068mr14342950plz.145.1652756722052; 
 Mon, 16 May 2022 20:05:22 -0700 (PDT)
Received: from [10.72.12.227] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 gz19-20020a17090b0ed300b001d9738fdf2asm407169pjb.37.2022.05.16.20.05.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 20:05:21 -0700 (PDT)
Message-ID: <c235a37a-8a57-b4ae-6c2c-562d6e163450@redhat.com>
Date: Tue, 17 May 2022 11:05:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: About restoring the state in vhost-vdpa device
Content-Language: en-US
To: Parav Pandit <parav@nvidia.com>, Eugenio Perez Martin <eperezma@redhat.com>
Cc: Gautam Dawar <gdawar@xilinx.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 qemu-level <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>,
 "virtio-networking@redhat.com" <virtio-networking@redhat.com>,
 Eli Cohen <elic@nvidia.com>, Laurent Vivier <lvivier@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <CAJaqyWcbqzvtyHcU3t1TF7Mqm2_sBX57rN8S6hHB8NXxgi=tyQ@mail.gmail.com>
 <PH0PR12MB5481AF0B02B0FB00885FF2AEDCCA9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <BY5PR02MB698052EE53B707C6C04C3C8CB1CA9@BY5PR02MB6980.namprd02.prod.outlook.com>
 <PH0PR12MB54811C88B389ACB495BD5AB2DCCA9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CAJaqyWe2dQx1s7wQr8OLp-0eAQZJcCBuFwdxBA=sgeNm_u4N6A@mail.gmail.com>
 <PH0PR12MB54812F8306F5B9650BA10783DCCF9@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <PH0PR12MB54812F8306F5B9650BA10783DCCF9@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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


在 2022/5/17 04:29, Parav Pandit 写道:
>
>> From: Eugenio Perez Martin <eperezma@redhat.com>
>> Sent: Monday, May 16, 2022 4:51 AM
>>
>> On Fri, May 13, 2022 at 8:25 PM Parav Pandit <parav@nvidia.com> wrote:
>>> Hi Gautam,
>>>
>>> Please fix your email client to have right response format.
>>> Otherwise, it will be confusing for the rest and us to follow the
>> conversation.
>>> More below.
>>>
>>>> From: Gautam Dawar <gdawar@xilinx.com>
>>>> Sent: Friday, May 13, 2022 1:48 PM
>>>>> Our proposal diverge in step 7: Instead of enabling *all* the
>>>>> virtqueues, only enable the CVQ.
>>>> Just to double check, VQ 0 and 1 of the net are also not enabled, correct?
>>>> [GD>>] Yes, that's my understanding as well.
>>>>
>> That's correct. We can say that for a queue to be enabled three things must
>> happen:
>> * DRIVER_OK (Still not send)
>> * VHOST_VDPA_SET_VRING_ENABLE sent for that queue (Only sent for
>> CVQ)
>> * If queue is not in first data queue pair and not cvq: send
>> VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET with a queue pair that include it.
>>
> These if conditions, specially the last one is not good as it requires device type knowledge, which in most cases not needed.
> Specially for the new code.
>
>>>>> After that, send the DRIVER_OK and queue all the control commands
>>>>> to restore the device status (MQ, RSS, ...). Once all of them have
>>>>> been acknowledged ("device", or emulated cvq in host vdpa backend
>>>>> driver, has used all cvq buffers, enable (SET_VRING_ENABLE,
>>>>> set_vq_ready) all other queues.
>>>>>
>>>> What is special about doing DRIVER_OK and enqueuing the control
>>>> commands?
>>>> Why other configuration cannot be applied before DRIVER_OK?
>> There is nothing special beyond "they have a method to be set that way, so
>> reusing it avoids having to maintain many ways to set the same things,
>> simplifying implementations".
>>
>> I'm not saying "it has been like that forever so we cannot change it":
>> I'm very open to the change but priority-wise we should first achieve a
>> working LM with packed, in_order, or even indirect.
>>
>>>> [GD>>] For the device to be live (and any queue to be able to pass
>>>> traffic), DRIVER_OK is a must.
>>> This applies only to the vdpa device implemented over virtio device.
>>> For such use case/implementation anyway a proper virtio spec extension is
>> needed for it be efficient.
>>> And what that happens this scheme will still work.
>>>
>> Although it's a longer route, I'd very much prefer an in-band virtio way to
>> perform it rather than a linux/vdpa specific. It's one of the reasons I prefer
>> the CVQ behavior over a vdpa specific ioctl.
>>
> What is the in-band method to set last_avail_idx?
> In-band virtio method doesn't exist.


Right, but it's part of the vhost API which was there for more than 10 
years. This should be supported by all the vDPA vendors.


>
>>> Other vdpa devices doesn’t have to live with this limitation at this moment.
>>>
>>>> So, any configuration can be passed over the CVQ only after it is
>>>> started (vring configuration + DRIVER_OK). For an emulated queue, if
>>>> the order is reversed, I think the enqueued commands will remain
>>>> buffered and device should be able to service them when it goes live.
>>> I likely didn’t understand what you describe above.
>>>
>>> Vq avail index etc is programmed before doing DRIVER_OK anyway.
>>>
>>> Sequence is very straight forward at destination from user to kernel.
>>> 1. Set config space fields (such as virtio_net_config/virtio_blk_config).
>>> 2. Set other device attributes (max vqs, current num vqs) 3. Set net
>>> specific config (RSS, vlan, mac and more filters) 4. Set VQ fields
>>> (enable, msix, addr, avail indx) 5. Set DRIVER_OK, device resumes from
>>> where it left off
>>>
>>> Steps #1 to #4 can be done multiple times in pre-warm device up case in
>> future.
>>
>> That requires creating a way to set all the parameters enumerated there to
>> vdpa devices. Each time a new feature is added to virtio-net that modifies
>> the guest-visible fronted device we would need to update it.
> Any guest visible feature exposed by the vdpa device on the source side, a migration agent needs to verify/and make destination device capable to support it anyway. Without it a device may be migrated, but it won't perform at same level as source.
>
>> And all the
>> layers of the stack need to maintain more state.
> Mostly not. A complete virtio device state arrived from source vdpa device can be given to destination vdpa device without anyone else looking in the middle. If this format is known/well defined.


That's fine, and it seems the virtio spec is a better place for this, 
then we won't duplicate efforts?


>
>>  From the guest point of view, to enable all the queues with
>> VHOST_VDPA_SET_VRING_ENABLE and don't send DRIVER_OK is the same
>> as send DRIVER_OK and not to enable any data queue with
>> VHOST_VDPA_SET_VRING_ENABLE.
> Enabling SET_VRING_ENABLE after DRIVER_OK has two basic things broken.


It looks to me the spec:

1) For PCI it doesn't forbid the driver to set queue_enable to 1 after 
DRIVER_OK.
2) For MMIO, it even allows the driver to disable a queue after DRIVER_OK


> 1. supplied RSS config and VQ config is not honored for several tens of hundreds of milliseconds
> It will be purely dependent on how/when this ioctl are made.
> Due to this behavior packet supposed to arrive in X VQ, arrives in Y VQ.


I don't get why we end up with this situation.

1) enable cvq
2) set driver_ok
3) set RSS
4) enable TX/RX

vs

1) set RSS
2) enable cvq
3) enable TX/RX
4) set driver_ok

Is the latter faster?


>
> 2. Each VQ enablement one at a time, requires constant steering update for the VQ
> While this information is something already known. Trying to reuse brings a callback result in this in-efficiency.
> So better to start with more reusable APIs that fits the LM flow.


I agree, but the method proposed in the mail seems to be the only way 
that can work with the all the major vDPA vendors.

E.g the new API requires the device has the ability to receive device 
state other than the control virtqueue which might not be supported the 
hardware. (The device might expects a trap and emulate model rather than 
save and restore).

 From qemu point of view, it might need to support both models.

If the device can't do save and restore:

1.1) enable cvq
1.2) set driver_ok
1.3) set device state (MQ, RSS) via control vq
1.4) enable TX/RX

If the device can do save and restore:

2.1) set device state (new API for setting MQ,RSS)
2.2) enable cvq
2.3) enable TX?RX
2.4) set driver_ok

We can start from 1 since it works for all device and then adding 
support for 2?

Thanks



