Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D10535F22E
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 13:25:05 +0200 (CEST)
Received: from localhost ([::1]:33026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWddo-0004vq-CN
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 07:25:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lWdbQ-0002hR-4U
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 07:22:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lWdbM-0002mp-UI
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 07:22:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618399351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A45F+87LFJ7RyaZC/g+9/LcvLVNGkU+7JfJmCqNiGhs=;
 b=NrpvdZ/dIJxNJYtn+gqGMERuNdx998eV2zArMaimnLeRRKcJwZLwaMyFQ5rB4UH6VSPhPu
 kKOw8IckCbRR/fVzY1qM2sVzUVlRKeNJ9Zhoyd7cyXCBdIp1BrQtG/uz1hJZPZwskRp8Ym
 WnhMh/9T3Rv+4PQ++RckqolQMXkYw3c=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-3T-Svu_mO-qRL03gBrAobQ-1; Wed, 14 Apr 2021 07:22:30 -0400
X-MC-Unique: 3T-Svu_mO-qRL03gBrAobQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 t11-20020aa7d4cb0000b0290382e868be07so3143761edr.20
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 04:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A45F+87LFJ7RyaZC/g+9/LcvLVNGkU+7JfJmCqNiGhs=;
 b=idGiEWgyq3JeW25mSRmawPSDLV/iYUvWXs6yKGfhDPsVkmZW/kBl3FQIumTktlNhXd
 DbVThFOg6nwj3qcyHOWDtVjEmuUPsUSaF9kkLSF4O45tYq66+JvEP/RNO+5+Ed+KzYMh
 DVck2CawvDSOhY/9JDS82YMg9m9ELfJ0yiwwqB53/JlM3J0N5JMO0Y75OSz8SgjuSu6V
 N5jPAB4Gml5OHG3wtPhfBmwE1a+VoYSdGYXKrsQPg0xO1Pr5icPzpwkoH/kZ2D5JlN/M
 7L4BRWvPv6d4Mh4j0uy3KNMiAFIVrF/Ogx4j33i1VOdykA+UJ+Cfi6BIBugtKDM7urre
 5Adw==
X-Gm-Message-State: AOAM531d93W332BoAQpi4ASMmPbm1x4PNKl6ZMimxyYd0BgCSTWPhSbg
 CKnJux1q0zxOkL0xaOUKJ1iUKDJKO++EKpCxPN6K/kDIZ8mJ1lTJUOyDbAjE9//9NmKyBveHoEV
 YcaIwjT/j3LOA/+c=
X-Received: by 2002:a17:906:77c5:: with SMTP id
 m5mr35057069ejn.201.1618399349351; 
 Wed, 14 Apr 2021 04:22:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySK50AzyEgzGo0JTtcA1VVwjFlPar6GmB89ZvJOhu+sr4f57bwp7zcMy2gpggB/ut4XosRRw==
X-Received: by 2002:a17:906:77c5:: with SMTP id
 m5mr35057038ejn.201.1618399348983; 
 Wed, 14 Apr 2021 04:22:28 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.172])
 by smtp.gmail.com with ESMTPSA id a21sm2085917ejk.15.2021.04.14.04.22.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 04:22:28 -0700 (PDT)
Subject: Re: [PATCH] ratelimit: protect with a mutex
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210413125533.217440-1-pbonzini@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <76ab1570-e8d2-889d-f8f9-7a00cb810880@redhat.com>
Date: Wed, 14 Apr 2021 13:22:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413125533.217440-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: stefanha@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 13/04/2021 14:55, Paolo Bonzini wrote:
> Right now, rate limiting is protected by the AioContext mutex, which is
> taken for example both by the block jobs and by qmp_block_job_set_speed
> (via find_block_job).
> 
> We would like to remove the dependency of block layer code on the
> AioContext mutex, since most drivers and the core I/O code are already
> not relying on it.  However, there is no existing lock that can easily
> be taken by both ratelimit_set_speed and ratelimit_calculate_delay,
> especially because the latter might run in coroutine context (and
> therefore under a CoMutex) but the former will not.
> 
> Since concurrent calls to ratelimit_calculate_delay are not possible,
> one idea could be to use a seqlock to get a snapshot of slice_ns and
> slice_quota.  But for now keep it simple, and just add a mutex to the
> RateLimit struct; block jobs are generally not performance critical to
> the point of optimizing the clock cycles spent in synchronization.
> 
> This also requires the introduction of init/destroy functions, so
> add them to the two users of ratelimit.h.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/block-copy.c       |  2 ++
>   blockjob.c               |  3 +++
>   include/qemu/ratelimit.h | 14 ++++++++++++++
>   3 files changed, 19 insertions(+)
> 
> diff --git a/block/block-copy.c b/block/block-copy.c
> index 39ae481c8b..9b4af00614 100644
> --- a/block/block-copy.c
> +++ b/block/block-copy.c
> @@ -230,6 +230,7 @@ void block_copy_state_free(BlockCopyState *s)
>           return;
>       }
>   
> +    ratelimit_destroy(&s->rate_limit);
>       bdrv_release_dirty_bitmap(s->copy_bitmap);
>       shres_destroy(s->mem);
>       g_free(s);
> @@ -289,6 +290,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
>           s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
>       }
>   
> +    ratelimit_init(&s->rate_limit);
>       QLIST_INIT(&s->tasks);
>       QLIST_INIT(&s->calls);
>   
> diff --git a/blockjob.c b/blockjob.c
> index 207e8c7fd9..46f15befe8 100644
> --- a/blockjob.c
> +++ b/blockjob.c
> @@ -87,6 +87,7 @@ void block_job_free(Job *job)
>   
>       block_job_remove_all_bdrv(bjob);
>       blk_unref(bjob->blk);
> +    ratelimit_destroy(&bjob->limit);
>       error_free(bjob->blocker);
>   }
>   
> @@ -435,6 +436,8 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
>       assert(job->job.driver->free == &block_job_free);
>       assert(job->job.driver->user_resume == &block_job_user_resume);
>   
> +    ratelimit_init(&job->limit);
> +
>       job->blk = blk;
>   
>       job->finalize_cancelled_notifier.notify = block_job_event_cancelled;
> diff --git a/include/qemu/ratelimit.h b/include/qemu/ratelimit.h
> index 01da8d63f1..003ea6d5a3 100644
> --- a/include/qemu/ratelimit.h
> +++ b/include/qemu/ratelimit.h
> @@ -14,9 +14,11 @@
>   #ifndef QEMU_RATELIMIT_H
>   #define QEMU_RATELIMIT_H
>   
> +#include "qemu/lockable.h"
>   #include "qemu/timer.h"
>   
>   typedef struct {
> +    QemuMutex lock;
>       int64_t slice_start_time;
>       int64_t slice_end_time;
>       uint64_t slice_quota;
> @@ -40,6 +42,7 @@ static inline int64_t ratelimit_calculate_delay(RateLimit *limit, uint64_t n)
>       int64_t now = qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
>       double delay_slices;
>   
> +    QEMU_LOCK_GUARD(&limit->lock);
>       assert(limit->slice_quota && limit->slice_ns);
>   
>       if (limit->slice_end_time < now) {
> @@ -65,9 +68,20 @@ static inline int64_t ratelimit_calculate_delay(RateLimit *limit, uint64_t n)
>       return limit->slice_end_time - now;
>   }
>   
> +static inline void ratelimit_init(RateLimit *limit)
> +{
> +    qemu_mutex_init(&limit->lock);
> +}
> +
> +static inline void ratelimit_destroy(RateLimit *limit)
> +{
> +    qemu_mutex_destroy(&limit->lock);
> +}
> +
>   static inline void ratelimit_set_speed(RateLimit *limit, uint64_t speed,
>                                          uint64_t slice_ns)
>   {
> +    QEMU_LOCK_GUARD(&limit->lock);
>       limit->slice_ns = slice_ns;
>       limit->slice_quota = MAX(((double)speed * slice_ns) / 1000000000ULL, 1);
>   }
> 

Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>


