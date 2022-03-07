Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 107584CF434
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 10:05:10 +0100 (CET)
Received: from localhost ([::1]:39248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR9Ii-0007Ht-TB
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 04:05:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nR9Ah-0003RX-8p
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 03:56:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nR9Ad-0001Fj-4g
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 03:56:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646643406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IjMMZimk+X3/EcnAkVirHt3NLXDuCfyA/GIkqi0/kYQ=;
 b=Jv+dhzA80pizaGq24V4vXJ3SbBnIWN2qCfoL9QA+3QLckiuEVEd9n1glJn3M3u4wQdL5QF
 up1Z4bbGQVzF9PuZivTANC79VqDCeJFlMEJHnuZiW0Zqbq0ffQq48vKU5TvAD9Y/mishqL
 ptZdSLInR4h8wUQuewa1YoleNyT4kJs=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-PeUBFZWJPiSH050wylyvUA-1; Mon, 07 Mar 2022 03:56:39 -0500
X-MC-Unique: PeUBFZWJPiSH050wylyvUA-1
Received: by mail-qt1-f197.google.com with SMTP id
 m12-20020ac807cc000000b002e05dbf21acso4404111qth.22
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 00:56:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IjMMZimk+X3/EcnAkVirHt3NLXDuCfyA/GIkqi0/kYQ=;
 b=gCbrgQDEfb+dx9kU191t/YuFCxgzzX0y4TC5qd/cry9l/6NlQTyeqYjDUv9CD5mMVF
 6obQCwQF5JdsGZSKE3xdht3csbbj8Ix9/Z123hFQEN9eppzuLXvxk+7agLYs5vKPd+dW
 7m6fV5pLwatnUbifWyq26Ewk+hzEPrBL9d4zfOzaOZZxxonS9Pny9y48UDiZwlK9qQjC
 2QJ6zQ1BZGurARNc7plcAPpSuKJy24GRdF4uEB+cq8t7f855QCG/racTDpdZI08pLc59
 jUz2ENVgHpnYcoqlBq/BMeFaC462bw1D17wap5vd1wLlRtjoyVxERC2QRUOwDgT2DBpI
 We2Q==
X-Gm-Message-State: AOAM532x+Hh+/Hp0a8BZSRw+caC/KbECJP4NS/BFlo6r23OGqAHWvHg5
 j3DYI/LOty2zNgoqDofwwXOBkVsZiVv17o8clOkC8eSDpxARyPACv5H/zpTPjIzhGlRObHx0xLn
 yhm9+XOi5Zvcp3yKr5SK0SacdLJBlRDI=
X-Received: by 2002:a05:622a:1301:b0:2de:82c5:8409 with SMTP id
 v1-20020a05622a130100b002de82c58409mr8403617qtk.403.1646643398597; 
 Mon, 07 Mar 2022 00:56:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzkQiRngdDY9vLyS/3KBfWs/0bz1DBiTfANbmN1K9hj7Sg7GIEk46HGW5cNkb/iDkW5vSo48wClsLKWi2wKXAM=
X-Received: by 2002:a05:622a:1301:b0:2de:82c5:8409 with SMTP id
 v1-20020a05622a130100b002de82c58409mr8403592qtk.403.1646643398232; Mon, 07
 Mar 2022 00:56:38 -0800 (PST)
MIME-Version: 1.0
References: <20220227134111.3254066-1-eperezma@redhat.com>
 <20220227134111.3254066-10-eperezma@redhat.com>
 <7f6f5118-4228-6dcb-f3d4-3e64aeb3608c@redhat.com>
 <CAJaqyWchLxXTRBE9zT9ZrF7UT_CnNbD=E5yaK6NrF-gDauhSAg@mail.gmail.com>
 <CACGkMEsSBGo7+ox9V4tjY6Eq_rcJp0E6jXaQA=jhNh4AfdOMdw@mail.gmail.com>
 <CAJaqyWcsUv=Kc8up=T103wz8uy8YWd+6gK3Pm5PXwHVVMuLM2Q@mail.gmail.com>
 <CACGkMEugHnWf91Gmgecrr_YtrVC1Zp140O-s9=H1NniR0dGwvg@mail.gmail.com>
In-Reply-To: <CACGkMEugHnWf91Gmgecrr_YtrVC1Zp140O-s9=H1NniR0dGwvg@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 7 Mar 2022 09:56:02 +0100
Message-ID: <CAJaqyWem1ZqLkgVcpW6pRhgDwFxgXpFpJX_bot-xFuRwfu_hbQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/14] vhost: Add VhostIOVATree
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Mon, Mar 7, 2022 at 4:42 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Mar 4, 2022 at 4:02 PM Eugenio Perez Martin <eperezma@redhat.com>=
 wrote:
> >
> > On Fri, Mar 4, 2022 at 3:04 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > On Fri, Mar 4, 2022 at 12:33 AM Eugenio Perez Martin
> > > <eperezma@redhat.com> wrote:
> > > >
> > > > On Mon, Feb 28, 2022 at 8:06 AM Jason Wang <jasowang@redhat.com> wr=
ote:
> > > > >
> > > > >
> > > > > =E5=9C=A8 2022/2/27 =E4=B8=8B=E5=8D=889:41, Eugenio P=C3=A9rez =
=E5=86=99=E9=81=93:
> > > > > > This tree is able to look for a translated address from an IOVA=
 address.
> > > > > >
> > > > > > At first glance it is similar to util/iova-tree. However, SVQ w=
orking on
> > > > > > devices with limited IOVA space need more capabilities, like al=
locating
> > > > > > IOVA chunks or performing reverse translations (qemu addresses =
to iova).
> > > > > >
> > > > > > The allocation capability, as "assign a free IOVA address to th=
is chunk
> > > > > > of memory in qemu's address space" allows shadow virtqueue to c=
reate a
> > > > > > new address space that is not restricted by guest's addressable=
 one, so
> > > > > > we can allocate shadow vqs vrings outside of it.
> > > > > >
> > > > > > It duplicates the tree so it can search efficiently in both dir=
ections,
> > > > > > and it will signal overlap if iova or the translated address is=
 present
> > > > > > in any tree.
> > > > > >
> > > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > > > ---
> > > > > >   hw/virtio/vhost-iova-tree.h |  27 +++++++
> > > > > >   hw/virtio/vhost-iova-tree.c | 155 +++++++++++++++++++++++++++=
+++++++++
> > > > > >   hw/virtio/meson.build       |   2 +-
> > > > > >   3 files changed, 183 insertions(+), 1 deletion(-)
> > > > > >   create mode 100644 hw/virtio/vhost-iova-tree.h
> > > > > >   create mode 100644 hw/virtio/vhost-iova-tree.c
> > > > > >
> > > > > > diff --git a/hw/virtio/vhost-iova-tree.h b/hw/virtio/vhost-iova=
-tree.h
> > > > > > new file mode 100644
> > > > > > index 0000000000..6a4f24e0f9
> > > > > > --- /dev/null
> > > > > > +++ b/hw/virtio/vhost-iova-tree.h
> > > > > > @@ -0,0 +1,27 @@
> > > > > > +/*
> > > > > > + * vhost software live migration iova tree
> > > > > > + *
> > > > > > + * SPDX-FileCopyrightText: Red Hat, Inc. 2021
> > > > > > + * SPDX-FileContributor: Author: Eugenio P=C3=A9rez <eperezma@=
redhat.com>
> > > > > > + *
> > > > > > + * SPDX-License-Identifier: GPL-2.0-or-later
> > > > > > + */
> > > > > > +
> > > > > > +#ifndef HW_VIRTIO_VHOST_IOVA_TREE_H
> > > > > > +#define HW_VIRTIO_VHOST_IOVA_TREE_H
> > > > > > +
> > > > > > +#include "qemu/iova-tree.h"
> > > > > > +#include "exec/memory.h"
> > > > > > +
> > > > > > +typedef struct VhostIOVATree VhostIOVATree;
> > > > > > +
> > > > > > +VhostIOVATree *vhost_iova_tree_new(uint64_t iova_first, uint64=
_t iova_last);
> > > > > > +void vhost_iova_tree_delete(VhostIOVATree *iova_tree);
> > > > > > +G_DEFINE_AUTOPTR_CLEANUP_FUNC(VhostIOVATree, vhost_iova_tree_d=
elete);
> > > > > > +
> > > > > > +const DMAMap *vhost_iova_tree_find_iova(const VhostIOVATree *i=
ova_tree,
> > > > > > +                                        const DMAMap *map);
> > > > > > +int vhost_iova_tree_map_alloc(VhostIOVATree *iova_tree, DMAMap=
 *map);
> > > > > > +void vhost_iova_tree_remove(VhostIOVATree *iova_tree, const DM=
AMap *map);
> > > > > > +
> > > > > > +#endif
> > > > > > diff --git a/hw/virtio/vhost-iova-tree.c b/hw/virtio/vhost-iova=
-tree.c
> > > > > > new file mode 100644
> > > > > > index 0000000000..03496ac075
> > > > > > --- /dev/null
> > > > > > +++ b/hw/virtio/vhost-iova-tree.c
> > > > > > @@ -0,0 +1,155 @@
> > > > > > +/*
> > > > > > + * vhost software live migration iova tree
> > > > > > + *
> > > > > > + * SPDX-FileCopyrightText: Red Hat, Inc. 2021
> > > > > > + * SPDX-FileContributor: Author: Eugenio P=C3=A9rez <eperezma@=
redhat.com>
> > > > > > + *
> > > > > > + * SPDX-License-Identifier: GPL-2.0-or-later
> > > > > > + */
> > > > > > +
> > > > > > +#include "qemu/osdep.h"
> > > > > > +#include "qemu/iova-tree.h"
> > > > > > +#include "vhost-iova-tree.h"
> > > > > > +
> > > > > > +#define iova_min_addr qemu_real_host_page_size
> > > > > > +
> > > > > > +/**
> > > > > > + * VhostIOVATree, able to:
> > > > > > + * - Translate iova address
> > > > > > + * - Reverse translate iova address (from translated to iova)
> > > > > > + * - Allocate IOVA regions for translated range (linear operat=
ion)
> > > > > > + */
> > > > > > +struct VhostIOVATree {
> > > > > > +    /* First addressable iova address in the device */
> > > > > > +    uint64_t iova_first;
> > > > > > +
> > > > > > +    /* Last addressable iova address in the device */
> > > > > > +    uint64_t iova_last;
> > > > > > +
> > > > > > +    /* IOVA address to qemu memory maps. */
> > > > > > +    IOVATree *iova_taddr_map;
> > > > > > +
> > > > > > +    /* QEMU virtual memory address to iova maps */
> > > > > > +    GTree *taddr_iova_map;
> > > > > > +};
> > > > > > +
> > > > > > +static gint vhost_iova_tree_cmp_taddr(gconstpointer a, gconstp=
ointer b,
> > > > > > +                                      gpointer data)
> > > > > > +{
> > > > > > +    const DMAMap *m1 =3D a, *m2 =3D b;
> > > > > > +
> > > > > > +    if (m1->translated_addr > m2->translated_addr + m2->size) =
{
> > > > > > +        return 1;
> > > > > > +    }
> > > > > > +
> > > > > > +    if (m1->translated_addr + m1->size < m2->translated_addr) =
{
> > > > > > +        return -1;
> > > > > > +    }
> > > > > > +
> > > > > > +    /* Overlapped */
> > > > > > +    return 0;
> > > > > > +}
> > > > > > +
> > > > > > +/**
> > > > > > + * Create a new IOVA tree
> > > > > > + *
> > > > > > + * Returns the new IOVA tree
> > > > > > + */
> > > > > > +VhostIOVATree *vhost_iova_tree_new(hwaddr iova_first, hwaddr i=
ova_last)
> > > > > > +{
> > > > > > +    VhostIOVATree *tree =3D g_new(VhostIOVATree, 1);
> > > > > > +
> > > > > > +    /* Some devices do not like 0 addresses */
> > > > > > +    tree->iova_first =3D MAX(iova_first, iova_min_addr);
> > > > > > +    tree->iova_last =3D iova_last;
> > > > > > +
> > > > > > +    tree->iova_taddr_map =3D iova_tree_new();
> > > > > > +    tree->taddr_iova_map =3D g_tree_new_full(vhost_iova_tree_c=
mp_taddr, NULL,
> > > > > > +                                           NULL, g_free);
> > > > > > +    return tree;
> > > > > > +}
> > > > > > +
> > > > > > +/**
> > > > > > + * Delete an iova tree
> > > > > > + */
> > > > > > +void vhost_iova_tree_delete(VhostIOVATree *iova_tree)
> > > > > > +{
> > > > > > +    iova_tree_destroy(iova_tree->iova_taddr_map);
> > > > > > +    g_tree_unref(iova_tree->taddr_iova_map);
> > > > > > +    g_free(iova_tree);
> > > > > > +}
> > > > > > +
> > > > > > +/**
> > > > > > + * Find the IOVA address stored from a memory address
> > > > > > + *
> > > > > > + * @tree     The iova tree
> > > > > > + * @map      The map with the memory address
> > > > > > + *
> > > > > > + * Return the stored mapping, or NULL if not found.
> > > > > > + */
> > > > > > +const DMAMap *vhost_iova_tree_find_iova(const VhostIOVATree *t=
ree,
> > > > > > +                                        const DMAMap *map)
> > > > > > +{
> > > > > > +    return g_tree_lookup(tree->taddr_iova_map, map);
> > > > > > +}
> > > > > > +
> > > > > > +/**
> > > > > > + * Allocate a new mapping
> > > > > > + *
> > > > > > + * @tree  The iova tree
> > > > > > + * @map   The iova map
> > > > > > + *
> > > > > > + * Returns:
> > > > > > + * - IOVA_OK if the map fits in the container
> > > > > > + * - IOVA_ERR_INVALID if the map does not make sense (like siz=
e overflow)
> > > > > > + * - IOVA_ERR_OVERLAP if the tree already contains that map
> > > > > > + * - IOVA_ERR_NOMEM if tree cannot allocate more space.
> > > > > > + *
> > > > > > + * It returns assignated iova in map->iova if return value is =
VHOST_DMA_MAP_OK.
> > > > > > + */
> > > > > > +int vhost_iova_tree_map_alloc(VhostIOVATree *tree, DMAMap *map=
)
> > > > > > +{
> > > > > > +    /* Some vhost devices do not like addr 0. Skip first page =
*/
> > > > > > +    hwaddr iova_first =3D tree->iova_first ?: qemu_real_host_p=
age_size;
> > > > > > +    DMAMap *new;
> > > > > > +    int r;
> > > > > > +
> > > > > > +    if (map->translated_addr + map->size < map->translated_add=
r ||
> > > > > > +        map->perm =3D=3D IOMMU_NONE) {
> > > > > > +        return IOVA_ERR_INVALID;
> > > > > > +    }
> > > > > > +
> > > > > > +    /* Check for collisions in translated addresses */
> > > > > > +    if (vhost_iova_tree_find_iova(tree, map)) {
> > > > > > +        return IOVA_ERR_OVERLAP;
> > > > > > +    }
> > > > > > +
> > > > > > +    /* Allocate a node in IOVA address */
> > > > > > +    r =3D iova_tree_alloc_map(tree->iova_taddr_map, map, iova_=
first,
> > > > > > +                            tree->iova_last);
> > > > > > +    if (r !=3D IOVA_OK) {
> > > > > > +        return r;
> > > > > > +    }
> > > > > > +
> > > > > > +    /* Allocate node in qemu -> iova translations */
> > > > > > +    new =3D g_malloc(sizeof(*new));
> > > > > > +    memcpy(new, map, sizeof(*new));
> > > > > > +    g_tree_insert(tree->taddr_iova_map, new, new);
> > > > >
> > > > >
> > > > > Can the caller map two IOVA ranges to the same e.g GPA range?
> > > > >
> > > >
> > > > It shouldn't matter, because we are totally ignoring GPA here. HVA
> > > > could be more problematic.
> > > >
> > > > We call it from two places: The shadow vring addresses and through =
the
> > > > memory listener. The SVQ vring addresses should already be on a
> > > > separated translated address from each one and guest's HVA because =
of
> > > > malloc semantics.
> > >
> > > Right, so SVQ addresses should be fine, the problem is the guest mapp=
ings.
> > >
> > > >
> > > > Regarding the listener, it should already report flattened memory w=
ith
> > > > no overlapping between the HVA chunks.
> > > > vhost_vdpa_listener_skipped_section should skip all problematic
> > > > sections if I'm not wrong.
> > > >
> > > > But I may have missed some scenarios: vdpa devices only care about
> > > > IOVA -> HVA translation, so two IOVA could translate to the same HV=
A
> > > > in theory and we would not notice until we try with SVQ. To develop=
 an
> > > > algorithm to handle this seems complicated at this moment: Should w=
e
> > > > keep the bigger one? The last mapped? What happens if the listener
> > > > unmaps one of them, we suddenly must start translating from the not
> > > > unmapping? Seems that some kind of stacking would be needed.
> > > >
> > > > Thanks!
> > >
> > > It looks to me that we should always try to allocate new iova each
> > > time, even if the HVA is the same. This means we need to remove the
> > > reverse mapping tree.
> > >
> > > Currently we had:
> > >
> > >     /* Check for collisions in translated addresses */
> > >     if (vhost_iova_tree_find_iova(tree, map)) {
> > >         return IOVA_ERR_OVERLAP;
> > >     }
> > >
> > > We probably need to remove that. And during the translation we need t=
o
> > > iterate the whole iova tree to get the reverse mapping instead by
> > > returning the largest possible mapping there.
> > >
> >
> > I'm not sure if that is possible. g_tree_insert() calls the comparison
> > methods so it knows where to place the new element, so it's expected
> > to do something if the node already exists. Looking at the sources it
> > actually silently destroys the new node. If we call g_tree_replace, we
> > achieve the opposite and destroy the old node. But the tree is
> > expected to have non-overlapping keys.
>
> So the problem is that the current IOVA tree design is not fit for our
> requirement:
>
> static inline void iova_tree_insert_internal(GTree *gtree, DMAMap *range)
> {
>     /* Key and value are sharing the same range data */
>     g_tree_insert(gtree, range, range);
> }
>
> It looks to me we need to  extend the current IOVA tree, split IOVA
> range as key, this allows us to do an IOVA allocator on top. If we use
> IOVA as the key, we can do
>
> IOVA1->HVA
> IOVA2->HVA
>

I don't get 100% of this first part, but I think I get the idea in
general terms. What do you mean with "split iova range as key"?

> And then we can remove the current taddr_iova_map which assumes an 1:1
> mapping here. When doing HVA to IOVA translation, we need to iterate
> the tree and return the first match and continue the search until we
> meet the size.
>

Ok this part is doable and actually I've a POC working.

> >
> > Apart from that, we're not using this struct as a tree anymore so it's
> > better to use directly a list in that case.
> >
> > But even with the list there are still questions on how to handle
> > overlappings. How to handle this deletion:
> >
> > * Allocate translated_addr 0, size 0x1000.
> > * Allocate translated_addr 0, size 0x2000.
> > * Delete translated_addr 0, size 0x1000.
> >
> > Should it delete only the first node? Both of them?
>
> I'd suggest removing the taddr_iova_map.
>

We could find it also iterating. I'm not sure if we will ever see it.

> >
> > iova-tree has similar questions too with iova. Inserting (iova=3D0,
> > size=3D0x1000) and deleting (.iova=3D0, size=3D0x800) will delete all t=
he
> > whole node, so we cannot search the translation of (.iova=3D0x900)
> > anymore. Is this expected?
>
> Not sure. When vIOMMU is enabled, the guest risks itself to do this.
> When vIOMMU is not enabled, it should be a bug of qemu to add and
> remove GPA ranges with different size.
>

That's my impression too.

So while it's doable to do it iterating and allowing overlapping maps
that way, my impression is that if we see this in the wild it means
something else is failing: Either qemu is not filtering / flattening
the addresses right, or we are not filtering it right at
vhost_vdpa_listener_skipped_section.

And this is a different problem of how we store the mappings somehow:
The problem is not to store them in a list or a tree or a combination,
but to order them so we pick the same one as the dma_memory_map
function. If we agree that "it should be a bug of qemu to add and
remove GPA ranges with different size", we may well add a simple
reference counter.

Note that I'm 100% with iterate over IOVATree, this is just an example
to expose my point.

Thanks!

> Thanks
>
> >
> > > But this may degrade the performance, but consider the memslots shoul=
d
> > > not be much at most of the time, it should be fine.
> > >
> > > Thanks
> > >
> > >
> > > >
> > > > > Thanks
> > > > >
> > > > >
> > > > > > +    return IOVA_OK;
> > > > > > +}
> > > > > > +
> > > > > > +/**
> > > > > > + * Remove existing mappings from iova tree
> > > > > > + *
> > > > > > + * @param  iova_tree  The vhost iova tree
> > > > > > + * @param  map        The map to remove
> > > > > > + */
> > > > > > +void vhost_iova_tree_remove(VhostIOVATree *iova_tree, const DM=
AMap *map)
> > > > > > +{
> > > > > > +    const DMAMap *overlap;
> > > > > > +
> > > > > > +    iova_tree_remove(iova_tree->iova_taddr_map, map);
> > > > > > +    while ((overlap =3D vhost_iova_tree_find_iova(iova_tree, m=
ap))) {
> > > > > > +        g_tree_remove(iova_tree->taddr_iova_map, overlap);
> > > > > > +    }
> > > > > > +}
> > > > > > diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
> > > > > > index 2dc87613bc..6047670804 100644
> > > > > > --- a/hw/virtio/meson.build
> > > > > > +++ b/hw/virtio/meson.build
> > > > > > @@ -11,7 +11,7 @@ softmmu_ss.add(when: 'CONFIG_ALL', if_true: f=
iles('vhost-stub.c'))
> > > > > >
> > > > > >   virtio_ss =3D ss.source_set()
> > > > > >   virtio_ss.add(files('virtio.c'))
> > > > > > -virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', =
'vhost-backend.c', 'vhost-shadow-virtqueue.c'))
> > > > > > +virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', =
'vhost-backend.c', 'vhost-shadow-virtqueue.c', 'vhost-iova-tree.c'))
> > > > > >   virtio_ss.add(when: 'CONFIG_VHOST_USER', if_true: files('vhos=
t-user.c'))
> > > > > >   virtio_ss.add(when: 'CONFIG_VHOST_VDPA', if_true: files('vhos=
t-vdpa.c'))
> > > > > >   virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('=
virtio-balloon.c'))
> > > > >
> > > >
> > >
> >
>


