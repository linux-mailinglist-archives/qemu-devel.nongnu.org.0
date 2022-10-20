Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FA46066D3
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 19:14:57 +0200 (CEST)
Received: from localhost ([::1]:47220 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZ8C-0005iz-JL
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:14:56 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYrs-0002cu-RN
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:58:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1olYJU-0004oa-7O
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:22:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1olYJO-0005bs-MB
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:22:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666282944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RNARqd3TTnpsS2K+Ui74O71+3y02cV+ALRG8OMpzh8g=;
 b=cqvp443kdmfuBJJfLsq6JPRLlvEyO4HOD2jEZLSuyg+33CXyXM6VTCDcjtF1UcZ+3Gs1z2
 q1MW/wKbe5N9FQjQVyf5R+sHHpiVUJrzkFUuxkj8hTn/7uT45fgPlnldJfzLaWfGkYr1sF
 ny39quGMVfSL/lj57UMuWOXMOOTQrCY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-140-R4WSece6N0yz0fyD7m1jRg-1; Thu, 20 Oct 2022 12:22:22 -0400
X-MC-Unique: R4WSece6N0yz0fyD7m1jRg-1
Received: by mail-wr1-f70.google.com with SMTP id
 t12-20020adfa2cc000000b0022adcbb248bso6878413wra.1
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 09:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RNARqd3TTnpsS2K+Ui74O71+3y02cV+ALRG8OMpzh8g=;
 b=Fcfia4NG8d6BDtJA7X/dG4j0Cx9uEBf/yj3O03kJ0xH+vpH9oFMvPK3MmoDGjA/+FV
 p5MbdPBPA0E+8MZLW1TTefW6TmV9oer/L5fpPTI5LcUg5hdCXCWfzZt+zqeNw3lRayZ3
 XBzIc4G4+ButZZXnGCtL9H6GW3Q7wUwd0fNZCmTXOaIZ0+65Up/DbkMf3ENyzynnis7+
 guwqcdfSGfYdLg0zXMfkkgqey9YfUov/WKPjkLZRurXB7y9E0m85WvCZjGKexk+j13An
 ofXri2+hYPiVOD32q5D3IqXGgiCy0f7sb7EVh622OdAtoU4HcNZbJSoi1zsJlJqfvSOj
 v4YQ==
X-Gm-Message-State: ACrzQf28d6+ke2yutaU7Yc4X/HT/nM5reH+ip3mmaHbytdSOtAd7fg8p
 niMyauOqLvxInd6KGANcwJB/JYWyGvyZPZVNAVy9PFild+igZZuOt1ugdAnfA1gR9wBYlcr0XzF
 wqjpzqJsv3Tp2LhQ=
X-Received: by 2002:a5d:4bcd:0:b0:22c:dfba:6b61 with SMTP id
 l13-20020a5d4bcd000000b0022cdfba6b61mr8907696wrt.424.1666282940446; 
 Thu, 20 Oct 2022 09:22:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4Dvp7CwzQHHEtn6eNBvendRByORq7IAPX/vtSg+91ZfVr06KDBRXeBuo9FQk4YJQV1jrum4w==
X-Received: by 2002:a5d:4bcd:0:b0:22c:dfba:6b61 with SMTP id
 l13-20020a5d4bcd000000b0022cdfba6b61mr8907677wrt.424.1666282940159; 
 Thu, 20 Oct 2022 09:22:20 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056000129000b0022dc6e76bbdsm16779360wrx.46.2022.10.20.09.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 09:22:19 -0700 (PDT)
Date: Thu, 20 Oct 2022 17:22:17 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, quintela@redhat.com
Subject: Re: [PATCH 2/2] thread-pool: use ThreadPool from the running thread
Message-ID: <Y1F1uU5bAQw80mG0@work-vm>
References: <20220609134452.1146309-1-eesposit@redhat.com>
 <20220609134452.1146309-3-eesposit@redhat.com>
 <YzW6FkfT9LT7aE7d@redhat.com>
 <29c33add-81ca-5a16-a02a-d2a0c5bfaf88@redhat.com>
 <YzcPBFcf3idA4MLH@redhat.com>
 <dc4bf265-4cd9-ef29-2e3f-d15e779bd8db@redhat.com>
 <Y1Frq6R4DFOPWyIY@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1Frq6R4DFOPWyIY@fedora>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> On Mon, Oct 03, 2022 at 10:52:33AM +0200, Emanuele Giuseppe Esposito wrote:
> > 
> > 
> > Am 30/09/2022 um 17:45 schrieb Kevin Wolf:
> > > Am 30.09.2022 um 14:17 hat Emanuele Giuseppe Esposito geschrieben:
> > >> Am 29/09/2022 um 17:30 schrieb Kevin Wolf:
> > >>> Am 09.06.2022 um 15:44 hat Emanuele Giuseppe Esposito geschrieben:
> > >>>> Remove usage of aio_context_acquire by always submitting work items
> > >>>> to the current thread's ThreadPool.
> > >>>>
> > >>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > >>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> > >>>
> > >>> The thread pool is used by things outside of the file-* block drivers,
> > >>> too. Even outside the block layer. Not all of these seem to submit work
> > >>> in the same thread.
> > >>>
> > >>>
> > >>> For example:
> > >>>
> > >>> postcopy_ram_listen_thread() -> qemu_loadvm_state_main() ->
> > >>> qemu_loadvm_section_start_full() -> vmstate_load() ->
> > >>> vmstate_load_state() -> spapr_nvdimm_flush_post_load(), which has:
> > >>>
> > >>> ThreadPool *pool = aio_get_thread_pool(qemu_get_aio_context());
>                          ^^^^^^^^^^^^^^^^^^^
> 
> aio_get_thread_pool() isn't thread safe either:
> 
>   ThreadPool *aio_get_thread_pool(AioContext *ctx)
>   {
>       if (!ctx->thread_pool) {
>           ctx->thread_pool = thread_pool_new(ctx);
> 	  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> Two threads could race in aio_get_thread_pool().
> 
> I think post-copy is broken here: it's calling code that was only
> designed to be called from the main loop thread.
> 
> I have CCed Juan and David.

In theory the path that you describe there shouldn't happen - although
there is perhaps not enough protection on the load side to stop it
happening if presented with a bad stream.
This is documented in docs/devel/migration.rst under 'Destination
behaviour'; but to recap, during postcopy load we have a problem that we
need to be able to load incoming iterative (ie. RAM) pages during the
loading of normal devices, because the loading of a device may access
RAM that's not yet been transferred.

To do that, the device state of all the non-iterative devices (which I
think includes your spapr_nvdimm) is serialised into a separate
migration stream and sent as a 'package'.

We read the package off the stream on the main thread, but don't process
it until we fire off the 'listen' thread - which you spotted the
creation of above; the listen thread now takes over reading the
migration stream to process RAM pages, and since it's in the same
format, it calls qemu_loadvm_state_main() - but it doesn't expect
any devices in that other than the RAM devices; it's just expecting RAM.

In parallel with that, the main thread carries on loading the contents
of the 'package' - and that contains your spapr_nvdimm device (and any
other 'normal' devices); but that's OK because that's the main thread.

Now if something was very broken and sent a header for the spapr-nvdimm
down the main thread rather than into the package then, yes, we'd
trigger your case, but that shouldn't happen.

Dave

> > >>> ...
> > >>> thread_pool_submit_aio(pool, flush_worker_cb, state,
> > >>>                        spapr_nvdimm_flush_completion_cb, state);
> > >>>
> > >>> So it seems to me that we may be submitting work for the main thread
> > >>> from a postcopy migration thread.
> > >>>
> > >>> I believe the other direct callers of thread_pool_submit_aio() all
> > >>> submit work for the main thread and also run in the main thread.
> > >>>
> > >>>
> > >>> For thread_pool_submit_co(), pr_manager_execute() calls it with the pool
> > >>> it gets passed as a parameter. This is still bdrv_get_aio_context(bs) in
> > >>> hdev_co_ioctl() and should probably be changed the same way as for the
> > >>> AIO call in file-posix, i.e. use qemu_get_current_aio_context().
> > >>>
> > >>>
> > >>> We could consider either asserting in thread_pool_submit_aio() that we
> > >>> are really in the expected thread, or like I suggested for LinuxAio drop
> > >>> the pool parameter and always get it from the current thread (obviously
> > >>> this is only possible if migration could in fact schedule the work on
> > >>> its current thread - if it schedules it on the main thread and then
> > >>> exits the migration thread (which destroys the thread pool), that
> > >>> wouldn't be good).
> > >>
> > >> Dumb question: why not extend the already-existing poll->lock to cover
> > >> also the necessary fields like pool->head that are accessed by other
> > >> threads (only case I could find with thread_pool_submit_aio is the one
> > >> you pointed above)?
> > > 
> > > Other people are more familiar with this code, but I believe this could
> > > have performance implications. I seem to remember that this code is
> > > careful to avoid locking to synchronise between worker threads and the
> > > main thread.
> > > 
> > > But looking at the patch again, I have actually a dumb question, too:
> > > The locking you're removing is in thread_pool_completion_bh(). As this
> > > is a BH, it's running the the ThreadPool's context either way, no matter
> > > which thread called thread_pool_submit_aio().
> > > 
> > > I'm not sure what this aio_context_acquire/release pair is actually
> > > supposed to protect. Paolo's commit 1919631e6b5 introduced it. Was it
> > > just more careful than it needs to be?
> > > 
> > 
> > I think the goal is still to protect pool->head, but if so the
> > aiocontext lock is put in the wrong place, because as you said the bh is
> > always run in the thread pool context. Otherwise it seems to make no sense.
> > 
> > On the other side, thread_pool_submit_aio could be called by other
> > threads on behalf of the main loop, which means pool->head could be
> > modified (iothread calls thread_pool_submit_aio) while being read by the
> > main loop (another worker thread schedules thread_pool_completion_bh).
> > 
> > What are the performance implications? I mean, if the aiocontext lock in
> > the bh is actually useful and the bh really has to wait to take it,
> > being taken in much more places throughout the block layer won't be
> > better than extending the poll->lock I guess.
> 
> thread_pool_submit_aio() is missing documentation on how it is supposed
> to be called.
> 
> Taking pool->lock is conservative and fine in the short-term.
> 
> In the longer term we need to clarify how thread_pool_submit_aio() is
> supposed to be used and remove locking to protect pool->head if
> possible.
> 
> A bunch of the event loop APIs are thread-safe (aio_set_fd_handler(),
> qemu_schedule_bh(), etc) so it's somewhat natural to make
> thread_pool_submit_aio() thread-safe too. However, it would be nice to
> avoid synchronization and existing callers mostly call it from the same
> event loop thread that runs the BH and we can avoid locking in that
> case.
> 
> Stefan


-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


