Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A908A452C60
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 09:05:07 +0100 (CET)
Received: from localhost ([::1]:51562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmtSk-0005Qg-9X
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 03:05:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mmtQ9-0003eE-3O
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 03:02:26 -0500
Received: from [2a00:1450:4864:20::531] (port=45743
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mmtQ6-0002bo-UT
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 03:02:24 -0500
Received: by mail-ed1-x531.google.com with SMTP id y12so27379479eda.12
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 00:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IKbBzrIRRVbOs7VSpL7rHEZbz6qnW9O2IxorNQRWD74=;
 b=pkJ8quEkkqhbDw7fj07vbm9zxTVaIjHaypr2z0C/e+bn148oUJ0JHZqFEDjj/vs66r
 FfSUP8R3wxsm4Fs6zJMVFV1pn9FpYOx8yuBAFbQjyhRW9TG28aZmCGMDmKhdi7ubySIF
 kECkQKPYzxC3LEsCzfQyMfUDfMta1227lu+A6Dv1EDKszbvOEnnJ4qy2xRcbXNVDf8BG
 nCl6XseRJ/35H1ciETnDAO41VkMSHDYTuqfmH/RxucRVK+s2FbLntMPgn/EzEFTbtYuY
 e1TMGq15iWZ39LGNqzRu1Evu648qurQD2WN3AUmbsQvaya1022mItA2hhRsSIOIUfFxp
 wolg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IKbBzrIRRVbOs7VSpL7rHEZbz6qnW9O2IxorNQRWD74=;
 b=dKLR49Zcsc25mgAP2GJcYpp6rE00xbuWZw6t8qk7FeNIq2G+QVhqjL+BDMyQ5+Un9U
 ov4NWAMrtDb/vDKZrL9Kj/VsSIzf/+KmUtRkNqL/HVBeotzySBsW6pHRKbd3I64HJT2o
 v0HVpI+T5hQ4PulzQrXPov7A5hSGmzUubQsXg4M+Nu1khan6u48y040yMzHMMe1dX4mW
 W719Mgwy5eAk6TMJoH3Qx8+gLWfp3eC2KMOkCzwCREup9WQnILtNKPPYa0jb76igT6jW
 CwwVv+gUezZe2h3Nd7VAoqEtXrq41O1dMCDe/NonUZ4nl8duSE0aEmR0wt0OI5xck47P
 FuWg==
X-Gm-Message-State: AOAM53388UHGVJ7fKfvrwaFvjw4a+h2eTZmXqVyRtTlBt8/tpl50fbdM
 nbDvUDFQZ+7d6Tn44kccskZl2PSNXLgLWSa4TRub1w==
X-Google-Smtp-Source: ABdhPJzFcPO0/XfWrEWbR73jOUOU+RDQDVMViFhPziZps87oabPsoiqwcabcQGEgzYsf8kcCPRtzbybA4yAaqLAPHEQ=
X-Received: by 2002:a50:ab4b:: with SMTP id t11mr7683354edc.11.1637049740909; 
 Tue, 16 Nov 2021 00:02:20 -0800 (PST)
MIME-Version: 1.0
References: <20211110211140.3057199-1-imammedo@redhat.com>
 <20211110211140.3057199-3-imammedo@redhat.com>
 <alpine.DEB.2.22.394.2111151532540.505682@anisinha-lenovo>
In-Reply-To: <alpine.DEB.2.22.394.2111151532540.505682@anisinha-lenovo>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 16 Nov 2021 13:32:10 +0530
Message-ID: <CAARzgwxyZe-_=Pbo3VVLW3Z_YNj6ZWXJ8pOWqUgmDZbcZBZpJg@mail.gmail.com>
Subject: Re: [PATCH for 6.2 v2 2/5] hw/acpi/ich9: Add compat prop to keep HPC
 bit set for 6.1 machine type
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::531;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x531.google.com
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
Cc: mapfelba@redhat.com, kraxel@redhat.com, jusual@redhat.com,
 qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 15, 2021 at 3:35 PM Ani Sinha <ani@anisinha.ca> wrote:
>
>
>
> On Wed, 10 Nov 2021, Igor Mammedov wrote:
>
> > From: Julia Suvorova <jusual@redhat.com>
> >
> > To solve issues [1-2] the Hot Plug Capable bit in PCIe Slots will be
> > turned on, while the switch to ACPI Hot-plug will be done in the
> > DSDT table.
> >
> > Introducing 'x-keep-native-hpc' property disables the HPC bit only
> > in 6.1 and as a result keeps the forced 'reserve-io' on
> > pcie-root-ports in 6.1 too.
> >
> > [1] https://gitlab.com/qemu-project/qemu/-/issues/641
> > [2] https://bugzilla.redhat.com/show_bug.cgi?id=2006409
> >
> > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>
> This patch is a little bit hard to read ... but ...
>
> > ---
> > v2:
> >    * s/native-hpc-bit/x-native-hotplug/ to fix conflict
> > ---
> >  include/hw/acpi/ich9.h |  1 +
> >  hw/acpi/ich9.c         | 18 ++++++++++++++++++
> >  hw/i386/pc.c           |  2 ++
> >  hw/i386/pc_q35.c       |  7 ++++++-
> >  4 files changed, 27 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
> > index f04f1791bd..7ca92843c6 100644
> > --- a/include/hw/acpi/ich9.h
> > +++ b/include/hw/acpi/ich9.h
> > @@ -56,6 +56,7 @@ typedef struct ICH9LPCPMRegs {
> >      AcpiCpuHotplug gpe_cpu;
> >      CPUHotplugState cpuhp_state;
> >
> > +    bool keep_pci_slot_hpc;
> >      bool use_acpi_hotplug_bridge;
> >      AcpiPciHpState acpi_pci_hotplug;
> >      MemHotplugState acpi_memory_hotplug;
> > diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> > index 1ee2ba2c50..ebe08ed831 100644
> > --- a/hw/acpi/ich9.c
> > +++ b/hw/acpi/ich9.c
> > @@ -419,6 +419,20 @@ static void ich9_pm_set_acpi_pci_hotplug(Object *obj, bool value, Error **errp)
> >      s->pm.use_acpi_hotplug_bridge = value;
> >  }
> >
> > +static bool ich9_pm_get_keep_pci_slot_hpc(Object *obj, Error **errp)
> > +{
> > +    ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
> > +
> > +    return s->pm.keep_pci_slot_hpc;
> > +}
> > +
> > +static void ich9_pm_set_keep_pci_slot_hpc(Object *obj, bool value, Error **errp)
> > +{
> > +    ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
> > +
> > +    s->pm.keep_pci_slot_hpc = value;
> > +}
> > +
> >  void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
> >  {
> >      static const uint32_t gpe0_len = ICH9_PMIO_GPE0_LEN;
> > @@ -428,6 +442,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
> >      pm->disable_s4 = 0;
> >      pm->s4_val = 2;
> >      pm->use_acpi_hotplug_bridge = true;
> > +    pm->keep_pci_slot_hpc = true;
> >
> >      object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_BASE,
> >                                     &pm->pm_io_base, OBJ_PROP_FLAG_READ);
> > @@ -454,6 +469,9 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
> >      object_property_add_bool(obj, ACPI_PM_PROP_ACPI_PCIHP_BRIDGE,
> >                               ich9_pm_get_acpi_pci_hotplug,
> >                               ich9_pm_set_acpi_pci_hotplug);
> > +    object_property_add_bool(obj, "x-keep-pci-slot-hpc",
> > +                             ich9_pm_get_keep_pci_slot_hpc,
> > +                             ich9_pm_set_keep_pci_slot_hpc);
> >  }
> >
> >  void ich9_pm_device_pre_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
> > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> > index 2592a82148..a2ef40ecbc 100644
> > --- a/hw/i386/pc.c
> > +++ b/hw/i386/pc.c
> > @@ -98,6 +98,7 @@ GlobalProperty pc_compat_6_1[] = {
> >      { TYPE_X86_CPU, "hv-version-id-build", "0x1bbc" },
> >      { TYPE_X86_CPU, "hv-version-id-major", "0x0006" },
> >      { TYPE_X86_CPU, "hv-version-id-minor", "0x0001" },
> > +    { "ICH9-LPC", "x-keep-pci-slot-hpc", "false" },
> >  };
> >  const size_t pc_compat_6_1_len = G_N_ELEMENTS(pc_compat_6_1);
> >
> > @@ -107,6 +108,7 @@ GlobalProperty pc_compat_6_0[] = {
> >      { "qemu64" "-" TYPE_X86_CPU, "stepping", "3" },
> >      { TYPE_X86_CPU, "x-vendor-cpuid-only", "off" },
> >      { "ICH9-LPC", ACPI_PM_PROP_ACPI_PCIHP_BRIDGE, "off" },
> > +    { "ICH9-LPC", "x-keep-pci-slot-hpc", "true" },
> >  };
> >  const size_t pc_compat_6_0_len = G_N_ELEMENTS(pc_compat_6_0);
> >
> > diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> > index fc34b905ee..e1e100316d 100644
> > --- a/hw/i386/pc_q35.c
> > +++ b/hw/i386/pc_q35.c
> > @@ -137,6 +137,7 @@ static void pc_q35_init(MachineState *machine)
> >      DriveInfo *hd[MAX_SATA_PORTS];
> >      MachineClass *mc = MACHINE_GET_CLASS(machine);
> >      bool acpi_pcihp;
> > +    bool keep_pci_slot_hpc;
> >
> >      /* Check whether RAM fits below 4G (leaving 1/2 GByte for IO memory
> >       * and 256 Mbytes for PCI Express Enhanced Configuration Access Mapping
> > @@ -242,7 +243,11 @@ static void pc_q35_init(MachineState *machine)
> >                                            ACPI_PM_PROP_ACPI_PCIHP_BRIDGE,
> >                                            NULL);
> >
> > -    if (acpi_pcihp) {
> > +    keep_pci_slot_hpc = object_property_get_bool(OBJECT(lpc),
> > +                                                 "x-keep-pci-slot-hpc",
> > +                                                 NULL);
> > +
> > +    if (!keep_pci_slot_hpc && acpi_pcihp) {
>
> Does this mean we are adding "x-native-hotplug" property for pcie
> slots only for 6.1 by default unless users pass x-keep-pci-slot-hpc =
> false manually?

Ok I get this now. Previously, we were disabling Hot-plug capable
(HPC) bit for PCIE slots unconditionally when ACPI hotplug was
enabled. Now, we do this only for 6.1. For 6.0 and 6.2 and above, we
keep HPC bit ON *but* disable native hotplug advertisement from ACPI
OSC method. The OSC advertisement change is only for 6.2 and above. So
basically if I am not mistaken, we keep 6.1 behavior unchanged.

Am I getting all the parts right?


>
> >          object_register_sugar_prop(TYPE_PCIE_SLOT, "x-native-hotplug",
> >                                     "false", true);
> >      }
> > --
> > 2.27.0
> >
> >

