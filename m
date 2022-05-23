Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 896525307FC
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 05:14:40 +0200 (CEST)
Received: from localhost ([::1]:47266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsyWl-00051F-8U
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 23:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nsyVU-0003cM-Pw
 for qemu-devel@nongnu.org; Sun, 22 May 2022 23:13:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nsyVR-0005un-Hm
 for qemu-devel@nongnu.org; Sun, 22 May 2022 23:13:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653275593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RNKKEyH817DbRvN5myGjSWpH2J1hUSsr3M9+I8svwqw=;
 b=DmDS3rpQVz7S30Af/f+4GghJOCc16RF3QsXlNmHPwUYQ7jWEbk0/mHddMg4jdZ3w2qKgL9
 jQ+Cr/7ZYiczjhFFIGyeyu2zKjBKElsH8EGI70LdO5pTLgT/s/50jv5jAco3ZAZSnRw49W
 IH8jldGyx4Rv/Cx5gERLEbJxNDKS7bo=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185-iA9tRw7ePjqzI9AjvQbyFQ-1; Sun, 22 May 2022 23:13:12 -0400
X-MC-Unique: iA9tRw7ePjqzI9AjvQbyFQ-1
Received: by mail-lj1-f199.google.com with SMTP id
 y10-20020a2e95ca000000b00253d689f32fso1762758ljh.5
 for <qemu-devel@nongnu.org>; Sun, 22 May 2022 20:13:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RNKKEyH817DbRvN5myGjSWpH2J1hUSsr3M9+I8svwqw=;
 b=dL/xCB1MNcqt31VEz2/K4ATLKAdma8wMjZEotFnP5lXZbEnMZmz1FxeBdr8RiZX5Nf
 zSTUR2WjUOo2YlSbSQcjsnG7DsHbf0+MjlG+D8gpubPH43dAvY8AMJ+9Fe4D8ojDdh3G
 /YOxMh277HFRfxqt/B0IdfHG8u1rf6sDz0XHcCa+FRlFHoV3gTDMMYdSUeLARgWYjkik
 YnLYebzBKd1oBXoFgRbFYv/hBTJ8zwTWE8srcvOgxYHAlbRl4NkYmUpup08s56Zv7NCL
 RQfQ5AvWgOtv2sl+B3UFC9UWUgBgjl8LT1QHyTNBE2lXc/Y7BSIrFiqFid0q+I+s+mx3
 AHgw==
X-Gm-Message-State: AOAM531xNMshbbG7XOEJ6ylwDnsCJC7eXju7T1pqfZ0U/xjjMvAr7zF+
 esbFTDjzTnMaFC9OFpDGQhXu9kmZPgldEhvrncctwklky8h0j1FMCBfqqKLCEb9sEEFMPfA8K/j
 Lz67pwfgskwX+OU3WwPbxHeeqUS2KJTE=
X-Received: by 2002:a2e:bd85:0:b0:250:9bf2:8e27 with SMTP id
 o5-20020a2ebd85000000b002509bf28e27mr12057135ljq.177.1653275590423; 
 Sun, 22 May 2022 20:13:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLMRz5i0VeXu2fBzW0p3v3T/t0a6LBnMafTj5NDt5cWVej+0sX5f3mu/EoTtgSVQtRzKi/xDS9nOaorCD3aTQ=
X-Received: by 2002:a2e:bd85:0:b0:250:9bf2:8e27 with SMTP id
 o5-20020a2ebd85000000b002509bf28e27mr12057115ljq.177.1653275590049; Sun, 22
 May 2022 20:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAJaqyWcbqzvtyHcU3t1TF7Mqm2_sBX57rN8S6hHB8NXxgi=tyQ@mail.gmail.com>
 <PH0PR12MB5481AF0B02B0FB00885FF2AEDCCA9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <BY5PR02MB698052EE53B707C6C04C3C8CB1CA9@BY5PR02MB6980.namprd02.prod.outlook.com>
 <PH0PR12MB54811C88B389ACB495BD5AB2DCCA9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CAJaqyWe2dQx1s7wQr8OLp-0eAQZJcCBuFwdxBA=sgeNm_u4N6A@mail.gmail.com>
 <PH0PR12MB54812F8306F5B9650BA10783DCCF9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <c235a37a-8a57-b4ae-6c2c-562d6e163450@redhat.com>
 <PH0PR12MB54813F22BC598ED8501DA1EBDCD19@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54813F22BC598ED8501DA1EBDCD19@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 23 May 2022 11:12:58 +0800
Message-ID: <CACGkMEu3odWG6NJjffiBosfrZ2WDWLDHeFhak2wQGzEQ3_fZ=A@mail.gmail.com>
Subject: Re: About restoring the state in vhost-vdpa device
To: Parav Pandit <parav@nvidia.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, 
 virtualization <virtualization@lists.linux-foundation.org>, 
 qemu-level <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>, 
 "virtio-networking@redhat.com" <virtio-networking@redhat.com>,
 Eli Cohen <elic@nvidia.com>, 
 Laurent Vivier <lvivier@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, piotr.uminski@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, May 18, 2022 at 8:44 PM Parav Pandit <parav@nvidia.com> wrote:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Monday, May 16, 2022 11:05 PM
> > >> Although it's a longer route, I'd very much prefer an in-band virtio
> > >> way to perform it rather than a linux/vdpa specific. It's one of the
> > >> reasons I prefer the CVQ behavior over a vdpa specific ioctl.
> > >>
> > > What is the in-band method to set last_avail_idx?
> > > In-band virtio method doesn't exist.
> >
> >
> > Right, but it's part of the vhost API which was there for more than 10 =
years.
> > This should be supported by all the vDPA vendors.
> Sure. My point to Eugenio was that vdpa doesn=E2=80=99t have to limited b=
y virtio spec.

Yes, but the APIs only consist of the ones that have been already
supported by either virtio or vhost.

> Plumbing exists to make vdpa work without virtio spec.
> And hence, additional ioctl can be ok.
>
> > >> layers of the stack need to maintain more state.
> > > Mostly not. A complete virtio device state arrived from source vdpa d=
evice
> > can be given to destination vdpa device without anyone else looking in =
the
> > middle. If this format is known/well defined.
> >
> >
> > That's fine, and it seems the virtio spec is a better place for this,
> > then we won't duplicate efforts?
> >
> Yes. for VDPA kernel, setting parameters doesn=E2=80=99t need virtio spec=
 update.

We've already had a spec patch for this.

> It is similar to avail index setting.

Yes, but we don't want to be separated too much from the virtio spec
unless we have a very strong point. The reason is that it would be
challenging to offer forward compatibility to the future spec support
of device state restoring. That's why we tend to reuse the existing
APIs so far.

>
> >
> > >
> > >>  From the guest point of view, to enable all the queues with
> > >> VHOST_VDPA_SET_VRING_ENABLE and don't send DRIVER_OK is the
> > same
> > >> as send DRIVER_OK and not to enable any data queue with
> > >> VHOST_VDPA_SET_VRING_ENABLE.
> > > Enabling SET_VRING_ENABLE after DRIVER_OK has two basic things
> > broken.
> >
> >
> > It looks to me the spec:
> >
> > 1) For PCI it doesn't forbid the driver to set queue_enable to 1 after
> > DRIVER_OK.
> Device init sequence sort of hints that vq setup should be done before dr=
iver_ok in below snippet.
>
> "Perform device-specific setup, including discovery of virtqueues for the=
 device, optional per-bus setup,
> reading and possibly writing the device=E2=80=99s virtio configuration sp=
ace, and population of virtqueues."
>
> For a moment even if we assume, that queue can be enabled after driver_ok=
, it ends up going to incorrect queue.

For RSS, the device can choose to drop the packet if the destination
queue is not enabled, we can clarify this in the spec. Actually
there's a patch that has clarified the packet should be dropped if the
queue is reset:

https://lists.oasis-open.org/archives/virtio-dev/202204/msg00063.html

We need to do something similar to queue_enable in this case. Then we
are all fine.

And the over head of the incremental ioctls is not something that
can't be addressed, we can introduce e.g a new command to disable
datapath by setting num_queue_paris to 0.

> Because the queue where it supposed to go, it not enabled and its rss is =
not setup.

So the queue_enable and num_queue_pairs work at different levels.
Queue_enable works at general virtio level, but the num_queue_paris
works for networking only.

From the spec, it allows the following setups:

1) enable 1st queue pairs
2) set driver_ok
3) set 4 queue pairs

The device is expected to deal with this setup anyhow.

>
> So on restore flow it is desired to set needed config before doing driver=
_ok.
>
> > 2) For MMIO, it even allows the driver to disable a queue after DRIVER_=
OK
> >
> >
> > > 1. supplied RSS config and VQ config is not honored for several tens =
of
> > hundreds of milliseconds
> > > It will be purely dependent on how/when this ioctl are made.
> > > Due to this behavior packet supposed to arrive in X VQ, arrives in Y =
VQ.
> >
> >
> > I don't get why we end up with this situation.
> >
> > 1) enable cvq
> > 2) set driver_ok
> > 3) set RSS
> > 4) enable TX/RX
> >
> > vs
> >
> > 1) set RSS
> > 2) enable cvq
> > 3) enable TX/RX
> > 4) set driver_ok
> >
> > Is the latter faster?
> >
> Yes, because later sequence has the ability to setup steering config once=
.
> As opposed to that first sequence needs to incrementally update the rss s=
etting on every new queue addition on step #4.

So what I understand the device RX flow is something like:

Incoming packet -> steering[1] -> queue_enable[2] -> start DMA

The steering[1] is expected to be configured when setting either MQ or RSS =
once.
The queue_enable[2] check is an independent check after steering.

We should only start the DMA after both 1 and 2. So the only
incremental thing is queue_enable[2].

I would try Eugenio's proposal and see how it works, anyhow it's the
cheapest way so far (without introducing new ioctls etc). My
understanding is that it should work (probably with some overhead on
the queue_enable step) for all vendors so far. If it doesn't we can do
new ioctls.

>
> >
> > >
> > > 2. Each VQ enablement one at a time, requires constant steering updat=
e
> > for the VQ
> > > While this information is something already known. Trying to reuse br=
ings a
> > callback result in this in-efficiency.
> > > So better to start with more reusable APIs that fits the LM flow.
> >
> >
> > I agree, but the method proposed in the mail seems to be the only way
> > that can work with the all the major vDPA vendors.
> >
> > E.g the new API requires the device has the ability to receive device
> > state other than the control virtqueue which might not be supported the
> > hardware. (The device might expects a trap and emulate model rather tha=
n
> > save and restore).
> >
> How a given vendor to return the values is in the vendor specific vdpa dr=
iver, just like avail_index which is not coming through the CVQ.

The problem is:

1) at virtqueue level, we know the index (and the inflight buffers)
are the only state
2) at the device level, we know there're a lot of other stuffs,
inventing new ioctls might require very careful design which may take
time

>
> >  From qemu point of view, it might need to support both models.
> >
> > If the device can't do save and restore:
> >
> > 1.1) enable cvq
> > 1.2) set driver_ok
> > 1.3) set device state (MQ, RSS) via control vq
> > 1.4) enable TX/RX
> >
> > If the device can do save and restore:
> >
> > 2.1) set device state (new API for setting MQ,RSS)
> > 2.2) enable cvq
> > 2.3) enable TX?RX
> > 2.4) set driver_ok
> >
> > We can start from 1 since it works for all device and then adding
> > support for 2?
> >
>
> How about:
> 3.1) create cvq for the supported device
> Cvq not exposed to user space, stays in the kernel. Vdpa driver created i=
t.

If it's a hardware CVQ, we may still need to set DRIVER_OK before
setting the states.

>
> 3.2) set device state (MQ, RSS) comes via user->kernel ioctl()
> Vdpa driver internally decides whether to use cvq or something else (like=
 avail index).
>

I think this is similar to method 2. The challenge is that the ioctl()
is not flexible as a queue, e.g we want a device agnostics API, (and
if we had one, it could be defined in the virtio-spec). At the API
level, it doesn't differ too much whether it's an ioctl or a queue. If
we decide to go with this way, we can simply insist that the CVQ can
work before DRIVER_OK (with a backend feature anyhow).

3.1) enable cvq
3.2) set device state (RSS,MQ) via CVQ
3.3) enable tx/rx
3.4) set driver_ok

Thanks


> 3.3) enable tx/rx
> 3.4) set driver_ok


