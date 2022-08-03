Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF241588FBA
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 17:51:29 +0200 (CEST)
Received: from localhost ([::1]:42308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJGec-0003eQ-Pv
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 11:51:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oJGav-0007vB-4Z
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 11:47:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oJGas-0000Yp-2E
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 11:47:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659541652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Oxr6ee5KNMxodj49runD2xOLhePQzuqk8fVczKczTtA=;
 b=A9GBep2bw358/tTanEPetlGgJpLaC/ZouZBZbMdAKlD2jkfBMj6pZFMjjW/4R+oUZnj47z
 G10Kinb0vyjpvRQn0/vwY2hW/akaeFZajCvOoXQOKDicsAg58xfb/fDBozhb8wcCv5LS2u
 fZRtUMb0ZZiZu2AoDEREZbQimhT+PdM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-271-WyPQnUF5Nq6GIupKez91zA-1; Wed, 03 Aug 2022 11:47:29 -0400
X-MC-Unique: WyPQnUF5Nq6GIupKez91zA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2376A801231;
 Wed,  3 Aug 2022 15:47:29 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A885400DEF8;
 Wed,  3 Aug 2022 15:47:26 +0000 (UTC)
Date: Wed, 3 Aug 2022 17:47:25 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: Re: [PATCH v10 06/21] job: move and update comments from blockjob.c
Message-ID: <YuqYjXI51BbuadSj@redhat.com>
References: <20220725073855.76049-1-eesposit@redhat.com>
 <20220725073855.76049-7-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725073855.76049-7-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

Am 25.07.2022 um 09:38 hat Emanuele Giuseppe Esposito geschrieben:
> This comment applies more on job, it was left in blockjob as in the past
> the whole job logic was implemented there.
> 
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are *nop*.
> 
> No functional change intended.
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  blockjob.c | 20 --------------------
>  job.c      | 14 ++++++++++++++
>  2 files changed, 14 insertions(+), 20 deletions(-)
> 
> diff --git a/blockjob.c b/blockjob.c
> index 4868453d74..7da59a1f1c 100644
> --- a/blockjob.c
> +++ b/blockjob.c
> @@ -36,21 +36,6 @@
>  #include "qemu/main-loop.h"
>  #include "qemu/timer.h"
>  
> -/*
> - * The block job API is composed of two categories of functions.
> - *
> - * The first includes functions used by the monitor.  The monitor is
> - * peculiar in that it accesses the block job list with block_job_get, and
> - * therefore needs consistency across block_job_get and the actual operation
> - * (e.g. block_job_set_speed).  The consistency is achieved with
> - * aio_context_acquire/release.  These functions are declared in blockjob.h.
> - *
> - * The second includes functions used by the block job drivers and sometimes
> - * by the core block layer.  These do not care about locking, because the
> - * whole coroutine runs under the AioContext lock, and are declared in
> - * blockjob_int.h.
> - */
> -
>  static bool is_block_job(Job *job)
>  {
>      return job_type(job) == JOB_TYPE_BACKUP ||
> @@ -433,11 +418,6 @@ static void block_job_event_ready(Notifier *n, void *opaque)
>  }
>  
>  
> -/*
> - * API for block job drivers and the block layer.  These functions are
> - * declared in blockjob_int.h.
> - */
> -
>  void *block_job_create(const char *job_id, const BlockJobDriver *driver,
>                         JobTxn *txn, BlockDriverState *bs, uint64_t perm,
>                         uint64_t shared_perm, int64_t speed, int flags,
> diff --git a/job.c b/job.c
> index ae25db97ac..ebaa4e585b 100644
> --- a/job.c
> +++ b/job.c
> @@ -32,6 +32,20 @@
>  #include "trace/trace-root.h"
>  #include "qapi/qapi-events-job.h"
>  
> +/*
> + * The job API is composed of two categories of functions.
> + *
> + * The first includes functions used by the monitor.  The monitor is
> + * peculiar in that it accesses the block job list with job_get, and

s/block job/job/

> + * therefore needs consistency across job_get and the actual operation
> + * (e.g. job_user_cancel). To achieve this consistency, the caller
> + * calls job_lock/job_unlock itself around the whole operation.
> + *
> + *
> + * The second includes functions used by the block job drivers and sometimes

Same here.

> + * by the core block layer. These delegate the locking to the callee instead.
> + */

Unless I'm missing something, this comment (specifically the part with
calling job_lock/job_unlock outside of job.c) is actually not true at
this point in the series. I would suggest adding a comment to this
effect, like:

    * TODO Actually make this true

Then we know that when you remove the comment, we need to review that
it's actually true at that point in the series.

For now, I'll just try to remember checking this later.

Kevin


