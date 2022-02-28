Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D2F4C63A5
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 08:08:25 +0100 (CET)
Received: from localhost ([::1]:56704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOa8t-0002YZ-R7
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 02:08:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nOa72-00018k-LW
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 02:06:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nOa6y-0003J6-Ji
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 02:06:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646031982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KgcRmsJXy2CY2+pWCcqbDT1r6DFwZ66nX1Olmo+npXM=;
 b=QTqnbQD9dPe4HLDIQSEgT6WTy1hInJP769KL7TndvuitpBpjXX9pW2Sppklrpog8fxWeIr
 Eh94YjsmTzrBIR+ihLBswWt20jyWhR1OEQk4cdlPsLOp6YRF+3LEiIjbajVrlX9iEAllY9
 LH1PnBOfov63bK+a9nXnaRIYpwTw9FM=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-Yyn8i3rHOUKtFJVkUTGJ-w-1; Mon, 28 Feb 2022 02:06:18 -0500
X-MC-Unique: Yyn8i3rHOUKtFJVkUTGJ-w-1
Received: by mail-pl1-f200.google.com with SMTP id
 g2-20020a170902740200b0014fc971527eso4293443pll.14
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 23:06:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KgcRmsJXy2CY2+pWCcqbDT1r6DFwZ66nX1Olmo+npXM=;
 b=l35Hw4C6eVYPIsar/MmMggtpaFnac6O69VIgM+ykuHAtLH/D5R5up4uAxTA4DA4ZgY
 nMd/CrnsMYRyXl1Gb+i2h2uOFsf8pE+elJCV2mVI8ocvFoiUl3/T9LAxIYQQxCb1shgB
 D8obbapDvMiv9+aP4EpKVwdZIMWkuBlKTAhwef4lgQs9HwmHTc+k0U6Odj5adzoMehzB
 Nlylv6MIE7I6zNIOCJV3sKgOqzjppI0+U9ePSt3NPAbzei3vwDusY4hS3UOBJRODbD63
 nDGEjaZZGGelDmMxd6TFXhc7RM3c+bLEB0D1JqmKs8kGai4dFtAJjbe8q05R2lXau8Fs
 hl8Q==
X-Gm-Message-State: AOAM533wQxsc9lt09C9pWr6Hnt6/Tu3sLF5xXj02yZC5YkcXu3Q4dIte
 CdznsHirFwmzn/W1QlOh+UWU5bMfNO/rh8J2Cz4HuEBmklXulkpIEyWZO7y6truiVHunXtxSPl3
 odQ1Z25d1KxRGl5k=
X-Received: by 2002:a05:6a00:190c:b0:4f3:a27a:13ca with SMTP id
 y12-20020a056a00190c00b004f3a27a13camr20097152pfi.65.1646031977102; 
 Sun, 27 Feb 2022 23:06:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/J8u3UIAJt7cnEQ1USx8d5Dn32xNvOqEHFeZW4KoDqn1t4P4udl7XQLj0qk/R9mhtYECG7g==
X-Received: by 2002:a05:6a00:190c:b0:4f3:a27a:13ca with SMTP id
 y12-20020a056a00190c00b004f3a27a13camr20097113pfi.65.1646031976772; 
 Sun, 27 Feb 2022 23:06:16 -0800 (PST)
Received: from [10.72.13.215] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a17090a441100b001bc1b59fe1asm15921086pjg.38.2022.02.27.23.06.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 23:06:16 -0800 (PST)
Message-ID: <7f6f5118-4228-6dcb-f3d4-3e64aeb3608c@redhat.com>
Date: Mon, 28 Feb 2022 15:06:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 09/14] vhost: Add VhostIOVATree
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220227134111.3254066-1-eperezma@redhat.com>
 <20220227134111.3254066-10-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220227134111.3254066-10-eperezma@redhat.com>
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 virtualization@lists.linux-foundation.org, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
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


在 2022/2/27 下午9:41, Eugenio Pérez 写道:
> This tree is able to look for a translated address from an IOVA address.
>
> At first glance it is similar to util/iova-tree. However, SVQ working on
> devices with limited IOVA space need more capabilities, like allocating
> IOVA chunks or performing reverse translations (qemu addresses to iova).
>
> The allocation capability, as "assign a free IOVA address to this chunk
> of memory in qemu's address space" allows shadow virtqueue to create a
> new address space that is not restricted by guest's addressable one, so
> we can allocate shadow vqs vrings outside of it.
>
> It duplicates the tree so it can search efficiently in both directions,
> and it will signal overlap if iova or the translated address is present
> in any tree.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-iova-tree.h |  27 +++++++
>   hw/virtio/vhost-iova-tree.c | 155 ++++++++++++++++++++++++++++++++++++
>   hw/virtio/meson.build       |   2 +-
>   3 files changed, 183 insertions(+), 1 deletion(-)
>   create mode 100644 hw/virtio/vhost-iova-tree.h
>   create mode 100644 hw/virtio/vhost-iova-tree.c
>
> diff --git a/hw/virtio/vhost-iova-tree.h b/hw/virtio/vhost-iova-tree.h
> new file mode 100644
> index 0000000000..6a4f24e0f9
> --- /dev/null
> +++ b/hw/virtio/vhost-iova-tree.h
> @@ -0,0 +1,27 @@
> +/*
> + * vhost software live migration iova tree
> + *
> + * SPDX-FileCopyrightText: Red Hat, Inc. 2021
> + * SPDX-FileContributor: Author: Eugenio Pérez <eperezma@redhat.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef HW_VIRTIO_VHOST_IOVA_TREE_H
> +#define HW_VIRTIO_VHOST_IOVA_TREE_H
> +
> +#include "qemu/iova-tree.h"
> +#include "exec/memory.h"
> +
> +typedef struct VhostIOVATree VhostIOVATree;
> +
> +VhostIOVATree *vhost_iova_tree_new(uint64_t iova_first, uint64_t iova_last);
> +void vhost_iova_tree_delete(VhostIOVATree *iova_tree);
> +G_DEFINE_AUTOPTR_CLEANUP_FUNC(VhostIOVATree, vhost_iova_tree_delete);
> +
> +const DMAMap *vhost_iova_tree_find_iova(const VhostIOVATree *iova_tree,
> +                                        const DMAMap *map);
> +int vhost_iova_tree_map_alloc(VhostIOVATree *iova_tree, DMAMap *map);
> +void vhost_iova_tree_remove(VhostIOVATree *iova_tree, const DMAMap *map);
> +
> +#endif
> diff --git a/hw/virtio/vhost-iova-tree.c b/hw/virtio/vhost-iova-tree.c
> new file mode 100644
> index 0000000000..03496ac075
> --- /dev/null
> +++ b/hw/virtio/vhost-iova-tree.c
> @@ -0,0 +1,155 @@
> +/*
> + * vhost software live migration iova tree
> + *
> + * SPDX-FileCopyrightText: Red Hat, Inc. 2021
> + * SPDX-FileContributor: Author: Eugenio Pérez <eperezma@redhat.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/iova-tree.h"
> +#include "vhost-iova-tree.h"
> +
> +#define iova_min_addr qemu_real_host_page_size
> +
> +/**
> + * VhostIOVATree, able to:
> + * - Translate iova address
> + * - Reverse translate iova address (from translated to iova)
> + * - Allocate IOVA regions for translated range (linear operation)
> + */
> +struct VhostIOVATree {
> +    /* First addressable iova address in the device */
> +    uint64_t iova_first;
> +
> +    /* Last addressable iova address in the device */
> +    uint64_t iova_last;
> +
> +    /* IOVA address to qemu memory maps. */
> +    IOVATree *iova_taddr_map;
> +
> +    /* QEMU virtual memory address to iova maps */
> +    GTree *taddr_iova_map;
> +};
> +
> +static gint vhost_iova_tree_cmp_taddr(gconstpointer a, gconstpointer b,
> +                                      gpointer data)
> +{
> +    const DMAMap *m1 = a, *m2 = b;
> +
> +    if (m1->translated_addr > m2->translated_addr + m2->size) {
> +        return 1;
> +    }
> +
> +    if (m1->translated_addr + m1->size < m2->translated_addr) {
> +        return -1;
> +    }
> +
> +    /* Overlapped */
> +    return 0;
> +}
> +
> +/**
> + * Create a new IOVA tree
> + *
> + * Returns the new IOVA tree
> + */
> +VhostIOVATree *vhost_iova_tree_new(hwaddr iova_first, hwaddr iova_last)
> +{
> +    VhostIOVATree *tree = g_new(VhostIOVATree, 1);
> +
> +    /* Some devices do not like 0 addresses */
> +    tree->iova_first = MAX(iova_first, iova_min_addr);
> +    tree->iova_last = iova_last;
> +
> +    tree->iova_taddr_map = iova_tree_new();
> +    tree->taddr_iova_map = g_tree_new_full(vhost_iova_tree_cmp_taddr, NULL,
> +                                           NULL, g_free);
> +    return tree;
> +}
> +
> +/**
> + * Delete an iova tree
> + */
> +void vhost_iova_tree_delete(VhostIOVATree *iova_tree)
> +{
> +    iova_tree_destroy(iova_tree->iova_taddr_map);
> +    g_tree_unref(iova_tree->taddr_iova_map);
> +    g_free(iova_tree);
> +}
> +
> +/**
> + * Find the IOVA address stored from a memory address
> + *
> + * @tree     The iova tree
> + * @map      The map with the memory address
> + *
> + * Return the stored mapping, or NULL if not found.
> + */
> +const DMAMap *vhost_iova_tree_find_iova(const VhostIOVATree *tree,
> +                                        const DMAMap *map)
> +{
> +    return g_tree_lookup(tree->taddr_iova_map, map);
> +}
> +
> +/**
> + * Allocate a new mapping
> + *
> + * @tree  The iova tree
> + * @map   The iova map
> + *
> + * Returns:
> + * - IOVA_OK if the map fits in the container
> + * - IOVA_ERR_INVALID if the map does not make sense (like size overflow)
> + * - IOVA_ERR_OVERLAP if the tree already contains that map
> + * - IOVA_ERR_NOMEM if tree cannot allocate more space.
> + *
> + * It returns assignated iova in map->iova if return value is VHOST_DMA_MAP_OK.
> + */
> +int vhost_iova_tree_map_alloc(VhostIOVATree *tree, DMAMap *map)
> +{
> +    /* Some vhost devices do not like addr 0. Skip first page */
> +    hwaddr iova_first = tree->iova_first ?: qemu_real_host_page_size;
> +    DMAMap *new;
> +    int r;
> +
> +    if (map->translated_addr + map->size < map->translated_addr ||
> +        map->perm == IOMMU_NONE) {
> +        return IOVA_ERR_INVALID;
> +    }
> +
> +    /* Check for collisions in translated addresses */
> +    if (vhost_iova_tree_find_iova(tree, map)) {
> +        return IOVA_ERR_OVERLAP;
> +    }
> +
> +    /* Allocate a node in IOVA address */
> +    r = iova_tree_alloc_map(tree->iova_taddr_map, map, iova_first,
> +                            tree->iova_last);
> +    if (r != IOVA_OK) {
> +        return r;
> +    }
> +
> +    /* Allocate node in qemu -> iova translations */
> +    new = g_malloc(sizeof(*new));
> +    memcpy(new, map, sizeof(*new));
> +    g_tree_insert(tree->taddr_iova_map, new, new);


Can the caller map two IOVA ranges to the same e.g GPA range?

Thanks


> +    return IOVA_OK;
> +}
> +
> +/**
> + * Remove existing mappings from iova tree
> + *
> + * @param  iova_tree  The vhost iova tree
> + * @param  map        The map to remove
> + */
> +void vhost_iova_tree_remove(VhostIOVATree *iova_tree, const DMAMap *map)
> +{
> +    const DMAMap *overlap;
> +
> +    iova_tree_remove(iova_tree->iova_taddr_map, map);
> +    while ((overlap = vhost_iova_tree_find_iova(iova_tree, map))) {
> +        g_tree_remove(iova_tree->taddr_iova_map, overlap);
> +    }
> +}
> diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
> index 2dc87613bc..6047670804 100644
> --- a/hw/virtio/meson.build
> +++ b/hw/virtio/meson.build
> @@ -11,7 +11,7 @@ softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-stub.c'))
>   
>   virtio_ss = ss.source_set()
>   virtio_ss.add(files('virtio.c'))
> -virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-backend.c', 'vhost-shadow-virtqueue.c'))
> +virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-backend.c', 'vhost-shadow-virtqueue.c', 'vhost-iova-tree.c'))
>   virtio_ss.add(when: 'CONFIG_VHOST_USER', if_true: files('vhost-user.c'))
>   virtio_ss.add(when: 'CONFIG_VHOST_VDPA', if_true: files('vhost-vdpa.c'))
>   virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-balloon.c'))


