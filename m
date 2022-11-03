Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF9B618715
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 19:08:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqecL-00059U-F5; Thu, 03 Nov 2022 14:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oqecJ-00058T-RC
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 14:07:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oqecI-0001Bx-8o
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 14:07:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667498820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MLKEO0QMIaVX8XK2f4C5VWnWcOO6NQUlKGJtRhPhpCc=;
 b=KJZflPcXLEajsY/dfbdwX9tRwq5zPIGWTCuswuoaKzOXV9Ormcqi9zb0WntU5uqrqd57gT
 8qMYP/xFpLirem48UE6Jv64n4GyfJPUMe52NO9hrCaLH+OHUjIP2jbcmAAm8wWThpDelgj
 m57U1Engbz9+s+NrJHDt4x9qaU1/0oc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-MwUxPB0uOhq7p4vjPWwH5g-1; Thu, 03 Nov 2022 14:06:57 -0400
X-MC-Unique: MwUxPB0uOhq7p4vjPWwH5g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72AD53C01DFB;
 Thu,  3 Nov 2022 18:06:56 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03BF6492B06;
 Thu,  3 Nov 2022 18:06:54 +0000 (UTC)
Date: Thu, 3 Nov 2022 19:06:53 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 2/9] block-copy: add missing coroutine_fn annotations
Message-ID: <Y2QDPXegFTdpBy6S@redhat.com>
References: <20221103134206.4041928-1-eesposit@redhat.com>
 <20221103134206.4041928-3-eesposit@redhat.com>
 <8f24c24c-ca61-108c-924b-39465a3c67fe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f24c24c-ca61-108c-924b-39465a3c67fe@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 03.11.2022 um 17:56 hat Paolo Bonzini geschrieben:
> On 11/3/22 14:41, Emanuele Giuseppe Esposito wrote:
> > block_copy_reset_unallocated and block_copy_is_cluster_allocated are
> > only called by backup_run, a corotuine_fn itself.

s/corotuine_fn/coroutine_fn/

> > 
> > Same applies to block_copy_block_status, called by
> > block_copy_dirty_clusters.
> > 
> > Therefore mark them as coroutine too.
> > 
> > Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> 
> They don't need to be coroutine_fn.  coroutine_fn is needed if you call
> another coroutine_fn, but not if you _are only called_ by coroutine_fn.
> There is nothing in these functions that needs them to be called from a
> coroutine.
> 
> The only exception is qemu_coroutine_yield(), which is the only leaf
> coroutine_fn.

I think it can make sense to have coroutine_fn as a documentation for
things that are only ever called in a coroutine even if they could
theoretically also work outside of coroutine context.

Otherwise, when we want to introduce a coroutine_fn call somewhere, it's
not only less obvious that it's even possible to do, but we'll have to
add potentially many additional coroutine_fn annotations in the whole
call chain in an otherwise unrelated patch.

Kevin


