Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3375436B81B
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 19:31:23 +0200 (CEST)
Received: from localhost ([::1]:58912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb54s-0004V9-9w
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 13:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mtosatti@redhat.com>)
 id 1lb53F-0003Kf-SC
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 13:29:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mtosatti@redhat.com>)
 id 1lb53C-000050-Gw
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 13:29:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619458177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r2W8aXggky9eFtnt+1iyKlR7Hv6Uwev4BL7Ynd0oXHw=;
 b=OM3JIkb0gTTu+R7RB9ftFMHOCTz3K2El0EoWBItjZ7TkCx7A1bLXXuJoIkFASJAkqFnulQ
 0+WVxaJ1+O5MspQyqmhmgyDzAxlLIRy0gJ+wj3X6vm4cFNN9QtEXyLR5+5bLZ73xzdT/7q
 VAX+yvtc+j8KIu480dlDQwzrqGxqkIw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-o8dwcJ56OJeV2ZDOcmecgw-1; Mon, 26 Apr 2021 13:28:28 -0400
X-MC-Unique: o8dwcJ56OJeV2ZDOcmecgw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9595381425A;
 Mon, 26 Apr 2021 17:28:27 +0000 (UTC)
Received: from fuller.cnet (ovpn-112-5.gru2.redhat.com [10.97.112.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E3B05D71F;
 Mon, 26 Apr 2021 17:28:27 +0000 (UTC)
Received: by fuller.cnet (Postfix, from userid 1000)
 id 41571416D899; Mon, 26 Apr 2021 14:28:02 -0300 (-03)
Date: Mon, 26 Apr 2021 14:28:02 -0300
From: Marcelo Tosatti <mtosatti@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: constant_tsc support for SVM guest
Message-ID: <20210426172802.GA25302@fuller.cnet>
References: <a6662944-18ac-5075-1427-f92ae8e20163@amd.com>
 <20210423212744.4urvjdirnqdvqcq5@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20210423212744.4urvjdirnqdvqcq5@habkost.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mtosatti@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mtosatti@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Cc: "Moger, Babu" <babu.moger@amd.com>, Wei Huang <wei.huang2@amd.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Hi Wei, Eduardo,

On Fri, Apr 23, 2021 at 05:27:44PM -0400, Eduardo Habkost wrote:
> On Fri, Apr 23, 2021 at 12:32:00AM -0500, Wei Huang wrote:
> > There was a customer request for const_tsc support on AMD guests. Right now
> > this feature is turned off by default for QEMU x86 CPU types (in
> > CPUID_Fn80000007_EDX[8]). However we are seeing a discrepancy in guest VM
> > behavior between Intel and AMD.
> > 
> > In Linux kernel, Intel x86 code enables X86_FEATURE_CONSTANT_TSC based on
> > vCPU's family & model. So it ignores CPUID_Fn80000007_EDX[8] and guest VMs
> > have const_tsc enabled. On AMD, however, the kernel checks
> > CPUID_Fn80000007_EDX[8]. So const_tsc is disabled on AMD by default.

EAX=80000007h: Advanced Power Management Information
This function provides advanced power management feature identifiers. 
EDX bit 8 indicates support for invariant TSC. 

Intel documentation states:

"The time stamp counter in newer processors may support an enhancement,
referred to as invariant TSC. Processor's support for invariant TSC
is indicated by CPUID.80000007H:EDX[8]. The invariant TSC will run
at a constant rate in all ACPI P-, C-. and T-states. This is the
architectural behavior moving forward. On processors with invariant TSC
support, the OS may use the TSC for wall clock timer services (instead
of ACPI or HPET timers). TSC reads are much more efficient and do not
incur the overhead associated with a ring transition or access to a
platform resource."

X86_FEATURE_NONSTOP_TSC is enabled (on both Intel and AMD) by checking
the CPUID_Fn80000007_EDX[8] bit.

> Oh.  This seems to defeat the purpose of the invtsc migration
> blocker we have.
> 
> Do we know when this behavior was introduced in Linux?
> 
> > 
> > I am thinking turning on invtsc for EPYC CPU types (see example below). Most
> > AMD server CPUs have supported invariant TSC for a long time. So this change
> > is compatible with the hardware behavior. The only problem is live migration
> > support, which will be blocked because of invtsc. However this problem
> > should be considered very minor because most server CPUs support TscRateMsr
> > (see CPUID_Fn8000000A_EDX[4]), allowing VMs to migrate among CPUs with
> > different TSC rates. This live migration restriction can be lifted as long
> > as the destination supports TscRateMsr or has the same frequency as the
> > source (QEMU/libvirt do it).

Yes.

> > [BTW I believe this migration limitation might be unnecessary because it is
> > apparently OK for Intel guests to ignore invtsc while claiming const_tsc.
> > Have anyone reported issues?]
> 
> CCing Marcelo, who originally added the migration blocker in QEMU.

The reasoning behind the migration blocker was to ensure that 
the invariant TSC meaning as defined:

"The invariant TSC will run at a constant rate in all ACPI P-, C-. and T-states"

Would be maintained across migration.

> > 
> > Do I miss anything here? Any comments about the proposal?
> > 
> > Thanks,
> > -Wei
> > 
> > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > index ad99cad0e7..3c48266884 100644
> > --- a/target/i386/cpu.c
> > +++ b/target/i386/cpu.c
> > @@ -4077,6 +4076,21 @@ static X86CPUDefinition builtin_x86_defs[] = {
> >                      { /* end of list */ }
> >                  }
> >              },
> > +            {
> > +                .version = 4,
> > +                .alias = "EPYC-IBPB",
> > +                .props = (PropValue[]) {
> > +                    { "ibpb", "on" },
> > +                    { "perfctr-core", "on" },
> > +                    { "clzero", "on" },
> > +                    { "xsaveerptr", "on" },
> > +                    { "xsaves", "on" },
> 
> You don't need to copy the properties from the previous version.
> The properties of version N are applied on top of the properties
> of version (N-1).
> 
> > +                    { "invtsc", "on" },
> > +                    { "model-id",
> > +                      "AMD EPYC Processor" },
> > +                    { /* end of list */ }
> > +                }
> > +            },
> >              { /* end of list */ }
> >          }
> >      },
> > @@ -4189,6 +4203,15 @@ static X86CPUDefinition builtin_x86_defs[] = {
> >                      { /* end of list */ }
> >                  }
> >              },
> > +            {
> > +                .version = 3,
> > +                .props = (PropValue[]) {
> > +                    { "ibrs", "on" },
> > +                    { "amd-ssbd", "on" },
> > +                    { "invtsc", "on" },
> > +                    { /* end of list */ }
> > +                }
> > +            },
> >              { /* end of list */ }
> >          }
> >      },
> > @@ -4246,6 +4269,17 @@ static X86CPUDefinition builtin_x86_defs[] = {
> >          .xlevel = 0x8000001E,
> >          .model_id = "AMD EPYC-Milan Processor",
> >          .cache_info = &epyc_milan_cache_info,
> > +        .versions = (X86CPUVersionDefinition[]) {
> > +            { .version = 1 },
> > +            {
> > +                .version = 2,
> > +                .props = (PropValue[]) {
> > +                    { "invtsc", "on" },
> > +                    { /* end of list */ }
> > +                }
> > +            },
> > +            { /* end of list */ }
> > +        }
> > 
> 
> -- 
> Eduardo
> 
> 


