Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AD02EAD8C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 15:44:39 +0100 (CET)
Received: from localhost ([::1]:50256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwnZd-0007Yg-Na
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 09:44:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kwnRE-00023Q-Vu
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 09:35:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kwnQ1-0003nY-6M
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 09:35:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609857275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7V0THcUnoFyVLOC/54iQJvMVRgQoQSoSdCJueFkx3z4=;
 b=inFb3hJzxDaN5Qq9JTiXsWUf9Rbvu52fJo5DOq0s9Rg4/18yASrBq9iJs+K3IRVkjJPF29
 D1XfRHq/qJG9swVKfU8EloLo7NwY1fT9T/2cOurkOcajaZUbcWtgBHxQvL3BQPPw6FUJx0
 bJvNPIQAOY/9K4PFyIQ1CxCmcHOqgfk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-qtAuMnhXNaa6PR7CC6VyJQ-1; Tue, 05 Jan 2021 09:34:33 -0500
X-MC-Unique: qtAuMnhXNaa6PR7CC6VyJQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C7DB107ACE3
 for <qemu-devel@nongnu.org>; Tue,  5 Jan 2021 14:34:32 +0000 (UTC)
Received: from localhost (ovpn-116-153.rdu2.redhat.com [10.10.116.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4139D5E1B5;
 Tue,  5 Jan 2021 14:34:32 +0000 (UTC)
Date: Tue, 5 Jan 2021 09:34:31 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 5/5] i386: provide simple 'hyperv=on' option to x86
 machine types
Message-ID: <20210105143431.GL18467@habkost.net>
References: <20201119103221.1665171-1-vkuznets@redhat.com>
 <20201119103221.1665171-6-vkuznets@redhat.com>
 <20201216205202.GJ3140057@habkost.net>
 <20201218181340.5e398280@redhat.com>
 <87r1n0j20n.fsf@vitty.brq.redhat.com>
 <20210104182906.GD18467@habkost.net>
 <20210105003650.71f39045@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210105003650.71f39045@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 05, 2021 at 12:36:50AM +0100, Igor Mammedov wrote:
> On Mon, 4 Jan 2021 13:29:06 -0500
> Eduardo Habkost <ehabkost@redhat.com> wrote:
> 
> > On Mon, Jan 04, 2021 at 01:54:32PM +0100, Vitaly Kuznetsov wrote:
> > > Igor Mammedov <imammedo@redhat.com> writes:
> > >   
> > > >> >  
> > > >> > +    /* Hyper-V features enabled with 'hyperv=on' */
> > > >> > +    x86mc->default_hyperv_features = BIT(HYPERV_FEAT_RELAXED) |
> > > >> > +        BIT(HYPERV_FEAT_VAPIC) | BIT(HYPERV_FEAT_TIME) |
> > > >> > +        BIT(HYPERV_FEAT_CRASH) | BIT(HYPERV_FEAT_RESET) |
> > > >> > +        BIT(HYPERV_FEAT_VPINDEX) | BIT(HYPERV_FEAT_RUNTIME) |
> > > >> > +        BIT(HYPERV_FEAT_SYNIC) | BIT(HYPERV_FEAT_STIMER) |
> > > >> > +        BIT(HYPERV_FEAT_FREQUENCIES) | BIT(HYPERV_FEAT_REENLIGHTENMENT) |
> > > >> > +        BIT(HYPERV_FEAT_TLBFLUSH) | BIT(HYPERV_FEAT_EVMCS) |
> > > >> > +        BIT(HYPERV_FEAT_IPI) | BIT(HYPERV_FEAT_STIMER_DIRECT);  
> > > > I'd argue that feature bits do not belong to machine code at all.
> > > > If we have to involve machine at all then it should be a set property/value pairs
> > > > that machine will set on CPU object (I'm not convinced that doing it
> > > > from machine code is good idea though).
> > > >  
> > > 
> > > These are 'features' and not feature bits. 'Bits' here are just our
> > > internal (to QEMU) representation of which features are enable and which
> > > are not, we could've just used booleans instead. These feature, when
> > > enabled, will result in some CPUID changes (not 1:1) but I don't see how
> > > it's different from
> > >   
> > > " -machine q35,accel=kvm "
> > > 
> > > which also results in CPUID changes.  
> > 
> > This is a good point, although having accel affect CPUID bits was
> > also a source of complexity for query-cpu-model-expansion and
> > other QMP queries.
> 
> why was, it's still a headache (mutating CPU models depending on accelerator)
> 
> > 
> > > 
> > > The main reason for putting this to x86 machine type is versioning, as
> > > we go along we will (hopefully) be implementing more and more Hyper-V
> > > features but we want to provide 'one knob to rule them all' but do it in
> > > a way that will allow migration. We already have 'hv_passthrough' for
> > > CPU.  
> > 
> > I agree completely that the set of bits needs to be on
> > MachineClass.  We just need to agree on the external interface.
> That's where I disagree,
> let me exaggerate for demo purpose:
>  - let's move all CPU models feature defaults to MachineClass and forget about compat properties
>     since in that case we can opencode changes in machine_class_init

I don't see your point here.  compat_props is also part of
MachineClass.

> 
> It's rather hard code integration between device models, which we try
> to avoid and still refactoring QEMU code to get rid of it.
> (sure it works until it's not and someone else need to rewrite half of QEMU
> to accomplish it's own task because we mixed things together)

I don't see why using a X86CPU-specific API that is not based on
QOM properties is hard code integration.  compat_props is not the
only allowed API for machines to communicate with devices.

> 
> > 
> > >   
> > > >> >  
> > > >> > +    if (x86ms->hyperv_enabled) {
> > > >> > +        feat = x86mc->default_hyperv_features;
> > > >> > +        /* Enlightened VMCS is only available on Intel/VMX */
> > > >> > +        if (!cpu_has_vmx(&cpu->env)) {
> > > >> > +            feat &= ~BIT(HYPERV_FEAT_EVMCS);
> > > >> > +        }
> > > >> > +
> > > >> > +        cpu->hyperv_features |= feat;  
> > > > that will ignore features user explicitly doesn't want,
> > > > ex:
> > > >  -machine hyperv=on -cpu foo,hv-foo=off
> > > >  
> > > 
> > > Existing 'hv_passthrough' mode can also affect the result. Personally, I
> > > don't see where 'hv-foo=off' is needed outside of debugging and these
> > > use-cases can probably be covered by explicitly listing required
> > > features but I'm not against making this work, shouldn't be hard.  
> > 
> > I'm all for not wasting time supporting use cases that are not
> > necessary in practice.  We just need to document the expected
> > behavior clearly, whatever we decide to do.
> 
> documenting is good, but if it adds new semantics to how CPU features are handled
> users up the stack will need code it up as well and juggle with
>  -machine + -cpu + -device cpu-foo
> not to mention poor developers who will have to figure out why we do
> set CPU properties in multiple different ways.
> 
> however if we add it as CPU properties that behave the same way as other
> properties, all mgmt has to do is expose new property to user for usage.

I think we need to be careful here.  Sometimes just exposing the
QOM properties used to implemented a feature is not the best user
interface.  e.g.: even if using compat_props for implementing the
hyperv features preset, that doesn't automatically mean we want
hyperv=on to be a -cpu option.

I would even argue we shouldn't be focusing on implementation
details (like we are doing right now) until the desired external
interface is described clearly.

> 
> it even more true when building machine from QMP interface would be available,
> where we would want '-device foo' more or less the same way instead of
> special casing some of them, i.e. I'd rather have one device to configure,
> instead of doing it in multiple places. It's not possible in reality
> but for new code we should try to minimize split brain issues.

Is split brain a practical problem here?  If the new behavior is
implemented in x86_cpu_realizefn() or x86_cpu_pre_plug(), we know
it's going to affect all CPU objects.

> 
> > >   
> > > > not sure we would like to introduce such invariant,
> > > > in normal qom property handling the latest set property should have effect
> > > > (all other invariants we have in x86 cpu property semantics are comming from legacy handling
> > > > and I plan to deprecate them (it will affect x86 and sparc cpus) so CPUs will behave like
> > > > any other QOM object when it come to property handling)
> > > >  
> > > > anyways it's confusing a bit to have cpu flags to come from 2 different places
> > > >
> > > > -cpu hyperv-use-preset=on,hv-foo=off
> > > >
> > > > looks less confusing and will heave expected effect
> > > >  
> > > 
> > > Honestly, 'hyperv-use-preset' is confusing even to me :-)
> > > 
> > > What if we for a second stop thinking about Hyper-V features being CPU
> > > features only, e.g. if we want to create Dynamic Memory or PTP or any
> > > other Hyper-V specific device in a simple way? We'll have to put these
> > > under machine type.  
> > 
> > I agree.  Hyper-V is not just a set of CPU features.
> me too,
> however in this case we are talking about a set of cpu features,
> if there is no way to implement it as cpu properties + compat properties
> and requires opencodding it within machine code it might be fine
> but I fail to see a very good reason for doing that at this momment.

The reason would be just simplicity of implementation.

I understand there are reasons to suggest using compat_props if
it makes things simpler, but I don't see why we would reject a
patch because the implementation is not based purely on
compat_props.

I will let Vitaly to decide how to proceed, based on our
feedback.  I encourage him to use compat_props like you suggest,
but I don't plan to make this a requirement.

> 
> > 
> > Also, those two approaches are not mutually exclusive.
> > "-machine hyperv=on" can be implemented internally using
> > "hyperv-use-preset=on" if necessary.  I don't think it has to,
> > however.
> 
> 

-- 
Eduardo


