Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB1153B75C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 12:34:43 +0200 (CEST)
Received: from localhost ([::1]:51672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwiA5-0004Q4-G0
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 06:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1nwi4T-0003HN-OC; Thu, 02 Jun 2022 06:29:02 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:42703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1nwi4R-0002ZA-Be; Thu, 02 Jun 2022 06:28:53 -0400
Received: by mail-yb1-xb34.google.com with SMTP id i11so7511707ybq.9;
 Thu, 02 Jun 2022 03:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eSiOO5+d6uj220yl8E0clKhxWgRqrW90/i+1Wk4/6T0=;
 b=cv2jpOYELxaP/L/2av94Eo/zJDgu8brn4vIt9piltlW7NM5nk16lFJxJbmH4t7U6CN
 eRPEhe0UrURRAOYVq/LvG1ZYEy0W8JYZAfCPgtshoESrzG0Q7Le6pLOjPxiTQmHZ1C2L
 0FlvLT6pwPqiarm7XhflsSBAq0MzZL88H1QTo1p+bvescHAxoHjYQKPutnVMwzD5Xt+6
 E2Ux22TnAhmrq87jFuvsqTtOp22izTat7sqa4yL+XHUKx174wLEBMReg0RQrszqbnhiR
 vubrWb0xUP8zD7kK+Lh+Q392w1LqzbpyiS55gbxMIRCmwaZl7B212wGD+tZVFOYjFzhT
 Zc/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eSiOO5+d6uj220yl8E0clKhxWgRqrW90/i+1Wk4/6T0=;
 b=DuUoWSYdAiVuDfOyNUw7Wtxm3gO63T8rBvkCcWZ0a1lDlWjeIItRU4+nWwiFaQdsiK
 /J4iHN+H4HkkvYolqAiOjZWUaZunFxWRsQA3XUAaB5xe/9b9+RhK72qt9AsXCD8eQoQT
 ly1nhjpVLjKnf2dNo92b5nsmZrXSVWVN1GDuI3X5r9e9+HHn00ePFbcH5sTXCx2FWwYK
 I/xUvaiYO1C505YdgVHWMB9B9xfEgJszYb4HyJ1otqvFjRpu1NGhm6RfBeGFYTK04nm/
 vWyjhQ+4gCZo2+1ODMD3g4yL5saQlCYsYZvwud4gsBpeyFDYLC6YmA1cAweTNa+AyMHb
 EMHA==
X-Gm-Message-State: AOAM5315XsvGU29WImb9UK08NAJ11NE8CnRn2c0Euhj+tTtAaLI06rZk
 1IsoENet5wIfblW97eLp5OFfr4mn0Y3oV3qrvIA=
X-Google-Smtp-Source: ABdhPJzxjinDwirJbYqeW3UoKjtHXJFdmTkV+GsXuw8XTIrPVt0JQFxaGLXI4j4HwVJf77RagemL5h2Yid4H9Hcxaiw=
X-Received: by 2002:a05:6902:c9:b0:641:1998:9764 with SMTP id
 i9-20020a05690200c900b0064119989764mr4365806ybs.427.1654165729352; Thu, 02
 Jun 2022 03:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAAAx-8+ECfznYPcJqPvP=7fzfgQobU1t+kGhGzWvArjm_Xs_yg@mail.gmail.com>
 <CAJSP0QURQOD79ixL2j__uBCuaJL19sytKpMr6QT2QY_+VnQPtg@mail.gmail.com>
 <CAAAx-8LsXQ=w7QTz0JHfGp6gbgY5najE0N7K0yBwhdqqH+E6Eg@mail.gmail.com>
 <be663d15-6db3-1777-0830-60dcc6aa394e@opensource.wdc.com>
 <CAJSP0QWLn5i9at7vhFdgOysZ0+voKFYRQqRquVaxh_EoZXRDRg@mail.gmail.com>
 <CAAAx-8JWexta+c396Os_YGAOicf8j6d6A8QVf1n5Su8fHiiGwQ@mail.gmail.com>
 <CAJSP0QXfUeeGgq7RoXWRpcf-5Yob9BgoJPv4tBwav+xsn_R9OQ@mail.gmail.com>
In-Reply-To: <CAJSP0QXfUeeGgq7RoXWRpcf-5Yob9BgoJPv4tBwav+xsn_R9OQ@mail.gmail.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Thu, 2 Jun 2022 18:28:45 +0800
Message-ID: <CAAAx-8JGrhrcD8Nk__jHXx-xDDPy6O8qPppjUpe=is3351VW4w@mail.gmail.com>
Subject: Re: Outreachy project task: Adding QEMU block layer APIs resembling
 Linux ZBD ioctls.
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Hannes Reinecke <hare@suse.de>, 
 qemu-devel <qemu-devel@nongnu.org>, qemu block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=faithilikerun@gmail.com; helo=mail-yb1-xb34.google.com
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

Stefan Hajnoczi <stefanha@gmail.com> =E4=BA=8E2022=E5=B9=B46=E6=9C=882=E6=
=97=A5=E5=91=A8=E5=9B=9B 16:05=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 2 Jun 2022 at 06:43, Sam Li <faithilikerun@gmail.com> wrote:
> >
> > Hi Stefan,
> >
> > Stefan Hajnoczi <stefanha@gmail.com> =E4=BA=8E2022=E5=B9=B46=E6=9C=881=
=E6=97=A5=E5=91=A8=E4=B8=89 19:43=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Wed, 1 Jun 2022 at 06:47, Damien Le Moal
> > > <damien.lemoal@opensource.wdc.com> wrote:
> > > >
> > > > On 6/1/22 11:57, Sam Li wrote:
> > > > > Hi Stefan,
> > > > >
> > > > > Stefan Hajnoczi <stefanha@gmail.com> =E4=BA=8E2022=E5=B9=B45=E6=
=9C=8830=E6=97=A5=E5=91=A8=E4=B8=80 19:19=E5=86=99=E9=81=93=EF=BC=9A
> > > > >
> > > > >
> > > > >>
> > > > >> On Mon, 30 May 2022 at 06:09, Sam Li <faithilikerun@gmail.com> w=
rote:
> > > > >>>
> > > > >>> Hi everyone,
> > > > >>> I'm Sam Li, working on the Outreachy project which is to add zo=
ned
> > > > >>> device support to QEMU's virtio-blk emulation.
> > > > >>>
> > > > >>> For the first goal, adding QEMU block layer APIs resembling Lin=
ux ZBD
> > > > >>> ioctls, I think the naive approach would be to introduce a new =
stable
> > > > >>> struct zbd_zone descriptor for the library function interface. =
More
> > > > >>> specifically, what I'd like to add to the BlockDriver struct ar=
e:
> > > > >>> 1. zbd_info as zone block device information: includes numbers =
of
> > > > >>> zones, size of logical blocks, and physical blocks.
> > > > >>> 2. zbd_zone_type and zbd_zone_state
> > > > >>> 3. zbd_dev_model: host-managed zbd, host-aware zbd
> > > > >>> With those basic structs, we can start to implement new functio=
ns as
> > > > >>> bdrv*() APIs for BLOCK*ZONE ioctls.
> > > > >>>
> > > > >>> I'll start to finish this task based on the above description. =
If
> > > > >>> there is any problem or something I may miss in the design, ple=
ase let
> > > > >>> me know.
> > > > >>
> > > > >> Hi Sam,
> > > > >> Can you propose function prototypes for the new BlockDriver call=
backs
> > > > >> needed for zoned devices?
> > > > >
> > > > > I have made some modifications based on Damien's device in design=
 part
> > > > > 1 and added the function prototypes in design part 2. If there is=
 any
> > > > > problem or part I missed, please let me know.
> > > > >
> > > > > Design of Block Layer APIs in BlockDriver:
> > > > > 1. introduce a new stable struct zbd_zone descriptor for the libr=
ary
> > > > > function interface.
> > > > >   a. zbd_info as zone block device information: includes numbers =
of
> > > > > zones, size of blocks, write granularity in byte(minimal write si=
ze
> > > > > and alignment
> > > > >     - write granularity: 512e SMRs: writes in units of physical b=
lock
> > > > > size, 4096 bytes; NVMe ZNS write granularity is equal to the bloc=
k
> > > > > size.
> > > > >     - zone descriptor: start, length, capacity, write pointer, zo=
ne type
> > > > >   b. zbd_zone_type
> > > > >     - zone type: conventional, sequential write required, sequent=
ial
> > > > > write preferred
> > > > >   c. zbd_dev_model: host-managed zbd, host-aware zbd
> > > >
> > > > This explanation is a little hard to understand. It seems to be mix=
ing up
> > > > device level information and per-zone information. I think it would=
 be a
> > > > lot simpler to write a struct definition to directly illustrate wha=
t you
> > > > are planning.
> > > >
> > > > It is something like this ?
> > > >
> > > > struct zbd_zone {
> > > >         enum zone_type  type;
> > > >         enum zone_cond  cond;
> > > >         uint64_t        start;
> > > >         uint32_t        length;
> > > >         uint32_t        cap;
> > > >         uint64_t        wp;
> > > > };
> > > >
> > > > strcut zbd_dev {
> > > >         enum zone_model model;
> > > >         uint32_t        block_size;
> > > >         uint32_t        write_granularity;
> > > >         uint32_t        nr_zones
> > > >         struct zbd_zone *zones; /* array of zones */
> > > > };
> > > >
> > > > If yes, then my comments are as follows.
> > > >
> > > > For the device struct: It may be good to have also the maximum numb=
er of
> > > > open zones and the maximum number of active zones.
> > > >
> > > > For the zone struct: You may need to add a read-write lock per zone=
 to be
> > > > able to write lock zones to ensure a sequential write pattern (virt=
io
> > > > devices can be multi-queue and so writes may be coming in from diff=
erent
> > > > contexts) and to correctly emulate zone append operations with an a=
tomic
> > > > update of the wp field.
> > > >
> > > > These need to be integrated into the generic block driver interface=
 in
> > > > include/block/block_int-common.h or include/block/block-common.h.
> > >
> > > QEMU's block layer has a few ways of exposing information about block=
 devices:
> > >
> > >     int (*bdrv_get_info)(BlockDriverState *bs, BlockDriverInfo *bdi);
> > >     ImageInfoSpecific *(*bdrv_get_specific_info)(BlockDriverState *bs=
,
> > > Error **errp);
> > >
> > > These fetch information from the BlockDriver and are good when a smal=
l
> > > amount of data is reported occassionally and consumed by the caller.
> > >
> > > For data that is continuously accessed or that could be large, it may
> > > be necessary for the data to reside inside BlockDriverState so that i=
t
> > > can be accessed in place (without copying):
> > >
> > >     void (*bdrv_refresh_limits)(BlockDriverState *bs, Error **errp);
> > >
> > > QEMU uses this for the BlockLimits struct (BlockDriverState::bl) that
> > > is continuously accessed by the block layer while processing I/O
> > > requests. The "refresh" function updates the data in case the
> > > underlying storage device has changed somehow. If no update function
> > > is necessary then data can simply be populated during .bdrv_open() an=
d
> > > no new BlockDriver callback needs to be added.
> > >
> > > So in the simplest case BlockDriverState can be extended with a struc=
t
> > > zbd_dev field that is populated during .bdrv_open(). If the
> > > BlockDriver doesn't support zones then the zbd_dev.nr_zones field is =
0
> > > or the model field indicates that this is not a zoned storage device.
> > >
> > > However, a BlockBackend (not BlockDriverState!) API will be needed to
> > > expose this data to users like the hw/block/virtio-blk.c emulation
> > > code or the qemu-io-cmds.c utility that can be used for testing. A
> > > BlockBackend has a root pointer to a BlockDriverState graph (for
> > > example, qcow2 on top of file-posix). It will be necessary to
> > > propagate zoned storage information from the leaf BlockDriverState al=
l
> > > the way up to the BlockBackend. In simple cases the BB root points
> > > directly to the file-posix BDS that has Linux ZBD support but the
> > > design needs to account for additional BDS graph nodes.
> >
> > I think a simple way to think BlockBackend APIs is to use following
> > callbacks: blk_aio_zone_mgmt() -> blk_aio_prwv() +
> > blk_aio_zone_mgmt_entry() -> blk_co_do_zone_mgmt() -> blk_zone_mgmt().
> > The last function call will call bdrv_co_zone_mgmt() in
> > block/file-posix.c. If I understand the additional case correctly, the
> > BlockBackend API can expose the zone information to the virtio-blk
> > emulation now.
>
> Yes!
>
> block/raw-format.c also needs to implement .bdrv_co_zone_mgmt() by
> calling bdrv_co_zone_mgmt(bs->file, ...). This is because the
> raw-format.c driver usually sits on top of file-posix.c and has to
> pass through requests.
>
> There are filter block drivers like block/throttle.c,
> block/blkdebug.c, etc (git grep is_filter block/) that will also need
> to be modified to pass through requests in the same way.
>

Are the filter block drivers also on top of file-posix.c but below
block-backend.c? I read that the filter block drivers, and formats are
designed to be manageable pieces so as to make block device
configuration easier and clearer.

> Based on what I've read in Dmitry's virtio-blk spec proposal, the
> BlockBackend API could look something like:
>
> typedef struct { ...model, zone_sectors, max_open_zones, etc... } BlockZo=
neInfo;
> void blk_get_zone_info(BlockBackend *blk, BlockZoneInfo *info);
>
> virtio-blk.c calls this to fill out configuration space fields and
> determine whether the BlockBackend is a zoned device.
>
> Then there are 3 commands that happen in the I/O code path:
>
> typedef struct { ... } BlockZoneDescriptor;
> BlockAIOCB *blk_aio_zone_report(BlockBackend *blk, int64_t offset,
> BlockZoneDescriptor *zones, size_t max_zones, BlockCompletionFunc *cb,
> void *opaque);
>
> typedef enum { ... } BlockZoneMgmtCmd;
> BlockAIOCB *blk_aio_zone_mgmt_send(BlockBackend *blk, int64_t offset,
> BlockZoneMgmtCmd cmd, bool all, BlockCompletionFunc *cb, void
> *opaque);
>
> typedef void BlockZoneAppendCompletionFunc(void *opaque, int ret,
> int64_t new_wp);
> BlockAIOCB *blk_aio_zone_append(BlockBackend *blk, int64_t offset,
> QEMUIOVector *qiov, BlockZoneAppendCompletionFunc *cb, void *opaque);
>
> > Besides, comparing blk_aio_flush() with blk_flush() in block-backend.c
> > which lead to include/block/block-io.h, we may need consider the case
> > when calling block layer API from non-coroutine context. Meanwhile,
> > using bdrv_co_writev()/bdrv_co_readv() instead of read-write lock per
> > zone may be a option too.
>
> Yes, device emulation code usually uses the aio versions of the
> BlockBackend I/O functions (read, write, flush). The QEMU block layer
> runs the aio I/O request inside a coroutine and usually also exposes
> coroutine versions of the same functions. For example, block jobs
> (e.g. storage mirroring, backup, and migration background tasks)
> usually call the coroutine versions of the BlockBackend APIs instead
> of the aio ones.
>
> qemu-io-cmds.c will want synchronous versions of the aio commands
> (blk_zone_report(), blk_zone_mgmt_send(), blk_zone_append()) that
> block until the command completes. This is because the qemu-io utility
> typically executes one command at a time and it's written mostly in
> blocking style rather than async callbacks or coroutines.
> docs/devel/block-coroutine-wrapper.rst describes how to generate
> synchronous versions of coroutine functions.
>
> Do you want to start implementing blk_get_zone_info()? This will
> require blk_*(), bdrv_*(), and BlockDriver (block/file-posix.c)
> functions.

I want to implement the smallest part that can be tested first and
then move on to the next part. And I want to test zone report
operation first. Does the qemu io-test require the following part to
work: bdrv_co_zone_report in file-pisix.c, blk_get_zone_info() in
block-backend.c, blk_aio_zone_report() in io code path and modify some
test in test/qemu-iotests? If it does, then yes.

Have a nice day!

Sam
>
> Stefan

