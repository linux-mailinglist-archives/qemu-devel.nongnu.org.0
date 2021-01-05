Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 174002EAF92
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 17:05:07 +0100 (CET)
Received: from localhost ([::1]:58276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwopW-0001l0-4k
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 11:05:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kwont-0000o9-Pt
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:03:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kwonp-0007qq-Tl
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:03:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609862599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gyMhHgLuO7eeFXkcW+DlqzAN0GZ/uSySzXhAbI1n4Oo=;
 b=YCEO0feUBKD8ImNTJfggMg2ij+//euKqBx/eCguP42HeOvNIOPg1gD1x93sl1bzc3vlW1/
 zlnV4Jr0mK3QuTc9kitLuVdkFKdGqGXTXEtcmkTaYXuRw9cDxgd5pzkOzNu2ull40kzjnu
 fL8uUE0FriujB1iP1cGqMlb3YdseltI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-1ezYkCdePZS7hR2BipnUQw-1; Tue, 05 Jan 2021 11:03:17 -0500
X-MC-Unique: 1ezYkCdePZS7hR2BipnUQw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA51F107AD44
 for <qemu-devel@nongnu.org>; Tue,  5 Jan 2021 16:03:16 +0000 (UTC)
Received: from localhost (unknown [10.40.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49FDE70955;
 Tue,  5 Jan 2021 16:03:15 +0000 (UTC)
Date: Tue, 5 Jan 2021 17:03:12 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH 5/5] i386: provide simple 'hyperv=on' option to x86
 machine types
Message-ID: <20210105170312.32cf0e12@redhat.com>
In-Reply-To: <87lfd7iowi.fsf@vitty.brq.redhat.com>
References: <20201119103221.1665171-1-vkuznets@redhat.com>
 <20201119103221.1665171-6-vkuznets@redhat.com>
 <20201216205202.GJ3140057@habkost.net>
 <20201218181340.5e398280@redhat.com>
 <87r1n0j20n.fsf@vitty.brq.redhat.com>
 <20210105000435.1cf4c6f6@redhat.com>
 <87lfd7iowi.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 05 Jan 2021 12:50:05 +0100
Vitaly Kuznetsov <vkuznets@redhat.com> wrote:

> Igor Mammedov <imammedo@redhat.com> writes:
> 
> > On Mon, 04 Jan 2021 13:54:32 +0100
> > Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
> >  
> >> Igor Mammedov <imammedo@redhat.com> writes:
> >>   
> >> >> >  
> >> >> > +    /* Hyper-V features enabled with 'hyperv=on' */
> >> >> > +    x86mc->default_hyperv_features = BIT(HYPERV_FEAT_RELAXED) |
> >> >> > +        BIT(HYPERV_FEAT_VAPIC) | BIT(HYPERV_FEAT_TIME) |
> >> >> > +        BIT(HYPERV_FEAT_CRASH) | BIT(HYPERV_FEAT_RESET) |
> >> >> > +        BIT(HYPERV_FEAT_VPINDEX) | BIT(HYPERV_FEAT_RUNTIME) |
> >> >> > +        BIT(HYPERV_FEAT_SYNIC) | BIT(HYPERV_FEAT_STIMER) |
> >> >> > +        BIT(HYPERV_FEAT_FREQUENCIES) | BIT(HYPERV_FEAT_REENLIGHTENMENT) |
> >> >> > +        BIT(HYPERV_FEAT_TLBFLUSH) | BIT(HYPERV_FEAT_EVMCS) |
> >> >> > +        BIT(HYPERV_FEAT_IPI) | BIT(HYPERV_FEAT_STIMER_DIRECT);    
> >> > I'd argue that feature bits do not belong to machine code at all.
> >> > If we have to involve machine at all then it should be a set property/value pairs
> >> > that machine will set on CPU object (I'm not convinced that doing it
> >> > from machine code is good idea though).
> >> >    
> >> 
> >> These are 'features' and not feature bits. 'Bits' here are just our
> >> internal (to QEMU) representation of which features are enable and which
> >> are not, we could've just used booleans instead. These feature, when
> >> enabled, will result in some CPUID changes (not 1:1) but I don't see how
> >> it's different from
> >>   
> >> " -machine q35,accel=kvm "
> >> 
> >> which also results in CPUID changes.
> >> 
> >> The main reason for putting this to x86 machine type is versioning, as
> >> we go along we will (hopefully) be implementing more and more Hyper-V
> >> features but we want to provide 'one knob to rule them all' but do it in
> >> a way that will allow migration. We already have 'hv_passthrough' for
> >> CPU.  
> >
> > for versioning device models (cpu included), we typically set some default in
> > device's ininfn, and if later on we need to change it to another default
> > we use compat properties to keep old default to old machine types.
> >
> > For example using it with CPU look at pc_compat_3_1
> >  
> 
> The tricky part for Hyper-V enlightenments is that we have to keep them
> all off as the default when it wasn't explicitly requested as they're
> only needed for Windows guests so one way or another we need a new knob
> to enable the default-good-set.
> 
> >> What if we for a second stop thinking about Hyper-V features being CPU
> >> features only, e.g. if we want to create Dynamic Memory or PTP or any
> >> other Hyper-V specific device in a simple way? We'll have to put these
> >> under machine type.  
> > ideally it would be a property of device that implements the feature
> > and machine might enable it depending on its own properties defaults,
> > but if you change the default behavior of the device model, you do
> > it in device model and use compat properties infrastructure to keep
> > old machine types happy.  
> 
> This would work nicely if we were to enable some of the Hyper-V
> enlightenments by default for new machine types and then turn them off
> with compat properties. We are in a different situation though, we want
> one knob which will tell us 'enable the default good set' and then we
> need to subtract something from this set because e.g. our machine type
> is old. In case the knob is, as you suggest, in CPU properties
> ('hv_default=on' or something like that) we'll have to play dirty games
> in machine init funtion again: go to CPU device options and check if
> 'hv_default=on' was requested. If yes, then we enable all Hyper-V
> enlightenments and do the subtraction according to machine version. And
> what's even more weird,

I think there is a misunderstanding, idea was:

cpu_initfn() {
    //current set
    cpu->default_hyperv_cpu_features = ACD
}

compat_props_5.1 {
   cpu.default_hyperv_cpu_features = AB
}

compat_props_5.2 {
   cpu.default_hyperv_cpu_features = ABC
}

and cpu property 'hv_default=on' should apply hv specific default set to
CPU when it's provided by user.
Simple as that, the scope of the patch was on CPU features not other devices,
and that keeps property semantics simple and clean
   -cpu foo,hv_default=on,hv_foo1=on,hv_foo2=off
properties just any other are parsed and applied from left to right and no extra code
is necessary.

if we try to do the same at cpu.realize() time like this patch (cpu_pre_plug is the same)
based on '-machine hyperv=on', it won't work because realize() time is too late and
we end up loosing 'hv_foo2=off' and/or 'hv_foo1=on' which creates different semantics, and I wouldn't
write off 'hv_foo2=off' as useless, as it might unbreak some guests which don't like
'hv_foo2' for some reason.

to make '-machine hyperv=on' work nice with user set properties we either:
 - at realize time, need to know if 'hv_foo2=off' was set by user and re-apply it on top of
   hv_default=on (there is no API for that at the moment), and maybe we need to know order
   in which properties are specified. which is messy and complex.

 - potentially '-machine hyperv=on' may push 'cpu.hv_default=on' global property
   like '-cpu foo,features' does. We need just need to make up mind on the order.
   I'd go for 
      1. '-machine hyperv=on' => add_global('cpu.hv_default=on')
      2. parse '-cpu' and/or -device cpu,features

In the end I'm not against '-machine hyperv=on', but it complicates things
compared to just

 cpu.default_hyperv_cpu_features + cpu.hv_default + -cpu foo,hv_default=on when desired
 + using compat props for versioning.

And if -machine hyperv=on is 'must have' thing, it's fine as long as doesn't
create special cases for property parsing semantics. 

> that we'll have to use 'hv_default=on' CPU flag
> as an indication to create non-CPU devices. Much easier if the knob is a
> property of machine type itself.
I was talking about CPU features/properties only, it doesn't apply to other devices.
It makes sense for machine to have a knob to create onboard hyperv specific
devices if there is any (do we have any?).

If there aren't any currently, I wouldn't bother with machine knob
and just use -cpu foo,hv_default=on or -device cpu,hv_default=on
like any other cpu feature.


> We can, of course, create a parallel (to the existing one) set of
> Hyper-V properties which are going to be enabled by default (and
> blacklisted by compat properties) and then later when CPU object is
> created we'll set CPU properties according to these 'default' properties
> but I hardly see a benefit in complicating stuff that much.
> Also, compat properties are not the only thing we take into
> consideration when creating an old machine type today. E.g.:
> 
> static void pc_q35_3_1_machine_options(MachineClass *m)
> {
>     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
> 
>     pc_q35_4_0_machine_options(m);
>     m->default_kernel_irqchip_split = false;
>     pcmc->do_not_add_smb_acpi = true;
>     m->smbus_no_migration_support = true;
>     m->alias = NULL;
>     pcmc->pvh_enabled = false;
>     compat_props_add(m->compat_props, hw_compat_3_1, hw_compat_3_1_len);
>     compat_props_add(m->compat_props, pc_compat_3_1, pc_compat_3_1_len);
> }
> 
> and that's exactly what I was thinking about for Hyper-V enlightenments:
> when a new one is introduced we'll turn it off by default for new
> machine types, no matter if it's going to be a CPU property or a new
> device.

you lost me here, I'm not sure what are you talking about.


