Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 042911CE34A
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 20:55:04 +0200 (CEST)
Received: from localhost ([::1]:57632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYDZu-0004py-IA
	for lists+qemu-devel@lfdr.de; Mon, 11 May 2020 14:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jYDZ5-0004FM-Lh
 for qemu-devel@nongnu.org; Mon, 11 May 2020 14:54:11 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:43108
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jYDZ3-0003Ow-PA
 for qemu-devel@nongnu.org; Mon, 11 May 2020 14:54:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589223248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lxUEpnoGmBlrNvpojO6UPdi9lfXu5blAZvXopWygE5M=;
 b=SUJXoaGNfC2oCS82yiAF0rqhWrpaN4O44mtRuxZKB1+/CYuqOPZTw+8MvqtVCrz+Ht1RYw
 VY6KLMmr+fWCxMot/7QCWmyMD20GD5P7dwzrRt73Mf63c8/pvl/4dnaF6QLt4uZ6IxbFSS
 nVv30ces6aIwO3ltxOCnoOS5A+MZJpA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-xA0VL8rZNhOlfgIdam-REw-1; Mon, 11 May 2020 14:54:04 -0400
X-MC-Unique: xA0VL8rZNhOlfgIdam-REw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9A8A107ACCA;
 Mon, 11 May 2020 18:54:02 +0000 (UTC)
Received: from localhost (unknown [10.40.208.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B27376606E;
 Mon, 11 May 2020 18:53:55 +0000 (UTC)
Date: Mon, 11 May 2020 20:53:52 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani.sinha@nutanix.com>
Subject: Re: [PATCH V2] Add a new PIIX option to control PCI hot unplugging
 of devices on non-root buses
Message-ID: <20200511205352.05ff541a@redhat.com>
In-Reply-To: <1588069012-211196-1-git-send-email-ani.sinha@nutanix.com>
References: <1588069012-211196-1-git-send-email-ani.sinha@nutanix.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 03:10:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, ani@anisinha.ca,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 28 Apr 2020 10:16:52 +0000
Ani Sinha <ani.sinha@nutanix.com> wrote:

> A new option "use_acpi_unplug" is introduced for PIIX which will
> selectively only disable hot unplugging of both hot plugged and
> cold plugged PCI devices on non-root PCI buses. This will prevent
> hot unplugging of devices from Windows based guests from system
> tray but will not prevent devices from being hot plugged into the
> guest.
> 
> It has been tested on Windows guests.
> 
> Signed-off-by: Ani Sinha <ani.sinha@nutanix.com>
> ---
>  hw/acpi/piix4.c      |  3 +++
>  hw/i386/acpi-build.c | 40 ++++++++++++++++++++++++++--------------
>  2 files changed, 29 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index 964d6f5..59fa707 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -78,6 +78,7 @@ typedef struct PIIX4PMState {
>  
>      AcpiPciHpState acpi_pci_hotplug;
>      bool use_acpi_pci_hotplug;
> +    bool use_acpi_unplug;
>  
>      uint8_t disable_s3;
>      uint8_t disable_s4;
> @@ -633,6 +634,8 @@ static Property piix4_pm_properties[] = {
>      DEFINE_PROP_UINT8(ACPI_PM_PROP_S4_VAL, PIIX4PMState, s4_val, 2),
>      DEFINE_PROP_BOOL("acpi-pci-hotplug-with-bridge-support", PIIX4PMState,
>                       use_acpi_pci_hotplug, true),
> +    DEFINE_PROP_BOOL("acpi-pci-hotunplug-enable-bridge", PIIX4PMState,
> +                     use_acpi_unplug, true),
>      DEFINE_PROP_BOOL("memory-hotplug-support", PIIX4PMState,
>                       acpi_memory_hotplug.is_enabled, true),
>      DEFINE_PROP_END_OF_LIST(),
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 23c77ee..71b3ac3 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -96,6 +96,7 @@ typedef struct AcpiPmInfo {
>      bool s3_disabled;
>      bool s4_disabled;
>      bool pcihp_bridge_en;
> +    bool pcihup_bridge_en;
>      uint8_t s4_val;
>      AcpiFadtData fadt;
>      uint16_t cpu_hp_io_base;
> @@ -240,6 +241,9 @@ static void acpi_get_pm_info(MachineState *machine, AcpiPmInfo *pm)
>      pm->pcihp_bridge_en =
>          object_property_get_bool(obj, "acpi-pci-hotplug-with-bridge-support",
>                                   NULL);
> +    pm->pcihup_bridge_en =
> +        object_property_get_bool(obj, "acpi-pci-hotunplug-enable-bridge",
> +                                 NULL);
>  }
>  
>  static void acpi_get_misc_info(AcpiMiscInfo *info)
> @@ -451,7 +455,8 @@ static void build_append_pcihp_notify_entry(Aml *method, int slot)
>  }
>  
>  static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
> -                                         bool pcihp_bridge_en)
> +                                         bool pcihp_bridge_en,
> +                                         bool pcihup_bridge_en)
>  {
>      Aml *dev, *notify_method = NULL, *method;
>      QObject *bsel;
> @@ -479,11 +484,14 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
>                  dev = aml_device("S%.02X", PCI_DEVFN(slot, 0));
>                  aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
>                  aml_append(dev, aml_name_decl("_ADR", aml_int(slot << 16)));
> -                method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
> -                aml_append(method,
> -                    aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
> -                );
> -                aml_append(dev, method);
> +                if (pcihup_bridge_en || pci_bus_is_root(bus)) {

so you are keeping unplug anyway in case of host bridge, so user will see
eject icon if device is in root bus?

Other thing about this patch is that it only partially disable hotplug,
I'd rather do it the way hardware does i.e. full hotplug or no hotplug at all.
(like the other hypervisors have done it, to workaround this Windows 'feature')

which is possible is one puts device on pci bridge without hotplug, i.e.

 -global PIIX4_PM.acpi-pci-hotplug-with-bridge-support=off

that of cause leaves apci hotplug on and as you noticed earlier
Windows will offer to eject any device on root bus including directly
attached bridges. And currently there is no way to disable that.

Will following hack work for you?
possible permutations
1) ACPI hotplug everywhere
-global PIIX4_PM.acpi-pci-hotplug=on -global PIIX4_PM.acpi-pci-hotplug-with-bridge-support=on -device pci-bridge,chassis_nr=1,shpc=doesnt_matter -device e1000,bus=pci.1,addr=01,id=netdev1 

2) No hotplug at all
-global PIIX4_PM.acpi-pci-hotplug=off -global PIIX4_PM.acpi-pci-hotplug-with-bridge-support=on -device pci-bridge,chassis_nr=1,shpc=off -device e1000,bus=pci.1,addr=01,id=netdev1

-global PIIX4_PM.acpi-pci-hotplug=off -global PIIX4_PM.acpi-pci-hotplug-with-bridge-support=off -device pci-bridge,chassis_nr=1,shpc=doesnt_matter  -device e1000,bus=pci.1,addr=01,id=netdev1

3) looks like SHPC kicks in, but it still needs to some bridge description in ACPI that
   acpi-pci-hotplug-with-bridge-support provides, probably with this you can individually flip hotplug on
   colplugged bridges using 'shpc' property (requires Vista or newer, tested win10).

   This needs some investigation so we could remove unsed AML and IO ports, but I'm not really interested
   in PCI stuff. So if 1+2 works for you, I'll post formal patches. If #3 is required feel free
   to use this patch as a starting base to make it complete. 

-global PIIX4_PM.acpi-pci-hotplug=off -global PIIX4_PM.acpi-pci-hotplug-with-bridge-support=on -device pci-bridge,chassis_nr=1,shpc=on -device e1000,bus=pci.1,addr=01,id=netdev1

---

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 964d6f5990..5f05b2cb87 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -78,6 +78,7 @@ typedef struct PIIX4PMState {
 
     AcpiPciHpState acpi_pci_hotplug;
     bool use_acpi_pci_hotplug;
+    bool use_acpi_pci_hotplug_on_bridges;
 
     uint8_t disable_s3;
     uint8_t disable_s4;
@@ -207,13 +208,13 @@ static const VMStateDescription vmstate_pci_status = {
 static bool vmstate_test_use_acpi_pci_hotplug(void *opaque, int version_id)
 {
     PIIX4PMState *s = opaque;
-    return s->use_acpi_pci_hotplug;
+    return s->use_acpi_pci_hotplug_on_bridges;
 }
 
 static bool vmstate_test_no_use_acpi_pci_hotplug(void *opaque, int version_id)
 {
     PIIX4PMState *s = opaque;
-    return !s->use_acpi_pci_hotplug;
+    return !s->use_acpi_pci_hotplug_on_bridges;
 }
 
 static bool vmstate_test_use_memhp(void *opaque)
@@ -505,7 +506,6 @@ static void piix4_pm_realize(PCIDevice *dev, Error **errp)
 
     piix4_acpi_system_hot_add_init(pci_address_space_io(dev),
                                    pci_get_bus(dev), s);
-    qbus_set_hotplug_handler(BUS(pci_get_bus(dev)), OBJECT(s), &error_abort);
 
     piix4_pm_add_propeties(s);
 }
@@ -528,7 +528,7 @@ I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
     s->smi_irq = smi_irq;
     s->smm_enabled = smm_enabled;
     if (xen_enabled()) {
-        s->use_acpi_pci_hotplug = false;
+        s->use_acpi_pci_hotplug_on_bridges = false;
     }
 
     qdev_init_nofail(dev);
@@ -593,7 +593,10 @@ static void piix4_acpi_system_hot_add_init(MemoryRegion *parent,
     memory_region_add_subregion(parent, GPE_BASE, &s->io_gpe);
 
     acpi_pcihp_init(OBJECT(s), &s->acpi_pci_hotplug, bus, parent,
-                    s->use_acpi_pci_hotplug);
+                    s->use_acpi_pci_hotplug_on_bridges);
+    if (s->use_acpi_pci_hotplug) {
+        qbus_set_hotplug_handler(BUS(bus), OBJECT(s), &error_abort);
+    }
 
     s->cpu_hotplug_legacy = true;
     object_property_add_bool(OBJECT(s), "cpu-hotplug-legacy",
@@ -632,6 +635,8 @@ static Property piix4_pm_properties[] = {
     DEFINE_PROP_UINT8(ACPI_PM_PROP_S4_DISABLED, PIIX4PMState, disable_s4, 0),
     DEFINE_PROP_UINT8(ACPI_PM_PROP_S4_VAL, PIIX4PMState, s4_val, 2),
     DEFINE_PROP_BOOL("acpi-pci-hotplug-with-bridge-support", PIIX4PMState,
+                     use_acpi_pci_hotplug_on_bridges, true),
+    DEFINE_PROP_BOOL("acpi-pci-hotplug", PIIX4PMState,
                      use_acpi_pci_hotplug, true),
     DEFINE_PROP_BOOL("memory-hotplug-support", PIIX4PMState,
                      acpi_memory_hotplug.is_enabled, true),

---


> +                    method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
> +                    aml_append(method,
> +                               aml_call2("PCEJ", aml_name("BSEL"),
> +                                         aml_name("_SUN"))
> +                        );
> +                    aml_append(dev, method);
> +                }
>                  aml_append(parent_scope, dev);
>  
>                  build_append_pcihp_notify_entry(notify_method, slot);
> @@ -537,12 +545,14 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
>              /* add _SUN/_EJ0 to make slot hotpluggable  */
>              aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
>  
> -            method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
> -            aml_append(method,
> -                aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
> -            );
> -            aml_append(dev, method);
> -
> +            if (pcihup_bridge_en || pci_bus_is_root(bus)) {
> +                method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
> +                aml_append(method,
> +                           aml_call2("PCEJ", aml_name("BSEL"),
> +                                     aml_name("_SUN"))
> +                    );
> +                aml_append(dev, method);
> +            }
>              if (bsel) {
>                  build_append_pcihp_notify_entry(notify_method, slot);
>              }
> @@ -553,7 +563,8 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
>               */
>              PCIBus *sec_bus = pci_bridge_get_sec_bus(PCI_BRIDGE(pdev));
>  
> -            build_append_pci_bus_devices(dev, sec_bus, pcihp_bridge_en);
> +            build_append_pci_bus_devices(dev, sec_bus, pcihp_bridge_en,
> +                                         pcihup_bridge_en);
>          }
>          /* slot descriptor has been composed, add it into parent context */
>          aml_append(parent_scope, dev);
> @@ -2196,7 +2207,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>          if (bus) {
>              Aml *scope = aml_scope("PCI0");
>              /* Scan all PCI buses. Generate tables to support hotplug. */
> -            build_append_pci_bus_devices(scope, bus, pm->pcihp_bridge_en);
> +            build_append_pci_bus_devices(scope, bus, pm->pcihp_bridge_en,
> +                                         pm->pcihup_bridge_en);
>  
>              if (TPM_IS_TIS_ISA(tpm)) {
>                  if (misc->tpm_version == TPM_VERSION_2_0) {


