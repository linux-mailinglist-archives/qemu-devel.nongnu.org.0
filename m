Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8343E4DA8F6
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 04:33:01 +0100 (CET)
Received: from localhost ([::1]:36960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUKPE-0008Ly-3A
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 23:33:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nUKNX-0007cX-RS
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 23:31:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nUKNU-0002iL-VG
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 23:31:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647401471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dbnZpfFgwDjEjV0jRt8/hkJlM2YyX95y93fiEjRIvs0=;
 b=NUAzPsZHI1WNs7dcsZg9sE4UufShZSdpzW93B5NflfZmj7MnFIQ+Aby1TNQZ2EGWXAzRZP
 MCve8B0dyZrXrAKvOUHVhISSpUzDFe86JMVvb3+P/9wBAiY3mGX8rCY8StPmaJm/cmLIW+
 GISyUarjJKoW1MaBE4jjcwl2rJP73p4=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-cfrPR-mlOYe0y0CpZwrKnw-1; Tue, 15 Mar 2022 23:31:06 -0400
X-MC-Unique: cfrPR-mlOYe0y0CpZwrKnw-1
Received: by mail-pj1-f69.google.com with SMTP id
 c14-20020a17090a674e00b001bf1c750f9bso3390426pjm.9
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 20:31:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=dbnZpfFgwDjEjV0jRt8/hkJlM2YyX95y93fiEjRIvs0=;
 b=veosK6fRUztcbhpFgy6ZCL52HwnII04GYq2VQMGLD9naFbQtknklZEa+5WKbIGiDku
 oRUdEdGuBj2Dcb9YKuJHxzAZyyOjMa3PS++8enPtpSSPJYrK5q5+RXipM5BQfcXMDTjg
 4k1cn84ngwRKgFK7aeTLURreImTPsi2oHhgdE51jlKUtAgyUegYa7DRvKNhoVgMOnL8y
 Yeyjh+AN9GssMKIO9nWTddj+uy4CCa4qcbfnHtJ7lB+am21J44ECs9ZM5ue2pGqnUvxL
 NrRd/lKWDD1kOC+oaEXuYIHqi9Tawk9rXSE23I63YN9BUMliuyNpKve5Z/KwDs8gB5r4
 3yQQ==
X-Gm-Message-State: AOAM533Zge65Qu4vAE23cNOfysEg3z0u3ZoW94M+/2XkMTHrk4wkUE83
 i8gdVrheJfwpyHZMjve1wFy75b0Z49phxwXTEaFB+0v21DOkvKv8xK3AOxYIn8IFwr00eTxAL9a
 Z/D3VVjILdinBRLk=
X-Received: by 2002:a65:6741:0:b0:380:5b69:cbc5 with SMTP id
 c1-20020a656741000000b003805b69cbc5mr27042777pgu.89.1647401465170; 
 Tue, 15 Mar 2022 20:31:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyf4l8+H7ZwG/+4cHCeUpm2Sq/yoaga+mbD6sB3n4D8z+mWH8nar1vIVLn8P4TPu6iF8tfmNw==
X-Received: by 2002:a65:6741:0:b0:380:5b69:cbc5 with SMTP id
 c1-20020a656741000000b003805b69cbc5mr27042756pgu.89.1647401464783; 
 Tue, 15 Mar 2022 20:31:04 -0700 (PDT)
Received: from xz-m1.local ([191.101.132.43]) by smtp.gmail.com with ESMTPSA id
 f13-20020a056a0022cd00b004f7eaac852dsm633558pfj.151.2022.03.15.20.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 20:31:04 -0700 (PDT)
Date: Wed, 16 Mar 2022 11:30:59 +0800
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: Time to introduce a migration protocol negotiation (Re: [PATCH
 v2 00/25] migration: Postcopy Preemption)
Message-ID: <YjFZ84Wdz6jpSekr@xz-m1.local>
References: <20220301083925.33483-1-peterx@redhat.com>
 <Yh3mo5VFQ3gT1Gd7@redhat.com> <Yh3yzbmOqAVV9iM9@xz-m1.local>
 <Yh30/nPtWyvqp8xo@redhat.com> <Yh37hLn5Dlffm13P@xz-m1.local>
 <Yh5O/eq4If4MYpTq@work-vm> <Yi+ONfiZlQD2LoHX@redhat.com>
 <YjAul3GIWmB3+v0P@xz-m1.local> <YjB1XXzIsJWtSR4E@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YjB1XXzIsJWtSR4E@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 15, 2022 at 11:15:41AM +0000, Daniel P. Berrangé wrote:
> > I still remember you mentioned the upper layer softwares can have
> > assumption on using only 1 pair of socket for migration, I think that makes
> > postcopy-preempt by default impossible.
> > 
> > Why multifd is different here?
> 
> It isn't different. We went through the pain to extending libvirt
> to know how to open many channels for multifd. We'll have todo
> the same with this postcopy-pre-empt. To this day though, management
> apps above libvirt largely don't enable multifd, which is a real
> shame. This is the key reason I think we need to handle this at
> the QEMU level automatically.

But I still don't undertand how QEMU could know about those tunnels, which
should be beyond QEMU's awareness?

The tunneling program can be some admin initiated socat tcp forwarding
programs, which by default may not allow >1 socket pairs.

Or maybe I have mis-understood on what's the tunneling we're discussing?

> 
> > > This post-copy is another case.  We should start off knowing
> > > we can switch to post-copy at any time.
> > 
> > This one is kind of special and it'll be harder, IMHO.
> > 
> > AFAIU, postcopy users will always initiate the migration with at least a
> > full round of precopy, with the hope that all the static guest pages will
> > be migrated.
> 
> I think I didn't explain myself properly here. Today there are
> two parts to postcopy usage in libvirt
> 
>   - Pass the "VIR_MIGRATE_POSTCOPY" when starting the migration.
>     The migration still runs in pre-copy mode. This merely ensures
>     we configure a bi-directional socket, so the app has the option
>     to swtich to postcopy later
> 
>   - Invoke virDomainMigrateStartPostCopy  to flip from pre-copy
>     to post-copy phase. This requires you previously passed
>     VIR_MIGRATE_POSTCOPY to enable its use.
> 
> The first point using 'VIR_MIGRATE_POSTCOPY' should not exist.
> That should be automaticaly negotiated and handled by QEMU.
> 
> Libvirt and mgmt apps should only need to care about whether
> or not they call virDomainMigrateStartPostCopy to flip to
> post-copy mode.

Ah I see.  I think Dave also mentioned it'll be a bit tricky to do so, but
it'll be at least sounds doable.

> 
> > > We should further be able to add pre-emption if we find it available.
> > 
> > Yeah here I have the same question per multifd above.  I just have no idea
> > whether QEMU has such knowledge on making this decision.  E.g., how could
> > QEMU know whether upper app is not tunneling the migration stream?  How
> > could QEMU know whether the upper app could handle multiple tcp sockets
> > well?
> 
> It can't do this today - that's why we need the new migration protocol
> feature negotiation I describe below.
> 
> > > So rather than following our historical practice, anjd adding
> > > yet another migration parameter for a specific feature, I'd
> > > really encourage us to put a stop to it and future proof
> > > ourselves.
> > > 
> > > 
> > > Introduce one *final-no-more-never-again-after-this* migration
> > > capability called "protocol-negotiation".
> > 
> > Let's see how Juan/Dave/others think.. anyway, that's something I always
> > wanted.
> > 
> > IMHO an even simpler term can be as simple as:
> > 
> >   -global migration.handshake=on
> 
> This is just inventing a new migration capability framework. We
> can just use existing QMP for this.

It's not a new one, it's just that a few years ago we exported the
migration capabilities to cmdline too (2081475841fe8), even if it's mostly
for debugging purpose.  In my daily tests it's quite handy.

> 
> > > When that capability is set, first declare that henceforth the
> > > migration transport is REQUIRED to support **multiple**,
> > > **bi-directional** channels.
> > 
> > This new capability will simply need to depend on the return-path
> > capability we already have.  E.g. exec-typed migration won't be able to
> > enable return-path, so not applicable to this one too.
> 
> 'exec' can be made to work if desired. Currently we only create
> a unidirectuional pipe and wire it up to stdin for outgoing
> migration. Nothing stops us declaring 'exec' uses a socketpair
> wired to stdin + stdout, and supprot invoking 'exec' multiple
> times to get many sockets

Yeah sounds working, it's just that we need to have users of it first.  One
point is that exec shouldn't be used in production but for quick hacks or
experiments, so supporting new/perf/enhancement features for it sounds a
bit over-engineering unless explicitly useful.

Thanks,

-- 
Peter Xu


