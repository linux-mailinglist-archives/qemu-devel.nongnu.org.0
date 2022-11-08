Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D89D3621780
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 15:55:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osPzX-0000xB-OL; Tue, 08 Nov 2022 09:54:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1osPzT-0000wE-Q9; Tue, 08 Nov 2022 09:54:15 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1osPzR-00005G-L7; Tue, 08 Nov 2022 09:54:15 -0500
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd1e:0:640:7470:3316])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id E9B425E83D;
 Tue,  8 Nov 2022 17:54:01 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b535::1:28] (unknown
 [2a02:6b8:b081:b535::1:28])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 ov5wHpMPcn-s1N0nN38; Tue, 08 Nov 2022 17:54:01 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1667919241; bh=qkRHEdCFol8CpA7lc5DO56Tb2wT1CJTR/6tALbWklZM=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=EPdJSumAyHrL0e4TT2Gv3DvqYgOR4miIy9TRgPh9HifMuUCXSaoWAc+1j1BK2ihic
 IaElUZ7EEHTGMT1HYf8d2Eqv/E349NE4t2kI28xTdcZ7oLwtiwxLt51C+fAzMrY0Qy
 Gxnvj0zkcpTZwK38YXOsdEejk6aoOzJEmiB4+uec=
Authentication-Results: sas1-7470331623bb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <b54b403d-3f2b-c56b-5676-1c5fa6881c8c@yandex-team.ru>
Date: Tue, 8 Nov 2022 17:54:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 3/9] nbd/server.c: add missing coroutine_fn annotations
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20221104095700.4117433-1-eesposit@redhat.com>
 <20221104095700.4117433-4-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221104095700.4117433-4-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
> These functions end up calling bdrv_*() implemented as generated_co_wrapper
> functions.

Same here. Sorry that I joined only on v3.

In past we had a lot of "coroutine wrappers", each IO function in block/io.c and many in block.c had two variants:

coroutine_fn bdrv_co_foo(...)

and a wrapper

bdrv_foo(...)

And that wrapper is not a coroutine_fn, it's for calling from any context: coroutine or not. Now many of these wrappers are auto-generated, you may find them in build/block/block-gen.c after successful make.

"generated_co_wrapper" is a sign for code generation script to generate the wrapper code.

> In addition, they also happen to be always called in coroutine context,
> meaning all callers are coroutine_fn.
> This means that the g_c_w function will enter the qemu_in_coroutine()
> case and eventually suspend (or in other words call qemu_coroutine_yield()).
> Therefore we need to mark such functions coroutine_fn too.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   nbd/server.c | 21 ++++++++++++---------
>   1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/nbd/server.c b/nbd/server.c
> index ada16089f3..e2eec0cf46 100644
> --- a/nbd/server.c
> +++ b/nbd/server.c
> @@ -2141,8 +2141,9 @@ static int nbd_extent_array_add(NBDExtentArray *ea,
>       return 0;
>   }
>   
> -static int blockstatus_to_extents(BlockDriverState *bs, uint64_t offset,
> -                                  uint64_t bytes, NBDExtentArray *ea)
> +static int coroutine_fn blockstatus_to_extents(BlockDriverState *bs,
> +                                               uint64_t offset, uint64_t bytes,
> +                                               NBDExtentArray *ea)
>   {
>       while (bytes) {
>           uint32_t flags;
> @@ -2168,8 +2169,9 @@ static int blockstatus_to_extents(BlockDriverState *bs, uint64_t offset,
>       return 0;
>   }
>   
> -static int blockalloc_to_extents(BlockDriverState *bs, uint64_t offset,
> -                                 uint64_t bytes, NBDExtentArray *ea)
> +static int coroutine_fn blockalloc_to_extents(BlockDriverState *bs,
> +                                              uint64_t offset, uint64_t bytes,
> +                                              NBDExtentArray *ea)
>   {
>       while (bytes) {
>           int64_t num;
> @@ -2220,11 +2222,12 @@ static int nbd_co_send_extents(NBDClient *client, uint64_t handle,
>   }
>   
>   /* Get block status from the exported device and send it to the client */
> -static int nbd_co_send_block_status(NBDClient *client, uint64_t handle,
> -                                    BlockDriverState *bs, uint64_t offset,
> -                                    uint32_t length, bool dont_fragment,
> -                                    bool last, uint32_t context_id,
> -                                    Error **errp)
> +static int
> +coroutine_fn nbd_co_send_block_status(NBDClient *client, uint64_t handle,
> +                                      BlockDriverState *bs, uint64_t offset,
> +                                      uint32_t length, bool dont_fragment,
> +                                      bool last, uint32_t context_id,
> +                                      Error **errp)
>   {
>       int ret;
>       unsigned int nb_extents = dont_fragment ? 1 : NBD_MAX_BLOCK_STATUS_EXTENTS;

-- 
Best regards,
Vladimir


