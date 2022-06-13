Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F3B5484C3
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 13:14:59 +0200 (CEST)
Received: from localhost ([::1]:46830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0i26-0000ih-GJ
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 07:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o0i0R-0008R9-ST
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 07:13:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o0i0O-0006z8-Oy
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 07:13:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655118791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lL6DqZdw3ZMjc5hRBLorlKRuT6j0sA6tKMtAC3fgUEo=;
 b=fctccIYqpln5gfTKHY1GIueQiq0UuCD3thd1yUd0BJgv002Qa2v7A2WTU3hym1PYvYkkLo
 +tQEURKKUSb0X6qQDhzY3/nZnOFrm3PMWE3rQwtEdxCZMaZgndT/nVy7xzUyRiKxOjMFgq
 51EEdSYESzIxH8n1cUW6u+/NMeq7omk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-ToqRsxbiMceZ6XHAznxXLQ-1; Mon, 13 Jun 2022 07:13:09 -0400
X-MC-Unique: ToqRsxbiMceZ6XHAznxXLQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 k5-20020a05600c0b4500b003941ca130f9so2354579wmr.0
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 04:13:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lL6DqZdw3ZMjc5hRBLorlKRuT6j0sA6tKMtAC3fgUEo=;
 b=XnRdbZXG0YbhRQAJZQqxdHQFMFgBuhi4uvx5Ga+n+jtOHc9pHvV87jXOOOjpGw+GqJ
 Qk2PInQ9o0NMtMDROnQLgwFm+ZWGYR4nlX0XPziz3JQb0X0x+Ad9y7LOSsANpBdvDCpC
 bM+f+zO10S5k5yqbjG8qsHpJEBCBgBtM2pmIkQ9IwJgvMUHeDOBlqa3KBPHjpdofZh7I
 fPFn/0QnQ9NYcP1Mw6Dat6XFL1I1q3BKdojp5TQsAkP5Nrb0DrsE8AX8duQzbXw/ii7V
 rs7+R5cu0Cqyt59FjwEUHvpDX5STEfKiw/qXSUUb56tEf3Z03ccFnL9iRi/Qew6VDMbw
 G7mg==
X-Gm-Message-State: AOAM531/R28PIrcLbsMHxwPejQU62YVeRvrr4Alj0mbxJCRaGeCe7Af+
 FAj5w6oFw43Rqd72V2wtTs1SchCgE5HTUc6MIUIXOOqx8QR/8JbyWBMxlFUoyXi1UyCaE8mO5wJ
 DJ97YGZmsO4v8cW4=
X-Received: by 2002:a05:6000:12d0:b0:210:2ba3:e67 with SMTP id
 l16-20020a05600012d000b002102ba30e67mr57165327wrx.382.1655118788730; 
 Mon, 13 Jun 2022 04:13:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydNW5pR6T9z9rKAAznuZH95Aa2lMwNchRFb4UiXbdcQRq0R1btHLY5e1+XA0NcuhS3kHRNxg==
X-Received: by 2002:a05:6000:12d0:b0:210:2ba3:e67 with SMTP id
 l16-20020a05600012d000b002102ba30e67mr57165297wrx.382.1655118788374; 
 Mon, 13 Jun 2022 04:13:08 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 q67-20020a1c4346000000b0039751bb8c62sm12929459wma.24.2022.06.13.04.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 04:13:07 -0700 (PDT)
Date: Mon, 13 Jun 2022 12:13:05 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH RFC 4/5] cpu: Allow cpu_synchronize_all_post_init() to
 take an errp
Message-ID: <Yqcbwemb7I/MpGWG@work-vm>
References: <20220607230645.53950-1-peterx@redhat.com>
 <20220607230645.53950-5-peterx@redhat.com>
 <YqDW2AZDb3buF9YQ@work-vm> <YqJf5WlSyK2o2xJg@xz-m1.local>
 <YqNTDSV4P05pb+9l@xz-m1.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqNTDSV4P05pb+9l@xz-m1.local>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
> On Thu, Jun 09, 2022 at 05:02:29PM -0400, Peter Xu wrote:
> > On Wed, Jun 08, 2022 at 06:05:28PM +0100, Dr. David Alan Gilbert wrote:
> > > > @@ -2005,7 +2005,17 @@ static void loadvm_postcopy_handle_run_bh(void *opaque)
> > > >      /* TODO we should move all of this lot into postcopy_ram.c or a shared code
> > > >       * in migration.c
> > > >       */
> > > > -    cpu_synchronize_all_post_init();
> > > > +    cpu_synchronize_all_post_init(&local_err);
> > > > +    if (local_err) {
> > > > +        /*
> > > > +         * TODO: a better way to do this is to tell the src that we cannot
> > > > +         * run the VM here so hopefully we can keep the VM running on src
> > > > +         * and immediately halt the switch-over.  But that needs work.
> > > 
> > > Yes, I think it is possible; unlike some of the later errors in the same
> > > function, in this case we know no disks/network/etc have been touched,
> > > so we should be able to recover.
> > > I wonder if we can move the postcopy_state_set(POSTCOPY_INCOMING_RUNNING)
> > > out of loadvm_postcopy_handle_run to after this point.
> > > 
> > > We've already got the return path, so we should be able to signal the
> > > failure unless we're very unlucky.
> > 
> > Right.  It's just that for the new ACK we may need to modify the return
> > path protocol for sure, because none of the existing ones can notify such
> > an information.
> > 
> > One idea is to reuse MIG_RP_MSG_RESUME_ACK, it was only used for postcopy
> > recovery before to do the final handshake with offload=1 only (which is
> > defined as MIGRATION_RESUME_ACK_VALUE).  We could try to fill in the
> > payload with some !1 value, to tell the source that we NACK the migration
> > then src fails the migration as long as possible?
> > 
> > That seems to be even compatibile with one old qemu migrating to a new qemu
> > scenario, because when the old qemu notices the MIG_RP_MSG_RESUME_ACK
> > message with !1 payload, it'll mark the rp bad:
> 
> Oh it won't be compatible..  The clean way to do this is we need to modify
> the src qemu to halt in postcopy_start() to wait for that ack before
> continue.  That may need another cap/param to enable.

OK; I was wondering aobut sending a RP_MSG_SHUT with a failure; but if
you'd need to change the source it's still a problem.

> The thing is I'm not very sure whether this will be worth it.
> 
> Non-compatible migrations should be rare on put register failures.  For the
> issue I was working on, it was actually a kernel bug that triggered it but
> it's just hard to figure out where's wrong.  With properly working kernels
> and matching hosts they should just not really heppen.  I'm worried adding
> too much complexity could over-engineer things without much benefits.

OK that makes sense.

> In that case, I'd think it proper if we start with what this patchset
> provides, which at least allows us to fail in a crystal clear way?

Yes, the clear error is important.

Dave

> > 
> >   if (migrate_handle_rp_resume_ack(ms, tmp32)) {
> >       mark_source_rp_bad(ms);
> >       goto out;
> >   }
> > 
> >   static int migrate_handle_rp_resume_ack(MigrationState *s, uint32_t value)
> >   {
> >       trace_source_return_path_thread_resume_ack(value);
> >   
> >       if (value != MIGRATION_RESUME_ACK_VALUE) {
> >           error_report("%s: illegal resume_ack value %"PRIu32,
> >                        __func__, value);
> >           return -1;
> >       }
> >       ...
> >   }
> > 
> > If it looks generally good, I can try with such a change in v2.
> > 
> > Thanks,
> > 
> > -- 
> > Peter Xu
> 
> -- 
> Peter Xu
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


