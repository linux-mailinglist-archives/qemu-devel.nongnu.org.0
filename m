Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F9A3B1839
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 12:48:31 +0200 (CEST)
Received: from localhost ([::1]:39936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw0Qo-00053i-Ex
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 06:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1lw0PN-0004Ne-A4
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 06:47:01 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:42813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1lw0PK-0005HK-Mw
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 06:47:01 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 w23-20020a9d5a970000b02903d0ef989477so1459358oth.9
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 03:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OeYYZg3A7hVTHhOBR2iTOfd92tdwBojBYmkTtp2jQj0=;
 b=KERvxJXJ2hGcHO47OCRA/2/aY0EaYTZLU6/BNK+aT3MDFvv507ra3qEp917l/R2F7Z
 jpwBNmZ7XpSPQAdoCVG6XoiP1GtXIJlIn+IZw8zn8qaaIy2vne1Azj+NostNvVfs0z1x
 z3I5IhaWVpu2KmkVUDQVeX0C9jnN6zWbw1NSq00yE/1Njmm4bGvuK/BVLBTy2sNMaraJ
 po6RMwTyo/FBNJiUAW7LRE8qwhk8ZQQzMO+IUh6PGz+x+ScJ+CYeA+EuiyLq6yRukEXH
 V+8y+1ZTAjNQKl3YDeFp5EZ+nbLRFfKfYTglmNX6Sj1DBUpmc9BEaH/UMUJNf6WfhRz1
 h7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OeYYZg3A7hVTHhOBR2iTOfd92tdwBojBYmkTtp2jQj0=;
 b=HhY6WzFBxlJMn4IfXJJkZGjdlOJURCk/b6NfAWBQn30VZViwVa6vv0Dr//+VC3g9Po
 ecIvnzOAfoAkBVE1WQhADUvKbC0ObnFL3eQwqGzAwICuBGp72aLzxSWpTFcTAHEgTBex
 D7Uqtynvq/jfpRqjHxTXkHNQW0lPNcKZip1ivhIye71JZMMC8kfatcElO+I1Ya7KNrHn
 ffhUbZR1EC9PQix7aYYxuAJ5/oDdRw9JVne7aDZ+huBqb+ETw+XEYJ+jAqAWFKIky1l9
 BAdD7saONOEgWVtNY0tsylBP3FwHonayPFdJijlmQWVleJe2j/uojC2O7Bul1VhbOiel
 tHYg==
X-Gm-Message-State: AOAM5301FEXed1+VQxtJezSIm/RwhEriRPGcDgmWNwp0/h0kNHgnz4xN
 RE/GyFSh91HBdapjm9PcP6WlV6v2RajKqRhea1Q=
X-Google-Smtp-Source: ABdhPJzhUAJ2tN7i/FUIkoCFxeVbNObJuO369KbG10CkAKgZlZKj8+FXqIHSQECtZPgeX/rjgpcfqcJYJ8fmrdmRKvc=
X-Received: by 2002:a9d:2f61:: with SMTP id h88mr7110564otb.190.1624445217027; 
 Wed, 23 Jun 2021 03:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210617190739.3673064-1-jusual@redhat.com>
 <20210617190739.3673064-4-jusual@redhat.com>
In-Reply-To: <20210617190739.3673064-4-jusual@redhat.com>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Wed, 23 Jun 2021 13:46:45 +0300
Message-ID: <CAC_L=vX+zZscufe-psUjzP6YH+gs-56cB72wa0y9Cmy0NV_vzA@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] hw/acpi/ich9: Enable ACPI PCI hot-plug
To: Julia Suvorova <jusual@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000001e3a4a05c56ca095"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-ot1-x32e.google.com
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

--0000000000001e3a4a05c56ca095
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 17, 2021 at 10:08 PM Julia Suvorova <jusual@redhat.com> wrote:

> Add acpi_pcihp to ich9_pm as part of
> 'acpi-pci-hotplug-with-bridge-support' option. Set default to false.
>
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/i386/acpi-build.h   |  1 +
>  include/hw/acpi/ich9.h |  3 ++
>  hw/acpi/ich9.c         | 67 ++++++++++++++++++++++++++++++++++++++++++
>  hw/acpi/pcihp.c        |  5 +++-
>  hw/i386/acpi-build.c   |  2 +-
>  5 files changed, 76 insertions(+), 2 deletions(-)
>
> diff --git a/hw/i386/acpi-build.h b/hw/i386/acpi-build.h
> index 487ec7710f..0dce155c8c 100644
> --- a/hw/i386/acpi-build.h
> +++ b/hw/i386/acpi-build.h
> @@ -10,5 +10,6 @@ extern const struct AcpiGenericAddress
> x86_nvdimm_acpi_dsmio;
>  #define ACPI_PCIHP_BNMR_BASE 0x10
>
>  void acpi_setup(void);
> +Object *acpi_get_i386_pci_host(void);
>
>  #endif
> diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
> index 596120d97f..a329ce43ab 100644
> --- a/include/hw/acpi/ich9.h
> +++ b/include/hw/acpi/ich9.h
> @@ -24,6 +24,7 @@
>  #include "hw/acpi/acpi.h"
>  #include "hw/acpi/cpu_hotplug.h"
>  #include "hw/acpi/cpu.h"
> +#include "hw/acpi/pcihp.h"
>  #include "hw/acpi/memory_hotplug.h"
>  #include "hw/acpi/acpi_dev_interface.h"
>  #include "hw/acpi/tco.h"
> @@ -55,6 +56,8 @@ typedef struct ICH9LPCPMRegs {
>      AcpiCpuHotplug gpe_cpu;
>      CPUHotplugState cpuhp_state;
>
> +    bool use_acpi_hotplug_bridge;
> +    AcpiPciHpState acpi_pci_hotplug;
>      MemHotplugState acpi_memory_hotplug;
>
>      uint8_t disable_s3;
> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> index 4daa79ec8d..bcbd567cb0 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -217,6 +217,26 @@ static const VMStateDescription vmstate_cpuhp_state =
> {
>      }
>  };
>
> +static bool vmstate_test_use_pcihp(void *opaque)
> +{
> +    ICH9LPCPMRegs *s = opaque;
> +
> +    return s->use_acpi_hotplug_bridge;
> +}
> +
> +static const VMStateDescription vmstate_pcihp_state = {
> +    .name = "ich9_pm/pcihp",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = vmstate_test_use_pcihp,
> +    .fields      = (VMStateField[]) {
> +        VMSTATE_PCI_HOTPLUG(acpi_pci_hotplug,
> +                            ICH9LPCPMRegs,
> +                            NULL, NULL),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  const VMStateDescription vmstate_ich9_pm = {
>      .name = "ich9_pm",
>      .version_id = 1,
> @@ -238,6 +258,7 @@ const VMStateDescription vmstate_ich9_pm = {
>          &vmstate_memhp_state,
>          &vmstate_tco_io_state,
>          &vmstate_cpuhp_state,
> +        &vmstate_pcihp_state,
>          NULL
>      }
>  };
> @@ -259,6 +280,7 @@ static void pm_reset(void *opaque)
>      }
>      pm->smi_en_wmask = ~0;
>
> +    acpi_pcihp_reset(&pm->acpi_pci_hotplug, true);
>      acpi_update_sci(&pm->acpi_regs, pm->irq);
>  }
>
> @@ -297,6 +319,18 @@ void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs
> *pm,
>      pm->enable_tco = true;
>      acpi_pm_tco_init(&pm->tco_regs, &pm->io);
>
> +    if (pm->use_acpi_hotplug_bridge) {
> +        acpi_pcihp_init(OBJECT(lpc_pci),
> +                        &pm->acpi_pci_hotplug,
> +                        pci_get_bus(lpc_pci),
> +                        pci_address_space_io(lpc_pci),
> +                        true,
> +                        ACPI_PCIHP_ADDR_ICH9);
> +
> +        qbus_set_hotplug_handler(BUS(pci_get_bus(lpc_pci)),
> +                                 OBJECT(lpc_pci));
> +    }
> +
>      pm->irq = sci_irq;
>      qemu_register_reset(pm_reset, pm);
>      pm->powerdown_notifier.notify = pm_powerdown_req;
> @@ -368,6 +402,20 @@ static void ich9_pm_set_enable_tco(Object *obj, bool
> value, Error **errp)
>      s->pm.enable_tco = value;
>  }
>
> +static bool ich9_pm_get_acpi_pci_hotplug(Object *obj, Error **errp)
> +{
> +    ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
> +
> +    return s->pm.use_acpi_hotplug_bridge;
> +}
> +
> +static void ich9_pm_set_acpi_pci_hotplug(Object *obj, bool value, Error
> **errp)
> +{
> +    ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
> +
> +    s->pm.use_acpi_hotplug_bridge = value;
> +}
> +
>  void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
>  {
>      static const uint32_t gpe0_len = ICH9_PMIO_GPE0_LEN;
> @@ -376,6 +424,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs
> *pm)
>      pm->disable_s3 = 0;
>      pm->disable_s4 = 0;
>      pm->s4_val = 2;
> +    pm->use_acpi_hotplug_bridge = false;
>
>      object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_BASE,
>                                     &pm->pm_io_base, OBJ_PROP_FLAG_READ);
> @@ -399,6 +448,9 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs
> *pm)
>      object_property_add_bool(obj, ACPI_PM_PROP_TCO_ENABLED,
>                               ich9_pm_get_enable_tco,
>                               ich9_pm_set_enable_tco);
> +    object_property_add_bool(obj, "acpi-pci-hotplug-with-bridge-support",
> +                             ich9_pm_get_acpi_pci_hotplug,
> +                             ich9_pm_set_acpi_pci_hotplug);
>  }
>
>  void ich9_pm_device_pre_plug_cb(HotplugHandler *hotplug_dev, DeviceState
> *dev,
> @@ -406,6 +458,11 @@ void ich9_pm_device_pre_plug_cb(HotplugHandler
> *hotplug_dev, DeviceState *dev,
>  {
>      ICH9LPCState *lpc = ICH9_LPC_DEVICE(hotplug_dev);
>
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> +        acpi_pcihp_device_pre_plug_cb(hotplug_dev, dev, errp);
> +        return;
> +    }
> +
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) &&
>          !lpc->pm.acpi_memory_hotplug.is_enabled) {
>          error_setg(errp,
> @@ -441,6 +498,9 @@ void ich9_pm_device_plug_cb(HotplugHandler
> *hotplug_dev, DeviceState *dev,
>          } else {
>              acpi_cpu_plug_cb(hotplug_dev, &lpc->pm.cpuhp_state, dev,
> errp);
>          }
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> +        acpi_pcihp_device_plug_cb(hotplug_dev, &lpc->pm.acpi_pci_hotplug,
> +                                  dev, errp);
>      } else {
>          error_setg(errp, "acpi: device plug request for not supported
> device"
>                     " type: %s", object_get_typename(OBJECT(dev)));
> @@ -473,6 +533,10 @@ void ich9_pm_device_unplug_request_cb(HotplugHandler
> *hotplug_dev,
>
>          acpi_cpu_unplug_request_cb(hotplug_dev, &lpc->pm.cpuhp_state,
>                                     dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> +        acpi_pcihp_device_unplug_request_cb(hotplug_dev,
> +                                            &lpc->pm.acpi_pci_hotplug,
> +                                            dev, errp);
>      } else {
>          error_setg(errp, "acpi: device unplug request for not supported
> device"
>                     " type: %s", object_get_typename(OBJECT(dev)));
> @@ -490,6 +554,9 @@ void ich9_pm_device_unplug_cb(HotplugHandler
> *hotplug_dev, DeviceState *dev,
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU) &&
>                 !lpc->pm.cpu_hotplug_legacy) {
>          acpi_cpu_unplug_cb(&lpc->pm.cpuhp_state, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> +        acpi_pcihp_device_unplug_cb(hotplug_dev,
> &lpc->pm.acpi_pci_hotplug,
> +                                    dev, errp);
>      } else {
>          error_setg(errp, "acpi: device unplug for not supported device"
>                     " type: %s", object_get_typename(OBJECT(dev)));
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index a55992ed9f..5355618608 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -30,6 +30,8 @@
>  #include "hw/pci-host/i440fx.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_bridge.h"
> +#include "hw/pci/pci_host.h"
> +#include "hw/i386/acpi-build.h"
>  #include "hw/acpi/acpi.h"
>  #include "hw/pci/pci_bus.h"
>  #include "migration/vmstate.h"
> @@ -103,6 +105,7 @@ static void *acpi_set_bsel(PCIBus *bus, void *opaque)
>  static void acpi_set_pci_info(void)
>  {
>      static bool bsel_is_set;
> +    Object *host = acpi_get_i386_pci_host();
>      PCIBus *bus;
>      unsigned bsel_alloc = ACPI_PCIHP_BSEL_DEFAULT;
>
> @@ -111,7 +114,7 @@ static void acpi_set_pci_info(void)
>      }
>      bsel_is_set = true;
>
> -    bus = find_i440fx(); /* TODO: Q35 support */
> +    bus = PCI_HOST_BRIDGE(host)->bus;
>      if (bus) {
>          /* Scan all PCI buses. Set property to enable acpi based hotplug.
> */
>          pci_for_each_bus_depth_first(bus, acpi_set_bsel, NULL,
> &bsel_alloc);
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 67753638e4..aa973aa746 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -299,7 +299,7 @@ static void acpi_get_misc_info(AcpiMiscInfo *info)
>   * Because of the PXB hosts we cannot simply query TYPE_PCI_HOST_BRIDGE.
>   * On i386 arch we only have two pci hosts, so we can look only for them.
>   */
> -static Object *acpi_get_i386_pci_host(void)
> +Object *acpi_get_i386_pci_host(void)
>  {
>      PCIHostState *host;
>
> --
> 2.30.2
>
>
Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>

Thanks,
Marcel

--0000000000001e3a4a05c56ca095
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div dir=3D"lt=
r"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, Jun 17, 2021 at 10:08 PM Julia Suvorova &lt;<a href=3D"mailt=
o:jusual@redhat.com" target=3D"_blank">jusual@redhat.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Add acpi_pcihp to i=
ch9_pm as part of<br>
&#39;acpi-pci-hotplug-with-bridge-support&#39; option. Set default to false=
.<br>
<br>
Signed-off-by: Julia Suvorova &lt;<a href=3D"mailto:jusual@redhat.com" targ=
et=3D"_blank">jusual@redhat.com</a>&gt;<br>
Reviewed-by: Igor Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com" targe=
t=3D"_blank">imammedo@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/i386/acpi-build.h=C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0include/hw/acpi/ich9.h |=C2=A0 3 ++<br>
=C2=A0hw/acpi/ich9.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 67 ++++++++++++++++=
++++++++++++++++++++++++++<br>
=C2=A0hw/acpi/pcihp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +++-<br>
=C2=A0hw/i386/acpi-build.c=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A05 files changed, 76 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/hw/i386/acpi-build.h b/hw/i386/acpi-build.h<br>
index 487ec7710f..0dce155c8c 100644<br>
--- a/hw/i386/acpi-build.h<br>
+++ b/hw/i386/acpi-build.h<br>
@@ -10,5 +10,6 @@ extern const struct AcpiGenericAddress x86_nvdimm_acpi_ds=
mio;<br>
=C2=A0#define ACPI_PCIHP_BNMR_BASE 0x10<br>
<br>
=C2=A0void acpi_setup(void);<br>
+Object *acpi_get_i386_pci_host(void);<br>
<br>
=C2=A0#endif<br>
diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h<br>
index 596120d97f..a329ce43ab 100644<br>
--- a/include/hw/acpi/ich9.h<br>
+++ b/include/hw/acpi/ich9.h<br>
@@ -24,6 +24,7 @@<br>
=C2=A0#include &quot;hw/acpi/acpi.h&quot;<br>
=C2=A0#include &quot;hw/acpi/cpu_hotplug.h&quot;<br>
=C2=A0#include &quot;hw/acpi/cpu.h&quot;<br>
+#include &quot;hw/acpi/pcihp.h&quot;<br>
=C2=A0#include &quot;hw/acpi/memory_hotplug.h&quot;<br>
=C2=A0#include &quot;hw/acpi/acpi_dev_interface.h&quot;<br>
=C2=A0#include &quot;hw/acpi/tco.h&quot;<br>
@@ -55,6 +56,8 @@ typedef struct ICH9LPCPMRegs {<br>
=C2=A0 =C2=A0 =C2=A0AcpiCpuHotplug gpe_cpu;<br>
=C2=A0 =C2=A0 =C2=A0CPUHotplugState cpuhp_state;<br>
<br>
+=C2=A0 =C2=A0 bool use_acpi_hotplug_bridge;<br>
+=C2=A0 =C2=A0 AcpiPciHpState acpi_pci_hotplug;<br>
=C2=A0 =C2=A0 =C2=A0MemHotplugState acpi_memory_hotplug;<br>
<br>
=C2=A0 =C2=A0 =C2=A0uint8_t disable_s3;<br>
diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c<br>
index 4daa79ec8d..bcbd567cb0 100644<br>
--- a/hw/acpi/ich9.c<br>
+++ b/hw/acpi/ich9.c<br>
@@ -217,6 +217,26 @@ static const VMStateDescription vmstate_cpuhp_state =
=3D {<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0};<br>
<br>
+static bool vmstate_test_use_pcihp(void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 ICH9LPCPMRegs *s =3D opaque;<br>
+<br>
+=C2=A0 =C2=A0 return s-&gt;use_acpi_hotplug_bridge;<br>
+}<br>
+<br>
+static const VMStateDescription vmstate_pcihp_state =3D {<br>
+=C2=A0 =C2=A0 .name =3D &quot;ich9_pm/pcihp&quot;,<br>
+=C2=A0 =C2=A0 .version_id =3D 1,<br>
+=C2=A0 =C2=A0 .minimum_version_id =3D 1,<br>
+=C2=A0 =C2=A0 .needed =3D vmstate_test_use_pcihp,<br>
+=C2=A0 =C2=A0 .fields=C2=A0 =C2=A0 =C2=A0 =3D (VMStateField[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_PCI_HOTPLUG(acpi_pci_hotplug,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ICH9LPCPMRegs,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 NULL, NULL),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<br>
+=C2=A0 =C2=A0 }<br>
+};<br>
+<br>
=C2=A0const VMStateDescription vmstate_ich9_pm =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name =3D &quot;ich9_pm&quot;,<br>
=C2=A0 =C2=A0 =C2=A0.version_id =3D 1,<br>
@@ -238,6 +258,7 @@ const VMStateDescription vmstate_ich9_pm =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;vmstate_memhp_state,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;vmstate_tco_io_state,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;vmstate_cpuhp_state,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;vmstate_pcihp_state,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0};<br>
@@ -259,6 +280,7 @@ static void pm_reset(void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0pm-&gt;smi_en_wmask =3D ~0;<br>
<br>
+=C2=A0 =C2=A0 acpi_pcihp_reset(&amp;pm-&gt;acpi_pci_hotplug, true);<br>
=C2=A0 =C2=A0 =C2=A0acpi_update_sci(&amp;pm-&gt;acpi_regs, pm-&gt;irq);<br>
=C2=A0}<br>
<br>
@@ -297,6 +319,18 @@ void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *p=
m,<br>
=C2=A0 =C2=A0 =C2=A0pm-&gt;enable_tco =3D true;<br>
=C2=A0 =C2=A0 =C2=A0acpi_pm_tco_init(&amp;pm-&gt;tco_regs, &amp;pm-&gt;io);=
<br>
<br>
+=C2=A0 =C2=A0 if (pm-&gt;use_acpi_hotplug_bridge) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 acpi_pcihp_init(OBJECT(lpc_pci),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &amp;pm-&gt;acpi_pci_hotplug,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pci_get_bus(lpc_pci),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pci_address_space_io(lpc_pci),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ACPI_PCIHP_ADDR_ICH9);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qbus_set_hotplug_handler(BUS(pci_get_bus(lpc_p=
ci)),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OBJECT(lpc_pci));<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0pm-&gt;irq =3D sci_irq;<br>
=C2=A0 =C2=A0 =C2=A0qemu_register_reset(pm_reset, pm);<br>
=C2=A0 =C2=A0 =C2=A0pm-&gt;powerdown_notifier.notify =3D pm_powerdown_req;<=
br>
@@ -368,6 +402,20 @@ static void ich9_pm_set_enable_tco(Object *obj, bool v=
alue, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;pm.enable_tco =3D value;<br>
=C2=A0}<br>
<br>
+static bool ich9_pm_get_acpi_pci_hotplug(Object *obj, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 ICH9LPCState *s =3D ICH9_LPC_DEVICE(obj);<br>
+<br>
+=C2=A0 =C2=A0 return s-&gt;pm.use_acpi_hotplug_bridge;<br>
+}<br>
+<br>
+static void ich9_pm_set_acpi_pci_hotplug(Object *obj, bool value, Error **=
errp)<br>
+{<br>
+=C2=A0 =C2=A0 ICH9LPCState *s =3D ICH9_LPC_DEVICE(obj);<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;pm.use_acpi_hotplug_bridge =3D value;<br>
+}<br>
+<br>
=C2=A0void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0static const uint32_t gpe0_len =3D ICH9_PMIO_GPE0_LEN;<=
br>
@@ -376,6 +424,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs =
*pm)<br>
=C2=A0 =C2=A0 =C2=A0pm-&gt;disable_s3 =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0pm-&gt;disable_s4 =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0pm-&gt;s4_val =3D 2;<br>
+=C2=A0 =C2=A0 pm-&gt;use_acpi_hotplug_bridge =3D false;<br>
<br>
=C2=A0 =C2=A0 =C2=A0object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_=
BASE,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;pm-&gt;pm_io_base=
, OBJ_PROP_FLAG_READ);<br>
@@ -399,6 +448,9 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs =
*pm)<br>
=C2=A0 =C2=A0 =C2=A0object_property_add_bool(obj, ACPI_PM_PROP_TCO_ENABLED,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ich9_pm_get_enable_tco,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ich9_pm_set_enable_tco);<br>
+=C2=A0 =C2=A0 object_property_add_bool(obj, &quot;acpi-pci-hotplug-with-br=
idge-support&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ich9_pm_get_acpi_pci_hotplug,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ich9_pm_set_acpi_pci_hotplug);<br>
=C2=A0}<br>
<br>
=C2=A0void ich9_pm_device_pre_plug_cb(HotplugHandler *hotplug_dev, DeviceSt=
ate *dev,<br>
@@ -406,6 +458,11 @@ void ich9_pm_device_pre_plug_cb(HotplugHandler *hotplu=
g_dev, DeviceState *dev,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0ICH9LPCState *lpc =3D ICH9_LPC_DEVICE(hotplug_dev);<br>
<br>
+=C2=A0 =C2=A0 if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 acpi_pcihp_device_pre_plug_cb(hotplug_dev, dev=
, errp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) &amp=
;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!lpc-&gt;pm.acpi_memory_hotplug.is_enable=
d) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp,<br>
@@ -441,6 +498,9 @@ void ich9_pm_device_plug_cb(HotplugHandler *hotplug_dev=
, DeviceState *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0acpi_cpu_plug_cb(hotplug_de=
v, &amp;lpc-&gt;pm.cpuhp_state, dev, errp);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 acpi_pcihp_device_plug_cb(hotplug_dev, &amp;lp=
c-&gt;pm.acpi_pci_hotplug,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev, errp);<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;acpi: device plug =
request for not supported device&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
; type: %s&quot;, object_get_typename(OBJECT(dev)));<br>
@@ -473,6 +533,10 @@ void ich9_pm_device_unplug_request_cb(HotplugHandler *=
hotplug_dev,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0acpi_cpu_unplug_request_cb(hotplug_dev, &=
amp;lpc-&gt;pm.cpuhp_state,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev, errp);<br>
+=C2=A0 =C2=A0 } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 acpi_pcihp_device_unplug_request_cb(hotplug_de=
v,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &amp;lpc-&gt;pm.acpi_pci_hotplug,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 dev, errp);<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;acpi: device unplu=
g request for not supported device&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
; type: %s&quot;, object_get_typename(OBJECT(dev)));<br>
@@ -490,6 +554,9 @@ void ich9_pm_device_unplug_cb(HotplugHandler *hotplug_d=
ev, DeviceState *dev,<br>
=C2=A0 =C2=A0 =C2=A0} else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU) &=
amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !lpc-&gt;pm.cpu_hot=
plug_legacy) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0acpi_cpu_unplug_cb(&amp;lpc-&gt;pm.cpuhp_=
state, dev, errp);<br>
+=C2=A0 =C2=A0 } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 acpi_pcihp_device_unplug_cb(hotplug_dev, &amp;=
lpc-&gt;pm.acpi_pci_hotplug,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev, errp);<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;acpi: device unplu=
g for not supported device&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
; type: %s&quot;, object_get_typename(OBJECT(dev)));<br>
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c<br>
index a55992ed9f..5355618608 100644<br>
--- a/hw/acpi/pcihp.c<br>
+++ b/hw/acpi/pcihp.c<br>
@@ -30,6 +30,8 @@<br>
=C2=A0#include &quot;hw/pci-host/i440fx.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci_bridge.h&quot;<br>
+#include &quot;hw/pci/pci_host.h&quot;<br>
+#include &quot;hw/i386/acpi-build.h&quot;<br>
=C2=A0#include &quot;hw/acpi/acpi.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci_bus.h&quot;<br>
=C2=A0#include &quot;migration/vmstate.h&quot;<br>
@@ -103,6 +105,7 @@ static void *acpi_set_bsel(PCIBus *bus, void *opaque)<b=
r>
=C2=A0static void acpi_set_pci_info(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0static bool bsel_is_set;<br>
+=C2=A0 =C2=A0 Object *host =3D acpi_get_i386_pci_host();<br>
=C2=A0 =C2=A0 =C2=A0PCIBus *bus;<br>
=C2=A0 =C2=A0 =C2=A0unsigned bsel_alloc =3D ACPI_PCIHP_BSEL_DEFAULT;<br>
<br>
@@ -111,7 +114,7 @@ static void acpi_set_pci_info(void)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0bsel_is_set =3D true;<br>
<br>
-=C2=A0 =C2=A0 bus =3D find_i440fx(); /* TODO: Q35 support */<br>
+=C2=A0 =C2=A0 bus =3D PCI_HOST_BRIDGE(host)-&gt;bus;<br>
=C2=A0 =C2=A0 =C2=A0if (bus) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Scan all PCI buses. Set property to en=
able acpi based hotplug. */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pci_for_each_bus_depth_first(bus, acpi_se=
t_bsel, NULL, &amp;bsel_alloc);<br>
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c<br>
index 67753638e4..aa973aa746 100644<br>
--- a/hw/i386/acpi-build.c<br>
+++ b/hw/i386/acpi-build.c<br>
@@ -299,7 +299,7 @@ static void acpi_get_misc_info(AcpiMiscInfo *info)<br>
=C2=A0 * Because of the PXB hosts we cannot simply query TYPE_PCI_HOST_BRID=
GE.<br>
=C2=A0 * On i386 arch we only have two pci hosts, so we can look only for t=
hem.<br>
=C2=A0 */<br>
-static Object *acpi_get_i386_pci_host(void)<br>
+Object *acpi_get_i386_pci_host(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0PCIHostState *host;<br>
<br>
-- <br>
2.30.2<br>
<br></blockquote><div><br></div><div><div>Reviewed-by: Marcel Apfelbaum &lt=
;<a href=3D"mailto:marcel.apfelbaum@gmail.com" target=3D"_blank">marcel.apf=
elbaum@gmail.com</a>&gt;<br></div><div><br></div><div>Thanks,</div><div>Mar=
cel</div></div><div><br></div><div><br></div><div>=C2=A0</div></div></div>
</div>

--0000000000001e3a4a05c56ca095--

