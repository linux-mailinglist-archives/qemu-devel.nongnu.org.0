Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B89E2584263
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 16:56:46 +0200 (CEST)
Received: from localhost ([::1]:50622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH4wP-0005Ux-ON
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 10:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oH4Xb-0004aK-Tg
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 10:31:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oH4XW-0003tg-Vy
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 10:31:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659018662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eef8boTAH7+/WdkixdNrYYQQVVNE05XCuW/PXxy28nw=;
 b=DO7nrovKb6QTQygm5ybJilJqWTQ2c4PIDAIIgxaqUS9sOd+pwnt1DPzc8YrMSuX1by/9fI
 Pjhz4fuCOgZdpggItXuotPU70qTalaTWyUXy2kADES9eGnGsQULrC5K386V2MZUihvElEJ
 0KN9xgfqDiTXpgtmsUAh+DPDlHYS1Fw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-z8v4vxk5O3OT4DViG6vKDQ-1; Thu, 28 Jul 2022 10:31:00 -0400
X-MC-Unique: z8v4vxk5O3OT4DViG6vKDQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 o2-20020a056402438200b0043ccb3ed7dfso1221204edc.22
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 07:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Eef8boTAH7+/WdkixdNrYYQQVVNE05XCuW/PXxy28nw=;
 b=7dLC6tCFTHcdcw/6D+Th6wEdVrmIKMDcI7CCpqEsH4GT8fuKmV4ecgLgGNUaaO76dA
 rYlnl52WHYrBmAVdv1PYSefMQIUWXYuQJm9QAS/cAF6ob2fEmVvkHWU3biX4NE+C7jhR
 azuQGtPlXV/nVq+JhfOnZv3E6qFvLpX7jC0ZOGRQdJ0PvW+MY7o0DIakhcAbVaYED/lK
 er9rWUIpAOTVi/mBDADw4YlaQ5Ymd8x/AEt2ZEKbtYR0hCJ7Ml5bE6KXsjIMklALlcio
 JL8pt1uBQjd2/QiD90g8Ioz+WiPQMKmnvfmuU2Upe0JeOazvEJeNlWroYIjZx8lGw9PI
 KO7w==
X-Gm-Message-State: AJIora89NQfEILKRwlUBV47XKqCHchvxyZyxT5F/J8p6X0Xbe9HMxs1M
 tq0GFKEtqTwoQ5Zq0fcmCGjtsp8tDjyxu3Xn/hlnhXBWAL7zmM8viwDGwiYJj6kQqfUBd0tniU8
 gSvEEKgdUtX8jjoU=
X-Received: by 2002:a17:906:93ef:b0:72b:33cf:1d1c with SMTP id
 yl15-20020a17090693ef00b0072b33cf1d1cmr21098174ejb.486.1659018659359; 
 Thu, 28 Jul 2022 07:30:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uUQQ2+BT1lxg9+mgQaj5Ltzo4UFQNQOqhn0KlxK38dAiHUMirWDThnqbsKe0qa+Z3HWPErJA==
X-Received: by 2002:a17:906:93ef:b0:72b:33cf:1d1c with SMTP id
 yl15-20020a17090693ef00b0072b33cf1d1cmr21098140ejb.486.1659018658856; 
 Thu, 28 Jul 2022 07:30:58 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a056402180c00b0043ab36d6019sm796432edy.9.2022.07.28.07.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 07:30:58 -0700 (PDT)
Date: Thu, 28 Jul 2022 16:30:57 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Cc: mst@redhat.com, xiaoguangrong.eric@gmail.com, ani@anisinha.ca,
 dan.j.williams@intel.com, jingqi.liu@intel.com, qemu-devel@nongnu.org,
 robert.hu@intel.com
Subject: Re: [QEMU PATCH v2 4/6] nvdimm: Implement ACPI NVDIMM Label Methods
Message-ID: <20220728163057.199557b4@redhat.com>
In-Reply-To: <052025be29db7fe017214b0959e07913ebf9cb40.camel@linux.intel.com>
References: <20220530034047.730356-1-robert.hu@linux.intel.com>
 <20220530034047.730356-5-robert.hu@linux.intel.com>
 <20220616143210.21605b6a@redhat.com>
 <8a6a574aa3708f8f07c2dcc3fd84f6028ff1219f.camel@linux.intel.com>
 <20220721105837.2344a47a@redhat.com>
 <052025be29db7fe017214b0959e07913ebf9cb40.camel@linux.intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, 27 Jul 2022 13:22:34 +0800
Robert Hoo <robert.hu@linux.intel.com> wrote:

> On Thu, 2022-07-21 at 10:58 +0200, Igor Mammedov wrote:
> [...]
> Thanks Igor for review.
> > > > The patch it is too intrusive and my hunch is that it breaks
> > > > ABI and needs a bunch of compat knobs to work properly and
> > > > that I'd like to avoid unless there is not other way around
> > > > the problem.    
> > > 
> > > Is the ABI here you mentioned the "struct NvdimmMthdIn{}" stuff?
> > > and the compat knobs refers to related functions' input/output
> > > params?  
> > 
> > ABI are structures that guest and QEMU pass through information
> > between each other. And knobs in this case would be compat
> > variable[s]
> > to keep old behavior in place for old machine types.  
> 
> My humble opinion:
> The changes of the compat variable(s) here don't break the ABI, the ABI
> between guest and host/qemu is the ACPI spec which we don't change and
> fully conform to it; actually we're implementing it.
> e.g. with these patches, old guest can boot up with no difference nor
> changes.

it's not about booting but about migration.
boot on old QEMU and then migrate to one with your patches,
then make guest use _DSM again. You will see that migrated
guest still uses _old_ ACPI tables/AML and ABI in new QEMU
_must_ be compatible with that.

As for the patch, it's too big, and looking at it I wasn't
able to convince myself that it's correct.

 
> >   
> > > My thoughts is that eventually, sooner or later, more ACPI methods
> > > will
> > > be implemented per request, although now we can play the trick of
> > > wrapper new methods over the pipe of old _DSM implementation.
> > > Though this changes a little on existing struct NvdimmDsmIn {}, it
> > > paves the way for the future; and actually the change is more an
> > > extension or generalization, not fundamentally changes the
> > > framework.
> > > 
> > > In short, my point is the change/generalization/extension will be
> > > inevitable, even if not present.  
> > 
> > Expanding ABI (interface between host&guest) has 2 drawbacks
> >  * it exposes more attack surface of VMM to hostile guest
> >    and rises chances that vulnerability would slip through
> >    review/testing  
> 
> This patch doesn't increase attach surface, I think.
> 
> >  * migration wise, QEMU has to support any ABI for years
> >    and not only latest an greatest interface but also old
> >    ones to keep guest started on older QEMU working across
> >    migration, so any ABI change should be considered very
> >    carefully before being implemented otherwise it all
> >    quickly snowballs in unsupportable mess of compat
> >    variables smeared across host/guest.
> >    Reducing exposed ABI and constant need to expand it
> >    was a reason why we have moved ACPI code from firmware
> >    into QEMU, so we could describe hardware without costs
> >    associated with of maintaining ABI.  
> 
> Yeah, migration is the only broken thing. With this patch, guest ACPI
> table changes, live guest migrate between new and old qemus will have
> problem. But I think this is not the only example of such kind of
> problem. How about other similar cases?

Upstream policy for version-ed machine types (pc-*/q35-*/...),
forward migration _must_ work.
If you consider your device should e supported/usable downstream,
you also need take in account backward migration as well.


> In fact, the point of our contention is around this 
> https://www.qemu.org/docs/master/specs/acpi_nvdimm.html, whether or not
> change the implementation protocol by this patch. The protocol was for
> _DSM only. Unless we're not going to support any ACPI methods, it
> should be updated, and the _LS{I,R,W} are ACPI methods, we can play the
> trick in this special case, but definitely not next time.
> 
> I suggest to do it now, nevertheless, you maintainers make the final
> decision.

Not for this case (i.e. make patches minimal, touching only AML side
and reusing data that QEMU already provides via MMIO).

If ABI needs extending in future, that should be discussed separately
when there is actual need for it. 

> > 
> > There might be need to extend ABI eventually, but not in this case.
> >   
> > > > I was skeptical about this approach during v1 review and
> > > > now I'm pretty much sure it's over-engineered and we can
> > > > just repack data we receive from existing label _DSM functions
> > > > to provide _LS{I,R,W} like it was suggested in v1.
> > > > It will be much simpler and affect only AML side without
> > > > complicating ABI and without any compat cruft and will work
> > > > with ping-pong migration without any issues.    
> > > 
> > > Ostensibly it may looks simpler, actually not, I think. The AML
> > > "common
> > > pipe" NCAL() is already complex, it packs all _DSMs and NFIT()
> > > function
> > > logics there, packing new stuff in/through it will be bug-prone.
> > > Though this time we can avert touching it, as the new ACPI methods
> > > deprecating old _DSM functionally is almost the same.
> > > How about next time? are we going to always packing new methods
> > > logic
> > > in NCAL()?
> > > My point is that we should implement new methods as itself, of
> > > course,
> > > as a general programming rule, we can/should abstract common
> > > routines,
> > > but not packing them in one large function.  
> > > > 
> > > >     
> [...]
> 


