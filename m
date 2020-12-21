Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 528562E0139
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 20:50:02 +0100 (CET)
Received: from localhost ([::1]:36910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krRBw-0007Jb-T0
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 14:50:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1krRAB-0006qg-Mb
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 14:48:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1krR9t-0003ft-JB
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 14:48:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608580072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QX6qiIvCArblBw55tv8bg+iHOBtK9BdQbRWJXOj5ykk=;
 b=CV8rz9eGr/OTSmlAYe59T6TOKBbUI4gr2BEZF/JaxOTCu2vDpvJZA0KPNSLpZBfEJUWOTV
 XxE967aZ88479mN7LXnR137lGhxiqxBp95m2JYX0m+S1I+G1DNE3wyjij494yc/oViE15W
 elfOAtXprGOiqgBMO0el+5lXwGyAPcc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-QYuRmsp5MdOoU-b1YzfrWA-1; Mon, 21 Dec 2020 14:47:50 -0500
X-MC-Unique: QYuRmsp5MdOoU-b1YzfrWA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C78C180A092;
 Mon, 21 Dec 2020 19:47:49 +0000 (UTC)
Received: from localhost (ovpn-113-96.rdu2.redhat.com [10.10.113.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E0A660C67;
 Mon, 21 Dec 2020 19:47:44 +0000 (UTC)
Date: Mon, 21 Dec 2020 14:47:43 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 5/5] i386: provide simple 'hyperv=on' option to x86
 machine types
Message-ID: <20201221194743.GD6040@habkost.net>
References: <20201119103221.1665171-1-vkuznets@redhat.com>
 <20201119103221.1665171-6-vkuznets@redhat.com>
 <20201216205202.GJ3140057@habkost.net>
 <20201218181340.5e398280@redhat.com>
 <20201218180721.GS3140057@habkost.net>
 <20201221142418.0863bc59@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201221142418.0863bc59@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+s390 maintainers, a question about feature groups below:

On Mon, Dec 21, 2020 at 02:24:18PM +0100, Igor Mammedov wrote:
> On Fri, 18 Dec 2020 13:07:21 -0500
> Eduardo Habkost <ehabkost@redhat.com> wrote:
> 
> > On Fri, Dec 18, 2020 at 06:13:40PM +0100, Igor Mammedov wrote:
> > > On Wed, 16 Dec 2020 15:52:02 -0500
> > > Eduardo Habkost <ehabkost@redhat.com> wrote:
> > >   
> > > > On Thu, Nov 19, 2020 at 11:32:21AM +0100, Vitaly Kuznetsov wrote:  
> > > > > Enabling Hyper-V emulation for a Windows VM is a tiring experience as it
> > > > > requires listing all currently supported enlightenments ("hv_*" CPU
> > > > > features) explicitly. We do have a 'hv_passthrough' mode enabling
> > > > > everything but it can't be used in production as it prevents migration.
> > > > > 
> > > > > Introduce a simple 'hyperv=on' option for all x86 machine types enabling
> > > > > all currently supported Hyper-V enlightenments. Later, when new
> > > > > enlightenments get implemented, we will be adding them to newer machine
> > > > > types only (by disabling them for legacy machine types) thus preserving
> > > > > migration.
> > > > > 
> > > > > Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> > > > > Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>    
[...]  
> > > > > @@ -1194,6 +1208,16 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
> > > > >      x86mc->save_tsc_khz = true;
> > > > >      nc->nmi_monitor_handler = x86_nmi;
> > > > >  
> > > > > +    /* Hyper-V features enabled with 'hyperv=on' */
> > > > > +    x86mc->default_hyperv_features = BIT(HYPERV_FEAT_RELAXED) |
> > > > > +        BIT(HYPERV_FEAT_VAPIC) | BIT(HYPERV_FEAT_TIME) |
> > > > > +        BIT(HYPERV_FEAT_CRASH) | BIT(HYPERV_FEAT_RESET) |
> > > > > +        BIT(HYPERV_FEAT_VPINDEX) | BIT(HYPERV_FEAT_RUNTIME) |
> > > > > +        BIT(HYPERV_FEAT_SYNIC) | BIT(HYPERV_FEAT_STIMER) |
> > > > > +        BIT(HYPERV_FEAT_FREQUENCIES) | BIT(HYPERV_FEAT_REENLIGHTENMENT) |
> > > > > +        BIT(HYPERV_FEAT_TLBFLUSH) | BIT(HYPERV_FEAT_EVMCS) |
> > > > > +        BIT(HYPERV_FEAT_IPI) | BIT(HYPERV_FEAT_STIMER_DIRECT);  
> > > I'd argue that feature bits do not belong to machine code at all.
> > > If we have to involve machine at all then it should be a set property/value pairs
> > > that machine will set on CPU object (I'm not convinced that doing it
> > > from machine code is good idea though).  
> > 
> > The set of default hyperv features needs be defined by the
> > machine type somehow, we can't avoid that.
> > 
> > You are correct that the policy could be implemented using
> > compat_props, but I don't think we should block a patch just
> > because we're not using a pure QOM property-based interface to
> > implement that.
> I'm fine with 1-4/5 patches but not with this one.
> With this patch I don't agree with inventing
> special semantics to property handling when it could
> be done in a typical and consistent way (especially for
> the sake of convenience).
> 
> 
> > We need the external interface to be good, though:
> > 
> > >   
> > [...]
> > > > >  static void x86_cpu_hyperv_realize(X86CPU *cpu)
> > > > >  {
> > > > > +    X86MachineState *x86ms = X86_MACHINE(qdev_get_machine());
> > > > > +    X86MachineClass *x86mc = X86_MACHINE_GET_CLASS(x86ms);
> > > > > +    uint64_t feat;
> > > > >      size_t len;
> > > > >  
> > > > > +    if (x86ms->hyperv_enabled) {
> > > > > +        feat = x86mc->default_hyperv_features;
> > > > > +        /* Enlightened VMCS is only available on Intel/VMX */
> > > > > +        if (!cpu_has_vmx(&cpu->env)) {
> > > > > +            feat &= ~BIT(HYPERV_FEAT_EVMCS);
> > > > > +        }
> > > > > +
> > > > > +        cpu->hyperv_features |= feat;  
> > > that will ignore features user explicitly doesn't want,
> > > ex:
> > >  -machine hyperv=on -cpu foo,hv-foo=off  
> > 
> > Oops, good point.
> > 
> > 
> > > 
> > > not sure we would like to introduce such invariant,
> > > in normal qom property handling the latest set property should have effect
> > > (all other invariants we have in x86 cpu property semantics are comming from legacy handling
> > > and I plan to deprecate them (it will affect x86 and sparc cpus) so CPUs will behave like
> > > any other QOM object when it come to property handling)
> > >  
> > > anyways it's confusing a bit to have cpu flags to come from 2 different places
> > > 
> > > -cpu hyperv-use-preset=on,hv-foo=off
> > > 
> > > looks less confusing and will heave expected effect
> > >   
> > > > > +    }    
> > > > 
> > > > I had to dequeue this because it doesn't compile with
> > > > CONFIG_USER_ONLY:
> > > > 
> > > > https://gitlab.com/ehabkost/qemu/-/jobs/916651017
> > > > 
> > > > The easiest solution would be to wrap the new code in #ifndef
> > > > CONFIG_USER_ONLY, but maybe we should try to move all
> > > > X86Machine-specific code from cpu.c to
> > > > hw/i386/x86.c:x86_cpu_pre_plug().  
> > > this looks to me like a preset of feature flags that belongs to CPU,
> > > and machine code here only as a way to version subset of CPU features.
> > > 
> > > Is there a way to implement it without modifying machine?  
> > 
> > Maybe there is, but why modifying machine is a problem?
> 
> 1. it doesn't let do the job properly (realize time is too late)
> 2. unnecessarily pushes CPU specific logic to machine code,
>    it just doesn't belong there.
>    Sure we can do that here, then some where else and in the end
>    code becomes unmanageable mess.
>  
> > I agree the interface needs to be clear and consistent, though.
> > Maybe making it a -cpu option would make this clearer and more
> > consistent.
> > 
> > > 
> > > for example versioned CPUs or maybe something like this:
> > > 
> > > for CLI:
> > > -cpu hyperv-use-preset=on,hv-foo=off  
> > 
> > In either case, we must clearly define what should happen if the
> > preset is (HYPERV_FEAT_X | HYPERV_FEAT_Y), and the command line
> > has:
> > 
> >   -cpu foo,hv-A=on,hv-X=off,hyperv-use-preset=on,hv-B=on,hv-Y=off
> 
> current x86 cpu code (it doesn't have typical properties handling
> for keeping legacy semantics), it will basically reorder all features
> with 'off' value to the end, so hv-X=off will still have an effect.
> 
> However I plan to deprecate those reordering semantics (x86/sparc cpus),
> to make it consistent with typical property handling
> (last set value overwrites any previously set one).
> 
> That will let us drop custom parsing of -cpu (quite a bit of code) and
> more importantly make it consistent with -device/device_add cpu-foo.

Right.

> 
> 
> > or:
> > 
> >   -machine hyperv=on -cpu foo,hv-A=on,hv-X=off,hv-B=on,hv-X=off
> > 
> > Personally, I don't care what the rules are, as long as: 1) they
> > are clearly defined and documented; 2) they support the use cases
> > we need to support.
> 
> I'd like to stick with typical property handling rules, and resort to
> inventing/using other invariant only if there is no other choice.

What would be the typical handling rules, in this case?  I don't
remember other cases in x86 where a single property affects
multiple feature flags.

We have something similar on s390x, though.  So, a question to
s390x maintainers:

If "G" is a feature group including the features X, Y, Z, what is
the result of:

   -cpu foo,X=off,G=on,Y=off

Would X be enabled?  Would Y be enabled?

I would expect X to be enabled and Y to be disabled, but I'd like
to confirm.


> 
> 
> > An automated test case to make sure we don't break the rules
> > would be really welcome.
> > 
> > > 
> > >    diff --git a/hw/core/machine.c b/hw/core/machine.c
> > > index 8d1a90c6cf..8828dcde8e 100644
> > > --- a/hw/core/machine.c
> > > +++ b/hw/core/machine.c
> > > @@ -35,6 +35,7 @@ GlobalProperty hw_compat_5_0[] = {
> > >      { "vmport", "x-signal-unsupported-cmd", "off" },
> > >      { "vmport", "x-report-vmx-type", "off" },
> > >      { "vmport", "x-cmds-v2", "off" },
> > > +    { "cpu-foo", "hv-preset", "0xXXXX" }, // use compat props to keep old defaults
> > > +                                          // it will be set before we return from object_new(cpu_type)
> > >  };
> > >  const size_t hw_compat_5_0_len = G_N_ELEMENTS(hw_compat_5_0);
> > >  
> > > diff --git a/slirp b/slirp
> > > --- a/slirp
> > > +++ b/slirp
> > > @@ -1 +1 @@
> > > -Subproject commit ce94eba2042d52a0ba3d9e252ebce86715e94275
> > > +Subproject commit ce94eba2042d52a0ba3d9e252ebce86715e94275-dirty
> > > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > > index 588f32e136..f0b511ce27 100644
> > > --- a/target/i386/cpu.c
> > > +++ b/target/i386/cpu.c
> > > @@ -7190,6 +7190,8 @@ static Property x86_cpu_properties[] = {
> > >  
> > >      DEFINE_PROP_UINT32("hv-spinlocks", X86CPU, hyperv_spinlock_attempts,
> > >                         HYPERV_SPINLOCK_NEVER_RETRY),
> > > +    DEFINE_PROP_UNIT64("hyperv-preset", X86CPU, hyperv_features_def, 0xYYYYY),
> > > + // prop_info should define custom setter/getter that will copy hyperv_features_def into hyperv_features
> > > + // moment "hyperv-use-preset=on" is processed, it will overwrite any previously set
> > > + // hv-foo but that's fine because user asked for it explictly
> > > +    DEFINE_PROP("hyperv-use-preset", X86CPU, hyperv_use_preset, prop_info, bool),  
> > 
> > We don't need to use custom getters/setters with DEFINE_PROP, if
> > we can use object_class_property_add_bool().
> of cause, I've used DEFINE_PROP just as a possible example.
> 
> > I dislike custom getters/setters in either case, but maybe we
> > don't have a choice.  Depending on the rules we agree upon above,
> > custom setters could become avoidable, or they could become a
> > necessity.
> 
> I do dislike them too, but sometimes custom setters are convenient
> as they allow to check if value is valid and let us implement non
> trivial handling (like in this case) at property setting time.
> (doing overwites)
> 
> > >      DEFINE_PROP_BIT64("hv-relaxed", X86CPU, hyperv_features,
> > >                        HYPERV_FEAT_RELAXED, 0),
> > >      DEFINE_PROP_BIT64("hv-vapic", X86CPU, hyperv_features,  
> > 
> 

-- 
Eduardo


