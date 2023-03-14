Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBCB6B9D62
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 18:48:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc8ky-00059t-BG; Tue, 14 Mar 2023 13:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pc8kw-00059l-Sb
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 13:48:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pc8ku-0004By-Nd
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 13:48:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678816092;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7/cx7j8ixS8AZJzkTNP1ovGs6cS3WaV+4P4KRdBpMP4=;
 b=QqPyBxbT+0aiYUH8+fUXDeSRNmeQ9pKO4CQuwZ2q6m8gvMv5zH1zMcKX28jQfyEgyUOTg/
 zMQEJxPFBbOeiJRvStSwbgAcxcmNPoozf+Yf2vAP0XLBfMi5ZFF8VW2l9Z+SOjmJJdOrAp
 Ow64sYnXzoKkLs5n2Hr8nehh8UcA7mo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328--X0k98qeNxKP-9xVW0pdoA-1; Tue, 14 Mar 2023 13:48:08 -0400
X-MC-Unique: -X0k98qeNxKP-9xVW0pdoA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26CE28019DF;
 Tue, 14 Mar 2023 17:48:08 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 01DD52166B26;
 Tue, 14 Mar 2023 17:48:06 +0000 (UTC)
Date: Tue, 14 Mar 2023 17:48:04 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH] tests/qtest/migration-test: Disable
 migration/multifd/tcp/plain/cancel
Message-ID: <ZBCzVF2FjU1vsy+b@redhat.com>
References: <20230302172211.4146376-1-peter.maydell@linaro.org>
 <CAFEAcA_Pf11W3FuaLHvzQ7yrkh6KC556HDfvXpZYaHqN4iMvsg@mail.gmail.com>
 <CAFEAcA92kLBwgJoAc9HCr4oX=S0V=RmdO4+rOnKPJn32hQAf4Q@mail.gmail.com>
 <CAFEAcA-UaJsoA-rqmwEqh1j6xcCc=ifCctvN-jaW40VckRdp9Q@mail.gmail.com>
 <CAFEAcA-q1UwPePdHTzXNSX4i6Urh3j6h51kymy6=7SzDAFU87w@mail.gmail.com>
 <ZBBIaX+cZD5Ud2wQ@work-vm> <ZBCk6rMT5wmxwIuZ@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZBCk6rMT5wmxwIuZ@x1n>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Mar 14, 2023 at 12:46:34PM -0400, Peter Xu wrote:
> On Tue, Mar 14, 2023 at 10:11:53AM +0000, Dr. David Alan Gilbert wrote:
> > OK, I think I kind of see what's happening here, one for Peter Xu.
> > If I'm right it's a race something like:
> >   a) The test harness tells the source it wants to enter postcopy
> >   b) The harness then waits for the source to stop
> >   c) ... and the dest to start 
> > 
> >   It's blocked on one of b&c but can't tell which
> > 
> >   d) The main thread in the dest is waiting for the postcopy recovery fd
> >     to be opened
> >   e) But I think the source is still trying to send normal precopy RAM
> >     and perhaps hasn't got around yet to opening that socket yet????
> >   f) But I think the dest isn't reading from the main channel at that
> >     point because of (d)
> 
> I think this analysis is spot on.  Thanks Dave!
> 
> Src qemu does this with below order:
> 
>         1. setup preempt channel
>         1.1. connect()  --> this is done in another thread
>         1.2. sem_wait(postcopy_qemufile_src_sem) --> make sure it's created
>         2. prepare postcopy package (LISTEN, non-iterable states, ping-3, RUN)
>         3. send the package
> 
> So logically the sequence is guaranteed so that when LISTEN cmd is
> processed, we should have connect()ed already.
> 
> But I think there's one thing missing on dest.. since the accept() on the
> dest node should be run in the main thread, meanwhile the LISTEN cmd is
> also processed on the main thread, even if the listening socket is trying
> to kick the main thread to do the accept() (so the connection has
> established) it won't be able to kick the final accept() as main thread is
> waiting in the semaphore.  That caused a deadlock.
> 
> A simple fix I can think of is moving the wait channel operation outside
> the main thread, e.g. to the preempt thread.
> 
> I've attached that simple fix.  Peter, is it easy to verify it?  I'm not
> sure the reproducability, fine by me too if it's easier to just disable
> preempt tests for 8.0 release.
> 
> Thanks,
> 
> -- 
> Peter Xu

> From 92f2f90d2eb270ca158479bfd9a5a855ec7ddf4d Mon Sep 17 00:00:00 2001
> From: Peter Xu <peterx@redhat.com>
> Date: Tue, 14 Mar 2023 12:24:02 -0400
> Subject: [PATCH] migration: Wait on preempt channel in preempt thread
> 
> QEMU main thread will wait until dest preempt channel established during
> processing the LISTEN command (within the whole postcopy PACKAGED data), by
> waiting on the semaphore postcopy_qemufile_dst_done.
> 
> That's racy, because it's possible that the dest QEMU main thread hasn't
> yet accept()ed the new connection when processing the LISTEN event.  The
> sem_wait() will yield the main thread without being able to run anything
> else including the accept() of the new socket, which can cause deadlock
> within the main thread.
> 
> To avoid the race, move the "wait channel" from main thread to the preempt
> thread right at the start.
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Fixes: 5655aab079 ("migration: Postpone postcopy preempt channel to be after main")
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/postcopy-ram.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


This description of the bug & proposed fixed matches what I could
infer as the flaw from the stack trace's Peter provided.

> 
> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index f54f44d899..41c0713650 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -1197,11 +1197,6 @@ int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
>      }
>  
>      if (migrate_postcopy_preempt()) {
> -        /*
> -         * The preempt channel is established in asynchronous way.  Wait
> -         * for its completion.
> -         */
> -        qemu_sem_wait(&mis->postcopy_qemufile_dst_done);
>          /*
>           * This thread needs to be created after the temp pages because
>           * it'll fetch RAM_CHANNEL_POSTCOPY PostcopyTmpPage immediately.
> @@ -1668,6 +1663,12 @@ void *postcopy_preempt_thread(void *opaque)
>  
>      qemu_sem_post(&mis->thread_sync_sem);
>  
> +    /*
> +     * The preempt channel is established in asynchronous way.  Wait
> +     * for its completion.
> +     */
> +    qemu_sem_wait(&mis->postcopy_qemufile_dst_done);
> +
>      /* Sending RAM_SAVE_FLAG_EOS to terminate this thread */
>      qemu_mutex_lock(&mis->postcopy_prio_thread_mutex);
>      while (1) {
> -- 
> 2.39.1
> 


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


