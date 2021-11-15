Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E48450204
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 11:08:57 +0100 (CET)
Received: from localhost ([::1]:40216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmYv2-0007DT-SX
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 05:08:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mmYrN-0004Eb-Ai
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 05:05:09 -0500
Received: from [2607:f8b0:4864:20::629] (port=40857
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mmYrL-0006C1-08
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 05:05:08 -0500
Received: by mail-pl1-x629.google.com with SMTP id v19so3291566plo.7
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 02:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=kAc8473QvrYi5CIWhViW+9iK0775TnP6ZYYzkx04OsY=;
 b=5YZAtWJ9LE0dyHNoBHyMEmxi6krpBBrWK3VS8PJ4FqsdUiwFAKrHLcms94oJPHzaRC
 qBimdJUXoOcvqas+s8EHYETCS3L49UuHAk8zKbbxaq3aJeccRUckA+GxhG3C74doYO5b
 hR+BFZeFlCtf3/dWkY+ywB8gdgnIh7g3VoIOv/SdsagPTMBK2WD27JBNmBL6zh8wWjZm
 HcSobroVIpWlBf+NbkhOVPHVzc7BcYVjbor3P8dFSa+l1BThSQdLdqSbHs/sPrdOQUz0
 eKI1tDQpr6K8Df4ErFHQJva+moIKfwI1uZRAay3yo4fYETkXJmQfPEkV/2MfcEjHYAXW
 7z9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=kAc8473QvrYi5CIWhViW+9iK0775TnP6ZYYzkx04OsY=;
 b=Nq1nU6boO57sjEOoicI9DtvPbeqhGCopM/k9gMuGNqMl3k2VdqNsSBggsLUmKL+3BX
 Yv/4JqR6Nf9fwz1iwftQ905hgBSytG/mtGPvR0nMuKB6hJveI7eiruMDnNv087SwQsbe
 Om0GQMXa5V36sPkR2oJmHWJpSCB2Mk+evGtxpp7J8Pzx3ZqCZXTUl30s2vLEi99AKfFl
 cmMqkPrBrIE4PXR+l9xj/EXHbR7jREWtb78ckoGp1pGQDJt7OstdCINjPF6dfOMbLdKR
 MBIEYdw49LazObINXHE8RA5+m0yWyHPgNpMhhHkAFc/wAP8jYJkhM5niZGkr1lGqFUcw
 Myfw==
X-Gm-Message-State: AOAM533v8kgU7EZtmRy9twvIdgWgNa7ibv2elrfWJn8h5E61cp/Tmgge
 44kzPqh99Kcs4Nu+h6dthDpQRA==
X-Google-Smtp-Source: ABdhPJyizFc5UUir1/EaCEOlI63JPGrQXrGKUYoTP0TX+P9M9akccYhyZkwE+sVXGZ+xfYRGZNhT/g==
X-Received: by 2002:a17:90b:1c8d:: with SMTP id
 oo13mr19644309pjb.239.1636970705507; 
 Mon, 15 Nov 2021 02:05:05 -0800 (PST)
Received: from anisinha-lenovo ([49.207.202.156])
 by smtp.googlemail.com with ESMTPSA id i5sm11662939pgo.36.2021.11.15.02.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 02:05:05 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Mon, 15 Nov 2021 15:35:00 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH for 6.2 v2 2/5] hw/acpi/ich9: Add compat prop to keep
 HPC bit set for 6.1 machine type
In-Reply-To: <20211110211140.3057199-3-imammedo@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2111151532540.505682@anisinha-lenovo>
References: <20211110211140.3057199-1-imammedo@redhat.com>
 <20211110211140.3057199-3-imammedo@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::629;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x629.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: mapfelba@redhat.com, mst@redhat.com, jusual@redhat.com,
 qemu-devel@nongnu.org, kraxel@redhat.com, ani@anisinha.ca
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Wed, 10 Nov 2021, Igor Mammedov wrote:

> From: Julia Suvorova <jusual@redhat.com>
>
> To solve issues [1-2] the Hot Plug Capable bit in PCIe Slots will be
> turned on, while the switch to ACPI Hot-plug will be done in the
> DSDT table.
>
> Introducing 'x-keep-native-hpc' property disables the HPC bit only
> in 6.1 and as a result keeps the forced 'reserve-io' on
> pcie-root-ports in 6.1 too.
>
> [1] https://gitlab.com/qemu-project/qemu/-/issues/641
> [2] https://bugzilla.redhat.com/show_bug.cgi?id=2006409
>
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

This patch is a little bit hard to read ... but ...

> ---
> v2:
>    * s/native-hpc-bit/x-native-hotplug/ to fix conflict
> ---
>  include/hw/acpi/ich9.h |  1 +
>  hw/acpi/ich9.c         | 18 ++++++++++++++++++
>  hw/i386/pc.c           |  2 ++
>  hw/i386/pc_q35.c       |  7 ++++++-
>  4 files changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
> index f04f1791bd..7ca92843c6 100644
> --- a/include/hw/acpi/ich9.h
> +++ b/include/hw/acpi/ich9.h
> @@ -56,6 +56,7 @@ typedef struct ICH9LPCPMRegs {
>      AcpiCpuHotplug gpe_cpu;
>      CPUHotplugState cpuhp_state;
>
> +    bool keep_pci_slot_hpc;
>      bool use_acpi_hotplug_bridge;
>      AcpiPciHpState acpi_pci_hotplug;
>      MemHotplugState acpi_memory_hotplug;
> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> index 1ee2ba2c50..ebe08ed831 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -419,6 +419,20 @@ static void ich9_pm_set_acpi_pci_hotplug(Object *obj, bool value, Error **errp)
>      s->pm.use_acpi_hotplug_bridge = value;
>  }
>
> +static bool ich9_pm_get_keep_pci_slot_hpc(Object *obj, Error **errp)
> +{
> +    ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
> +
> +    return s->pm.keep_pci_slot_hpc;
> +}
> +
> +static void ich9_pm_set_keep_pci_slot_hpc(Object *obj, bool value, Error **errp)
> +{
> +    ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
> +
> +    s->pm.keep_pci_slot_hpc = value;
> +}
> +
>  void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
>  {
>      static const uint32_t gpe0_len = ICH9_PMIO_GPE0_LEN;
> @@ -428,6 +442,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
>      pm->disable_s4 = 0;
>      pm->s4_val = 2;
>      pm->use_acpi_hotplug_bridge = true;
> +    pm->keep_pci_slot_hpc = true;
>
>      object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_BASE,
>                                     &pm->pm_io_base, OBJ_PROP_FLAG_READ);
> @@ -454,6 +469,9 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
>      object_property_add_bool(obj, ACPI_PM_PROP_ACPI_PCIHP_BRIDGE,
>                               ich9_pm_get_acpi_pci_hotplug,
>                               ich9_pm_set_acpi_pci_hotplug);
> +    object_property_add_bool(obj, "x-keep-pci-slot-hpc",
> +                             ich9_pm_get_keep_pci_slot_hpc,
> +                             ich9_pm_set_keep_pci_slot_hpc);
>  }
>
>  void ich9_pm_device_pre_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 2592a82148..a2ef40ecbc 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -98,6 +98,7 @@ GlobalProperty pc_compat_6_1[] = {
>      { TYPE_X86_CPU, "hv-version-id-build", "0x1bbc" },
>      { TYPE_X86_CPU, "hv-version-id-major", "0x0006" },
>      { TYPE_X86_CPU, "hv-version-id-minor", "0x0001" },
> +    { "ICH9-LPC", "x-keep-pci-slot-hpc", "false" },
>  };
>  const size_t pc_compat_6_1_len = G_N_ELEMENTS(pc_compat_6_1);
>
> @@ -107,6 +108,7 @@ GlobalProperty pc_compat_6_0[] = {
>      { "qemu64" "-" TYPE_X86_CPU, "stepping", "3" },
>      { TYPE_X86_CPU, "x-vendor-cpuid-only", "off" },
>      { "ICH9-LPC", ACPI_PM_PROP_ACPI_PCIHP_BRIDGE, "off" },
> +    { "ICH9-LPC", "x-keep-pci-slot-hpc", "true" },
>  };
>  const size_t pc_compat_6_0_len = G_N_ELEMENTS(pc_compat_6_0);
>
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index fc34b905ee..e1e100316d 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -137,6 +137,7 @@ static void pc_q35_init(MachineState *machine)
>      DriveInfo *hd[MAX_SATA_PORTS];
>      MachineClass *mc = MACHINE_GET_CLASS(machine);
>      bool acpi_pcihp;
> +    bool keep_pci_slot_hpc;
>
>      /* Check whether RAM fits below 4G (leaving 1/2 GByte for IO memory
>       * and 256 Mbytes for PCI Express Enhanced Configuration Access Mapping
> @@ -242,7 +243,11 @@ static void pc_q35_init(MachineState *machine)
>                                            ACPI_PM_PROP_ACPI_PCIHP_BRIDGE,
>                                            NULL);
>
> -    if (acpi_pcihp) {
> +    keep_pci_slot_hpc = object_property_get_bool(OBJECT(lpc),
> +                                                 "x-keep-pci-slot-hpc",
> +                                                 NULL);
> +
> +    if (!keep_pci_slot_hpc && acpi_pcihp) {

Does this mean we are adding "x-native-hotplug" property for pcie
slots only for 6.1 by default unless users pass x-keep-pci-slot-hpc =
false manually?

>          object_register_sugar_prop(TYPE_PCIE_SLOT, "x-native-hotplug",
>                                     "false", true);
>      }
> --
> 2.27.0
>
>

