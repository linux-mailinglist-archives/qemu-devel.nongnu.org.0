Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC05E49B0B9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 10:49:35 +0100 (CET)
Received: from localhost ([::1]:56278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCISE-00049P-PR
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 04:49:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nCILg-00084A-S5
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 04:42:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nCILZ-0006Ji-Sb
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 04:42:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643103642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=awyd3SPyAPD9/QLQqYdhP/ugO9iwBADgjN1euMY4dxE=;
 b=FWU5KNOJ4NRXPEChJ1rS8rtEq+VHI9RTcXIX57Y1om3EJPQ7TuH+2znVxwlkQvhm6mwGlN
 X3b0f4rd0BDVWtxTwxNTq5v0k+onvVkUMbkAisOkQVTGsgsfaGGGeUHGFRJyfdSbqXDGCa
 htwDsWmNfRmkezgG0rzhhAmhbfGFTJ0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-HfmkadJ8OvOFBiCCGCgnbw-1; Tue, 25 Jan 2022 04:40:38 -0500
X-MC-Unique: HfmkadJ8OvOFBiCCGCgnbw-1
Received: by mail-qk1-f197.google.com with SMTP id
 g3-20020a05620a108300b0047e16fc0d6cso3648905qkk.3
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 01:40:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=awyd3SPyAPD9/QLQqYdhP/ugO9iwBADgjN1euMY4dxE=;
 b=o0x91RUkh886kWvRE4F7KQimIT7VnqklQ0Jby47spepWV5yBUh+KuZgnmIMKNXTbo3
 JFtoN4DpkRHTf5OVBzDpXmlPARINks39fEG10Yvt3HwNwwTKwETOmOc1TFKW+60QqjNn
 1I6lFB+9TYeEZ1L0q8GaNqr12vEw+D8wIm1q8aMZF+9Z60iS0wW891jk0n6A7rxc5jpy
 FblaUw8ZphX5MEi4GfkoY+z7FilIbaWeREhWcp0uaRV+8Z+L1K4vLHNdovFzjScPpHcC
 RDhen3XCI+p9m5YOziU0t7eiyl64e3YS/BM9zejao4dKt/qG+ZpsINKy7OXyuT77WAqM
 SUUQ==
X-Gm-Message-State: AOAM533mWHPzxmMjbjpbqzb8DW68TMq2b/FLYygu9vaZWL4+ZFFgssqp
 MQdaJDdAGWw7K73ehoHvg2Txzj/ZJJNS7IIn03OhJWGuA6n7WQP8vtBTI04lXi/N1rWKSqNhPsk
 0UhgYSSf0L332F6A2BMPB2fvUYKZFKTI=
X-Received: by 2002:a05:620a:24cd:: with SMTP id
 m13mr13969038qkn.308.1643103638224; 
 Tue, 25 Jan 2022 01:40:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyWIyjb0WfbDgLcbYpXdRojlUU9HKWUChfS1T00NeCV0JuqOhrIfDA0Zf86x/O3qM0S+qV9yTTwEtivcXjKaQ8=
X-Received: by 2002:a05:620a:24cd:: with SMTP id
 m13mr13969010qkn.308.1643103637947; 
 Tue, 25 Jan 2022 01:40:37 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-22-eperezma@redhat.com>
 <Ye4r7tKFhP9VaT5/@xz-m1.local>
 <CAJaqyWf--wbNZz5ZzbpixD9op_fO5fV01kbYXzG097c_NkqYrw@mail.gmail.com>
 <Ye6IhLCe6NDKO6+E@xz-m1.local>
In-Reply-To: <Ye6IhLCe6NDKO6+E@xz-m1.local>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 25 Jan 2022 10:40:01 +0100
Message-ID: <CAJaqyWcdpTr2X4VuAN2NLmpviCjDoAaY269+VQGZ7-F6myOhSw@mail.gmail.com>
Subject: Re: [PATCH 21/31] util: Add iova_tree_alloc
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 24, 2022 at 12:08 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Mon, Jan 24, 2022 at 10:20:55AM +0100, Eugenio Perez Martin wrote:
> > On Mon, Jan 24, 2022 at 5:33 AM Peter Xu <peterx@redhat.com> wrote:
> > >
> > > On Fri, Jan 21, 2022 at 09:27:23PM +0100, Eugenio P=C3=A9rez wrote:
> > > > +int iova_tree_alloc(IOVATree *tree, DMAMap *map, hwaddr iova_begin=
,
> >
> > I forgot to s/iova_tree_alloc/iova_tree_alloc_map/ here.
> >
> > > > +                    hwaddr iova_last)
> > > > +{
> > > > +    const DMAMapInternal *last, *i;
> > > > +
> > > > +    assert(iova_begin < iova_last);
> > > > +
> > > > +    /*
> > > > +     * Find a valid hole for the mapping
> > > > +     *
> > > > +     * TODO: Replace all this with g_tree_node_first/next/last whe=
n available
> > > > +     * (from glib since 2.68). Using a sepparated QTAILQ complicat=
es code.
> > > > +     *
> > > > +     * Try to allocate first at the end of the list.
> > > > +     */
> > > > +    last =3D QTAILQ_LAST(&tree->list);
> > > > +    if (iova_tree_alloc_map_in_hole(last, NULL, iova_begin, iova_l=
ast,
> > > > +                                    map->size)) {
> > > > +        goto alloc;
> > > > +    }
> > > > +
> > > > +    /* Look for inner hole */
> > > > +    last =3D NULL;
> > > > +    for (i =3D QTAILQ_FIRST(&tree->list); i;
> > > > +         last =3D i, i =3D QTAILQ_NEXT(i, entry)) {
> > > > +        if (iova_tree_alloc_map_in_hole(last, i, iova_begin, iova_=
last,
> > > > +                                        map->size)) {
> > > > +            goto alloc;
> > > > +        }
> > > > +    }
> > > > +
> > > > +    return IOVA_ERR_NOMEM;
> > > > +
> > > > +alloc:
> > > > +    map->iova =3D last ? last->map.iova + last->map.size + 1 : iov=
a_begin;
> > > > +    return iova_tree_insert(tree, map);
> > > > +}
> > >
> > > Hi, Eugenio,
> > >
> > > Have you tried with what Jason suggested previously?
> > >
> > >   https://lore.kernel.org/qemu-devel/CACGkMEtZAPd9xQTP_R4w296N_Qz7VuV=
1FLnb544fEVoYO0of+g@mail.gmail.com/
> > >
> > > That solution still sounds very sensible to me even without the newly
> > > introduced list in previous two patches.
> > >
> > > IMHO we could move "DMAMap *previous, *this" into the IOVATreeAllocAr=
gs*
> > > stucture that was passed into the traverse func though, so it'll natu=
rally work
> > > with threading.
> > >
> > > Or is there any blocker for it?
> > >
> >
> > Hi Peter,
> >
> > I can try that solution again, but the main problem was the special
> > cases of the beginning and ending.
> >
> > For the function to locate a hole, DMAMap first =3D {.iova =3D 0, .size=
 =3D
> > 0} means that it cannot account 0 for the hole.
> >
> > In other words, with that algorithm, if the only valid hole is [0, N)
> > and we try to allocate a block of size N, it would fail.
> >
> > Same happens with iova_end, although in practice it seems that IOMMU
> > hardware iova upper limit is never UINT64_MAX.
> >
> > Maybe we could treat .size =3D 0 as a special case? I see cleaner eithe=
r
> > to build the list (but insert needs to take the list into account) or
> > to explicitly tell that prev =3D=3D NULL means to use iova_first.
>
> Sounds good to me.  I didn't mean to copy-paste Jason's code, but IMHO wh=
at
> Jason wanted to show is the general concept - IOW, the fundamental idea (=
to me)
> is that the tree will be traversed in order, hence maintaining another li=
st
> structure is redundant.
>

I agree.

My idea with this version was to easily delete all the custom code
once we have GTree with proper first/next/last, or _node functions.
That's why it's simply reimplementing GTree functions in the current
Glib version. I find old code way too complicated, and this one easier
to handle although way more verbose, but let's see if we can improve
the old one.

> >
> > Another solution that comes to my mind: to add both exceptions outside
> > of transverse function, and skip the first iteration with something
> > like:
> >
> > if (prev =3D=3D NULL) {
> >   prev =3D this;
> >   return false /* continue */
> > }
> >
> > So the transverse callback has way less code paths. Would it work for
> > you if I send a separate RFC from SVQ only to validate this?
>
> Sure. :-)
>
> If you want, imho you can also attach the patch when reply, then the disc=
ussion
> context won't be lost too.
>

Sure,

So I think that the first step to remove complexity from the old one
is to remove iova_begin and iova_end.

As Jason points out, removing iova_end is easier. It has the drawback
of having to traverse all the list beyond iova_end, but a well formed
iova tree should contain none. If the guest can manipulate it, it's
only hurting itself adding nodes to it.

It's possible to extract the check for hole_right (or this in Jason's
proposal) as a special case too.

But removing the iova_begin parameter is more complicated. We cannot
know if it's a valid hole without knowing iova_begin, and we cannot
resume traversing. Could we assume iova_begin will always be 0? I
think not, the vdpa device can return anything through syscall.

Thanks!



> --
> Peter Xu
>


