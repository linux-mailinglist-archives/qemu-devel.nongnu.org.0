Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA843A053B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 22:45:29 +0200 (CEST)
Received: from localhost ([::1]:50262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqibI-0003QN-Qe
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 16:45:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nirsof@gmail.com>)
 id 1lqiYc-0000ob-Fb; Tue, 08 Jun 2021 16:42:42 -0400
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34]:43669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nirsof@gmail.com>)
 id 1lqiYZ-00016I-Mx; Tue, 08 Jun 2021 16:42:42 -0400
Received: by mail-vk1-xa34.google.com with SMTP id d13so477797vkl.10;
 Tue, 08 Jun 2021 13:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U5yODa2j2/IJiQSGGlD0zgbG60mt73urvDnNvGRY5fI=;
 b=Y3PaDgpFocaEVUXcqYuel8F9OQ2nPkVF5miHgNb4UK0ditTHbm99mtpP4qOkrZDLEf
 Yf7cNj7f08oeS/VOhzEWNcqHffZVPtXxqRdA+hForT3YcZ57y8qEzXAA8qjtjQbbh1SM
 vXZRZLm2M8SQTFqDwdmis+mEbKmHrF7GpeuqvOTB0xmISyjlKcolD+pDfDZtigA1rvVT
 waN3/c65NUmDYZ363oa9kH4WFH0PbISpm4GGBWUZB9G3/c7eh98lh3rt5936SBrzipPX
 qxST4Jl1pz6voQI4rdTtZtnuOPANTkGYMX0UWPBajYzkbtFh1awIHV+gYOjokGCDyK84
 lWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U5yODa2j2/IJiQSGGlD0zgbG60mt73urvDnNvGRY5fI=;
 b=Ts9CxNFCuvWzbFcr46wFA27zcR01wJwST+exKH/KS8TpSsjTRkt7RBrPi8zSvUrPIa
 v7GSxmViranGm4jHPbACCYx3PcpvyfIlhRBODZd3i8P28Jy+qWWoorXVbBZ0yoXiYptT
 pEwoEkCnUTPw/uTNlUxKj0y4nW5SB3LkLicdDLy+SWWYcWKOAVc2OMObmG9SgVjJIsoE
 SRfWs9sMpK9RtHgPpQ5SVvFqsH47hIXs9PNmT5p4rK1c6SMBUtCPrd+st7CexdzyvOJi
 BxAhVTniSTGXp/4/nOW093lOvvAOIIBKFLuGDP/Or/1uwclK78m+iyHJuoAYlZSmAjDG
 Ombg==
X-Gm-Message-State: AOAM531Sgp1QoZImjL6fA8KhkunKb2fC577lQ7DyAJGmzOaE8uciz5YG
 9E7cHEfLmdMuLMT+8qu7sfQLcScyrd/5qlY1DRDy7wHgQDw=
X-Google-Smtp-Source: ABdhPJzAI5kU84MiQ9QP5mLM79GNvXgT5v0UtFT4BgDXjBK0oQOkSbKdP8vGq3buKTYDNcd/et3gHjw7CZQ9MpTi/Ug=
X-Received: by 2002:a1f:9c97:: with SMTP id f145mr2221498vke.6.1623184957449; 
 Tue, 08 Jun 2021 13:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210607202204.1805199-1-nsoffer@redhat.com>
 <20210607212224.tiqjvvdwosvhrvz7@redhat.com>
 <CAMRbyyukE9iTmM6OB_xAA1n6tRiRRxwKojaO5wzRwAR-8-FX3g@mail.gmail.com>
 <20210608184517.vozskgu4a2c5fusj@redhat.com>
In-Reply-To: <20210608184517.vozskgu4a2c5fusj@redhat.com>
From: Nir Soffer <nirsof@gmail.com>
Date: Tue, 8 Jun 2021 23:42:20 +0300
Message-ID: <CAMr-obtU9Fxhs2CEHTuK2gx4KjDORhC_Zby5pG4Y=yj3_xBUaA@mail.gmail.com>
Subject: Re: [PATCH] qemu-{img,nbd}: Don't report zeroed cluster as a hole
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a34;
 envelope-from=nirsof@gmail.com; helo=mail-vk1-xa34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-block <qemu-block@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Nir Soffer <nsoffer@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 8, 2021 at 9:46 PM Eric Blake <eblake@redhat.com> wrote:
>
> On Tue, Jun 08, 2021 at 07:38:10PM +0300, Nir Soffer wrote:
> > On Tue, Jun 8, 2021 at 12:22 AM Eric Blake <eblake@redhat.com> wrote:
> > >
> > > On Mon, Jun 07, 2021 at 11:22:04PM +0300, Nir Soffer wrote:
> > > > When zeroing a cluster in an image with backing file, qemu-img and
> > > > qemu-nbd reported the area as a hole. This does not affect the guest
> > > > since the area is read as zero, but breaks code trying to reconstruct
> > > > the image chain based on qemu-img map or qemu-nbd block status response.
> > >
> > > Trying to reconstruct the image chain based on qemu-nbd block status
> > > should not be attempted on just base:allocation data, but should also
> > > take into account qemu:allocation-depth.
> >
> > This is correct when looking at the entire chain, but when we reconstruct
> > image data, we copy each image in the layer *without* the backing chain.
> >
> > The example I provided was not detailed enough, what we actually do is:
> >
> >     qemu-nbd .. 'json:{"driver": "qcow2", "backing": null, "file":
> > {"driver": "file", "filename": "top.qcow2"}}'
> >
> > So there is no backing chain and allocation depth is not relevant.
> > - Allocated areas should be reported with flags 0
> > - Zero areas which are not holes should be reported as NBD_STATE_ZERO
> > - Zero areas which are holes (not allocated in this image) should be
> > reported as NBD_STATE_HOLE
>
> Again, what you WANT is qemu:allocation-depth.
>
> $ ./qemu-nbd -r -t -f qcow2 -A 'json:{"driver":"qcow2", "backing":null, \
>   "file":{"driver":"file", "filename":"top.qcow2"}}'
> $ nbdinfo --map=qemu:allocation-depth nbd://localhost
>          0       65536    0  unallocated
>      65536      131072    1  local
>     196608       65536    0  unallocated
>
> $ nbdinfo --map nbd://localhost
>          0       65536    3  hole,zero
>      65536       65536    0  allocated
>     131072      131072    3  hole,zero
>
> You don't care whether the information reads as zero or not, but
> whether top.qcow2 is responsible for the data at that cluster.
> base:allocation does not answer that question.  But
> qemu:allocation-depth answers it perfectly.
>
> >
> > > From the perspective of the
> > > core NBD protocol, there is no backing file, so trying to guess what
> > > the backing file contains without using qemu extensions is unlikely to
> > > be correct, as shown in your example.  The fact that you could abuse
> > > it with qemu 5.2 but it broke in 6.0
> >
> > I'm not abusing anything, I'm only using public APIs. qemu-nbd behavior
> > should not change without good reason, and we did not have any good
> > reason to change the behavior for qcow2 images.
>
> Ah, but we did.  Exposing BDRV_BLOCK_ALLOCATED as server, but
> consuming it as BDRV_BLOCK_DATA as client, was inconsistent.  It was a
> bug that we ever used BLOCK_ALLOCATED in the first place, when it has
> _always_ been that the NBD semantics were supposed to be modeled on
> our definition of BLOCK_DATA.  That it took us a couple of years to
> notice our bug is unfortunate, but we DO have a good reason for the
> change - we were fixing an actual bug where we were reporting
> incorrect information compared to what the NBD spec was documenting.
>
> >
> > >  is not necessarily the sign of a
> > > regression in 6.0, but rather could be evidence that you have been
> > > trying to use an undocumented implementation quirk rather than a
> > > stable interface.
> >
> > I'm pretty convinced that this is a regression in qemu-nbd 6.0 since I created
> > this regression :-)
>
> I understand that you were surprised by the ramifications of your
> patch causing more changes than what you expected, but I still argue
> that your patch was correct and that the decision to incorporate it
> was intentional because it was the right thing to do.  Papering over
> the fallout for the sake of clients that should be using
> qemu:allocation-depth instead does not seem like it is worth the
> maintenance nightmare to me.
>
> >
> > Since we started using qemu-nbd in 2018, qemu-nbd has always reported
> > holes in qcow2 images, but not in raw files. We discussed this several times,
> > and you explained that we have allocation information from qcow2, but not
> > from raw format.
> >
> > My attempt to fix hole reporting in raw images has failed; reporting holes in
> > raw images is nice to have, but it broke the behavior of qemu-nbd with qcow2
> > images, which is a critical issue for ovirt.
>
> Rather, ovirt had been relying on buggy behavior, and now that the bug
> has been fixed, we are scrambling to figure out how to make ovirt
> still play nicely.  But my answer to that is to use
> qemu:allocation-depth.  It was introduced in 5.2, so it predates the
> point where base:allocation behavior was fixed, and it provides the
> answer to the question you are really asking (which parts of my image
> came from the image directly, rather than a backing file), rather than
> merely an indirect answer (how can I abuse the determination of which
> parts of the image are allocated or sparse to imply that those same
> portions must come from a backing image).  There is nothing
> semantically wrong with a sparse cluster in the top layer overriding a
> non-sparse cluster from the backing file.
>
> >
> > The code using this was tested and released 3-4 month ago. This was added
> > to support backup vendors using snapshot based backup, so they can move
> > to use the NBD based pipeline, which is safer than the old way, uploading
> > qcow2 images directly to storage.
>
> Downstream can play games with backporting or reverting patches as
> needed to make the entire ecosystem play nicely, but upstream, I don't
> think it is right to take a patch that re-introduces a bug in
> base:allocation merely because a client was unwilling to use the
> correct interface of qemu:allocation-depth to get the answer to the
> question they really meant to ask.
>
> >
> > If I revert:
> >
> > commit 0da9856851dcca09222a1467e16ddd05dc66e460
> > Author: Nir Soffer <nirsof@gmail.com>
> > Date:   Fri Feb 19 18:07:52 2021 +0200
> >
> >     nbd: server: Report holes for raw images
> >
> > qemu-nbd reports zeroed areas in a useful way like it always did:
> >
> > $ ./qemu-nbd -r -t 'json:{"driver": "qcow2", "backing": null, "file":
> > {"driver": "file", "filename": "top.qcow2"}}' &
> >
> > $ nbdinfo --map nbd://localhost
> >          0       65536    3  hole,zero
> >      65536       65536    0  allocated
> >     131072       65536    2  zero
> >     196608       65536    3  hole,zero
> >
> > There is no need to use allocation depth info, the base:allocation works fine
> > for this use case, and the output makes sense.
>
> But you have to remember that the NBD specification for
> base:allocation is that flags are OPTIONAL at all times.  You are at
> the mercy of the server for which flags it sets; it is ALWAYS valid
> for a server to reply with status 0 for any cluster; any server is
> free to return 0 in the future where it returned 1 today (perhaps
> because the server changed its mind on how expensive it was to compute
> when it is safe to set the bit to 1), or to return 1 in the future
> where it returned 0 today (perhaps because the server gained insight
> into how to quickly report something that happens to be true about
> that cluster).  Basing decisions on what was returned as a 1 bit in
> NBD_CMD_BLOCK_STATUS is okay if those decisions are solely for an
> optimization purpose (because we KNOW this portion of this disk will
> read as zero, we don't have to read it), but wrong if they are for an
> accuracy purpose (assuming that only clusters where hole is clear is a
> 1:1 correspondence to which clusters override a backing image).  And
> this is a case where qcow2 happens to quickly know that a sparse zero
> cluster exists, so reporting hole,zero IS more accurate than mere
> zero.  The fact that we failed to omit hole in the past was not a
> violation of the NBD spec, but rather a bug in our code for looking at
> the wrong bit of information.  But the mere presence of the hole bit
> is NOT sufficient knowledge to know that the NBD server is serving a
> qcow2 image that has a non-allocated zero cluster overriding the
> backing image, because we can't even guarantee the server is visiting
> a qcow2 file.

In other words, what we do now happens to work with qemu-nbd, but
may not work with any NBD server. On the other hand, we support
only qemu-nbd because it is the only NBD server that understands qcow2.

I agree that using a qemu extension is more robust than using NBD
semantics which are not strict enough for this purpose. We probably
should have discussed the details before we started to use this for
detecting unallocated areas in qcow2 images.

...
> > > > cluster is merged with forth cluster which is actually a hole.
> > > >
> > > > This is incorrect since if it was a hole, the third cluster would be
> > > > exposed to the guest. Programs using qemu-nbd output to reconstruct the
> > > > image chain on other storage would be confused and copy only the first 2
> > > > cluster. The results of this copy will be an image exposing the third
> > > > cluster from the base image, corrupting the guest data.
> > >
> > > This is where I disagree - if the NBD protocol exposed the notion of a
> > > backing file, then reporting a local hole should indeed imply reading
> > > from the backing file.  But since base NBD protocol does NOT support
> > > backing images of any sort, you cannot make any assumptions about what
> > > base:allocation says about holes, other than that the image presented
> > > over NBD was not fully allocated in some manner at that location.  You
> > > instead need to fix your tooling to query qemu:allocation-depth if you
> > > are trying to reconstruct all state known by qemu.
> >
> > When we look at the entire chain, you are correct, but when we disable
> > the backing file and have no backing chain, NBD protocol hole bit is
> > the right way to describe an unallocated area in a qcow2 image.
>
> Your problem is that qcow2 images have two ways to represent a zero
> cluster.  One is a pre-allocated cluster (there is host storage
> reserved; the host storage might or might not read as zero, but the
> qcow2 code will return zero, regardless of whether there is a backing
> file); the other is an unallocated cluster (there is no host storage
> reserved, but the qcow2 code still reads zero regardless of whether
> there is a backing file).  One of those is allocated, the other is
> sparse.  And NBD_STATE_HOLE is a great fit for telling those two types
> of clusters apart.
>
> In short, qemu has 3 bits of interesting information per cluster:
> whether it reads as zero, whether it has allocated space, and whether
> it overrides a backing file.  The NBD protocol base:allocation only
> provides two of those bits of information (BDRV_BLOCK_DATA and
> BDRV_BLOCK_ZERO); to get at the third (BDRV_BLOCK_ALLOCATED), you HAVE
> to use a qemu-specific extension.
>
> That said, we CAN provide a _new_ qemu:block-status metacontext, which
> returns a bitmap of bit 0 (NBD_STATE_HOLE), bit 1 (NBD_STATE_ZERO),
> and bit 2 (BDRV_BLOCK_ALLOCATED) all from a single context, at which
> point you don't have to reconstruct the combination of base:allocation
> (two bits) and qemu:allocation-depth (an arbitrary integer) across
> possibly differing reporting lengths yourself.
>
> I'll post a counter-proposal patch along those lines, shortly.

Sounds great!

If I understand this correctly, for unallocated area in raw image,
and for zeroed cluster in qcow2 image, qemu-nbd find:

    BDRV_BLOCK_ZERO | BDRV_BLOCK_ALLOCATED

So it will report:

    NBD_STATE_ZERO | NBD_STATE_HOLE | QEMU_STATE_ALLOCATED

And for unallocated area in qcow2 image, qemu-nbd will find:

    BDRV_BLOCK_ZERO

So it will report:

    NBD_STATE_ZERO | NBD_STATE_HOLE

So on the client side, only this can be treated as a hole.

This will work fine for handling unallocated areas in qcow2 images,
but not for holes in raw images. This is not critical for our use
case, but it wold
be nice if unallocated areas in raw image would not report
QEMU_STATE_ALLOCATED.

...
> > Since the original change introduced a regression breaking existing users, we
> > don't have good enough tests in this area, and is not clear how this
> > can be fixed
> > properly, I suggest to revert the original change for 6.0. Then we have time to
> > work on a proper fix upstream.
>
> 6.0 is already released upstream, so you are stuck with that new
> behavior.  And I think it is worse to ping-pong the behavior back to
> the way it was in 5.2 for 6.1, than to just keep the 6.0 behavior
> (which fixed a bug) unchanged going forward into 6.1 upstream.
>
> Downstream, we can backport and/or revert whatever patches we want to
> make the downstream ecosystem play nicely.  But that is an argument
> for downstream.

Reverting downstream can be good enough to avoid breaking existing
users when qemu-6.0.0 apreas in RHEL (like) distros.

> > What do you think?
>
> I'll go ahead and work up my counter-proposal patch to add yet another
> qemu:... context to make it easier for you to get combined status in
> one go.  I don't know whether it will be attractive enough to be worth
> incorporating upstream, but if it is, that is certainly another option
> that downstream can use, because it is easier to backport a new qemu:
> context than it is to play games with "which behavior will
> base:allocation have" - you are guaranteed that if qemu knows how to
> advertise the new context, it provides the information you want.

I think this is upstream worthy and a good direction to solve this issue.

Thanks,
Nir

