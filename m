Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 087045420EB
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 06:16:18 +0200 (CEST)
Received: from localhost ([::1]:40372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyn7A-0005ik-NN
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 00:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nyn5M-0004x6-T4
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 00:14:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nyn5I-0001ZQ-Vh
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 00:14:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654661659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t4/mhKc803nhvkED6aW1bBv52w2iye7wo0OP4UwTCQI=;
 b=dqzD/od8Y/J4nb9/6SJUWEuiCFkEPwtZN440WyhUPxdgdzq5P8t8HnD9PAHvASb7JIC73m
 vH9pMWiMcrzJDpBM8nbYlwhs/BZHKBrRptJ0Ok2oXSZtRd93hLwzYO8zsKmRsBgXeQiatT
 CpI32jc3hUrmiSVoTh9t3B0xth6r0/c=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-5cVxdY91OQKAv7-zR5mSVw-1; Wed, 08 Jun 2022 00:14:17 -0400
X-MC-Unique: 5cVxdY91OQKAv7-zR5mSVw-1
Received: by mail-pf1-f199.google.com with SMTP id
 z186-20020a6233c3000000b00510a6bc2864so10285609pfz.10
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 21:14:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=t4/mhKc803nhvkED6aW1bBv52w2iye7wo0OP4UwTCQI=;
 b=yomrqkx9CTLbGp/S868NSgy3WA6kETx1eqCWU5/R+GCeb4FTumDeH58Zw3IybvIUNG
 Hxd+EEjF/fV3dKl5YLGFQKVnhAVMpFhw2oT1afvGnmFtAuTVJUhTHOGrAm83wqfKOyK8
 38dmAzmLVX3/tI0qdQ6CpDAn5F2BqrvXX3IWdS/2tI3XAQ7W4vPQFw8mr7FvMHHsYpH8
 1u0E93TxmYNc5Kz5dvOiNaT43js8QziNxIZUJbKPKB3o6SXfkI/tiDkRKSy+TQiRsJP1
 F1dXHEQK9YyGVX/zY8GCLXjllMW9CVkl7mi4TyfOh7f32/QXP9fW+WTGbRVHzxdVm1VE
 YAaQ==
X-Gm-Message-State: AOAM533CdPWcHcBdxvK6gzaZa32T0p4ga6U04sl15LtZn3t7mNBzt6Iv
 8u0AQZfmc/OXzwzoO5VnpXjpEzWSCWdIjOkVgg3QAEz9hf34w7aPAMjLag29NalVDX0xsvQHtof
 jAR8qHGMEaGnhj6s=
X-Received: by 2002:a63:cc09:0:b0:3fb:aae7:4964 with SMTP id
 x9-20020a63cc09000000b003fbaae74964mr27928161pgf.118.1654661656637; 
 Tue, 07 Jun 2022 21:14:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxllhom4Fp4LcTmKkgvBWHV8YKwaGU3c7ohZMY4CQ4ixRWDsKSafY8dTIv0eZlj4aeM1KQPoQ==
X-Received: by 2002:a63:cc09:0:b0:3fb:aae7:4964 with SMTP id
 x9-20020a63cc09000000b003fbaae74964mr27928129pgf.118.1654661656197; 
 Tue, 07 Jun 2022 21:14:16 -0700 (PDT)
Received: from [10.72.13.97] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 f26-20020a631f1a000000b003f9eacd0684sm5856084pgf.3.2022.06.07.21.14.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 21:14:15 -0700 (PDT)
Message-ID: <ada7a29f-a8c8-9642-72ab-acf61e8158da@redhat.com>
Date: Wed, 8 Jun 2022 12:14:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [RFC PATCH v8 09/21] vhost: Add svq copy desc mode
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Cornelia Huck <cohuck@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Laurent Vivier <lvivier@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Eric Blake <eblake@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Parav Pandit <parav@mellanox.com>
References: <20220519191306.821774-1-eperezma@redhat.com>
 <20220519191306.821774-10-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220519191306.821774-10-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


在 2022/5/20 03:12, Eugenio Pérez 写道:
> Enable SVQ to not to forward the descriptor translating its address to
> qemu's IOVA but copying to a region outside of the guest.
>
> Virtio-net control VQ will use this mode, so we don't need to send all
> the guest's memory every time there is a change, but only on messages.
> Reversely, CVQ will only have access to control messages.  This lead to
> less messing with memory listeners.
>
> We could also try to send only the required translation by message, but
> this presents a problem when many control messages occupy the same
> guest's memory region.
>
> Lastly, this allows us to inject messages from QEMU to the device in a
> simple manner.  CVQ should be used rarely and with small messages, so all
> the drawbacks should be assumible.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-shadow-virtqueue.h |  10 ++
>   include/hw/virtio/vhost-vdpa.h     |   1 +
>   hw/virtio/vhost-shadow-virtqueue.c | 174 +++++++++++++++++++++++++++--
>   hw/virtio/vhost-vdpa.c             |   1 +
>   net/vhost-vdpa.c                   |   1 +
>   5 files changed, 175 insertions(+), 12 deletions(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
> index e06ac52158..79cb2d301f 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.h
> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> @@ -17,6 +17,12 @@
>   
>   typedef struct SVQElement {
>       VirtQueueElement elem;
> +
> +    /* SVQ IOVA address of in buffer and out buffer if cloned */
> +    hwaddr in_iova, out_iova;


It might worth to mention that we'd expect a single buffer here.


> +
> +    /* Length of in buffer */
> +    size_t in_len;
>   } SVQElement;
>   
>   typedef void (*VirtQueueElementCallback)(VirtIODevice *vdev,
> @@ -102,6 +108,9 @@ typedef struct VhostShadowVirtqueue {
>   
>       /* Next head to consume from the device */
>       uint16_t last_used_idx;
> +
> +    /* Copy each descriptor to QEMU iova */
> +    bool copy_descs;
>   } VhostShadowVirtqueue;
>   
>   bool vhost_svq_valid_features(uint64_t features, Error **errp);
> @@ -119,6 +128,7 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq);
>   
>   VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_map,
>                                       const VhostShadowVirtqueueOps *ops,
> +                                    bool copy_descs,
>                                       const VhostShadowVirtqueueMapOps *map_ops,
>                                       void *map_ops_opaque);
>   
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
> index f1ba46a860..dc2884eea4 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -33,6 +33,7 @@ typedef struct vhost_vdpa {
>       struct vhost_vdpa_iova_range iova_range;
>       uint64_t acked_features;
>       bool shadow_vqs_enabled;
> +    bool svq_copy_descs;
>       /* IOVA mapping used by the Shadow Virtqueue */
>       VhostIOVATree *iova_tree;
>       GPtrArray *shadow_vqs;
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index 044005ba89..5a8feb1cbc 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -16,6 +16,7 @@
>   #include "qemu/log.h"
>   #include "qemu/memalign.h"
>   #include "linux-headers/linux/vhost.h"
> +#include "qemu/iov.h"
>   
>   /**
>    * Validate the transport device features that both guests can use with the SVQ
> @@ -70,6 +71,30 @@ static uint16_t vhost_svq_available_slots(const VhostShadowVirtqueue *svq)
>       return svq->vring.num - (svq->shadow_avail_idx - svq->shadow_used_idx);
>   }
>   
> +static void vhost_svq_alloc_buffer(void **base, size_t *len,
> +                                   const struct iovec *iov, size_t num,
> +                                   bool write)
> +{
> +    *len = iov_size(iov, num);


Since this behavior is trigger able by the guest, we need an upper limit 
here.


> +    size_t buf_size = ROUND_UP(*len, 4096);


I see a kind of duplicated round up which is done in 
vhost_svq_write_descs().

Btw, should we use TARGET_PAGE_SIZE instead of the magic 4096 here?


> +
> +    if (!num) {
> +        return;
> +    }
> +
> +    /*
> +     * Linearize element. If guest had a descriptor chain, we expose the device
> +     * a single buffer.
> +     */
> +    *base = qemu_memalign(4096, buf_size);
> +    if (!write) {
> +        iov_to_buf(iov, num, 0, *base, *len);
> +        memset(*base + *len, 0, buf_size - *len);
> +    } else {
> +        memset(*base, 0, *len);
> +    }
> +}
> +
>   /**
>    * Translate addresses between the qemu's virtual address and the SVQ IOVA
>    *
> @@ -126,7 +151,9 @@ static bool vhost_svq_translate_addr(const VhostShadowVirtqueue *svq,
>    * Write descriptors to SVQ vring
>    *
>    * @svq: The shadow virtqueue
> + * @svq_elem: The shadow virtqueue element
>    * @sg: Cache for hwaddr
> + * @descs_len: Total written buffer if svq->copy_descs.
>    * @iovec: The iovec from the guest
>    * @num: iovec length
>    * @more_descs: True if more descriptors come in the chain
> @@ -134,7 +161,9 @@ static bool vhost_svq_translate_addr(const VhostShadowVirtqueue *svq,
>    *
>    * Return true if success, false otherwise and print error.
>    */
> -static bool vhost_svq_vring_write_descs(VhostShadowVirtqueue *svq, hwaddr *sg,
> +static bool vhost_svq_vring_write_descs(VhostShadowVirtqueue *svq,
> +                                        SVQElement *svq_elem, hwaddr *sg,
> +                                        size_t *descs_len,
>                                           const struct iovec *iovec, size_t num,
>                                           bool more_descs, bool write)
>   {
> @@ -142,18 +171,41 @@ static bool vhost_svq_vring_write_descs(VhostShadowVirtqueue *svq, hwaddr *sg,
>       unsigned n;
>       uint16_t flags = write ? cpu_to_le16(VRING_DESC_F_WRITE) : 0;
>       vring_desc_t *descs = svq->vring.desc;
> -    bool ok;
> -
>       if (num == 0) {
>           return true;
>       }
>   
> -    ok = vhost_svq_translate_addr(svq, sg, iovec, num);
> -    if (unlikely(!ok)) {
> -        return false;
> +    if (svq->copy_descs) {
> +        void *buf;
> +        DMAMap map = {};
> +        int r;
> +
> +        vhost_svq_alloc_buffer(&buf, descs_len, iovec, num, write);
> +        map.translated_addr = (hwaddr)(uintptr_t)buf;
> +        map.size = ROUND_UP(*descs_len, 4096) - 1;
> +        map.perm = write ? IOMMU_RW : IOMMU_RO,
> +        r = vhost_iova_tree_map_alloc(svq->iova_tree, &map);
> +        if (unlikely(r != IOVA_OK)) {
> +            error_report("Cannot map injected element");
> +            return false;
> +        }
> +
> +        r = svq->map_ops->map(map.iova, map.size + 1,
> +                              (void *)map.translated_addr, !write,
> +                              svq->map_ops_opaque);
> +        /* TODO: Handle error */
> +        assert(r == 0);
> +        num = 1;
> +        sg[0] = map.iova;


I think it would be simple if stick a simple logic of 
vhost_svq_vring_write_descs() here.

E.g we can move the above logic to the caller and it can simply prepare 
a dedicated in/out sg for the copied buffer.


> +    } else {
> +        bool ok = vhost_svq_translate_addr(svq, sg, iovec, num);
> +        if (unlikely(!ok)) {
> +            return false;
> +        }
>       }
>   
>       for (n = 0; n < num; n++) {
> +        uint32_t len = svq->copy_descs ? *descs_len : iovec[n].iov_len;
>           if (more_descs || (n + 1 < num)) {
>               descs[i].flags = flags | cpu_to_le16(VRING_DESC_F_NEXT);
>               descs[i].next = cpu_to_le16(svq->desc_next[i]);
> @@ -161,7 +213,7 @@ static bool vhost_svq_vring_write_descs(VhostShadowVirtqueue *svq, hwaddr *sg,
>               descs[i].flags = flags;
>           }
>           descs[i].addr = cpu_to_le64(sg[n]);
> -        descs[i].len = cpu_to_le32(iovec[n].iov_len);
> +        descs[i].len = cpu_to_le32(len);
>   
>           last = i;
>           i = cpu_to_le16(svq->desc_next[i]);
> @@ -178,7 +230,8 @@ static bool vhost_svq_add_split(VhostShadowVirtqueue *svq, SVQElement *svq_elem,
>       unsigned avail_idx;
>       vring_avail_t *avail = svq->vring.avail;
>       bool ok;
> -    g_autofree hwaddr *sgs = g_new(hwaddr, MAX(elem->out_num, elem->in_num));
> +    g_autofree hwaddr *sgs = NULL;
> +    hwaddr *in_sgs, *out_sgs;
>   
>       *head = svq->free_head;
>   
> @@ -189,15 +242,24 @@ static bool vhost_svq_add_split(VhostShadowVirtqueue *svq, SVQElement *svq_elem,
>           return false;
>       }
>   
> -    ok = vhost_svq_vring_write_descs(svq, sgs, elem->out_sg, elem->out_num,
> +    if (!svq->copy_descs) {
> +        sgs = g_new(hwaddr, MAX(elem->out_num, elem->in_num));
> +        in_sgs = out_sgs = sgs;
> +    } else {
> +        in_sgs = &svq_elem->in_iova;
> +        out_sgs = &svq_elem->out_iova;
> +    }
> +    ok = vhost_svq_vring_write_descs(svq, svq_elem, out_sgs, (size_t[]){},
> +                                     elem->out_sg, elem->out_num,
>                                        elem->in_num > 0, false);
>       if (unlikely(!ok)) {
>           return false;
>       }
>   
> -    ok = vhost_svq_vring_write_descs(svq, sgs, elem->in_sg, elem->in_num, false,
> -                                     true);
> +    ok = vhost_svq_vring_write_descs(svq, svq_elem, in_sgs, &svq_elem->in_len,
> +                                     elem->in_sg, elem->in_num, false, true);
>       if (unlikely(!ok)) {
> +        /* TODO unwind out_sg */
>           return false;
>       }
>   
> @@ -276,6 +338,7 @@ static void vhost_handle_guest_kick(VhostShadowVirtqueue *svq)
>               SVQElement *svq_elem;
>               VirtQueueElement *elem;
>               bool ok;
> +            uint32_t needed_slots;
>   
>               if (svq->next_guest_avail_elem) {
>                   svq_elem = g_steal_pointer(&svq->next_guest_avail_elem);
> @@ -288,7 +351,8 @@ static void vhost_handle_guest_kick(VhostShadowVirtqueue *svq)
>               }
>   
>               elem = &svq_elem->elem;
> -            if (elem->out_num + elem->in_num > vhost_svq_available_slots(svq)) {
> +            needed_slots = svq->copy_descs ? 1 : elem->out_num + elem->in_num;
> +            if (needed_slots > vhost_svq_available_slots(svq)) {
>                   /*
>                    * This condition is possible since a contiguous buffer in GPA
>                    * does not imply a contiguous buffer in qemu's VA
> @@ -411,6 +475,76 @@ static SVQElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq, uint32_t *len)
>       return g_steal_pointer(&svq->ring_id_maps[used_elem.id]);
>   }
>   
> +/**
> + * Unmap a descriptor chain of a SVQ element, optionally copying its in buffers
> + *
> + * @svq: Shadow VirtQueue
> + * @iova: SVQ IO Virtual address of descriptor
> + * @iov: Optional iovec to store device writable buffer
> + * @iov_cnt: iov length
> + * @buf_len: Length written by the device
> + *
> + * Print error message in case of error
> + */
> +static bool vhost_svq_unmap_iov(VhostShadowVirtqueue *svq, hwaddr iova,
> +                                const struct iovec *iov, size_t iov_cnt,
> +                                size_t buf_len)
> +{
> +    DMAMap needle = {
> +        /*
> +         * No need to specify size since contiguous iova chunk was allocated
> +         * by SVQ.
> +         */
> +        .iova = iova,
> +    };
> +    const DMAMap *map = vhost_iova_tree_find(svq->iova_tree, &needle);
> +    int r;
> +
> +    if (!map) {
> +        error_report("Cannot locate expected map");
> +        return false;
> +    }
> +
> +    r = svq->map_ops->unmap(map->iova, map->size + 1, svq->map_ops_opaque);
> +    if (unlikely(r != 0)) {
> +        error_report("Device cannot unmap: %s(%d)", g_strerror(r), r);
> +        return false;
> +    }
> +
> +    if (iov) {
> +        iov_from_buf(iov, iov_cnt, 0, (const void *)map->translated_addr, buf_len);
> +    }
> +    qemu_vfree((void *)map->translated_addr);
> +    vhost_iova_tree_remove(svq->iova_tree, &needle);
> +    return true;
> +}
> +
> +/**
> + * Unmap shadow virtqueue element
> + *
> + * @svq_elem: Shadow VirtQueue Element
> + * @copy_in: Copy in buffer to the element at unmapping
> + */
> +static bool vhost_svq_unmap_elem(VhostShadowVirtqueue *svq, SVQElement *svq_elem, uint32_t len, bool copy_in)
> +{
> +    VirtQueueElement *elem = &svq_elem->elem;
> +    const struct iovec *in_iov = copy_in ? elem->in_sg : NULL;
> +    size_t in_count = copy_in ? elem->in_num : 0;
> +    if (elem->out_num) {
> +        bool ok = vhost_svq_unmap_iov(svq, svq_elem->out_iova, NULL, 0, 0);
> +        if (unlikely(!ok)) {
> +            return false;
> +        }
> +    }
> +
> +    if (elem->in_num) {
> +        return vhost_svq_unmap_iov(svq, svq_elem->in_iova, in_iov, in_count,
> +                                   len);
> +    }
> +
> +    return true;
> +}
> +
>   static void vhost_svq_flush(VhostShadowVirtqueue *svq,
>                               bool check_for_avail_queue)
>   {
> @@ -429,6 +563,13 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
>                   break;
>               }
>   
> +            if (svq->copy_descs) {
> +                bool ok = vhost_svq_unmap_elem(svq, svq_elem, len, true);
> +                if (unlikely(!ok)) {
> +                    return;
> +                }
> +            }
> +
>               elem = &svq_elem->elem;
>               if (svq->ops && svq->ops->used_elem_handler) {
>                   svq->ops->used_elem_handler(svq->vdev, elem);
> @@ -611,12 +752,18 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
>           g_autofree SVQElement *svq_elem = NULL;
>           svq_elem = g_steal_pointer(&svq->ring_id_maps[i]);
>           if (svq_elem) {
> +            if (svq->copy_descs) {
> +                vhost_svq_unmap_elem(svq, svq_elem, 0, false);
> +            }
>               virtqueue_detach_element(svq->vq, &svq_elem->elem, 0);
>           }
>       }
>   
>       next_avail_elem = g_steal_pointer(&svq->next_guest_avail_elem);
>       if (next_avail_elem) {
> +        if (svq->copy_descs) {
> +            vhost_svq_unmap_elem(svq, next_avail_elem, 0, false);
> +        }
>           virtqueue_detach_element(svq->vq, &next_avail_elem->elem, 0);
>       }
>       svq->vq = NULL;
> @@ -632,6 +779,7 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
>    *
>    * @iova_tree: Tree to perform descriptors translations
>    * @ops: SVQ operations hooks
> + * @copy_descs: Copy each descriptor to QEMU iova
>    * @map_ops: SVQ mapping operation hooks
>    * @map_ops_opaque: Opaque data to pass to mapping operations
>    *
> @@ -641,6 +789,7 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
>    */
>   VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree,
>                                       const VhostShadowVirtqueueOps *ops,
> +                                    bool copy_descs,
>                                       const VhostShadowVirtqueueMapOps *map_ops,
>                                       void *map_ops_opaque)
>   {
> @@ -665,6 +814,7 @@ VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree,
>       event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_call);
>       svq->iova_tree = iova_tree;
>       svq->ops = ops;
> +    svq->copy_descs = copy_descs;
>       svq->map_ops = map_ops;
>       svq->map_ops_opaque = map_ops_opaque;
>       return g_steal_pointer(&svq);
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index e6ef944e23..31b3d4d013 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -436,6 +436,7 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
>       for (unsigned n = 0; n < hdev->nvqs; ++n) {
>           g_autoptr(VhostShadowVirtqueue) svq = vhost_svq_new(v->iova_tree,
>                                                          v->shadow_vq_ops,
> +                                                       v->svq_copy_descs,
>                                                          &vhost_vdpa_svq_map_ops,
>                                                          v);
>   
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index ef12fc284c..174fec5e77 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -254,6 +254,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>       s->vhost_vdpa.index = queue_pair_index;
>       if (!is_datapath) {
>           s->vhost_vdpa.shadow_vq_ops = &vhost_vdpa_net_svq_ops;
> +        s->vhost_vdpa.svq_copy_descs = true;
>       }
>       ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_index, nvqs);
>       if (ret) {


So all these logic seems rather complicated, it might be better to think 
of a way to simplify the stuffs. The cause of the complexity is that we 
couple too many stuffs with SVQ.

I wonder if we can simply let control virtqueue end in userspace code 
where it has a full understanding of the semantic, then let it talks to 
the vhost-vdpa directly:

E.g in the case of mq setting, we will start form the 
virtio_net_handle_mq(). Where we can prepare cvq commands there and send 
them to vhost-vDPA networking backend where the cvq commands were mapped 
and submitted to the device?

Thanks


