Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EECE3E0EF0
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 09:11:42 +0200 (CEST)
Received: from localhost ([::1]:37696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBXXZ-000441-Bl
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 03:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mBXWh-0003Ca-M2
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 03:10:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mBXWf-0003gc-PO
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 03:10:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628147444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/nDiEjROyAODcdC4JQYoqS2KBDBzgJCKzLuzX5cvOgw=;
 b=itNkzBV6h1V/PWmymDrUAla+anrWTvD8jvrxJ1BE5ukVW0aJhvG0NqpR9Ws33bYsd2TK8S
 ggfgcUVLugaHeWWDMhkHuUtnDaoNXcmEj6foWRNRICHpm85/ztVuh2IQiXGUlD/0meZ84f
 SZ53Jfrtg8r5fpxxQLflvRNbVkUD7dg=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-VA2SxH1mPHW6KARGJzOQbA-1; Thu, 05 Aug 2021 03:10:43 -0400
X-MC-Unique: VA2SxH1mPHW6KARGJzOQbA-1
Received: by mail-pj1-f72.google.com with SMTP id
 h21-20020a17090adb95b029017797967ffbso4928487pjv.5
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 00:10:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=/nDiEjROyAODcdC4JQYoqS2KBDBzgJCKzLuzX5cvOgw=;
 b=bfy/Xsw/6chGEAo9Zkj0MdhBTyHJhPrOzEBdycc6y3e9KaNVIakhwfzR94xjfaaPL2
 LWF1p6Qw4aJRr6kllzAiV2EkO00ZDRaj91UR6CX2rIaX3KTZTQJx1vQN+JlJao+i7YuN
 nKdYFRWXHdw95yd8Z6/5D1PB9APTychbrBPWJE5/Ln1DlmgCns4JUuYVtYzL87il7vnc
 EIrJdA3h3kGBKqxvBdqJZVJhxoRLbVCTQq5VFxonyl0iHQul8C+SYG0uLgSOaSgNbh+s
 UO7lBGmgNwdOIR51+Yc6d41XasT6Wzo1e3KXH34csqeBqc6IN5ECHhuBOtRMJedpT2on
 47BA==
X-Gm-Message-State: AOAM5306gSEaI6jpRP+sZvCxVNgbM8aq226DALUw+8Kd95N8WYNZ6VyE
 f1ShPKrqmC0vxEQX8vhbDEmSH0HMpsj/Pgs5QCbg4rBSnC7p9oFEv+bz4AVmCCjZjDZR1n2EEuR
 pdwGRwYUowPDw2a4=
X-Received: by 2002:a62:7704:0:b029:3c4:5678:ebf9 with SMTP id
 s4-20020a6277040000b02903c45678ebf9mr3412467pfc.45.1628147442331; 
 Thu, 05 Aug 2021 00:10:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQ5Vl0rv6AJxAdLqUnXplqFanlEjYSWjpekkLiUNiu2a4qKN/vVTWJ3NACJcGKCv+rS6BwsQ==
X-Received: by 2002:a62:7704:0:b029:3c4:5678:ebf9 with SMTP id
 s4-20020a6277040000b02903c45678ebf9mr3412444pfc.45.1628147442042; 
 Thu, 05 Aug 2021 00:10:42 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id v63sm4245483pgv.59.2021.08.05.00.10.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 00:10:41 -0700 (PDT)
Subject: Re: [RFC PATCH] vhost-vdpa: Do not send empty IOTLB update batches
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20210804144402.711594-1-eperezma@redhat.com>
 <CACGkMEuW166WvHeB63aoTvYinqK4u_8hDBFHtUXoexWkQy8PpA@mail.gmail.com>
 <CAJaqyWeQFjG5k1Savtui3cEbha37SUu5WrvObWP+o9Rp=UOA3Q@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <4b384df7-f0ca-2dd0-a7d8-06a7e82176ae@redhat.com>
Date: Thu, 5 Aug 2021 15:10:37 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAJaqyWeQFjG5k1Savtui3cEbha37SUu5WrvObWP+o9Rp=UOA3Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eli Cohen <elic@nvidia.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/8/5 下午3:04, Eugenio Perez Martin 写道:
> On Thu, Aug 5, 2021 at 8:16 AM Jason Wang <jasowang@redhat.com> wrote:
>> On Wed, Aug 4, 2021 at 10:44 PM Eugenio Pérez <eperezma@redhat.com> wrote:
>>> With the introduction of the batch hinting, meaningless batches can be
>>> created with no IOTLB updates if the memory region was skipped by
>>> vhost_vdpa_listener_skipped_section. This is the case of host notifiers
>>> memory regions, but others could fall on this category. This caused the
>>> vdpa device to receive dma mapping settings with no changes, a possibly
>>> expensive operation for nothing.
>>>
>>> To avoid that, VHOST_IOTLB_BATCH_BEGIN hint is delayed until we have a
>>> meaningful (not skipped section) mapping or unmapping operation, and
>>> VHOST_IOTLB_BATCH_END is not written unless at least one of _UPDATE /
>>> _INVALIDATE has been issued.
>> Hi Eugeni:
>>
>> This should work but it looks to me it's better to optimize the kernel.
>>
>> E.g to make sure we don't send set_map() if there is no real updating
>> between batch start and end.
>>
> Hi Jason,
>
> I think we should do both in parallel anyway.


Ok, I'm fine with this.


>   We also obtain an
> (unmeasured at this moment) decrease in startup time for qemu with
> vdpa this way, for example. I consider that this particular RFC has
> room to improve or change totally of course.
>
> I've made these changes in the kernel too, just counting the number of
> memory updates and not calling set_map if no actual changes have been
> made.


Right, that is what we want to have.


>
>> This makes sure that it can work for all kinds of userspace (not only for Qemu).
>>
>> Another optimization is to batch the memory region transaction by adding:
>>
>> memory_region_transaction_begin() and memory_region_transaction_end() in
>>
>> both vhost_vdpa_host_notifiers_init() and vhost_vdpa_host_notifiers_uninit().
>>
>> This can make sure only at least one memory transactions when
>> adding/removing host notifier regions.
>>
> That solves the updates about memory regions, but it does not solve
> the case where updating memory regions are not interesting to the
> device.


Kind of, I guess with this we only get one more set_map().


> In other words, where all the changes meet
> vhost_vdpa_listener_skipped_section() == true. I did not spend a lot
> of time trying to raise these though, maybe it happens when
> hot-plugging a device, for example?


Yes, so transaction is per device optimization that can't help in this case.


>
> We could abstract these changes in memory_region_transaction_begin() /
> memory_region_transaction_end() wrappers though.
>
> Thanks!
>
>> Thanks
>>
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>> ---
>>>   include/hw/virtio/vhost-vdpa.h |  1 +
>>>   hw/virtio/vhost-vdpa.c         | 38 +++++++++++++++++++++++-----------
>>>   2 files changed, 27 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
>>> index e98e327f12..0a7edbe4eb 100644
>>> --- a/include/hw/virtio/vhost-vdpa.h
>>> +++ b/include/hw/virtio/vhost-vdpa.h
>>> @@ -23,6 +23,7 @@ typedef struct vhost_vdpa {
>>>       int device_fd;
>>>       int index;
>>>       uint32_t msg_type;
>>> +    size_t n_iotlb_sent_batch;


Not a native speaker but we probably need a better name, e.g "n_mr_updated?"


>>>       MemoryListener listener;
>>>       struct vhost_dev *dev;
>>>       VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>> index 6ce94a1f4d..2517fc6103 100644
>>> --- a/hw/virtio/vhost-vdpa.c
>>> +++ b/hw/virtio/vhost-vdpa.c
>>> @@ -89,19 +89,13 @@ static int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova,
>>>       return ret;
>>>   }
>>>
>>> -static void vhost_vdpa_listener_begin(MemoryListener *listener)
>>> +static void vhost_vdpa_listener_begin_batch(struct vhost_vdpa *v)
>>>   {
>>> -    struct vhost_vdpa *v = container_of(listener, struct vhost_vdpa, listener);
>>> -    struct vhost_dev *dev = v->dev;
>>> -    struct vhost_msg_v2 msg = {};
>>>       int fd = v->device_fd;
>>> -
>>> -    if (!(dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH))) {
>>> -        return;
>>> -    }
>>> -
>>> -    msg.type = v->msg_type;
>>> -    msg.iotlb.type = VHOST_IOTLB_BATCH_BEGIN;
>>> +    struct vhost_msg_v2 msg = {
>>> +        .type = v->msg_type,
>>> +        .iotlb.type = VHOST_IOTLB_BATCH_BEGIN,
>>> +    };
>>>
>>>       if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
>>>           error_report("failed to write, fd=%d, errno=%d (%s)",
>>> @@ -120,6 +114,11 @@ static void vhost_vdpa_listener_commit(MemoryListener *listener)
>>>           return;
>>>       }
>>>
>>> +    if (v->n_iotlb_sent_batch == 0) {
>>> +        return;
>>> +    }
>>> +
>>> +    v->n_iotlb_sent_batch = 0;
>>>       msg.type = v->msg_type;
>>>       msg.iotlb.type = VHOST_IOTLB_BATCH_END;
>>>
>>> @@ -170,6 +169,14 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
>>>
>>>       llsize = int128_sub(llend, int128_make64(iova));
>>>
>>> +    if (v->dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH)) {
>>> +        if (v->n_iotlb_sent_batch == 0) {
>>> +            vhost_vdpa_listener_begin_batch(v);
>>> +        }
>>> +
>>> +        v->n_iotlb_sent_batch++;
>>> +    }


Let abstract this as a helper to be reused by region_del.

Other looks good.

Thanks


>>> +
>>>       ret = vhost_vdpa_dma_map(v, iova, int128_get64(llsize),
>>>                                vaddr, section->readonly);
>>>       if (ret) {
>>> @@ -221,6 +228,14 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
>>>
>>>       llsize = int128_sub(llend, int128_make64(iova));
>>>
>>> +    if (v->dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH)) {
>>> +        if (v->n_iotlb_sent_batch == 0) {
>>> +            vhost_vdpa_listener_begin_batch(v);
>>> +        }
>>> +
>>> +        v->n_iotlb_sent_batch++;
>>> +    }
>>> +
>>>       ret = vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
>>>       if (ret) {
>>>           error_report("vhost_vdpa dma unmap error!");
>>> @@ -234,7 +249,6 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
>>>    * depends on the addnop().
>>>    */
>>>   static const MemoryListener vhost_vdpa_memory_listener = {
>>> -    .begin = vhost_vdpa_listener_begin,
>>>       .commit = vhost_vdpa_listener_commit,
>>>       .region_add = vhost_vdpa_listener_region_add,
>>>       .region_del = vhost_vdpa_listener_region_del,
>>> --
>>> 2.27.0
>>>


