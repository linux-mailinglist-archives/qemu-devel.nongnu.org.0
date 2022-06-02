Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F71753B4E3
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 10:22:49 +0200 (CEST)
Received: from localhost ([::1]:42570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwg6S-0004HH-22
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 04:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nwfq8-0003b2-B8; Thu, 02 Jun 2022 04:06:06 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d]:34002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nwfq5-0008NU-Ee; Thu, 02 Jun 2022 04:05:55 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-f314077115so5845204fac.1; 
 Thu, 02 Jun 2022 01:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=b4rsqS+O27LFsrL+YXuxygrGDdOtKVNIEwmYDUnDs1Q=;
 b=kfYoYzgbtcvqAWM3Gfj8luSWNVlCl2uMY4eMoHokqmK6kmtdW6yWk4xtnUS9l7pqB2
 Lne9ugedJp9hnqKWn1Zj3xcpx0dZFG53UY4CPrmyzbPuTz+tLZ3yiJWtbIuvlgpGNDjx
 WSAUOi6GvsGXzBwA3E/PwN14FxmreeXUv8FyYGPXYfBvig638Z4SwMraWEWMl/p8aDkD
 cETtP3HAkHJiWndN6eHQXNm+tDXPhfiEY5E8CIqH9QR1BJabCkCZaYK29cXeZFSS6Yeb
 6atk7ksRkWPZwGVEnn6TC1etEGLp1Jz7p71WZieZ9cXEwL9u5LaPG6xWUYLWBuf913ez
 B8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=b4rsqS+O27LFsrL+YXuxygrGDdOtKVNIEwmYDUnDs1Q=;
 b=YaoxeROXsoioYUJpB3y2c8iCK2rqo4YsPwg7+y/T80WkDgr/Q4jK4TGA3Lh6cR8PAS
 P+PhQUukUKQLkO0VHY0dRsERVGNnahqDI/vnInSUoVf3SeZw/DReVTcITFuKkJvInhxI
 iuU/w5WzWB1CBA84k8YEeerz8+RsPp5dpcTd61E+3vHki4F+DsOgEkM5sYGZZULtaSZP
 bwWHguUoACt4voCH0vewyl/9KcX3Bdn+lm6WwsPZmkUZoKkHOsEnIkX7ccealOt6NnsB
 NM6f3vrHcySE5mEnokWJq6yTYkQ+V4dQq2oZapkbg13HvV/wu2uEk6qVKe1yP9XE1ypp
 OCzQ==
X-Gm-Message-State: AOAM532/FHlAUpiTkyvklqFFITQjVGj7X1GZszpglNznWSv4Aqq9ReH0
 AbzeNVCYCj0b8bvD8W1SnQC92Fib1YXxde+jLvY=
X-Google-Smtp-Source: ABdhPJy9pM2uHw2EgmtDPIiWYT0dcLEbT/oMQImjwziIaHawzr70kdWX7PRMrAeRCliaN1+wv9rjw6IwEjcqGULVyoQ=
X-Received: by 2002:a05:6870:e30e:b0:de:ab76:eed7 with SMTP id
 z14-20020a056870e30e00b000deab76eed7mr18933740oad.101.1654157151020; Thu, 02
 Jun 2022 01:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAAAx-8+ECfznYPcJqPvP=7fzfgQobU1t+kGhGzWvArjm_Xs_yg@mail.gmail.com>
 <CAJSP0QURQOD79ixL2j__uBCuaJL19sytKpMr6QT2QY_+VnQPtg@mail.gmail.com>
 <CAAAx-8LsXQ=w7QTz0JHfGp6gbgY5najE0N7K0yBwhdqqH+E6Eg@mail.gmail.com>
 <be663d15-6db3-1777-0830-60dcc6aa394e@opensource.wdc.com>
 <CAJSP0QWLn5i9at7vhFdgOysZ0+voKFYRQqRquVaxh_EoZXRDRg@mail.gmail.com>
 <CAAAx-8JWexta+c396Os_YGAOicf8j6d6A8QVf1n5Su8fHiiGwQ@mail.gmail.com>
In-Reply-To: <CAAAx-8JWexta+c396Os_YGAOicf8j6d6A8QVf1n5Su8fHiiGwQ@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 2 Jun 2022 09:05:39 +0100
Message-ID: <CAJSP0QXfUeeGgq7RoXWRpcf-5Yob9BgoJPv4tBwav+xsn_R9OQ@mail.gmail.com>
Subject: Re: Outreachy project task: Adding QEMU block layer APIs resembling
 Linux ZBD ioctls.
To: Sam Li <faithilikerun@gmail.com>
Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Hannes Reinecke <hare@suse.de>, 
 qemu-devel <qemu-devel@nongnu.org>, qemu block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=stefanha@gmail.com; helo=mail-oa1-x2d.google.com
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

On Thu, 2 Jun 2022 at 06:43, Sam Li <faithilikerun@gmail.com> wrote:
>
> Hi Stefan,
>
> Stefan Hajnoczi <stefanha@gmail.com> =E4=BA=8E2022=E5=B9=B46=E6=9C=881=E6=
=97=A5=E5=91=A8=E4=B8=89 19:43=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Wed, 1 Jun 2022 at 06:47, Damien Le Moal
> > <damien.lemoal@opensource.wdc.com> wrote:
> > >
> > > On 6/1/22 11:57, Sam Li wrote:
> > > > Hi Stefan,
> > > >
> > > > Stefan Hajnoczi <stefanha@gmail.com> =E4=BA=8E2022=E5=B9=B45=E6=9C=
=8830=E6=97=A5=E5=91=A8=E4=B8=80 19:19=E5=86=99=E9=81=93=EF=BC=9A
> > > >
> > > >
> > > >>
> > > >> On Mon, 30 May 2022 at 06:09, Sam Li <faithilikerun@gmail.com> wro=
te:
> > > >>>
> > > >>> Hi everyone,
> > > >>> I'm Sam Li, working on the Outreachy project which is to add zone=
d
> > > >>> device support to QEMU's virtio-blk emulation.
> > > >>>
> > > >>> For the first goal, adding QEMU block layer APIs resembling Linux=
 ZBD
> > > >>> ioctls, I think the naive approach would be to introduce a new st=
able
> > > >>> struct zbd_zone descriptor for the library function interface. Mo=
re
> > > >>> specifically, what I'd like to add to the BlockDriver struct are:
> > > >>> 1. zbd_info as zone block device information: includes numbers of
> > > >>> zones, size of logical blocks, and physical blocks.
> > > >>> 2. zbd_zone_type and zbd_zone_state
> > > >>> 3. zbd_dev_model: host-managed zbd, host-aware zbd
> > > >>> With those basic structs, we can start to implement new functions=
 as
> > > >>> bdrv*() APIs for BLOCK*ZONE ioctls.
> > > >>>
> > > >>> I'll start to finish this task based on the above description. If
> > > >>> there is any problem or something I may miss in the design, pleas=
e let
> > > >>> me know.
> > > >>
> > > >> Hi Sam,
> > > >> Can you propose function prototypes for the new BlockDriver callba=
cks
> > > >> needed for zoned devices?
> > > >
> > > > I have made some modifications based on Damien's device in design p=
art
> > > > 1 and added the function prototypes in design part 2. If there is a=
ny
> > > > problem or part I missed, please let me know.
> > > >
> > > > Design of Block Layer APIs in BlockDriver:
> > > > 1. introduce a new stable struct zbd_zone descriptor for the librar=
y
> > > > function interface.
> > > >   a. zbd_info as zone block device information: includes numbers of
> > > > zones, size of blocks, write granularity in byte(minimal write size
> > > > and alignment
> > > >     - write granularity: 512e SMRs: writes in units of physical blo=
ck
> > > > size, 4096 bytes; NVMe ZNS write granularity is equal to the block
> > > > size.
> > > >     - zone descriptor: start, length, capacity, write pointer, zone=
 type
> > > >   b. zbd_zone_type
> > > >     - zone type: conventional, sequential write required, sequentia=
l
> > > > write preferred
> > > >   c. zbd_dev_model: host-managed zbd, host-aware zbd
> > >
> > > This explanation is a little hard to understand. It seems to be mixin=
g up
> > > device level information and per-zone information. I think it would b=
e a
> > > lot simpler to write a struct definition to directly illustrate what =
you
> > > are planning.
> > >
> > > It is something like this ?
> > >
> > > struct zbd_zone {
> > >         enum zone_type  type;
> > >         enum zone_cond  cond;
> > >         uint64_t        start;
> > >         uint32_t        length;
> > >         uint32_t        cap;
> > >         uint64_t        wp;
> > > };
> > >
> > > strcut zbd_dev {
> > >         enum zone_model model;
> > >         uint32_t        block_size;
> > >         uint32_t        write_granularity;
> > >         uint32_t        nr_zones
> > >         struct zbd_zone *zones; /* array of zones */
> > > };
> > >
> > > If yes, then my comments are as follows.
> > >
> > > For the device struct: It may be good to have also the maximum number=
 of
> > > open zones and the maximum number of active zones.
> > >
> > > For the zone struct: You may need to add a read-write lock per zone t=
o be
> > > able to write lock zones to ensure a sequential write pattern (virtio
> > > devices can be multi-queue and so writes may be coming in from differ=
ent
> > > contexts) and to correctly emulate zone append operations with an ato=
mic
> > > update of the wp field.
> > >
> > > These need to be integrated into the generic block driver interface i=
n
> > > include/block/block_int-common.h or include/block/block-common.h.
> >
> > QEMU's block layer has a few ways of exposing information about block d=
evices:
> >
> >     int (*bdrv_get_info)(BlockDriverState *bs, BlockDriverInfo *bdi);
> >     ImageInfoSpecific *(*bdrv_get_specific_info)(BlockDriverState *bs,
> > Error **errp);
> >
> > These fetch information from the BlockDriver and are good when a small
> > amount of data is reported occassionally and consumed by the caller.
> >
> > For data that is continuously accessed or that could be large, it may
> > be necessary for the data to reside inside BlockDriverState so that it
> > can be accessed in place (without copying):
> >
> >     void (*bdrv_refresh_limits)(BlockDriverState *bs, Error **errp);
> >
> > QEMU uses this for the BlockLimits struct (BlockDriverState::bl) that
> > is continuously accessed by the block layer while processing I/O
> > requests. The "refresh" function updates the data in case the
> > underlying storage device has changed somehow. If no update function
> > is necessary then data can simply be populated during .bdrv_open() and
> > no new BlockDriver callback needs to be added.
> >
> > So in the simplest case BlockDriverState can be extended with a struct
> > zbd_dev field that is populated during .bdrv_open(). If the
> > BlockDriver doesn't support zones then the zbd_dev.nr_zones field is 0
> > or the model field indicates that this is not a zoned storage device.
> >
> > However, a BlockBackend (not BlockDriverState!) API will be needed to
> > expose this data to users like the hw/block/virtio-blk.c emulation
> > code or the qemu-io-cmds.c utility that can be used for testing. A
> > BlockBackend has a root pointer to a BlockDriverState graph (for
> > example, qcow2 on top of file-posix). It will be necessary to
> > propagate zoned storage information from the leaf BlockDriverState all
> > the way up to the BlockBackend. In simple cases the BB root points
> > directly to the file-posix BDS that has Linux ZBD support but the
> > design needs to account for additional BDS graph nodes.
>
> I think a simple way to think BlockBackend APIs is to use following
> callbacks: blk_aio_zone_mgmt() -> blk_aio_prwv() +
> blk_aio_zone_mgmt_entry() -> blk_co_do_zone_mgmt() -> blk_zone_mgmt().
> The last function call will call bdrv_co_zone_mgmt() in
> block/file-posix.c. If I understand the additional case correctly, the
> BlockBackend API can expose the zone information to the virtio-blk
> emulation now.

Yes!

block/raw-format.c also needs to implement .bdrv_co_zone_mgmt() by
calling bdrv_co_zone_mgmt(bs->file, ...). This is because the
raw-format.c driver usually sits on top of file-posix.c and has to
pass through requests.

There are filter block drivers like block/throttle.c,
block/blkdebug.c, etc (git grep is_filter block/) that will also need
to be modified to pass through requests in the same way.

Based on what I've read in Dmitry's virtio-blk spec proposal, the
BlockBackend API could look something like:

typedef struct { ...model, zone_sectors, max_open_zones, etc... } BlockZone=
Info;
void blk_get_zone_info(BlockBackend *blk, BlockZoneInfo *info);

virtio-blk.c calls this to fill out configuration space fields and
determine whether the BlockBackend is a zoned device.

Then there are 3 commands that happen in the I/O code path:

typedef struct { ... } BlockZoneDescriptor;
BlockAIOCB *blk_aio_zone_report(BlockBackend *blk, int64_t offset,
BlockZoneDescriptor *zones, size_t max_zones, BlockCompletionFunc *cb,
void *opaque);

typedef enum { ... } BlockZoneMgmtCmd;
BlockAIOCB *blk_aio_zone_mgmt_send(BlockBackend *blk, int64_t offset,
BlockZoneMgmtCmd cmd, bool all, BlockCompletionFunc *cb, void
*opaque);

typedef void BlockZoneAppendCompletionFunc(void *opaque, int ret,
int64_t new_wp);
BlockAIOCB *blk_aio_zone_append(BlockBackend *blk, int64_t offset,
QEMUIOVector *qiov, BlockZoneAppendCompletionFunc *cb, void *opaque);

> Besides, comparing blk_aio_flush() with blk_flush() in block-backend.c
> which lead to include/block/block-io.h, we may need consider the case
> when calling block layer API from non-coroutine context. Meanwhile,
> using bdrv_co_writev()/bdrv_co_readv() instead of read-write lock per
> zone may be a option too.

Yes, device emulation code usually uses the aio versions of the
BlockBackend I/O functions (read, write, flush). The QEMU block layer
runs the aio I/O request inside a coroutine and usually also exposes
coroutine versions of the same functions. For example, block jobs
(e.g. storage mirroring, backup, and migration background tasks)
usually call the coroutine versions of the BlockBackend APIs instead
of the aio ones.

qemu-io-cmds.c will want synchronous versions of the aio commands
(blk_zone_report(), blk_zone_mgmt_send(), blk_zone_append()) that
block until the command completes. This is because the qemu-io utility
typically executes one command at a time and it's written mostly in
blocking style rather than async callbacks or coroutines.
docs/devel/block-coroutine-wrapper.rst describes how to generate
synchronous versions of coroutine functions.

Do you want to start implementing blk_get_zone_info()? This will
require blk_*(), bdrv_*(), and BlockDriver (block/file-posix.c)
functions.

Stefan

