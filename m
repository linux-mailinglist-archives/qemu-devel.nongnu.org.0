Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20719396EA3
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 10:17:00 +0200 (CEST)
Received: from localhost ([::1]:60098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnza6-0004tX-PY
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 04:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lnzZC-0004B6-9J
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 04:16:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lnzZ7-0003z9-US
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 04:16:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622535356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x5RCdGlMFNgGvrvBA/iGiyWF32zFDWAnJeBiWu3LI90=;
 b=jA3guAYBgsbndr5hdU8pd8wbR+GId9wmAjkdBGz/IFEeFgHWKDg9cwke1BE+2MGpgkRYX7
 FpuGxWJGCL6srqqs+0tHq62uHqyz9NhUjQITOoFMn+Iq05U3iEilSHuZF8rYNi9p7G3vSf
 zCzMSJXs0OrNdGXhrOQ2nw5qbUAE0fE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-TziOUjf9O5KtABOGuYzLmQ-1; Tue, 01 Jun 2021 04:15:54 -0400
X-MC-Unique: TziOUjf9O5KtABOGuYzLmQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 s123-20020a3777810000b02902e9adec2313so11266156qkc.4
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 01:15:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=x5RCdGlMFNgGvrvBA/iGiyWF32zFDWAnJeBiWu3LI90=;
 b=AGp3909M7UoEQcO4rik45N5bBtizL9y01JUoJ+c7ZzknKHY78mXd2juCdgXkt6uF1X
 VF+UNir4LQe6T3ijxjtM6HiL2L3t3zePBk1ng7e9nl8y8mOmFP7Jrmgrh1HViDUBi02d
 /D1PSWb2jdobpdjr72mUErPAfXNlndyB1B4yGgVzYKcTp9D/UMFaTpsZdC0pL+XYVAwr
 EGFnkGoRxO0UTm16zj5olDpXCdvyfNyIHaZ7lkIw1k0OHqaqehdBMIEVcfoIIK5xoFNT
 l6BEfKb/p8TaZm+uidHeS4lmfiS4+drwyCwQKsoiW2WIgeKg1vBnef5jGi1a+77RDBF8
 sEqQ==
X-Gm-Message-State: AOAM533GCL6rjrejoKBBnbT5I2SiVwfCzbCHoehkwCBaWdN3VfilJIeg
 uNHPDHoKjqVsuPQMfXe6eJYkaKxEpp7JXaDx0Fq3+h+ChuhTVmYDPew0ZfJ7fVagLwHKKkHxTjN
 yi49EHdEvMIi6ghx62H4lcfrRfnKD5Z0=
X-Received: by 2002:ac8:5a02:: with SMTP id n2mr18533403qta.221.1622535353855; 
 Tue, 01 Jun 2021 01:15:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRirsj7ULRX9ZkBWjGg/vqM/SbRQU2iDYcWMZK1BYePv4oU6jNS22HdeuMamyTbEQYJ9Q98Zs8/uqUyBiD55E=
X-Received: by 2002:ac8:5a02:: with SMTP id n2mr18533383qta.221.1622535353545; 
 Tue, 01 Jun 2021 01:15:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210519162903.1172366-1-eperezma@redhat.com>
 <20210519162903.1172366-22-eperezma@redhat.com>
 <755e2d24-946b-775c-e4e9-e81a16e7b6dd@redhat.com>
In-Reply-To: <755e2d24-946b-775c-e4e9-e81a16e7b6dd@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 1 Jun 2021 10:15:17 +0200
Message-ID: <CAJaqyWfKTiKeKLLjB9qDf4qJwL420YRo6FrJgozp_tn0Z57pOA@mail.gmail.com>
Subject: Re: [RFC v3 21/29] vhost: Add VhostIOVATree
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Harpreet Singh Anand <hanand@xilinx.com>,
 Xiao W Wang <xiao.w.wang@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, virtualization@lists.linux-foundation.org,
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 31, 2021 at 11:40 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/5/20 =E4=B8=8A=E5=8D=8812:28, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > This tree is able to look for a translated address from a IOVA address.
> >
> > At first glance is similar to util/iova-tree. However, SVQ working on
> > devices with limited IOVA space need more capabilities, like allocating
> > IOVA chunks or perform reverse translations (qemu addresses to iova).
> >
> > Starting a sepparated implementation. Knowing than insertions/deletions
> > will not be as frequent as searches,
>
>
> This might not be true if vIOMMU is enabled.
>

Right.

>
> > it uses an ordered array at
> > implementation.
>
>
> I wonder how much overhead could g_array be if it needs to grow.
>

I didn't do any tests, actually. But I see this VhostIOVATree as a
replaceable tool, just to get the buffer translations to work. So I'm
both ok with change it now and ok to delay it, since they should not
be hard to do.

>
> >   A different name could be used, but ordered
> > searchable array is a little bit long though.
>
>
> Note that we had a very good example for this. That is the kernel iova
> allocator which is implemented via rbtree.
>
> Instead of figuring out g_array vs g_tree stuffs, I would simple go with
> g_tree first (based on util/iova-tree) and borrow the well design kernel
> iova allocator API to have a generic IOVA one instead of coupling it
> with vhost. It could be used by other userspace driver in the future:
>
> init_iova_domain()/put_iova_domain();
>
> alloc_iova()/free_iova();
>
> find_iova();
>

We could go that way, but then the iova-tree should be extended to
support both translations (iova->translated_addr is now implemented in
iova-tree, the reverse is not). If I understood you correctly,
borrowing the kernel iova allocator would give us both, right?

Note that it is not coupled to vhost at all except in the name: all
the implementations only work with hwaddr and void pointers memory.
Just to illustrate the point, I think it could be a drop-in
replacement for iova-tree at this moment (with all the
drawbacks/advantages of an array vs tree).

> Another reference is the iova allocator that is implemented in VFIO.

I will check this too.

Thanks!


>
> Thanks
>
>
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-iova-tree.h |  50 ++++++++++
> >   hw/virtio/vhost-iova-tree.c | 188 +++++++++++++++++++++++++++++++++++=
+
> >   hw/virtio/meson.build       |   2 +-
> >   3 files changed, 239 insertions(+), 1 deletion(-)
> >   create mode 100644 hw/virtio/vhost-iova-tree.h
> >   create mode 100644 hw/virtio/vhost-iova-tree.c
> >
> > diff --git a/hw/virtio/vhost-iova-tree.h b/hw/virtio/vhost-iova-tree.h
> > new file mode 100644
> > index 0000000000..2a44af8b3a
> > --- /dev/null
> > +++ b/hw/virtio/vhost-iova-tree.h
> > @@ -0,0 +1,50 @@
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
> > +#include <gmodule.h>
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
> > +    VHOST_DMA_MAP_OVERLAP =3D -2,
> > +    VHOST_DMA_MAP_INVALID =3D -1,
> > +    VHOST_DMA_MAP_OK =3D 0,
> > +} VhostDMAMapNewRC;
> > +
> > +/**
> > + * VhostIOVATree
> > + *
> > + * Store and search IOVA -> Translated mappings.
> > + *
> > + * Note that it cannot remove nodes.
> > + */
> > +typedef struct VhostIOVATree {
> > +    /* Ordered array of reverse translations, IOVA address to qemu mem=
ory. */
> > +    GArray *iova_taddr_map;
> > +} VhostIOVATree;
> > +
> > +void vhost_iova_tree_new(VhostIOVATree *iova_rm);
> > +void vhost_iova_tree_destroy(VhostIOVATree *iova_rm);
> > +
> > +const VhostDMAMap *vhost_iova_tree_find_taddr(const VhostIOVATree *iov=
a_rm,
> > +                                              const VhostDMAMap *map);
> > +VhostDMAMapNewRC vhost_iova_tree_insert(VhostIOVATree *iova_rm,
> > +                                        VhostDMAMap *map);
> > +
> > +#endif
> > diff --git a/hw/virtio/vhost-iova-tree.c b/hw/virtio/vhost-iova-tree.c
> > new file mode 100644
> > index 0000000000..dfd7e448b5
> > --- /dev/null
> > +++ b/hw/virtio/vhost-iova-tree.c
> > @@ -0,0 +1,188 @@
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
> > +static gint vhost_iova_tree_cmp_iova(gconstpointer a, gconstpointer b)
> > +{
> > +    const VhostDMAMap *m1 =3D a, *m2 =3D b;
> > +
> > +    if (m1->iova > m2->iova + m2->size) {
> > +        return 1;
> > +    }
> > +
> > +    if (m1->iova + m1->size < m2->iova) {
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
> > + * @tree  The IOVA tree
> > + */
> > +void vhost_iova_tree_new(VhostIOVATree *tree)
> > +{
> > +    assert(tree);
> > +
> > +    tree->iova_taddr_map =3D g_array_new(G_ARRAY_NOT_ZERO_TERMINATED,
> > +                                       G_ARRAY_NOT_CLEAR_ON_ALLOC,
> > +                                       sizeof(VhostDMAMap));
> > +}
> > +
> > +/**
> > + * Destroy an IOVA tree
> > + *
> > + * @tree  The iova tree
> > + */
> > +void vhost_iova_tree_destroy(VhostIOVATree *tree)
> > +{
> > +    g_array_unref(g_steal_pointer(&tree->iova_taddr_map));
> > +}
> > +
> > +/**
> > + * Perform a search on a GArray.
> > + *
> > + * @array Glib array
> > + * @map Map to look up
> > + * @compare_func Compare function to use
> > + *
> > + * Return The found element or NULL if not found.
> > + *
> > + * This can be replaced with g_array_binary_search (Since glib 2.62) w=
hen that
> > + * is common enough.
> > + */
> > +static const VhostDMAMap *vhost_iova_tree_bsearch(const GArray *array,
> > +                                                  const VhostDMAMap *m=
ap,
> > +                                                  GCompareFunc compare=
_func)
> > +{
> > +    return bsearch(map, array->data, array->len, sizeof(*map), compare=
_func);
> > +}
> > +
> > +/**
> > + * Find the translated address stored from a IOVA address
> > + *
> > + * @tree  The iova tree
> > + * @map   The map with the memory address
> > + *
> > + * Return the stored mapping, or NULL if not found.
> > + */
> > +const VhostDMAMap *vhost_iova_tree_find_taddr(const VhostIOVATree *tre=
e,
> > +                                              const VhostDMAMap *map)
> > +{
> > +    return vhost_iova_tree_bsearch(tree->iova_taddr_map, map,
> > +                                  vhost_iova_tree_cmp_iova);
> > +}
> > +
> > +/**
> > + * Insert a new map
> > + *
> > + * @tree  The iova tree
> > + * @map   The iova map
> > + *
> > + * Returns:
> > + * - VHOST_DMA_MAP_OK if the map fits in the container
> > + * - VHOST_DMA_MAP_INVALID if the map does not make sense (like size o=
verflow)
> > + * - VHOST_DMA_MAP_OVERLAP if the tree already contains that map
> > + * Can query the assignated iova in map.
> > + */
> > +VhostDMAMapNewRC vhost_iova_tree_insert(VhostIOVATree *tree,
> > +                                        VhostDMAMap *map)
> > +{
> > +    const VhostDMAMap *prev;
> > +    int find_prev_rc;
> > +
> > +    if (map->translated_addr + map->size < map->translated_addr ||
> > +        map->iova + map->size < map->iova || map->perm =3D=3D IOMMU_NO=
NE) {
> > +        return VHOST_DMA_MAP_INVALID;
> > +    }
> > +
> > +    /* Check for duplicates, and save position for insertion */
> > +    find_prev_rc =3D vhost_iova_tree_find_prev(tree->iova_taddr_map,
> > +                                             vhost_iova_tree_cmp_iova,=
 map,
> > +                                             &prev);
> > +    if (find_prev_rc =3D=3D VHOST_DMA_MAP_OVERLAP) {
> > +        return VHOST_DMA_MAP_OVERLAP;
> > +    }
> > +
> > +    vhost_iova_tree_insert_after(tree->iova_taddr_map, prev, map);
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


