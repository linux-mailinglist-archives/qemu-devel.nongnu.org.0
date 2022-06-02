Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D473653BEE7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 21:38:14 +0200 (CEST)
Received: from localhost ([::1]:48076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwqe5-0002bS-F0
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 15:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nwqci-0001gI-OC; Thu, 02 Jun 2022 15:36:50 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:35409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nwqcf-00022W-2G; Thu, 02 Jun 2022 15:36:48 -0400
Received: by mail-oi1-x235.google.com with SMTP id h188so7807131oia.2;
 Thu, 02 Jun 2022 12:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=K1e72QWwl+f+VRxQkV/P5EM8YAp2zxqbnof9Wyk3q9o=;
 b=kCf+KBRn2s8lsR2nB4DHQNH8BvV4huz4MbTQBoKwr0iVNf5YBDKt/EMrdXxP9oIwhq
 gkaysVDxtbkxJOtpHiP16OiPgtl+xkWLLgll5lw73K+bqpVRwtoAc5XTIu26goBziCkU
 pzJwQVw7M7224DzhcvvfDvUav5rctGAed/fmSQjXOoeXf+4yfzNCDGobi0RF1xaGb59u
 YA7/fedxbkXHXHWdbxdwnNMqAoZQx3i3BFBRVuH2JM2X1g6W+tjeA0B7HxtgaC1Yt9EC
 F598bfz91+ez5OOZivGMzYEH32QEx7fM3S1c3CyUYX1rkNahNa7K2VbShsUatwCWP/pM
 vPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=K1e72QWwl+f+VRxQkV/P5EM8YAp2zxqbnof9Wyk3q9o=;
 b=R3kp/aReBzesi+Mj5CO3qiSIQAgF2HoCiuVUggz6HroDClDyZ8FjgknLBukqxerV2i
 18lBAEi7jlln4z9qTi6E7stLlO2CWRWrxpOZW9d3iLtY29RWmlGd9LyYftgzeUiqq/b6
 DxXnjlTFIP5Y0DJp3/STpkJj4YN93tKbrw2MYON289X8xGlYg8BPBEVYn3q8UXLdsdLE
 msu8Uou8OSiTPv+ipnAx6wcrUAfu0dsV8062Spnvt+unrBFBZvp1Tfk40P3BUWFfYg4Q
 r0fXB1A/TT2VG6/VRt8/ni7i6d6hTl/e6LOWQ9uOfI/bhRCQmqd4pma8BjXMCxHpFO6B
 G5JA==
X-Gm-Message-State: AOAM5338fhLswAqsi+TYS5NrQPNz/AVlFf/Rk4Nbp3fPjVl8VF6aYKid
 6GdLm45vNBqZrFEfdnzi+a0jsqL8ebPPOUIxWMw=
X-Google-Smtp-Source: ABdhPJxD2HWnPmjqpr24ay80Rzcvtit62vt70ggqUO7jMOoKQWhbuZdfdi4AerXVnVoAIPb63VHMDMojXnvkgM2/YdI=
X-Received: by 2002:a05:6808:1c0d:b0:32e:493b:1e2 with SMTP id
 ch13-20020a0568081c0d00b0032e493b01e2mr731280oib.101.1654198598955; Thu, 02
 Jun 2022 12:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAAAx-8+ECfznYPcJqPvP=7fzfgQobU1t+kGhGzWvArjm_Xs_yg@mail.gmail.com>
 <CAJSP0QURQOD79ixL2j__uBCuaJL19sytKpMr6QT2QY_+VnQPtg@mail.gmail.com>
 <CAAAx-8LsXQ=w7QTz0JHfGp6gbgY5najE0N7K0yBwhdqqH+E6Eg@mail.gmail.com>
 <be663d15-6db3-1777-0830-60dcc6aa394e@opensource.wdc.com>
 <CAJSP0QWLn5i9at7vhFdgOysZ0+voKFYRQqRquVaxh_EoZXRDRg@mail.gmail.com>
 <CAAAx-8JWexta+c396Os_YGAOicf8j6d6A8QVf1n5Su8fHiiGwQ@mail.gmail.com>
 <CAJSP0QXfUeeGgq7RoXWRpcf-5Yob9BgoJPv4tBwav+xsn_R9OQ@mail.gmail.com>
 <CAAAx-8JGrhrcD8Nk__jHXx-xDDPy6O8qPppjUpe=is3351VW4w@mail.gmail.com>
In-Reply-To: <CAAAx-8JGrhrcD8Nk__jHXx-xDDPy6O8qPppjUpe=is3351VW4w@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 2 Jun 2022 20:36:26 +0100
Message-ID: <CAJSP0QX7Bf4tmm3axEHQZUH_NXKE49BrBdrHpvcf=qABXQPPDA@mail.gmail.com>
Subject: Re: Outreachy project task: Adding QEMU block layer APIs resembling
 Linux ZBD ioctls.
To: Sam Li <faithilikerun@gmail.com>
Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Hannes Reinecke <hare@suse.de>, 
 qemu-devel <qemu-devel@nongnu.org>, qemu block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=stefanha@gmail.com; helo=mail-oi1-x235.google.com
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

On Thu, 2 Jun 2022 at 11:28, Sam Li <faithilikerun@gmail.com> wrote:
>
> Stefan Hajnoczi <stefanha@gmail.com> =E4=BA=8E2022=E5=B9=B46=E6=9C=882=E6=
=97=A5=E5=91=A8=E5=9B=9B 16:05=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Thu, 2 Jun 2022 at 06:43, Sam Li <faithilikerun@gmail.com> wrote:
> > >
> > > Hi Stefan,
> > >
> > > Stefan Hajnoczi <stefanha@gmail.com> =E4=BA=8E2022=E5=B9=B46=E6=9C=88=
1=E6=97=A5=E5=91=A8=E4=B8=89 19:43=E5=86=99=E9=81=93=EF=BC=9A
> > > >
> > > > On Wed, 1 Jun 2022 at 06:47, Damien Le Moal
> > > > <damien.lemoal@opensource.wdc.com> wrote:
> > > > >
> > > > > On 6/1/22 11:57, Sam Li wrote:
> > > > > > Hi Stefan,
> > > > > >
> > > > > > Stefan Hajnoczi <stefanha@gmail.com> =E4=BA=8E2022=E5=B9=B45=E6=
=9C=8830=E6=97=A5=E5=91=A8=E4=B8=80 19:19=E5=86=99=E9=81=93=EF=BC=9A
> > > > > >
> > > > > >
> > > > > >>
> > > > > >> On Mon, 30 May 2022 at 06:09, Sam Li <faithilikerun@gmail.com>=
 wrote:
> > > > > >>>
> > > > > >>> Hi everyone,
> > > > > >>> I'm Sam Li, working on the Outreachy project which is to add =
zoned
> > > > > >>> device support to QEMU's virtio-blk emulation.
> > > > > >>>
> > > > > >>> For the first goal, adding QEMU block layer APIs resembling L=
inux ZBD
> > > > > >>> ioctls, I think the naive approach would be to introduce a ne=
w stable
> > > > > >>> struct zbd_zone descriptor for the library function interface=
. More
> > > > > >>> specifically, what I'd like to add to the BlockDriver struct =
are:
> > > > > >>> 1. zbd_info as zone block device information: includes number=
s of
> > > > > >>> zones, size of logical blocks, and physical blocks.
> > > > > >>> 2. zbd_zone_type and zbd_zone_state
> > > > > >>> 3. zbd_dev_model: host-managed zbd, host-aware zbd
> > > > > >>> With those basic structs, we can start to implement new funct=
ions as
> > > > > >>> bdrv*() APIs for BLOCK*ZONE ioctls.
> > > > > >>>
> > > > > >>> I'll start to finish this task based on the above description=
. If
> > > > > >>> there is any problem or something I may miss in the design, p=
lease let
> > > > > >>> me know.
> > > > > >>
> > > > > >> Hi Sam,
> > > > > >> Can you propose function prototypes for the new BlockDriver ca=
llbacks
> > > > > >> needed for zoned devices?
> > > > > >
> > > > > > I have made some modifications based on Damien's device in desi=
gn part
> > > > > > 1 and added the function prototypes in design part 2. If there =
is any
> > > > > > problem or part I missed, please let me know.
> > > > > >
> > > > > > Design of Block Layer APIs in BlockDriver:
> > > > > > 1. introduce a new stable struct zbd_zone descriptor for the li=
brary
> > > > > > function interface.
> > > > > >   a. zbd_info as zone block device information: includes number=
s of
> > > > > > zones, size of blocks, write granularity in byte(minimal write =
size
> > > > > > and alignment
> > > > > >     - write granularity: 512e SMRs: writes in units of physical=
 block
> > > > > > size, 4096 bytes; NVMe ZNS write granularity is equal to the bl=
ock
> > > > > > size.
> > > > > >     - zone descriptor: start, length, capacity, write pointer, =
zone type
> > > > > >   b. zbd_zone_type
> > > > > >     - zone type: conventional, sequential write required, seque=
ntial
> > > > > > write preferred
> > > > > >   c. zbd_dev_model: host-managed zbd, host-aware zbd
> > > > >
> > > > > This explanation is a little hard to understand. It seems to be m=
ixing up
> > > > > device level information and per-zone information. I think it wou=
ld be a
> > > > > lot simpler to write a struct definition to directly illustrate w=
hat you
> > > > > are planning.
> > > > >
> > > > > It is something like this ?
> > > > >
> > > > > struct zbd_zone {
> > > > >         enum zone_type  type;
> > > > >         enum zone_cond  cond;
> > > > >         uint64_t        start;
> > > > >         uint32_t        length;
> > > > >         uint32_t        cap;
> > > > >         uint64_t        wp;
> > > > > };
> > > > >
> > > > > strcut zbd_dev {
> > > > >         enum zone_model model;
> > > > >         uint32_t        block_size;
> > > > >         uint32_t        write_granularity;
> > > > >         uint32_t        nr_zones
> > > > >         struct zbd_zone *zones; /* array of zones */
> > > > > };
> > > > >
> > > > > If yes, then my comments are as follows.
> > > > >
> > > > > For the device struct: It may be good to have also the maximum nu=
mber of
> > > > > open zones and the maximum number of active zones.
> > > > >
> > > > > For the zone struct: You may need to add a read-write lock per zo=
ne to be
> > > > > able to write lock zones to ensure a sequential write pattern (vi=
rtio
> > > > > devices can be multi-queue and so writes may be coming in from di=
fferent
> > > > > contexts) and to correctly emulate zone append operations with an=
 atomic
> > > > > update of the wp field.
> > > > >
> > > > > These need to be integrated into the generic block driver interfa=
ce in
> > > > > include/block/block_int-common.h or include/block/block-common.h.
> > > >
> > > > QEMU's block layer has a few ways of exposing information about blo=
ck devices:
> > > >
> > > >     int (*bdrv_get_info)(BlockDriverState *bs, BlockDriverInfo *bdi=
);
> > > >     ImageInfoSpecific *(*bdrv_get_specific_info)(BlockDriverState *=
bs,
> > > > Error **errp);
> > > >
> > > > These fetch information from the BlockDriver and are good when a sm=
all
> > > > amount of data is reported occassionally and consumed by the caller=
.
> > > >
> > > > For data that is continuously accessed or that could be large, it m=
ay
> > > > be necessary for the data to reside inside BlockDriverState so that=
 it
> > > > can be accessed in place (without copying):
> > > >
> > > >     void (*bdrv_refresh_limits)(BlockDriverState *bs, Error **errp)=
;
> > > >
> > > > QEMU uses this for the BlockLimits struct (BlockDriverState::bl) th=
at
> > > > is continuously accessed by the block layer while processing I/O
> > > > requests. The "refresh" function updates the data in case the
> > > > underlying storage device has changed somehow. If no update functio=
n
> > > > is necessary then data can simply be populated during .bdrv_open() =
and
> > > > no new BlockDriver callback needs to be added.
> > > >
> > > > So in the simplest case BlockDriverState can be extended with a str=
uct
> > > > zbd_dev field that is populated during .bdrv_open(). If the
> > > > BlockDriver doesn't support zones then the zbd_dev.nr_zones field i=
s 0
> > > > or the model field indicates that this is not a zoned storage devic=
e.
> > > >
> > > > However, a BlockBackend (not BlockDriverState!) API will be needed =
to
> > > > expose this data to users like the hw/block/virtio-blk.c emulation
> > > > code or the qemu-io-cmds.c utility that can be used for testing. A
> > > > BlockBackend has a root pointer to a BlockDriverState graph (for
> > > > example, qcow2 on top of file-posix). It will be necessary to
> > > > propagate zoned storage information from the leaf BlockDriverState =
all
> > > > the way up to the BlockBackend. In simple cases the BB root points
> > > > directly to the file-posix BDS that has Linux ZBD support but the
> > > > design needs to account for additional BDS graph nodes.
> > >
> > > I think a simple way to think BlockBackend APIs is to use following
> > > callbacks: blk_aio_zone_mgmt() -> blk_aio_prwv() +
> > > blk_aio_zone_mgmt_entry() -> blk_co_do_zone_mgmt() -> blk_zone_mgmt()=
.
> > > The last function call will call bdrv_co_zone_mgmt() in
> > > block/file-posix.c. If I understand the additional case correctly, th=
e
> > > BlockBackend API can expose the zone information to the virtio-blk
> > > emulation now.
> >
> > Yes!
> >
> > block/raw-format.c also needs to implement .bdrv_co_zone_mgmt() by
> > calling bdrv_co_zone_mgmt(bs->file, ...). This is because the
> > raw-format.c driver usually sits on top of file-posix.c and has to
> > pass through requests.
> >
> > There are filter block drivers like block/throttle.c,
> > block/blkdebug.c, etc (git grep is_filter block/) that will also need
> > to be modified to pass through requests in the same way.
> >
>
> Are the filter block drivers also on top of file-posix.c but below
> block-backend.c? I read that the filter block drivers, and formats are
> designed to be manageable pieces so as to make block device
> configuration easier and clearer.

Yes, the filters are BlockDrivers and each instance has a
BlockDriverState. They are part of the same BlockDriverState graph as
file-posix.c.

BlockBackend has a "root" BlockDriverState pointer. It points to a
graph of BlockDriverStates and there are 3 types of nodes:
- Filter nodes like block/throttle.c that provide some extra
functionality like I/O throttling.
- Format nodes like qcow2, raw, or vmdk that implement disk image file form=
ats.
- Protocol nodes like file-posix, iSCSI, etc that implement access to
underlying storage.

The graph is pretty flexible. It's possible to insert/remove nodes to
construct arbitrary graphs.

Protocol nodes are the leaf nodes in the graph. Filter and format
nodes are above protocol nodes.

If we want to open /dev/nullb0 and limit I/O rates to 10 MB/s the
graph would be:
throttle (10 MB/s) -> raw-format -> file-posix (/dev/nullb0)

The BlockBackend root would point at the throttle node. I/O requests
made using blk_*() APIs will be forwarded to the throttle node using
bdrv_*() APIs. The throttle node forwards requests to the raw-format
node using bdrv_*() APIs. The raw-format node forwards I/O requests to
the file-posix node using bdrv_*() APIs. Here is block/raw-format.c's
preadv implementation:
  static int coroutine_fn raw_co_preadv(BlockDriverState *bs, int64_t offse=
t,
                                        int64_t bytes, QEMUIOVector *qiov,
                                        BdrvRequestFlags flags)
  {
      int ret;

      ret =3D raw_adjust_offset(bs, &offset, bytes, false);
      if (ret) {
          return ret;
      }

      BLKDBG_EVENT(bs->file, BLKDBG_READ_AIO);
      return bdrv_co_preadv(bs->file, offset, bytes, qiov, flags);
                 ^^^^^^^^^^^^^^^^^^^^^^^ forward I/O to child graph node
  }

>
> > Based on what I've read in Dmitry's virtio-blk spec proposal, the
> > BlockBackend API could look something like:
> >
> > typedef struct { ...model, zone_sectors, max_open_zones, etc... } Block=
ZoneInfo;
> > void blk_get_zone_info(BlockBackend *blk, BlockZoneInfo *info);
> >
> > virtio-blk.c calls this to fill out configuration space fields and
> > determine whether the BlockBackend is a zoned device.
> >
> > Then there are 3 commands that happen in the I/O code path:
> >
> > typedef struct { ... } BlockZoneDescriptor;
> > BlockAIOCB *blk_aio_zone_report(BlockBackend *blk, int64_t offset,
> > BlockZoneDescriptor *zones, size_t max_zones, BlockCompletionFunc *cb,
> > void *opaque);
> >
> > typedef enum { ... } BlockZoneMgmtCmd;
> > BlockAIOCB *blk_aio_zone_mgmt_send(BlockBackend *blk, int64_t offset,
> > BlockZoneMgmtCmd cmd, bool all, BlockCompletionFunc *cb, void
> > *opaque);
> >
> > typedef void BlockZoneAppendCompletionFunc(void *opaque, int ret,
> > int64_t new_wp);
> > BlockAIOCB *blk_aio_zone_append(BlockBackend *blk, int64_t offset,
> > QEMUIOVector *qiov, BlockZoneAppendCompletionFunc *cb, void *opaque);
> >
> > > Besides, comparing blk_aio_flush() with blk_flush() in block-backend.=
c
> > > which lead to include/block/block-io.h, we may need consider the case
> > > when calling block layer API from non-coroutine context. Meanwhile,
> > > using bdrv_co_writev()/bdrv_co_readv() instead of read-write lock per
> > > zone may be a option too.
> >
> > Yes, device emulation code usually uses the aio versions of the
> > BlockBackend I/O functions (read, write, flush). The QEMU block layer
> > runs the aio I/O request inside a coroutine and usually also exposes
> > coroutine versions of the same functions. For example, block jobs
> > (e.g. storage mirroring, backup, and migration background tasks)
> > usually call the coroutine versions of the BlockBackend APIs instead
> > of the aio ones.
> >
> > qemu-io-cmds.c will want synchronous versions of the aio commands
> > (blk_zone_report(), blk_zone_mgmt_send(), blk_zone_append()) that
> > block until the command completes. This is because the qemu-io utility
> > typically executes one command at a time and it's written mostly in
> > blocking style rather than async callbacks or coroutines.
> > docs/devel/block-coroutine-wrapper.rst describes how to generate
> > synchronous versions of coroutine functions.
> >
> > Do you want to start implementing blk_get_zone_info()? This will
> > require blk_*(), bdrv_*(), and BlockDriver (block/file-posix.c)
> > functions.
>
> I want to implement the smallest part that can be tested first and
> then move on to the next part. And I want to test zone report
> operation first. Does the qemu io-test require the following part to
> work: bdrv_co_zone_report in file-pisix.c, blk_get_zone_info() in
> block-backend.c, blk_aio_zone_report() in io code path and modify some
> test in test/qemu-iotests? If it does, then yes.

blk_aio_zone_report() can be implemented later. It is not needed by qemu-io=
.

blk_get_zone_info() will be needed soon but maybe you can skip it
while working on the first version of blk_co_zone_report().

The steps are:
1. Add a .bdrv_co_zone_report() callback to BlockDriver and define a
BlockZoneDescriptor struct.
2. Implement the .bdrv_co_zone_report() callback in block/file-posix.c
using ioctl(BLKREPORTZONE).
3. Implement bdrv_co_zone_report() in block/io.c. It calls
bs->drv->bdrv_co_zone_report() or returns -ENOTSUP if
bs->drv->bdrv_co_zone_report is NULL.
4. Implement blk_co_zone_report() in block/block-backend.c. It calls
bdrv_co_zone_report(blk->root, ...).
5. Generate a synchronous blk_zone_report() wrapper. See
docs/devel/block-coroutine-wrapper.rst.

You now have a working zone report command. It will work with
--blockdev file,filename=3D/dev/nullb0,node-name=3Dblk0, which creates a
graph with just one block/file-posix.c BlockDriverState node. It won't
work with QEMU's older --drive
if=3Dnone,id=3Dblk0,format=3Draw,file=3D/dev/nullb0 syntax because that
creates a raw-format -> file-posix graph and you haven't implemented
.bdrv_co_zone_report() in block/raw-format.c yet (but you can skip it
for now).

For testing you can add a qemu-io -c zone_report command to
qemu-io-cmds.c that calls blk_zone_report(). Then you can write a
tests/qemu-iotests/tests/zoned test script that report zones using
qemu-io, writes to the first sectors of the disk using qemu-io, and
then reports zones again to prove that the output has changed. Use the
qemu-io --image-opts driver=3Dhost_device,filename=3D/dev/nullb0 option to
open a Linux null_blk device using the block/file-posix.c BlockDriver.

About qemu-iotests: the output from running the test case is diffed
against a reference file that contains the expected output. This is
quite convenient because you don't have to write code that checks for
the expected output, you just provide a
tests/qemu-iotests/tests/zoned.out file containing the output for a
passing test. There is documentation about qemu-iotests here:
https://qemu.readthedocs.io/en/latest/devel/testing.html#qemu-iotests

Stefan

