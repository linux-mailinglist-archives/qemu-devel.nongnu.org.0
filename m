Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDB74D444E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 11:10:49 +0100 (CET)
Received: from localhost ([::1]:56482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSFks-0002ZK-3Z
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 05:10:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nSFjb-0001sN-L2
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 05:09:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nSFjZ-0002TY-T9
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 05:09:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646906964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DFhDCh07ZhOsb/s30S7DCGwxPRUfb2MPMrUG2BFIbn0=;
 b=V9EI4DrL57D7nnX2+isuvPENwn42xKFnJQHoREY2eQINJpiZHGXw+L/ynE1074teIzqE7x
 hNq7x4TE8gr5EMEo6BFWSGwZ0na3t8lSGcLbHq0lU/fJqlm8gNhQAynCMRuP1BNdrnr7fV
 SIb2+oWMiupRAD4HRsN6eEz/JAJLHIg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-TKKtq7xYNLa27_HBVUvXwg-1; Thu, 10 Mar 2022 05:09:23 -0500
X-MC-Unique: TKKtq7xYNLa27_HBVUvXwg-1
Received: by mail-wr1-f72.google.com with SMTP id
 a5-20020adfdd05000000b001f023fe32ffso1505539wrm.18
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 02:09:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=DFhDCh07ZhOsb/s30S7DCGwxPRUfb2MPMrUG2BFIbn0=;
 b=QGDp6ZFixo6yb3NcTEWrGy5CJbwM32lYyVIgjoDwvKgZmza5Y7gNHMLnldpqLjsjm4
 +2UakfZObwbciTAALoRiXcO/qGLM4U3twQWlacDKlObtagqTVC0GTVmozbJ/sAr2uoWt
 1qRiEGJtQWUlUkV72RMUKYhqSnpxh4hVFLcJi3JUvfpOrsK+YCws9evwqpz3iiC4xhE4
 ddbpljQjeMepnmyI6lJNkf02FfF1CXLHkeCep7Lo+ANCFfrcNN3+ENH7a183lsiMSgF+
 tOihvKktxDpZ4nEiTvhwz2qcygyPygw3OLw3FJu9c7tWKVYTprNfIHMg/qHEh8AHsKMK
 hf6Q==
X-Gm-Message-State: AOAM533Uzmpc0wp/N+Sf2BIVmJr7Gty9TFMACsZ8jzrCrPQrnbZ3IE0j
 3EVNZgailkO8BTQZ1S3Qk5RgHpTt3T8LvuM2w+yziMvVwVHiZJdvg5S34HngddPYhMQ1oeWTXRH
 +3tdzvgVa0p9fU1w=
X-Received: by 2002:a5d:628d:0:b0:1f1:d81d:c954 with SMTP id
 k13-20020a5d628d000000b001f1d81dc954mr2928004wru.273.1646906962069; 
 Thu, 10 Mar 2022 02:09:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6DKs8Ke7S1xpjBsPK5RfZ6t5O3+A3Ol1D+gqsgpFN1b+pwTyM8tovpE5ec7wYhkc3c8/Vvw==
X-Received: by 2002:a5d:628d:0:b0:1f1:d81d:c954 with SMTP id
 k13-20020a5d628d000000b001f1d81dc954mr2927978wru.273.1646906961788; 
 Thu, 10 Mar 2022 02:09:21 -0800 (PST)
Received: from ?IPv6:2a0c:5a80:3506:3400:69b5:c807:1d52:ff67?
 ([2a0c:5a80:3506:3400:69b5:c807:1d52:ff67])
 by smtp.gmail.com with ESMTPSA id
 bl20-20020adfe254000000b001f1fa450a3asm5746897wrb.72.2022.03.10.02.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 02:09:21 -0800 (PST)
Message-ID: <4650269bd52046fce571510710ab2b900aa3d404.camel@redhat.com>
Subject: Re: [PATCH v2 1/4] util/thread-pool: Fix thread pool freeing locking
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Date: Thu, 10 Mar 2022 11:09:20 +0100
In-Reply-To: <YinC7yUHgR+Ing+l@stefanha-x1.localdomain>
References: <20220303145822.518887-1-nsaenzju@redhat.com>
 <20220303145822.518887-2-nsaenzju@redhat.com>
 <YinC7yUHgR+Ing+l@stefanha-x1.localdomain>
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsaenzju@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=nsaenzju@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com,
 qemu-block@nongnu.org, michael.roth@amd.com, mtosatti@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, eduardo@habkost.net,
 hreitz@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2022-03-10 at 09:20 +0000, Stefan Hajnoczi wrote:
> On Thu, Mar 03, 2022 at 03:58:19PM +0100, Nicolas Saenz Julienne wrote:
> > Upon freeing a thread pool we need to get rid of any remaining worker.
> > This is achieved by setting the thread pool's topping flag, waking the
> 
> s/topping/stopping/
> 
> > workers up, and waiting for them to exit one by one. The problem is that
> > currently all this process happens with the thread pool lock held,
> > effectively blocking the workers from exiting.
> > 
> > So let's release the thread pool lock after signaling a worker thread
> > that it's time to exit to give it a chance to do so.
> > 
> > Fixes: f7311ccc63 ("threadpool: add thread_pool_new() and thread_pool_free()")
> > Signed-off-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>
> > ---
> >  util/thread-pool.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/util/thread-pool.c b/util/thread-pool.c
> > index d763cea505..fdb43c2d3b 100644
> > --- a/util/thread-pool.c
> > +++ b/util/thread-pool.c
> > @@ -339,7 +339,9 @@ void thread_pool_free(ThreadPool *pool)
> >      pool->stopping = true;
> >      while (pool->cur_threads > 0) {
> >          qemu_sem_post(&pool->sem);
> > +        qemu_mutex_unlock(&pool->lock);
> >          qemu_cond_wait(&pool->worker_stopped, &pool->lock);
> > +        qemu_mutex_lock(&pool->lock);
> 
> This patch looks incorrect. qemu_cond_wait() (and pthread_cond_wait())
> take a mutex as the second argument. This mutex is released and the
> thread blocks to wait (this is done atomically with respect to the
> condvar check so there are no races).

Sorry I completely missed that. It was a late addition, should've thought it
trough. Patch #4 also needs to take this into account as I follow the same
pattern.

Thanks,

-- 
Nicolás Sáenz


