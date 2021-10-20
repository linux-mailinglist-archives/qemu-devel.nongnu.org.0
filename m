Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CD54345FC
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 09:39:36 +0200 (CEST)
Received: from localhost ([::1]:36892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md6CF-0005vW-Eh
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 03:39:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1md6AM-00058o-6U
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 03:37:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1md6AJ-0002bi-A3
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 03:37:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634715454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=37qRnjm2P25CyT8uDhZI9+62vQe9hsG1oaprP08RUM8=;
 b=hj2PZv0SCzMTuMOFqly2ZHKdrSOzeRxw2l7BKbVfreO5DwkDgkRItv61jPpLzKcHVlUTSU
 7O+dkOXu49CEHWaAj3hEKePcPhALOTNqc3N2vkywxVXFUY1TjcMUJFFiJ+1/NSholDMl0L
 XS79Wz6Wz+LxJ68SMw9lsV8xpta4p5Y=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-SzE8zlmOMFaGj-fJqpfRCA-1; Wed, 20 Oct 2021 03:37:31 -0400
X-MC-Unique: SzE8zlmOMFaGj-fJqpfRCA-1
Received: by mail-qk1-f199.google.com with SMTP id
 j17-20020a05620a0a5100b0045f8ed4f72fso1676917qka.1
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 00:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=37qRnjm2P25CyT8uDhZI9+62vQe9hsG1oaprP08RUM8=;
 b=GsP062TWiqDqW5ihyp7MUC8qJwexv4WU6KrOas42wccecWZZrsekAml9IUJL75klFW
 3V6r2SlheoJDBCKTOgmlAvuEsSsqeAHxNKY1L/Dma5SQXRpet4ZCnc6kaJIDn6kVvtiL
 lauT5T44AH2O/8zvm92V9pVZppy2xqI33j0yk6sxWiM88ZEnhG7zqIgckKI1a3vmPH9d
 wkGxw5ZGfdpmRMb+8oYdwjKECtKvPnRLgS5QDVo+62SoBG5q1T7F2lhGfsnJISbt1WJb
 hBZSx5szLNi1aE/WcMExPJqemRcZXksH4paPLPx8q+npQwP7cERBKzIt3Nx3TqptCejw
 gRUw==
X-Gm-Message-State: AOAM533ZFOnQfjVHOQvlMukHVHRG7URHskDo4FeyyFWPkRlvMnkZuq2L
 oTr5KXu1H5SqgLGfGRfInNO5idPp7OckQvg2Srqvwk4uK91xAWJ8OGlq2Vam/07RhH1zVB40EGK
 IzpCvh5hhF3KS5udnJhk8feIrQJrrMzU=
X-Received: by 2002:aed:3022:: with SMTP id 31mr5142109qte.322.1634715450850; 
 Wed, 20 Oct 2021 00:37:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUnvqnYdG4XKO/Gfyb19CMHm76V3niGMkraP+Z0tqGVikH5ykacyqH1LH9nfqAfRoAuLENyDaYLyOi9xPSiMM=
X-Received: by 2002:aed:3022:: with SMTP id 31mr5142072qte.322.1634715450493; 
 Wed, 20 Oct 2021 00:37:30 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-19-eperezma@redhat.com>
 <79905c11-e313-ad60-17dc-1a47d35f12cc@redhat.com>
In-Reply-To: <79905c11-e313-ad60-17dc-1a47d35f12cc@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 20 Oct 2021 09:36:54 +0200
Message-ID: <CAJaqyWdq69dsHQ1w71jo6+oCL+M+XH1=JXG0xXVmBBjT-p+pXA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 18/20] vhost: Add VhostIOVATree
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 10:32 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/10/1 =E4=B8=8B=E5=8D=883:06, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > This tree is able to look for a translated address from an IOVA address=
.
> >
> > At first glance is similar to util/iova-tree. However, SVQ working on
> > devices with limited IOVA space need more capabilities, like allocating
> > IOVA chunks or perform reverse translations (qemu addresses to iova).
>
>
> I don't see any reverse translation is used in the shadow code. Or
> anything I missed?
>
>
> >
> > The allocation capability, as "assign a free IOVA address to this chunk
> > of memory in qemu's address space" allows shadow virtqueue to create a
> > new address space that is not restricted by guest's addressable one, so
> > we can allocate shadow vqs vrings outside of its reachability, nor
> > qemu's one. At the moment, the allocation is just done growing, not
> > allowing deletion.
> >
> > A different name could be used, but ordered searchable array is a
> > little bit long though.
> >
> > It duplicates the array so it can search efficiently both directions,
> > and it will signal overlap if iova or the translated address is
> > present in it's each array.
> >
> > Use of array will be changed to util-iova-tree in future series.
>
>
> Adding Peter.
>

Thanks, I missed CC him!

> It looks to me the only thing miseed is the iova allocator. And it looks
> to me it's better to decouple the allocator from the iova tree.
>
> Then we had:
>
> 1) initialize iova range
> 2) iova =3D iova_alloc(size)
> 3) built the iova tree map
> 4) buffer forwarding
> 5) iova_free(size)
>

The next series I will send once I have solved all the comments is
done that way, but the allocation is done in iova tree, not outside.
Reasons below.

>
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-iova-tree.h |  40 +++++++
> >   hw/virtio/vhost-iova-tree.c | 230 +++++++++++++++++++++++++++++++++++=
+
> >   hw/virtio/meson.build       |   2 +-
> >   3 files changed, 271 insertions(+), 1 deletion(-)
> >   create mode 100644 hw/virtio/vhost-iova-tree.h
> >   create mode 100644 hw/virtio/vhost-iova-tree.c
> >
> > diff --git a/hw/virtio/vhost-iova-tree.h b/hw/virtio/vhost-iova-tree.h
> > new file mode 100644
> > index 0000000000..d163a88905
> > --- /dev/null
> > +++ b/hw/virtio/vhost-iova-tree.h
> > @@ -0,0 +1,40 @@
> > +/*
> > + * vhost software live migration ring
> > + *
> > + * SPDX-FileCopyrightText: Red Hat, Inc. 2021
> > + * SPDX-FileContributor: Author: Eugenio P=C3=A9rez <eperezma@redhat.c=
om>
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +
> > +#ifndef HW_VIRTIO_VHOST_IOVA_TREE_H
> > +#define HW_VIRTIO_VHOST_IOVA_TREE_H
> > +
> > +#include "exec/memory.h"
> > +
> > +typedef struct VhostDMAMap {
> > +    void *translated_addr;
> > +    hwaddr iova;
> > +    hwaddr size;                /* Inclusive */
> > +    IOMMUAccessFlags perm;
> > +} VhostDMAMap;
> > +
> > +typedef enum VhostDMAMapNewRC {
> > +    VHOST_DMA_MAP_NO_SPACE =3D -3,
> > +    VHOST_DMA_MAP_OVERLAP =3D -2,
> > +    VHOST_DMA_MAP_INVALID =3D -1,
> > +    VHOST_DMA_MAP_OK =3D 0,
> > +} VhostDMAMapNewRC;
> > +
> > +typedef struct VhostIOVATree VhostIOVATree;
> > +
> > +VhostIOVATree *vhost_iova_tree_new(void);
> > +void vhost_iova_tree_unref(VhostIOVATree *iova_rm);
> > +G_DEFINE_AUTOPTR_CLEANUP_FUNC(VhostIOVATree, vhost_iova_tree_unref);
> > +
> > +const VhostDMAMap *vhost_iova_tree_find_iova(const VhostIOVATree *iova=
_rm,
> > +                                             const VhostDMAMap *map);
> > +VhostDMAMapNewRC vhost_iova_tree_alloc(VhostIOVATree *iova_rm,
> > +                                       VhostDMAMap *map);
> > +
> > +#endif
> > diff --git a/hw/virtio/vhost-iova-tree.c b/hw/virtio/vhost-iova-tree.c
> > new file mode 100644
> > index 0000000000..c284e27607
> > --- /dev/null
> > +++ b/hw/virtio/vhost-iova-tree.c
> > @@ -0,0 +1,230 @@
> > +/*
> > + * vhost software live migration ring
> > + *
> > + * SPDX-FileCopyrightText: Red Hat, Inc. 2021
> > + * SPDX-FileContributor: Author: Eugenio P=C3=A9rez <eperezma@redhat.c=
om>
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "vhost-iova-tree.h"
> > +
> > +#define G_ARRAY_NOT_ZERO_TERMINATED false
> > +#define G_ARRAY_NOT_CLEAR_ON_ALLOC false
> > +
> > +#define iova_min qemu_real_host_page_size
> > +
> > +/**
> > + * VhostIOVATree, able to:
> > + * - Translate iova address
> > + * - Reverse translate iova address (from translated to iova)
> > + * - Allocate IOVA regions for translated range (potentially slow oper=
ation)
> > + *
> > + * Note that it cannot remove nodes.
> > + */
> > +struct VhostIOVATree {
> > +    /* Ordered array of reverse translations, IOVA address to qemu mem=
ory. */
> > +    GArray *iova_taddr_map;
> > +
> > +    /*
> > +     * Ordered array of translations from qemu virtual memory address =
to iova
> > +     */
> > +    GArray *taddr_iova_map;
> > +};
>
>
> Any reason for using GArray? Is it faster?
>

To be honest, I used a GArray mainly for prototyping reasons, because
it allowed me to "insert a next element" once I've located either a
hole (in case of iova) or an address. To do it in the iova tree
required to either add code to iterate elements with arguments or to
allocate them. Another possibility is to add yet another structure
with "free regions".

I would say that at this moment GArray will be faster than GTree due
to GArray ability to bisect it and the better data locality, since we
will not be adding and deleting regions frequently during migration.
But that could change in case we support viommu platforms, and I
didn't measure it.

For the next revision I've added allocation capabilities to iova tree,
which I think fits pretty well there, and a separated qemu's vaddr ->
iova translation GTree. The allocation still transverse the utils/iova
tree linearly, but we can add a more performant allocator in the
future easily if needed. It should not affect anyway unless we hotplug
memory or similar.

>
> > +
> > +/**
> > + * Inserts an element after an existing one in garray.
> > + *
> > + * @array      The array
> > + * @prev_elem  The previous element of array of NULL if prepending
> > + * @map        The DMA map
> > + *
> > + * It provides the aditional advantage of being type safe over
> > + * g_array_insert_val, which accepts a reference pointer instead of a =
value
> > + * with no complains.
> > + */
> > +static void vhost_iova_tree_insert_after(GArray *array,
> > +                                         const VhostDMAMap *prev_elem,
> > +                                         const VhostDMAMap *map)
> > +{
> > +    size_t pos;
> > +
> > +    if (!prev_elem) {
> > +        pos =3D 0;
> > +    } else {
> > +        pos =3D prev_elem - &g_array_index(array, typeof(*prev_elem), =
0) + 1;
> > +    }
> > +
> > +    g_array_insert_val(array, pos, *map);
> > +}
> > +
> > +static gint vhost_iova_tree_cmp_taddr(gconstpointer a, gconstpointer b=
)
> > +{
> > +    const VhostDMAMap *m1 =3D a, *m2 =3D b;
> > +
> > +    if (m1->translated_addr > m2->translated_addr + m2->size) {
> > +        return 1;
> > +    }
> > +
> > +    if (m1->translated_addr + m1->size < m2->translated_addr) {
> > +        return -1;
> > +    }
> > +
> > +    /* Overlapped */
> > +    return 0;
> > +}
> > +
> > +/**
> > + * Find the previous node to a given iova
> > + *
> > + * @array  The ascending ordered-by-translated-addr array of VhostDMAM=
ap
> > + * @map    The map to insert
> > + * @prev   Returned location of the previous map
> > + *
> > + * Return VHOST_DMA_MAP_OK if everything went well, or VHOST_DMA_MAP_O=
VERLAP if
> > + * it already exists. It is ok to use this function to check if a give=
n range
> > + * exists, but it will use a linear search.
> > + *
> > + * TODO: We can use bsearch to locate the entry if we save the state i=
n the
> > + * needle, knowing that the needle is always the first argument to
> > + * compare_func.
> > + */
> > +static VhostDMAMapNewRC vhost_iova_tree_find_prev(const GArray *array,
> > +                                                  GCompareFunc compare=
_func,
> > +                                                  const VhostDMAMap *m=
ap,
> > +                                                  const VhostDMAMap **=
prev)
> > +{
> > +    size_t i;
> > +    int r;
> > +
> > +    *prev =3D NULL;
> > +    for (i =3D 0; i < array->len; ++i) {
> > +        r =3D compare_func(map, &g_array_index(array, typeof(*map), i)=
);
> > +        if (r =3D=3D 0) {
> > +            return VHOST_DMA_MAP_OVERLAP;
> > +        }
> > +        if (r < 0) {
> > +            return VHOST_DMA_MAP_OK;
> > +        }
> > +
> > +        *prev =3D &g_array_index(array, typeof(**prev), i);
> > +    }
> > +
> > +    return VHOST_DMA_MAP_OK;
> > +}
> > +
> > +/**
> > + * Create a new IOVA tree
> > + *
> > + * Returns the new IOVA tree
> > + */
> > +VhostIOVATree *vhost_iova_tree_new(void)
> > +{
>
>
> So I think it needs to be initialized with the range we get from
> get_iova_range().
>

Right, it is done that way for the next revision.

> Thanks
>
>
> > +    VhostIOVATree *tree =3D g_new(VhostIOVATree, 1);
> > +    tree->iova_taddr_map =3D g_array_new(G_ARRAY_NOT_ZERO_TERMINATED,
> > +                                       G_ARRAY_NOT_CLEAR_ON_ALLOC,
> > +                                       sizeof(VhostDMAMap));
> > +    tree->taddr_iova_map =3D g_array_new(G_ARRAY_NOT_ZERO_TERMINATED,
> > +                                       G_ARRAY_NOT_CLEAR_ON_ALLOC,
> > +                                       sizeof(VhostDMAMap));
> > +    return tree;
> > +}
> > +
> > +/**
> > + * Destroy an IOVA tree
> > + *
> > + * @tree  The iova tree
> > + */
> > +void vhost_iova_tree_unref(VhostIOVATree *tree)
> > +{
> > +    g_array_unref(g_steal_pointer(&tree->iova_taddr_map));
> > +    g_array_unref(g_steal_pointer(&tree->taddr_iova_map));
> > +}
> > +
> > +/**
> > + * Find the IOVA address stored from a memory address
> > + *
> > + * @tree     The iova tree
> > + * @map      The map with the memory address
> > + *
> > + * Return the stored mapping, or NULL if not found.
> > + */
> > +const VhostDMAMap *vhost_iova_tree_find_iova(const VhostIOVATree *tree=
,
> > +                                             const VhostDMAMap *map)
> > +{
> > +    /*
> > +     * This can be replaced with g_array_binary_search (Since glib 2.6=
2) when
> > +     * that version become common enough.
> > +     */
> > +    return bsearch(map, tree->taddr_iova_map->data, tree->taddr_iova_m=
ap->len,
> > +                   sizeof(*map), vhost_iova_tree_cmp_taddr);
> > +}
> > +
> > +static bool vhost_iova_tree_find_iova_hole(const GArray *iova_map,
> > +                                           const VhostDMAMap *map,
> > +                                           const VhostDMAMap **prev_el=
em)
> > +{
> > +    size_t i;
> > +    hwaddr iova =3D iova_min;
> > +
> > +    *prev_elem =3D NULL;
> > +    for (i =3D 0; i < iova_map->len; i++) {
> > +        const VhostDMAMap *next =3D &g_array_index(iova_map, typeof(*n=
ext), i);
> > +        hwaddr hole_end =3D next->iova;
> > +        if (map->size < hole_end - iova) {
> > +            return true;
> > +        }
> > +
> > +        iova =3D next->iova + next->size + 1;
> > +        *prev_elem =3D next;
> > +    }
> > +
> > +    return ((hwaddr)-1 - iova) > iova_map->len;
> > +}
> > +
> > +/**
> > + * Allocate a new mapping
> > + *
> > + * @tree  The iova tree
> > + * @map   The iova map
> > + *
> > + * Returns:
> > + * - VHOST_DMA_MAP_OK if the map fits in the container
> > + * - VHOST_DMA_MAP_INVALID if the map does not make sense (like size o=
verflow)
> > + * - VHOST_DMA_MAP_OVERLAP if the tree already contains that map
> > + * - VHOST_DMA_MAP_NO_SPACE if iova_rm cannot allocate more space.
> > + *
> > + * It returns assignated iova in map->iova if return value is VHOST_DM=
A_MAP_OK.
> > + */
> > +VhostDMAMapNewRC vhost_iova_tree_alloc(VhostIOVATree *tree,
> > +                                       VhostDMAMap *map)
> > +{
> > +    const VhostDMAMap *qemu_prev, *iova_prev;
> > +    int find_prev_rc;
> > +    bool fit;
> > +
> > +    if (map->translated_addr + map->size < map->translated_addr ||
> > +        map->iova + map->size < map->iova || map->perm =3D=3D IOMMU_NO=
NE) {
> > +        return VHOST_DMA_MAP_INVALID;
> > +    }
> > +
> > +    /* Search for a hole in iova space big enough */
> > +    fit =3D vhost_iova_tree_find_iova_hole(tree->iova_taddr_map, map,
> > +                                         &iova_prev);
> > +    if (!fit) {
> > +        return VHOST_DMA_MAP_NO_SPACE;
> > +    }
> > +
> > +    map->iova =3D iova_prev ? (iova_prev->iova + iova_prev->size) + 1 =
: iova_min;
> > +    find_prev_rc =3D vhost_iova_tree_find_prev(tree->taddr_iova_map,
> > +                                             vhost_iova_tree_cmp_taddr=
, map,
> > +                                             &qemu_prev);
> > +    if (find_prev_rc =3D=3D VHOST_DMA_MAP_OVERLAP) {
> > +        return VHOST_DMA_MAP_OVERLAP;
> > +    }
> > +
> > +    vhost_iova_tree_insert_after(tree->iova_taddr_map, iova_prev, map)=
;
> > +    vhost_iova_tree_insert_after(tree->taddr_iova_map, qemu_prev, map)=
;
> > +    return VHOST_DMA_MAP_OK;
> > +}
> > diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
> > index 8b5a0225fe..cb306b83c6 100644
> > --- a/hw/virtio/meson.build
> > +++ b/hw/virtio/meson.build
> > @@ -11,7 +11,7 @@ softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vh=
ost-stub.c'))
> >
> >   virtio_ss =3D ss.source_set()
> >   virtio_ss.add(files('virtio.c'))
> > -virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-b=
ackend.c', 'vhost-shadow-virtqueue.c'))
> > +virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-b=
ackend.c', 'vhost-shadow-virtqueue.c', 'vhost-iova-tree.c'))
> >   virtio_ss.add(when: 'CONFIG_VHOST_USER', if_true: files('vhost-user.c=
'))
> >   virtio_ss.add(when: 'CONFIG_VHOST_VDPA', if_true: files('vhost-vdpa.c=
'))
> >   virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-b=
alloon.c'))
>


