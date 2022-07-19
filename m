Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B545857A34E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 17:37:31 +0200 (CEST)
Received: from localhost ([::1]:56624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDpHu-000276-2i
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 11:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDpC7-0003rV-KA
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 11:31:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDpC3-00036q-2q
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 11:31:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658244686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+HF5+uPTy20pTsDtS7vtfASq3jX2g/kY7B3ImM40N28=;
 b=e4nP+MOKPJhVzZBUPmf0Qxxxa74ppMhKQs2FRW/UCibVg5oAtqhLbyGlNwf7t3IiJ9d0h8
 KFIsNcvmJ8x1Jbe+3AC3ImzJuvCGAFDFLdE47ZEHAK48bXsmrT2+pbvQs63HXRM/XGNAkK
 zt8Ns8R5oi03BwjdSi2vHU2bQujB0s8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-u3SHo1ZpPlmeP85GysoV7A-1; Tue, 19 Jul 2022 11:31:24 -0400
X-MC-Unique: u3SHo1ZpPlmeP85GysoV7A-1
Received: by mail-wm1-f69.google.com with SMTP id
 v123-20020a1cac81000000b003a02a3f0beeso10422432wme.3
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 08:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=+HF5+uPTy20pTsDtS7vtfASq3jX2g/kY7B3ImM40N28=;
 b=P4mHe3EqRbO0m6evwgmjEIQuYp4VsltjnupBayxvHhPnPmXKv1/oCYEUynJITJuQo1
 Xnf3BudtqTLAi1exQJ/NOjocuv0bTBqo5Vtelfrl4P3r5xREWy0fZCzwkjcjfPlBm7y2
 2wdjuF4Bcbb+jhtKTaK2cjKB/8ibYDS6pPwuKHSGrD3gM6JS0KodfLcIBFC+s0FOFW4M
 dhUrUILtK6y+rud5G2uCxchzcr1Oih3R1tVTvfQLXw96qIDQPezymrVSHWj2TIqm/sAW
 Ag8gxUb7rYXhbmKpOTzKxLDTuHqzzKrbaA1s2A1qsRbXzX/K9mwkZ9/4aA1zebLpMCfj
 ONyw==
X-Gm-Message-State: AJIora9P3lV2SjUQJKbLAWL1+ZnbjlshJb+AdzVBDpsISlvzpQMNAuaG
 4LtAbXAxsIYbVyBAciNKl/paKIYHVVxkW337RMUts+Qj6EadFnLxL8YOBNyi7wDxPhB35J78zTX
 JMHIL/mqIksAoXTI=
X-Received: by 2002:a05:6000:178c:b0:21d:b6fe:73be with SMTP id
 e12-20020a056000178c00b0021db6fe73bemr27961461wrg.56.1658244682669; 
 Tue, 19 Jul 2022 08:31:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v3iZBT95tbC9va29Mrinke+a0/wQ91HoSQjiORR58RZ9wkBVUj9zJfn+Q2M4OyloQcabWwZg==
X-Received: by 2002:a05:6000:178c:b0:21d:b6fe:73be with SMTP id
 e12-20020a056000178c00b0021db6fe73bemr27961435wrg.56.1658244682392; 
 Tue, 19 Jul 2022 08:31:22 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 co18-20020a0560000a1200b0021b5861eaf7sm13551076wrb.3.2022.07.19.08.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 08:31:21 -0700 (PDT)
Date: Tue, 19 Jul 2022 16:31:20 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH v9 02/14] migration: Postcopy preemption preparation on
 channel creation
Message-ID: <YtbOSFJNH3NmpDPn@work-vm>
References: <20220707185342.26794-1-peterx@redhat.com>
 <20220707185502.27149-1-peterx@redhat.com>
 <YtbKpc1bZu71Cpoa@work-vm> <YtbM+KJRvVebNh/e@xz-m1.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YtbM+KJRvVebNh/e@xz-m1.local>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

* Peter Xu (peterx@redhat.com) wrote:
> On Tue, Jul 19, 2022 at 04:15:49PM +0100, Dr. David Alan Gilbert wrote:
> > * Peter Xu (peterx@redhat.com) wrote:
> > > Create a new socket for postcopy to be prepared to send postcopy requested
> > > pages via this specific channel, so as to not get blocked by precopy pages.
> > > 
> > > A new thread is also created on dest qemu to receive data from this new channel
> > > based on the ram_load_postcopy() routine.
> > > 
> > > The ram_load_postcopy(POSTCOPY) branch and the thread has not started to
> > > function, and that'll be done in follow up patches.
> > > 
> > > Cleanup the new sockets on both src/dst QEMUs, meanwhile look after the new
> > > thread too to make sure it'll be recycled properly.
> > 
> > I'm hitting a CI failure here:
> > https://gitlab.com/dagrh/qemu/-/jobs/2741659845
> > 
> > c.o -c ../migration/migration.c
> > ../migration/migration.c: In function ‘migration_ioc_process_incoming’:
> > ../migration/migration.c:766:8: error: ‘start_migration’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
> >   766 |     if (start_migration) {
> >       |        ^
> > 
> > > Reviewed-by: Daniel P. Berrang?? <berrange@redhat.com>
> > > Reviewed-by: Juan Quintela <quintela@redhat.com>
> > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > > ---
> > >  migration/migration.c    | 62 +++++++++++++++++++++++----
> > >  migration/migration.h    |  8 ++++
> > >  migration/postcopy-ram.c | 92 ++++++++++++++++++++++++++++++++++++++--
> > >  migration/postcopy-ram.h | 10 +++++
> > >  migration/ram.c          | 25 ++++++++---
> > >  migration/ram.h          |  4 +-
> > >  migration/savevm.c       | 20 ++++-----
> > >  migration/socket.c       | 22 +++++++++-
> > >  migration/socket.h       |  1 +
> > >  migration/trace-events   |  5 ++-
> > >  10 files changed, 218 insertions(+), 31 deletions(-)
> > > 
> > > diff --git a/migration/migration.c b/migration/migration.c
> > > index ce7bb68cdc..9484fec0b2 100644
> > > --- a/migration/migration.c
> > > +++ b/migration/migration.c
> > > @@ -321,6 +321,12 @@ void migration_incoming_state_destroy(void)
> > >          mis->page_requested = NULL;
> > >      }
> > >  
> > > +    if (mis->postcopy_qemufile_dst) {
> > > +        migration_ioc_unregister_yank_from_file(mis->postcopy_qemufile_dst);
> > > +        qemu_fclose(mis->postcopy_qemufile_dst);
> > > +        mis->postcopy_qemufile_dst = NULL;
> > > +    }
> > > +
> > >      yank_unregister_instance(MIGRATION_YANK_INSTANCE);
> > >  }
> > >  
> > > @@ -714,15 +720,21 @@ void migration_fd_process_incoming(QEMUFile *f, Error **errp)
> > >      migration_incoming_process();
> > >  }
> > >  
> > > +static bool migration_needs_multiple_sockets(void)
> > > +{
> > > +    return migrate_use_multifd() || migrate_postcopy_preempt();
> > > +}
> > > +
> > >  void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
> > >  {
> > >      MigrationIncomingState *mis = migration_incoming_get_current();
> > >      Error *local_err = NULL;
> > >      bool start_migration;
> > > +    QEMUFile *f;
> > >  
> > >      if (!mis->from_src_file) {
> > >          /* The first connection (multifd may have multiple) */
> > > -        QEMUFile *f = qemu_file_new_input(ioc);
> > > +        f = qemu_file_new_input(ioc);
> > >  
> > >          if (!migration_incoming_setup(f, errp)) {
> > >              return;
> > > @@ -730,13 +742,18 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
> > >  
> > >          /*
> > >           * Common migration only needs one channel, so we can start
> > > -         * right now.  Multifd needs more than one channel, we wait.
> > > +         * right now.  Some features need more than one channel, we wait.
> > >           */
> > > -        start_migration = !migrate_use_multifd();
> > > +        start_migration = !migration_needs_multiple_sockets();
> > >      } else {
> > >          /* Multiple connections */
> > > -        assert(migrate_use_multifd());
> > > -        start_migration = multifd_recv_new_channel(ioc, &local_err);
> > > +        assert(migration_needs_multiple_sockets());
> > > +        if (migrate_use_multifd()) {
> > > +            start_migration = multifd_recv_new_channel(ioc, &local_err);
> > > +        } else if (migrate_postcopy_preempt()) {
> > > +            f = qemu_file_new_input(ioc);
> > > +            start_migration = postcopy_preempt_new_channel(mis, f);
> > > +        }
> > 
> > So that doesn't always set start_migration?
> 
> Logically it should, because we asserted on
> migration_needs_multiple_sockets(), while multifd and preempt mode are the
> only two that may need multiple sockets.  So it must go into either of
> them.
> 
> A fix could be like this:
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 76cf2a72c0..7c7e529ca7 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -753,7 +753,8 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
>          assert(migration_needs_multiple_sockets());
>          if (migrate_use_multifd()) {
>              start_migration = multifd_recv_new_channel(ioc, &local_err);
> -        } else if (migrate_postcopy_preempt()) {
> +        } else {
> +            assert(migrate_postcopy_preempt());
>              f = qemu_file_new_input(ioc);
>              start_migration = postcopy_preempt_new_channel(mis, f);
>          }
> 
> Or we simply set start_migration=false as initial value.
> 
> Should I repost the series?

No just post a fixup and I'll merge it.

Dave

> Thanks,
> 
> -- 
> Peter Xu
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


