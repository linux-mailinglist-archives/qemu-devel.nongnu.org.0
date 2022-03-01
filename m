Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DA44C8967
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 11:37:15 +0100 (CET)
Received: from localhost ([::1]:48380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOzsZ-0004m6-3V
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 05:37:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nOzP5-0004zk-Jt
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 05:06:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nOzP2-00044T-R0
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 05:06:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646129204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1/F+0WwojHyG17pXptWlh/yFEBPmFriBcV9+OCM7LPk=;
 b=FcYQjhRB9PvZISNeq3iVeopIKjtK4GM7GJ5L6p4GSytvZg7eURuo/bUUthD8/037QtshL0
 8xy3b2gAngiHcpU372krTo75BHV8AnKvZeo0cjjlP0D3NY7MZZ6nYGG8vQg2WugTFNOYH5
 lf7/ErJ7r37QOeUniRII+4rURUBL4C4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-V5X_rtlLMbWtaRxoDjT1IA-1; Tue, 01 Mar 2022 05:06:41 -0500
X-MC-Unique: V5X_rtlLMbWtaRxoDjT1IA-1
Received: by mail-qk1-f199.google.com with SMTP id
 k23-20020a05620a139700b0062cda5c6cecso13651423qki.6
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 02:06:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1/F+0WwojHyG17pXptWlh/yFEBPmFriBcV9+OCM7LPk=;
 b=gkug9p5OUaVTRtnFXM97on9OCQMYHUDk3+Fx59Jm+vOcW4g7UQmc5Ya5a7dhOrb+b5
 X8gDNaISvK6/X70iqlTPRBhVUjWM5fn0ViWCIJLzNGzkZ3bWouWD02+6C+ZYmhJogGp2
 eBpKiZ/2tPnw6vhdtTb0SbflEQG5StxLQWt+GNHy+9lnMRfQ/n0XfJlCfpDMP1GjG/OX
 5cout1tJsVuT8WnkKSaG/CHJnka5cw8XeY6qIx9C9St5SqHPTxZi0fRql8QnElp8z5oR
 vHyaFi9+F9Rx2G0FwYywWq9gE66FkazLZxUfi2eby5EbdjtdCT/EcfXoQdb04oON9a89
 3JjQ==
X-Gm-Message-State: AOAM530zi8u+kfki3BH1Q/xw3spw+jtOviOEMdkXwjgCdKi5SPnR/06b
 PtPnORPyRT+QjSPMlTxUqxTbZ43uCJNQfQy2IdnOxgLJXFzMfi3O4OiGkPTjQnuNSoUdRg8ETWm
 Gwh3dPFxgXKoLFxx1poD89AO3MvVbrx0=
X-Received: by 2002:a05:620a:3195:b0:649:2a18:1480 with SMTP id
 bi21-20020a05620a319500b006492a181480mr13463713qkb.308.1646129200774; 
 Tue, 01 Mar 2022 02:06:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7AUCOCXuU8j01tRu2AKSRjBnmyEMQUDQMgmP1ffu4Y5H1rznv/ZWNkhZyEwzndPsFvcqlqiFxVzoYluand0c=
X-Received: by 2002:a05:620a:3195:b0:649:2a18:1480 with SMTP id
 bi21-20020a05620a319500b006492a181480mr13463690qkb.308.1646129200414; Tue, 01
 Mar 2022 02:06:40 -0800 (PST)
MIME-Version: 1.0
References: <20220227134111.3254066-1-eperezma@redhat.com>
 <20220227134111.3254066-9-eperezma@redhat.com>
 <7829cc8d-66d0-cedd-eca5-f899cd5ecd07@redhat.com>
In-Reply-To: <7829cc8d-66d0-cedd-eca5-f899cd5ecd07@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 1 Mar 2022 11:06:04 +0100
Message-ID: <CAJaqyWdNWqpdBQ-iTWLu7fH0prHPo8Uc1LXkEKvQ4X6cp7_TOA@mail.gmail.com>
Subject: Re: [PATCH v2 08/14] util: Add iova_tree_alloc
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

On Mon, Feb 28, 2022 at 7:39 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/2/27 =E4=B8=8B=E5=8D=889:41, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > This iova tree function allows it to look for a hole in allocated
> > regions and return a totally new translation for a given translated
> > address.
> >
> > It's usage is mainly to allow devices to access qemu address space,
> > remapping guest's one into a new iova space where qemu can add chunks o=
f
> > addresses.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > Reviewed-by: Peter Xu <peterx@redhat.com>
> > ---
> >   include/qemu/iova-tree.h |  18 ++++++
> >   util/iova-tree.c         | 133 ++++++++++++++++++++++++++++++++++++++=
+
> >   2 files changed, 151 insertions(+)
> >
> > diff --git a/include/qemu/iova-tree.h b/include/qemu/iova-tree.h
> > index 8249edd764..a623136cd8 100644
> > --- a/include/qemu/iova-tree.h
> > +++ b/include/qemu/iova-tree.h
> > @@ -29,6 +29,7 @@
> >   #define  IOVA_OK           (0)
> >   #define  IOVA_ERR_INVALID  (-1) /* Invalid parameters */
> >   #define  IOVA_ERR_OVERLAP  (-2) /* IOVA range overlapped */
> > +#define  IOVA_ERR_NOMEM    (-3) /* Cannot allocate */
> >
> >   typedef struct IOVATree IOVATree;
> >   typedef struct DMAMap {
> > @@ -119,6 +120,23 @@ const DMAMap *iova_tree_find_address(const IOVATre=
e *tree, hwaddr iova);
> >    */
> >   void iova_tree_foreach(IOVATree *tree, iova_tree_iterator iterator);
> >
> > +/**
> > + * iova_tree_alloc:
>
>
> Should be iova_tree_alloc_map.
>

That's right, I'll change. It's also missing from the patch subject.

>
> > + *
> > + * @tree: the iova tree to allocate from
> > + * @map: the new map (as translated addr & size) to allocate in the io=
va region
> > + * @iova_begin: the minimum address of the allocation
> > + * @iova_end: the maximum addressable direction of the allocation
> > + *
> > + * Allocates a new region of a given size, between iova_min and iova_m=
ax.
> > + *
> > + * Return: Same as iova_tree_insert, but cannot overlap and can return=
 error if
> > + * iova tree is out of free contiguous range. The caller gets the assi=
gned iova
> > + * in map->iova.
> > + */
> > +int iova_tree_alloc_map(IOVATree *tree, DMAMap *map, hwaddr iova_begin=
,
> > +                        hwaddr iova_end);
> > +
> >   /**
> >    * iova_tree_destroy:
> >    *
> > diff --git a/util/iova-tree.c b/util/iova-tree.c
> > index 23ea35b7a4..302b01f1cc 100644
> > --- a/util/iova-tree.c
> > +++ b/util/iova-tree.c
> > @@ -16,6 +16,39 @@ struct IOVATree {
> >       GTree *tree;
> >   };
> >
> > +/* Args to pass to iova_tree_alloc foreach function. */
> > +struct IOVATreeAllocArgs {
> > +    /* Size of the desired allocation */
> > +    size_t new_size;
> > +
> > +    /* The minimum address allowed in the allocation */
> > +    hwaddr iova_begin;
> > +
> > +    /* Map at the left of the hole, can be NULL if "this" is first one=
 */
> > +    const DMAMap *prev;
> > +
> > +    /* Map at the right of the hole, can be NULL if "prev" is the last=
 one */
> > +    const DMAMap *this;
> > +
> > +    /* If found, we fill in the IOVA here */
> > +    hwaddr iova_result;
> > +
> > +    /* Whether have we found a valid IOVA */
> > +    bool iova_found;
> > +};
> > +
> > +/**
> > + * Iterate args to the next hole
> > + *
> > + * @args  The alloc arguments
> > + * @next  The next mapping in the tree. Can be NULL to signal the last=
 one
> > + */
> > +static void iova_tree_alloc_args_iterate(struct IOVATreeAllocArgs *arg=
s,
> > +                                         const DMAMap *next) {
> > +    args->prev =3D args->this;
> > +    args->this =3D next;
> > +}
> > +
> >   static int iova_tree_compare(gconstpointer a, gconstpointer b, gpoint=
er data)
> >   {
> >       const DMAMap *m1 =3D a, *m2 =3D b;
> > @@ -107,6 +140,106 @@ int iova_tree_remove(IOVATree *tree, const DMAMap=
 *map)
> >       return IOVA_OK;
> >   }
> >
> > +/**
> > + * Try to find an unallocated IOVA range between prev and this element=
s.
> > + *
> > + * @args Arguments to allocation
> > + *
> > + * Cases:
> > + *
> > + * (1) !prev, !this: No entries allocated, always succeed
> > + *
> > + * (2) !prev, this: We're iterating at the 1st element.
> > + *
> > + * (3) prev, !this: We're iterating at the last element.
> > + *
> > + * (4) prev, this: this is the most common case, we'll try to find a h=
ole
> > + * between "prev" and "this" mapping.
> > + *
> > + * Note that this function assumes the last valid iova is HWADDR_MAX, =
but it
> > + * searches linearly so it's easy to discard the result if it's not th=
e case.
> > + */
> > +static void iova_tree_alloc_map_in_hole(struct IOVATreeAllocArgs *args=
)
> > +{
> > +    const DMAMap *prev =3D args->prev, *this =3D args->this;
> > +    uint64_t hole_start, hole_last;
> > +
> > +    if (this && this->iova + this->size < args->iova_begin) {
> > +        return;
> > +    }
> > +
> > +    hole_start =3D MAX(prev ? prev->iova + prev->size + 1 : 0, args->i=
ova_begin);
> > +    hole_last =3D this ? this->iova : HWADDR_MAX;
>
>
> Do we need to use iova_last instead of HWADDR_MAX?
>

If I re-add iova_last to this function, this first part is the same as
RFC v5. The only difference would be iova_found.

To simplify this function, I extracted the iova_last check to
iova_tree_alloc_map. I thought this was closer to what you proposed.
As a disadvantage, the search could go beyond iova_last, but this
should not be common.

I'm ok with both versions.

>
> > +
> > +    if (hole_last - hole_start > args->new_size) {
> > +        args->iova_result =3D hole_start;
> > +        args->iova_found =3D true;
> > +    }
> > +}
> > +
> > +/**
> > + * Foreach dma node in the tree, compare if there is a hole with its p=
revious
> > + * node (or minimum iova address allowed) and the node.
> > + *
> > + * @key   Node iterating
> > + * @value Node iterating
> > + * @pargs Struct to communicate with the outside world
> > + *
> > + * Return: false to keep iterating, true if needs break.
> > + */
> > +static gboolean iova_tree_alloc_traverse(gpointer key, gpointer value,
> > +                                         gpointer pargs)
> > +{
> > +    struct IOVATreeAllocArgs *args =3D pargs;
> > +    DMAMap *node =3D value;
> > +
> > +    assert(key =3D=3D value);
> > +
> > +    iova_tree_alloc_args_iterate(args, node);
> > +    iova_tree_alloc_map_in_hole(args);
> > +    return args->iova_found;
> > +}
> > +
> > +int iova_tree_alloc_map(IOVATree *tree, DMAMap *map, hwaddr iova_begin=
,
> > +                        hwaddr iova_last)
> > +{
> > +    struct IOVATreeAllocArgs args =3D {
> > +        .new_size =3D map->size,
> > +        .iova_begin =3D iova_begin,
> > +    };
> > +
> > +    assert(iova_begin < iova_last);
>
>
> Should we use "<=3D" here, otherwise we disallow allocate the size of 1.
>
> And maybe we should return error instead of assert.
>

Right, I'll replace both.

>
> > +
> > +    /*
> > +     * Find a valid hole for the mapping
> > +     *
> > +     * Assuming low iova_begin, so no need to do a binary search to
> > +     * locate the first node.
> > +     *
> > +     * TODO: Replace all this with g_tree_node_first/next/last when av=
ailable
> > +     * (from glib since 2.68). To do it with g_tree_foreach complicate=
s the
> > +     * code a lot.
> > +     *
>
>
> One more question
>
> The current code looks work but still a little bit complicated to be
> reviewed. Looking at the missing helpers above, if the add and remove
> are seldom. I wonder if we can simply do
>
> g_tree_foreach() during each add/del to build a sorted list then we can
> emulate g_tree_node_first/next/last easily?
>

This sounds a lot like the method in v1 [1] :).

But it didn't use the O(N) foreach, since we can locate the new node's
previous element looking for the upper bound of iova-1, maintaining
the insertion's complexity O(log(N)). The function g_tree_upper_bound
is added in Glib version 2.68, so the proposed version will be deleted
sooner or later.

Also the deletion keeps being O(log(N)) since deleting a node in QLIST is O=
(1).

>
> > +     */
> > +    g_tree_foreach(tree->tree, iova_tree_alloc_traverse, &args);
> > +    if (!args.iova_found) {
> > +        /*
> > +         * Either tree is empty or the last hole is still not checked.
> > +         * g_tree_foreach does not compare (last, iova_end] range, so =
we check
>
>
> "(last, iova_last]" ?
>

Right, I'll change it too.

Thanks!

[1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg863699.html
[2] https://docs.gtk.org/glib/method.Tree.upper_bound.html

> Thanks
>
>
> > +         * it here.
> > +         */
> > +        iova_tree_alloc_args_iterate(&args, NULL);
> > +        iova_tree_alloc_map_in_hole(&args);
> > +    }
> > +
> > +    if (!args.iova_found || args.iova_result + map->size > iova_last) =
{
> > +        return IOVA_ERR_NOMEM;
> > +    }
> > +
> > +    map->iova =3D args.iova_result;
> > +    return iova_tree_insert(tree, map);
> > +}
> > +
> >   void iova_tree_destroy(IOVATree *tree)
> >   {
> >       g_tree_destroy(tree->tree);
>


