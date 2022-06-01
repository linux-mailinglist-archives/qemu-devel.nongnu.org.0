Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F4453A44E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 13:47:43 +0200 (CEST)
Received: from localhost ([::1]:47268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwMpC-0002TF-O3
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 07:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nwMlC-0000GN-JP; Wed, 01 Jun 2022 07:43:35 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32]:41803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nwMlA-00057j-6G; Wed, 01 Jun 2022 07:43:34 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-f33f0f5b1dso2312086fac.8; 
 Wed, 01 Jun 2022 04:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dI6kBNFWRcfC3TULppf5a/3nzcqQk8tSkuvCpIXM/gw=;
 b=gpKsWeVtW+bTQKEQ6bABpghoGpYWnuUdOgsom0NuAWZRHcWrj4VvKF2WBG8bohXJiN
 hpfgB2tvi/BJAtGwp28OXukUzOE7LUMgWLh9xfEOqVPc1xqg/DV1M9BgoRAdQWu1DteG
 GmuzBPiBh+LAn2w/GpuK2dnNUSwcQVZZ2iwJkNHbAOp0qVcvhrN7kq1qOZ2kz/EPiUCy
 nDXupBFfz6ILXZt2MhgKE3O/9FsHNJxvBYPTfv6+In+Wf7fs4a4rAfm4neTYmIsc0KIS
 aSnk6mv7ghlKaszBlN2kGuWnrdrmqDB/AfFWYMZs0LR5l2FZW9cxWCFWwOZQiaY3Nh64
 03VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dI6kBNFWRcfC3TULppf5a/3nzcqQk8tSkuvCpIXM/gw=;
 b=mdDZ0/3bSLST6Fwq3dYBxMmZil54DDh9RrsR5SWwi3gl5Dq2d4jAWV3zOMBDZnpPGI
 VDj4Mr/RyTl4k1GidI73QRi2YpeFCrNhmo/G6Rk6ktyvym3IrqVm2OcmFIQGfgkMzJ8n
 emK1ReAd4oL5VoXhFk4tHGrufQzZDxVlxLLcvwod1bYhRif3CAm/VpcHf9Io+o1QvGjs
 /7FCFpiLo1xxN6DG2dZwBLnFICerH4AiLPE1rDCisdZkXee0f/0Wfmo8/sds+RMbG2vc
 pYwv3yFB3UBLzN8ypR5j63ZnirmgoAZcne6+ns9eQJTjiI25iiY27B+TfVbhIgrTr/2g
 WQdg==
X-Gm-Message-State: AOAM530/3MkbAqTjhuieEmcZTuvAkwzLzCG3VtI7G/GY4yJNe9fafI0d
 sd56hUu6aTgSADUffLAMns8SVTFOkkCXoBQnJaU=
X-Google-Smtp-Source: ABdhPJzq6gMHwbypWl5S0ZDP6fBpXHGPw9Nl6HUkS+cUvzISXr1Qd8P8fR/MKGI0PpDNvbiB7j0Zx5E/UH/+N63RPW0=
X-Received: by 2002:a05:6870:a792:b0:f3:1eca:5ba6 with SMTP id
 x18-20020a056870a79200b000f31eca5ba6mr9685929oao.212.1654083809644; Wed, 01
 Jun 2022 04:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAAAx-8+ECfznYPcJqPvP=7fzfgQobU1t+kGhGzWvArjm_Xs_yg@mail.gmail.com>
 <CAJSP0QURQOD79ixL2j__uBCuaJL19sytKpMr6QT2QY_+VnQPtg@mail.gmail.com>
 <CAAAx-8LsXQ=w7QTz0JHfGp6gbgY5najE0N7K0yBwhdqqH+E6Eg@mail.gmail.com>
 <be663d15-6db3-1777-0830-60dcc6aa394e@opensource.wdc.com>
In-Reply-To: <be663d15-6db3-1777-0830-60dcc6aa394e@opensource.wdc.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 1 Jun 2022 12:43:17 +0100
Message-ID: <CAJSP0QWLn5i9at7vhFdgOysZ0+voKFYRQqRquVaxh_EoZXRDRg@mail.gmail.com>
Subject: Re: Outreachy project task: Adding QEMU block layer APIs resembling
 Linux ZBD ioctls.
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Sam Li <faithilikerun@gmail.com>, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Hannes Reinecke <hare@suse.de>, qemu-devel <qemu-devel@nongnu.org>,
 qemu block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=stefanha@gmail.com; helo=mail-oa1-x32.google.com
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

On Wed, 1 Jun 2022 at 06:47, Damien Le Moal
<damien.lemoal@opensource.wdc.com> wrote:
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
> These need to be integrated into the generic block driver interface in
> include/block/block_int-common.h or include/block/block-common.h.

QEMU's block layer has a few ways of exposing information about block devic=
es:

    int (*bdrv_get_info)(BlockDriverState *bs, BlockDriverInfo *bdi);
    ImageInfoSpecific *(*bdrv_get_specific_info)(BlockDriverState *bs,
Error **errp);

These fetch information from the BlockDriver and are good when a small
amount of data is reported occassionally and consumed by the caller.

For data that is continuously accessed or that could be large, it may
be necessary for the data to reside inside BlockDriverState so that it
can be accessed in place (without copying):

    void (*bdrv_refresh_limits)(BlockDriverState *bs, Error **errp);

QEMU uses this for the BlockLimits struct (BlockDriverState::bl) that
is continuously accessed by the block layer while processing I/O
requests. The "refresh" function updates the data in case the
underlying storage device has changed somehow. If no update function
is necessary then data can simply be populated during .bdrv_open() and
no new BlockDriver callback needs to be added.

So in the simplest case BlockDriverState can be extended with a struct
zbd_dev field that is populated during .bdrv_open(). If the
BlockDriver doesn't support zones then the zbd_dev.nr_zones field is 0
or the model field indicates that this is not a zoned storage device.

However, a BlockBackend (not BlockDriverState!) API will be needed to
expose this data to users like the hw/block/virtio-blk.c emulation
code or the qemu-io-cmds.c utility that can be used for testing. A
BlockBackend has a root pointer to a BlockDriverState graph (for
example, qcow2 on top of file-posix). It will be necessary to
propagate zoned storage information from the leaf BlockDriverState all
the way up to the BlockBackend. In simple cases the BB root points
directly to the file-posix BDS that has Linux ZBD support but the
design needs to account for additional BDS graph nodes.

In order to make progress on this interface I suggest looking at the
virtio-blk spec extension for zoned storage and thinking what the
BlockBackend API should look like that hw/block/virtio-blk.c will use.
Then it may be easier to decide how to report zone information from
BlockDriverState.

Stefan

