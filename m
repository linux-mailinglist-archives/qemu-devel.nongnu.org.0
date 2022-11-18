Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 653B762FDC5
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 20:07:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow6gV-0003sg-4j; Fri, 18 Nov 2022 14:05:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ow6gO-0003rm-5h
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 14:05:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ow6gM-0006ee-4l
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 14:05:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668798344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6MbCxK0BB1JWv6/yIBITTls29ZRBDud0I4SxVlg3Ke8=;
 b=iscUIrTckM9cWhbgIz9doQN0G/xsjYMCN8mwY7sIqWB3SUKDQGlKo/RBmfI0UiinkGrfg2
 cyV+4GUV6+43Zc72Case2UWrlIPoQOvus5C1A0bQpCN0xvhKmgqXdwxQhfvERPBGqcVgF+
 Y8Zkp6RqVPrGlkMkuN0R+kCCI401aJY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-hc_K6y-6NDyVT4q0Uwq_3A-1; Fri, 18 Nov 2022 14:05:43 -0500
X-MC-Unique: hc_K6y-6NDyVT4q0Uwq_3A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D574F185A792;
 Fri, 18 Nov 2022 19:05:42 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CCC0140EBF3;
 Fri, 18 Nov 2022 19:05:41 +0000 (UTC)
Date: Fri, 18 Nov 2022 20:05:37 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 01/11] block-copy: add missing coroutine_fn annotations
Message-ID: <Y3fXgfKe5H7j22aj@redhat.com>
References: <20221116122241.2856527-1-eesposit@redhat.com>
 <20221116122241.2856527-2-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116122241.2856527-2-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Am 16.11.2022 um 13:22 hat Emanuele Giuseppe Esposito geschrieben:
> These functions end up calling bdrv_common_block_status_above(), a
> generated_co_wrapper function.
> In addition, they also happen to be always called in coroutine context,
> meaning all callers are coroutine_fn.
> This means that the g_c_w function will enter the qemu_in_coroutine()
> case and eventually suspend (or in other words call qemu_coroutine_yield()).
> Therefore we need to mark such functions coroutine_fn too.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Ideally, we'd convert them to new wrappers bdrv_co_is_allocated() and
bdrv_co_block_status_above() instead of having to argue that they always
take the coroutine path in g_c_w.

> diff --git a/block/block-copy.c b/block/block-copy.c
> index bb947afdda..f33ab1d0b6 100644
> --- a/block/block-copy.c
> +++ b/block/block-copy.c
> @@ -669,8 +671,9 @@ void block_copy_reset(BlockCopyState *s, int64_t offset, int64_t bytes)
>   * @return 0 when the cluster at @offset was unallocated,
>   *         1 otherwise, and -ret on error.
>   */
> -int64_t block_copy_reset_unallocated(BlockCopyState *s,
> -                                     int64_t offset, int64_t *count)
> +int64_t coroutine_fn block_copy_reset_unallocated(BlockCopyState *s,
> +                                                  int64_t offset,
> +                                                  int64_t *count)
>  {
>      int ret;
>      int64_t clusters, bytes;

This one is a public function. Its prototype in block-copy.h should be
updated, too.

Kevin


