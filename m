Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AFD31A0F1
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 15:55:47 +0100 (CET)
Received: from localhost ([::1]:51238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAZrG-0003bA-Il
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 09:55:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lAZpr-0002w8-7Y
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 09:54:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lAZpn-00081i-Sr
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 09:54:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613141654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+dvoU5biODQ/dp78aEK+7VVWNzawU1rgKuSSv/sXvIE=;
 b=ZP/mhjJv+FvuOKe8XUomSh7iT3j6tMqYosqwyy0/b2hoW9o9svLgIDqlX3c3tTPlQgalYZ
 vzjIGTeOoY8Lkl0trPPR7RGxaoB8XwPrx5OkKPzbGFErHl2EtfTFgsS9tIlL0FGE+rEgkB
 lNy5WGMAJvA9iJn0y/ohvdIzezZo8YE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-6-7WH0VFOAaDxk8d448Yfg-1; Fri, 12 Feb 2021 09:54:12 -0500
X-MC-Unique: 6-7WH0VFOAaDxk8d448Yfg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3C31107ACC7;
 Fri, 12 Feb 2021 14:54:10 +0000 (UTC)
Received: from localhost (unknown [10.40.208.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDCBC5D6AB;
 Fri, 12 Feb 2021 14:54:02 +0000 (UTC)
Date: Fri, 12 Feb 2021 15:54:00 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Subject: Re: [PATCH v3 03/10] i386: add properoty, x-smm-compat-5, to keep
 compatibility of SMM
Message-ID: <20210212155400.40cab452@redhat.com>
In-Reply-To: <7b74891766ad1caccd83c28ecea0d5d4293b3860.1613025709.git.isaku.yamahata@intel.com>
References: <cover.1613025709.git.isaku.yamahata@intel.com>
 <7b74891766ad1caccd83c28ecea0d5d4293b3860.1613025709.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: isaku.yamahata@gmail.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Feb 2021 22:46:39 -0800
Isaku Yamahata <isaku.yamahata@intel.com> wrote:

> The following patch will introduce incompatible behavior of SMM.
> Introduce a property to keep the old behavior for compatibility.
> To enable smm compat, use "-machine x-smm-compat-5=on"

just curious, why it has "-5" suffix
also I'd drop x- prefix.
 
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> ---
>  hw/i386/pc_piix.c     | 10 ++++++----
>  hw/i386/pc_q35.c      |  1 +
>  hw/i386/x86.c         | 18 ++++++++++++++++++
>  include/hw/i386/x86.h |  2 ++
>  4 files changed, 27 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 6188c3e97e..87269e170e 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -441,6 +441,7 @@ DEFINE_I440FX_MACHINE(v6_0, "pc-i440fx-6.0", NULL,
>  static void pc_i440fx_5_2_machine_options(MachineClass *m)
>  {
>      pc_i440fx_6_0_machine_options(m);
> +    m->default_machine_opts = "firmware=bios-256k.bin,x-smm-compat-5=on";

did I point to a wrong example :/

smm machinery is part of ich9/piix4 devices, so it would be simpler
by adding 'smm-compat' property to them

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 970046f438..bcb0333ddf 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -36,7 +36,9 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"
 
-GlobalProperty hw_compat_5_2[] = {};
+GlobalProperty hw_compat_5_2[] = {

it turns on compat mode on 5.2 and older machines types

+    { "ICH9-LPC", "smm-compat", "on"},
+};
 const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
 
 GlobalProperty hw_compat_5_1[] = {
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index d3145bf014..13003b2ac2 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -774,6 +774,7 @@ static const VMStateDescription vmstate_ich9_lpc = {
 };
 
 static Property ich9_lpc_properties[] = {

default would be used on new and later machine types

+    DEFINE_PROP_BOOL("smm-compat", ICH9LPCState, pm.smm_compat , false),
     DEFINE_PROP_BOOL("noreboot", ICH9LPCState, pin_strap.spkr_hi, true),
     DEFINE_PROP_BIT64("x-smi-broadcast", ICH9LPCState, smi_host_features,
                       ICH9_LPC_SMI_F_BROADCAST_BIT, true),

then do the same for piix4 pm device


>      m->alias = NULL;
>      m->is_default = false;
>      compat_props_add(m->compat_props, hw_compat_5_2, hw_compat_5_2_len);
> @@ -664,7 +665,8 @@ static void pc_i440fx_2_2_machine_options(MachineClass *m)
>  
>      pc_i440fx_2_3_machine_options(m);
>      m->hw_version = "2.2.0";
> -    m->default_machine_opts = "firmware=bios-256k.bin,suppress-vmdesc=on";
> +    m->default_machine_opts = "firmware=bios-256k.bin,suppress-vmdesc=on"
> +        ",x-smm-compat-5=on";
>      compat_props_add(m->compat_props, hw_compat_2_2, hw_compat_2_2_len);
>      compat_props_add(m->compat_props, pc_compat_2_2, pc_compat_2_2_len);
>      pcmc->rsdp_in_ram = false;
> @@ -727,7 +729,7 @@ static void pc_i440fx_1_7_machine_options(MachineClass *m)
>  
>      pc_i440fx_2_0_machine_options(m);
>      m->hw_version = "1.7.0";
> -    m->default_machine_opts = NULL;
> +    m->default_machine_opts = "x-smm-compat-5=on";
>      m->option_rom_has_mr = true;
>      compat_props_add(m->compat_props, pc_compat_1_7, pc_compat_1_7_len);
>      pcmc->smbios_defaults = false;
> @@ -999,7 +1001,7 @@ static void xenfv_4_2_machine_options(MachineClass *m)
>      pc_i440fx_4_2_machine_options(m);
>      m->desc = "Xen Fully-virtualized PC";
>      m->max_cpus = HVM_MAX_VCPUS;
> -    m->default_machine_opts = "accel=xen,suppress-vmdesc=on";
> +    m->default_machine_opts = "accel=xen,suppress-vmdesc=on,x-smm-compat-5=on";
>  }
>  
>  DEFINE_PC_MACHINE(xenfv_4_2, "xenfv-4.2", pc_xen_hvm_init,
> @@ -1011,7 +1013,7 @@ static void xenfv_3_1_machine_options(MachineClass *m)
>      m->desc = "Xen Fully-virtualized PC";
>      m->alias = "xenfv";
>      m->max_cpus = HVM_MAX_VCPUS;
> -    m->default_machine_opts = "accel=xen,suppress-vmdesc=on";
> +    m->default_machine_opts = "accel=xen,suppress-vmdesc=on,x-smm-compat-5=on";
>  }
>  
>  DEFINE_PC_MACHINE(xenfv, "xenfv-3.1", pc_xen_hvm_init,
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 0a212443aa..14974b7255 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -358,6 +358,7 @@ DEFINE_Q35_MACHINE(v6_0, "pc-q35-6.0", NULL,
>  static void pc_q35_5_2_machine_options(MachineClass *m)
>  {
>      pc_q35_6_0_machine_options(m);
> +    m->default_machine_opts = "firmware=bios-256k.bin,x-smm-compat-5=on";
>      m->alias = NULL;
>      compat_props_add(m->compat_props, hw_compat_5_2, hw_compat_5_2_len);
>      compat_props_add(m->compat_props, pc_compat_5_2, pc_compat_5_2_len);
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index 6329f90ef9..00eb2253d3 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -1174,6 +1174,18 @@ static void x86_machine_set_smm(Object *obj, Visitor *v, const char *name,
>      visit_type_OnOffAuto(v, name, &x86ms->smm, errp);
>  }
>  
> +static bool x86_machine_get_smm_compat_5(Object *obj, Error **errp)
> +{
> +    X86MachineState *x86ms = X86_MACHINE(obj);
> +    return  x86ms->smm_compat_5;
> +}
> +
> +static void x86_machine_set_smm_compat_5(Object *obj, bool value, Error **errp)
> +{
> +    X86MachineState *x86ms = X86_MACHINE(obj);
> +    x86ms->smm_compat_5 = value;
> +}
> +
>  bool x86_machine_is_acpi_enabled(const X86MachineState *x86ms)
>  {
>      if (x86ms->acpi == ON_OFF_AUTO_OFF) {
> @@ -1204,6 +1216,7 @@ static void x86_machine_initfn(Object *obj)
>      X86MachineState *x86ms = X86_MACHINE(obj);
>  
>      x86ms->smm = ON_OFF_AUTO_AUTO;
> +    x86ms->smm_compat_5 = false;
>      x86ms->acpi = ON_OFF_AUTO_AUTO;
>      x86ms->smp_dies = 1;
>      x86ms->pci_irq_mask = ACPI_BUILD_PCI_IRQS;
> @@ -1228,6 +1241,11 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
>      object_class_property_set_description(oc, X86_MACHINE_SMM,
>          "Enable SMM");
>  
> +    object_class_property_add_bool(oc, X86_MACHINE_SMM_COMPAT_5,
> +        x86_machine_get_smm_compat_5, x86_machine_set_smm_compat_5);
> +    object_class_property_set_description(oc, X86_MACHINE_SMM_COMPAT_5,
> +        "Enable SMM compatible behavior");
> +
>      object_class_property_add(oc, X86_MACHINE_ACPI, "OnOffAuto",
>          x86_machine_get_acpi, x86_machine_set_acpi,
>          NULL, NULL);
> diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
> index 56080bd1fb..3dbe19a335 100644
> --- a/include/hw/i386/x86.h
> +++ b/include/hw/i386/x86.h
> @@ -65,6 +65,7 @@ struct X86MachineState {
>      unsigned smp_dies;
>  
>      OnOffAuto smm;
> +    bool smm_compat_5;
>      OnOffAuto acpi;
>  
>      /*
> @@ -75,6 +76,7 @@ struct X86MachineState {
>  };
>  
>  #define X86_MACHINE_SMM              "smm"
> +#define X86_MACHINE_SMM_COMPAT_5     "x-smm-compat-5"
>  #define X86_MACHINE_ACPI             "acpi"
>  
>  #define TYPE_X86_MACHINE   MACHINE_TYPE_NAME("x86")


