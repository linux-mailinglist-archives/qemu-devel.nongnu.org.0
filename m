Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FB14CD060
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 09:43:38 +0100 (CET)
Received: from localhost ([::1]:37288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ3XF-0002mi-E2
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 03:43:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nQ3WP-000275-9A
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 03:42:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nQ3WL-0004yC-Fc
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 03:42:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646383359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cI209WSAR81tZFZc5K3zm9uyIG1pQiX823xQXqcFhcQ=;
 b=PznV54UNJCyPHujZBXgpA/8AuMgzi2NxYH0B4tfpg0o7ZILelArMIkRn6l1L02RxQ+4iCH
 riIf6vOEKASDOUWM0TP+fZ0lPe6/WvkxOIA1caY3i3ZAHyjwjLXEfwHczwXRh2+Sp4v/su
 u3Lc7Y9mFZAn8WxV2XmDQ2t1pkao5Ag=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-gNEVKv75OGm1rqKC7gf8cg-1; Fri, 04 Mar 2022 03:42:38 -0500
X-MC-Unique: gNEVKv75OGm1rqKC7gf8cg-1
Received: by mail-qt1-f197.google.com with SMTP id
 t14-20020ac8760e000000b002e049ff9638so2150998qtq.10
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 00:42:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cI209WSAR81tZFZc5K3zm9uyIG1pQiX823xQXqcFhcQ=;
 b=yOK5S+AOzrXhqgYqXL1w8lsGPONWNX0NKmM1sUqTanAqkrOadjqoePBhaYfu13G00R
 LDj8fHnhQQq/JFZUmBGw8Hf2RM/TOoZ99hvlzDlIIxIRzqr1Ui91NbCrNj2rdZ2mzNMe
 6HstO/3h9FQxjh8yZQTDRXUuV8yK4x831/mhgvA1015Hg5Ld6uS32uVybmSgQ1pUlEdl
 4+iNvGRgY2BAIKESkqfbttMPtB5paMQUbqyqgf2zp8tuTy7DCNtBehKp1IIY1xhtI4KL
 2xLQgeNDLYbb3b8hbZdh68eAY/bzrfwNnb0o9BBqMQTfoEZjyb1sTFbz4tR4Vwb0xXRf
 J1Zw==
X-Gm-Message-State: AOAM532eFjgJ0wZTD0AoPvgyvK93/RsVIqhcyL+Gn0babQcvCpF/N9wn
 4SBQZ27csxSekM+cIQQYQ+qz2/s2IDne8+81A0HURMjDToPfh25SbOzVOzK4/3xumrN9e0w5eCW
 LpEaeyzDaObTi0dx83CjCkIuu2Xk72xA=
X-Received: by 2002:ac8:7dc6:0:b0:2de:708:3e3a with SMTP id
 c6-20020ac87dc6000000b002de07083e3amr30756910qte.459.1646383358231; 
 Fri, 04 Mar 2022 00:42:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzO0cLKsDPipegnOB91bhFV431gQ/KwUFlR/MV8tjtoVFS9Z5E9zqIM3waBvKmSejpg7N1/Mr4h7MlQhXsb8bs=
X-Received: by 2002:ac8:7dc6:0:b0:2de:708:3e3a with SMTP id
 c6-20020ac87dc6000000b002de07083e3amr30756892qte.459.1646383357882; Fri, 04
 Mar 2022 00:42:37 -0800 (PST)
MIME-Version: 1.0
References: <20220303185147.3605350-1-eperezma@redhat.com>
 <20220303185147.3605350-9-eperezma@redhat.com>
 <62217530.9030309@huawei.com>
In-Reply-To: <62217530.9030309@huawei.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 4 Mar 2022 09:42:01 +0100
Message-ID: <CAJaqyWfnpGiMnHdAXDH7cETOhzSr54xaBtd+KSGDQcK1bVSiSg@mail.gmail.com>
Subject: Re: [PATCH v4 08/14] util: Add iova_tree_alloc_map
To: Liuxiangdong <liuxiangdong5@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 4, 2022 at 3:11 AM Liuxiangdong <liuxiangdong5@huawei.com> wrot=
e:
>
>
>
> On 2022/3/4 2:51, Eugenio P=C3=A9rez wrote:
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
> >   util/iova-tree.c         | 135 ++++++++++++++++++++++++++++++++++++++=
+
> >   2 files changed, 153 insertions(+)
> >
> > diff --git a/include/qemu/iova-tree.h b/include/qemu/iova-tree.h
> > index 8249edd764..d066400f09 100644
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
> > + * iova_tree_alloc_map:
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
> > index 23ea35b7a4..3160c50d3b 100644
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
> > + * @args: The alloc arguments
> > + * @next: The next mapping in the tree. Can be NULL to signal the last=
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
> > @@ -107,6 +140,108 @@ int iova_tree_remove(IOVATree *tree, const DMAMap=
 *map)
> >       return IOVA_OK;
> >   }
> >
> > +/**
> > + * Try to find an unallocated IOVA range between prev and this element=
s.
> > + *
> > + * @args: Arguments to allocation
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
>
> Hi, Eugenio.
> Is there such a condition that
>
> args->iova_begin > this->iova  and
> args->iova_begin < this->iova + this->size
>

Hi Xiangdong Liu,

With the current code we would never have such a case, since
iova_begin and iova_last are the same in all the life of the tree. So
no previous allocation of that size will be performed ever.

But if caller code changes, the function already supports that:
hole_last will become this->iova, and it will check if the hole ending
on that is big enough to hold the allocation.

Does that solve the question?

Thanks!

>
> Thanks=EF=BC=81
> Xiangdong Liu
>
>
> > +    hole_start =3D MAX(prev ? prev->iova + prev->size + 1 : 0, args->i=
ova_begin);
> > +    hole_last =3D this ? this->iova : HWADDR_MAX;
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
> > + * @key: Node iterating
> > + * @value: Node iterating
> > + * @pargs: Struct to communicate with the outside world
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
> > +    if (unlikely(iova_last < iova_begin)) {
> > +        return IOVA_ERR_INVALID;
> > +    }
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
> > +     */
> > +    g_tree_foreach(tree->tree, iova_tree_alloc_traverse, &args);
> > +    if (!args.iova_found) {
> > +        /*
> > +         * Either tree is empty or the last hole is still not checked.
> > +         * g_tree_foreach does not compare (last, iova_last] range, so=
 we check
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


