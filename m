Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AB662175C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 15:50:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osPui-0004C4-PA; Tue, 08 Nov 2022 09:49:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1osPuP-0003y5-Pa; Tue, 08 Nov 2022 09:49:10 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1osPuM-00079Y-Ck; Tue, 08 Nov 2022 09:49:01 -0500
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id ABA725E874;
 Tue,  8 Nov 2022 17:48:36 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b535::1:28] (unknown
 [2a02:6b8:b081:b535::1:28])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 Tc8tDcn69N-mZNa9N3L; Tue, 08 Nov 2022 17:48:36 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1667918916; bh=jg43FIkDDY3+9/2FZWJXs8FyynrlzOeNA/FCItotLWg=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=yofDCRA7PGV1HzSCYWjR4K9CVk3MAtNOHu7kWLSB1aL6J2JPUvdSYBGvDesQP7kY3
 XO8Z/91WM5XMInE4VH02wKYNqJSdCKMweazfmqWdrkQeAVmxhKmDxcXhHBRPbOUH59
 qK/S0Q6R5B/ExASSRUyfli1TWXGuOC2fplM+p770=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <197f2a27-4c3f-a62b-535c-d1db9ba22a32@yandex-team.ru>
Date: Tue, 8 Nov 2022 17:48:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 2/9] block-copy: add missing coroutine_fn annotations
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20221104095700.4117433-1-eesposit@redhat.com>
 <20221104095700.4117433-3-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221104095700.4117433-3-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/4/22 12:56, Emanuele Giuseppe Esposito wrote:
> These functions end up calling bdrv_common_block_status_above(), a
> generated_co_wrapper function.

generated_co_wrapper is not a coroutine_fn. Сonversely it's a function that do a class coroutine wrapping - start a coroutine and do POLL to wait for the coroutine to finish.

> In addition, they also happen to be always called in coroutine context,
> meaning all callers are coroutine_fn.

That's also not a reason for marking them coroutine_fn. "coroutine_fn" means that the function can be called only from coroutine context.

> This means that the g_c_w function will enter the qemu_in_coroutine()
> case and eventually suspend (or in other words call qemu_coroutine_yield()).
> Therefore we need to mark such functions coroutine_fn too.

I don't think so. Moreover, this breaks the concept, as your new coroutine_fn functions will call generated_co_wrapper functions which are not marked coroutine_fn and never was.

> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/block-copy.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/block/block-copy.c b/block/block-copy.c
> index bb947afdda..f33ab1d0b6 100644
> --- a/block/block-copy.c
> +++ b/block/block-copy.c
> @@ -577,8 +577,9 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
>       return ret;
>   }
>   
> -static int block_copy_block_status(BlockCopyState *s, int64_t offset,
> -                                   int64_t bytes, int64_t *pnum)
> +static coroutine_fn int block_copy_block_status(BlockCopyState *s,
> +                                                int64_t offset,
> +                                                int64_t bytes, int64_t *pnum)
>   {
>       int64_t num;
>       BlockDriverState *base;
> @@ -613,8 +614,9 @@ static int block_copy_block_status(BlockCopyState *s, int64_t offset,
>    * Check if the cluster starting at offset is allocated or not.
>    * return via pnum the number of contiguous clusters sharing this allocation.
>    */
> -static int block_copy_is_cluster_allocated(BlockCopyState *s, int64_t offset,
> -                                           int64_t *pnum)
> +static int coroutine_fn block_copy_is_cluster_allocated(BlockCopyState *s,
> +                                                        int64_t offset,
> +                                                        int64_t *pnum)
>   {
>       BlockDriverState *bs = s->source->bs;
>       int64_t count, total_count = 0;
> @@ -669,8 +671,9 @@ void block_copy_reset(BlockCopyState *s, int64_t offset, int64_t bytes)
>    * @return 0 when the cluster at @offset was unallocated,
>    *         1 otherwise, and -ret on error.
>    */
> -int64_t block_copy_reset_unallocated(BlockCopyState *s,
> -                                     int64_t offset, int64_t *count)
> +int64_t coroutine_fn block_copy_reset_unallocated(BlockCopyState *s,
> +                                                  int64_t offset,
> +                                                  int64_t *count)
>   {
>       int ret;
>       int64_t clusters, bytes;

-- 
Best regards,
Vladimir


