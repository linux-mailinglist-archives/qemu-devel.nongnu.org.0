Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2EA30F326
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 13:30:07 +0100 (CET)
Received: from localhost ([::1]:54466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7dlp-0002r4-6z
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 07:30:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l7diy-0008Ul-9w
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 07:27:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l7diu-0000Lq-9a
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 07:27:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612441619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S9YBSS4SKC8dgrrm51/ZETXbrIXu/Ukckx0vBLxo3Z4=;
 b=COqA581o+bpu+M6NpDQgJNfmI9HWiwRBAKDsshdv/NU4tFZSxy3I7930dfFBvqoDVyR8wF
 mHFAT23QkVaru8fibvXhfn9lL93rbD7bcRdqXV3zKIJ69OMAT/nmmeqGgK45BbR+VHF0ML
 DylqShYc8oxoBcW/j+/Dsdyq6dD5GqY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-f4n81AlbO6qb2mpb-jfLkw-1; Thu, 04 Feb 2021 07:26:55 -0500
X-MC-Unique: f4n81AlbO6qb2mpb-jfLkw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88E0619611A3;
 Thu,  4 Feb 2021 12:26:54 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-162.ams2.redhat.com [10.36.112.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C680C100164C;
 Thu,  4 Feb 2021 12:26:52 +0000 (UTC)
Date: Thu, 4 Feb 2021 13:26:51 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 26/36] block/backup-top: drop .active
Message-ID: <20210204122651.GE6496@merkur.fritz.box>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-27-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201127144522.29991-27-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Am 27.11.2020 um 15:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
> We don't need this workaround anymore: bdrv_append is already smart
> enough and we can use new bdrv_drop_filter().
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/backup-top.c         | 38 +-------------------------------------
>  tests/qemu-iotests/283.out |  2 +-
>  2 files changed, 2 insertions(+), 38 deletions(-)
> 
> diff --git a/block/backup-top.c b/block/backup-top.c
> index 650ed6195c..84eb73aeb7 100644
> --- a/block/backup-top.c
> +++ b/block/backup-top.c
> @@ -37,7 +37,6 @@
>  typedef struct BDRVBackupTopState {
>      BlockCopyState *bcs;
>      BdrvChild *target;
> -    bool active;
>      int64_t cluster_size;
>  } BDRVBackupTopState;
>  
> @@ -127,21 +126,6 @@ static void backup_top_child_perm(BlockDriverState *bs, BdrvChild *c,
>                                    uint64_t perm, uint64_t shared,
>                                    uint64_t *nperm, uint64_t *nshared)
>  {
> -    BDRVBackupTopState *s = bs->opaque;
> -
> -    if (!s->active) {
> -        /*
> -         * The filter node may be in process of bdrv_append(), which firstly do
> -         * bdrv_set_backing_hd() and then bdrv_replace_node(). This means that
> -         * we can't unshare BLK_PERM_WRITE during bdrv_append() operation. So,
> -         * let's require nothing during bdrv_append() and refresh permissions
> -         * after it (see bdrv_backup_top_append()).
> -         */
> -        *nperm = 0;
> -        *nshared = BLK_PERM_ALL;
> -        return;
> -    }
> -
>      if (!(role & BDRV_CHILD_FILTERED)) {
>          /*
>           * Target child
> @@ -229,18 +213,6 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
>      }
>      appended = true;
>  
> -    /*
> -     * bdrv_append() finished successfully, now we can require permissions
> -     * we want.
> -     */
> -    state->active = true;
> -    bdrv_child_refresh_perms(top, top->backing, &local_err);

bdrv_append() uses bdrv_refresh_perms() for the whole node. Is it doing
unnecessary extra work there and should really do the same as backup-top
did here, i.e. bdrv_child_refresh_perms(bs_new->backing)?

(Really a comment for an earlier patch. This patch itself looks fine.)

Kevin


