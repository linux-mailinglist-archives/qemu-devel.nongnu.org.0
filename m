Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6929353A27B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 12:22:06 +0200 (CEST)
Received: from localhost ([::1]:40950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwLUK-0008Cg-Ug
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 06:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1nwLRy-0005wH-4b; Wed, 01 Jun 2022 06:19:39 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:34600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1nwLRj-0007ak-1q; Wed, 01 Jun 2022 06:19:37 -0400
Received: by mail-yb1-xb32.google.com with SMTP id p13so2083112ybm.1;
 Wed, 01 Jun 2022 03:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qMhV1GxbuMlUaxR0FkXkrQbbUKHhrQzcruSdoP5nf1w=;
 b=F5IShNi8HpTX5EaRFJ8KNxaTDBjIYQuo873ux/hB6wIlNDn8nLnRiEadtQRHUyEaIw
 TZnZVOgxN79d4r/0j9aw/ayzVyZJpzjGqPbVjx1oNbJDRdPnc+nZ8wMus1WcJA7Y7EJL
 7eOhgHoCCim7Nu+o1nvNxZUjWwyW6D5ZnbMYOgjftmEzwNt/tK2uL8bxaNar8gudbxeI
 Sjd4M8CMuOvKwGjtl7CD+jjqOkS9Kf7m1tGsDLUrNDT2FfnGnUJdcU4Ow1aAssgf4nPW
 7plozEnyagJcLRJDXsnCiBU2kOg3YiG4htz9vn8ivYi76Ukuyz6m4mBvrJb2wmnrC4gI
 fY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qMhV1GxbuMlUaxR0FkXkrQbbUKHhrQzcruSdoP5nf1w=;
 b=stWmtOEKJCIJQ29WOkS4uDca5wylFrV5ExiARaumJ+VqX2/Eoq1IjiQ3EugqFC4kJi
 YbmIyYiEH2gIap1pcX6GOMDVTv3MJd+sWaA20U7+RyNX3eI4c3UiMw9hTOXFVLa+ECFb
 GozaVGjZ5yBg7M3VS5H2xnYiR9cN0PLbemU3y5hSjboPrXpkk+e6ljfFk8BRGpI13vtc
 +IXZVKZTCw3ALJu9p/OvqD/wGlkS0Nb1D1DbOpbvBsIjWEhgNUmyPStV10G+3uBpyd2i
 pAaqFGUOQJfcr8JK984mBJniI6Z49GX7QMTu9LjzuPOpWARGXv3U3TBLKPIEov/szV5H
 vykA==
X-Gm-Message-State: AOAM532mAeJto96sl2eTmt/S6XhwP1pdVd86lfC51aEzPX7ivGBetb6f
 /e9q2uotrKMq7bRSSZkOOEg9oCOtKLl3MThDg0g=
X-Google-Smtp-Source: ABdhPJxbliZFFWswfBzhEmxvk1oRtxvkdX8G80+TMqM7vZYcLQQbltz7gZbnxF3R31wlzj8G2naEE1CmPGj32g2hOuE=
X-Received: by 2002:a25:2c02:0:b0:65d:354f:f8f3 with SMTP id
 s2-20020a252c02000000b0065d354ff8f3mr8596530ybs.102.1654078759821; Wed, 01
 Jun 2022 03:19:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAAAx-8+ECfznYPcJqPvP=7fzfgQobU1t+kGhGzWvArjm_Xs_yg@mail.gmail.com>
 <CAJSP0QURQOD79ixL2j__uBCuaJL19sytKpMr6QT2QY_+VnQPtg@mail.gmail.com>
 <CAAAx-8LsXQ=w7QTz0JHfGp6gbgY5najE0N7K0yBwhdqqH+E6Eg@mail.gmail.com>
 <be663d15-6db3-1777-0830-60dcc6aa394e@opensource.wdc.com>
In-Reply-To: <be663d15-6db3-1777-0830-60dcc6aa394e@opensource.wdc.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Wed, 1 Jun 2022 18:19:15 +0800
Message-ID: <CAAAx-8JxWYBN1Zk6Vk-WHTzYnGE6b_PXHsoVY=gnUcuikW7JCg@mail.gmail.com>
Subject: Re: Outreachy project task: Adding QEMU block layer APIs resembling
 Linux ZBD ioctls.
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, 
 Hannes Reinecke <hare@suse.de>, qemu-devel <qemu-devel@nongnu.org>,
 qemu block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=faithilikerun@gmail.com; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Hi Damien,

Damien Le Moal <damien.lemoal@opensource.wdc.com> =E4=BA=8E2022=E5=B9=B46=
=E6=9C=881=E6=97=A5=E5=91=A8=E4=B8=89 13:47=E5=86=99=E9=81=93=EF=BC=9A
>
> On 6/1/22 11:57, Sam Li wrote:
> > Hi Stefan,
> >
> > Stefan Hajnoczi <stefanha@gmail.com> =E4=BA=8E2022=E5=B9=B45=E6=9C=8830=
=E6=97=A5=E5=91=A8=E4=B8=80 19:19=E5=86=99=E9=81=93=EF=BC=9A
> >
> >
> >>
> >> On Mon, 30 May 2022 at 06:09, Sam Li <faithilikerun@gmail.com> wrote:
> >>>
> >>> Hi everyone,
> >>> I'm Sam Li, working on the Outreachy project which is to add zoned
> >>> device support to QEMU's virtio-blk emulation.
> >>>
> >>> For the first goal, adding QEMU block layer APIs resembling Linux ZBD
> >>> ioctls, I think the naive approach would be to introduce a new stable
> >>> struct zbd_zone descriptor for the library function interface. More
> >>> specifically, what I'd like to add to the BlockDriver struct are:
> >>> 1. zbd_info as zone block device information: includes numbers of
> >>> zones, size of logical blocks, and physical blocks.
> >>> 2. zbd_zone_type and zbd_zone_state
> >>> 3. zbd_dev_model: host-managed zbd, host-aware zbd
> >>> With those basic structs, we can start to implement new functions as
> >>> bdrv*() APIs for BLOCK*ZONE ioctls.
> >>>
> >>> I'll start to finish this task based on the above description. If
> >>> there is any problem or something I may miss in the design, please le=
t
> >>> me know.
> >>
> >> Hi Sam,
> >> Can you propose function prototypes for the new BlockDriver callbacks
> >> needed for zoned devices?
> >
> > I have made some modifications based on Damien's device in design part
> > 1 and added the function prototypes in design part 2. If there is any
> > problem or part I missed, please let me know.
> >
> > Design of Block Layer APIs in BlockDriver:
> > 1. introduce a new stable struct zbd_zone descriptor for the library
> > function interface.
> >   a. zbd_info as zone block device information: includes numbers of
> > zones, size of blocks, write granularity in byte(minimal write size
> > and alignment
> >     - write granularity: 512e SMRs: writes in units of physical block
> > size, 4096 bytes; NVMe ZNS write granularity is equal to the block
> > size.
> >     - zone descriptor: start, length, capacity, write pointer, zone typ=
e
> >   b. zbd_zone_type
> >     - zone type: conventional, sequential write required, sequential
> > write preferred
> >   c. zbd_dev_model: host-managed zbd, host-aware zbd
>
> This explanation is a little hard to understand. It seems to be mixing up
> device level information and per-zone information. I think it would be a
> lot simpler to write a struct definition to directly illustrate what you
> are planning.
>
> It is something like this ?
>
> struct zbd_zone {
>         enum zone_type  type;
>         enum zone_cond  cond;
>         uint64_t        start;
>         uint32_t        length;
>         uint32_t        cap;
>         uint64_t        wp;
> };
>
> strcut zbd_dev {
>         enum zone_model model;
>         uint32_t        block_size;
>         uint32_t        write_granularity;
>         uint32_t        nr_zones
>         struct zbd_zone *zones; /* array of zones */
> };
>

Yes! Sorry that I was not very clear in the descriptions.

> If yes, then my comments are as follows.
>
> For the device struct: It may be good to have also the maximum number of
> open zones and the maximum number of active zones.
>
> For the zone struct: You may need to add a read-write lock per zone to be
> able to write lock zones to ensure a sequential write pattern (virtio
> devices can be multi-queue and so writes may be coming in from different
> contexts) and to correctly emulate zone append operations with an atomic
> update of the wp field.
>

Yes, I haven't thought through the thread-safety problem but I'll come
up with an approach.

> These need to be integrated into the generic block driver interface in
> include/block/block_int-common.h or include/block/block-common.h.
>
> >
> >  2. implement new functions as bdrv*() APIs for BLK*ZONE ioctls
> >    a. support basic operations: get the APIs working when executing
> > the zone operations from a guest
> >     - zone information access: report
> >     - zone manipulation: reset,open,close,finish
>
> These operations are generally referred to as "zone management" operation=
s.
>
> >   b. support zone append operation: zone capacity, write pointer
> > positions of all zones(excluded for now)
> >     - can track the zone state we need: zone is full or not.
> >
> > More specifically, the function prototypes for 2a are as follows:
> >
> > int zbd_report_zones(int fd, off_t offset, off_t len, enum
> > zbd_report_opetion ro, struct zbd_zone *zones, unsigned int
> > *nr_zones);
>
> The current virtio zone specification draft does not have a reporting
> option field for the report zones command. However, it has a "partial"
> field that will need to be passed to this function so that the correct
> report zones reply can be built by the driver.
>
> > int zbd_reset_zones(int fd, off_t offset, off_t len);
> > int zbd_open_zones(int fd, off_t offset, off_t len);
> > int zbd_close_zones(int fd, off_t offset, off_t len);
> > int zbd_finish_zones(int fd, off_t offset, off_t len);
>
> These 4 functions have the exact same signature, modulo the function name=
.
> So we should simplify here to reduce the number of functions. Something l=
ike:
>
> int zbd_zone_mgmt(int fd, enum zone_op op, off_t offset, off_t len);
>
> where op can be BDRV_ZONE_RESET, BDRV_ZONE_OPEN, etc can aggregate all 4
> functions into one.
>

Thanks for the suggestions. It would be better to use one general
function supporting four operations rather than four.

> In any case, if you look at how block drivers are defined (an example is
> the one for raw files in qemu/block/file-posix.c) using the BlockDriver
> data type (defined as a struct in qemu/include/block/block_int-common.h),
> you will see that the driver callback functions do not use a file
> descriptor (fd) but a pointer to some data structure (most of the time a
> BlockDriverState pointer).
>

Yes, I'll use it instead.

Meanwhile, the BlockDriver callbacks can be(with Damien's suggestion):
-> virtio_blk_handle_zone_mngmt() -> blk_aio_zone_mngmt() ->
blk_aio_prwv() + blk_aio_zone_mngmt_entry() -> bdrv_co_do_zone_mngmt() ->
bdrv_co_zone_mngmt().

I am still on the way to understand the BlockDriver structures. So the
above may need a second thought.


> Another thing: you will need one more callback to get the device
> information related to zones: maximum number of open and active zones at
> least (the number of zones can be discovered with a report zones call).
>

Is this callback zbd_get_sysfs_attrr(char *devname, const char *attr,
char *str, int str_len) in libzbd?

Thanks for reviewing! Have a good night.

Sam

> Cheers.
>
> --
> Damien Le Moal
> Western Digital Research

