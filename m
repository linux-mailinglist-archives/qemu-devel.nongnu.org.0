Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BAD55348F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 16:33:12 +0200 (CEST)
Received: from localhost ([::1]:44280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3ewJ-0003vM-9T
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 10:33:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o3esx-0002bk-Hq; Tue, 21 Jun 2022 10:29:43 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:40712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o3est-0003pk-DG; Tue, 21 Jun 2022 10:29:41 -0400
Received: from sas2-6a1db1376cb6.qloud-c.yandex.net
 (sas2-6a1db1376cb6.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bb0f:0:640:6a1d:b137])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 2313A2E137C;
 Tue, 21 Jun 2022 17:29:28 +0300 (MSK)
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net [2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by sas2-6a1db1376cb6.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 qi1aXWhbee-TRJqKUnO; Tue, 21 Jun 2022 17:29:28 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1655821768; bh=8E997T+qHwA4wdnPOBipaMCCBGtHLopGgh3WvKncDac=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=XcxtQ+nkG8heSZT1+f1eWf6CWDPbA7VyZOsluHV92Vr5NYxqyxk/eR2Ql/WR6uq+B
 pPyw1dg6WrEG2UtLpjAHavQ0uw3BOol8CpaDnV4ZATniPSSOJBEKi3WDp59PgQPq3Z
 2rHoxB5H/aYKMy0Q466Cpn+/URjYKGyXOVeimpZI=
Authentication-Results: sas2-6a1db1376cb6.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPV6:2a02:6b8:b081:23::1:8] (unknown [2a02:6b8:b081:23::1:8])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id ATTBY34kZi-TQNioeYF; Tue, 21 Jun 2022 17:29:27 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <5be08d37-93bb-efd6-5a33-ca73d56c390d@yandex-team.ru>
Date: Tue, 21 Jun 2022 17:29:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v7 02/18] job.h: categorize fields in struct Job
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220616131835.2004262-1-eesposit@redhat.com>
 <20220616131835.2004262-3-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220616131835.2004262-3-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 6/16/22 16:18, Emanuele Giuseppe Esposito wrote:
> Categorize the fields in struct Job to understand which ones
> need to be protected by the job mutex and which don't.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   include/qemu/job.h | 61 +++++++++++++++++++++++++++-------------------
>   1 file changed, 36 insertions(+), 25 deletions(-)
> 
> diff --git a/include/qemu/job.h b/include/qemu/job.h
> index d1192ffd61..876e13d549 100644
> --- a/include/qemu/job.h
> +++ b/include/qemu/job.h
> @@ -40,27 +40,52 @@ typedef struct JobTxn JobTxn;
>    * Long-running operation.
>    */
>   typedef struct Job {
> +
> +    /* Fields set at initialization (job_create), and never modified */
> +
>       /** The ID of the job. May be NULL for internal jobs. */
>       char *id;
>   
> -    /** The type of this job. */
> +    /**
> +     * The type of this job.
> +     * All callbacks are called with job_mutex *not* held.
> +     */
>       const JobDriver *driver;
>   
> -    /** Reference count of the block job */
> -    int refcnt;
> -
> -    /** Current state; See @JobStatus for details. */
> -    JobStatus status;
> -
> -    /** AioContext to run the job coroutine in */
> -    AioContext *aio_context;
> -
>       /**
>        * The coroutine that executes the job.  If not NULL, it is reentered when
>        * busy is false and the job is cancelled.
> +     * Initialized in job_start()
>        */
>       Coroutine *co;
>   
> +    /** True if this job should automatically finalize itself */
> +    bool auto_finalize;
> +
> +    /** True if this job should automatically dismiss itself */
> +    bool auto_dismiss;
> +
> +    /** The completion function that will be called when the job completes.  */
> +    BlockCompletionFunc *cb;
> +
> +    /** The opaque value that is passed to the completion function.  */
> +    void *opaque;
> +
> +    /* ProgressMeter API is thread-safe */
> +    ProgressMeter progress;
> +
> +
> +    /** Protected by AioContext lock */

Previous groups stats with '/*'. Should /** be substituted by /* ?

> +
> +    /** AioContext to run the job coroutine in */
> +    AioContext *aio_context;

Not sure how much is it protected. Probably we read it without locking. But that should go away anyway.

> +
> +    /** Reference count of the block job */
> +    int refcnt;
> +
> +    /** Current state; See @JobStatus for details. */
> +    JobStatus status;
> +
>       /**
>        * Timer that is used by @job_sleep_ns. Accessed under job_mutex (in
>        * job.c).
> @@ -112,14 +137,6 @@ typedef struct Job {
>       /** Set to true when the job has deferred work to the main loop. */
>       bool deferred_to_main_loop;
>   
> -    /** True if this job should automatically finalize itself */
> -    bool auto_finalize;
> -
> -    /** True if this job should automatically dismiss itself */
> -    bool auto_dismiss;
> -
> -    ProgressMeter progress;
> -
>       /**
>        * Return code from @run and/or @prepare callback(s).
>        * Not final until the job has reached the CONCLUDED status.
> @@ -134,12 +151,6 @@ typedef struct Job {
>        */
>       Error *err;
>   
> -    /** The completion function that will be called when the job completes.  */
> -    BlockCompletionFunc *cb;
> -
> -    /** The opaque value that is passed to the completion function.  */
> -    void *opaque;
> -
>       /** Notifiers called when a cancelled job is finalised */
>       NotifierList on_finalize_cancelled;
>   
> @@ -167,6 +178,7 @@ typedef struct Job {
>   
>   /**
>    * Callbacks and other information about a Job driver.
> + * All callbacks are invoked with job_mutex *not* held.

Should this be in this patch? Seems related. But will we have a lot more comments like this in later patches?

>    */
>   struct JobDriver {
>   
> @@ -472,7 +484,6 @@ void job_yield(Job *job);
>    */
>   void coroutine_fn job_sleep_ns(Job *job, int64_t ns);
>   
> -

I'd drop this, looks like accidental unrelated style fixing.

>   /** Returns the JobType of a given Job. */
>   JobType job_type(const Job *job);
>   

as is, or with dropped 1-2 last hunks:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir

