Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CECA12499CF
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 12:01:16 +0200 (CEST)
Received: from localhost ([::1]:47340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8KuB-0007s3-KZ
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 06:01:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1k8KtJ-0007Ly-T9
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 06:00:21 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:47259
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1k8KtH-0005bm-Jh
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 06:00:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597831218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AJUJwHfLMd+34EVZeklwuMWAMFjsfCYGkaR4N9VK45Q=;
 b=TXMKJUsCtMvq96XU5QPPKDNI79Ny9BTm6yfL/5LsJhC2uP4xpRhCPUek1GgAIskcAX567+
 7sF64pENtjp7HsVfPJiBunXlJw6dK0sM9ahU0I5gEyxycTdCWCNrX8P16iYjyUTtSPCU/J
 UC8FzAO93PxcJEtXKAwNxj5vG7a1Ido=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-ceFdih3UOtq-88yeS-oZfg-1; Wed, 19 Aug 2020 06:00:17 -0400
X-MC-Unique: ceFdih3UOtq-88yeS-oZfg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F108A61268;
 Wed, 19 Aug 2020 10:00:15 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 657041014180;
 Wed, 19 Aug 2020 10:00:07 +0000 (UTC)
Date: Wed, 19 Aug 2020 12:00:02 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH V2] Introduce a new flag for piix to disable root bus
 PCI hotplug
Message-ID: <20200819120002.51812273@redhat.com>
In-Reply-To: <1597151528-75766-1-git-send-email-ani@anisinha.ca>
References: <1597151528-75766-1-git-send-email-ani@anisinha.ca>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 01:46:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 11 Aug 2020 18:42:08 +0530
Ani Sinha <ani@anisinha.ca> wrote:

> We introduce a new global flag for PIIX with which we can turn on or off PCI
> device hotplug on the root bus. This flag can be used to prevent all PCI
> devices from getting hotplugged or unplugged from the root PCI bus.

Tested-by: Igor Mammedov <imammedo@redhat.com>

somewhere in intial versions there were mentionig why we are doing it
(i.e for Windows sake because ...)
I suggest to add it to commit message so reason for this won't be lost.
Also giving example how to use option in commit message would be good.

with this changes:
Reviewed-by: Igor Mammedov <imammedo@redhat.com>



> 
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  hw/acpi/piix4.c      |  3 +++
>  hw/i386/acpi-build.c | 20 ++++++++++++++++----
>  2 files changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index 26bac4f..94ec35a 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -78,6 +78,7 @@ typedef struct PIIX4PMState {
>  
>      AcpiPciHpState acpi_pci_hotplug;
>      bool use_acpi_hotplug_bridge;
> +    bool use_acpi_root_pci_hotplug;
>  
>      uint8_t disable_s3;
>      uint8_t disable_s4;
> @@ -635,6 +636,8 @@ static Property piix4_pm_properties[] = {
>      DEFINE_PROP_UINT8(ACPI_PM_PROP_S4_VAL, PIIX4PMState, s4_val, 2),
>      DEFINE_PROP_BOOL("acpi-pci-hotplug-with-bridge-support", PIIX4PMState,
>                       use_acpi_hotplug_bridge, true),
> +    DEFINE_PROP_BOOL("acpi-root-pci-hotplug", PIIX4PMState,
> +                     use_acpi_root_pci_hotplug, true),
>      DEFINE_PROP_BOOL("memory-hotplug-support", PIIX4PMState,
>                       acpi_memory_hotplug.is_enabled, true),
>      DEFINE_PROP_END_OF_LIST(),
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index b7bcbbb..a82e5c1 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -95,6 +95,7 @@ typedef struct AcpiPmInfo {
>      bool s3_disabled;
>      bool s4_disabled;
>      bool pcihp_bridge_en;
> +    bool pcihp_root_en;
>      uint8_t s4_val;
>      AcpiFadtData fadt;
>      uint16_t cpu_hp_io_base;
> @@ -245,6 +246,9 @@ static void acpi_get_pm_info(MachineState *machine, AcpiPmInfo *pm)
>      pm->pcihp_bridge_en =
>          object_property_get_bool(obj, "acpi-pci-hotplug-with-bridge-support",
>                                   NULL);
> +    pm->pcihp_root_en =
> +        object_property_get_bool(obj, "acpi-root-pci-hotplug", NULL);
> +
>  }
>  
>  static void acpi_get_misc_info(AcpiMiscInfo *info)
> @@ -337,12 +341,15 @@ static void build_append_pcihp_notify_entry(Aml *method, int slot)
>  }
>  
>  static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
> -                                         bool pcihp_bridge_en)
> +                                         bool pcihp_bridge_en,
> +                                         bool pcihp_root_en)
>  {
>      Aml *dev, *notify_method = NULL, *method;
>      QObject *bsel;
>      PCIBus *sec;
>      int i;
> +    bool root_bus = pci_bus_is_root(bus);
> +    bool root_pcihp_disabled = (root_bus && !pcihp_root_en);
>  
>      bsel = object_property_get_qobject(OBJECT(bus), ACPI_PCIHP_PROP_BSEL, NULL);
>      if (bsel) {
> @@ -361,6 +368,9 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
>          bool bridge_in_acpi;
>  
>          if (!pdev) {
> +            /* skip if pci hotplug for the root bus is disabled */
> +            if (root_pcihp_disabled)
> +                continue;
>              if (bsel) { /* add hotplug slots for non present devices */
>                  dev = aml_device("S%.02X", PCI_DEVFN(slot, 0));
>                  aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
> @@ -419,7 +429,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
>              method = aml_method("_S3D", 0, AML_NOTSERIALIZED);
>              aml_append(method, aml_return(aml_int(s3d)));
>              aml_append(dev, method);
> -        } else if (hotplug_enabled_dev) {
> +        } else if (hotplug_enabled_dev && !root_pcihp_disabled) {
>              /* add _SUN/_EJ0 to make slot hotpluggable  */
>              aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
>  
> @@ -439,7 +449,8 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
>               */
>              PCIBus *sec_bus = pci_bridge_get_sec_bus(PCI_BRIDGE(pdev));
>  
> -            build_append_pci_bus_devices(dev, sec_bus, pcihp_bridge_en);
> +            build_append_pci_bus_devices(dev, sec_bus, pcihp_bridge_en,
> +                                         pcihp_root_en);
>          }
>          /* slot descriptor has been composed, add it into parent context */
>          aml_append(parent_scope, dev);
> @@ -1818,7 +1829,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>          if (bus) {
>              Aml *scope = aml_scope("PCI0");
>              /* Scan all PCI buses. Generate tables to support hotplug. */
> -            build_append_pci_bus_devices(scope, bus, pm->pcihp_bridge_en);
> +            build_append_pci_bus_devices(scope, bus, pm->pcihp_bridge_en,
> +                                         pm->pcihp_root_en);
>  
>              if (TPM_IS_TIS_ISA(tpm)) {
>                  if (misc->tpm_version == TPM_VERSION_2_0) {


