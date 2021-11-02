Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADC2442970
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 09:30:51 +0100 (CET)
Received: from localhost ([::1]:47366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhpBx-000222-1J
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 04:30:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhpAh-0000rS-L2
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:29:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhpAc-0004Dh-Hz
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:29:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635841765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b53B9dhgvjmcnB8dvkX/ZoMLsvTOhTJEt2/sEijgw1w=;
 b=ZJb2ad7UgO9wQG4FYmu+xZMTbWUoTY9PWDWeVeN/9m9zBXVcFFZyztyUmssMgNPJMS2QGt
 cxTCMnHGPSG+Vt2uZfbWICosYVbt5xy4ShOt9mv5bwomD/PUqyqd5BNczaQIL4tUNwLC+G
 ESay93G/vPxyT4vhMxMMQ2H9ZGkfgEI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-90tx-oZrMNiQFgqh5MJdzw-1; Tue, 02 Nov 2021 04:29:24 -0400
X-MC-Unique: 90tx-oZrMNiQFgqh5MJdzw-1
Received: by mail-qt1-f197.google.com with SMTP id
 v20-20020ac85794000000b002a7fc7cf1d8so14068092qta.11
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 01:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=b53B9dhgvjmcnB8dvkX/ZoMLsvTOhTJEt2/sEijgw1w=;
 b=YMoKFzWw/1MTZpE2FjUQM7oUr/0x8YfA9RaHFuuXzlpYvvToJ99tO8C/wh4vt9n8AZ
 aO1a9KFQH84/b+wcBhDgSxC0ql1lopz4j11D8T8Of+qZqOQbUgAsnyRbYOvEbiDVrP4z
 YhoL6t0/iA7LcMsFw04BVp4aKCNkENQd9smfNUw0NgL8wkIksRlAh2L749mF/S7VAxn9
 ryj5gq4HhyT6AlEguaOmtK+afSAkwRWWVJAS0aaL4Gpp+Drt3BEylWoJ/8lOXQ3uu/gA
 vXyPUH5XQcILQYyoQnA6WOSsYKZDhRUWkFD24OZ7ZC06Sl6lrOHjOnYp/rYCiy9d2nOt
 TmVw==
X-Gm-Message-State: AOAM532t+cOyIKjght6e8L9IEpnoPTeDqoFoiKbcFYzyYKX4Q5dauc3M
 0EtMjLE+Qi8k//AGj6wDhrREBnZqkpRresmLwLLYJs4zlUlSp3YoDsGzlXo5uWb5hlDqsFIVwoV
 0/UPhLUkrFJDrYRFRrA/qZLwJKhSlSeE=
X-Received: by 2002:a05:620a:460e:: with SMTP id
 br14mr9548111qkb.16.1635841763617; 
 Tue, 02 Nov 2021 01:29:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJys8K0gmFwEmXtYKptbA1l9h8A61yOzA8qgdg2dx3OfFPF7zcs7z5hedk3sPhC1s3QO7YoyO6LctmIPrSq0IPQ=
X-Received: by 2002:a05:620a:460e:: with SMTP id
 br14mr9548085qkb.16.1635841763369; 
 Tue, 02 Nov 2021 01:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211029183525.1776416-1-eperezma@redhat.com>
 <20211029183525.1776416-24-eperezma@redhat.com>
 <86873f67-a2d0-7d4f-a2cf-8c4f32d9bd7f@redhat.com>
In-Reply-To: <86873f67-a2d0-7d4f-a2cf-8c4f32d9bd7f@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 2 Nov 2021 09:28:47 +0100
Message-ID: <CAJaqyWeWCwFfznbPVjcOYQeFYeDmFJy9ViWx4bQnTzGp73O8Ww@mail.gmail.com>
Subject: Re: [RFC PATCH v5 23/26] util: Add iova_tree_alloc
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Xiao W Wang <xiao.w.wang@intel.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Parav Pandit <parav@mellanox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 2, 2021 at 7:35 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/10/30 =E4=B8=8A=E5=8D=882:35, Eugenio P=C3=A9rez =E5=86=99=
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
> > ---
> >   include/qemu/iova-tree.h |  17 +++++
> >   util/iova-tree.c         | 139 ++++++++++++++++++++++++++++++++++++++=
+
> >   2 files changed, 156 insertions(+)
> >
> > diff --git a/include/qemu/iova-tree.h b/include/qemu/iova-tree.h
> > index 8249edd764..33f9b2e13f 100644
> > --- a/include/qemu/iova-tree.h
> > +++ b/include/qemu/iova-tree.h
> > @@ -29,6 +29,7 @@
> >   #define  IOVA_OK           (0)
> >   #define  IOVA_ERR_INVALID  (-1) /* Invalid parameters */
> >   #define  IOVA_ERR_OVERLAP  (-2) /* IOVA range overlapped */
> > +#define  IOVA_ERR_NOMEM    (-3) /* Cannot allocate */
>
>
> I think we need a better name other than "NOMEM", since it's actually
> means there's no sufficient hole for the range?
>

Actually, yes. I'm totally fine with changing it, but "the
inspiration" is that ENOMEM is also the error that malloc sets in
errno if not enough contiguous VM can be allocated.

What would be a more descriptive name?

>
> >
> >   typedef struct IOVATree IOVATree;
> >   typedef struct DMAMap {
> > @@ -119,6 +120,22 @@ const DMAMap *iova_tree_find_address(const IOVATre=
e *tree, hwaddr iova);
> >    */
> >   void iova_tree_foreach(IOVATree *tree, iova_tree_iterator iterator);
> >
> > +/**
> > + * iova_tree_alloc:
> > + *
> > + * @tree: the iova tree to allocate from
> > + * @map: the new map (as translated addr & size) to allocate in iova r=
egion
> > + * @iova_begin: the minimum address of the allocation
> > + * @iova_end: the maximum addressable direction of the allocation
> > + *
> > + * Allocates a new region of a given size, between iova_min and iova_m=
ax.
> > + *
> > + * Return: Same as iova_tree_insert, but cannot overlap and can be out=
 of
> > + * free contiguous range. Caller can get the assigned iova in map->iov=
a.
> > + */
> > +int iova_tree_alloc(IOVATree *tree, DMAMap *map, hwaddr iova_begin,
> > +                    hwaddr iova_end);
> > +
>
>
> "iova_tree_alloc_map" seems better.
>

Right, I changed in vhost but I forgot to change here.

>
> >   /**
> >    * iova_tree_destroy:
> >    *
> > diff --git a/util/iova-tree.c b/util/iova-tree.c
> > index 23ea35b7a4..27c921c4e2 100644
> > --- a/util/iova-tree.c
> > +++ b/util/iova-tree.c
> > @@ -16,6 +16,36 @@ struct IOVATree {
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
> > +    /* The last addressable allowed in the allocation */
> > +    hwaddr iova_last;
> > +
> > +    /* Previously-to-last iterated map, can be NULL in the first node =
*/
> > +    const DMAMap *hole_left;
> > +
> > +    /* Last iterated map */
> > +    const DMAMap *hole_right;
>
>
> Any reason we can move those to IOVATree structure, it can simplify a
> lot of things.
>

I can move for the next version for sure, but then it needs to be
clear enough that these fields are alloc arguments.

>
> > +};
> > +
> > +/**
> > + * Iterate args to tne next hole

s/tne/the/

> > + *
> > + * @args  The alloc arguments
> > + * @next  The next mapping in the tree. Can be NULL to signal the last=
 one
> > + */
> > +static void iova_tree_alloc_args_iterate(struct IOVATreeAllocArgs *arg=
s,
> > +                                         const DMAMap *next) {
> > +    args->hole_left =3D args->hole_right;
> > +    args->hole_right =3D next;
> > +}
> > +
> >   static int iova_tree_compare(gconstpointer a, gconstpointer b, gpoint=
er data)
> >   {
> >       const DMAMap *m1 =3D a, *m2 =3D b;
> > @@ -107,6 +137,115 @@ int iova_tree_remove(IOVATree *tree, const DMAMap=
 *map)
> >       return IOVA_OK;
> >   }
> >
> > +/**
> > + * Try to accomodate a map of size ret->size in a hole between
> > + * max(end(hole_left), iova_start).
> > + *
> > + * @args Arguments to allocation
> > + */
> > +static bool iova_tree_alloc_map_in_hole(const struct IOVATreeAllocArgs=
 *args)
> > +{
> > +    const DMAMap *left =3D args->hole_left, *right =3D args->hole_righ=
t;
> > +    uint64_t hole_start, hole_last;
> > +
> > +    if (right && right->iova + right->size < args->iova_begin) {
> > +        return false;
> > +    }
> > +
> > +    if (left && left->iova > args->iova_last) {
> > +        return false;
> > +    }
> > +
> > +    hole_start =3D MAX(left ? left->iova + left->size + 1 : 0, args->i=
ova_begin);
> > +    hole_last =3D MIN(right ? right->iova : HWADDR_MAX, args->iova_las=
t);
> > +
> > +    if (hole_last - hole_start > args->new_size) {
> > +        /* We found a valid hole. */
> > +        return true;
> > +    }
> > +
> > +    /* Keep iterating */
> > +    return false;
> > +}
> > +
> > +/**
> > + * Foreach dma node in the tree, compare if there is a hole wit its pr=
evious
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
> > +    if (args->hole_left && args->hole_left->iova > args->iova_last) {
> > +        return true;
> > +    }
> > +
> > +    if (iova_tree_alloc_map_in_hole(args)) {
> > +        return true;
> > +    }
> > +
> > +    return false;
> > +}
> > +
> > +int iova_tree_alloc(IOVATree *tree, DMAMap *map, hwaddr iova_begin,
> > +                    hwaddr iova_last)
> > +{
> > +    struct IOVATreeAllocArgs args =3D {
> > +        .new_size =3D map->size,
> > +        .iova_begin =3D iova_begin,
> > +        .iova_last =3D iova_last,
> > +    };
> > +
> > +    if (iova_begin =3D=3D 0) {
> > +        /* Some devices does not like addr 0 */
> > +        iova_begin +=3D qemu_real_host_page_size;
> > +    }
> > +
> > +    assert(iova_begin < iova_last);
> > +
> > +    /*
> > +     * Find a valid hole for the mapping
> > +     *
> > +     * Assuming low iova_begin, so no need to do a binary search to
> > +     * locate the first node.
> > +     *
> > +     * TODO: We can improve the search speed if we save the beginning =
and the
> > +     * end of holes, so we don't iterate over the previous saved ones.
> > +     *
> > +     * TODO: Replace all this with g_tree_node_first/next/last when av=
ailable
> > +     * (from glib since 2.68). To do it with g_tree_foreach complicate=
s the
> > +     * code a lot.
>
>
> To say the truth, the codes in iova_tree_alloc_traverse() is hard to be
> reviewed. I think it would be easy to use first/next/last. What we
> really need is to calculate the hole between two ranges with handmade
> first, last.
>

I totally agree on that, but we don't have first/next/last in GTree
until glib 2.68. Can we raise the minimum version required?

Another possibility that comes to my mind is to either have a list /
tree of free regions, or directly a custom allocator for this.

> Thanks
>
>
> > +     *
> > +     */
> > +    g_tree_foreach(tree->tree, iova_tree_alloc_traverse, &args);
> > +    if (!iova_tree_alloc_map_in_hole(&args)) {
> > +        /*
> > +         * 2nd try: Last iteration left args->right as the last DMAMap=
. But
> > +         * (right, end) hole needs to be checked too
> > +         */
> > +        iova_tree_alloc_args_iterate(&args, NULL);
> > +        if (!iova_tree_alloc_map_in_hole(&args)) {
> > +            return IOVA_ERR_NOMEM;
> > +        }
> > +    }
> > +
> > +    map->iova =3D MAX(iova_begin,
> > +                    args.hole_left ?
> > +                    args.hole_left->iova + args.hole_left->size + 1 : =
0);
> > +    return iova_tree_insert(tree, map);
> > +}
> > +
> >   void iova_tree_destroy(IOVATree *tree)
> >   {
> >       g_tree_destroy(tree->tree);
>


