Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ACD2114D
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 02:33:39 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38887 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRQoc-0001Ik-Mc
	for lists+qemu-devel@lfdr.de; Thu, 16 May 2019 20:33:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51906)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1hRQnS-0000xi-Ay
	for qemu-devel@nongnu.org; Thu, 16 May 2019 20:32:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1hRQnR-0002ef-10
	for qemu-devel@nongnu.org; Thu, 16 May 2019 20:32:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56284)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1hRQnL-0002U1-71; Thu, 16 May 2019 20:32:20 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 16A633082E09;
	Fri, 17 May 2019 00:32:18 +0000 (UTC)
Received: from [10.18.17.215] (dhcp-17-215.bos.redhat.com [10.18.17.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 724525D9CD;
	Fri, 17 May 2019 00:32:16 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20190516122725.132334-1-vsementsov@virtuozzo.com>
	<20190516122725.132334-2-vsementsov@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jsnow@redhat.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <04af0995-a4ef-d9cc-b4ca-1a5e837aafe1@redhat.com>
Date: Thu, 16 May 2019 20:32:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190516122725.132334-2-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 17 May 2019 00:32:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/2] qapi: support external bitmaps in
 block-dirty-bitmap-merge
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, fam@euphon.net, den@virtuozzo.com, armbru@redhat.com,
	mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 5/16/19 8:27 AM, Vladimir Sementsov-Ogievskiy wrote:
> Add new optional parameter making possible to merge bitmaps from
> different nodes. It is needed to maintain external snapshots during
> incremental backup chain history.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  qapi/block-core.json | 13 ++++++++++---
>  block/dirty-bitmap.c |  9 ++++++---
>  blockdev.c           | 46 ++++++++++++++++++++++++++++++--------------
>  3 files changed, 48 insertions(+), 20 deletions(-)
> 
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 7ccbfff9d0..933b50771a 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -2006,16 +2006,23 @@
>  ##
>  # @BlockDirtyBitmapMerge:
>  #
> -# @node: name of device/node which the bitmap is tracking
> +# @node: name of device/node which the @target and @bitmaps bitmaps are
> +#        tracking
>  #
>  # @target: name of the destination dirty bitmap
>  #
> -# @bitmaps: name(s) of the source dirty bitmap(s)
> +# @bitmaps: name(s) of the source dirty bitmap(s). The field is optional
> +#           since 4.1.
> +#
> +# @external-bitmaps: additional list of source dirty bitmaps with specified
> +#                    nodes, which allows merging bitmaps between different
> +#                    nodes. (Since: 4.1)
>  #
>  # Since: 4.0
>  ##
>  { 'struct': 'BlockDirtyBitmapMerge',
> -  'data': { 'node': 'str', 'target': 'str', 'bitmaps': ['str'] } }
> +  'data': { 'node': 'str', 'target': 'str', '*bitmaps': ['str'],
> +            '*external-bitmaps': ['BlockDirtyBitmap'] } }
>  

I guess you can specify one, or both, or maybe neither! Seems fine.

>  ##
>  # @block-dirty-bitmap-add:
> diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
> index 59e6ebb861..49646a30e6 100644
> --- a/block/dirty-bitmap.c
> +++ b/block/dirty-bitmap.c
> @@ -816,10 +816,10 @@ void bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
>  {
>      bool ret;
>  
> -    /* only bitmaps from one bds are supported */
> -    assert(dest->mutex == src->mutex);
> -
>      qemu_mutex_lock(dest->mutex);
> +    if (src->mutex != dest->mutex) {
> +        qemu_mutex_lock(src->mutex);
> +    }
>  
>      if (bdrv_dirty_bitmap_check(dest, BDRV_BITMAP_DEFAULT, errp)) {
>          goto out;
> @@ -845,4 +845,7 @@ void bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
>  
>  out:
>      qemu_mutex_unlock(dest->mutex);
> +    if (src->mutex != dest->mutex) {
> +        qemu_mutex_unlock(src->mutex);
> +    }
>  }
> diff --git a/blockdev.c b/blockdev.c
> index 79fbac8450..8d37ce5943 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -2112,11 +2112,9 @@ static void block_dirty_bitmap_disable_abort(BlkActionState *common)
>      }
>  }
>  
> -static BdrvDirtyBitmap *do_block_dirty_bitmap_merge(const char *node,
> -                                                    const char *target,
> -                                                    strList *bitmaps,
> -                                                    HBitmap **backup,
> -                                                    Error **errp);
> +static BdrvDirtyBitmap *do_block_dirty_bitmap_merge(
> +        const char *node, const char *target, strList *bitmaps,
> +        BlockDirtyBitmapList *external_bitmaps, HBitmap **backup, Error **errp);
>  

You know, that's actually a much smarter way to reflow these ...

>  static void block_dirty_bitmap_merge_prepare(BlkActionState *common,
>                                               Error **errp)
> @@ -2132,8 +2130,9 @@ static void block_dirty_bitmap_merge_prepare(BlkActionState *common,
>      action = common->action->u.block_dirty_bitmap_merge.data;
>  
>      state->bitmap = do_block_dirty_bitmap_merge(action->node, action->target,
> -                                                action->bitmaps, &state->backup,
> -                                                errp);
> +                                                action->bitmaps,
> +                                                action->external_bitmaps,
> +                                                &state->backup, errp);
>  }
>  
>  static void abort_prepare(BlkActionState *common, Error **errp)
> @@ -2965,15 +2964,14 @@ void qmp_block_dirty_bitmap_disable(const char *node, const char *name,
>      bdrv_disable_dirty_bitmap(bitmap);
>  }
>  
> -static BdrvDirtyBitmap *do_block_dirty_bitmap_merge(const char *node,
> -                                                    const char *target,
> -                                                    strList *bitmaps,
> -                                                    HBitmap **backup,
> -                                                    Error **errp)
> +static BdrvDirtyBitmap *do_block_dirty_bitmap_merge(
> +        const char *node, const char *target, strList *bitmaps,
> +        BlockDirtyBitmapList *external_bitmaps, HBitmap **backup, Error **errp)
>  {
>      BlockDriverState *bs;
>      BdrvDirtyBitmap *dst, *src, *anon;
>      strList *lst;
> +    BlockDirtyBitmapList *ext_lst;
>      Error *local_err = NULL;
>  
>      dst = block_dirty_bitmap_lookup(node, target, &bs, errp);
> @@ -3003,6 +3001,22 @@ static BdrvDirtyBitmap *do_block_dirty_bitmap_merge(const char *node,
>          }
>      }
>  
> +    for (ext_lst = external_bitmaps; ext_lst; ext_lst = ext_lst->next) {
> +        src = block_dirty_bitmap_lookup(ext_lst->value->node,
> +                                        ext_lst->value->name, NULL, errp);
> +        if (!src) {
> +            dst = NULL;
> +            goto out;
> +        }
> +
> +        bdrv_merge_dirty_bitmap(anon, src, NULL, &local_err);
> +        if (local_err) {
> +            error_propagate(errp, local_err);
> +            dst = NULL;
> +            goto out;
> +        }
> +    }
> +
>      /* Merge into dst; dst is unchanged on failure. */
>      bdrv_merge_dirty_bitmap(dst, anon, backup, errp);
>  
> @@ -3012,9 +3026,13 @@ static BdrvDirtyBitmap *do_block_dirty_bitmap_merge(const char *node,
>  }
>  
>  void qmp_block_dirty_bitmap_merge(const char *node, const char *target,
> -                                  strList *bitmaps, Error **errp)
> +                                  bool has_bitmaps, strList *bitmaps,
> +                                  bool has_external_bitmaps,
> +                                  BlockDirtyBitmapList *external_bitmaps,
> +                                  Error **errp)
>  {
> -    do_block_dirty_bitmap_merge(node, target, bitmaps, NULL, errp);
> +    do_block_dirty_bitmap_merge(node, target, bitmaps, external_bitmaps, NULL,
> +                                errp);
>  }
>  
>  BlockDirtyBitmapSha256 *qmp_x_debug_block_dirty_bitmap_sha256(const char *node,
> 

I don't think I like the name "external-bitmaps" but I guess I don't
really have a better suggestion. Technically you can use this for
node-local source bitmaps too, it's just that it's a more verbose way to
specify them. (They're like "fully-qualified" bitmap identifiers instead
of the local/relative references we've been using.)

Well, I can't hold you up if I have no better ideas.

Reviewed-by: John Snow <jsnow@redhat.com>

