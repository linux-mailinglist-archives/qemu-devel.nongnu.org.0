Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6815C3BA261
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 16:56:59 +0200 (CEST)
Received: from localhost ([::1]:43278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzKbC-0003P7-FG
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 10:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1lzKaO-0002ey-ET
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 10:56:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1lzKaL-0000b2-Q9
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 10:56:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625237764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qSBr8jKKzM4BmrzC/+0IMOiwZuBYjHe/Zv8g8XLj6+w=;
 b=CYRwLlTr+prqIPHNkeDa/4XTCOTcT7afukCXNz4PkfR6ZRovo4NMmCRxYpT4ZUl4d6obdH
 0g53EaBLQ7nX5UJ4iSd6ILvBUoqreUqo8JwS/7LaFT1/yiNCEu+uhOCyD9F78Tl2J2AS90
 vQNyJZnzFZghx3IFPRV71lIupxOHWSA=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-XIZnRC5sNI-QJvr6f4ufFw-1; Fri, 02 Jul 2021 10:56:00 -0400
X-MC-Unique: XIZnRC5sNI-QJvr6f4ufFw-1
Received: by mail-oi1-f198.google.com with SMTP id
 l189-20020acabbc60000b02901f566a77bb8so5657298oif.7
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 07:56:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qSBr8jKKzM4BmrzC/+0IMOiwZuBYjHe/Zv8g8XLj6+w=;
 b=qr6C8uKoIOmwxW9t1YRYJFr1Bn4ZoTJx5VSo+/nR2Rn0QfInogoFMcJLAXethCbYd4
 Z8ejpJF46LtnVLpU4Y8r8FhIVdXkMiqsnn91TMvpSarqEXLd/eIwTU8DGVNPZuPJCZ47
 1RCTeQQ3aWMVzGzFYYFrt7JqUbVjwFAS2skg2h/vMP+FPl2psg9OhbYq3s8hvvTOAIOT
 X2U8n1Jhvq3AJQWFWzw9o9kJZ0fwGdqCWrOYpesRyjTzhulVkVgn2nXYqVRzeqnySS4p
 KBBn1Ju0eUrEDpPbS+nDDYX2oCj1wdu98AjTnUT/wMUBR6LuZetLEMv3e8WR6EwKIM/2
 Rz6g==
X-Gm-Message-State: AOAM533GediamlD+GtSEPqIMRASzag9Hb8aARXPnQomXngYOOM8HRvBx
 rPjzQkK88FQxzvQ8vtc8FyxthKA2tuB827H2LmL4X1w4LheI7aoNF0ok9eVxkxJDuxY+4zakO/f
 i5OIqR1iBq6iOEDsSRtNYT8D6WzhK1uA=
X-Received: by 2002:a9d:222e:: with SMTP id o43mr4592027ota.316.1625237759498; 
 Fri, 02 Jul 2021 07:55:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxA4MkLcRoMwYThOpcztqiDsx11L85sTSPI/yeHE5iJADu9zdBkdbcohTwmnY570TykPPZ7TamUs3VM6ugogME=
X-Received: by 2002:a9d:222e:: with SMTP id o43mr4592009ota.316.1625237759194; 
 Fri, 02 Jul 2021 07:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210617190739.3673064-1-jusual@redhat.com>
 <20210617190739.3673064-4-jusual@redhat.com>
 <YN1Iq6WDTqCzgmNA@yekko>
In-Reply-To: <YN1Iq6WDTqCzgmNA@yekko>
From: Julia Suvorova <jusual@redhat.com>
Date: Fri, 2 Jul 2021 16:55:47 +0200
Message-ID: <CAMDeoFXZyOt+O90xrRpTD8k7f0M60GVpg3XWfG2+yOAukOFgeA@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] hw/acpi/ich9: Enable ACPI PCI hot-plug
To: David Gibson <david@gibson.dropbear.id.au>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsuvorov@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsuvorov@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.377,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 1, 2021 at 6:59 AM David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Thu, Jun 17, 2021 at 09:07:35PM +0200, Julia Suvorova wrote:
> > Add acpi_pcihp to ich9_pm as part of
> > 'acpi-pci-hotplug-with-bridge-support' option. Set default to false.
> >
> > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> > ---
> >  hw/i386/acpi-build.h   |  1 +
> >  include/hw/acpi/ich9.h |  3 ++
> >  hw/acpi/ich9.c         | 67 ++++++++++++++++++++++++++++++++++++++++++
> >  hw/acpi/pcihp.c        |  5 +++-
> >  hw/i386/acpi-build.c   |  2 +-
> >  5 files changed, 76 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/i386/acpi-build.h b/hw/i386/acpi-build.h
> > index 487ec7710f..0dce155c8c 100644
> > --- a/hw/i386/acpi-build.h
> > +++ b/hw/i386/acpi-build.h
> > @@ -10,5 +10,6 @@ extern const struct AcpiGenericAddress x86_nvdimm_acpi_dsmio;
> >  #define ACPI_PCIHP_BNMR_BASE 0x10
> >
> >  void acpi_setup(void);
> > +Object *acpi_get_i386_pci_host(void);
> >
> >  #endif
> > diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
> > index 596120d97f..a329ce43ab 100644
> > --- a/include/hw/acpi/ich9.h
> > +++ b/include/hw/acpi/ich9.h
> > @@ -24,6 +24,7 @@
> >  #include "hw/acpi/acpi.h"
> >  #include "hw/acpi/cpu_hotplug.h"
> >  #include "hw/acpi/cpu.h"
> > +#include "hw/acpi/pcihp.h"
> >  #include "hw/acpi/memory_hotplug.h"
> >  #include "hw/acpi/acpi_dev_interface.h"
> >  #include "hw/acpi/tco.h"
> > @@ -55,6 +56,8 @@ typedef struct ICH9LPCPMRegs {
> >      AcpiCpuHotplug gpe_cpu;
> >      CPUHotplugState cpuhp_state;
> >
> > +    bool use_acpi_hotplug_bridge;
> > +    AcpiPciHpState acpi_pci_hotplug;
> >      MemHotplugState acpi_memory_hotplug;
> >
> >      uint8_t disable_s3;
> > diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> > index 4daa79ec8d..bcbd567cb0 100644
> > --- a/hw/acpi/ich9.c
> > +++ b/hw/acpi/ich9.c
> > @@ -217,6 +217,26 @@ static const VMStateDescription vmstate_cpuhp_state = {
> >      }
> >  };
> >
> > +static bool vmstate_test_use_pcihp(void *opaque)
> > +{
> > +    ICH9LPCPMRegs *s = opaque;
> > +
> > +    return s->use_acpi_hotplug_bridge;
> > +}
> > +
> > +static const VMStateDescription vmstate_pcihp_state = {
> > +    .name = "ich9_pm/pcihp",
> > +    .version_id = 1,
> > +    .minimum_version_id = 1,
> > +    .needed = vmstate_test_use_pcihp,
> > +    .fields      = (VMStateField[]) {
> > +        VMSTATE_PCI_HOTPLUG(acpi_pci_hotplug,
> > +                            ICH9LPCPMRegs,
> > +                            NULL, NULL),
> > +        VMSTATE_END_OF_LIST()
> > +    }
> > +};
> > +
> >  const VMStateDescription vmstate_ich9_pm = {
> >      .name = "ich9_pm",
> >      .version_id = 1,
> > @@ -238,6 +258,7 @@ const VMStateDescription vmstate_ich9_pm = {
> >          &vmstate_memhp_state,
> >          &vmstate_tco_io_state,
> >          &vmstate_cpuhp_state,
> > +        &vmstate_pcihp_state,
> >          NULL
> >      }
> >  };
> > @@ -259,6 +280,7 @@ static void pm_reset(void *opaque)
> >      }
> >      pm->smi_en_wmask = ~0;
> >
> > +    acpi_pcihp_reset(&pm->acpi_pci_hotplug, true);
>
> Doesn't this need to be protected by if (pm->use_acpi_hotplug_bridge)
> ? Otherwise pm->acpi_pci_hotplug won't be initialized.

Yes, you're right. Although it doesn't affect anything now, it should
be fixed. I'll send a patch on top.

> >      acpi_update_sci(&pm->acpi_regs, pm->irq);
> >  }
> >
> > @@ -297,6 +319,18 @@ void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *pm,
> >      pm->enable_tco = true;
> >      acpi_pm_tco_init(&pm->tco_regs, &pm->io);
> >
> > +    if (pm->use_acpi_hotplug_bridge) {
> > +        acpi_pcihp_init(OBJECT(lpc_pci),
> > +                        &pm->acpi_pci_hotplug,
> > +                        pci_get_bus(lpc_pci),
> > +                        pci_address_space_io(lpc_pci),
> > +                        true,
> > +                        ACPI_PCIHP_ADDR_ICH9);
> > +
> > +        qbus_set_hotplug_handler(BUS(pci_get_bus(lpc_pci)),
> > +                                 OBJECT(lpc_pci));
> > +    }
> > +
> >      pm->irq = sci_irq;
> >      qemu_register_reset(pm_reset, pm);
> >      pm->powerdown_notifier.notify = pm_powerdown_req;
> > @@ -368,6 +402,20 @@ static void ich9_pm_set_enable_tco(Object *obj, bool value, Error **errp)
> >      s->pm.enable_tco = value;
> >  }
> >
> > +static bool ich9_pm_get_acpi_pci_hotplug(Object *obj, Error **errp)
> > +{
> > +    ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
> > +
> > +    return s->pm.use_acpi_hotplug_bridge;
> > +}
> > +
> > +static void ich9_pm_set_acpi_pci_hotplug(Object *obj, bool value, Error **errp)
> > +{
> > +    ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
> > +
> > +    s->pm.use_acpi_hotplug_bridge = value;
> > +}
> > +
> >  void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
> >  {
> >      static const uint32_t gpe0_len = ICH9_PMIO_GPE0_LEN;
> > @@ -376,6 +424,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
> >      pm->disable_s3 = 0;
> >      pm->disable_s4 = 0;
> >      pm->s4_val = 2;
> > +    pm->use_acpi_hotplug_bridge = false;
> >
> >      object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_BASE,
> >                                     &pm->pm_io_base, OBJ_PROP_FLAG_READ);
> > @@ -399,6 +448,9 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
> >      object_property_add_bool(obj, ACPI_PM_PROP_TCO_ENABLED,
> >                               ich9_pm_get_enable_tco,
> >                               ich9_pm_set_enable_tco);
> > +    object_property_add_bool(obj, "acpi-pci-hotplug-with-bridge-support",
> > +                             ich9_pm_get_acpi_pci_hotplug,
> > +                             ich9_pm_set_acpi_pci_hotplug);
> >  }
> >
> >  void ich9_pm_device_pre_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
> > @@ -406,6 +458,11 @@ void ich9_pm_device_pre_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
> >  {
> >      ICH9LPCState *lpc = ICH9_LPC_DEVICE(hotplug_dev);
> >
> > +    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> > +        acpi_pcihp_device_pre_plug_cb(hotplug_dev, dev, errp);
> > +        return;
> > +    }
> > +
> >      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) &&
> >          !lpc->pm.acpi_memory_hotplug.is_enabled) {
> >          error_setg(errp,
> > @@ -441,6 +498,9 @@ void ich9_pm_device_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
> >          } else {
> >              acpi_cpu_plug_cb(hotplug_dev, &lpc->pm.cpuhp_state, dev, errp);
> >          }
> > +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> > +        acpi_pcihp_device_plug_cb(hotplug_dev, &lpc->pm.acpi_pci_hotplug,
> > +                                  dev, errp);
> >      } else {
> >          error_setg(errp, "acpi: device plug request for not supported device"
> >                     " type: %s", object_get_typename(OBJECT(dev)));
> > @@ -473,6 +533,10 @@ void ich9_pm_device_unplug_request_cb(HotplugHandler *hotplug_dev,
> >
> >          acpi_cpu_unplug_request_cb(hotplug_dev, &lpc->pm.cpuhp_state,
> >                                     dev, errp);
> > +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> > +        acpi_pcihp_device_unplug_request_cb(hotplug_dev,
> > +                                            &lpc->pm.acpi_pci_hotplug,
> > +                                            dev, errp);
> >      } else {
> >          error_setg(errp, "acpi: device unplug request for not supported device"
> >                     " type: %s", object_get_typename(OBJECT(dev)));
> > @@ -490,6 +554,9 @@ void ich9_pm_device_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
> >      } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU) &&
> >                 !lpc->pm.cpu_hotplug_legacy) {
> >          acpi_cpu_unplug_cb(&lpc->pm.cpuhp_state, dev, errp);
> > +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> > +        acpi_pcihp_device_unplug_cb(hotplug_dev, &lpc->pm.acpi_pci_hotplug,
> > +                                    dev, errp);
> >      } else {
> >          error_setg(errp, "acpi: device unplug for not supported device"
> >                     " type: %s", object_get_typename(OBJECT(dev)));
> > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > index a55992ed9f..5355618608 100644
> > --- a/hw/acpi/pcihp.c
> > +++ b/hw/acpi/pcihp.c
> > @@ -30,6 +30,8 @@
> >  #include "hw/pci-host/i440fx.h"
> >  #include "hw/pci/pci.h"
> >  #include "hw/pci/pci_bridge.h"
> > +#include "hw/pci/pci_host.h"
> > +#include "hw/i386/acpi-build.h"
> >  #include "hw/acpi/acpi.h"
> >  #include "hw/pci/pci_bus.h"
> >  #include "migration/vmstate.h"
> > @@ -103,6 +105,7 @@ static void *acpi_set_bsel(PCIBus *bus, void *opaque)
> >  static void acpi_set_pci_info(void)
> >  {
> >      static bool bsel_is_set;
> > +    Object *host = acpi_get_i386_pci_host();
> >      PCIBus *bus;
> >      unsigned bsel_alloc = ACPI_PCIHP_BSEL_DEFAULT;
> >
> > @@ -111,7 +114,7 @@ static void acpi_set_pci_info(void)
> >      }
> >      bsel_is_set = true;
> >
> > -    bus = find_i440fx(); /* TODO: Q35 support */
> > +    bus = PCI_HOST_BRIDGE(host)->bus;
>
> Would it make more sense for this change to go in patch #1, along with
> the similar change to acpi_pcihp_disable_root_bus().

Not really. This is exactly what enables ACPI hotplug, and should be
done with other changes here. The first patch could be merged in this
one, though.

Best regards, Julia Suvorova.

> >      if (bus) {
> >          /* Scan all PCI buses. Set property to enable acpi based hotplug. */
> >          pci_for_each_bus_depth_first(bus, acpi_set_bsel, NULL, &bsel_alloc);
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index 67753638e4..aa973aa746 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -299,7 +299,7 @@ static void acpi_get_misc_info(AcpiMiscInfo *info)
> >   * Because of the PXB hosts we cannot simply query TYPE_PCI_HOST_BRIDGE.
> >   * On i386 arch we only have two pci hosts, so we can look only for them.
> >   */
> > -static Object *acpi_get_i386_pci_host(void)
> > +Object *acpi_get_i386_pci_host(void)
> >  {
> >      PCIHostState *host;
> >
>
> --
> David Gibson                    | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au  | minimalist, thank you.  NOT _the_ _other_
>                                 | _way_ _around_!
> http://www.ozlabs.org/~dgibson


