Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A334CB7F8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 08:35:45 +0100 (CET)
Received: from localhost ([::1]:50270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPg00-0005OX-Ah
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 02:35:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nPfxu-0004aj-VK
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 02:33:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nPfxs-0000OA-4P
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 02:33:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646292806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=16UDrntFdcvb/FMrFGZbsXqNN8IrVXiqeZkKnfSxOc8=;
 b=ZKLk0A+uR58YlzAeotvvGs1UEDsLzJi/V4QZ+Qgphveg3BbRNIrzSRykOy4kVMBNOlI3jc
 xNhGZmkUemnUpckGpu4UOjO19tE1bO5pIYNwW9TtdbM/xr1c1GrcvNQMDGcNwmo9km8uuM
 AS/HsEi+8N9Glvg/xrAEAuufyj5Taq4=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-Syo79LSSNU20fJY6L_BqBw-1; Thu, 03 Mar 2022 02:33:23 -0500
X-MC-Unique: Syo79LSSNU20fJY6L_BqBw-1
Received: by mail-pg1-f199.google.com with SMTP id
 u10-20020a63df0a000000b0037886b8707bso2356436pgg.23
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 23:33:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=16UDrntFdcvb/FMrFGZbsXqNN8IrVXiqeZkKnfSxOc8=;
 b=WlUv3VRFgL5nAm5P55XZT5FqVNIr4wZIFYX3m/+TDDphVZHUmU7hNiW1orRZGrCF35
 DIrzK0yoF/QFKyg9G0z2BNJtLFj/4eo/SE5rmHc8UdHAOWzhmMsn0EpSPy3xT4BhOaqz
 eyWDsfDAGWT4V3e/nNI407BpGgPI+H156TLoYGRqFe5JBnf2tUNUWlBVHCeTR0NJsoY+
 fCR/vtwlyxi0WssDhdJAISrwCNcJBlWXMoL88tvSCnMtb5ayH4cRu8IRS772ImmqHzzC
 yJ2XODgVIOpbIfwlgjKVqzPZFiQ2bDjC7a795nxqpBuZOEkd2Qd4nCAufMKwcoKfeebO
 hvbA==
X-Gm-Message-State: AOAM533d8zd9WDlzLdvVWgeN54AjWpbDcgSIRlkEGJqtNo97V+KK+DDZ
 bMm4ENrTiYcmPXrXYYSWbYwMQK8D5dTjqGfNd101hr+sANEP9vPdCMGPXYOGQ+cJ5zL5yAGokSR
 KmVGn4U0lGEsaM/E=
X-Received: by 2002:a17:90a:67c9:b0:1b9:51d5:6c13 with SMTP id
 g9-20020a17090a67c900b001b951d56c13mr3903272pjm.216.1646292802402; 
 Wed, 02 Mar 2022 23:33:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzbbs8KbWhhXXxbXY8wvSRHaoMeHJuuhv2xziqNvd2V7SXUtKOuz79cZlNGjOyjViALXuepbA==
X-Received: by 2002:a17:90a:67c9:b0:1b9:51d5:6c13 with SMTP id
 g9-20020a17090a67c900b001b951d56c13mr3903221pjm.216.1646292801924; 
 Wed, 02 Mar 2022 23:33:21 -0800 (PST)
Received: from [10.72.13.250] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a056a001ad200b004bf321765dfsm1490829pfv.95.2022.03.02.23.33.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 23:33:21 -0800 (PST)
Message-ID: <cc5e53a9-4b83-ce44-f32b-cb8d758b2cf2@redhat.com>
Date: Thu, 3 Mar 2022 15:33:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 10/14] vdpa: Add custom IOTLB translations to SVQ
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20220227134111.3254066-1-eperezma@redhat.com>
 <20220227134111.3254066-11-eperezma@redhat.com>
 <af6d14b3-6bdf-8717-90b5-bc685896cc8a@redhat.com>
 <CAJaqyWf9c=OOKt7sB=kMY7FzNGG+YfPF=qNbu6A0UVkhzxmHZA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWf9c=OOKt7sB=kMY7FzNGG+YfPF=qNbu6A0UVkhzxmHZA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/3/1 下午4:50, Eugenio Perez Martin 写道:
> On Mon, Feb 28, 2022 at 8:37 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2022/2/27 下午9:41, Eugenio Pérez 写道:
>>> Use translations added in VhostIOVATree in SVQ.
>>>
>>> Only introduce usage here, not allocation and deallocation. As with
>>> previous patches, we use the dead code paths of shadow_vqs_enabled to
>>> avoid commiting too many changes at once. These are impossible to take
>>> at the moment.
>>>
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>> ---
>>>    hw/virtio/vhost-shadow-virtqueue.h |   6 +-
>>>    include/hw/virtio/vhost-vdpa.h     |   3 +
>>>    hw/virtio/vhost-shadow-virtqueue.c |  76 ++++++++++++++++-
>>>    hw/virtio/vhost-vdpa.c             | 128 ++++++++++++++++++++++++-----
>>>    4 files changed, 187 insertions(+), 26 deletions(-)
>>>
>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
>>> index 04c67685fd..b2f722d101 100644
>>> --- a/hw/virtio/vhost-shadow-virtqueue.h
>>> +++ b/hw/virtio/vhost-shadow-virtqueue.h
>>> @@ -13,6 +13,7 @@
>>>    #include "qemu/event_notifier.h"
>>>    #include "hw/virtio/virtio.h"
>>>    #include "standard-headers/linux/vhost_types.h"
>>> +#include "hw/virtio/vhost-iova-tree.h"
>>>
>>>    /* Shadow virtqueue to relay notifications */
>>>    typedef struct VhostShadowVirtqueue {
>>> @@ -43,6 +44,9 @@ typedef struct VhostShadowVirtqueue {
>>>        /* Virtio device */
>>>        VirtIODevice *vdev;
>>>
>>> +    /* IOVA mapping */
>>> +    VhostIOVATree *iova_tree;
>>> +
>>>        /* Map for use the guest's descriptors */
>>>        VirtQueueElement **ring_id_maps;
>>>
>>> @@ -78,7 +82,7 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
>>>                         VirtQueue *vq);
>>>    void vhost_svq_stop(VhostShadowVirtqueue *svq);
>>>
>>> -VhostShadowVirtqueue *vhost_svq_new(void);
>>> +VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree);
>>>
>>>    void vhost_svq_free(gpointer vq);
>>>    G_DEFINE_AUTOPTR_CLEANUP_FUNC(VhostShadowVirtqueue, vhost_svq_free);
>>> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
>>> index 009a9f3b6b..ee8e939ad0 100644
>>> --- a/include/hw/virtio/vhost-vdpa.h
>>> +++ b/include/hw/virtio/vhost-vdpa.h
>>> @@ -14,6 +14,7 @@
>>>
>>>    #include <gmodule.h>
>>>
>>> +#include "hw/virtio/vhost-iova-tree.h"
>>>    #include "hw/virtio/virtio.h"
>>>    #include "standard-headers/linux/vhost_types.h"
>>>
>>> @@ -30,6 +31,8 @@ typedef struct vhost_vdpa {
>>>        MemoryListener listener;
>>>        struct vhost_vdpa_iova_range iova_range;
>>>        bool shadow_vqs_enabled;
>>> +    /* IOVA mapping used by the Shadow Virtqueue */
>>> +    VhostIOVATree *iova_tree;
>>>        GPtrArray *shadow_vqs;
>>>        struct vhost_dev *dev;
>>>        VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
>>> index a38d313755..7e073773d1 100644
>>> --- a/hw/virtio/vhost-shadow-virtqueue.c
>>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
>>> @@ -11,6 +11,7 @@
>>>    #include "hw/virtio/vhost-shadow-virtqueue.h"
>>>
>>>    #include "qemu/error-report.h"
>>> +#include "qemu/log.h"
>>>    #include "qemu/main-loop.h"
>>>    #include "qemu/log.h"
>>>    #include "linux-headers/linux/vhost.h"
>>> @@ -84,7 +85,58 @@ static void vhost_svq_set_notification(VhostShadowVirtqueue *svq, bool enable)
>>>        }
>>>    }
>>>
>>> +/**
>>> + * Translate addresses between the qemu's virtual address and the SVQ IOVA
>>> + *
>>> + * @svq    Shadow VirtQueue
>>> + * @vaddr  Translated IOVA addresses
>>> + * @iovec  Source qemu's VA addresses
>>> + * @num    Length of iovec and minimum length of vaddr
>>> + */
>>> +static bool vhost_svq_translate_addr(const VhostShadowVirtqueue *svq,
>>> +                                     void **addrs, const struct iovec *iovec,
>>> +                                     size_t num)
>>> +{
>>> +    if (num == 0) {
>>> +        return true;
>>> +    }
>>> +
>>> +    for (size_t i = 0; i < num; ++i) {
>>> +        DMAMap needle = {
>>> +            .translated_addr = (hwaddr)iovec[i].iov_base,
>>> +            .size = iovec[i].iov_len,
>>> +        };
>>> +        size_t off;
>>> +
>>> +        const DMAMap *map = vhost_iova_tree_find_iova(svq->iova_tree, &needle);
>>> +        /*
>>> +         * Map cannot be NULL since iova map contains all guest space and
>>> +         * qemu already has a physical address mapped
>>> +         */
>>> +        if (unlikely(!map)) {
>>> +            qemu_log_mask(LOG_GUEST_ERROR,
>>> +                          "Invalid address 0x%"HWADDR_PRIx" given by guest",
>>> +                          needle.translated_addr);
>>> +            return false;
>>> +        }
>>> +
>>> +        off = needle.translated_addr - map->translated_addr;
>>> +        addrs[i] = (void *)(map->iova + off);
>>> +
>>> +        if (unlikely(int128_gt(int128_add(needle.translated_addr,
>>> +                                          iovec[i].iov_len),
>>> +                               map->translated_addr + map->size))) {
>>> +            qemu_log_mask(LOG_GUEST_ERROR,
>>> +                          "Guest buffer expands over iova range");
>>> +            return false;
>>> +        }
>>> +    }
>>> +
>>> +    return true;
>>> +}
>>> +
>>>    static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
>>> +                                    void * const *vaddr_sg,
>>
>> Nit: it looks to me we are not passing vaddr but iova here, so it might
>> be better to use "sg"?
>>
> Sure, this is a leftover of pre-IOVA translations. I see better to
> write as you say.
>
>>>                                        const struct iovec *iovec,
>>>                                        size_t num, bool more_descs, bool write)
>>>    {
>>> @@ -103,7 +155,7 @@ static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
>>>            } else {
>>>                descs[i].flags = flags;
>>>            }
>>> -        descs[i].addr = cpu_to_le64((hwaddr)iovec[n].iov_base);
>>> +        descs[i].addr = cpu_to_le64((hwaddr)vaddr_sg[n]);
>>>            descs[i].len = cpu_to_le32(iovec[n].iov_len);
>>>
>>>            last = i;
>>> @@ -119,6 +171,8 @@ static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
>>>    {
>>>        unsigned avail_idx;
>>>        vring_avail_t *avail = svq->vring.avail;
>>> +    bool ok;
>>> +    g_autofree void **sgs = g_new(void *, MAX(elem->out_num, elem->in_num));
>>>
>>>        *head = svq->free_head;
>>>
>>> @@ -129,9 +183,20 @@ static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
>>>            return false;
>>>        }
>>>
>>> -    vhost_vring_write_descs(svq, elem->out_sg, elem->out_num,
>>> +    ok = vhost_svq_translate_addr(svq, sgs, elem->out_sg, elem->out_num);
>>> +    if (unlikely(!ok)) {
>>> +        return false;
>>> +    }
>>> +    vhost_vring_write_descs(svq, sgs, elem->out_sg, elem->out_num,
>>>                                elem->in_num > 0, false);
>>> -    vhost_vring_write_descs(svq, elem->in_sg, elem->in_num, false, true);
>>> +
>>> +
>>> +    ok = vhost_svq_translate_addr(svq, sgs, elem->in_sg, elem->in_num);
>>> +    if (unlikely(!ok)) {
>>> +        return false;
>>> +    }
>>> +
>>> +    vhost_vring_write_descs(svq, sgs, elem->in_sg, elem->in_num, false, true);
>>>
>>>        /*
>>>         * Put the entry in the available array (but don't update avail->idx until
>>> @@ -514,11 +579,13 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
>>>     * Creates vhost shadow virtqueue, and instructs the vhost device to use the
>>>     * shadow methods and file descriptors.
>>>     *
>>> + * @iova_tree Tree to perform descriptors translations
>>> + *
>>>     * Returns the new virtqueue or NULL.
>>>     *
>>>     * In case of error, reason is reported through error_report.
>>>     */
>>> -VhostShadowVirtqueue *vhost_svq_new(void)
>>> +VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree)
>>>    {
>>>        g_autofree VhostShadowVirtqueue *svq = g_new0(VhostShadowVirtqueue, 1);
>>>        int r;
>>> @@ -539,6 +606,7 @@ VhostShadowVirtqueue *vhost_svq_new(void)
>>>
>>>        event_notifier_init_fd(&svq->svq_kick, VHOST_FILE_UNBIND);
>>>        event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_call);
>>> +    svq->iova_tree = iova_tree;
>>>        return g_steal_pointer(&svq);
>>>
>>>    err_init_hdev_call:
>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>> index 435b9c2e9e..56f9f125cd 100644
>>> --- a/hw/virtio/vhost-vdpa.c
>>> +++ b/hw/virtio/vhost-vdpa.c
>>> @@ -209,6 +209,21 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
>>>                                             vaddr, section->readonly);
>>>
>>>        llsize = int128_sub(llend, int128_make64(iova));
>>> +    if (v->shadow_vqs_enabled) {
>>> +        DMAMap mem_region = {
>>> +            .translated_addr = (hwaddr)vaddr,
>>> +            .size = int128_get64(llsize) - 1,
>>> +            .perm = IOMMU_ACCESS_FLAG(true, section->readonly),
>>> +        };
>>> +
>>> +        int r = vhost_iova_tree_map_alloc(v->iova_tree, &mem_region);
>>> +        if (unlikely(r != IOVA_OK)) {
>>> +            error_report("Can't allocate a mapping (%d)", r);
>>> +            goto fail;
>>> +        }
>>> +
>>> +        iova = mem_region.iova;
>>> +    }
>>>
>>>        vhost_vdpa_iotlb_batch_begin_once(v);
>>>        ret = vhost_vdpa_dma_map(v, iova, int128_get64(llsize),
>>> @@ -261,6 +276,20 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
>>>
>>>        llsize = int128_sub(llend, int128_make64(iova));
>>>
>>> +    if (v->shadow_vqs_enabled) {
>>> +        const DMAMap *result;
>>> +        const void *vaddr = memory_region_get_ram_ptr(section->mr) +
>>> +            section->offset_within_region +
>>> +            (iova - section->offset_within_address_space);
>>> +        DMAMap mem_region = {
>>> +            .translated_addr = (hwaddr)vaddr,
>>> +            .size = int128_get64(llsize) - 1,
>>> +        };
>>> +
>>> +        result = vhost_iova_tree_find_iova(v->iova_tree, &mem_region);
>>> +        iova = result->iova;
>>> +        vhost_iova_tree_remove(v->iova_tree, &mem_region);
>>> +    }
>>>        vhost_vdpa_iotlb_batch_begin_once(v);
>>>        ret = vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
>>>        if (ret) {
>>> @@ -383,7 +412,7 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
>>>
>>>        shadow_vqs = g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
>>>        for (unsigned n = 0; n < hdev->nvqs; ++n) {
>>> -        g_autoptr(VhostShadowVirtqueue) svq = vhost_svq_new();
>>> +        g_autoptr(VhostShadowVirtqueue) svq = vhost_svq_new(v->iova_tree);
>>>
>>>            if (unlikely(!svq)) {
>>>                error_setg(errp, "Cannot create svq %u", n);
>>> @@ -834,37 +863,78 @@ static int vhost_vdpa_svq_set_fds(struct vhost_dev *dev,
>>>    /**
>>>     * Unmap a SVQ area in the device
>>>     */
>>> -static bool vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v, hwaddr iova,
>>> -                                      hwaddr size)
>>> +static bool vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v,
>>> +                                      const DMAMap *needle)
>>>    {
>>> +    const DMAMap *result = vhost_iova_tree_find_iova(v->iova_tree, needle);
>>> +    hwaddr size;
>>>        int r;
>>>
>>> -    size = ROUND_UP(size, qemu_real_host_page_size);
>>> -    r = vhost_vdpa_dma_unmap(v, iova, size);
>>> +    if (unlikely(!result)) {
>>> +        error_report("Unable to find SVQ address to unmap");
>>> +        return false;
>>> +    }
>>> +
>>> +    size = ROUND_UP(result->size, qemu_real_host_page_size);
>>> +    r = vhost_vdpa_dma_unmap(v, result->iova, size);
>>>        return r == 0;
>>>    }
>>>
>>>    static bool vhost_vdpa_svq_unmap_rings(struct vhost_dev *dev,
>>>                                           const VhostShadowVirtqueue *svq)
>>>    {
>>> +    DMAMap needle;
>>>        struct vhost_vdpa *v = dev->opaque;
>>>        struct vhost_vring_addr svq_addr;
>>> -    size_t device_size = vhost_svq_device_area_size(svq);
>>> -    size_t driver_size = vhost_svq_driver_area_size(svq);
>>>        bool ok;
>>>
>>>        vhost_svq_get_vring_addr(svq, &svq_addr);
>>>
>>> -    ok = vhost_vdpa_svq_unmap_ring(v, svq_addr.desc_user_addr, driver_size);
>>> +    needle = (DMAMap) {
>>> +        .translated_addr = svq_addr.desc_user_addr,
>>> +    };
>>
>> Let's simply initialize the member to zero during start of this function
>> then we can use needle->transalted_addr = XXX here.
>>
> Sure
>
>>> +    ok = vhost_vdpa_svq_unmap_ring(v, &needle);
>>>        if (unlikely(!ok)) {
>>>            return false;
>>>        }
>>>
>>> -    return vhost_vdpa_svq_unmap_ring(v, svq_addr.used_user_addr, device_size);
>>> +    needle = (DMAMap) {
>>> +        .translated_addr = svq_addr.used_user_addr,
>>> +    };
>>> +    return vhost_vdpa_svq_unmap_ring(v, &needle);
>>> +}
>>> +
>>> +/**
>>> + * Map the SVQ area in the device
>>> + *
>>> + * @v          Vhost-vdpa device
>>> + * @needle     The area to search iova
>>> + * @errorp     Error pointer
>>> + */
>>> +static bool vhost_vdpa_svq_map_ring(struct vhost_vdpa *v, DMAMap *needle,
>>> +                                    Error **errp)
>>> +{
>>> +    int r;
>>> +
>>> +    r = vhost_iova_tree_map_alloc(v->iova_tree, needle);
>>> +    if (unlikely(r != IOVA_OK)) {
>>> +        error_setg(errp, "Cannot allocate iova (%d)", r);
>>> +        return false;
>>> +    }
>>> +
>>> +    r = vhost_vdpa_dma_map(v, needle->iova, needle->size,
>>> +                           (void *)needle->translated_addr,
>>> +                           !(needle->perm & IOMMU_ACCESS_FLAG(0, 1)));
>>
>> Let's simply use needle->perm == IOMMU_RO here?
>>
> The motivation to use this way is to be more resilient to the future.
> For example, if a new flag is added.
>
> But I'm totally ok with comparing with IOMMU_RO, I see that scenario
> unlikely at the moment.
>
>>> +    if (unlikely(r != 0)) {
>>> +        error_setg_errno(errp, -r, "Cannot map region to device");
>>> +        vhost_iova_tree_remove(v->iova_tree, needle);
>>> +    }
>>> +
>>> +    return r == 0;
>>>    }
>>>
>>>    /**
>>> - * Map shadow virtqueue rings in device
>>> + * Map the shadow virtqueue rings in the device
>>>     *
>>>     * @dev   The vhost device
>>>     * @svq   The shadow virtqueue
>>> @@ -876,28 +946,44 @@ static bool vhost_vdpa_svq_map_rings(struct vhost_dev *dev,
>>>                                         struct vhost_vring_addr *addr,
>>>                                         Error **errp)
>>>    {
>>> +    DMAMap device_region, driver_region;
>>> +    struct vhost_vring_addr svq_addr;
>>>        struct vhost_vdpa *v = dev->opaque;
>>>        size_t device_size = vhost_svq_device_area_size(svq);
>>>        size_t driver_size = vhost_svq_driver_area_size(svq);
>>> -    int r;
>>> +    size_t avail_offset;
>>> +    bool ok;
>>>
>>>        ERRP_GUARD();
>>> -    vhost_svq_get_vring_addr(svq, addr);
>>> +    vhost_svq_get_vring_addr(svq, &svq_addr);
>>>
>>> -    r = vhost_vdpa_dma_map(v, addr->desc_user_addr, driver_size,
>>> -                           (void *)addr->desc_user_addr, true);
>>> -    if (unlikely(r != 0)) {
>>> -        error_setg_errno(errp, -r, "Cannot create vq driver region: ");
>>> +    driver_region = (DMAMap) {
>>> +        .translated_addr = svq_addr.desc_user_addr,
>>> +        .size = driver_size - 1,
>>
>> Any reason for the "-1" here? I see several places do things like that,
>> it's probably hint of wrong API somehwere.
>>
> The "problem" is the api mismatch between _end and _last, to include
> the last member in the size or not.
>
> IOVA tree needs to use _end so we can allocate the last page in case
> of available range ending in (uint64_t)-1 [1]. But If we change
> vhost_svq_{device,driver}_area_size to make it inclusive,


These functions looks sane since it doesn't return a range. It's up to 
the caller to decide how to use the size.


>   we need to
> use "+1" in calls like qemu_memalign and memset at vhost_svq_start.
> Probably in more places too


I'm not sure I get here. Maybe you can show which code may suffers if we 
don't decrease it by one here.

But current code may endup to passing qemu_real_host_page_size - 1 to 
vhost-VDPA which seems wrong?

E.g vhost_svq_device_area_size() return qemu_real_host_page_size, but it 
was decreased by 1 here for size, then we pass size to vhost_vdpa_dma_map().

Thanks


>
> QEMU's emulated Intel iommu code solves it using the address mask as
> the size, something that does not fit 100% with vhost devices since
> they can allocate an arbitrary address of arbitrary size when using
> vIOMMU. It's not a problem for vhost-vdpa at this moment since we make
> sure we expose unaligned and whole pages with vrings, but I feel it
> would only be to move the problem somewhere else.
>
> Thanks!
>
> [1] There are alternatives: to use Int128_t, etc. But I think it's
> better not to change that in this patch series.
>
>> Thanks
>>
>>
>>> +        .perm = IOMMU_RO,
>>> +    };
>>> +    ok = vhost_vdpa_svq_map_ring(v, &driver_region, errp);
>>> +    if (unlikely(!ok)) {
>>> +        error_prepend(errp, "Cannot create vq driver region: ");
>>>            return false;
>>>        }
>>> +    addr->desc_user_addr = driver_region.iova;
>>> +    avail_offset = svq_addr.avail_user_addr - svq_addr.desc_user_addr;
>>> +    addr->avail_user_addr = driver_region.iova + avail_offset;
>>>
>>> -    r = vhost_vdpa_dma_map(v, addr->used_user_addr, device_size,
>>> -                           (void *)addr->used_user_addr, false);
>>> -    if (unlikely(r != 0)) {
>>> -        error_setg_errno(errp, -r, "Cannot create vq device region: ");
>>> +    device_region = (DMAMap) {
>>> +        .translated_addr = svq_addr.used_user_addr,
>>> +        .size = device_size - 1,
>>> +        .perm = IOMMU_RW,
>>> +    };
>>> +    ok = vhost_vdpa_svq_map_ring(v, &device_region, errp);
>>> +    if (unlikely(!ok)) {
>>> +        error_prepend(errp, "Cannot create vq device region: ");
>>> +        vhost_vdpa_svq_unmap_ring(v, &driver_region);
>>>        }
>>> +    addr->used_user_addr = device_region.iova;
>>>
>>> -    return r == 0;
>>> +    return ok;
>>>    }
>>>
>>>    static bool vhost_vdpa_svq_setup(struct vhost_dev *dev,


