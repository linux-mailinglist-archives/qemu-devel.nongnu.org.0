Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7242B2C17B9
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 22:36:23 +0100 (CET)
Received: from localhost ([::1]:54036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khJVW-0005bF-Ih
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 16:36:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1khJUD-00044z-3r
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 16:35:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1khJUB-0001aF-Ds
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 16:35:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606167297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NKWnkcuVA+AVztnrzDrZn1cQck6yvf2TauhDH/EtVCM=;
 b=Vl7TD2dvUNP/6EgsLyI5TbFCtUBHVJcyvduexM0ehur2RbWXzcxIMU/DVooZGm58zRukcd
 OX6GtI5k7sEopWo6DGii9tdYc+jS/wat6pNX+bdEneJCO+USS2p72T9If+EZIi7dXRUg+o
 h8R30plmBZCfN6M4EeyXOukf44Tkgac=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-EnmPOibrOMWehYYw8WmPQA-1; Mon, 23 Nov 2020 16:34:55 -0500
X-MC-Unique: EnmPOibrOMWehYYw8WmPQA-1
Received: by mail-qv1-f70.google.com with SMTP id dp12so13917568qvb.2
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 13:34:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NKWnkcuVA+AVztnrzDrZn1cQck6yvf2TauhDH/EtVCM=;
 b=GmEvG1mOcLnz2N2aJYKhjTm1MSJBdc2bRF5fUlrEYZjEZ+CC7oVEcuEjYDXJW5HJpA
 DS1oxU0hIdKHqdrc05ia33BkAhF/98i6CmV6mo41F5MUZ9PSJtW9gYevPHxTblFo8vM7
 Y7uxOYAF/LW37wK5kwkPpy8ImXiqR0CqbInuy7kpBi4MIgn4mtEDQVXyqBD5kau2e4dR
 XXPkMXWYexHaBlTE/rGZOagJW9OvZmGH3zQxVbnDjjMmtibnOzZxGXNEuormZCQfGtmH
 /VOiUvAswI180gc9QdO0I2VhiC/IVHpC5MyBrC9isvNi5xNQeZDRiXYUL/eO8rlfHSQO
 BUvg==
X-Gm-Message-State: AOAM532wNp9DDIXWUV0btEbdELWZHITJkjn6LZrzuhCWNuewu6FATAQe
 OtCayg/uoYaVNhQyBT4TmidRZYrAB/3Ncw2TjcmNMczQU4LwmwEhB+YvDC4IN/Thlg2wCX0GZfc
 lDk4qpdBAP85J0DE=
X-Received: by 2002:a0c:a959:: with SMTP id z25mr1471928qva.51.1606167295312; 
 Mon, 23 Nov 2020 13:34:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwStHtOqtNz0Sa/F7J10OWnsnylwZkS7OweTJ+fICVUbfgyjGAaJF5m4YEq4VjQ2l6XPC/D/g==
X-Received: by 2002:a0c:a959:: with SMTP id z25mr1471885qva.51.1606167294958; 
 Mon, 23 Nov 2020 13:34:54 -0800 (PST)
Received: from xz-x1 ([142.126.81.247])
 by smtp.gmail.com with ESMTPSA id r127sm10920386qke.64.2020.11.23.13.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 13:34:54 -0800 (PST)
Date: Mon, 23 Nov 2020 16:34:43 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v3 3/7] support UFFD write fault processing in
 ram_save_iterate()
Message-ID: <20201123213443.GE60522@xz-x1>
References: <20201119125940.20017-1-andrey.gruzdev@virtuozzo.com>
 <20201119125940.20017-4-andrey.gruzdev@virtuozzo.com>
 <20201119182516.GB6538@xz-x1>
 <1e35a550-a6a0-fbe2-ac8d-6844ce23b3fb@virtuozzo.com>
 <20201120150703.GE32525@xz-x1>
 <2797b4b6-b083-750f-385b-f0aa09730251@virtuozzo.com>
 <20201120164316.GC60522@xz-x1>
 <c222b7ca-9368-3adc-00fd-5261216f7df1@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <c222b7ca-9368-3adc-00fd-5261216f7df1@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URG_BIZ=0.573 autolearn=no autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 20, 2020 at 07:53:34PM +0300, Andrey Gruzdev wrote:
> On 20.11.2020 19:43, Peter Xu wrote:
> > On Fri, Nov 20, 2020 at 07:15:07PM +0300, Andrey Gruzdev wrote:
> > > Yeah, I think we can re-use the postcopy queue code for faulting pages. I'm
> > > worring a little about some additional overhead dealing with urgent request
> > > semaphore. Also, the code won't change a lot, something like:
> > > 
> > > [...]
> > >          /* In case of 'write-tracking' migration we first try
> > >           * to poll UFFD and sse if we have write page fault event */
> > >          poll_fault_page(rs);
> > > 
> > >          again = true;
> > >          found = get_queued_page(rs, &pss);
> > > 
> > >          if (!found) {
> > >              /* priority queue empty, so just search for something dirty */
> > >              found = find_dirty_block(rs, &pss, &again);
> > >          }
> > > [...]
> > 
> > Could I ask what's the "urgent request semaphore"?  Thanks,
> > 
> 
> These function use it (the correct name is 'rate_limit_sem'):
> 
> void migration_make_urgent_request(void)
> {
>     qemu_sem_post(&migrate_get_current()->rate_limit_sem);
> }
> 
> void migration_consume_urgent_request(void)
> {
>     qemu_sem_wait(&migrate_get_current()->rate_limit_sem);
> }
> 
> They are called from ram_save_queue_pages and unqueue_page, accordingly, to
> control migration rate limiter.
> 
> bool migration_rate_limit(void)
> {
> [...]
>         /*
>          * Wait for a delay to do rate limiting OR
>          * something urgent to post the semaphore.
>          */
>         int ms = s->iteration_start_time + BUFFER_DELAY - now;
>         trace_migration_rate_limit_pre(ms);
>         if (qemu_sem_timedwait(&s->rate_limit_sem, ms) == 0) {
>             /*
>              * We were woken by one or more urgent things but
>              * the timedwait will have consumed one of them.
>              * The service routine for the urgent wake will dec
>              * the semaphore itself for each item it consumes,
>              * so add this one we just eat back.
>              */
>             qemu_sem_post(&s->rate_limit_sem);
>             urgent = true;
>         }
> [...]
> }
> 

Hmm... Why its overhead could be a problem?  If it's an overhead that can be
avoided, then postcopy might want that too.

The thing is I really feel like the snapshot logic can leverage the whole idea
of existing postcopy (like get_queued_page/unqueue_page; it's probably due to
the fact that both of them want to "migrate some more urgent pages than the
background migration, due to either missing/wrprotected pages"), but I might
have something missing.

Thanks,

-- 
Peter Xu


