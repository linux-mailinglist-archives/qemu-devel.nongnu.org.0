Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6005582961
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 17:15:00 +0200 (CEST)
Received: from localhost ([::1]:40686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGikU-00076U-Jw
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 11:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oGiiX-0005N3-3N; Wed, 27 Jul 2022 11:12:57 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:33366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oGiiV-0002uP-9A; Wed, 27 Jul 2022 11:12:56 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-31e47ac84daso179121027b3.0; 
 Wed, 27 Jul 2022 08:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zhxx4XYQDevCJkvyDr9JihiN2Si0Tcoyojs+FRGqYK0=;
 b=BEV7nPiS385e2cGpqs9YT68wox/9tGig3/22RfLMi1jZ2MHQFugYzoHAsC1oKZMNn/
 na3odJ3xFXtT1dg6gpyN/hoJIe/cihRfBqDCLB0urWMopkgKMfrbzBet6VbeSYKdAWHN
 a0FN0eLX8Wlj2PDLGKJI5dkLe3dxkNW1Tp9TzcG5p6u2Rb54AmCbZWiXfPUWavg0W0cn
 ZueU5+qXJpqhBITTkXazQ4ZtYMkD8PEkRluzZ+HFGDv5N9/U210DWqLduEIJj0CBGZPt
 6cNVWJ18+yxsSQ0rQj1qxImGA4mvYsmeAWiuBvhF9nX+n3njG+oFhTqEVTIM1DfkzigN
 SWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zhxx4XYQDevCJkvyDr9JihiN2Si0Tcoyojs+FRGqYK0=;
 b=i+qKpRnBeFKh2BrB3pPvmxx5yXVFsmqg+qs5j7j2ZtKOvWcZ4GQ+3ITeWkFi+pnKOp
 Ji/joYmD4VzfbjA2LQ3xCO0/S4bphiV2WY4ymosxw1pnKcKnsiPmAksVWIM9ytBvZPKz
 +9qGZvJWz1s8dMKqWC3XtnTuqLSS5z0hpS0vFbgyMgoQlbk0Y82SL8g1gbx4WdFY72l4
 Em1nDzj2z1fiic2GMtrX05+tU0zQr7d8vN91VAcrrqGkEGhsIjhRE8iV/kfIAx9dm3Nm
 L5hpApaP2BbBUTN40+L+nCmBmGqs2cVjeHjIZmwtsxv9cg01HLHym7FfOncqUmKD6iWv
 0Lbg==
X-Gm-Message-State: AJIora8LMpuUmYjizLbBmCdSkVtHObWdaE5pvQoTwUFTTgwgXXypaM/c
 U/VIk4dLubz8hSm8MjBc3YhPKHXZ31hyTl+NP7s=
X-Google-Smtp-Source: AGRyM1vY7vixxIjux1ajU21v0SEn1+DYvFcoJmvX8HXR87rmAgGsAAYI/pJ2Od+b/W2NIY23L6yrE04Eor7nA6/3HO4=
X-Received: by 2002:a81:65c1:0:b0:31e:469f:8f46 with SMTP id
 z184-20020a8165c1000000b0031e469f8f46mr19383878ywb.111.1658934774013; Wed, 27
 Jul 2022 08:12:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220712021345.8530-1-faithilikerun@gmail.com>
 <20220712021345.8530-6-faithilikerun@gmail.com>
 <CAJSP0QVd0_njYR5ZT0VjGt=CgN8dZnXVZdjmh8uUhj3uO=DwUw@mail.gmail.com>
 <YuFS3vfQi3OPTKi0@T590>
In-Reply-To: <YuFS3vfQi3OPTKi0@T590>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 27 Jul 2022 11:12:42 -0400
Message-ID: <CAJSP0QW-wr0BF_vd1CWfMQusNWKgrkAP4H3Y7GPR2KcSU+FWDQ@mail.gmail.com>
Subject: Re: [RFC v4 5/9] qemu-iotests: test new zone operations.
To: Ming Lei <ming.lei@redhat.com>
Cc: Sam Li <faithilikerun@gmail.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Markus Armbruster <armbru@redhat.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, qemu block <qemu-block@nongnu.org>, 
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, 
 Hannes Reinecke <hare@suse.de>, Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112f.google.com
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

On Wed, 27 Jul 2022 at 11:00, Ming Lei <ming.lei@redhat.com> wrote:
>
> On Wed, Jul 27, 2022 at 10:34:56AM -0400, Stefan Hajnoczi wrote:
> > On Mon, 11 Jul 2022 at 22:21, Sam Li <faithilikerun@gmail.com> wrote:
> > >
> > > We have added new block layer APIs of zoned block devices. Test it with:
> > > (1) Create a null_blk device, run each zone operation on it and see
> > > whether reporting right zone information.
> > >
> > > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > > ---
> > >  tests/qemu-iotests/tests/zoned.sh | 69 +++++++++++++++++++++++++++++++
> > >  1 file changed, 69 insertions(+)
> > >  create mode 100755 tests/qemu-iotests/tests/zoned.sh
> > >
> > > diff --git a/tests/qemu-iotests/tests/zoned.sh b/tests/qemu-iotests/tests/zoned.sh
> > > new file mode 100755
> > > index 0000000000..e14a3a420e
> > > --- /dev/null
> > > +++ b/tests/qemu-iotests/tests/zoned.sh
> > > @@ -0,0 +1,69 @@
> > > +#!/usr/bin/env bash
> > > +#
> > > +# Test zone management operations.
> > > +#
> > > +
> > > +seq="$(basename $0)"
> > > +echo "QA output created by $seq"
> > > +status=1 # failure is the default!
> > > +
> > > +_cleanup()
> > > +{
> > > +  _cleanup_test_img
> > > +  sudo rmmod null_blk
> > > +}
> > > +trap "_cleanup; exit \$status" 0 1 2 3 15
> > > +
> > > +# get standard environment, filters and checks
> > > +. ./common.rc
> > > +. ./common.filter
> > > +. ./common.qemu
> > > +
> > > +# This test only runs on Linux hosts with raw image files.
> > > +_supported_fmt raw
> > > +_supported_proto file
> > > +_supported_os Linux
> > > +
> > > +QEMU_IO="build/qemu-io"
> > > +IMG="--image-opts driver=zoned_host_device,filename=/dev/nullb0"
> > > +QEMU_IO_OPTIONS=$QEMU_IO_OPTIONS_NO_FMT
> > > +
> > > +echo "Testing a null_blk device"
> > > +echo "Simple cases: if the operations work"
> > > +sudo modprobe null_blk nr_devices=1 zoned=1
> >
> > Jens & Ming Lei:
> >
> > null_blk is not ideal for automated test cases because it requires
> > root and is global. If two tests are run at the same time they will
> > interfere with each other. There is no way to have independent
> > instances of the null_blk kernel module and the /dev/nullb0 device on
> > a single Linux system. I think this test case can be merged for now
> > but if there's time I suggest investigating alternatives.
> >
> > Maybe the new Linux ublk_drv driver is a better choice if it supports
> > unprivileged operation with multiple independent block devices (plus
>
> This can be one big topic, and IMO, the io path needs to be reviewed
> wrt. security risk. Also if one block device is stuck, it shouldn't
> affect others, so far it can be one problem at least in sync/writeback,
> if one device is hang, writeback on all block device may not move on.
>
> > zoned storage!). It would be necessary to write a userspace null block
> > device that supports zoned storage if that doesn't exist already. I
> > have CCed Ming Lei and Jens Axboe for thoughts.
>
> IMO, it shouldn't be hard to simulate zoned from userspace, the
> patches[1] for setting device parameters are just sent out, then zoned
> parameter could be sent to driver with the added commands easily.
>
> Even ublk can be used to implement zoned target, such as, ublk is
> exposed as one normal disk, but the backing disk could be one real
> zoned/zns device.
>
> [1] https://lore.kernel.org/linux-block/20220727141628.985429-1-ming.lei@redhat.com/T/#mb5518cf418b63fb6ca649f0df199137e50907a29

Thanks for replying!

For QEMU testing purposes a null block driver with zone emulation is
ideal. It does not need to persist data or zone metadata. It shouldn't
require a backing device so that testing can be performed even without
real zoned storage devices.

It should also be possible to extend Linux null_blk to make it more
friendly for parallel tests that are run without knowledge of each
other/cooperation. But I was thinking ublk may have that
infrastructure already.

Stefan

