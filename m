Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73631411205
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 11:43:38 +0200 (CEST)
Received: from localhost ([::1]:49336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSFpp-0004P7-9n
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 05:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mSFoQ-0003aS-QD
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 05:42:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mSFoM-0006AP-HB
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 05:42:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632130925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k+efZvytsEN9YF1eiVRTz6eRLD8aSUG82G5a8nPZm+A=;
 b=jTaHGxc8NDGDqY6dk8tfWVM/LyBKgtTXzPEigu2RB2L1l8w7aOABEI/hA1genWbFVqQT7p
 wd1gSuZBKmjQapppRbA7e6QhS4xEt0asLWPBTpDB8UfSy/fLNurwtse5JTRWqX0Y0EeJWo
 h04QyCS2gSynV5ezVMtQtnCCo33P2e0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-4cU2cdL3M6WIeSutUVKGqg-1; Mon, 20 Sep 2021 05:42:02 -0400
X-MC-Unique: 4cU2cdL3M6WIeSutUVKGqg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07D91802928;
 Mon, 20 Sep 2021 09:42:01 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1585566FFF;
 Mon, 20 Sep 2021 09:41:59 +0000 (UTC)
Date: Mon, 20 Sep 2021 11:41:58 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PULL 41/56] block/copy-before-write: make public block driver
Message-ID: <YUhXZsbPxQyH2rpQ@redhat.com>
References: <20210901151619.689075-1-hreitz@redhat.com>
 <20210901151619.689075-42-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210901151619.689075-42-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.476,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: vsementsov@virtuozzo.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 01.09.2021 um 17:16 hat Hanna Reitz geschrieben:
> From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
> Finally, copy-before-write gets own .bdrv_open and .bdrv_close
> handlers, block_init() call and becomes available through bdrv_open().
> 
> To achieve this:
> 
>  - cbw_init gets unused flags argument and becomes cbw_open
>  - block_copy_state_free() call moved to new cbw_close()
>  - in bdrv_cbw_append:
>    - options are completed with driver and node-name, and we can simply
>      use bdrv_insert_node() to do both open and drained replacing
>  - in bdrv_cbw_drop:
>    - cbw_close() is now responsible for freeing s->bcs, so don't do it
>      here
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> Message-Id: <20210824083856.17408-22-vsementsov@virtuozzo.com>
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>

This patch results in a change in behaviour that I assume was not
intentional: Previously, creating a backup block job would succeed to
insert the filter node independently of whether the filter driver was
whitelisted or not. After this patch, it becomes an error if the filter
driver isn't explicitly whitelisted:

https://bugzilla.redhat.com/show_bug.cgi?id=2004812

>  block/copy-before-write.c | 60 ++++++++++++++++++---------------------
>  1 file changed, 28 insertions(+), 32 deletions(-)
> 
> diff --git a/block/copy-before-write.c b/block/copy-before-write.c
> index 2efe098aae..2cd68b480a 100644
> --- a/block/copy-before-write.c
> +++ b/block/copy-before-write.c
> @@ -144,7 +144,8 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
>      }
>  }
>  
> -static int cbw_init(BlockDriverState *bs, QDict *options, Error **errp)
> +static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
> +                    Error **errp)
>  {
>      BDRVCopyBeforeWriteState *s = bs->opaque;
>      BdrvDirtyBitmap *copy_bitmap;
> @@ -181,10 +182,21 @@ static int cbw_init(BlockDriverState *bs, QDict *options, Error **errp)
>      return 0;
>  }
>  
> +static void cbw_close(BlockDriverState *bs)
> +{
> +    BDRVCopyBeforeWriteState *s = bs->opaque;
> +
> +    block_copy_state_free(s->bcs);
> +    s->bcs = NULL;
> +}
> +
>  BlockDriver bdrv_cbw_filter = {
>      .format_name = "copy-before-write",
>      .instance_size = sizeof(BDRVCopyBeforeWriteState),
>  
> +    .bdrv_open                  = cbw_open,
> +    .bdrv_close                 = cbw_close,
> +
>      .bdrv_co_preadv             = cbw_co_preadv,
>      .bdrv_co_pwritev            = cbw_co_pwritev,
>      .bdrv_co_pwrite_zeroes      = cbw_co_pwrite_zeroes,
> @@ -205,56 +217,40 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
>                                    Error **errp)
>  {
>      ERRP_GUARD();
> -    int ret;
>      BDRVCopyBeforeWriteState *state;
>      BlockDriverState *top;
>      QDict *opts;
>  
>      assert(source->total_sectors == target->total_sectors);
>  
> -    top = bdrv_new_open_driver(&bdrv_cbw_filter, filter_node_name,
> -                               BDRV_O_RDWR, errp);

bdrv_new_open_driver() is a relatively short and straightforward code
path that just directly opens a driver for internal use.

> -    if (!top) {
> -        error_prepend(errp, "Cannot open driver: ");
> -        return NULL;
> -    }
> -    state = top->opaque;
> -
>      opts = qdict_new();
> +    qdict_put_str(opts, "driver", "copy-before-write");
> +    if (filter_node_name) {
> +        qdict_put_str(opts, "node-name", filter_node_name);
> +    }
>      qdict_put_str(opts, "file", bdrv_get_node_name(source));
>      qdict_put_str(opts, "target", bdrv_get_node_name(target));
>  
> -    ret = cbw_init(top, opts, errp);
> -    qobject_unref(opts);
> -    if (ret < 0) {
> -        goto fail;
> -    }
> -
> -    bdrv_drained_begin(source);
> -    ret = bdrv_replace_node(source, top, errp);
> -    bdrv_drained_end(source);
> -    if (ret < 0) {
> -        error_prepend(errp, "Cannot append copy-before-write filter: ");
> -        goto fail;
> +    top = bdrv_insert_node(source, opts, BDRV_O_RDWR, errp);

On the other hand, bdrv_insert_node() uses bdrv_open() internally, which
is a really long and messy code path that basically has to handle all of
the craziness that compatibility code for -drive needs to have.

Do we really need bdrv_open() here?

Or is all you really need just a version of bdrv_new_open_driver() that
accepts an options QDict instead of just flags?

Kevin


