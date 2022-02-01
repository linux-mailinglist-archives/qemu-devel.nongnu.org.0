Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3213E4A6651
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 21:46:48 +0100 (CET)
Received: from localhost ([::1]:43946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF034-0003d0-RU
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 15:46:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nEwx6-0001JZ-5P
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:28:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nEwx3-0000Go-1p
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:28:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643736481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uJGuFdBHy4gqarPpquFAw1Wj7Q9CqhmbQt+C2TQ9gu8=;
 b=I9xl4s1+1hI1OW/xAigjmxWLD+JIDqFIEXJgLFxAiTyJ09IDIvm6mSv5EWvpiwP9vzR5m/
 rZ8WlhFEf+4NotwaxASw4sSYJlog6L9r/a5KwZKOAnUWvVkvH+XWn/3VMJi7745uIzEy8H
 IMckRF1QE8qEov/wHzI0kAPeV2K53Pk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-xIcud4--OdOAX-Aff7lhvw-1; Tue, 01 Feb 2022 12:28:00 -0500
X-MC-Unique: xIcud4--OdOAX-Aff7lhvw-1
Received: by mail-qt1-f199.google.com with SMTP id
 a28-20020ac84d9c000000b002d05c958a84so13516790qtw.0
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 09:28:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uJGuFdBHy4gqarPpquFAw1Wj7Q9CqhmbQt+C2TQ9gu8=;
 b=NNEeQgUU5MvetqzZOASHmC2hJMGbrDLtxvWrVBSxAEf2xvn41yRwaNk+E7BYJHVQ/q
 aPVgYneat2wEb1dwl9y/sgpK4eNW+UXGgsDwa8Y3Tv9uz9wNYUEF+yEOAUU/6Xquf4Vd
 5LF+HyPAzRzS1ZXEm60FYLrK4AliTNrQBfRh8ydJVJjCGT3NBmdowQVuuyuo2QPGWK8/
 8R0VYvHx4Zi4VgJGkDbR9qugq5e/+S0Vf/v5j1XkzC69B7+RxdaRXw8SfjGzd008o6YE
 v/le7Sou7AN2yL/yW8rRKZmb0de60hf3da/CyR5+5ac3dpOCz9yWwuRVAtJ6G6JeSYMy
 OfJw==
X-Gm-Message-State: AOAM530sfdOs8TTdqhQzFGPwc6RFblbaWbE+BO16t/genP5i355EFDNX
 U4lpR6n7Ymd11z7YDPxfA+p07wh/uJ1MnGep9o7sBrxCfUXKVFdSYB7sz8eWT2+lgGXHecbWAJf
 XtuLF+3ntE6Pbabkoy53ietBsM6onyec=
X-Received: by 2002:ac8:5a4a:: with SMTP id o10mr3533160qta.459.1643736478346; 
 Tue, 01 Feb 2022 09:27:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzU5S3HNjxQxWfnfr/qjnHncr/D8lNm1aQE/dZPc0Mw8IuWDwkOe/pzeseqdjbFv3f0hUFKPnbFHVC9tL2r6f8=
X-Received: by 2002:ac8:5a4a:: with SMTP id o10mr3533142qta.459.1643736478072; 
 Tue, 01 Feb 2022 09:27:58 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-23-eperezma@redhat.com>
 <2eb07526-0143-d612-8969-097ccdf00fae@redhat.com>
In-Reply-To: <2eb07526-0143-d612-8969-097ccdf00fae@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 1 Feb 2022 18:27:21 +0100
Message-ID: <CAJaqyWePW6hJKAm7nk+syqmXAgdTQSTtuv9jACu_+hgbg2bRHg@mail.gmail.com>
Subject: Re: [PATCH 22/31] vhost: Add VhostIOVATree
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Sun, Jan 30, 2022 at 6:21 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/1/22 =E4=B8=8A=E5=8D=884:27, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > This tree is able to look for a translated address from an IOVA address=
.
> >
> > At first glance it is similar to util/iova-tree. However, SVQ working o=
n
> > devices with limited IOVA space need more capabilities,
>
>
> So did the IOVA tree (e.g l2 vtd can only work in the range of GAW and
> without RMRRs).
>
>
> >   like allocating
> > IOVA chunks or performing reverse translations (qemu addresses to iova)=
.
>
>
> This looks like a general request as well. So I wonder if we can simply
> extend iova tree instead.
>

While both are true, I don't see code that performs allocations or
qemu vaddr to iova translations. But if the changes can be integrated
into iova-tree that would be great for sure.

The main drawback I see is the need to maintain two trees instead of
one for users of iova-tree. While complexity does not grow, it needs
to double the amount of work needed.

Thanks!

> Thanks
>
>
> >
> > The allocation capability, as "assign a free IOVA address to this chunk
> > of memory in qemu's address space" allows shadow virtqueue to create a
> > new address space that is not restricted by guest's addressable one, so
> > we can allocate shadow vqs vrings outside of it.
> >
> > It duplicates the tree so it can search efficiently both directions,
> > and it will signal overlap if iova or the translated address is
> > present in any tree.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-iova-tree.h |  27 +++++++
> >   hw/virtio/vhost-iova-tree.c | 157 +++++++++++++++++++++++++++++++++++=
+
> >   hw/virtio/meson.build       |   2 +-
> >   3 files changed, 185 insertions(+), 1 deletion(-)
> >   create mode 100644 hw/virtio/vhost-iova-tree.h
> >   create mode 100644 hw/virtio/vhost-iova-tree.c
> >
> > diff --git a/hw/virtio/vhost-iova-tree.h b/hw/virtio/vhost-iova-tree.h
> > new file mode 100644
> > index 0000000000..610394eaf1
> > --- /dev/null
> > +++ b/hw/virtio/vhost-iova-tree.h
> > @@ -0,0 +1,27 @@
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
> > +#include "qemu/iova-tree.h"
> > +#include "exec/memory.h"
> > +
> > +typedef struct VhostIOVATree VhostIOVATree;
> > +
> > +VhostIOVATree *vhost_iova_tree_new(uint64_t iova_first, uint64_t iova_=
last);
> > +void vhost_iova_tree_delete(VhostIOVATree *iova_tree);
> > +G_DEFINE_AUTOPTR_CLEANUP_FUNC(VhostIOVATree, vhost_iova_tree_delete);
> > +
> > +const DMAMap *vhost_iova_tree_find_iova(const VhostIOVATree *iova_tree=
,
> > +                                        const DMAMap *map);
> > +int vhost_iova_tree_map_alloc(VhostIOVATree *iova_tree, DMAMap *map);
> > +void vhost_iova_tree_remove(VhostIOVATree *iova_tree, const DMAMap *ma=
p);
> > +
> > +#endif
> > diff --git a/hw/virtio/vhost-iova-tree.c b/hw/virtio/vhost-iova-tree.c
> > new file mode 100644
> > index 0000000000..0021dbaf54
> > --- /dev/null
> > +++ b/hw/virtio/vhost-iova-tree.c
> > @@ -0,0 +1,157 @@
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
> > +#include "qemu/iova-tree.h"
> > +#include "vhost-iova-tree.h"
> > +
> > +#define iova_min_addr qemu_real_host_page_size
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
> > +    /* First addresable iova address in the device */
> > +    uint64_t iova_first;
> > +
> > +    /* Last addressable iova address in the device */
> > +    uint64_t iova_last;
> > +
> > +    /* IOVA address to qemu memory maps. */
> > +    IOVATree *iova_taddr_map;
> > +
> > +    /* QEMU virtual memory address to iova maps */
> > +    GTree *taddr_iova_map;
> > +};
> > +
> > +static gint vhost_iova_tree_cmp_taddr(gconstpointer a, gconstpointer b=
,
> > +                                      gpointer data)
> > +{
> > +    const DMAMap *m1 =3D a, *m2 =3D b;
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
> > + * Create a new IOVA tree
> > + *
> > + * Returns the new IOVA tree
> > + */
> > +VhostIOVATree *vhost_iova_tree_new(hwaddr iova_first, hwaddr iova_last=
)
> > +{
> > +    VhostIOVATree *tree =3D g_new(VhostIOVATree, 1);
> > +
> > +    /* Some devices does not like 0 addresses */
> > +    tree->iova_first =3D MAX(iova_first, iova_min_addr);
> > +    tree->iova_last =3D iova_last;
> > +
> > +    tree->iova_taddr_map =3D iova_tree_new();
> > +    tree->taddr_iova_map =3D g_tree_new_full(vhost_iova_tree_cmp_taddr=
, NULL,
> > +                                           NULL, g_free);
> > +    return tree;
> > +}
> > +
> > +/**
> > + * Delete an iova tree
> > + */
> > +void vhost_iova_tree_delete(VhostIOVATree *iova_tree)
> > +{
> > +    iova_tree_destroy(iova_tree->iova_taddr_map);
> > +    g_tree_unref(iova_tree->taddr_iova_map);
> > +    g_free(iova_tree);
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
> > +const DMAMap *vhost_iova_tree_find_iova(const VhostIOVATree *tree,
> > +                                        const DMAMap *map)
> > +{
> > +    return g_tree_lookup(tree->taddr_iova_map, map);
> > +}
> > +
> > +/**
> > + * Allocate a new mapping
> > + *
> > + * @tree  The iova tree
> > + * @map   The iova map
> > + *
> > + * Returns:
> > + * - IOVA_OK if the map fits in the container
> > + * - IOVA_ERR_INVALID if the map does not make sense (like size overfl=
ow)
> > + * - IOVA_ERR_OVERLAP if the tree already contains that map
> > + * - IOVA_ERR_NOMEM if tree cannot allocate more space.
> > + *
> > + * It returns assignated iova in map->iova if return value is VHOST_DM=
A_MAP_OK.
> > + */
> > +int vhost_iova_tree_map_alloc(VhostIOVATree *tree, DMAMap *map)
> > +{
> > +    /* Some vhost devices does not like addr 0. Skip first page */
> > +    hwaddr iova_first =3D tree->iova_first ?: qemu_real_host_page_size=
;
> > +    DMAMap *new;
> > +    int r;
> > +
> > +    if (map->translated_addr + map->size < map->translated_addr ||
> > +        map->perm =3D=3D IOMMU_NONE) {
> > +        return IOVA_ERR_INVALID;
> > +    }
> > +
> > +    /* Check for collisions in translated addresses */
> > +    if (vhost_iova_tree_find_iova(tree, map)) {
> > +        return IOVA_ERR_OVERLAP;
> > +    }
> > +
> > +    /* Allocate a node in IOVA address */
> > +    r =3D iova_tree_alloc(tree->iova_taddr_map, map, iova_first,
> > +                        tree->iova_last);
> > +    if (r !=3D IOVA_OK) {
> > +        return r;
> > +    }
> > +
> > +    /* Allocate node in qemu -> iova translations */
> > +    new =3D g_malloc(sizeof(*new));
> > +    memcpy(new, map, sizeof(*new));
> > +    g_tree_insert(tree->taddr_iova_map, new, new);
> > +    return IOVA_OK;
> > +}
> > +
> > +/**
> > + * Remove existing mappings from iova tree
> > + *
> > + * @param  iova_tree  The vhost iova tree
> > + * @param  map        The map to remove
> > + */
> > +void vhost_iova_tree_remove(VhostIOVATree *iova_tree, const DMAMap *ma=
p)
> > +{
> > +    const DMAMap *overlap;
> > +
> > +    iova_tree_remove(iova_tree->iova_taddr_map, map);
> > +    while ((overlap =3D vhost_iova_tree_find_iova(iova_tree, map))) {
> > +        g_tree_remove(iova_tree->taddr_iova_map, overlap);
> > +    }
> > +}
> > diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
> > index 2dc87613bc..6047670804 100644
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


