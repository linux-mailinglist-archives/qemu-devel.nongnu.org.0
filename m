Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0614C521EDB
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 17:33:15 +0200 (CEST)
Received: from localhost ([::1]:56756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noRrN-0007nI-Mo
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 11:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1noRoX-0006ap-4Q
 for qemu-devel@nongnu.org; Tue, 10 May 2022 11:30:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1noRoT-0006t7-7q
 for qemu-devel@nongnu.org; Tue, 10 May 2022 11:30:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652196609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=unM6Evi8itGWgzYuVgM2Xp0J/liG9tJC/9F0r4SRRzs=;
 b=Awcft6RLgqlFKI/lQcQ86yXjQpvyhoD7fwkU2gaKyLnsPXpUIV+OjaU31iqfPlG7xsT/sn
 nBlFt8dPQ8KV4lnjK4SKllrSEQKn6SYD/ECyLmUsHyCAIaPIVVKsvA7zheCPpRhAPicG68
 f3rs+056YQoF1fUGe5l8Vi3nHRmbwOs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-j65cqOVoOsGA2dBn1oHU-Q-1; Tue, 10 May 2022 11:30:08 -0400
X-MC-Unique: j65cqOVoOsGA2dBn1oHU-Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4EE818019CD
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 15:30:07 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60C5040D0161;
 Tue, 10 May 2022 15:30:07 +0000 (UTC)
Date: Tue, 10 May 2022 10:30:05 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 05/26] blkdebug: add missing coroutine_fn annotations
Message-ID: <20220510153005.g62rsutcwygvkwgg@redhat.com>
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-6-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509103019.215041-6-pbonzini@redhat.com>
User-Agent: NeoMutt/20220429-35-ca2e7f
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, May 09, 2022 at 12:29:58PM +0200, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Sparse commit message; from the followup email, this sentence would be helpful:

| The only rule is that callers of coroutine_fn must be coroutine_fn themselves,
| or the call must be within "if (qemu_in_coroutine())".

> ---
>  block/blkdebug.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/block/blkdebug.c b/block/blkdebug.c
> index bbf2948703..a93ba61487 100644
> --- a/block/blkdebug.c
> +++ b/block/blkdebug.c
> @@ -587,8 +587,8 @@ out:
>      return ret;
>  }
>  
> -static int rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
> -                      BlkdebugIOType iotype)
> +static int coroutine_fn rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
> +                                   BlkdebugIOType iotype)

Following that guideline, rule_check() is reached from:
+ coroutine_fn blkdebug_co_preadv
+ coroutine_fn blkdebug_co_pwritev
+ blkdebug_co_flush (fixed to be coroutine_fn below)
+ coroutine_fn blkdebug_co_pwrite_zeroes
+ coroutine_fn blkdebug_co_pdiscard
+ coroutine_fn blkdebug_co_block_status

>  {
>      BDRVBlkdebugState *s = bs->opaque;
>      BlkdebugRule *rule = NULL;
> @@ -672,7 +672,7 @@ blkdebug_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
>      return bdrv_co_pwritev(bs->file, offset, bytes, qiov, flags);
>  }
>  
> -static int blkdebug_co_flush(BlockDriverState *bs)
> +static int coroutine_fn blkdebug_co_flush(BlockDriverState *bs)

blkdebug_co_flush() is only reached from:
+ .bdrv_co_flush_to_disk
  + from io.c coroutine_fn bdrv_co_flush

>  {
>      int err = rule_check(bs, 0, 0, BLKDEBUG_IO_TYPE_FLUSH);
>  
> @@ -791,7 +791,7 @@ static void blkdebug_close(BlockDriverState *bs)
>  }
>  
>  /* Called with lock held.  */
> -static void suspend_request(BlockDriverState *bs, BlkdebugRule *rule)
> +static void coroutine_fn suspend_request(BlockDriverState *bs, BlkdebugRule *rule)

suspend_request() is only reached from:
+ process_rule (fixed to be coroutine_fn below)

>  {
>      BDRVBlkdebugState *s = bs->opaque;
>      BlkdebugSuspendedReq *r;
> @@ -810,8 +810,8 @@ static void suspend_request(BlockDriverState *bs, BlkdebugRule *rule)
>  }
>  
>  /* Called with lock held.  */
> -static void process_rule(BlockDriverState *bs, struct BlkdebugRule *rule,
> -                         int *action_count, int *new_state)
> +static void coroutine_fn process_rule(BlockDriverState *bs, struct BlkdebugRule *rule,
> +                                      int *action_count, int *new_state)

process_rule() is only reached from:
+ blkdebug_debug_event (fixed to be coroutine_fn below)

>  {
>      BDRVBlkdebugState *s = bs->opaque;
>  
> @@ -840,7 +840,7 @@ static void process_rule(BlockDriverState *bs, struct BlkdebugRule *rule,
>      }
>  }
>  
> -static void blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)
> +static void coroutine_fn blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)

Long line; could wrap the arguments.

blkdebug_debug_event() is only reached from:
+ .bdrv_debug_event
  + from io.c coroutine_fn bdrv_do_co_copy_on_readv
  + from io.c bdrv_padding_rmw_read (NOT marked coroutine_fn, no qemu_in_coroutine guard!)
  | + from io.c coroutine_fn bdrv_co_do_zero_pwritev
  | + from io.c coroutine_fn bdrv_co_pwritev_part
  + from io.c coroutine_fn bdrv_aligned_pwritev

So the patch is 95% correct; if you also mark io.c
bdrv_padding_rmw_read(), you can add:

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


