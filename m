Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 711A24F7831
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 09:53:14 +0200 (CEST)
Received: from localhost ([::1]:60412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncMx7-00033S-3v
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 03:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ncMum-0001bU-Ti
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 03:50:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ncMuj-0004f8-2Z
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 03:50:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649317843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tvYCl0Imz3tWePigcFvD0vVdYzSy5naqkwAOvh3bokc=;
 b=Ttels1244MHoUJI9yL68bME2+jK6jwwOKg25kZTbC7jc+ZKCtki+Jbd5K6p799OBfmbF2t
 kvfoehGWqEmWPUSSTfHgdY0LL431tukRViZ+UqwQi/D2XgkldcZ5Y0Q6qxFLIaXg/1Lz0o
 zT10br7KB0PKFQw975Nv17xqRu51cbY=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-et4-w1MWPPiO9uB-8x3-rg-1; Thu, 07 Apr 2022 03:50:42 -0400
X-MC-Unique: et4-w1MWPPiO9uB-8x3-rg-1
Received: by mail-pl1-f200.google.com with SMTP id
 p8-20020a170902e74800b001564f2593a5so2425193plf.2
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 00:50:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tvYCl0Imz3tWePigcFvD0vVdYzSy5naqkwAOvh3bokc=;
 b=gBLy3Ge9aJLW5P8LnJwcZwzdBRH1A2GlFT4z6aqyutzZQO5q2tJpysmJMd4atD1r/H
 y/cF9lT0t2dfzyMeNOf2ykg4o1E52weZvG2cg+ZnhqqF92rVNLRhKLgSl4sWZAL7xEt2
 GM1CVn6ky90Fo0VSe1S0ngdnIBTqiANo8iWws+/ozlKSgIfsPiSd8J5yLhLLEi6jxYcI
 07FcFbeSbn4JPLW1C6LmIwcMcaTMl+7MA1LuhZBTwazBbnYvNdIcJjKqOi/VyvHvhE3l
 8gp0nA3yqZB41sKUpXEAZuoUuJQOw3WTr7IQgKa4y/dgEZmQ05E2Z6VqSeVHHcmpDjHN
 yWWw==
X-Gm-Message-State: AOAM532zzivWdX+jQqd06CwnntNLI6deFCm2de2iqzHjX/ViTrj5DtsI
 CofBb947WIwP+q+L8utlJgGzUBCrlSFsCPzYD83yXZRspJY34MbbSGbBElwcO0iU5ZpamO4V4vI
 9BTaMaH407tLjWdU=
X-Received: by 2002:a65:6e41:0:b0:39c:c97b:2aef with SMTP id
 be1-20020a656e41000000b0039cc97b2aefmr1201022pgb.473.1649317841345; 
 Thu, 07 Apr 2022 00:50:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxdwFt1Gg0KXXUYxn9V+4r+TBK0txcGLcE+i9j0PS1XMVNmTz/GFCcsLuOVJ0nShGLJKPXNg==
X-Received: by 2002:a65:6e41:0:b0:39c:c97b:2aef with SMTP id
 be1-20020a656e41000000b0039cc97b2aefmr1201006pgb.473.1649317840888; 
 Thu, 07 Apr 2022 00:50:40 -0700 (PDT)
Received: from [10.72.13.105] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 nu16-20020a17090b1b1000b001c77c6a391csm8215114pjb.26.2022.04.07.00.50.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 00:50:40 -0700 (PDT)
Message-ID: <6a1e7563-94d9-ea30-d94c-a2197c04ecac@redhat.com>
Date: Thu, 7 Apr 2022 15:50:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v4] vdpa: reset the backend device in the end of
 vhost_net_stop()
To: Si-Wei Liu <si-wei.liu@oracle.com>
References: <1648718713-7637-1-git-send-email-qiudayu@archeros.com>
 <1648776683-23739-1-git-send-email-qiudayu@archeros.com>
 <CACGkMEuQ_YW+aSysnFtDrjy=Wjq_U3KouOobYSC+e5+5SR0zEA@mail.gmail.com>
 <ab772bc3-4acd-bb79-7f97-0518e04bb7fe@oracle.com>
 <CACGkMEv8+XC39G4wK_bUY0ZdFd29YoR7D3ugrMy-iT7cO1arew@mail.gmail.com>
 <379df944-f46a-ecbc-3566-8776cfefa3f1@oracle.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <379df944-f46a-ecbc-3566-8776cfefa3f1@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Cindy Lu <lulu@redhat.com>, mst <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, eperezma <eperezma@redhat.com>,
 Michael Qiu <qiudayu@archeros.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/4/6 上午8:56, Si-Wei Liu 写道:
>
>
> On 4/1/2022 7:20 PM, Jason Wang wrote:
>> Adding Michael.
>>
>> On Sat, Apr 2, 2022 at 7:08 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>>
>>>
>>> On 3/31/2022 7:53 PM, Jason Wang wrote:
>>>> On Fri, Apr 1, 2022 at 9:31 AM Michael Qiu <qiudayu@archeros.com> 
>>>> wrote:
>>>>> Currently, when VM poweroff, it will trigger vdpa
>>>>> device(such as mlx bluefield2 VF) reset many times(with 1 datapath
>>>>> queue pair and one control queue, triggered 3 times), this
>>>>> leads to below issue:
>>>>>
>>>>> vhost VQ 2 ring restore failed: -22: Invalid argument (22)
>>>>>
>>>>> This because in vhost_net_stop(), it will stop all vhost device 
>>>>> bind to
>>>>> this virtio device, and in vhost_dev_stop(), qemu tries to stop 
>>>>> the device
>>>>> , then stop the queue: vhost_virtqueue_stop().
>>>>>
>>>>> In vhost_dev_stop(), it resets the device, which clear some flags
>>>>> in low level driver, and in next loop(stop other vhost backends),
>>>>> qemu try to stop the queue corresponding to the vhost backend,
>>>>>    the driver finds that the VQ is invalied, this is the root cause.
>>>>>
>>>>> To solve the issue, vdpa should set vring unready, and
>>>>> remove reset ops in device stop: vhost_dev_start(hdev, false).
>>>>>
>>>>> and implement a new function vhost_dev_reset, only reset backend
>>>>> device after all vhost(per-queue) stoped.
>>>> Typo.
>>>>
>>>>> Signed-off-by: Michael Qiu<qiudayu@archeros.com>
>>>>> Acked-by: Jason Wang <jasowang@redhat.com>
>>>> Rethink this patch, consider there're devices that don't support
>>>> set_vq_ready(). I wonder if we need
>>>>
>>>> 1) uAPI to tell the user space whether or not it supports 
>>>> set_vq_ready()
>>> I guess what's more relevant here is to define the uAPI semantics for
>>> unready i.e. set_vq_ready(0) for resuming/stopping virtqueue 
>>> processing,
>>> as starting vq is comparatively less ambiguous.
>> Yes.
>>
>>> Considering the
>>> likelihood that this interface may be used for live migration, it would
>>> be nice to come up with variants such as 1) discard inflight request
>>> v.s. 2) waiting for inflight processing to be done,
>> Or inflight descriptor reporting (which seems to be tricky). But we
>> can start from net that a discarding may just work.
>>
>>> and 3) timeout in
>>> waiting.
>> Actually, that's the plan and Eugenio is proposing something like this
>> via virtio spec:
>>
>> https://urldefense.com/v3/__https://lists.oasis-open.org/archives/virtio-dev/202111/msg00020.html__;!!ACWV5N9M2RV99hQ!bcX6i6_atR-6Gcl-4q5Tekab_xDuXr7lDAMw2E1hilZ_1cZIX1c5mztQtvsnjiiy$ 
>>
> Thanks for the pointer, I seem to recall I saw it some time back 
> though I wonder if there's follow-up for the v3? My impression was 
> that this is still a work-in-progress spec proposal, while the 
> semantics of various F_STOP scenario is unclear yet and not all of the 
> requirements (ex: STOP_FAILED, rewind & !IN_ORDER) for live migration 
> do seem to get accommodated?


My understanding is that, the reason for STOP_FAILED and IN_ORDER is 
because we don't have a way to report inflight descriptors. We will try 
to overcome those by allow the device to report inflight descriptors in 
the next version.


>
>>
>>>> 2) userspace will call SET_VRING_ENABLE() when the device supports
>>>> otherwise it will use RESET.
>>> Are you looking to making virtqueue resume-able through the new
>>> SET_VRING_ENABLE() uAPI?
>>>
>>> I think RESET is inevitable in some case, i.e. when guest initiates
>>> device reset by writing 0 to the status register.
>> Yes, that's all my plan.
>>
>>> For suspend/resume and
>>> live migration use cases, indeed RESET can be substituted with
>>> SET_VRING_ENABLE. Again, it'd need quite some code refactoring to
>>> accommodate this change. Although I'm all for it, it'd be the best to
>>> lay out the plan for multiple phases rather than overload this single
>>> patch too much. You can count my time on this endeavor if you don't 
>>> mind. :)
>> You're welcome, I agree we should choose a way to go first:
>>
>> 1) manage to use SET_VRING_ENABLE (more like a workaround anyway)
> For networking device and the vq suspend/resume and live migration use 
> cases to support, I thought it might suffice?


Without config space change it would be sufficient. And anyhow the vDPA 
parent can prevent the config change if all the virtqueue is disabled.


> We may drop inflight or unused ones for Ethernet...


Yes.


> What other part do you think may limit its extension to become a 
> general uAPI or add new uAPI to address similar VQ stop requirement if 
> need be? 


For networking, we don't need other.


> Or we might well define subsystem specific uAPI to stop the virtqueue, 
> for vdpa device specifically?


Anyhow we need a uAPI consider we have some parent that doesn't support 
virtqueue stop. So this could be another way to go.

But if we decide to bother with new uAPI, I would rather go with a new 
uAPI for stop the device. It can help for the config space change as well.


> I think the point here is given that we would like to avoid guest side 
> modification to support live migration, we can define specific uAPI 
> for specific live migration requirement without having to involve 
> guest driver change. It'd be easy to get started this way and 
> generalize them all to a full blown _S_STOP when things are eventually 
> settled.


Yes, note that the status seen by guest is mediated by the hypervisor. 
So the hypervisor can choose not to hide the _S_STOP from the guest to 
keep the migration work without modifications in the guest driver.


>
>> 2) go with virtio-spec (may take a while)
> I feel it might be still quite early for now to get to a full blown 
> _S_STOP spec level amendment that works for all types of virtio 
> (vendor) devices. Generally there can be very specific 
> subsystem-dependent ways to stop each type of virtio devices that 
> satisfies the live migration of virtio subsystem devices.


Yes.


> For now the discussion mostly concerns with vq index rewind, inflight 
> handling, notification interrupt and configuration space such kind of 
> virtio level things, but real device backend has implication on the 
> other parts such as the order of IO/DMA quiescing and interrupt masking.


It's the charge of the vDPA parent to perform any necessary quiescing to 
satisfy the semantic of _S_STOP, it's an implementation detail which is 
out of the scope of the spec.


> If the subsystem virtio guest drivers today somehow don't support any 
> of those _S_STOP new behaviors, I guess it's with little point to 
> introduce the same or similar _S_STOP functionality to the guest 
> driver to effectively support live migration.


See above, the live migration is transparent to the guest. For the 
driver that doesn't support _S_STOP, we can still live migrate it. The 
only interesting part is nesting: if we want to live migrate a nested 
guest we need to the guest driver must support _S_STOP.

Thanks


>
>
> Thanks,
> -Siwei
>> 3) don't wait for the spec, have a vDPA specific uAPI first. Note that
>> I've chatted with most of the vendors and they seem to be fine with
>> the _S_STOP. If we go this way, we can still provide the forward
>> compatibility of _S_STOP
>> 4) or do them all (in parallel)
>>
>> Any thoughts?
>>
>> Thanks
>>
>>>> And for safety, I suggest tagging this as 7.1.
>>> +1
>>>
>>> Regards,
>>> -Siwei
>>>
>>>>> ---
>>>>> v4 --> v3
>>>>>       Nothing changed, becasue of issue with mimecast,
>>>>>       when the From: tag is different from the sender,
>>>>>       the some mail client will take the patch as an
>>>>>       attachment, RESEND v3 does not work, So resend
>>>>>       the patch as v4
>>>>>
>>>>> v3 --> v2:
>>>>>       Call vhost_dev_reset() at the end of vhost_net_stop().
>>>>>
>>>>>       Since the vDPA device need re-add the status bit
>>>>>       VIRTIO_CONFIG_S_ACKNOWLEDGE and VIRTIO_CONFIG_S_DRIVER,
>>>>>       simply, add them inside vhost_vdpa_reset_device, and
>>>>>       the only way calling vhost_vdpa_reset_device is in
>>>>>       vhost_net_stop(), so it keeps the same behavior as before.
>>>>>
>>>>> v2 --> v1:
>>>>>      Implement a new function vhost_dev_reset,
>>>>>      reset the backend kernel device at last.
>>>>> ---
>>>>>    hw/net/vhost_net.c        | 24 +++++++++++++++++++++---
>>>>>    hw/virtio/vhost-vdpa.c    | 15 +++++++++------
>>>>>    hw/virtio/vhost.c         | 15 ++++++++++++++-
>>>>>    include/hw/virtio/vhost.h |  1 +
>>>>>    4 files changed, 45 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
>>>>> index 30379d2..422c9bf 100644
>>>>> --- a/hw/net/vhost_net.c
>>>>> +++ b/hw/net/vhost_net.c
>>>>> @@ -325,7 +325,7 @@ int vhost_net_start(VirtIODevice *dev, 
>>>>> NetClientState *ncs,
>>>>>        int total_notifiers = data_queue_pairs * 2 + cvq;
>>>>>        VirtIONet *n = VIRTIO_NET(dev);
>>>>>        int nvhosts = data_queue_pairs + cvq;
>>>>> -    struct vhost_net *net;
>>>>> +    struct vhost_net *net = NULL;
>>>>>        int r, e, i, index_end = data_queue_pairs * 2;
>>>>>        NetClientState *peer;
>>>>>
>>>>> @@ -391,8 +391,17 @@ int vhost_net_start(VirtIODevice *dev, 
>>>>> NetClientState *ncs,
>>>>>    err_start:
>>>>>        while (--i >= 0) {
>>>>>            peer = qemu_get_peer(ncs , i);
>>>>> -        vhost_net_stop_one(get_vhost_net(peer), dev);
>>>>> +
>>>>> +        net = get_vhost_net(peer);
>>>>> +
>>>>> +        vhost_net_stop_one(net, dev);
>>>>>        }
>>>>> +
>>>>> +    /* We only reset backend vdpa device */
>>>>> +    if (net && net->dev.vhost_ops->backend_type == 
>>>>> VHOST_BACKEND_TYPE_VDPA) {
>>>>> +        vhost_dev_reset(&net->dev);
>>>>> +    }
>>>>> +
>>>>>        e = k->set_guest_notifiers(qbus->parent, total_notifiers, 
>>>>> false);
>>>>>        if (e < 0) {
>>>>>            fprintf(stderr, "vhost guest notifier cleanup failed: 
>>>>> %d\n", e);
>>>>> @@ -410,6 +419,7 @@ void vhost_net_stop(VirtIODevice *dev, 
>>>>> NetClientState *ncs,
>>>>>        VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(vbus);
>>>>>        VirtIONet *n = VIRTIO_NET(dev);
>>>>>        NetClientState *peer;
>>>>> +    struct vhost_net *net = NULL;
>>>>>        int total_notifiers = data_queue_pairs * 2 + cvq;
>>>>>        int nvhosts = data_queue_pairs + cvq;
>>>>>        int i, r;
>>>>> @@ -420,7 +430,15 @@ void vhost_net_stop(VirtIODevice *dev, 
>>>>> NetClientState *ncs,
>>>>>            } else {
>>>>>                peer = qemu_get_peer(ncs, n->max_queue_pairs);
>>>>>            }
>>>>> -        vhost_net_stop_one(get_vhost_net(peer), dev);
>>>>> +
>>>>> +        net = get_vhost_net(peer);
>>>>> +
>>>>> +        vhost_net_stop_one(net, dev);
>>>>> +    }
>>>>> +
>>>>> +    /* We only reset backend vdpa device */
>>>>> +    if (net && net->dev.vhost_ops->backend_type == 
>>>>> VHOST_BACKEND_TYPE_VDPA) {
>>>>> +        vhost_dev_reset(&net->dev);
>>>>>        }
>>>> So we've already reset the device in vhost_vdpa_dev_start(), any
>>>> reason we need to do it again here?
>>>>
>>>>>        r = k->set_guest_notifiers(qbus->parent, total_notifiers, 
>>>>> false);
>>>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>>>> index c5ed7a3..3ef0199 100644
>>>>> --- a/hw/virtio/vhost-vdpa.c
>>>>> +++ b/hw/virtio/vhost-vdpa.c
>>>>> @@ -708,6 +708,11 @@ static int vhost_vdpa_reset_device(struct 
>>>>> vhost_dev *dev)
>>>>>
>>>>>        ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
>>>>>        trace_vhost_vdpa_reset_device(dev, status);
>>>>> +
>>>>> +    /* Add back this status, so that the device could work next 
>>>>> time*/
>>>>> +    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>>>>> +                               VIRTIO_CONFIG_S_DRIVER);
>>>> This seems to contradict the semantic of reset.
>>>>
>>>>> +
>>>>>        return ret;
>>>>>    }
>>>>>
>>>>> @@ -719,14 +724,14 @@ static int vhost_vdpa_get_vq_index(struct 
>>>>> vhost_dev *dev, int idx)
>>>>>        return idx;
>>>>>    }
>>>>>
>>>>> -static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
>>>>> +static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev, 
>>>>> unsigned int ready)
>>>>>    {
>>>>>        int i;
>>>>>        trace_vhost_vdpa_set_vring_ready(dev);
>>>>>        for (i = 0; i < dev->nvqs; ++i) {
>>>>>            struct vhost_vring_state state = {
>>>>>                .index = dev->vq_index + i,
>>>>> -            .num = 1,
>>>>> +            .num = ready,
>>>>>            };
>>>>>            vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
>>>>>        }
>>>>> @@ -1088,8 +1093,9 @@ static int vhost_vdpa_dev_start(struct 
>>>>> vhost_dev *dev, bool started)
>>>>>            if (unlikely(!ok)) {
>>>>>                return -1;
>>>>>            }
>>>>> -        vhost_vdpa_set_vring_ready(dev);
>>>>> +        vhost_vdpa_set_vring_ready(dev, 1);
>>>>>        } else {
>>>>> +        vhost_vdpa_set_vring_ready(dev, 0);
>>>>>            ok = vhost_vdpa_svqs_stop(dev);
>>>>>            if (unlikely(!ok)) {
>>>>>                return -1;
>>>>> @@ -1105,9 +1111,6 @@ static int vhost_vdpa_dev_start(struct 
>>>>> vhost_dev *dev, bool started)
>>>>>            memory_listener_register(&v->listener, 
>>>>> &address_space_memory);
>>>>>            return vhost_vdpa_add_status(dev, 
>>>>> VIRTIO_CONFIG_S_DRIVER_OK);
>>>>>        } else {
>>>>> -        vhost_vdpa_reset_device(dev);
>>>>> -        vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>>>>> - VIRTIO_CONFIG_S_DRIVER);
>>>>> memory_listener_unregister(&v->listener);
>>>>>
>>>>>            return 0;
>>>>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>>>>> index b643f42..7e0cdb6 100644
>>>>> --- a/hw/virtio/vhost.c
>>>>> +++ b/hw/virtio/vhost.c
>>>>> @@ -1820,7 +1820,6 @@ fail_features:
>>>>>    void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
>>>>>    {
>>>>>        int i;
>>>>> -
>>>> Unnecessary changes.
>>>>
>>>>>        /* should only be called after backend is connected */
>>>>>        assert(hdev->vhost_ops);
>>>>>
>>>>> @@ -1854,3 +1853,17 @@ int vhost_net_set_backend(struct vhost_dev 
>>>>> *hdev,
>>>>>
>>>>>        return -ENOSYS;
>>>>>    }
>>>>> +
>>>>> +int vhost_dev_reset(struct vhost_dev *hdev)
>>>>> +{
>>>> Let's use a separate patch for this.
>>>>
>>>> Thanks
>>>>
>>>>> +    int ret = 0;
>>>>> +
>>>>> +    /* should only be called after backend is connected */
>>>>> +    assert(hdev->vhost_ops);
>>>>> +
>>>>> +    if (hdev->vhost_ops->vhost_reset_device) {
>>>>> +        ret = hdev->vhost_ops->vhost_reset_device(hdev);
>>>>> +    }
>>>>> +
>>>>> +    return ret;
>>>>> +}
>>>>> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
>>>>> index 58a73e7..b8b7c20 100644
>>>>> --- a/include/hw/virtio/vhost.h
>>>>> +++ b/include/hw/virtio/vhost.h
>>>>> @@ -114,6 +114,7 @@ int vhost_dev_init(struct vhost_dev *hdev, 
>>>>> void *opaque,
>>>>>    void vhost_dev_cleanup(struct vhost_dev *hdev);
>>>>>    int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev);
>>>>>    void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev);
>>>>> +int vhost_dev_reset(struct vhost_dev *hdev);
>>>>>    int vhost_dev_enable_notifiers(struct vhost_dev *hdev, 
>>>>> VirtIODevice *vdev);
>>>>>    void vhost_dev_disable_notifiers(struct vhost_dev *hdev, 
>>>>> VirtIODevice *vdev);
>>>>>
>>>>> -- 
>>>>> 1.8.3.1
>>>>>
>>>>>
>>>>>
>


