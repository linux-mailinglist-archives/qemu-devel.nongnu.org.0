Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD60430F3D7
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 14:28:13 +0100 (CET)
Received: from localhost ([::1]:33538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7eg8-0007ke-Lf
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 08:28:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l7edg-0006Uj-QH
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 08:25:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l7edd-0000tK-Pj
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 08:25:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612445137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=azQe6hOLa38WB+UF5Kpy5GyOWRYJPZ/9yzCXdJsIs5Q=;
 b=d0IVHLwjhcQs7DZW4jCpwB7JzDku4yfvRfU1CuSvl6N2YQyceYg73deIdBjRmsKq0GLXY1
 6QI2wluWHf8h8sIBN8GnmPgZP00eH7i4nOW4Hw9sMZ3hYb64cqGkMwJhoVw4xPy/UmDnoD
 CkkMBMRCsMwVOBo5kW6f1eYaSAG9R+c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-GNiw50AuN16b0KlytBDegw-1; Thu, 04 Feb 2021 08:25:33 -0500
X-MC-Unique: GNiw50AuN16b0KlytBDegw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5236BC73A0;
 Thu,  4 Feb 2021 13:25:32 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-162.ams2.redhat.com [10.36.112.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D786B5D6D7;
 Thu,  4 Feb 2021 13:25:30 +0000 (UTC)
Date: Thu, 4 Feb 2021 14:25:29 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 26/36] block/backup-top: drop .active
Message-ID: <20210204132529.GF6496@merkur.fritz.box>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-27-vsementsov@virtuozzo.com>
 <20210204122651.GE6496@merkur.fritz.box>
 <e29d97df-3a05-0164-09c3-c0336719c78f@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <e29d97df-3a05-0164-09c3-c0336719c78f@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-block@nongnu.org, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 04.02.2021 um 13:33 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 04.02.2021 15:26, Kevin Wolf wrote:
> > Am 27.11.2020 um 15:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > We don't need this workaround anymore: bdrv_append is already smart
> > > enough and we can use new bdrv_drop_filter().
> > > 
> > > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> > > ---
> > >   block/backup-top.c         | 38 +-------------------------------------
> > >   tests/qemu-iotests/283.out |  2 +-
> > >   2 files changed, 2 insertions(+), 38 deletions(-)
> > > 
> > > diff --git a/block/backup-top.c b/block/backup-top.c
> > > index 650ed6195c..84eb73aeb7 100644
> > > --- a/block/backup-top.c
> > > +++ b/block/backup-top.c
> > > @@ -37,7 +37,6 @@
> > >   typedef struct BDRVBackupTopState {
> > >       BlockCopyState *bcs;
> > >       BdrvChild *target;
> > > -    bool active;
> > >       int64_t cluster_size;
> > >   } BDRVBackupTopState;
> > > @@ -127,21 +126,6 @@ static void backup_top_child_perm(BlockDriverState *bs, BdrvChild *c,
> > >                                     uint64_t perm, uint64_t shared,
> > >                                     uint64_t *nperm, uint64_t *nshared)
> > >   {
> > > -    BDRVBackupTopState *s = bs->opaque;
> > > -
> > > -    if (!s->active) {
> > > -        /*
> > > -         * The filter node may be in process of bdrv_append(), which firstly do
> > > -         * bdrv_set_backing_hd() and then bdrv_replace_node(). This means that
> > > -         * we can't unshare BLK_PERM_WRITE during bdrv_append() operation. So,
> > > -         * let's require nothing during bdrv_append() and refresh permissions
> > > -         * after it (see bdrv_backup_top_append()).
> > > -         */
> > > -        *nperm = 0;
> > > -        *nshared = BLK_PERM_ALL;
> > > -        return;
> > > -    }
> > > -
> > >       if (!(role & BDRV_CHILD_FILTERED)) {
> > >           /*
> > >            * Target child
> > > @@ -229,18 +213,6 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
> > >       }
> > >       appended = true;
> > > -    /*
> > > -     * bdrv_append() finished successfully, now we can require permissions
> > > -     * we want.
> > > -     */
> > > -    state->active = true;
> > > -    bdrv_child_refresh_perms(top, top->backing, &local_err);
> > 
> > bdrv_append() uses bdrv_refresh_perms() for the whole node. Is it doing
> > unnecessary extra work there and should really do the same as backup-top
> > did here, i.e. bdrv_child_refresh_perms(bs_new->backing)?
> > 
> > (Really a comment for an earlier patch. This patch itself looks fine.)
> > 
> 
> You mean how backup-top code works at the point when we modified
> bdrv_append()? Actually all works, as we use state->active. We set it
> to true and should call refresh_perms. Now we drop _refresh_perms
> _together_ with state->active variable, so filter is always "active",
> but new bdrv_append can handle it now. I.e., before this patch
> backup-top.c code is correct but over-complicated with logic which is
> not necessary after bdrv_append() improvement (and of-course we need
> also bdrv_drop_filter() to drop the whole state->active related
> logic).

No, I just mean that bdrv_child_refresh_perms(bs, bs->backing) is enough
when adding a new image to the chain. A full bdrv_child_refresh_perms()
like we now have in bdrv_append() is doing more work than is necessary.

It doesn't make a difference for backup-top (because the filter has only
a single child), but if you append a new qcow2 snapshot, you would also
recalculate permissions for the bs->file subtree even though nothing has
changed there.

It's only a small detail anyway, not very important in a slow path.

Kevin


