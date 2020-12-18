Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F362E2DE7F1
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 18:17:51 +0100 (CET)
Received: from localhost ([::1]:49116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqJO3-0001Qu-1w
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 12:17:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kqJKB-00074e-V2
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 12:13:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kqJK9-0008WG-LA
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 12:13:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608311628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UXCwFTGQVnkkEEjyBB+M9DDxyuq2bp2XF++80J5b+ZM=;
 b=XzaGZbX3VeHkno1u2zD8ejah6EFl5H5oS9gy2h+Hn7DXPy1Kz9B86DwAfLyTzvtRU2AivN
 LvQSJuHGmuIqu0fr2xk1ep5GK5x+UpCQMpo3CHOblGKuoTyJ9/9CcbYegxs1dVJvSGeJHG
 162skPkYfRruPT1dPCd0A+Tm4h2JLOc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-5Qcim_wCP--ilVY4RxL5_w-1; Fri, 18 Dec 2020 12:13:45 -0500
X-MC-Unique: 5Qcim_wCP--ilVY4RxL5_w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 740761922978
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 17:13:44 +0000 (UTC)
Received: from localhost (ovpn-113-127.ams2.redhat.com [10.36.113.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF8C12998D;
 Fri, 18 Dec 2020 17:13:42 +0000 (UTC)
Date: Fri, 18 Dec 2020 18:13:40 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 5/5] i386: provide simple 'hyperv=on' option to x86
 machine types
Message-ID: <20201218181340.5e398280@redhat.com>
In-Reply-To: <20201216205202.GJ3140057@habkost.net>
References: <20201119103221.1665171-1-vkuznets@redhat.com>
 <20201119103221.1665171-6-vkuznets@redhat.com>
 <20201216205202.GJ3140057@habkost.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Dec 2020 15:52:02 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Thu, Nov 19, 2020 at 11:32:21AM +0100, Vitaly Kuznetsov wrote:
> > Enabling Hyper-V emulation for a Windows VM is a tiring experience as it
> > requires listing all currently supported enlightenments ("hv_*" CPU
> > features) explicitly. We do have a 'hv_passthrough' mode enabling
> > everything but it can't be used in production as it prevents migration.
> > 
> > Introduce a simple 'hyperv=on' option for all x86 machine types enabling
> > all currently supported Hyper-V enlightenments. Later, when new
> > enlightenments get implemented, we will be adding them to newer machine
> > types only (by disabling them for legacy machine types) thus preserving
> > migration.
> > 
> > Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> > Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>  
> [...]
> > ---
> >  docs/hyperv.txt       |  8 ++++++++
> >  hw/i386/x86.c         | 30 ++++++++++++++++++++++++++++++
> >  include/hw/i386/x86.h |  7 +++++++
> >  target/i386/cpu.c     | 14 ++++++++++++++
> >  4 files changed, 59 insertions(+)
> > 
> > diff --git a/docs/hyperv.txt b/docs/hyperv.txt
> > index 5df00da54fc4..1a76a07f8417 100644
> > --- a/docs/hyperv.txt
> > +++ b/docs/hyperv.txt
> > @@ -29,6 +29,14 @@ When any set of the Hyper-V enlightenments is enabled, QEMU changes hypervisor
> >  identification (CPUID 0x40000000..0x4000000A) to Hyper-V. KVM identification
> >  and features are kept in leaves 0x40000100..0x40000101.
> >  
> > +Hyper-V enlightenments can be enabled in bulk by specifying 'hyperv=on' to an
> > +x86 machine type:
> > +
> > +  qemu-system-x86_64 -machine q35,accel=kvm,kernel-irqchip=split,hyperv=on ...
> > +
> > +Note, new enlightenments are only added to the latest (in-develompent) machine
> > +type, older machine types keep the list of the supported features intact to
> > +safeguard migration.
> >  
> >  3. Existing enlightenments
> >  ===========================
> > diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> > index 5944fc44edca..57f27d56ecc6 100644
> > --- a/hw/i386/x86.c
> > +++ b/hw/i386/x86.c
> > @@ -1171,6 +1171,20 @@ static void x86_machine_set_acpi(Object *obj, Visitor *v, const char *name,
> >      visit_type_OnOffAuto(v, name, &x86ms->acpi, errp);
> >  }
> >  
> > +static bool x86_machine_get_hyperv(Object *obj, Error **errp)
> > +{
> > +    X86MachineState *x86ms = X86_MACHINE(obj);
> > +
> > +    return x86ms->hyperv_enabled;
> > +}
> > +
> > +static void x86_machine_set_hyperv(Object *obj, bool value, Error **errp)
> > +{
> > +    X86MachineState *x86ms = X86_MACHINE(obj);
> > +
> > +    x86ms->hyperv_enabled = value;
> > +}
> > +
> >  static void x86_machine_initfn(Object *obj)
> >  {
> >      X86MachineState *x86ms = X86_MACHINE(obj);
> > @@ -1194,6 +1208,16 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
> >      x86mc->save_tsc_khz = true;
> >      nc->nmi_monitor_handler = x86_nmi;
> >  
> > +    /* Hyper-V features enabled with 'hyperv=on' */
> > +    x86mc->default_hyperv_features = BIT(HYPERV_FEAT_RELAXED) |
> > +        BIT(HYPERV_FEAT_VAPIC) | BIT(HYPERV_FEAT_TIME) |
> > +        BIT(HYPERV_FEAT_CRASH) | BIT(HYPERV_FEAT_RESET) |
> > +        BIT(HYPERV_FEAT_VPINDEX) | BIT(HYPERV_FEAT_RUNTIME) |
> > +        BIT(HYPERV_FEAT_SYNIC) | BIT(HYPERV_FEAT_STIMER) |
> > +        BIT(HYPERV_FEAT_FREQUENCIES) | BIT(HYPERV_FEAT_REENLIGHTENMENT) |
> > +        BIT(HYPERV_FEAT_TLBFLUSH) | BIT(HYPERV_FEAT_EVMCS) |
> > +        BIT(HYPERV_FEAT_IPI) | BIT(HYPERV_FEAT_STIMER_DIRECT);
I'd argue that feature bits do not belong to machine code at all.
If we have to involve machine at all then it should be a set property/value pairs
that machine will set on CPU object (I'm not convinced that doing it
from machine code is good idea though).

> > +
> >      object_class_property_add(oc, X86_MACHINE_SMM, "OnOffAuto",
> >          x86_machine_get_smm, x86_machine_set_smm,
> >          NULL, NULL);
> > @@ -1205,6 +1229,12 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
> >          NULL, NULL);
> >      object_class_property_set_description(oc, X86_MACHINE_ACPI,
> >          "Enable ACPI");
> > +
> > +    object_class_property_add_bool(oc, X86_MACHINE_HYPERV,
> > +        x86_machine_get_hyperv, x86_machine_set_hyperv);
> > +
> > +    object_class_property_set_description(oc, X86_MACHINE_HYPERV,
> > +        "Enable Hyper-V enlightenments");
> >  }
> >  
> >  static const TypeInfo x86_machine_info = {
> > diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
> > index 739fac50871b..598abd1be806 100644
> > --- a/include/hw/i386/x86.h
> > +++ b/include/hw/i386/x86.h
> > @@ -38,6 +38,9 @@ struct X86MachineClass {
> >      bool save_tsc_khz;
> >      /* Enables contiguous-apic-ID mode */
> >      bool compat_apic_id_mode;
> > +
> > +    /* Hyper-V features enabled with 'hyperv=on' */
> > +    uint64_t default_hyperv_features;
> >  };
> >  
> >  struct X86MachineState {
> > @@ -71,10 +74,14 @@ struct X86MachineState {
> >       * will be translated to MSI messages in the address space.
> >       */
> >      AddressSpace *ioapic_as;
> > +
> > +    /* Hyper-V emulation */
> > +    bool hyperv_enabled;
> >  };
> >  
> >  #define X86_MACHINE_SMM              "smm"
> >  #define X86_MACHINE_ACPI             "acpi"
> > +#define X86_MACHINE_HYPERV           "hyperv"
> >  
> >  #define TYPE_X86_MACHINE   MACHINE_TYPE_NAME("x86")
> >  OBJECT_DECLARE_TYPE(X86MachineState, X86MachineClass, X86_MACHINE)
> > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > index 83aca942d87c..63a931679d73 100644
> > --- a/target/i386/cpu.c
> > +++ b/target/i386/cpu.c
> > @@ -53,6 +53,7 @@
> >  #include "sysemu/tcg.h"
> >  #include "hw/qdev-properties.h"
> >  #include "hw/i386/topology.h"
> > +#include "hw/i386/x86.h"
> >  #ifndef CONFIG_USER_ONLY
> >  #include "exec/address-spaces.h"
> >  #include "hw/i386/apic_internal.h"
> > @@ -6511,8 +6512,21 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
> >  
> >  static void x86_cpu_hyperv_realize(X86CPU *cpu)
> >  {
> > +    X86MachineState *x86ms = X86_MACHINE(qdev_get_machine());
> > +    X86MachineClass *x86mc = X86_MACHINE_GET_CLASS(x86ms);
> > +    uint64_t feat;
> >      size_t len;
> >  
> > +    if (x86ms->hyperv_enabled) {
> > +        feat = x86mc->default_hyperv_features;
> > +        /* Enlightened VMCS is only available on Intel/VMX */
> > +        if (!cpu_has_vmx(&cpu->env)) {
> > +            feat &= ~BIT(HYPERV_FEAT_EVMCS);
> > +        }
> > +
> > +        cpu->hyperv_features |= feat;
that will ignore features user explicitly doesn't want,
ex:
 -machine hyperv=on -cpu foo,hv-foo=off

not sure we would like to introduce such invariant,
in normal qom property handling the latest set property should have effect
(all other invariants we have in x86 cpu property semantics are comming from legacy handling
and I plan to deprecate them (it will affect x86 and sparc cpus) so CPUs will behave like
any other QOM object when it come to property handling)
 
anyways it's confusing a bit to have cpu flags to come from 2 different places

-cpu hyperv-use-preset=on,hv-foo=off

looks less confusing and will heave expected effect

> > +    }  
> 
> I had to dequeue this because it doesn't compile with
> CONFIG_USER_ONLY:
> 
> https://gitlab.com/ehabkost/qemu/-/jobs/916651017
> 
> The easiest solution would be to wrap the new code in #ifndef
> CONFIG_USER_ONLY, but maybe we should try to move all
> X86Machine-specific code from cpu.c to
> hw/i386/x86.c:x86_cpu_pre_plug().
this looks to me like a preset of feature flags that belongs to CPU,
and machine code here only as a way to version subset of CPU features.

Is there a way to implement it without modifying machine?

for example versioned CPUs or maybe something like this:

for CLI:
-cpu hyperv-use-preset=on,hv-foo=off

   diff --git a/hw/core/machine.c b/hw/core/machine.c
index 8d1a90c6cf..8828dcde8e 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -35,6 +35,7 @@ GlobalProperty hw_compat_5_0[] = {
     { "vmport", "x-signal-unsupported-cmd", "off" },
     { "vmport", "x-report-vmx-type", "off" },
     { "vmport", "x-cmds-v2", "off" },
+    { "cpu-foo", "hv-preset", "0xXXXX" }, // use compat props to keep old defaults
+                                          // it will be set before we return from object_new(cpu_type)
 };
 const size_t hw_compat_5_0_len = G_N_ELEMENTS(hw_compat_5_0);
 
diff --git a/slirp b/slirp
--- a/slirp
+++ b/slirp
@@ -1 +1 @@
-Subproject commit ce94eba2042d52a0ba3d9e252ebce86715e94275
+Subproject commit ce94eba2042d52a0ba3d9e252ebce86715e94275-dirty
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 588f32e136..f0b511ce27 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7190,6 +7190,8 @@ static Property x86_cpu_properties[] = {
 
     DEFINE_PROP_UINT32("hv-spinlocks", X86CPU, hyperv_spinlock_attempts,
                        HYPERV_SPINLOCK_NEVER_RETRY),
+    DEFINE_PROP_UNIT64("hyperv-preset", X86CPU, hyperv_features_def, 0xYYYYY),
+ // prop_info should define custom setter/getter that will copy hyperv_features_def into hyperv_features
+ // moment "hyperv-use-preset=on" is processed, it will overwrite any previously set
+ // hv-foo but that's fine because user asked for it explictly
+    DEFINE_PROP("hyperv-use-preset", X86CPU, hyperv_use_preset, prop_info, bool),
     DEFINE_PROP_BIT64("hv-relaxed", X86CPU, hyperv_features,
                       HYPERV_FEAT_RELAXED, 0),
     DEFINE_PROP_BIT64("hv-vapic", X86CPU, hyperv_features,


