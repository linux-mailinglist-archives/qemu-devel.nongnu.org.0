Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B22249DF62
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 11:27:11 +0100 (CET)
Received: from localhost ([::1]:47740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD1zi-0004Al-6i
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 05:27:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nD1jb-00024n-24
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 05:10:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nD1jW-0005AD-96
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 05:10:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643278225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bfVQaIJ1DcBeYqnJqwvWIuAAfdViL1acpZ8f7NZ4lUs=;
 b=G9uiEai6pSPz5CMRHTVFxV5pgn2I///5G7VaePUh3UEDoGs7q2kaBr7LDEA8ABYu56PdNr
 V5kztpslxm6UlZG2GKIug3b6Wjb9bm8OdSPXlxXiZKXCuI37X1XbjKO8siRJZB5kdXz/ko
 HgQglVGFM8D0hfzxvgAkRZA5B4M0cFI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-GsYQKdU1NYKAOymn-xdhuQ-1; Thu, 27 Jan 2022 05:10:21 -0500
X-MC-Unique: GsYQKdU1NYKAOymn-xdhuQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 3-20020ad45b83000000b00423e8603906so2705247qvp.1
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 02:10:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bfVQaIJ1DcBeYqnJqwvWIuAAfdViL1acpZ8f7NZ4lUs=;
 b=dR6fkyGgze4idwD/7PIECDr7QOexCiBFadT0nPf0AK4mhuHFufET5khxsGNG8kpxle
 6glqnmHoTeL0+fTtUTb4yrbQpPrlGOMxFvfDXNUupdN0+UjTDnSs7m+S3UQMMuK61PdC
 BNt2AePnp9+RdKNhtqyUwwS6VE+04UcwP+vxAdrG6Do3YHOvn4MrFpZuJ/c9HbCaG2E1
 yAbu7mHXRBYmw5WmV3K2eGMP70wr6OLR/14kGAsDbSIudcm9Pslgkftj0gNIiOlHBE9B
 BQgR69yeHfqMq1Sf+pYF1QTZZ+l5F1M4JS1r5BytO86Rz9zAf2M75t7zfOITzQmCVA5e
 iMQg==
X-Gm-Message-State: AOAM530GTEJWwfHJpEZiZ2xD0oF02AkyjcF1qwdpgtdHNwYP2mQM2lqV
 9p+ddVIyrIQdt6hF+dRXbn1orVBu5HqbeADWFYWs/RB4btP67dfom68pB6+DoqcEbYn0EegF8SN
 IfVZyui4WkxFXcr4DMl/oKjNt5CBuNT0=
X-Received: by 2002:a05:620a:410b:: with SMTP id
 j11mr1985333qko.486.1643278221248; 
 Thu, 27 Jan 2022 02:10:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpPtS54qKnud4D8QUjIXKcoXof/9iB9+uU+GZngSyBR9ioBI3KvEVQiXzxWBuiLiv3FGeJisKfD5vsQ0JNpvE=
X-Received: by 2002:a05:620a:410b:: with SMTP id
 j11mr1985310qko.486.1643278220909; 
 Thu, 27 Jan 2022 02:10:20 -0800 (PST)
MIME-Version: 1.0
References: <20211029183525.1776416-1-eperezma@redhat.com>
 <20211029183525.1776416-24-eperezma@redhat.com>
 <YfJeZPn6nsCUxFiL@xz-m1.local>
In-Reply-To: <YfJeZPn6nsCUxFiL@xz-m1.local>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 27 Jan 2022 11:09:44 +0100
Message-ID: <CAJaqyWd52cXWHnLsgo=kP2Z7=VG6YKtxFGhTe7OamfYcZxhz6w@mail.gmail.com>
Subject: Re: [RFC PATCH v5 23/26] util: Add iova_tree_alloc
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Parav Pandit <parav@mellanox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 27, 2022 at 9:57 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Fri, Oct 29, 2021 at 08:35:22PM +0200, Eugenio P=C3=A9rez wrote:
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
> >  include/qemu/iova-tree.h |  17 +++++
> >  util/iova-tree.c         | 139 +++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 156 insertions(+)
> >
> > diff --git a/include/qemu/iova-tree.h b/include/qemu/iova-tree.h
> > index 8249edd764..33f9b2e13f 100644
> > --- a/include/qemu/iova-tree.h
> > +++ b/include/qemu/iova-tree.h
> > @@ -29,6 +29,7 @@
> >  #define  IOVA_OK           (0)
> >  #define  IOVA_ERR_INVALID  (-1) /* Invalid parameters */
> >  #define  IOVA_ERR_OVERLAP  (-2) /* IOVA range overlapped */
> > +#define  IOVA_ERR_NOMEM    (-3) /* Cannot allocate */
> >
> >  typedef struct IOVATree IOVATree;
> >  typedef struct DMAMap {
> > @@ -119,6 +120,22 @@ const DMAMap *iova_tree_find_address(const IOVATre=
e *tree, hwaddr iova);
> >   */
> >  void iova_tree_foreach(IOVATree *tree, iova_tree_iterator iterator);
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
> >  /**
> >   * iova_tree_destroy:
> >   *
> > diff --git a/util/iova-tree.c b/util/iova-tree.c
> > index 23ea35b7a4..27c921c4e2 100644
> > --- a/util/iova-tree.c
> > +++ b/util/iova-tree.c
> > @@ -16,6 +16,36 @@ struct IOVATree {
> >      GTree *tree;
> >  };
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
> I slightly prefer having two more fields to cache the result:
>
>        /* If found, we fill in the IOVA here */
>        hwaddr iova_result;
>        /* Whether have we found a valid IOVA */
>        bool   iova_found;
>
> IMHO they'll help on readability.  More below.
>

Sure, this avoids an extra call.

> > +};
> > +
> > +/**
> > + * Iterate args to tne next hole
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
> >  static int iova_tree_compare(gconstpointer a, gconstpointer b, gpointe=
r data)
> >  {
> >      const DMAMap *m1 =3D a, *m2 =3D b;
> > @@ -107,6 +137,115 @@ int iova_tree_remove(IOVATree *tree, const DMAMap=
 *map)
> >      return IOVA_OK;
> >  }
> >
> > +/**
> > + * Try to accomodate a map of size ret->size in a hole between
> > + * max(end(hole_left), iova_start).
>
> I think this functions need the most comments, and above sentence is more=
 or
> less not sounding correct... My try...
>
> /*
>  * Try to find an unallocated IOVA range between LEFT and RIGHT elements.
>  *
>  * There're three cases:
>  *
>  * (1) When LEFT=3D=3DNULL, RIGHT must be non-NULL and it means we're ite=
rating at
>  *     the 1st element.
>  *
>  * (2) When RIGHT=3D=3DNULL, LEFT must be non-NULL and it means we're ite=
rating at
>  *     the last element.
>  *
>  * (3) When both LEFT and RIGHT are non-NULL, this is the most common cas=
e,
>  *     we'll try to find a hole between LEFT and RIGHT mapping.
>  */
>

This is also called with left =3D=3D NULL and right =3D=3D NULL in the firs=
t
allocation with an empty tree. This allows iova_tree_alloc to have the
same code path both if the three is empty or not.

But I can add the use cases in the doc for sure.

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
>
> I assume these values should be always inclusive, hence
>
> s/right->iova/right->iova + 1/
>
> ?
>

Right, it is confusing the way it's written. But I think it should be
right->iova - 1 in any case to make it the hole last element, isn't
it?

Would it work better to rename variable hole_last to hole_end? If not,
we have a special case of the second allocation when iova_begin =3D=3D 0:
- We successfully allocate a DMAMap of size N. By the way the
algorithm works,  it starts at 0, so [0, N] is allocated.
- We try to allocate a second one of size M. At the first iteration,
"right" is the previously allocated DMAMap.
Using the -1 trick we get hole_end =3D=3D HWADDR_MAX.

> > +
> > +    if (hole_last - hole_start > args->new_size) {
> > +        /* We found a valid hole. */
>
> IMHO it's cleaner we simply set:
>
>            args->iova_result =3D hole_start;
>
> Here before stop the iterations.
>

I agree.

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
>
> IMHO this check is redundant and can be dropped, as it's already done in
> iova_tree_alloc_map_in_hole().
>

Assuming we add "iova_found" to iova_tree_alloc_map_in_hole to
IOVATreeAllocArgs as you propose, it returns true if we are able to
allocate a DMAMap entry, so no more iterations are needed. But if it
returns false, it simply means that DMAMap cannot be allocated between
left (or iova_begin) and right (iova_end). It doesn't tell if you can
keep iterating or not. In other words, false =3D=3D keep iterating if you
can.

This other check signals the end of the available hole, and to avoid
iterating beyond iova_last in the (unlikely?) case we have more nodes
to iterate beyond that.

I'll try to make it more explicit.

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
>
> (This should be dropped as the new version goes)
>

Agree.

> > +
> > +    assert(iova_begin < iova_last);
> > +
> > +    /*
> > +     * Find a valid hole for the mapping
> > +     *
> > +     * Assuming low iova_begin, so no need to do a binary search to
> > +     * locate the first node.
>
> We could also mention something like this here:
>
>         *
>         * The traversing will cover all the possible holes but except the=
 last
>         * hole starting from the last element.  We need to handle it sepa=
rately
>         * below.
>         *
>

Ok I will add the comment.

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
> > +     *
> > +     */
> > +    g_tree_foreach(tree->tree, iova_tree_alloc_traverse, &args);
> > +    if (!iova_tree_alloc_map_in_hole(&args)) {
>
> With iova_found, here it could be (hopefully) more readable:
>
>        if (!args->iova_found) {
>            /* If we failed to find a hole in 0..N-1 entries, try the last=
 one */
>            iova_tree_alloc_args_iterate(&args, NULL);
>            iova_tree_alloc_map_in_hole(&args);
>            if (!args->iova_found) {
>                return IOVA_ERR_NOMEM;
>            }
>        }
>
>        map->iova =3D args->iova_result;
>        ...
>

I also think it's more readable this way.

Thanks!

> Thanks,
>
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
> >  void iova_tree_destroy(IOVATree *tree)
> >  {
> >      g_tree_destroy(tree->tree);
> > --
> > 2.27.0
> >
>
> --
> Peter Xu
>


