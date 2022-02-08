Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB284AD583
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 11:32:09 +0100 (CET)
Received: from localhost ([::1]:34708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHNn6-0005Io-GK
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 05:32:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nHMOk-0001LE-Tr
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 04:02:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nHMOi-0008T1-05
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 04:02:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644310971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dpeY1R38SacMlMl4XDAae/BLveAIcxigUlqWr1q3zgM=;
 b=fDyqikKaisSjgEzaVqHg3AoOjCgeWWuOsPJnD3lEymAlWAZFjVxi/0LJlR/M+KD2d5EkAj
 wSTzfPBv8WeXdzbCHVnG2nBk3RHRp/Wke+UukIgVaO8TNt98MbmNPcCnZm7zGdIMGEQRtN
 mSy+ABb9f1g6Bh6B3ngsmdQmzgRJqlc=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-4X7saXXXOPO3xACSRYajrQ-1; Tue, 08 Feb 2022 04:02:48 -0500
X-MC-Unique: 4X7saXXXOPO3xACSRYajrQ-1
Received: by mail-pf1-f198.google.com with SMTP id
 m200-20020a628cd1000000b004c7473d8cb5so9327231pfd.5
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 01:02:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dpeY1R38SacMlMl4XDAae/BLveAIcxigUlqWr1q3zgM=;
 b=SqvKPfG8IxGsYloVNw48BD75Amfnu32vHH3GbOnF+/KMNGccbuBOCT+rW9eaTXUVDN
 ZlpSbQmMDF02t7g/bGEyoAHqgIq+Vs3yx+Rx422w8Z6SQ8/ReguSl/78NsCc9J6Oz1S8
 VGbhAln/k9mu3Ex1v7OPDHxHWVjAyPrf0MGHfZd9FPmHkJXj9ruHWf1Wyn4qojWn4WFA
 x8mhGutntU4wk7JzCky+KURvK8tiq4HiX2qnb2RxAWUc2dBd0u6n1q95mC3LMsht6QOe
 Ym1RrpJWLj7vwlX0EqlHgW7z7tE9xRUZQEPONjBx8vMhS5A6zPgRoDr6V36A8vHfRM16
 CFrQ==
X-Gm-Message-State: AOAM533tkFOKXrAp9F7zELbEVH8jLDaMMHkyNnJWFwYQzFiPmFwifS6w
 S6zLg9wbUg7XYePAdwWzlTn9bXyJnH9FV2fic9JcfNtMZ6uDQ4wAUtnq1imKpR1bE9HHMexK3ne
 9WBleePMqMMs0HKw=
X-Received: by 2002:a63:14b:: with SMTP id 72mr2727834pgb.444.1644310966786;
 Tue, 08 Feb 2022 01:02:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzU2MVcMgq99QdyibSPPKQYJUcFtYLcJHS8oqLoJFM8OfEYzQ0hWK/Fm9CEWSsWJvKiq54Fqw==
X-Received: by 2002:a63:14b:: with SMTP id 72mr2727787pgb.444.1644310966297;
 Tue, 08 Feb 2022 01:02:46 -0800 (PST)
Received: from [10.72.13.12] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id om18sm2124298pjb.39.2022.02.08.01.02.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 01:02:45 -0800 (PST)
Message-ID: <05de0101-6481-22fd-e2f8-2fa3213f47a1@redhat.com>
Date: Tue, 8 Feb 2022 17:02:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 06/31] vhost: Route guest->host notification through
 shadow virtqueue
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-7-eperezma@redhat.com>
 <2cb2415b-7d8b-6187-c202-27e8f26410a4@redhat.com>
 <CAJaqyWeRbmwW80q3q52nFw=iz1xcPRFviFaRHo0nzXpEb+3m3A@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWeRbmwW80q3q52nFw=iz1xcPRFviFaRHo0nzXpEb+3m3A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/1/31 下午7:33, Eugenio Perez Martin 写道:
> On Fri, Jan 28, 2022 at 7:57 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2022/1/22 上午4:27, Eugenio Pérez 写道:
>>> At this moment no buffer forwarding will be performed in SVQ mode: Qemu
>>> just forward the guest's kicks to the device. This commit also set up
>>> SVQs in the vhost device.
>>>
>>> Host memory notifiers regions are left out for simplicity, and they will
>>> not be addressed in this series.
>>
>> I wonder if it's better to squash this into patch 5 since it gives us a
>> full guest->host forwarding.
>>
> I'm fine with that if you think it makes the review easier.


Yes please.


>
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>> ---
>>>    include/hw/virtio/vhost-vdpa.h |   4 ++
>>>    hw/virtio/vhost-vdpa.c         | 122 ++++++++++++++++++++++++++++++++-
>>>    2 files changed, 124 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
>>> index 3ce79a646d..009a9f3b6b 100644
>>> --- a/include/hw/virtio/vhost-vdpa.h
>>> +++ b/include/hw/virtio/vhost-vdpa.h
>>> @@ -12,6 +12,8 @@
>>>    #ifndef HW_VIRTIO_VHOST_VDPA_H
>>>    #define HW_VIRTIO_VHOST_VDPA_H
>>>
>>> +#include <gmodule.h>
>>> +
>>>    #include "hw/virtio/virtio.h"
>>>    #include "standard-headers/linux/vhost_types.h"
>>>
>>> @@ -27,6 +29,8 @@ typedef struct vhost_vdpa {
>>>        bool iotlb_batch_begin_sent;
>>>        MemoryListener listener;
>>>        struct vhost_vdpa_iova_range iova_range;
>>> +    bool shadow_vqs_enabled;
>>> +    GPtrArray *shadow_vqs;
>>>        struct vhost_dev *dev;
>>>        VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
>>>    } VhostVDPA;
>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>> index 6c10a7f05f..18de14f0fb 100644
>>> --- a/hw/virtio/vhost-vdpa.c
>>> +++ b/hw/virtio/vhost-vdpa.c
>>> @@ -17,12 +17,14 @@
>>>    #include "hw/virtio/vhost.h"
>>>    #include "hw/virtio/vhost-backend.h"
>>>    #include "hw/virtio/virtio-net.h"
>>> +#include "hw/virtio/vhost-shadow-virtqueue.h"
>>>    #include "hw/virtio/vhost-vdpa.h"
>>>    #include "exec/address-spaces.h"
>>>    #include "qemu/main-loop.h"
>>>    #include "cpu.h"
>>>    #include "trace.h"
>>>    #include "qemu-common.h"
>>> +#include "qapi/error.h"
>>>
>>>    /*
>>>     * Return one past the end of the end of section. Be careful with uint64_t
>>> @@ -409,8 +411,14 @@ err:
>>>
>>>    static void vhost_vdpa_host_notifiers_init(struct vhost_dev *dev)
>>>    {
>>> +    struct vhost_vdpa *v = dev->opaque;
>>>        int i;
>>>
>>> +    if (v->shadow_vqs_enabled) {
>>> +        /* SVQ is not compatible with host notifiers mr */
>>
>> I guess there should be a TODO or FIXME here.
>>
> Sure I can add it.
>
>>> +        return;
>>> +    }
>>> +
>>>        for (i = dev->vq_index; i < dev->vq_index + dev->nvqs; i++) {
>>>            if (vhost_vdpa_host_notifier_init(dev, i)) {
>>>                goto err;
>>> @@ -424,6 +432,17 @@ err:
>>>        return;
>>>    }
>>>
>>> +static void vhost_vdpa_svq_cleanup(struct vhost_dev *dev)
>>> +{
>>> +    struct vhost_vdpa *v = dev->opaque;
>>> +    size_t idx;
>>> +
>>> +    for (idx = 0; idx < v->shadow_vqs->len; ++idx) {
>>> +        vhost_svq_stop(g_ptr_array_index(v->shadow_vqs, idx));
>>> +    }
>>> +    g_ptr_array_free(v->shadow_vqs, true);
>>> +}
>>> +
>>>    static int vhost_vdpa_cleanup(struct vhost_dev *dev)
>>>    {
>>>        struct vhost_vdpa *v;
>>> @@ -432,6 +451,7 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev)
>>>        trace_vhost_vdpa_cleanup(dev, v);
>>>        vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
>>>        memory_listener_unregister(&v->listener);
>>> +    vhost_vdpa_svq_cleanup(dev);
>>>
>>>        dev->opaque = NULL;
>>>        ram_block_discard_disable(false);
>>> @@ -507,9 +527,15 @@ static int vhost_vdpa_get_device_id(struct vhost_dev *dev,
>>>
>>>    static int vhost_vdpa_reset_device(struct vhost_dev *dev)
>>>    {
>>> +    struct vhost_vdpa *v = dev->opaque;
>>>        int ret;
>>>        uint8_t status = 0;
>>>
>>> +    for (unsigned i = 0; i < v->shadow_vqs->len; ++i) {
>>> +        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, i);
>>> +        vhost_svq_stop(svq);
>>> +    }
>>> +
>>>        ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
>>>        trace_vhost_vdpa_reset_device(dev, status);
>>>        return ret;
>>> @@ -639,13 +665,28 @@ static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
>>>        return ret;
>>>    }
>>>
>>> -static int vhost_vdpa_set_vring_kick(struct vhost_dev *dev,
>>> -                                       struct vhost_vring_file *file)
>>> +static int vhost_vdpa_set_vring_dev_kick(struct vhost_dev *dev,
>>> +                                         struct vhost_vring_file *file)
>>>    {
>>>        trace_vhost_vdpa_set_vring_kick(dev, file->index, file->fd);
>>>        return vhost_vdpa_call(dev, VHOST_SET_VRING_KICK, file);
>>>    }
>>>
>>> +static int vhost_vdpa_set_vring_kick(struct vhost_dev *dev,
>>> +                                       struct vhost_vring_file *file)
>>> +{
>>> +    struct vhost_vdpa *v = dev->opaque;
>>> +    int vdpa_idx = vhost_vdpa_get_vq_index(dev, file->index);
>>> +
>>> +    if (v->shadow_vqs_enabled) {
>>> +        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, vdpa_idx);
>>> +        vhost_svq_set_svq_kick_fd(svq, file->fd);
>>> +        return 0;
>>> +    } else {
>>> +        return vhost_vdpa_set_vring_dev_kick(dev, file);
>>> +    }
>>> +}
>>> +
>>>    static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
>>>                                           struct vhost_vring_file *file)
>>>    {
>>> @@ -653,6 +694,33 @@ static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
>>>        return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
>>>    }
>>>
>>> +/**
>>> + * Set shadow virtqueue descriptors to the device
>>> + *
>>> + * @dev   The vhost device model
>>> + * @svq   The shadow virtqueue
>>> + * @idx   The index of the virtqueue in the vhost device
>>> + */
>>> +static bool vhost_vdpa_svq_setup(struct vhost_dev *dev,
>>> +                                VhostShadowVirtqueue *svq,
>>> +                                unsigned idx)
>>> +{
>>> +    struct vhost_vring_file file = {
>>> +        .index = dev->vq_index + idx,
>>> +    };
>>> +    const EventNotifier *event_notifier;
>>> +    int r;
>>> +
>>> +    event_notifier = vhost_svq_get_dev_kick_notifier(svq);
>>
>> A question, any reason for making VhostShadowVirtqueue private? If we
>> export it in .h we don't need helper to access its member like
>> vhost_svq_get_dev_kick_notifier().
>>
> To export it it's always a possibility of course, but that direct
> access will not be thread safe if we decide to move SVQ to its own
> iothread for example.


I don't get this, maybe you can give me an example.


>
> I feel it will be easier to work with it this way but it might be that
> I'm just used to making as much as possible private. Not like it's
> needed to use the helpers in the hot paths, only in the setup and
> teardown.
>
>> Note that vhost_dev is a public structure.
>>
> Sure we could embed in vhost_virtqueue if we choose to do it that way,
> for example.
>
>>> +    file.fd = event_notifier_get_fd(event_notifier);
>>> +    r = vhost_vdpa_set_vring_dev_kick(dev, &file);
>>> +    if (unlikely(r != 0)) {
>>> +        error_report("Can't set device kick fd (%d)", -r);
>>> +    }
>>
>> I wonder whether or not we can generalize the logic here and
>> vhost_vdpa_set_vring_kick(). There's nothing vdpa specific unless the
>> vhost_ops->set_vring_kick().
>>
> If we call vhost_ops->set_vring_kick we are setting guest->SVQ kick
> notifier, not SVQ -> vDPA device, because the
> if(v->shadow_vqs_enabled). All of the modified ops callbacks are
> hiding the actual device from the vhost subsystem so we need to
> explicitly use the newly created _dev_ ones.


Ok, I'm fine to start with vhost_vdpa specific code.


>
>>> +
>>> +    return r == 0;
>>> +}
>>> +
>>>    static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>>>    {
>>>        struct vhost_vdpa *v = dev->opaque;
>>> @@ -660,6 +728,13 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>>>
>>>        if (started) {
>>>            vhost_vdpa_host_notifiers_init(dev);
>>> +        for (unsigned i = 0; i < v->shadow_vqs->len; ++i) {
>>> +            VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, i);
>>> +            bool ok = vhost_vdpa_svq_setup(dev, svq, i);
>>> +            if (unlikely(!ok)) {
>>> +                return -1;
>>> +            }
>>> +        }
>>>            vhost_vdpa_set_vring_ready(dev);
>>>        } else {
>>>            vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
>>> @@ -737,6 +812,41 @@ static bool  vhost_vdpa_force_iommu(struct vhost_dev *dev)
>>>        return true;
>>>    }
>>>
>>> +/**
>>> + * Adaptor function to free shadow virtqueue through gpointer
>>> + *
>>> + * @svq   The Shadow Virtqueue
>>> + */
>>> +static void vhost_psvq_free(gpointer svq)
>>> +{
>>> +    vhost_svq_free(svq);
>>> +}
>>
>> Any reason for such indirection? Can we simply use vhost_svq_free()?
>>
> GCC complains about different types. I think we could do a function
> type cast and it's valid for every architecture qemu supports, but the
> indirection seems cleaner to me, and I would be surprised if the
> compiler does not optimize it away in the cases that the casting are
> valid.
>
> ../hw/virtio/vhost-vdpa.c:1186:60: error: incompatible function
> pointer types passing 'void (VhostShadowVirtqueue *)' (aka 'void
> (struct VhostShadowVirtqueue *)') to parameter of type
> 'GDestroyNotify' (aka 'void (*)(void *)')


Or just change vhost_svq_free() to take gpointer instead? Then we don't 
need a cast.

Thanks

>
> Thanks!
>
>> Thanks
>>
>>
>>> +
>>> +static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
>>> +                               Error **errp)
>>> +{
>>> +    size_t n_svqs = v->shadow_vqs_enabled ? hdev->nvqs : 0;
>>> +    g_autoptr(GPtrArray) shadow_vqs = g_ptr_array_new_full(n_svqs,
>>> +                                                           vhost_psvq_free);
>>> +    if (!v->shadow_vqs_enabled) {
>>> +        goto out;
>>> +    }
>>> +
>>> +    for (unsigned n = 0; n < hdev->nvqs; ++n) {
>>> +        VhostShadowVirtqueue *svq = vhost_svq_new();
>>> +
>>> +        if (unlikely(!svq)) {
>>> +            error_setg(errp, "Cannot create svq %u", n);
>>> +            return -1;
>>> +        }
>>> +        g_ptr_array_add(v->shadow_vqs, svq);
>>> +    }
>>> +
>>> +out:
>>> +    v->shadow_vqs = g_steal_pointer(&shadow_vqs);
>>> +    return 0;
>>> +}
>>> +
>>>    static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
>>>    {
>>>        struct vhost_vdpa *v;
>>> @@ -759,6 +869,10 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
>>>        dev->opaque =  opaque ;
>>>        v->listener = vhost_vdpa_memory_listener;
>>>        v->msg_type = VHOST_IOTLB_MSG_V2;
>>> +    ret = vhost_vdpa_init_svq(dev, v, errp);
>>> +    if (ret) {
>>> +        goto err;
>>> +    }
>>>
>>>        vhost_vdpa_get_iova_range(v);
>>>
>>> @@ -770,6 +884,10 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
>>>                                   VIRTIO_CONFIG_S_DRIVER);
>>>
>>>        return 0;
>>> +
>>> +err:
>>> +    ram_block_discard_disable(false);
>>> +    return ret;
>>>    }
>>>
>>>    const VhostOps vdpa_ops = {


