Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2945B8ABB
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 16:36:51 +0200 (CEST)
Received: from localhost ([::1]:35386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYTVS-0003ZO-7j
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 10:36:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oYTNZ-0006K7-4t; Wed, 14 Sep 2022 10:28:45 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:37086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oYTNV-00049S-3C; Wed, 14 Sep 2022 10:28:39 -0400
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id C80E92E0A2A;
 Wed, 14 Sep 2022 17:28:25 +0300 (MSK)
Received: from [172.31.103.133] (172.31.103.133-vpn.dhcp.yndx.net
 [172.31.103.133])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 YoWgNtWXEO-SNOSeFb8; Wed, 14 Sep 2022 17:28:25 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1663165705; bh=0SBlYcj113/PGoSAsLY0jIJzSBhCt9k8Mxw/7axyakQ=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=rusC40LZv7+Mob1oK7irNLC97dF9Kp862kZB82Reap032R/MmRnRaXwijyAm5YFPA
 b9MmFkLzKMM7LtFJFPqGzFFo77tyNxLOkZNQVUnpFlLs9DOGBuuZs4BH+O4VB4wQCz
 mdWNL/nQwAx1yQLkYZHHlng5YyDkeIt+kURqPtjo=
Authentication-Results: sas1-c73b4b4f4b95.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <6da86669-f177-7d34-ba8e-5291327b2723@yandex-team.ru>
Date: Wed, 14 Sep 2022 17:28:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v11 21/21] job: remove unused functions
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220826132104.3678958-1-eesposit@redhat.com>
 <20220826132104.3678958-22-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220826132104.3678958-22-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.583,
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

On 8/26/22 16:21, Emanuele Giuseppe Esposito wrote:
> These public functions are not used anywhere, thus can be dropped.
> Also, since this is the final job API that doesn't use AioContext
> lock and replaces it with job_lock, adjust all remaining function
> documentation to clearly specify if the job lock is taken or not.
> 
> Also document the locking requirements for a few functions
> where the second version is not removed.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   include/qemu/job.h |  96 ++++++++++++++----------------------------
>   job.c              | 101 ++-------------------------------------------
>   2 files changed, 34 insertions(+), 163 deletions(-)
> 
> diff --git a/include/qemu/job.h b/include/qemu/job.h
> index ad8b32b4ba..762d6a98a7 100644
> --- a/include/qemu/job.h
> +++ b/include/qemu/job.h
> @@ -384,6 +384,8 @@ JobTxn *job_txn_new(void);
>   /**
>    * Release a reference that was previously acquired with job_txn_add_job or

[..]

> +/**
> + * Returns true if the job is user-paused.
> + * Called with job lock held.
> + */
>   bool job_user_paused_locked(Job *job);
>   
>   /**
>    * Resume the specified @job.
>    * Must be paired with a preceding job_user_pause.

in comment: job_user_puase_locked


Please also fix other removed function mentioning in comments, for example I see in comments mentioning of removed job_ref, job_unref, job_user_pause...

> - */
> -void job_user_resume(Job *job, Error **errp);
> -
> -/*
> - * Same as job_user_resume(), but called with job lock held.
> - * Might release the lock temporarily.
> + * Called with job lock held, but might release it temporarily.
>    */
>   void job_user_resume_locked(Job *job, Error **errp);
>   
> @@ -624,6 +611,7 @@ void job_user_resume_locked(Job *job, Error **errp);
>    * first one if @job is %NULL.

[..]

>   /**
> @@ -725,9 +703,6 @@ void job_cancel_sync_all(void);
>    * Returns the return value from the job.
>    * Called with job_lock *not* held.

in comment: with lock held.

>    */
> -int job_complete_sync(Job *job, Error **errp);
> -
> -/* Same as job_complete_sync, but called with job lock held. */
>   int job_complete_sync_locked(Job *job, Error **errp);
>   



-- 
Best regards,
Vladimir

