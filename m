Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC574CCB8A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 03:06:23 +0100 (CET)
Received: from localhost ([::1]:57896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPxKo-000486-AU
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 21:06:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nPxJC-0002c3-DE
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 21:04:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nPxJ8-0007jP-RQ
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 21:04:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646359477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fX6RtIocLCKZSik2ZzjMTgFbWnd36P2I+EHwWx+aCcQ=;
 b=JL95ZVYfIWBe+L1D0m1wf3DGJ825jnzIh0Cg+7xNDhy3Cj6Grz19rzADXE54uxq9uckehn
 6EUWS9PpKSCASE4rRFerIWTOYUELwLqGUB2t8fxcOcjj0i3JJR4cfrEhpAkDYzP7baF7CJ
 qnXMIRANQWOe0DtaY1yx9QsCzsWzw3g=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-RCIbLUnPO_WupbIloBaFfQ-1; Thu, 03 Mar 2022 21:04:34 -0500
X-MC-Unique: RCIbLUnPO_WupbIloBaFfQ-1
Received: by mail-lj1-f197.google.com with SMTP id
 x7-20020a2e9c87000000b002463977afe4so2561801lji.21
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 18:04:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fX6RtIocLCKZSik2ZzjMTgFbWnd36P2I+EHwWx+aCcQ=;
 b=LXfBVbBk/FplZewGDMIx9fYYm/imw0mUTL8kzSPNP7tZT+I8mjn5YFEHMKKQx10gyW
 EaEcjkD1Xh8b+KySpHum/UPjv0znRlUt16huJyNdzJob8heffbedgbeRjUuNOcIK4Ft9
 6PdZRAvSPbQL9+P7odKo+XNftDWyE6aycCH7dvHCmE6v5ob1K5xMhx7bC0coFFO0hgGq
 8aG7CIVlxg6nh4HnROsz65lzO84eDt+i797Jpb+XBGkfTSE0jJkwiDVJEegJUeRcCrW6
 lIwxjaLRoQypBSt1wz/IS9L9KOWwPS8EVHIqrRbf4Awg61o3wTz0rSgY/vzDLs5zggYZ
 l/jg==
X-Gm-Message-State: AOAM5327GG2xylxIwBBi1jwhGGM8TnHWNdLH055hkK5IOhx62CZwZXU1
 cYtUvX4XxaMZsZc3QDQr5Y7FsfZEWERfV5CxVF16clqEylWp5Zc41o57RmgBScjkQvcHXHwSZXs
 XCS+cFG7cwbscWyaS8AvkTzTavKXDLNA=
X-Received: by 2002:ac2:508a:0:b0:443:169a:b27 with SMTP id
 f10-20020ac2508a000000b00443169a0b27mr22949833lfm.257.1646359473044; 
 Thu, 03 Mar 2022 18:04:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyquMx5q5YWrOmlm5exX4W7yHw7fSS9eDOTWbfyvDN0dtxx5axIN/NxP+xIULw+TBniLa008Sm/GEs4vBPBNLY=
X-Received: by 2002:ac2:508a:0:b0:443:169a:b27 with SMTP id
 f10-20020ac2508a000000b00443169a0b27mr22949801lfm.257.1646359472693; Thu, 03
 Mar 2022 18:04:32 -0800 (PST)
MIME-Version: 1.0
References: <20220227134111.3254066-1-eperezma@redhat.com>
 <20220227134111.3254066-10-eperezma@redhat.com>
 <7f6f5118-4228-6dcb-f3d4-3e64aeb3608c@redhat.com>
 <CAJaqyWchLxXTRBE9zT9ZrF7UT_CnNbD=E5yaK6NrF-gDauhSAg@mail.gmail.com>
In-Reply-To: <CAJaqyWchLxXTRBE9zT9ZrF7UT_CnNbD=E5yaK6NrF-gDauhSAg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 4 Mar 2022 10:04:20 +0800
Message-ID: <CACGkMEsSBGo7+ox9V4tjY6Eq_rcJp0E6jXaQA=jhNh4AfdOMdw@mail.gmail.com>
Subject: Re: [PATCH v2 09/14] vhost: Add VhostIOVATree
To: Eugenio Perez Martin <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Fri, Mar 4, 2022 at 12:33 AM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Mon, Feb 28, 2022 at 8:06 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2022/2/27 =E4=B8=8B=E5=8D=889:41, Eugenio P=C3=A9rez =E5=86=
=99=E9=81=93:
> > > This tree is able to look for a translated address from an IOVA addre=
ss.
> > >
> > > At first glance it is similar to util/iova-tree. However, SVQ working=
 on
> > > devices with limited IOVA space need more capabilities, like allocati=
ng
> > > IOVA chunks or performing reverse translations (qemu addresses to iov=
a).
> > >
> > > The allocation capability, as "assign a free IOVA address to this chu=
nk
> > > of memory in qemu's address space" allows shadow virtqueue to create =
a
> > > new address space that is not restricted by guest's addressable one, =
so
> > > we can allocate shadow vqs vrings outside of it.
> > >
> > > It duplicates the tree so it can search efficiently in both direction=
s,
> > > and it will signal overlap if iova or the translated address is prese=
nt
> > > in any tree.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > >   hw/virtio/vhost-iova-tree.h |  27 +++++++
> > >   hw/virtio/vhost-iova-tree.c | 155 +++++++++++++++++++++++++++++++++=
+++
> > >   hw/virtio/meson.build       |   2 +-
> > >   3 files changed, 183 insertions(+), 1 deletion(-)
> > >   create mode 100644 hw/virtio/vhost-iova-tree.h
> > >   create mode 100644 hw/virtio/vhost-iova-tree.c
> > >
> > > diff --git a/hw/virtio/vhost-iova-tree.h b/hw/virtio/vhost-iova-tree.=
h
> > > new file mode 100644
> > > index 0000000000..6a4f24e0f9
> > > --- /dev/null
> > > +++ b/hw/virtio/vhost-iova-tree.h
> > > @@ -0,0 +1,27 @@
> > > +/*
> > > + * vhost software live migration iova tree
> > > + *
> > > + * SPDX-FileCopyrightText: Red Hat, Inc. 2021
> > > + * SPDX-FileContributor: Author: Eugenio P=C3=A9rez <eperezma@redhat=
.com>
> > > + *
> > > + * SPDX-License-Identifier: GPL-2.0-or-later
> > > + */
> > > +
> > > +#ifndef HW_VIRTIO_VHOST_IOVA_TREE_H
> > > +#define HW_VIRTIO_VHOST_IOVA_TREE_H
> > > +
> > > +#include "qemu/iova-tree.h"
> > > +#include "exec/memory.h"
> > > +
> > > +typedef struct VhostIOVATree VhostIOVATree;
> > > +
> > > +VhostIOVATree *vhost_iova_tree_new(uint64_t iova_first, uint64_t iov=
a_last);
> > > +void vhost_iova_tree_delete(VhostIOVATree *iova_tree);
> > > +G_DEFINE_AUTOPTR_CLEANUP_FUNC(VhostIOVATree, vhost_iova_tree_delete)=
;
> > > +
> > > +const DMAMap *vhost_iova_tree_find_iova(const VhostIOVATree *iova_tr=
ee,
> > > +                                        const DMAMap *map);
> > > +int vhost_iova_tree_map_alloc(VhostIOVATree *iova_tree, DMAMap *map)=
;
> > > +void vhost_iova_tree_remove(VhostIOVATree *iova_tree, const DMAMap *=
map);
> > > +
> > > +#endif
> > > diff --git a/hw/virtio/vhost-iova-tree.c b/hw/virtio/vhost-iova-tree.=
c
> > > new file mode 100644
> > > index 0000000000..03496ac075
> > > --- /dev/null
> > > +++ b/hw/virtio/vhost-iova-tree.c
> > > @@ -0,0 +1,155 @@
> > > +/*
> > > + * vhost software live migration iova tree
> > > + *
> > > + * SPDX-FileCopyrightText: Red Hat, Inc. 2021
> > > + * SPDX-FileContributor: Author: Eugenio P=C3=A9rez <eperezma@redhat=
.com>
> > > + *
> > > + * SPDX-License-Identifier: GPL-2.0-or-later
> > > + */
> > > +
> > > +#include "qemu/osdep.h"
> > > +#include "qemu/iova-tree.h"
> > > +#include "vhost-iova-tree.h"
> > > +
> > > +#define iova_min_addr qemu_real_host_page_size
> > > +
> > > +/**
> > > + * VhostIOVATree, able to:
> > > + * - Translate iova address
> > > + * - Reverse translate iova address (from translated to iova)
> > > + * - Allocate IOVA regions for translated range (linear operation)
> > > + */
> > > +struct VhostIOVATree {
> > > +    /* First addressable iova address in the device */
> > > +    uint64_t iova_first;
> > > +
> > > +    /* Last addressable iova address in the device */
> > > +    uint64_t iova_last;
> > > +
> > > +    /* IOVA address to qemu memory maps. */
> > > +    IOVATree *iova_taddr_map;
> > > +
> > > +    /* QEMU virtual memory address to iova maps */
> > > +    GTree *taddr_iova_map;
> > > +};
> > > +
> > > +static gint vhost_iova_tree_cmp_taddr(gconstpointer a, gconstpointer=
 b,
> > > +                                      gpointer data)
> > > +{
> > > +    const DMAMap *m1 =3D a, *m2 =3D b;
> > > +
> > > +    if (m1->translated_addr > m2->translated_addr + m2->size) {
> > > +        return 1;
> > > +    }
> > > +
> > > +    if (m1->translated_addr + m1->size < m2->translated_addr) {
> > > +        return -1;
> > > +    }
> > > +
> > > +    /* Overlapped */
> > > +    return 0;
> > > +}
> > > +
> > > +/**
> > > + * Create a new IOVA tree
> > > + *
> > > + * Returns the new IOVA tree
> > > + */
> > > +VhostIOVATree *vhost_iova_tree_new(hwaddr iova_first, hwaddr iova_la=
st)
> > > +{
> > > +    VhostIOVATree *tree =3D g_new(VhostIOVATree, 1);
> > > +
> > > +    /* Some devices do not like 0 addresses */
> > > +    tree->iova_first =3D MAX(iova_first, iova_min_addr);
> > > +    tree->iova_last =3D iova_last;
> > > +
> > > +    tree->iova_taddr_map =3D iova_tree_new();
> > > +    tree->taddr_iova_map =3D g_tree_new_full(vhost_iova_tree_cmp_tad=
dr, NULL,
> > > +                                           NULL, g_free);
> > > +    return tree;
> > > +}
> > > +
> > > +/**
> > > + * Delete an iova tree
> > > + */
> > > +void vhost_iova_tree_delete(VhostIOVATree *iova_tree)
> > > +{
> > > +    iova_tree_destroy(iova_tree->iova_taddr_map);
> > > +    g_tree_unref(iova_tree->taddr_iova_map);
> > > +    g_free(iova_tree);
> > > +}
> > > +
> > > +/**
> > > + * Find the IOVA address stored from a memory address
> > > + *
> > > + * @tree     The iova tree
> > > + * @map      The map with the memory address
> > > + *
> > > + * Return the stored mapping, or NULL if not found.
> > > + */
> > > +const DMAMap *vhost_iova_tree_find_iova(const VhostIOVATree *tree,
> > > +                                        const DMAMap *map)
> > > +{
> > > +    return g_tree_lookup(tree->taddr_iova_map, map);
> > > +}
> > > +
> > > +/**
> > > + * Allocate a new mapping
> > > + *
> > > + * @tree  The iova tree
> > > + * @map   The iova map
> > > + *
> > > + * Returns:
> > > + * - IOVA_OK if the map fits in the container
> > > + * - IOVA_ERR_INVALID if the map does not make sense (like size over=
flow)
> > > + * - IOVA_ERR_OVERLAP if the tree already contains that map
> > > + * - IOVA_ERR_NOMEM if tree cannot allocate more space.
> > > + *
> > > + * It returns assignated iova in map->iova if return value is VHOST_=
DMA_MAP_OK.
> > > + */
> > > +int vhost_iova_tree_map_alloc(VhostIOVATree *tree, DMAMap *map)
> > > +{
> > > +    /* Some vhost devices do not like addr 0. Skip first page */
> > > +    hwaddr iova_first =3D tree->iova_first ?: qemu_real_host_page_si=
ze;
> > > +    DMAMap *new;
> > > +    int r;
> > > +
> > > +    if (map->translated_addr + map->size < map->translated_addr ||
> > > +        map->perm =3D=3D IOMMU_NONE) {
> > > +        return IOVA_ERR_INVALID;
> > > +    }
> > > +
> > > +    /* Check for collisions in translated addresses */
> > > +    if (vhost_iova_tree_find_iova(tree, map)) {
> > > +        return IOVA_ERR_OVERLAP;
> > > +    }
> > > +
> > > +    /* Allocate a node in IOVA address */
> > > +    r =3D iova_tree_alloc_map(tree->iova_taddr_map, map, iova_first,
> > > +                            tree->iova_last);
> > > +    if (r !=3D IOVA_OK) {
> > > +        return r;
> > > +    }
> > > +
> > > +    /* Allocate node in qemu -> iova translations */
> > > +    new =3D g_malloc(sizeof(*new));
> > > +    memcpy(new, map, sizeof(*new));
> > > +    g_tree_insert(tree->taddr_iova_map, new, new);
> >
> >
> > Can the caller map two IOVA ranges to the same e.g GPA range?
> >
>
> It shouldn't matter, because we are totally ignoring GPA here. HVA
> could be more problematic.
>
> We call it from two places: The shadow vring addresses and through the
> memory listener. The SVQ vring addresses should already be on a
> separated translated address from each one and guest's HVA because of
> malloc semantics.

Right, so SVQ addresses should be fine, the problem is the guest mappings.

>
> Regarding the listener, it should already report flattened memory with
> no overlapping between the HVA chunks.
> vhost_vdpa_listener_skipped_section should skip all problematic
> sections if I'm not wrong.
>
> But I may have missed some scenarios: vdpa devices only care about
> IOVA -> HVA translation, so two IOVA could translate to the same HVA
> in theory and we would not notice until we try with SVQ. To develop an
> algorithm to handle this seems complicated at this moment: Should we
> keep the bigger one? The last mapped? What happens if the listener
> unmaps one of them, we suddenly must start translating from the not
> unmapping? Seems that some kind of stacking would be needed.
>
> Thanks!

It looks to me that we should always try to allocate new iova each
time, even if the HVA is the same. This means we need to remove the
reverse mapping tree.

Currently we had:

    /* Check for collisions in translated addresses */
    if (vhost_iova_tree_find_iova(tree, map)) {
        return IOVA_ERR_OVERLAP;
    }

We probably need to remove that. And during the translation we need to
iterate the whole iova tree to get the reverse mapping instead by
returning the largest possible mapping there.

But this may degrade the performance, but consider the memslots should
not be much at most of the time, it should be fine.

Thanks


>
> > Thanks
> >
> >
> > > +    return IOVA_OK;
> > > +}
> > > +
> > > +/**
> > > + * Remove existing mappings from iova tree
> > > + *
> > > + * @param  iova_tree  The vhost iova tree
> > > + * @param  map        The map to remove
> > > + */
> > > +void vhost_iova_tree_remove(VhostIOVATree *iova_tree, const DMAMap *=
map)
> > > +{
> > > +    const DMAMap *overlap;
> > > +
> > > +    iova_tree_remove(iova_tree->iova_taddr_map, map);
> > > +    while ((overlap =3D vhost_iova_tree_find_iova(iova_tree, map))) =
{
> > > +        g_tree_remove(iova_tree->taddr_iova_map, overlap);
> > > +    }
> > > +}
> > > diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
> > > index 2dc87613bc..6047670804 100644
> > > --- a/hw/virtio/meson.build
> > > +++ b/hw/virtio/meson.build
> > > @@ -11,7 +11,7 @@ softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('=
vhost-stub.c'))
> > >
> > >   virtio_ss =3D ss.source_set()
> > >   virtio_ss.add(files('virtio.c'))
> > > -virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost=
-backend.c', 'vhost-shadow-virtqueue.c'))
> > > +virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost=
-backend.c', 'vhost-shadow-virtqueue.c', 'vhost-iova-tree.c'))
> > >   virtio_ss.add(when: 'CONFIG_VHOST_USER', if_true: files('vhost-user=
.c'))
> > >   virtio_ss.add(when: 'CONFIG_VHOST_VDPA', if_true: files('vhost-vdpa=
.c'))
> > >   virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio=
-balloon.c'))
> >
>


