Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC89AB7AB4
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 15:44:00 +0200 (CEST)
Received: from localhost ([::1]:44282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAwj1-0006Tn-JJ
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 09:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43244)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iAw2o-0000RM-JG
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 09:00:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iAw2m-0006eC-I0
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 09:00:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41550)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iAw2l-0006dW-Ra
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 09:00:20 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EBA1630833BE;
 Thu, 19 Sep 2019 13:00:18 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.36.116.255])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 41E005C1D4;
 Thu, 19 Sep 2019 13:00:07 +0000 (UTC)
Date: Thu, 19 Sep 2019 15:00:05 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Pavel Dovgalyuk <dovgaluk@ispras.ru>
Message-ID: <20190919130005.GF10163@localhost.localdomain>
References: <20190918091831.GD5207@localhost.localdomain>
 <001201d56e02$9d88b5f0$d89a21d0$@ru>
 <20190918093305.GF5207@localhost.localdomain>
 <001401d56e04$b93c02a0$2bb407e0$@ru>
 <20190918094436.GG5207@localhost.localdomain>
 <001501d56e06$bbd7aa30$3386fe90$@ru>
 <20190919085302.GA10163@localhost.localdomain>
 <001901d56ec9$620ae260$2620a720$@ru>
 <20190919112702.GC10163@localhost.localdomain>
 <001a01d56ee3$4354a530$c9fdef90$@ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <001a01d56ee3$4354a530$c9fdef90$@ru>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 19 Sep 2019 13:00:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [for-4.2 PATCH 3/6] replay: update docs for
 record/replay with block devices
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
Cc: peter.maydell@linaro.org, pavel.dovgaluk@ispras.ru, quintela@redhat.com,
 ciro.santilli@gmail.com, jasowang@redhat.com, crosthwaite.peter@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, alex.bennee@linaro.org,
 maria.klimushenkova@ispras.ru, mst@redhat.com, kraxel@redhat.com,
 boost.lists@gmail.com, thomas.dullien@googlemail.com, pbonzini@redhat.com,
 mreitz@redhat.com, artem.k.pisarenko@gmail.com, dgilbert@redhat.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 19.09.2019 um 14:10 hat Pavel Dovgalyuk geschrieben:
> > From: Kevin Wolf [mailto:kwolf@redhat.com]
> > Am 19.09.2019 um 11:05 hat Pavel Dovgalyuk geschrieben:
> > > > From: Kevin Wolf [mailto:kwolf@redhat.com]
> > > > > >
> > > > > > However, global -snapshot is just a convenient shortcut for specifying
> > > > > > snapshot=on for all -drive arguments. So if -snapshot is incompatible
> > > > > > with replay, shouldn't manually marking all drives as snapshot=on be
> > > > > > incompatible as well?
> > > > > >
> > > > > > Maybe you're really interested in some specific drive not having
> > > > > > snapshot=on? But then it might be better to check that specific drive
> > > > > > instad of forbidding just the shortcut for setting it.
> > > > >
> > > > > -snapshot adds the flag for top-level drive, making driver operations
> > > > > dependent on temporary file structure.
> > > > >
> > > > > Moving this overlay beneath blkreplay driver makes drive operations
> > > > > deterministic for the top-level device.
> > > >
> > > > So the real requirement is that blkreplay is the top-level node of any
> > > > guest device, right? And only because of this, you can't use -snapshot
> > > > (or snapshot=on on the blkreplay driver).
> > > >
> > > > If we instead check e.g. in blk_insert_bs() or blk_attach_dev() that in
> > > > record/replay mode, the root node of the BlockBackend is blkreplay,
> > > > wouldn't we catch many more incorrect setups?
> > >
> > > That sounds interesting.
> > > Will it help to check that every backend is connected to blkreplay?
> > 
> > Yes, it would return an error when you try to attach a non-blkreplay
> > node to a BlockBackend (and every guest device uses a BlockBackend).
> > 
> > Note that this restriction would currently make block jobs unavailable
> > on non-blkreplay nodes as they also use BlockBackends internally (though
> > this is going to change in the long run). I believe this restriction is
> > harmless and the typical replay use case doesn't involve any block jobs,
> > but if you do think it's a problem, blk_attach_dev() would be the place
> > that affects only devices.
> > 
> > > How then this check has to be done?
> > 
> > Only compile-tested, but maybe something like below?
> > 
> > Kevin
> > 
> > diff --git a/include/block/block_int.h b/include/block/block_int.h
> > index 0422acdf1c..9fa72bea51 100644
> > --- a/include/block/block_int.h
> > +++ b/include/block/block_int.h
> > @@ -955,6 +955,7 @@ static inline BlockDriverState *backing_bs(BlockDriverState *bs)
> >  extern BlockDriver bdrv_file;
> >  extern BlockDriver bdrv_raw;
> >  extern BlockDriver bdrv_qcow2;
> > +extern BlockDriver bdrv_blkreplay;
> > 
> >  int coroutine_fn bdrv_co_preadv(BdrvChild *child,
> >      int64_t offset, unsigned int bytes, QEMUIOVector *qiov,
> > diff --git a/block/blkreplay.c b/block/blkreplay.c
> > index 2b7931b940..16a4f1df6a 100644
> > --- a/block/blkreplay.c
> > +++ b/block/blkreplay.c
> > @@ -126,7 +126,7 @@ static int coroutine_fn blkreplay_co_flush(BlockDriverState *bs)
> >      return ret;
> >  }
> > 
> > -static BlockDriver bdrv_blkreplay = {
> > +BlockDriver bdrv_blkreplay = {
> >      .format_name            = "blkreplay",
> >      .instance_size          = 0,
> > 
> > diff --git a/block/block-backend.c b/block/block-backend.c
> > index 1c605d5444..c57d3d9fdf 100644
> > --- a/block/block-backend.c
> > +++ b/block/block-backend.c
> > @@ -17,6 +17,7 @@
> >  #include "block/throttle-groups.h"
> >  #include "hw/qdev-core.h"
> >  #include "sysemu/blockdev.h"
> > +#include "sysemu/replay.h"
> >  #include "sysemu/runstate.h"
> >  #include "qapi/error.h"
> >  #include "qapi/qapi-events-block.h"
> > @@ -808,6 +809,12 @@ void blk_remove_bs(BlockBackend *blk)
> >  int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp)
> >  {
> >      ThrottleGroupMember *tgm = &blk->public.throttle_group_member;
> > +
> > +    if (replay_mode != REPLAY_MODE_NONE && bs->drv != &bdrv_blkreplay) {
> > +        error_setg(errp, "Root node must be blkreplay");
> > +        return -ENOTSUP;
> > +    }
> 
> I guess this is opposite direction - bs->drv is bdrv_file.
> And we should check its parent.

If bs->drv is bdrv_file, you want this to fail because only
bdrv_blkreplay should be able to be attached to devices.

bs doesn't have any parents here in the common case, it's the root node
of the BlockBackend.

Kevin

