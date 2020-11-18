Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1902B87AA
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 23:27:44 +0100 (CET)
Received: from localhost ([::1]:37846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfVvS-0006NF-O3
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 17:27:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kfVtQ-0005lR-Cy
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 17:25:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kfVtM-0000cr-QS
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 17:25:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605738330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D2qOktdz8CIvC/ebZhbayXkQkSitbhZJNazQMhZjAps=;
 b=W68zaM8WA86lcE/gvrxFCoK5jXjO6M/XS7CN+WxquMUj4HyrPQVelSUmQ7v9iPfhGNkf5d
 yPq1QrjvVs7w08q24Tupz7oc5IN1kbfteT2ARUyFybc0zSwZCI1KlLmpqkRzIOE5X5KdWa
 mKUPk1ooYET61RlpmmoXo7tDvev9zMk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-dXzJsxHDPFyog7KdJBO4mw-1; Wed, 18 Nov 2020 17:25:28 -0500
X-MC-Unique: dXzJsxHDPFyog7KdJBO4mw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AC238143EA
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 22:25:27 +0000 (UTC)
Received: from localhost (ovpn-115-101.rdu2.redhat.com [10.10.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7EC819C59;
 Wed, 18 Nov 2020 22:25:26 +0000 (UTC)
Date: Wed, 18 Nov 2020 17:25:26 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH RFC v3 23/23] i386: provide simple 'hyperv=on' option to
 x86 machine types
Message-ID: <20201118222526.GQ1509407@habkost.net>
References: <20201009121842.1938010-1-vkuznets@redhat.com>
 <20201009121842.1938010-24-vkuznets@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201009121842.1938010-24-vkuznets@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 16:44:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 09, 2020 at 02:18:42PM +0200, Vitaly Kuznetsov wrote:
> Enabling Hyper-V emulation for a Windows VM is a tiring experience as it
> requires listing all currently supported enlightenments ("hv_*" CPU
> features) explicitly. We do have a 'hv_passthrough' mode enabling
> everything but it can't be used in production as it prevents migration.
> 
> Introduce a simple 'hyperv=on' option for all x86 machine types enabling
> all currently supported Hyper-V enlightenments. Later, when new
> enlightenments get implemented, we will be adding them to newer machine
> types only (by disabling them for legacy machine types) thus preserving
> migration.
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>

This patch seems to be especially useful, and I wonder if we
could make sure this is included before all the rest of the
series.  Especially considering that the KVM changes might take a
while to be merged.

Would you be able to submit this independently from the rest of
the series?  You can add my:

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

My only (minor) suggestion is to rename
X86MachineClass.hyperv_features to
X86MachineClass.default_hyperv_features.

> ---
>  docs/hyperv.txt       |  8 ++++++++
>  hw/i386/x86.c         | 30 ++++++++++++++++++++++++++++++
>  include/hw/i386/x86.h |  7 +++++++
>  target/i386/cpu.c     | 14 ++++++++++++++
>  4 files changed, 59 insertions(+)
> 
> diff --git a/docs/hyperv.txt b/docs/hyperv.txt
> index 5df00da54fc4..1a76a07f8417 100644
> --- a/docs/hyperv.txt
> +++ b/docs/hyperv.txt
> @@ -29,6 +29,14 @@ When any set of the Hyper-V enlightenments is enabled, QEMU changes hypervisor
>  identification (CPUID 0x40000000..0x4000000A) to Hyper-V. KVM identification
>  and features are kept in leaves 0x40000100..0x40000101.
>  
> +Hyper-V enlightenments can be enabled in bulk by specifying 'hyperv=on' to an
> +x86 machine type:
> +
> +  qemu-system-x86_64 -machine q35,accel=kvm,kernel-irqchip=split,hyperv=on ...
> +
> +Note, new enlightenments are only added to the latest (in-develompent) machine
> +type, older machine types keep the list of the supported features intact to
> +safeguard migration.
>  
>  3. Existing enlightenments
>  ===========================
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index 3137a2008588..eeecd4e3322f 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -1171,6 +1171,20 @@ static void x86_machine_set_acpi(Object *obj, Visitor *v, const char *name,
>      visit_type_OnOffAuto(v, name, &x86ms->acpi, errp);
>  }
>  
> +static bool x86_machine_get_hyperv(Object *obj, Error **errp)
> +{
> +    X86MachineState *x86ms = X86_MACHINE(obj);
> +
> +    return x86ms->hyperv_enabled;
> +}
> +
> +static void x86_machine_set_hyperv(Object *obj, bool value, Error **errp)
> +{
> +    X86MachineState *x86ms = X86_MACHINE(obj);
> +
> +    x86ms->hyperv_enabled = value;
> +}
> +
>  static void x86_machine_initfn(Object *obj)
>  {
>      X86MachineState *x86ms = X86_MACHINE(obj);
> @@ -1193,6 +1207,16 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
>      x86mc->save_tsc_khz = true;
>      nc->nmi_monitor_handler = x86_nmi;
>  
> +    /* Hyper-V features enabled with 'hyperv=on' */
> +    x86mc->hyperv_features = BIT(HYPERV_FEAT_RELAXED) | BIT(HYPERV_FEAT_VAPIC) |
> +        BIT(HYPERV_FEAT_TIME) | BIT(HYPERV_FEAT_CRASH) |
> +        BIT(HYPERV_FEAT_RESET) | BIT(HYPERV_FEAT_VPINDEX) |
> +        BIT(HYPERV_FEAT_RUNTIME) | BIT(HYPERV_FEAT_SYNIC) |
> +        BIT(HYPERV_FEAT_STIMER) | BIT(HYPERV_FEAT_FREQUENCIES) |
> +        BIT(HYPERV_FEAT_REENLIGHTENMENT) | BIT(HYPERV_FEAT_TLBFLUSH) |
> +        BIT(HYPERV_FEAT_EVMCS) | BIT(HYPERV_FEAT_IPI) |
> +        BIT(HYPERV_FEAT_STIMER_DIRECT);
> +
>      object_class_property_add(oc, X86_MACHINE_SMM, "OnOffAuto",
>          x86_machine_get_smm, x86_machine_set_smm,
>          NULL, NULL);
> @@ -1204,6 +1228,12 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
>          NULL, NULL);
>      object_class_property_set_description(oc, X86_MACHINE_ACPI,
>          "Enable ACPI");
> +
> +    object_class_property_add_bool(oc, X86_MACHINE_HYPERV,
> +        x86_machine_get_hyperv, x86_machine_set_hyperv);
> +
> +    object_class_property_set_description(oc, X86_MACHINE_HYPERV,
> +        "Enable Hyper-V enlightenments");
>  }
>  
>  static const TypeInfo x86_machine_info = {
> diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
> index d5dcf7a07fdc..2b989e5fc49d 100644
> --- a/include/hw/i386/x86.h
> +++ b/include/hw/i386/x86.h
> @@ -38,6 +38,9 @@ struct X86MachineClass {
>      bool save_tsc_khz;
>      /* Enables contiguous-apic-ID mode */
>      bool compat_apic_id_mode;
> +
> +    /* Hyper-V features enabled with 'hyperv=on' */
> +    uint64_t hyperv_features;
>  };
>  
>  struct X86MachineState {
> @@ -70,10 +73,14 @@ struct X86MachineState {
>       * will be translated to MSI messages in the address space.
>       */
>      AddressSpace *ioapic_as;
> +
> +    /* Hyper-V emulation */
> +    bool hyperv_enabled;
>  };
>  
>  #define X86_MACHINE_SMM              "smm"
>  #define X86_MACHINE_ACPI             "acpi"
> +#define X86_MACHINE_HYPERV           "hyperv"
>  
>  #define TYPE_X86_MACHINE   MACHINE_TYPE_NAME("x86")
>  OBJECT_DECLARE_TYPE(X86MachineState, X86MachineClass, X86_MACHINE)
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 55706c8050fe..d0961c1838ad 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -53,6 +53,7 @@
>  #include "sysemu/tcg.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/i386/topology.h"
> +#include "hw/i386/x86.h"
>  #ifndef CONFIG_USER_ONLY
>  #include "exec/address-spaces.h"
>  #include "hw/i386/apic_internal.h"
> @@ -6409,8 +6410,21 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
>  
>  static void x86_cpu_hyperv_realize(X86CPU *cpu)
>  {
> +    X86MachineState *x86ms = X86_MACHINE(qdev_get_machine());
> +    X86MachineClass *x86mc = X86_MACHINE_GET_CLASS(x86ms);
> +    uint64_t feat;
>      size_t len;
>  
> +    if (x86ms->hyperv_enabled) {
> +        feat = x86mc->hyperv_features;
> +        /* Enlightened VMCS is only available on Intel/VMX */
> +        if (!cpu_has_vmx(&cpu->env)) {
> +            feat &= ~BIT(HYPERV_FEAT_EVMCS);
> +        }
> +
> +        cpu->hyperv_features |= feat;
> +    }
> +
>      /* Hyper-V vendor id */
>      if (!cpu->hyperv_vendor) {
>          object_property_set_str(OBJECT(cpu), "hv-vendor-id", "Microsoft Hv",
> -- 
> 2.25.4
> 

-- 
Eduardo


