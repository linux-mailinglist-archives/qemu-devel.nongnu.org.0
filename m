Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C62EA3B8D3C
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 06:59:02 +0200 (CEST)
Received: from localhost ([::1]:34996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyomz-0005Nh-8s
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 00:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lyojg-0003Ho-Vg
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:55:36 -0400
Received: from ozlabs.org ([203.11.71.1]:47103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lyoje-0001DQ-1l
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:55:36 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GFm9l6BfKz9sXS; Thu,  1 Jul 2021 14:55:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625115323;
 bh=xpS96x3g6TKI7/8IAn7APgx7LorQCZC+9MRLk716zcA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n08XLgBe/HYx+LvH646r50CaE8IKUVHf1hAjlBEYtJXWTydU279/ogfSEpwXM9Ah6
 N5AXlYT4okNAnM1mvYwBrQ/ToKpxKCm9J9xck8TqMjwr80+4kBzkaYBmNQivPl3CZo
 Sfz0Gf/2cde2bU+6aot33GvGCErQLa77GLUHod1U=
Date: Thu, 1 Jul 2021 14:46:35 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Julia Suvorova <jusual@redhat.com>
Subject: Re: [PATCH v5 3/7] hw/acpi/ich9: Enable ACPI PCI hot-plug
Message-ID: <YN1Iq6WDTqCzgmNA@yekko>
References: <20210617190739.3673064-1-jusual@redhat.com>
 <20210617190739.3673064-4-jusual@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mj7QHidSlimqDMSO"
Content-Disposition: inline
In-Reply-To: <20210617190739.3673064-4-jusual@redhat.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--mj7QHidSlimqDMSO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 17, 2021 at 09:07:35PM +0200, Julia Suvorova wrote:
> Add acpi_pcihp to ich9_pm as part of
> 'acpi-pci-hotplug-with-bridge-support' option. Set default to false.
>=20
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> ---
>  hw/i386/acpi-build.h   |  1 +
>  include/hw/acpi/ich9.h |  3 ++
>  hw/acpi/ich9.c         | 67 ++++++++++++++++++++++++++++++++++++++++++
>  hw/acpi/pcihp.c        |  5 +++-
>  hw/i386/acpi-build.c   |  2 +-
>  5 files changed, 76 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/i386/acpi-build.h b/hw/i386/acpi-build.h
> index 487ec7710f..0dce155c8c 100644
> --- a/hw/i386/acpi-build.h
> +++ b/hw/i386/acpi-build.h
> @@ -10,5 +10,6 @@ extern const struct AcpiGenericAddress x86_nvdimm_acpi_=
dsmio;
>  #define ACPI_PCIHP_BNMR_BASE 0x10
> =20
>  void acpi_setup(void);
> +Object *acpi_get_i386_pci_host(void);
> =20
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
> =20
> +    bool use_acpi_hotplug_bridge;
> +    AcpiPciHpState acpi_pci_hotplug;
>      MemHotplugState acpi_memory_hotplug;
> =20
>      uint8_t disable_s3;
> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> index 4daa79ec8d..bcbd567cb0 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -217,6 +217,26 @@ static const VMStateDescription vmstate_cpuhp_state =
=3D {
>      }
>  };
> =20
> +static bool vmstate_test_use_pcihp(void *opaque)
> +{
> +    ICH9LPCPMRegs *s =3D opaque;
> +
> +    return s->use_acpi_hotplug_bridge;
> +}
> +
> +static const VMStateDescription vmstate_pcihp_state =3D {
> +    .name =3D "ich9_pm/pcihp",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .needed =3D vmstate_test_use_pcihp,
> +    .fields      =3D (VMStateField[]) {
> +        VMSTATE_PCI_HOTPLUG(acpi_pci_hotplug,
> +                            ICH9LPCPMRegs,
> +                            NULL, NULL),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  const VMStateDescription vmstate_ich9_pm =3D {
>      .name =3D "ich9_pm",
>      .version_id =3D 1,
> @@ -238,6 +258,7 @@ const VMStateDescription vmstate_ich9_pm =3D {
>          &vmstate_memhp_state,
>          &vmstate_tco_io_state,
>          &vmstate_cpuhp_state,
> +        &vmstate_pcihp_state,
>          NULL
>      }
>  };
> @@ -259,6 +280,7 @@ static void pm_reset(void *opaque)
>      }
>      pm->smi_en_wmask =3D ~0;
> =20
> +    acpi_pcihp_reset(&pm->acpi_pci_hotplug, true);

Doesn't this need to be protected by if (pm->use_acpi_hotplug_bridge)
? Otherwise pm->acpi_pci_hotplug won't be initialized.

>      acpi_update_sci(&pm->acpi_regs, pm->irq);
>  }
> =20
> @@ -297,6 +319,18 @@ void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs =
*pm,
>      pm->enable_tco =3D true;
>      acpi_pm_tco_init(&pm->tco_regs, &pm->io);
> =20
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
>      pm->irq =3D sci_irq;
>      qemu_register_reset(pm_reset, pm);
>      pm->powerdown_notifier.notify =3D pm_powerdown_req;
> @@ -368,6 +402,20 @@ static void ich9_pm_set_enable_tco(Object *obj, bool=
 value, Error **errp)
>      s->pm.enable_tco =3D value;
>  }
> =20
> +static bool ich9_pm_get_acpi_pci_hotplug(Object *obj, Error **errp)
> +{
> +    ICH9LPCState *s =3D ICH9_LPC_DEVICE(obj);
> +
> +    return s->pm.use_acpi_hotplug_bridge;
> +}
> +
> +static void ich9_pm_set_acpi_pci_hotplug(Object *obj, bool value, Error =
**errp)
> +{
> +    ICH9LPCState *s =3D ICH9_LPC_DEVICE(obj);
> +
> +    s->pm.use_acpi_hotplug_bridge =3D value;
> +}
> +
>  void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
>  {
>      static const uint32_t gpe0_len =3D ICH9_PMIO_GPE0_LEN;
> @@ -376,6 +424,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMReg=
s *pm)
>      pm->disable_s3 =3D 0;
>      pm->disable_s4 =3D 0;
>      pm->s4_val =3D 2;
> +    pm->use_acpi_hotplug_bridge =3D false;
> =20
>      object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_BASE,
>                                     &pm->pm_io_base, OBJ_PROP_FLAG_READ);
> @@ -399,6 +448,9 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMReg=
s *pm)
>      object_property_add_bool(obj, ACPI_PM_PROP_TCO_ENABLED,
>                               ich9_pm_get_enable_tco,
>                               ich9_pm_set_enable_tco);
> +    object_property_add_bool(obj, "acpi-pci-hotplug-with-bridge-support",
> +                             ich9_pm_get_acpi_pci_hotplug,
> +                             ich9_pm_set_acpi_pci_hotplug);
>  }
> =20
>  void ich9_pm_device_pre_plug_cb(HotplugHandler *hotplug_dev, DeviceState=
 *dev,
> @@ -406,6 +458,11 @@ void ich9_pm_device_pre_plug_cb(HotplugHandler *hotp=
lug_dev, DeviceState *dev,
>  {
>      ICH9LPCState *lpc =3D ICH9_LPC_DEVICE(hotplug_dev);
> =20
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> +        acpi_pcihp_device_pre_plug_cb(hotplug_dev, dev, errp);
> +        return;
> +    }
> +
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) &&
>          !lpc->pm.acpi_memory_hotplug.is_enabled) {
>          error_setg(errp,
> @@ -441,6 +498,9 @@ void ich9_pm_device_plug_cb(HotplugHandler *hotplug_d=
ev, DeviceState *dev,
>          } else {
>              acpi_cpu_plug_cb(hotplug_dev, &lpc->pm.cpuhp_state, dev, err=
p);
>          }
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> +        acpi_pcihp_device_plug_cb(hotplug_dev, &lpc->pm.acpi_pci_hotplug,
> +                                  dev, errp);
>      } else {
>          error_setg(errp, "acpi: device plug request for not supported de=
vice"
>                     " type: %s", object_get_typename(OBJECT(dev)));
> @@ -473,6 +533,10 @@ void ich9_pm_device_unplug_request_cb(HotplugHandler=
 *hotplug_dev,
> =20
>          acpi_cpu_unplug_request_cb(hotplug_dev, &lpc->pm.cpuhp_state,
>                                     dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> +        acpi_pcihp_device_unplug_request_cb(hotplug_dev,
> +                                            &lpc->pm.acpi_pci_hotplug,
> +                                            dev, errp);
>      } else {
>          error_setg(errp, "acpi: device unplug request for not supported =
device"
>                     " type: %s", object_get_typename(OBJECT(dev)));
> @@ -490,6 +554,9 @@ void ich9_pm_device_unplug_cb(HotplugHandler *hotplug=
_dev, DeviceState *dev,
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU) &&
>                 !lpc->pm.cpu_hotplug_legacy) {
>          acpi_cpu_unplug_cb(&lpc->pm.cpuhp_state, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> +        acpi_pcihp_device_unplug_cb(hotplug_dev, &lpc->pm.acpi_pci_hotpl=
ug,
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
> +    Object *host =3D acpi_get_i386_pci_host();
>      PCIBus *bus;
>      unsigned bsel_alloc =3D ACPI_PCIHP_BSEL_DEFAULT;
> =20
> @@ -111,7 +114,7 @@ static void acpi_set_pci_info(void)
>      }
>      bsel_is_set =3D true;
> =20
> -    bus =3D find_i440fx(); /* TODO: Q35 support */
> +    bus =3D PCI_HOST_BRIDGE(host)->bus;

Would it make more sense for this change to go in patch #1, along with
the similar change to acpi_pcihp_disable_root_bus().

>      if (bus) {
>          /* Scan all PCI buses. Set property to enable acpi based hotplug=
=2E */
>          pci_for_each_bus_depth_first(bus, acpi_set_bsel, NULL, &bsel_all=
oc);
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
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--mj7QHidSlimqDMSO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDdSKgACgkQbDjKyiDZ
s5KZdxAA48vxm+1kgACnMmSeVMybZmPIw/jpVSI4Ax7UNmEsWtNSwqb4TZWI5ilD
2yq/hplTYjXjYCaj3jE9K9Cwlh0XR1B5iFS83a1TOcRR3UpWHhs/t1PAfZspTYIZ
zWhSwQ5Kx45TdE0McWaAHSN0XoyBm8X2s1dDBe3YwvgB7XfXapuzDEmPsV2dRcIM
Ar/DrMT1Pnx28aUbW1s2QPlHkUQAWicYfKX/VzxK3xxAKB82Y4T6r3+Q1UroRmIK
V6mT6kxTvz4LggGgmplwJHLoP5Iqk4o06fv2OM7+4EdVGUTCtitNhJG1lEcOo8Rx
c4ZgjZbZj14nzzYWmDEeV1GVtXZujICV4oQ70Jy21PrFIsleJcj77CECxVhFEIWe
sFn2c+RRap2cUOFUDljCLfKk/eiQzsMbIQVji5lwD7wLTC5R+MxS9WgBIpj1tfIe
7U6iTEMCDlVDDHlj0xQAn+DWfdX4Zw9ZWAbTNhnssEza0P2XxWYZXqha316jbqMx
IrI9z0jjD5Ok3S9u4r92PtbE8dc2wB6AQmLH7fGD2z0LVYg4HvT+n7J7EOCEp/x4
fNKM19VLCuOONC15ko6NvQzxuTjNEDKkmZemdM+tJFR9Dwk5t2QJfWzLQqw5EN7t
/TpdYbp8U9qYPeLkQEDJ9CaUuafRZ0THUBzFmJtN2a38sjC7T9M=
=07Yw
-----END PGP SIGNATURE-----

--mj7QHidSlimqDMSO--

