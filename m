Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3A6632153
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 12:53:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox5Kz-0004JI-2k; Mon, 21 Nov 2022 06:51:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ox5Kx-0004In-3v
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 06:51:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ox5Kv-0000lO-Kb
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 06:51:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669031501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xfGwcF2uzM47hyPsYfsvLpsEDFQDVfkEs1W63LC1Pq4=;
 b=Cg61633eg+AR9YGcT+MIGSIMwew9sKvw24EgtGUjywBPlWBK7gYbWDmEzZPyMgYpH03Xvd
 B4zLWce8VPVAfeZmEb+Jj4dzBHsXuJ1oIMESoyqMDDVZYpFVyrbuG7lq+8agvwhqGkw7h6
 2SZHBMiArQOTBb2WfmFtOKpFxvXbgmA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-T0aAtlQnN3ifIYlfW8rzgQ-1; Mon, 21 Nov 2022 06:51:24 -0500
X-MC-Unique: T0aAtlQnN3ifIYlfW8rzgQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD5D486C04C;
 Mon, 21 Nov 2022 11:51:17 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 282862166B26;
 Mon, 21 Nov 2022 11:51:09 +0000 (UTC)
Date: Mon, 21 Nov 2022 12:50:58 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 01/11] block-copy: add missing coroutine_fn annotations
Message-ID: <Y3tmIjH2u48H5iRW@redhat.com>
References: <20221116122241.2856527-1-eesposit@redhat.com>
 <20221116122241.2856527-2-eesposit@redhat.com>
 <Y3fXgfKe5H7j22aj@redhat.com>
 <c1c9e6b2-78a5-bd0c-6c95-a3123b89ce91@redhat.com>
 <c30c7321-a2b6-5094-16d0-2aee5a327c80@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c30c7321-a2b6-5094-16d0-2aee5a327c80@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 21.11.2022 um 09:51 hat Emanuele Giuseppe Esposito geschrieben:
> 
> 
> Am 21/11/2022 um 09:32 schrieb Emanuele Giuseppe Esposito:
> > 
> > 
> > Am 18/11/2022 um 20:05 schrieb Kevin Wolf:
> >> Am 16.11.2022 um 13:22 hat Emanuele Giuseppe Esposito geschrieben:
> >>> These functions end up calling bdrv_common_block_status_above(), a
> >>> generated_co_wrapper function.
> >>> In addition, they also happen to be always called in coroutine context,
> >>> meaning all callers are coroutine_fn.
> >>> This means that the g_c_w function will enter the qemu_in_coroutine()
> >>> case and eventually suspend (or in other words call qemu_coroutine_yield()).
> >>> Therefore we need to mark such functions coroutine_fn too.
> >>>
> >>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> >>
> >> Ideally, we'd convert them to new wrappers bdrv_co_is_allocated() and
> >> bdrv_co_block_status_above() instead of having to argue that they always
> >> take the coroutine path in g_c_w.
> > 
> > Ok so basically I should introduce bdrv_co_is_allocated, because so far
> > in this and next series I never thought about creating it.
> > Since these functions will be eventually split anyways, I agree let's
> > start doing this now.
> 
> Actually bdrv_is_allocated would be a g_c_w functions in itself, that
> calls another g_c_w and it is probably called by functions that are or
> will be g_c_w.

I'm not sure if I understand. bdrv_is_allocated() is essentially a g_c_w
function today, just indirectly. But we have callers that know that they
are running in a coroutine (which is why you're adding coroutine_fn to
them), so they shouldn't call a g_c_w function, but directly the
coroutine version of the function.

The only reason why you can't currently do that is that
bdrv_is_allocated() exists as a wrapper around the g_c_w function
bdrv_common_block_status_above(), but the same wrapper doesn't exist for
the pure coroutine version bdrv_co_common_block_status_above().

All I'm suggesting is introducing a bdrv_co_is_allocated() that is a
wrapper directly around bdrv_co_common_block_status_above(), so that
the functions you're marking as coroutine_fn can use it instead of
calling g_c_w. This should be about 10 lines of code.

I'm not implying that you should convert any other callers in this
patch, or that you should touch bdrv_is_allocated() at all.

> Is this actually the scope of this series? I think switching this
> specific function and its callers or similar will require a lot of
> efforts, and if I do it here it won't cover all the cases for sure.
> 
> Wouldn't it be better to do these kind of things in a different serie
> using Paolo's vrc tool?

I'm not sure what the scope of this series is, because you already do
introduce new wrappers in other patches of the series. I assumed it's
just to improve the situation a little, with no claim of being
exhaustive.

Finding and fully converting all callers might indeed be a job for
something like vrc, but here I'm only looking at local consistency in
functions where you're adding coroutine_fn.

Kevin


