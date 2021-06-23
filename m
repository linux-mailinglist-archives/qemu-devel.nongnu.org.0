Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0303B182F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 12:41:21 +0200 (CEST)
Received: from localhost ([::1]:34944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw0Js-0001T1-70
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 06:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1lw0Ig-0000gq-FI
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 06:40:06 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:40756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1lw0Id-0000nW-NT
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 06:40:06 -0400
Received: by mail-oi1-x230.google.com with SMTP id d19so2799543oic.7
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 03:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d657oCJ7tExx3zxr2hIXFnu9CVZ00tIcQ2OhQ/JHBB8=;
 b=ljSVk1wlqRIhRITsPGd2u6PCSWHcpTwH806PBK+GQiuE7LDI8S0Infig/+dTADplrx
 VkAv7qOWLgKjo/9g+wTnV1ww7W+up+d2/oGYVhhGBnB6Pq5iY9s2J/OBKdZwaJQtAP/E
 pyHTcxf91Ph6hBPutRd6jI8Q/d8nev39D75WfROx8LCiUcLuQpVUi/WeSWvx8/BYbGCj
 B3Vf6aJuv7sYJyu2UwsOx1/gvVsUhxC6usfcfDmZijpANAMFRlEdKjoclKFVjIQAL+WW
 1hXnrDG+W0A3xQScvUMv7Ffho5+uU/NHYdU7RE2sAOiIULs/gRkdSwp6BY29BR6ZgzLO
 rW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d657oCJ7tExx3zxr2hIXFnu9CVZ00tIcQ2OhQ/JHBB8=;
 b=Ie3GVa0DUN7dzDyu5cu7yOhigSSI99kySksqhDodkRtRz1/PPHVg8bPXOY/5WrFGW1
 vrmOykbKbhVzK0S3AwpHcLzwFhpl0nDuPIX5DbK8HheFandm26wEV9XSpXblvJq19lAu
 UgXQnz9guluP3s1hAg9C3HMSdW8uFB5fHT6YCPz3hR4jtPeDymWJvY9bjwgb1s7kSO2+
 vGX9IS6ddZmlbuHvZNCHHxs+N5Y5ozL63N1d5wqcJKakwAJHAMAAL89qva+oMOZMsC1B
 XQc1WPuY/WhsaZUkon4qW5dmlk3JdFCOBR7DstyCNa5HsHFAnxckeQBcNSh7av05Ruyh
 JRvA==
X-Gm-Message-State: AOAM533nMZGmwGKTk4kUMqlvtUQJ1EVQtVI41nzJYWo9GmDWlY3eZCfq
 8wj2v5FKOl52/Jj16m1Cy5pRQpYNIf6VMEawN9o=
X-Google-Smtp-Source: ABdhPJwmAFQBLjfJv2oAI+tjtVSzitFD43gcHwy/PmXF0tW2Y92eH8I93xM2Z/ZhPXT+SXO7nl0CHqvgooMCInY+9Js=
X-Received: by 2002:a54:4690:: with SMTP id k16mr2621232oic.57.1624444802385; 
 Wed, 23 Jun 2021 03:40:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210617190739.3673064-1-jusual@redhat.com>
 <20210617190739.3673064-3-jusual@redhat.com>
In-Reply-To: <20210617190739.3673064-3-jusual@redhat.com>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Wed, 23 Jun 2021 13:39:51 +0300
Message-ID: <CAC_L=vX_5JGub+-idY4kb8eBwX38HjO3YqJ9+9iF0pTJLQ_vVw@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] hw/i386/acpi-build: Add ACPI PCI hot-plug methods
 to Q35
To: Julia Suvorova <jusual@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000674b4b05c56c8765"
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000674b4b05c56c8765
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 17, 2021 at 10:08 PM Julia Suvorova <jusual@redhat.com> wrote:

> Implement notifications and gpe to support q35 ACPI PCI hot-plug.
> Use 0xcc4 - 0xcd7 range for 'acpi-pci-hotplug' io ports.
>
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/i386/acpi-build.h    |  4 ++++
>  include/hw/acpi/ich9.h  |  2 ++
>  include/hw/acpi/pcihp.h |  3 ++-
>  hw/acpi/pcihp.c         |  6 +++---
>  hw/acpi/piix4.c         |  4 +++-
>  hw/i386/acpi-build.c    | 30 +++++++++++++++++++-----------
>  6 files changed, 33 insertions(+), 16 deletions(-)
>
> diff --git a/hw/i386/acpi-build.h b/hw/i386/acpi-build.h
> index 74df5fc612..487ec7710f 100644
> --- a/hw/i386/acpi-build.h
> +++ b/hw/i386/acpi-build.h
> @@ -5,6 +5,10 @@
>
>  extern const struct AcpiGenericAddress x86_nvdimm_acpi_dsmio;
>
> +/* PCI Hot-plug registers bases. See docs/spec/acpi_pci_hotplug.txt */
> +#define ACPI_PCIHP_SEJ_BASE 0x8
> +#define ACPI_PCIHP_BNMR_BASE 0x10
> +
>  void acpi_setup(void);
>
>  #endif
> diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
> index df519e40b5..596120d97f 100644
> --- a/include/hw/acpi/ich9.h
> +++ b/include/hw/acpi/ich9.h
> @@ -28,6 +28,8 @@
>  #include "hw/acpi/acpi_dev_interface.h"
>  #include "hw/acpi/tco.h"
>
> +#define ACPI_PCIHP_ADDR_ICH9 0x0cc4
> +
>  typedef struct ICH9LPCPMRegs {
>      /*
>       * In ich9 spec says that pm1_cnt register is 32bit width and
> diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
> index 2dd90aea30..af1a169fc3 100644
> --- a/include/hw/acpi/pcihp.h
> +++ b/include/hw/acpi/pcihp.h
> @@ -55,7 +55,8 @@ typedef struct AcpiPciHpState {
>  } AcpiPciHpState;
>
>  void acpi_pcihp_init(Object *owner, AcpiPciHpState *, PCIBus *root,
> -                     MemoryRegion *address_space_io, bool
> bridges_enabled);
> +                     MemoryRegion *address_space_io, bool bridges_enabled,
> +                     uint16_t io_base);
>
>  void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>                                     DeviceState *dev, Error **errp);
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 09f531e941..a55992ed9f 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -37,7 +37,6 @@
>  #include "qom/qom-qobject.h"
>  #include "trace.h"
>
> -#define ACPI_PCIHP_ADDR 0xae00
>  #define ACPI_PCIHP_SIZE 0x0018
>  #define PCI_UP_BASE 0x0000
>  #define PCI_DOWN_BASE 0x0004
> @@ -489,10 +488,11 @@ static const MemoryRegionOps acpi_pcihp_io_ops = {
>  };
>
>  void acpi_pcihp_init(Object *owner, AcpiPciHpState *s, PCIBus *root_bus,
> -                     MemoryRegion *address_space_io, bool bridges_enabled)
> +                     MemoryRegion *address_space_io, bool bridges_enabled,
> +                     uint16_t io_base)
>  {
>      s->io_len = ACPI_PCIHP_SIZE;
> -    s->io_base = ACPI_PCIHP_ADDR;
> +    s->io_base = io_base;
>
>      s->root = root_bus;
>      s->legacy_piix = !bridges_enabled;
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index 0bd23d74e2..48f7a1edbc 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -49,6 +49,8 @@
>  #define GPE_BASE 0xafe0
>  #define GPE_LEN 4
>
> +#define ACPI_PCIHP_ADDR_PIIX4 0xae00
> +
>  struct pci_status {
>      uint32_t up; /* deprecated, maintained for migration compatibility */
>      uint32_t down;
> @@ -607,7 +609,7 @@ static void
> piix4_acpi_system_hot_add_init(MemoryRegion *parent,
>
>      if (s->use_acpi_hotplug_bridge || s->use_acpi_root_pci_hotplug) {
>          acpi_pcihp_init(OBJECT(s), &s->acpi_pci_hotplug, bus, parent,
> -                        s->use_acpi_hotplug_bridge);
> +                        s->use_acpi_hotplug_bridge,
> ACPI_PCIHP_ADDR_PIIX4);
>      }
>
>      s->cpu_hotplug_legacy = true;
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 796ffc6f5c..67753638e4 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -219,10 +219,6 @@ static void acpi_get_pm_info(MachineState *machine,
> AcpiPmInfo *pm)
>          /* w2k requires FADT(rev1) or it won't boot, keep PC compatible */
>          pm->fadt.rev = 1;
>          pm->cpu_hp_io_base = PIIX4_CPU_HOTPLUG_IO_BASE;
> -        pm->pcihp_io_base =
> -            object_property_get_uint(obj, ACPI_PCIHP_IO_BASE_PROP, NULL);
> -        pm->pcihp_io_len =
> -            object_property_get_uint(obj, ACPI_PCIHP_IO_LEN_PROP, NULL);
>      }
>      if (lpc) {
>          uint64_t smi_features = object_property_get_uint(lpc,
> @@ -238,6 +234,10 @@ static void acpi_get_pm_info(MachineState *machine,
> AcpiPmInfo *pm)
>          pm->smi_on_cpu_unplug =
>              !!(smi_features & BIT_ULL(ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT));
>      }
> +    pm->pcihp_io_base =
> +        object_property_get_uint(obj, ACPI_PCIHP_IO_BASE_PROP, NULL);
> +    pm->pcihp_io_len =
> +        object_property_get_uint(obj, ACPI_PCIHP_IO_LEN_PROP, NULL);
>
>      /* The above need not be conditional on machine type because the
> reset port
>       * happens to be the same on PIIX (pc) and ICH9 (q35). */
> @@ -392,6 +392,9 @@ static void build_append_pci_bus_devices(Aml
> *parent_scope, PCIBus *bus,
>
>          if (!pdev) {
>              if (bsel) { /* add hotplug slots for non present devices */
> +                if (pci_bus_is_express(bus) && slot > 0) {
> +                    break;
> +                }
>                  dev = aml_device("S%.02X", PCI_DEVFN(slot, 0));
>                  aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
>                  aml_append(dev, aml_name_decl("_ADR", aml_int(slot <<
> 16)));
> @@ -516,7 +519,7 @@ static void build_append_pci_bus_devices(Aml
> *parent_scope, PCIBus *bus,
>              QLIST_FOREACH(sec, &bus->child, sibling) {
>                  int32_t devfn = sec->parent_dev->devfn;
>
> -                if (pci_bus_is_root(sec) || pci_bus_is_express(sec)) {
> +                if (pci_bus_is_root(sec)) {
>                      continue;
>                  }
>
> @@ -1246,7 +1249,7 @@ static void build_piix4_isa_bridge(Aml *table)
>      aml_append(table, scope);
>  }
>
> -static void build_piix4_pci_hotplug(Aml *table)
> +static void build_x86_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr)
>

I think "build_acpi_pci_hotplug" would be enough, I don't think it is x86
specific
however it is not worth a re-spin only for the name.


>  {
>      Aml *scope;
>      Aml *field;
> @@ -1255,20 +1258,22 @@ static void build_piix4_pci_hotplug(Aml *table)
>      scope =  aml_scope("_SB.PCI0");
>
>      aml_append(scope,
> -        aml_operation_region("PCST", AML_SYSTEM_IO, aml_int(0xae00),
> 0x08));
> +        aml_operation_region("PCST", AML_SYSTEM_IO, aml_int(pcihp_addr),
> 0x08));
>      field = aml_field("PCST", AML_DWORD_ACC, AML_NOLOCK,
> AML_WRITE_AS_ZEROS);
>      aml_append(field, aml_named_field("PCIU", 32));
>      aml_append(field, aml_named_field("PCID", 32));
>      aml_append(scope, field);
>
>      aml_append(scope,
> -        aml_operation_region("SEJ", AML_SYSTEM_IO, aml_int(0xae08),
> 0x04));
> +        aml_operation_region("SEJ", AML_SYSTEM_IO,
> +                             aml_int(pcihp_addr + ACPI_PCIHP_SEJ_BASE),
> 0x04));
>      field = aml_field("SEJ", AML_DWORD_ACC, AML_NOLOCK,
> AML_WRITE_AS_ZEROS);
>      aml_append(field, aml_named_field("B0EJ", 32));
>      aml_append(scope, field);
>
>      aml_append(scope,
> -        aml_operation_region("BNMR", AML_SYSTEM_IO, aml_int(0xae10),
> 0x08));
> +        aml_operation_region("BNMR", AML_SYSTEM_IO,
> +                             aml_int(pcihp_addr + ACPI_PCIHP_BNMR_BASE),
> 0x08));
>      field = aml_field("BNMR", AML_DWORD_ACC, AML_NOLOCK,
> AML_WRITE_AS_ZEROS);
>      aml_append(field, aml_named_field("BNUM", 32));
>      aml_append(field, aml_named_field("PIDX", 32));
> @@ -1402,7 +1407,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>          build_piix4_isa_bridge(dsdt);
>          build_isa_devices_aml(dsdt);
>          if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
> -            build_piix4_pci_hotplug(dsdt);
> +            build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
>          }
>          build_piix4_pci0_int(dsdt);
>      } else {
> @@ -1450,6 +1455,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>          }
>          build_q35_isa_bridge(dsdt);
>          build_isa_devices_aml(dsdt);
> +        if (pm->pcihp_bridge_en) {
> +            build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
> +        }
>          build_q35_pci0_int(dsdt);
>          if (pcms->smbus && !pcmc->do_not_add_smb_acpi) {
>              build_smb0(dsdt, pcms->smbus, ICH9_SMB_DEV, ICH9_SMB_FUNC);
> @@ -1484,7 +1492,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>      {
>          aml_append(scope, aml_name_decl("_HID", aml_string("ACPI0006")));
>
> -        if (misc->is_piix4 && (pm->pcihp_bridge_en || pm->pcihp_root_en))
> {
> +        if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
>              method = aml_method("_E01", 0, AML_NOTSERIALIZED);
>              aml_append(method,
>                  aml_acquire(aml_name("\\_SB.PCI0.BLCK"), 0xFFFF));
> --
> 2.30.2
>
>
Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>

Thanks,
Marcel

--000000000000674b4b05c56c8765
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 17, 2021 at 10:08 PM Juli=
a Suvorova &lt;<a href=3D"mailto:jusual@redhat.com" target=3D"_blank">jusua=
l@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Implement notifications and gpe to support q35 ACPI PCI hot-plu=
g.<br>
Use 0xcc4 - 0xcd7 range for &#39;acpi-pci-hotplug&#39; io ports.<br>
<br>
Signed-off-by: Julia Suvorova &lt;<a href=3D"mailto:jusual@redhat.com" targ=
et=3D"_blank">jusual@redhat.com</a>&gt;<br>
Reviewed-by: Igor Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com" targe=
t=3D"_blank">imammedo@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/i386/acpi-build.h=C2=A0 =C2=A0 |=C2=A0 4 ++++<br>
=C2=A0include/hw/acpi/ich9.h=C2=A0 |=C2=A0 2 ++<br>
=C2=A0include/hw/acpi/pcihp.h |=C2=A0 3 ++-<br>
=C2=A0hw/acpi/pcihp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++---<br>
=C2=A0hw/acpi/piix4.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +++-<br>
=C2=A0hw/i386/acpi-build.c=C2=A0 =C2=A0 | 30 +++++++++++++++++++-----------=
<br>
=C2=A06 files changed, 33 insertions(+), 16 deletions(-)<br>
<br>
diff --git a/hw/i386/acpi-build.h b/hw/i386/acpi-build.h<br>
index 74df5fc612..487ec7710f 100644<br>
--- a/hw/i386/acpi-build.h<br>
+++ b/hw/i386/acpi-build.h<br>
@@ -5,6 +5,10 @@<br>
<br>
=C2=A0extern const struct AcpiGenericAddress x86_nvdimm_acpi_dsmio;<br>
<br>
+/* PCI Hot-plug registers bases. See docs/spec/acpi_pci_hotplug.txt */<br>
+#define ACPI_PCIHP_SEJ_BASE 0x8<br>
+#define ACPI_PCIHP_BNMR_BASE 0x10<br>
+<br>
=C2=A0void acpi_setup(void);<br>
<br>
=C2=A0#endif<br>
diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h<br>
index df519e40b5..596120d97f 100644<br>
--- a/include/hw/acpi/ich9.h<br>
+++ b/include/hw/acpi/ich9.h<br>
@@ -28,6 +28,8 @@<br>
=C2=A0#include &quot;hw/acpi/acpi_dev_interface.h&quot;<br>
=C2=A0#include &quot;hw/acpi/tco.h&quot;<br>
<br>
+#define ACPI_PCIHP_ADDR_ICH9 0x0cc4<br>
+<br>
=C2=A0typedef struct ICH9LPCPMRegs {<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * In ich9 spec says that pm1_cnt register is 32bit wid=
th and<br>
diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h<br>
index 2dd90aea30..af1a169fc3 100644<br>
--- a/include/hw/acpi/pcihp.h<br>
+++ b/include/hw/acpi/pcihp.h<br>
@@ -55,7 +55,8 @@ typedef struct AcpiPciHpState {<br>
=C2=A0} AcpiPciHpState;<br>
<br>
=C2=A0void acpi_pcihp_init(Object *owner, AcpiPciHpState *, PCIBus *root,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0MemoryRegion *address_space_io, bool bridges_enabled);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0MemoryRegion *address_space_io, bool bridges_enabled,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0uint16_t io_base);<br>
<br>
=C2=A0void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DeviceState *dev, Erro=
r **errp);<br>
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c<br>
index 09f531e941..a55992ed9f 100644<br>
--- a/hw/acpi/pcihp.c<br>
+++ b/hw/acpi/pcihp.c<br>
@@ -37,7 +37,6 @@<br>
=C2=A0#include &quot;qom/qom-qobject.h&quot;<br>
=C2=A0#include &quot;trace.h&quot;<br>
<br>
-#define ACPI_PCIHP_ADDR 0xae00<br>
=C2=A0#define ACPI_PCIHP_SIZE 0x0018<br>
=C2=A0#define PCI_UP_BASE 0x0000<br>
=C2=A0#define PCI_DOWN_BASE 0x0004<br>
@@ -489,10 +488,11 @@ static const MemoryRegionOps acpi_pcihp_io_ops =3D {<=
br>
=C2=A0};<br>
<br>
=C2=A0void acpi_pcihp_init(Object *owner, AcpiPciHpState *s, PCIBus *root_b=
us,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0MemoryRegion *address_space_io, bool bridges_enabled)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0MemoryRegion *address_space_io, bool bridges_enabled,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0uint16_t io_base)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;io_len =3D ACPI_PCIHP_SIZE;<br>
-=C2=A0 =C2=A0 s-&gt;io_base =3D ACPI_PCIHP_ADDR;<br>
+=C2=A0 =C2=A0 s-&gt;io_base =3D io_base;<br>
<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;root =3D root_bus;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;legacy_piix =3D !bridges_enabled;<br>
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c<br>
index 0bd23d74e2..48f7a1edbc 100644<br>
--- a/hw/acpi/piix4.c<br>
+++ b/hw/acpi/piix4.c<br>
@@ -49,6 +49,8 @@<br>
=C2=A0#define GPE_BASE 0xafe0<br>
=C2=A0#define GPE_LEN 4<br>
<br>
+#define ACPI_PCIHP_ADDR_PIIX4 0xae00<br>
+<br>
=C2=A0struct pci_status {<br>
=C2=A0 =C2=A0 =C2=A0uint32_t up; /* deprecated, maintained for migration co=
mpatibility */<br>
=C2=A0 =C2=A0 =C2=A0uint32_t down;<br>
@@ -607,7 +609,7 @@ static void piix4_acpi_system_hot_add_init(MemoryRegion=
 *parent,<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;use_acpi_hotplug_bridge || s-&gt;use_acpi_roo=
t_pci_hotplug) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0acpi_pcihp_init(OBJECT(s), &amp;s-&gt;acp=
i_pci_hotplug, bus, parent,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 s-&gt;use_acpi_hotplug_bridge);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 s-&gt;use_acpi_hotplug_bridge, ACPI_PCIHP_ADDR_PIIX4);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;cpu_hotplug_legacy =3D true;<br>
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c<br>
index 796ffc6f5c..67753638e4 100644<br>
--- a/hw/i386/acpi-build.c<br>
+++ b/hw/i386/acpi-build.c<br>
@@ -219,10 +219,6 @@ static void acpi_get_pm_info(MachineState *machine, Ac=
piPmInfo *pm)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* w2k requires FADT(rev1) or it won&#39;=
t boot, keep PC compatible */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pm-&gt;fadt.rev =3D 1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pm-&gt;cpu_hp_io_base =3D PIIX4_CPU_HOTPL=
UG_IO_BASE;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pm-&gt;pcihp_io_base =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 object_property_get_uint(obj, AC=
PI_PCIHP_IO_BASE_PROP, NULL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pm-&gt;pcihp_io_len =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 object_property_get_uint(obj, AC=
PI_PCIHP_IO_LEN_PROP, NULL);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (lpc) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t smi_features =3D object_property=
_get_uint(lpc,<br>
@@ -238,6 +234,10 @@ static void acpi_get_pm_info(MachineState *machine, Ac=
piPmInfo *pm)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pm-&gt;smi_on_cpu_unplug =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!!(smi_features &amp; BIT_U=
LL(ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT));<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 pm-&gt;pcihp_io_base =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_property_get_uint(obj, ACPI_PCIHP_IO_BA=
SE_PROP, NULL);<br>
+=C2=A0 =C2=A0 pm-&gt;pcihp_io_len =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_property_get_uint(obj, ACPI_PCIHP_IO_LE=
N_PROP, NULL);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* The above need not be conditional on machine type be=
cause the reset port<br>
=C2=A0 =C2=A0 =C2=A0 * happens to be the same on PIIX (pc) and ICH9 (q35). =
*/<br>
@@ -392,6 +392,9 @@ static void build_append_pci_bus_devices(Aml *parent_sc=
ope, PCIBus *bus,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pdev) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bsel) { /* add hotplug =
slots for non present devices */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pci_bus_is_exp=
ress(bus) &amp;&amp; slot &gt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brea=
k;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev =3D aml_d=
evice(&quot;S%.02X&quot;, PCI_DEVFN(slot, 0));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aml_append(de=
v, aml_name_decl(&quot;_SUN&quot;, aml_int(slot)));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aml_append(de=
v, aml_name_decl(&quot;_ADR&quot;, aml_int(slot &lt;&lt; 16)));<br>
@@ -516,7 +519,7 @@ static void build_append_pci_bus_devices(Aml *parent_sc=
ope, PCIBus *bus,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QLIST_FOREACH(sec, &amp;bus=
-&gt;child, sibling) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int32_t devfn=
 =3D sec-&gt;parent_dev-&gt;devfn;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pci_bus_is_roo=
t(sec) || pci_bus_is_express(sec)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pci_bus_is_roo=
t(sec)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0continue;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -1246,7 +1249,7 @@ static void build_piix4_isa_bridge(Aml *table)<br>
=C2=A0 =C2=A0 =C2=A0aml_append(table, scope);<br>
=C2=A0}<br>
<br>
-static void build_piix4_pci_hotplug(Aml *table)<br>
+static void build_x86_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr)<br=
></blockquote><div><br></div><div>I think &quot;build_acpi_pci_hotplug&quot=
; would be enough, I don&#39;t think it is x86 specific</div><div>however i=
t is not worth a re-spin only for the name.</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0Aml *scope;<br>
=C2=A0 =C2=A0 =C2=A0Aml *field;<br>
@@ -1255,20 +1258,22 @@ static void build_piix4_pci_hotplug(Aml *table)<br>
=C2=A0 =C2=A0 =C2=A0scope =3D=C2=A0 aml_scope(&quot;_SB.PCI0&quot;);<br>
<br>
=C2=A0 =C2=A0 =C2=A0aml_append(scope,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 aml_operation_region(&quot;PCST&quot;, AML_SYS=
TEM_IO, aml_int(0xae00), 0x08));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 aml_operation_region(&quot;PCST&quot;, AML_SYS=
TEM_IO, aml_int(pcihp_addr), 0x08));<br>
=C2=A0 =C2=A0 =C2=A0field =3D aml_field(&quot;PCST&quot;, AML_DWORD_ACC, AM=
L_NOLOCK, AML_WRITE_AS_ZEROS);<br>
=C2=A0 =C2=A0 =C2=A0aml_append(field, aml_named_field(&quot;PCIU&quot;, 32)=
);<br>
=C2=A0 =C2=A0 =C2=A0aml_append(field, aml_named_field(&quot;PCID&quot;, 32)=
);<br>
=C2=A0 =C2=A0 =C2=A0aml_append(scope, field);<br>
<br>
=C2=A0 =C2=A0 =C2=A0aml_append(scope,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 aml_operation_region(&quot;SEJ&quot;, AML_SYST=
EM_IO, aml_int(0xae08), 0x04));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 aml_operation_region(&quot;SEJ&quot;, AML_SYST=
EM_IO,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aml_int(pcihp_addr + ACPI_PCIHP_SEJ_BASE), 0=
x04));<br>
=C2=A0 =C2=A0 =C2=A0field =3D aml_field(&quot;SEJ&quot;, AML_DWORD_ACC, AML=
_NOLOCK, AML_WRITE_AS_ZEROS);<br>
=C2=A0 =C2=A0 =C2=A0aml_append(field, aml_named_field(&quot;B0EJ&quot;, 32)=
);<br>
=C2=A0 =C2=A0 =C2=A0aml_append(scope, field);<br>
<br>
=C2=A0 =C2=A0 =C2=A0aml_append(scope,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 aml_operation_region(&quot;BNMR&quot;, AML_SYS=
TEM_IO, aml_int(0xae10), 0x08));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 aml_operation_region(&quot;BNMR&quot;, AML_SYS=
TEM_IO,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aml_int(pcihp_addr + ACPI_PCIHP_BNMR_BASE), =
0x08));<br>
=C2=A0 =C2=A0 =C2=A0field =3D aml_field(&quot;BNMR&quot;, AML_DWORD_ACC, AM=
L_NOLOCK, AML_WRITE_AS_ZEROS);<br>
=C2=A0 =C2=A0 =C2=A0aml_append(field, aml_named_field(&quot;BNUM&quot;, 32)=
);<br>
=C2=A0 =C2=A0 =C2=A0aml_append(field, aml_named_field(&quot;PIDX&quot;, 32)=
);<br>
@@ -1402,7 +1407,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0build_piix4_isa_bridge(dsdt);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0build_isa_devices_aml(dsdt);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pm-&gt;pcihp_bridge_en || pm-&gt;pcih=
p_root_en) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build_piix4_pci_hotplug(dsdt);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build_x86_acpi_pci_hotplug(dsdt,=
 pm-&gt;pcihp_io_base);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0build_piix4_pci0_int(dsdt);<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
@@ -1450,6 +1455,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0build_q35_isa_bridge(dsdt);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0build_isa_devices_aml(dsdt);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pm-&gt;pcihp_bridge_en) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build_x86_acpi_pci_hotplug(dsdt,=
 pm-&gt;pcihp_io_base);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0build_q35_pci0_int(dsdt);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pcms-&gt;smbus &amp;&amp; !pcmc-&gt;d=
o_not_add_smb_acpi) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0build_smb0(dsdt, pcms-&gt;s=
mbus, ICH9_SMB_DEV, ICH9_SMB_FUNC);<br>
@@ -1484,7 +1492,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,<br=
>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aml_append(scope, aml_name_decl(&quot;_HI=
D&quot;, aml_string(&quot;ACPI0006&quot;)));<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (misc-&gt;is_piix4 &amp;&amp; (pm-&gt;pcihp=
_bridge_en || pm-&gt;pcihp_root_en)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pm-&gt;pcihp_bridge_en || pm-&gt;pcihp_roo=
t_en) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0method =3D aml_method(&quot=
;_E01&quot;, 0, AML_NOTSERIALIZED);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aml_append(method,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aml_acquire(a=
ml_name(&quot;\\_SB.PCI0.BLCK&quot;), 0xFFFF));<br>
-- <br>
2.30.2<br>
<br></blockquote><div><br></div><div><div>Reviewed-by: Marcel Apfelbaum &lt=
;<a href=3D"mailto:marcel.apfelbaum@gmail.com" target=3D"_blank">marcel.apf=
elbaum@gmail.com</a>&gt;<br></div><div><br></div><div>Thanks,</div><div>Mar=
cel</div></div><div>=C2=A0</div></div></div>

--000000000000674b4b05c56c8765--

