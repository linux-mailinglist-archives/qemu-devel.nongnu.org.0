Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABF439FCB0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 18:40:21 +0200 (CEST)
Received: from localhost ([::1]:48492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqem1-00030P-P8
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 12:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lqekP-0001qk-O9
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 12:38:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lqekL-0006j7-Az
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 12:38:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623170310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ubDr8LfR7R6WGTeUdRaq081f9U+DFcwN9g1Od2w3p6o=;
 b=dCESSGL9EFNvLOV+ycn1kK92C5MFpsxSFgiFp4FjGvlKpDbMM/JetMylJ4OesAw3i3BEI1
 n272t143fgAfklQ4FBwbdMSxvwHRo5vpKUO6brtA+5vh7U1tVClafk8h7mrdSAhAf45mmr
 DLfT+Jo77bEFqTAnMjSzRrn3u3t/MKs=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-EMCA4ZBVPMOHNyfG72Vj8g-1; Tue, 08 Jun 2021 12:38:28 -0400
X-MC-Unique: EMCA4ZBVPMOHNyfG72Vj8g-1
Received: by mail-oo1-f72.google.com with SMTP id
 n16-20020a0568200550b029020b438b2591so13633342ooj.19
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 09:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ubDr8LfR7R6WGTeUdRaq081f9U+DFcwN9g1Od2w3p6o=;
 b=pxhGTN5+e1PSZmwB4RD3wYA4YIw2J0/39UmZHGDFgYCn0G0Nbk3GhwJorQ2Jjrz2h2
 BPjT5K5ovBBRp0Cl+w46vHMt6ZuCP7+qV2uIrqhTq64CTjJ+plRYU0QSBMhk9JzneYTj
 Fw/MlYuYDVRNaFjAijD46F+7YYhqrXITlUb205yLnikVzOMIFtLoswJaeMSINBvbayg+
 l337B7tnzhCQXbXqorzl+KK5syW9mle7WKG600AGtiKoPtmmAkUok8otHZRlGRayGX+7
 MLnGS4Rv4Uc4aXKQyn+/PGyqP7dJlfAeB3ycVqEvEUdtJjGTixomNvF7aKhEGXPopTqF
 /Bcw==
X-Gm-Message-State: AOAM530ZZtDLGs+khiaXgapW1nlj8Bv+8Jks25iF7PACulYotbcTMKt4
 PPip1V38Fgb6u9Jbe5J+MBZXSKcWYA8i6Swy1qqIX2nakTthhIcNK9TOaKKZTm2k69rRSFiWW/M
 dPM8ZwU8oYhXXBg8Vv54TVRdWRrToIws=
X-Received: by 2002:a9d:6042:: with SMTP id v2mr16781499otj.170.1623170307026; 
 Tue, 08 Jun 2021 09:38:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxq38Ttc1o6Zi1LkH2ocoWyf6u7l2EeO1ullmmwBxPf7wlt/J4qPJ2VkQY0oJNfz5K642rQgjRdBScrUwsOkzE=
X-Received: by 2002:a9d:6042:: with SMTP id v2mr16781478otj.170.1623170306682; 
 Tue, 08 Jun 2021 09:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210607202204.1805199-1-nsoffer@redhat.com>
 <20210607212224.tiqjvvdwosvhrvz7@redhat.com>
In-Reply-To: <20210607212224.tiqjvvdwosvhrvz7@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Tue, 8 Jun 2021 19:38:10 +0300
Message-ID: <CAMRbyyukE9iTmM6OB_xAA1n6tRiRRxwKojaO5wzRwAR-8-FX3g@mail.gmail.com>
Subject: Re: [PATCH] qemu-{img,nbd}: Don't report zeroed cluster as a hole
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Nir Soffer <nirsof@gmail.com>, qemu-block <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 8, 2021 at 12:22 AM Eric Blake <eblake@redhat.com> wrote:
>
> On Mon, Jun 07, 2021 at 11:22:04PM +0300, Nir Soffer wrote:
> > When zeroing a cluster in an image with backing file, qemu-img and
> > qemu-nbd reported the area as a hole. This does not affect the guest
> > since the area is read as zero, but breaks code trying to reconstruct
> > the image chain based on qemu-img map or qemu-nbd block status response.
>
> Trying to reconstruct the image chain based on qemu-nbd block status
> should not be attempted on just base:allocation data, but should also
> take into account qemu:allocation-depth.

This is correct when looking at the entire chain, but when we reconstruct
image data, we copy each image in the layer *without* the backing chain.

The example I provided was not detailed enough, what we actually do is:

    qemu-nbd .. 'json:{"driver": "qcow2", "backing": null, "file":
{"driver": "file", "filename": "top.qcow2"}}'

So there is no backing chain and allocation depth is not relevant.
- Allocated areas should be reported with flags 0
- Zero areas which are not holes should be reported as NBD_STATE_ZERO
- Zero areas which are holes (not allocated in this image) should be
reported as NBD_STATE_HOLE

> From the perspective of the
> core NBD protocol, there is no backing file, so trying to guess what
> the backing file contains without using qemu extensions is unlikely to
> be correct, as shown in your example.  The fact that you could abuse
> it with qemu 5.2 but it broke in 6.0

I'm not abusing anything, I'm only using public APIs. qemu-nbd behavior
should not change without good reason, and we did not have any good
reason to change the behavior for qcow2 images.

>  is not necessarily the sign of a
> regression in 6.0, but rather could be evidence that you have been
> trying to use an undocumented implementation quirk rather than a
> stable interface.

I'm pretty convinced that this is a regression in qemu-nbd 6.0 since I created
this regression :-)

Since we started using qemu-nbd in 2018, qemu-nbd has always reported
holes in qcow2 images, but not in raw files. We discussed this several times,
and you explained that we have allocation information from qcow2, but not
from raw format.

My attempt to fix hole reporting in raw images has failed; reporting holes in
raw images is nice to have, but it broke the behavior of qemu-nbd with qcow2
images, which is a critical issue for ovirt.

The code using this was tested and released 3-4 month ago. This was added
to support backup vendors using snapshot based backup, so they can move
to use the NBD based pipeline, which is safer than the old way, uploading
qcow2 images directly to storage.

If I revert:

commit 0da9856851dcca09222a1467e16ddd05dc66e460
Author: Nir Soffer <nirsof@gmail.com>
Date:   Fri Feb 19 18:07:52 2021 +0200

    nbd: server: Report holes for raw images

qemu-nbd reports zeroed areas in a useful way like it always did:

$ ./qemu-nbd -r -t 'json:{"driver": "qcow2", "backing": null, "file":
{"driver": "file", "filename": "top.qcow2"}}' &

$ nbdinfo --map nbd://localhost
         0       65536    3  hole,zero
     65536       65536    0  allocated
    131072       65536    2  zero
    196608       65536    3  hole,zero

There is no need to use allocation depth info, the base:allocation works fine
for this use case, and the output makes sense.

> > Here is simpler reproducer:
> >
> >     # Create a qcow2 image with a raw backing file:
> >     $ qemu-img create base.raw $((4*64*1024))
> >     $ qemu-img create -f qcow2 -b base.raw -F raw top.qcow2
> >
> >     # Write to first 3 clusters of base:
> >     $ qemu-io -f raw -c "write -P 65 0 64k" base.raw
> >     $ qemu-io -f raw -c "write -P 66 64k 64k" base.raw
> >     $ qemu-io -f raw -c "write -P 67 128k 64k" base.raw
> >
> >     # Write to second cluster of top, hiding second cluster of base:
> >     $ qemu-io -f qcow2 -c "write -P 69 64k 64k" top.qcow2
> >
> >     # Write zeroes to third cluster of top, hiding third cluster of base:
> >     $ qemu-io -f qcow2 -c "write -z 128k 64k" top.qcow2
> >
> > This creates:
> >
> >     top:  -D0-
> >     base: ABC-
> >
> > How current qemu-img and qemu-nbd report the state:
> >
> >     $ qemu-img map --output json top.qcow2
> >     [{ "start": 0, "length": 65536, "depth": 1, "zero": false, "data": true, "offset": 0},
> >     { "start": 65536, "length": 65536, "depth": 0, "zero": false, "data": true, "offset": 327680},
> >     { "start": 131072, "length": 65536, "depth": 0, "zero": true, "data": false},
> >     { "start": 196608, "length": 65536, "depth": 1, "zero": true, "data": false, "offset": 196608}]
>
> Note how this one reports "depth":1 when the backing file is consulted...

Yes, qemu-img includes enough info to tell about the status of the cluster,
so we can keep it as is.

> >     $ qemu-nbd -r -t -f qcow2 top.qcow2 &
> >     $ qemu-img map --output json nbd://localhost
> >     [{ "start": 0, "length": 131072, "depth": 0, "zero": false, "data": true, "offset": 0},
> >     { "start": 131072, "length": 131072, "depth": 0, "zero": true, "data": false, "offset": 131072}]
>
> ...but since NBD has no notion of a backing file, there is nothing
> that qemu can do to report depth information itself.  If you want to
> reconstruct the backing chain, you should be able to further query
> qemu:allocation-depth, and piece the two queries together to get what
> you need:
>
> $ ./qemu-nbd -r -t -f qcow2 top.qcow2 -A

What suggest is:

1. Get base:allocation - where the cluster is wrongly reported a hole
2. Get also qemu:allocation-depath
3. Merge both lists of extents, splitting and extending extents as needed
   since there is no guarantee that we get same lists describing same extents
4. Finally get correct base:allocation showing the zero range is not a hole

This is a lot of unneeded and complicated work to cover a bug in qemu,
and it should be done in all clients. I don't find this an attractive solution.

> > cluster is merged with forth cluster which is actually a hole.
> >
> > This is incorrect since if it was a hole, the third cluster would be
> > exposed to the guest. Programs using qemu-nbd output to reconstruct the
> > image chain on other storage would be confused and copy only the first 2
> > cluster. The results of this copy will be an image exposing the third
> > cluster from the base image, corrupting the guest data.
>
> This is where I disagree - if the NBD protocol exposed the notion of a
> backing file, then reporting a local hole should indeed imply reading
> from the backing file.  But since base NBD protocol does NOT support
> backing images of any sort, you cannot make any assumptions about what
> base:allocation says about holes, other than that the image presented
> over NBD was not fully allocated in some manner at that location.  You
> instead need to fix your tooling to query qemu:allocation-depth if you
> are trying to reconstruct all state known by qemu.

When we look at the entire chain, you are correct, but when we disable
the backing file and have no backing chain, NBD protocol hole bit is
the right way to describe an unallocated area in a qcow2 image.

> > I found that it can be fixed using BDRV_BLOCK_OFFSET_VALID when
> > reporting the status of the extent. When we have a valid offset, we
> > report based on BDRV_BLOCK_DATA. Otherwise we report based on
> > BDRV_BLOCK_ALLOCATED.
>
> That sounds hairy.  As an initial reaction, I'm not sure I like it.
>
> >
> > With this fix we get:
> >
> >     $ build/qemu-img map --output json top.qcow2
> >     [{ "start": 0, "length": 65536, "depth": 1, "zero": false, "data": true, "offset": 0},
> >     { "start": 65536, "length": 65536, "depth": 0, "zero": false, "data": true, "offset": 327680},
> >     { "start": 131072, "length": 65536, "depth": 0, "zero": true, "data": true},
>
> Earlier, this line was "data":false, which made sense - there was no
> offset in either top.qcow2 nor in raw.base at which you could mmap to
> read the actual zeroes that were implied by the unallocated zero
> cluster.  Your change here is reporting "data":true to state that the
> zeroes explicitly come from the "depth":0 layer, although it is a bit
> misleading because we did not actually allocate clusters in top.qcow2
> for reading the zeroes.  In reality, this really IS an instance of a
> qcow2 unallocated cluster, where "data":false fits better for the
> definitions in include/block/block.h.

Well, this cluster is not a hole. How do you describe "not a hole" in
qemu-img map?
data=true seem that be the only way.

But again we can leave qemu-img map as is since we have the depth argument.

> >     { "start": 196608, "length": 65536, "depth": 1, "zero": true, "data": false, "offset": 196608}]
> >
> >     $ build/qemu-nbd -r -t -f qcow2 top.qcow2 &
> >     $ qemu-img map --output json nbd://localhost
> >     [{ "start": 0, "length": 131072, "depth": 0, "zero": false, "data": true, "offset": 0},
> >     { "start": 131072, "length": 65536, "depth": 0, "zero": true, "data": true, "offset": 131072},
> >     { "start": 196608, "length": 65536, "depth": 0, "zero": true, "data": false, "offset": 196608}]
>
> Meanwhile, this output is indeed arguably more precise, although it
> differs from the qcow2 output in that you provide an offset for
> cluster 2.

I guess qemu-img have less information when using qemu-nbd, the image
is presented as
a raw image.

> >     $ nbdinfo --map nbd://localhost
> >              0      131072    0  allocated
> >         131072       65536    2  zero
> >         196608       65536    3  hole,zero
> >
> > The issue was found by ovirt-imageio functional tests:
> > https://github.com/oVirt/ovirt-imageio/blob/master/daemon/test/client_test.py
> >
> > I did not update any of the existing tests, and I'm sure many tests are
> > missing, and the documentation should change to describe the new
> > behavior. Posting as is for early review.
> >
> > Signed-off-by: Nir Soffer <nsoffer@redhat.com>
> > Resolves: https://bugzilla.redhat.com/1968693
> > ---
> >  nbd/server.c | 8 ++++++--
> >  qemu-img.c   | 4 +++-
> >  2 files changed, 9 insertions(+), 3 deletions(-)
> >
> > diff --git a/nbd/server.c b/nbd/server.c
> > index b60ebc3ab6..adf37905d5 100644
> > --- a/nbd/server.c
> > +++ b/nbd/server.c
> > @@ -2127,8 +2127,12 @@ static int blockstatus_to_extents(BlockDriverState *bs, uint64_t offset,
> >              return ret;
> >          }
> >
> > -        flags = (ret & BDRV_BLOCK_DATA ? 0 : NBD_STATE_HOLE) |
> > -                (ret & BDRV_BLOCK_ZERO ? NBD_STATE_ZERO : 0);
> > +        flags = (ret & BDRV_BLOCK_ZERO ? NBD_STATE_ZERO : 0);
> > +
> > +        if (ret & BDRV_BLOCK_OFFSET_VALID)
> > +            flags |= (ret & BDRV_BLOCK_DATA ? 0 : NBD_STATE_HOLE);
> > +        else
> > +            flags |= (ret & BDRV_BLOCK_ALLOCATED ? 0 : NBD_STATE_HOLE);
>
> This will fall apart on compressed or encrypted images, where data is
> allocated but offset_valid is false.

So this is not the right way to trigger the use of BDRV_BLOCK_DATA.

> >          if (nbd_extent_array_add(ea, num, flags) < 0) {
> >              return 0;
> > diff --git a/qemu-img.c b/qemu-img.c
> > index a5993682aa..6808e12d87 100644
> > --- a/qemu-img.c
> > +++ b/qemu-img.c
> > @@ -3039,7 +3039,9 @@ static int get_block_status(BlockDriverState *bs, int64_t offset,
> >      *e = (MapEntry) {
> >          .start = offset,
> >          .length = bytes,
> > -        .data = !!(ret & BDRV_BLOCK_DATA),
> > +        .data = !!(has_offset
> > +            ? ret & BDRV_BLOCK_DATA
> > +            : ret & BDRV_BLOCK_ALLOCATED),
>
> I'm really not sure about this.  You are not only changing what
> qemu-nbd advertises as a server, but also what qemu-img interprets as
> a client.  Are you sure this will still work when you mix-and-match
> old server + new client, or new server + old client?

I did not test these combinations, but let's simplify by removing this change
for now.

> >          .zero = !!(ret & BDRV_BLOCK_ZERO),
> >          .offset = map,
> >          .has_offset = has_offset,
> > --
> > 2.26.3
> >

Since the original change introduced a regression breaking existing users, we
don't have good enough tests in this area, and is not clear how this
can be fixed
properly, I suggest to revert the original change for 6.0. Then we have time to
work on a proper fix upstream.

What do you think?

Nir


