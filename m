Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251753C8B20
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 20:42:32 +0200 (CEST)
Received: from localhost ([::1]:36074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3jq3-0004yu-6V
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 14:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m3jna-0003Zd-73
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:39:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m3jnW-0006Dw-UH
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:39:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626287993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4iJEWiP8EYnPZqVN8aXx3uLaQc1LOnweAEyoPahWPmk=;
 b=iqXH4O8NyZ9i09Fuq6GLcwHoN3MuK7Evg1sQC7Pf5IdvodNVJWK+dxqQo/pOBIKwYLopww
 DSWeIHsN0rPH8w6mJMBgOl1JLmhtu6jsL2+7sYxOWfWHpdlPT/9SJ9j+PFD2Rh5yZ+2gAS
 BpRBsvEf8uKM2OkuHjhFsd8VnLuM5HQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-hSFc5IApMoip9DoAq4bjEg-1; Wed, 14 Jul 2021 14:39:52 -0400
X-MC-Unique: hSFc5IApMoip9DoAq4bjEg-1
Received: by mail-wm1-f71.google.com with SMTP id
 o21-20020a05600c4fd5b029023448cbd285so494789wmq.2
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 11:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=4iJEWiP8EYnPZqVN8aXx3uLaQc1LOnweAEyoPahWPmk=;
 b=G4c99Z38KImwCxGiwkFnUWwAoepL1RKJMTuRaStlX7RRvl70Pm2mlsIKfhnveIrnz+
 eiRo99d1MWG4co1O4Mudp2k6ciIkg7nCPnvUa20suitLz4NPDDMERo1e0V8853QjmipU
 11HCDct2jtuNWdM0N5Wd3w1OTq5jUVXEhdaQ0sPkMSQNlNY6hJzc7ttAUmwEYODFIu99
 6JqlV9yhVVq+tcdcO1Qvbd53US9V7NZszvkUOZqr6BJWJQGL06nZ55H2ZEWWbeo4uwQp
 9BuUQH/7MN/UY5PJa9zYdRLMW5iEzTRhbSbenNEdYCCPN1/X55SkOeGBiPDxM8sd2xYU
 UK3w==
X-Gm-Message-State: AOAM532vB/nX9fX2dtyoHsuFm3DhFjUeAe85NAKnQCGvQ8eZlGVOxvRa
 EdpMEDhSWH3vtIzPIBwH345vdI58EBBwdv11CLmiDs400NLOm9DtKLipfnpFgtYIl07wFBhskIN
 /j2/Mqw91nMk0Nzk=
X-Received: by 2002:adf:ebc6:: with SMTP id v6mr14670129wrn.398.1626287991032; 
 Wed, 14 Jul 2021 11:39:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRVRJtPuzVqfgH5XNiF8eYpiBb0TvZP6t0cB27HT4YvoL31znaqBWbtVxaTzIQCqTDwxOKMw==
X-Received: by 2002:adf:ebc6:: with SMTP id v6mr14670091wrn.398.1626287990727; 
 Wed, 14 Jul 2021 11:39:50 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id r67sm6187364wma.6.2021.07.14.11.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 11:39:49 -0700 (PDT)
Date: Wed, 14 Jul 2021 19:39:46 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Kunkun Jiang <jiangkunkun@huawei.com>
Subject: Re: [PATCH 1/2] qapi/run-state: Add a new shutdown cause
 'migration-completed'
Message-ID: <YO8vcoJcRfyCqj54@work-vm>
References: <20210705123653.1315-1-jiangkunkun@huawei.com>
 <20210705123653.1315-2-jiangkunkun@huawei.com>
 <YOL/kw0lxn2ggGx4@redhat.com>
 <7b8324e9-85d8-1b14-4e63-308ea2563d56@huawei.com>
 <YOQwA27sg5SOQspC@work-vm>
 <b089db57-486b-fb6f-0b90-8275b0165361@huawei.com>
MIME-Version: 1.0
In-Reply-To: <b089db57-486b-fb6f-0b90-8275b0165361@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, wanghaibin.wang@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Kunkun Jiang (jiangkunkun@huawei.com) wrote:
> On 2021/7/6 18:27, Dr. David Alan Gilbert wrote:
> > * Kunkun Jiang (jiangkunkun@huawei.com) wrote:
> > > Hi Daniel,
> > > 
> > > On 2021/7/5 20:48, Daniel P. Berrangé wrote:
> > > > On Mon, Jul 05, 2021 at 08:36:52PM +0800, Kunkun Jiang wrote:
> > > > > In the current version, the source QEMU process does not automatic
> > > > > exit after a successful migration. Additional action is required,
> > > > > such as sending { "execute": "quit" } or ctrl+c. For simplify, add
> > > > > a new shutdown cause 'migration-completed' to exit the source QEMU
> > > > > process after a successful migration.
> > > > IIUC, 'STATUS_COMPLETED' state is entered on the source host
> > > > once it has finished sending all VM state, and thus does not
> > > > guarantee that the target host has successfully received and
> > > > loaded all VM state.
> > > Thanks for your reply.
> > > 
> > > If the target host doesn't successfully receive and load all VM state,
> > > we can send { "execute": "cont" } to resume the soruce in time to
> > > ensure that VM will not lost?
> > Yes, that's pretty common at the moment;  the failed migration can
> > happen at lots of different points:
> >    a) The last part of the actual migration stream/loading the devices
> >      - that's pretty easy, since the destination hasn't actually got
> >      the full migration stream.
> > 
> >    b) If the migration itself completes, but then the management system
> >      then tries to reconfigure the networking/storage on the destination,
> >      and something goes wrong in that, then it can roll that back and
> >      cont on the source.
> > 
> > So, it's a pretty common type of failure/recovery  - the management
> > application has to be a bit careful not to do anything destructive
> > until as late as possible, so it knows it can switch back.
> Okay， I see.
> > > > Typically a mgmt app will need to directly confirm that the
> > > > target host QEMU has succesfully started running, before it
> > > > will tell the source QEMU to quit.
> > > 'a mgmt app', such as libvirt?
> > Yes, it's currently libvirt that does that; but any of the control
> > things could (it's just libvirt has been going long enough so it knows
> > about lots and lots of nasty cases of migration failure, and recovering
> > properly).
> > 
> > Can you explain why did you want to get the source to automatically
> > quit?  In a real setup where does it help?
> Sorry, my thoughts on live migration scenarios are not comprehensive enough.

That's OK; it takes a little while to understand all of the recovery and
error cases;  people *really* want to recover from a failed migration;
so we try and be very careful about not throwing away the source.

Dave

> Thanks,
> Kunkun Jiang
> > Dave
> > 
> > 
> > > Thanks,
> > > Kunkun Jiang
> > > > So, AFAICT, this automatic exit after STATUS_COMPLETED is
> > > > not safe and could lead to total loss of the running VM in
> > > > error scenarios.
> > > > 
> > > > 
> > > > 
> > > > > Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> > > > > ---
> > > > >    migration/migration.c | 1 +
> > > > >    qapi/run-state.json   | 4 +++-
> > > > >    2 files changed, 4 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/migration/migration.c b/migration/migration.c
> > > > > index 4228635d18..16782c93c2 100644
> > > > > --- a/migration/migration.c
> > > > > +++ b/migration/migration.c
> > > > > @@ -3539,6 +3539,7 @@ static void migration_iteration_finish(MigrationState *s)
> > > > >        case MIGRATION_STATUS_COMPLETED:
> > > > >            migration_calculate_complete(s);
> > > > >            runstate_set(RUN_STATE_POSTMIGRATE);
> > > > > +        qemu_system_shutdown_request(SHUTDOWN_CAUSE_MIGRATION_COMPLETED);
> > > > >            break;
> > > > >        case MIGRATION_STATUS_ACTIVE:
> > > > > diff --git a/qapi/run-state.json b/qapi/run-state.json
> > > > > index 43d66d700f..66aaef4e2b 100644
> > > > > --- a/qapi/run-state.json
> > > > > +++ b/qapi/run-state.json
> > > > > @@ -86,12 +86,14 @@
> > > > >    #                   ignores --no-reboot. This is useful for sanitizing
> > > > >    #                   hypercalls on s390 that are used during kexec/kdump/boot
> > > > >    #
> > > > > +# @migration-completed: Reaction to the successful migration
> > > > > +#
> > > > >    ##
> > > > >    { 'enum': 'ShutdownCause',
> > > > >      # Beware, shutdown_caused_by_guest() depends on enumeration order
> > > > >      'data': [ 'none', 'host-error', 'host-qmp-quit', 'host-qmp-system-reset',
> > > > >                'host-signal', 'host-ui', 'guest-shutdown', 'guest-reset',
> > > > > -            'guest-panic', 'subsystem-reset'] }
> > > > > +            'guest-panic', 'subsystem-reset', 'migration-completed'] }
> > > > >    ##
> > > > >    # @StatusInfo:
> > > > > -- 
> > > > > 2.23.0
> > > > > 
> > > > > 
> > > > Regards,
> > > > Daniel
> > > 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


