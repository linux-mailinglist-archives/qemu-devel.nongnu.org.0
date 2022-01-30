Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F079F4A3403
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 05:45:53 +0100 (CET)
Received: from localhost ([::1]:58482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nE264-0006eU-JT
	for lists+qemu-devel@lfdr.de; Sat, 29 Jan 2022 23:45:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nE23b-0005xj-2o
 for qemu-devel@nongnu.org; Sat, 29 Jan 2022 23:43:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nE23N-0003Ku-0A
 for qemu-devel@nongnu.org; Sat, 29 Jan 2022 23:43:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643517783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b2drNTCNkwJABK5/bzrkE2Qv3Y+XGpam7FKWmJlBdG8=;
 b=ZVnidb+GyHpZZ1HRMiYP7/jx97khkXHuMD+WhZppOwN6FTgVORRbFzPeF6pBt2ElcbwW3o
 B7VQuVPnBoSz6HDoFdsodWNiyCTiqbeqct6eHgCNPCj9aNurfYTyjMaQJ+jAgmE2d6uWzR
 rIk79n/czMotLWRkyD/Ow4LHsxCu11c=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-g_Kq9I2pNjKvr8sFUf-M-Q-1; Sat, 29 Jan 2022 23:43:01 -0500
X-MC-Unique: g_Kq9I2pNjKvr8sFUf-M-Q-1
Received: by mail-pj1-f72.google.com with SMTP id
 n3-20020a17090a2bc300b001b5bced2cf9so8971216pje.3
 for <qemu-devel@nongnu.org>; Sat, 29 Jan 2022 20:43:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b2drNTCNkwJABK5/bzrkE2Qv3Y+XGpam7FKWmJlBdG8=;
 b=foD6prUgFrHpPPLhDwH71zK/FbqDokPnhVqC8GVRSGUJ208IHPHMftbVGv6LJN8dpa
 e0Aze0IWkTnk2mXLKZ+3HuTvrEMAFTpH2kH2m9Rz0khn2ZBOMjMjgNwRZG5aIYRIffGP
 FBZuBxzECwpKzvX62xa0Hu1BuRKyOelD+DN5UE54cdWg2fI42aDJv2zlZllwS5ucyx4N
 o135cbsQO7xgvRbIOnZI3l+p/efxr50A9bw0CFUr0CC5tRIlSANWSR4wbkxeSgUFsW+f
 ovDaAR6319JboussGB9Czo1K3gfzD3mLv5k7zToAgDb27eR9PbYzu+LJNlaa5o5UXea+
 QqxA==
X-Gm-Message-State: AOAM531j26C+AbI1N/xjS+aREEEGddZOiZwQ/qfvwas0YklfpSqWlGZj
 N4DwbPxZ8SDBuB92ouTScyoiWeu7nFXQIBQNNLfbWmmZawe9ilA4M/w3RvJ/ie8/QBaJx8PYTVE
 51TFPB53PFKA02H0=
X-Received: by 2002:a05:6a00:14cc:: with SMTP id
 w12mr14774266pfu.47.1643517780588; 
 Sat, 29 Jan 2022 20:43:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHwZkhnrIFy+LQWFKt5x7QLQ24RCeeTJpFcEaHvUcHjHXhwWTDpqN3V2x9WpK0HEtWuzkjgw==
X-Received: by 2002:a05:6a00:14cc:: with SMTP id
 w12mr14774228pfu.47.1643517780114; 
 Sat, 29 Jan 2022 20:43:00 -0800 (PST)
Received: from [10.72.13.18] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id q12sm14936965pfk.199.2022.01.29.20.42.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Jan 2022 20:42:59 -0800 (PST)
Message-ID: <6c98f4e8-8695-ab83-ae37-2d6293a1fafa@redhat.com>
Date: Sun, 30 Jan 2022 12:42:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 18/31] vhost: Shadow virtqueue buffers forwarding
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-19-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220121202733.404989-19-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/1/22 上午4:27, Eugenio Pérez 写道:
> Initial version of shadow virtqueue that actually forward buffers. There
> is no iommu support at the moment, and that will be addressed in future
> patches of this series. Since all vhost-vdpa devices use forced IOMMU,
> this means that SVQ is not usable at this point of the series on any
> device.
>
> For simplicity it only supports modern devices, that expects vring
> in little endian, with split ring and no event idx or indirect
> descriptors. Support for them will not be added in this series.
>
> It reuses the VirtQueue code for the device part. The driver part is
> based on Linux's virtio_ring driver, but with stripped functionality
> and optimizations so it's easier to review.
>
> However, forwarding buffers have some particular pieces: One of the most
> unexpected ones is that a guest's buffer can expand through more than
> one descriptor in SVQ. While this is handled gracefully by qemu's
> emulated virtio devices, it may cause unexpected SVQ queue full. This
> patch also solves it by checking for this condition at both guest's
> kicks and device's calls. The code may be more elegant in the future if
> SVQ code runs in its own iocontext.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-shadow-virtqueue.h |   2 +
>   hw/virtio/vhost-shadow-virtqueue.c | 365 ++++++++++++++++++++++++++++-
>   hw/virtio/vhost-vdpa.c             | 111 ++++++++-
>   3 files changed, 462 insertions(+), 16 deletions(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
> index 39aef5ffdf..19c934af49 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.h
> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> @@ -33,6 +33,8 @@ uint16_t vhost_svq_get_num(const VhostShadowVirtqueue *svq);
>   size_t vhost_svq_driver_area_size(const VhostShadowVirtqueue *svq);
>   size_t vhost_svq_device_area_size(const VhostShadowVirtqueue *svq);
>   
> +void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
> +                     VirtQueue *vq);
>   void vhost_svq_stop(VhostShadowVirtqueue *svq);
>   
>   VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize);
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index 7c168075d7..a1a404f68f 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -9,6 +9,8 @@
>   
>   #include "qemu/osdep.h"
>   #include "hw/virtio/vhost-shadow-virtqueue.h"
> +#include "hw/virtio/vhost.h"
> +#include "hw/virtio/virtio-access.h"
>   #include "standard-headers/linux/vhost_types.h"
>   
>   #include "qemu/error-report.h"
> @@ -36,6 +38,33 @@ typedef struct VhostShadowVirtqueue {
>   
>       /* Guest's call notifier, where SVQ calls guest. */
>       EventNotifier svq_call;
> +
> +    /* Virtio queue shadowing */
> +    VirtQueue *vq;
> +
> +    /* Virtio device */
> +    VirtIODevice *vdev;
> +
> +    /* Map for returning guest's descriptors */
> +    VirtQueueElement **ring_id_maps;
> +
> +    /* Next VirtQueue element that guest made available */
> +    VirtQueueElement *next_guest_avail_elem;
> +
> +    /* Next head to expose to device */
> +    uint16_t avail_idx_shadow;
> +
> +    /* Next free descriptor */
> +    uint16_t free_head;
> +
> +    /* Last seen used idx */
> +    uint16_t shadow_used_idx;
> +
> +    /* Next head to consume from device */
> +    uint16_t last_used_idx;
> +
> +    /* Cache for the exposed notification flag */
> +    bool notification;
>   } VhostShadowVirtqueue;
>   
>   #define INVALID_SVQ_KICK_FD -1
> @@ -148,30 +177,294 @@ bool vhost_svq_ack_guest_features(uint64_t dev_features,
>       return true;
>   }
>   
> -/* Forward guest notifications */
> -static void vhost_handle_guest_kick(EventNotifier *n)
> +/**
> + * Number of descriptors that SVQ can make available from the guest.
> + *
> + * @svq   The svq
> + */
> +static uint16_t vhost_svq_available_slots(const VhostShadowVirtqueue *svq)
>   {
> -    VhostShadowVirtqueue *svq = container_of(n, VhostShadowVirtqueue,
> -                                             svq_kick);
> +    return svq->vring.num - (svq->avail_idx_shadow - svq->shadow_used_idx);
> +}
> +
> +static void vhost_svq_set_notification(VhostShadowVirtqueue *svq, bool enable)
> +{
> +    uint16_t notification_flag;
>   
> -    if (unlikely(!event_notifier_test_and_clear(n))) {
> +    if (svq->notification == enable) {
> +        return;
> +    }
> +
> +    notification_flag = cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
> +
> +    svq->notification = enable;
> +    if (enable) {
> +        svq->vring.avail->flags &= ~notification_flag;
> +    } else {
> +        svq->vring.avail->flags |= notification_flag;
> +    }
> +}
> +
> +static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
> +                                    const struct iovec *iovec,
> +                                    size_t num, bool more_descs, bool write)
> +{
> +    uint16_t i = svq->free_head, last = svq->free_head;
> +    unsigned n;
> +    uint16_t flags = write ? cpu_to_le16(VRING_DESC_F_WRITE) : 0;
> +    vring_desc_t *descs = svq->vring.desc;
> +
> +    if (num == 0) {
> +        return;
> +    }
> +
> +    for (n = 0; n < num; n++) {
> +        if (more_descs || (n + 1 < num)) {
> +            descs[i].flags = flags | cpu_to_le16(VRING_DESC_F_NEXT);
> +        } else {
> +            descs[i].flags = flags;
> +        }
> +        descs[i].addr = cpu_to_le64((hwaddr)iovec[n].iov_base);
> +        descs[i].len = cpu_to_le32(iovec[n].iov_len);
> +
> +        last = i;
> +        i = cpu_to_le16(descs[i].next);
> +    }
> +
> +    svq->free_head = le16_to_cpu(descs[last].next);
> +}
> +
> +static unsigned vhost_svq_add_split(VhostShadowVirtqueue *svq,
> +                                    VirtQueueElement *elem)
> +{
> +    int head;
> +    unsigned avail_idx;
> +    vring_avail_t *avail = svq->vring.avail;
> +
> +    head = svq->free_head;
> +
> +    /* We need some descriptors here */
> +    assert(elem->out_num || elem->in_num);


Looks like this could be triggered by guest, we need fail instead assert 
here.


> +
> +    vhost_vring_write_descs(svq, elem->out_sg, elem->out_num,
> +                            elem->in_num > 0, false);
> +    vhost_vring_write_descs(svq, elem->in_sg, elem->in_num, false, true);
> +
> +    /*
> +     * Put entry in available array (but don't update avail->idx until they
> +     * do sync).
> +     */
> +    avail_idx = svq->avail_idx_shadow & (svq->vring.num - 1);
> +    avail->ring[avail_idx] = cpu_to_le16(head);
> +    svq->avail_idx_shadow++;
> +
> +    /* Update avail index after the descriptor is wrote */
> +    smp_wmb();
> +    avail->idx = cpu_to_le16(svq->avail_idx_shadow);
> +
> +    return head;
> +}
> +
> +static void vhost_svq_add(VhostShadowVirtqueue *svq, VirtQueueElement *elem)
> +{
> +    unsigned qemu_head = vhost_svq_add_split(svq, elem);
> +
> +    svq->ring_id_maps[qemu_head] = elem;
> +}
> +
> +static void vhost_svq_kick(VhostShadowVirtqueue *svq)
> +{
> +    /* We need to expose available array entries before checking used flags */
> +    smp_mb();
> +    if (svq->vring.used->flags & VRING_USED_F_NO_NOTIFY) {
>           return;
>       }
>   
>       event_notifier_set(&svq->hdev_kick);
>   }
>   
> -/* Forward vhost notifications */
> +/**
> + * Forward available buffers.
> + *
> + * @svq Shadow VirtQueue
> + *
> + * Note that this function does not guarantee that all guest's available
> + * buffers are available to the device in SVQ avail ring. The guest may have
> + * exposed a GPA / GIOVA congiuous buffer, but it may not be contiguous in qemu
> + * vaddr.
> + *
> + * If that happens, guest's kick notifications will be disabled until device
> + * makes some buffers used.
> + */
> +static void vhost_handle_guest_kick(VhostShadowVirtqueue *svq)
> +{
> +    /* Clear event notifier */
> +    event_notifier_test_and_clear(&svq->svq_kick);
> +
> +    /* Make available as many buffers as possible */
> +    do {
> +        if (virtio_queue_get_notification(svq->vq)) {
> +            virtio_queue_set_notification(svq->vq, false);


This looks like an optimization the should belong to 
virtio_queue_set_notification() itself.


> +        }
> +
> +        while (true) {
> +            VirtQueueElement *elem;
> +
> +            if (svq->next_guest_avail_elem) {
> +                elem = g_steal_pointer(&svq->next_guest_avail_elem);
> +            } else {
> +                elem = virtqueue_pop(svq->vq, sizeof(*elem));
> +            }
> +
> +            if (!elem) {
> +                break;
> +            }
> +
> +            if (elem->out_num + elem->in_num >
> +                vhost_svq_available_slots(svq)) {
> +                /*
> +                 * This condition is possible since a contiguous buffer in GPA
> +                 * does not imply a contiguous buffer in qemu's VA
> +                 * scatter-gather segments. If that happen, the buffer exposed
> +                 * to the device needs to be a chain of descriptors at this
> +                 * moment.
> +                 *
> +                 * SVQ cannot hold more available buffers if we are here:
> +                 * queue the current guest descriptor and ignore further kicks
> +                 * until some elements are used.
> +                 */
> +                svq->next_guest_avail_elem = elem;
> +                return;
> +            }
> +
> +            vhost_svq_add(svq, elem);
> +            vhost_svq_kick(svq);
> +        }
> +
> +        virtio_queue_set_notification(svq->vq, true);
> +    } while (!virtio_queue_empty(svq->vq));
> +}
> +
> +/**
> + * Handle guest's kick.
> + *
> + * @n guest kick event notifier, the one that guest set to notify svq.
> + */
> +static void vhost_handle_guest_kick_notifier(EventNotifier *n)
> +{
> +    VhostShadowVirtqueue *svq = container_of(n, VhostShadowVirtqueue,
> +                                             svq_kick);
> +    vhost_handle_guest_kick(svq);
> +}
> +
> +static bool vhost_svq_more_used(VhostShadowVirtqueue *svq)
> +{
> +    if (svq->last_used_idx != svq->shadow_used_idx) {
> +        return true;
> +    }
> +
> +    svq->shadow_used_idx = cpu_to_le16(svq->vring.used->idx);
> +
> +    return svq->last_used_idx != svq->shadow_used_idx;
> +}
> +
> +static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq)
> +{
> +    vring_desc_t *descs = svq->vring.desc;
> +    const vring_used_t *used = svq->vring.used;
> +    vring_used_elem_t used_elem;
> +    uint16_t last_used;
> +
> +    if (!vhost_svq_more_used(svq)) {
> +        return NULL;
> +    }
> +
> +    /* Only get used array entries after they have been exposed by dev */
> +    smp_rmb();
> +    last_used = svq->last_used_idx & (svq->vring.num - 1);
> +    used_elem.id = le32_to_cpu(used->ring[last_used].id);
> +    used_elem.len = le32_to_cpu(used->ring[last_used].len);
> +
> +    svq->last_used_idx++;
> +    if (unlikely(used_elem.id >= svq->vring.num)) {
> +        error_report("Device %s says index %u is used", svq->vdev->name,
> +                     used_elem.id);
> +        return NULL;
> +    }
> +
> +    if (unlikely(!svq->ring_id_maps[used_elem.id])) {
> +        error_report(
> +            "Device %s says index %u is used, but it was not available",
> +            svq->vdev->name, used_elem.id);
> +        return NULL;
> +    }
> +
> +    descs[used_elem.id].next = svq->free_head;
> +    svq->free_head = used_elem.id;
> +
> +    svq->ring_id_maps[used_elem.id]->len = used_elem.len;
> +    return g_steal_pointer(&svq->ring_id_maps[used_elem.id]);
> +}
> +
> +static void vhost_svq_flush(VhostShadowVirtqueue *svq,
> +                            bool check_for_avail_queue)
> +{
> +    VirtQueue *vq = svq->vq;
> +
> +    /* Make as many buffers as possible used. */
> +    do {
> +        unsigned i = 0;
> +
> +        vhost_svq_set_notification(svq, false);
> +        while (true) {
> +            g_autofree VirtQueueElement *elem = vhost_svq_get_buf(svq);
> +            if (!elem) {
> +                break;
> +            }
> +
> +            if (unlikely(i >= svq->vring.num)) {
> +                virtio_error(svq->vdev,
> +                         "More than %u used buffers obtained in a %u size SVQ",
> +                         i, svq->vring.num);
> +                virtqueue_fill(vq, elem, elem->len, i);
> +                virtqueue_flush(vq, i);


Let's simply use virtqueue_push() here?


> +                i = 0;


Do we need to bail out here?


> +            }
> +            virtqueue_fill(vq, elem, elem->len, i++);
> +        }
> +
> +        virtqueue_flush(vq, i);
> +        event_notifier_set(&svq->svq_call);
> +
> +        if (check_for_avail_queue && svq->next_guest_avail_elem) {
> +            /*
> +             * Avail ring was full when vhost_svq_flush was called, so it's a
> +             * good moment to make more descriptors available if possible
> +             */
> +            vhost_handle_guest_kick(svq);


Is there better to have a similar check as vhost_handle_guest_kick() did?

             if (elem->out_num + elem->in_num >
                 vhost_svq_available_slots(svq)) {


> +        }
> +
> +        vhost_svq_set_notification(svq, true);


A mb() is needed here? Otherwise we may lost a call here (where 
vhost_svq_more_used() is run before vhost_svq_set_notification()).


> +    } while (vhost_svq_more_used(svq));
> +}
> +
> +/**
> + * Forward used buffers.
> + *
> + * @n hdev call event notifier, the one that device set to notify svq.
> + *
> + * Note that we are not making any buffers available in the loop, there is no
> + * way that it runs more than virtqueue size times.
> + */
>   static void vhost_svq_handle_call(EventNotifier *n)
>   {
>       VhostShadowVirtqueue *svq = container_of(n, VhostShadowVirtqueue,
>                                                hdev_call);
>   
> -    if (unlikely(!event_notifier_test_and_clear(n))) {
> -        return;
> -    }
> +    /* Clear event notifier */
> +    event_notifier_test_and_clear(n);


Any reason that we remove the above check?


>   
> -    event_notifier_set(&svq->svq_call);
> +    vhost_svq_flush(svq, true);
>   }
>   
>   /**
> @@ -258,13 +551,38 @@ void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd)
>        * need to explicitely check for them.
>        */
>       event_notifier_init_fd(&svq->svq_kick, svq_kick_fd);
> -    event_notifier_set_handler(&svq->svq_kick, vhost_handle_guest_kick);
> +    event_notifier_set_handler(&svq->svq_kick,
> +                               vhost_handle_guest_kick_notifier);
>   
>       if (!check_old || event_notifier_test_and_clear(&tmp)) {
>           event_notifier_set(&svq->hdev_kick);
>       }
>   }
>   
> +/**
> + * Start shadow virtqueue operation.
> + *
> + * @svq Shadow Virtqueue
> + * @vdev        VirtIO device
> + * @vq          Virtqueue to shadow
> + */
> +void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
> +                     VirtQueue *vq)
> +{
> +    svq->next_guest_avail_elem = NULL;
> +    svq->avail_idx_shadow = 0;
> +    svq->shadow_used_idx = 0;
> +    svq->last_used_idx = 0;
> +    svq->vdev = vdev;
> +    svq->vq = vq;
> +
> +    memset(svq->vring.avail, 0, sizeof(*svq->vring.avail));
> +    memset(svq->vring.used, 0, sizeof(*svq->vring.avail));
> +    for (unsigned i = 0; i < svq->vring.num - 1; i++) {
> +        svq->vring.desc[i].next = cpu_to_le16(i + 1);
> +    }
> +}
> +
>   /**
>    * Stop shadow virtqueue operation.
>    * @svq Shadow Virtqueue
> @@ -272,6 +590,28 @@ void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd)
>   void vhost_svq_stop(VhostShadowVirtqueue *svq)
>   {
>       event_notifier_set_handler(&svq->svq_kick, NULL);
> +    g_autofree VirtQueueElement *next_avail_elem = NULL;
> +
> +    if (!svq->vq) {
> +        return;
> +    }
> +
> +    /* Send all pending used descriptors to guest */
> +    vhost_svq_flush(svq, false);
> +
> +    for (unsigned i = 0; i < svq->vring.num; ++i) {
> +        g_autofree VirtQueueElement *elem = NULL;
> +        elem = g_steal_pointer(&svq->ring_id_maps[i]);
> +        if (elem) {
> +            virtqueue_detach_element(svq->vq, elem, elem->len);
> +        }
> +    }
> +
> +    next_avail_elem = g_steal_pointer(&svq->next_guest_avail_elem);
> +    if (next_avail_elem) {
> +        virtqueue_detach_element(svq->vq, next_avail_elem,
> +                                 next_avail_elem->len);
> +    }
>   }
>   
>   /**
> @@ -316,7 +656,7 @@ VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize)
>       memset(svq->vring.desc, 0, driver_size);
>       svq->vring.used = qemu_memalign(qemu_real_host_page_size, device_size);
>       memset(svq->vring.used, 0, device_size);
> -
> +    svq->ring_id_maps = g_new0(VirtQueueElement *, qsize);
>       event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_call);
>       return g_steal_pointer(&svq);
>   
> @@ -335,6 +675,7 @@ void vhost_svq_free(VhostShadowVirtqueue *vq)
>       event_notifier_cleanup(&vq->hdev_kick);
>       event_notifier_set_handler(&vq->hdev_call, NULL);
>       event_notifier_cleanup(&vq->hdev_call);
> +    g_free(vq->ring_id_maps);
>       qemu_vfree(vq->vring.desc);
>       qemu_vfree(vq->vring.used);
>       g_free(vq);
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 53e14bafa0..0e5c00ed7e 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -752,9 +752,9 @@ static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
>    * Note that this function does not rewind kick file descriptor if cannot set
>    * call one.
>    */
> -static bool vhost_vdpa_svq_setup(struct vhost_dev *dev,
> -                                VhostShadowVirtqueue *svq,
> -                                unsigned idx)
> +static int vhost_vdpa_svq_set_fds(struct vhost_dev *dev,
> +                                  VhostShadowVirtqueue *svq,
> +                                  unsigned idx)
>   {
>       struct vhost_vring_file file = {
>           .index = dev->vq_index + idx,
> @@ -767,7 +767,7 @@ static bool vhost_vdpa_svq_setup(struct vhost_dev *dev,
>       r = vhost_vdpa_set_vring_dev_kick(dev, &file);
>       if (unlikely(r != 0)) {
>           error_report("Can't set device kick fd (%d)", -r);
> -        return false;
> +        return r;
>       }
>   
>       event_notifier = vhost_svq_get_svq_call_notifier(svq);
> @@ -777,6 +777,99 @@ static bool vhost_vdpa_svq_setup(struct vhost_dev *dev,
>           error_report("Can't set device call fd (%d)", -r);
>       }
>   
> +    return r;
> +}
> +
> +/**
> + * Unmap SVQ area in the device
> + */
> +static bool vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v, hwaddr iova,
> +                                      hwaddr size)
> +{
> +    int r;
> +
> +    size = ROUND_UP(size, qemu_real_host_page_size);
> +    r = vhost_vdpa_dma_unmap(v, iova, size);
> +    return r == 0;
> +}
> +
> +static bool vhost_vdpa_svq_unmap_rings(struct vhost_dev *dev,
> +                                       const VhostShadowVirtqueue *svq)
> +{
> +    struct vhost_vdpa *v = dev->opaque;
> +    struct vhost_vring_addr svq_addr;
> +    size_t device_size = vhost_svq_device_area_size(svq);
> +    size_t driver_size = vhost_svq_driver_area_size(svq);
> +    bool ok;
> +
> +    vhost_svq_get_vring_addr(svq, &svq_addr);
> +
> +    ok = vhost_vdpa_svq_unmap_ring(v, svq_addr.desc_user_addr, driver_size);
> +    if (unlikely(!ok)) {
> +        return false;
> +    }
> +
> +    return vhost_vdpa_svq_unmap_ring(v, svq_addr.used_user_addr, device_size);
> +}
> +
> +/**
> + * Map shadow virtqueue rings in device
> + *
> + * @dev   The vhost device
> + * @svq   The shadow virtqueue
> + */
> +static bool vhost_vdpa_svq_map_rings(struct vhost_dev *dev,
> +                                     const VhostShadowVirtqueue *svq)
> +{
> +    struct vhost_vdpa *v = dev->opaque;
> +    struct vhost_vring_addr svq_addr;
> +    size_t device_size = vhost_svq_device_area_size(svq);
> +    size_t driver_size = vhost_svq_driver_area_size(svq);
> +    int r;
> +
> +    vhost_svq_get_vring_addr(svq, &svq_addr);
> +
> +    r = vhost_vdpa_dma_map(v, svq_addr.desc_user_addr, driver_size,
> +                           (void *)svq_addr.desc_user_addr, true);
> +    if (unlikely(r != 0)) {
> +        return false;
> +    }
> +
> +    r = vhost_vdpa_dma_map(v, svq_addr.used_user_addr, device_size,
> +                           (void *)svq_addr.used_user_addr, false);


Do we need unmap the driver area if we fail here?

Thanks


> +    return r == 0;
> +}
> +
> +static bool vhost_vdpa_svq_setup(struct vhost_dev *dev,
> +                                VhostShadowVirtqueue *svq,
> +                                unsigned idx)
> +{
> +    uint16_t vq_index = dev->vq_index + idx;
> +    struct vhost_vring_state s = {
> +        .index = vq_index,
> +    };
> +    int r;
> +    bool ok;
> +
> +    r = vhost_vdpa_set_dev_vring_base(dev, &s);
> +    if (unlikely(r)) {
> +        error_report("Can't set vring base (%d)", r);
> +        return false;
> +    }
> +
> +    s.num = vhost_svq_get_num(svq);
> +    r = vhost_vdpa_set_dev_vring_num(dev, &s);
> +    if (unlikely(r)) {
> +        error_report("Can't set vring num (%d)", r);
> +        return false;
> +    }
> +
> +    ok = vhost_vdpa_svq_map_rings(dev, svq);
> +    if (unlikely(!ok)) {
> +        return false;
> +    }
> +
> +    r = vhost_vdpa_svq_set_fds(dev, svq, idx);
>       return r == 0;
>   }
>   
> @@ -788,14 +881,24 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>       if (started) {
>           vhost_vdpa_host_notifiers_init(dev);
>           for (unsigned i = 0; i < v->shadow_vqs->len; ++i) {
> +            VirtQueue *vq = virtio_get_queue(dev->vdev, dev->vq_index + i);
>               VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, i);
>               bool ok = vhost_vdpa_svq_setup(dev, svq, i);
>               if (unlikely(!ok)) {
>                   return -1;
>               }
> +            vhost_svq_start(svq, dev->vdev, vq);
>           }
>           vhost_vdpa_set_vring_ready(dev);
>       } else {
> +        for (unsigned i = 0; i < v->shadow_vqs->len; ++i) {
> +            VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs,
> +                                                          i);
> +            bool ok = vhost_vdpa_svq_unmap_rings(dev, svq);
> +            if (unlikely(!ok)) {
> +                return -1;
> +            }
> +        }
>           vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
>       }
>   


