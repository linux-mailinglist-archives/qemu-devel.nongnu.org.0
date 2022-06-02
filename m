Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAFB53B325
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 07:50:26 +0200 (CEST)
Received: from localhost ([::1]:50668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwdiz-0000u9-La
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 01:50:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1nwdcV-0007FB-AZ; Thu, 02 Jun 2022 01:43:46 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:40638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1nwdcR-0001I0-AM; Thu, 02 Jun 2022 01:43:41 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-30c2f288f13so40623387b3.7; 
 Wed, 01 Jun 2022 22:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Mk3xyIqrcSkAV3k0j9w3FlZSmz5xkhToqljuBNxN278=;
 b=icNohZO81BfUTA3WDP0+c59C3BowDMsJqIJs7XHsBHUo3F8BS7maqpmEs40Bs39dgk
 5lb5PLCfrGbsEIfz9vwL3w+a+OSWpR150jDe2rOBttDuTb3OqAdP2YTGyGy48q263nB1
 hTJeakZnUxjwNKMRvE/w9+WJMgHXH0a16FQC8LT0lGopBoWLa+lQSILi0jbn+QhkM/OW
 QafmIX9A9W7aiKgkcawVjWYa4SrViKGMn92obo7V1S6p3OSkSyYb+1K9+JbKcvs4N3PQ
 DM2p7TZPsV13Oi8kwewhwRNzWwEwDH7LrVTCGph55oH1JbXOi7AgRQOw4FDoJ4OQEw44
 aEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Mk3xyIqrcSkAV3k0j9w3FlZSmz5xkhToqljuBNxN278=;
 b=Oknr5DyQfVnH69m7LXs31ed/ocQoGSL8xPJ0H3qdObNBbEXlVeT3uEmdy4S4mVzrZk
 OE365JoR0cabesWckevWGcFgPDkI+xtaIOvfdOptapoaQm293bFhXT0DbsFp9APG51xi
 CxjVKDvLQDgClwb/vMeRAgxF6vJo9HL6Nwf+QMQXQ6Gfs/bmfara8YLyPcC2G84ojx9o
 0d6orsrMdj9LIHPwd5Aeo2BiYgnUCmVoSzLci+OjUE4cQyxp4MAYpRlxoW3eqfkHI49p
 lcaRb5R2rvcFdD5zhsAnT/grya3SHtLgZqbSvCXk9s6t6W5G4a5c2QNKp+nD799yp+y9
 SieA==
X-Gm-Message-State: AOAM530rNDVV6NK4pWKpKJ7rhzLTxfdpYvOr797Xu+SAJfLTtj8ZiHsq
 DhoWwA6dY4m/Q8xFnn1+s/n7uEIqOhqsRnOfigc=
X-Google-Smtp-Source: ABdhPJyNUUpnm0C2TAlEEiLkNR5vpVfVcpsDkMUMTukaCFpeRz/nLw3sC0aO+BZKicjUM14WlIcRFZDADYbM5qMZCyg=
X-Received: by 2002:a0d:ff45:0:b0:2fe:bec9:ac20 with SMTP id
 p66-20020a0dff45000000b002febec9ac20mr3662745ywf.486.1654148615367; Wed, 01
 Jun 2022 22:43:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAAAx-8+ECfznYPcJqPvP=7fzfgQobU1t+kGhGzWvArjm_Xs_yg@mail.gmail.com>
 <CAJSP0QURQOD79ixL2j__uBCuaJL19sytKpMr6QT2QY_+VnQPtg@mail.gmail.com>
 <CAAAx-8LsXQ=w7QTz0JHfGp6gbgY5najE0N7K0yBwhdqqH+E6Eg@mail.gmail.com>
 <be663d15-6db3-1777-0830-60dcc6aa394e@opensource.wdc.com>
 <CAJSP0QWLn5i9at7vhFdgOysZ0+voKFYRQqRquVaxh_EoZXRDRg@mail.gmail.com>
In-Reply-To: <CAJSP0QWLn5i9at7vhFdgOysZ0+voKFYRQqRquVaxh_EoZXRDRg@mail.gmail.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Thu, 2 Jun 2022 13:43:31 +0800
Message-ID: <CAAAx-8JWexta+c396Os_YGAOicf8j6d6A8QVf1n5Su8fHiiGwQ@mail.gmail.com>
Subject: Re: Outreachy project task: Adding QEMU block layer APIs resembling
 Linux ZBD ioctls.
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Hannes Reinecke <hare@suse.de>, 
 qemu-devel <qemu-devel@nongnu.org>, qemu block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=faithilikerun@gmail.com; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan,

Stefan Hajnoczi <stefanha@gmail.com> =E4=BA=8E2022=E5=B9=B46=E6=9C=881=E6=
=97=A5=E5=91=A8=E4=B8=89 19:43=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 1 Jun 2022 at 06:47, Damien Le Moal
> <damien.lemoal@opensource.wdc.com> wrote:
> >
> > On 6/1/22 11:57, Sam Li wrote:
> > > Hi Stefan,
> > >
> > > Stefan Hajnoczi <stefanha@gmail.com> =E4=BA=8E2022=E5=B9=B45=E6=9C=88=
30=E6=97=A5=E5=91=A8=E4=B8=80 19:19=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > >
> > >>
> > >> On Mon, 30 May 2022 at 06:09, Sam Li <faithilikerun@gmail.com> wrote=
:
> > >>>
> > >>> Hi everyone,
> > >>> I'm Sam Li, working on the Outreachy project which is to add zoned
> > >>> device support to QEMU's virtio-blk emulation.
> > >>>
> > >>> For the first goal, adding QEMU block layer APIs resembling Linux Z=
BD
> > >>> ioctls, I think the naive approach would be to introduce a new stab=
le
> > >>> struct zbd_zone descriptor for the library function interface. More
> > >>> specifically, what I'd like to add to the BlockDriver struct are:
> > >>> 1. zbd_info as zone block device information: includes numbers of
> > >>> zones, size of logical blocks, and physical blocks.
> > >>> 2. zbd_zone_type and zbd_zone_state
> > >>> 3. zbd_dev_model: host-managed zbd, host-aware zbd
> > >>> With those basic structs, we can start to implement new functions a=
s
> > >>> bdrv*() APIs for BLOCK*ZONE ioctls.
> > >>>
> > >>> I'll start to finish this task based on the above description. If
> > >>> there is any problem or something I may miss in the design, please =
let
> > >>> me know.
> > >>
> > >> Hi Sam,
> > >> Can you propose function prototypes for the new BlockDriver callback=
s
> > >> needed for zoned devices?
> > >
> > > I have made some modifications based on Damien's device in design par=
t
> > > 1 and added the function prototypes in design part 2. If there is any
> > > problem or part I missed, please let me know.
> > >
> > > Design of Block Layer APIs in BlockDriver:
> > > 1. introduce a new stable struct zbd_zone descriptor for the library
> > > function interface.
> > >   a. zbd_info as zone block device information: includes numbers of
> > > zones, size of blocks, write granularity in byte(minimal write size
> > > and alignment
> > >     - write granularity: 512e SMRs: writes in units of physical block
> > > size, 4096 bytes; NVMe ZNS write granularity is equal to the block
> > > size.
> > >     - zone descriptor: start, length, capacity, write pointer, zone t=
ype
> > >   b. zbd_zone_type
> > >     - zone type: conventional, sequential write required, sequential
> > > write preferred
> > >   c. zbd_dev_model: host-managed zbd, host-aware zbd
> >
> > This explanation is a little hard to understand. It seems to be mixing =
up
> > device level information and per-zone information. I think it would be =
a
> > lot simpler to write a struct definition to directly illustrate what yo=
u
> > are planning.
> >
> > It is something like this ?
> >
> > struct zbd_zone {
> >         enum zone_type  type;
> >         enum zone_cond  cond;
> >         uint64_t        start;
> >         uint32_t        length;
> >         uint32_t        cap;
> >         uint64_t        wp;
> > };
> >
> > strcut zbd_dev {
> >         enum zone_model model;
> >         uint32_t        block_size;
> >         uint32_t        write_granularity;
> >         uint32_t        nr_zones
> >         struct zbd_zone *zones; /* array of zones */
> > };
> >
> > If yes, then my comments are as follows.
> >
> > For the device struct: It may be good to have also the maximum number o=
f
> > open zones and the maximum number of active zones.
> >
> > For the zone struct: You may need to add a read-write lock per zone to =
be
> > able to write lock zones to ensure a sequential write pattern (virtio
> > devices can be multi-queue and so writes may be coming in from differen=
t
> > contexts) and to correctly emulate zone append operations with an atomi=
c
> > update of the wp field.
> >
> > These need to be integrated into the generic block driver interface in
> > include/block/block_int-common.h or include/block/block-common.h.
>
> QEMU's block layer has a few ways of exposing information about block dev=
ices:
>
>     int (*bdrv_get_info)(BlockDriverState *bs, BlockDriverInfo *bdi);
>     ImageInfoSpecific *(*bdrv_get_specific_info)(BlockDriverState *bs,
> Error **errp);
>
> These fetch information from the BlockDriver and are good when a small
> amount of data is reported occassionally and consumed by the caller.
>
> For data that is continuously accessed or that could be large, it may
> be necessary for the data to reside inside BlockDriverState so that it
> can be accessed in place (without copying):
>
>     void (*bdrv_refresh_limits)(BlockDriverState *bs, Error **errp);
>
> QEMU uses this for the BlockLimits struct (BlockDriverState::bl) that
> is continuously accessed by the block layer while processing I/O
> requests. The "refresh" function updates the data in case the
> underlying storage device has changed somehow. If no update function
> is necessary then data can simply be populated during .bdrv_open() and
> no new BlockDriver callback needs to be added.
>
> So in the simplest case BlockDriverState can be extended with a struct
> zbd_dev field that is populated during .bdrv_open(). If the
> BlockDriver doesn't support zones then the zbd_dev.nr_zones field is 0
> or the model field indicates that this is not a zoned storage device.
>
> However, a BlockBackend (not BlockDriverState!) API will be needed to
> expose this data to users like the hw/block/virtio-blk.c emulation
> code or the qemu-io-cmds.c utility that can be used for testing. A
> BlockBackend has a root pointer to a BlockDriverState graph (for
> example, qcow2 on top of file-posix). It will be necessary to
> propagate zoned storage information from the leaf BlockDriverState all
> the way up to the BlockBackend. In simple cases the BB root points
> directly to the file-posix BDS that has Linux ZBD support but the
> design needs to account for additional BDS graph nodes.

I think a simple way to think BlockBackend APIs is to use following
callbacks: blk_aio_zone_mgmt() -> blk_aio_prwv() +
blk_aio_zone_mgmt_entry() -> blk_co_do_zone_mgmt() -> blk_zone_mgmt().
The last function call will call bdrv_co_zone_mgmt() in
block/file-posix.c. If I understand the additional case correctly, the
BlockBackend API can expose the zone information to the virtio-blk
emulation now.

Besides, comparing blk_aio_flush() with blk_flush() in block-backend.c
which lead to include/block/block-io.h, we may need consider the case
when calling block layer API from non-coroutine context. Meanwhile,
using bdrv_co_writev()/bdrv_co_readv() instead of read-write lock per
zone may be a option too.

If there is any problem, please let me know.

Best regards,
Sam

>
> In order to make progress on this interface I suggest looking at the
> virtio-blk spec extension for zoned storage and thinking what the
> BlockBackend API should look like that hw/block/virtio-blk.c will use.
> Then it may be easier to decide how to report zone information from
> BlockDriverState.
>
>
> Stefan

