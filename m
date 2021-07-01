Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC20D3B8D4E
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 07:05:30 +0200 (CEST)
Received: from localhost ([::1]:44236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyotF-0003Ly-Qm
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 01:05:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lyoji-0003IB-N5
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:55:38 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:52225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lyoje-0001DW-56
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:55:38 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GFm9l6V8sz9sj1; Thu,  1 Jul 2021 14:55:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625115323;
 bh=Gdbss4B2jBI/OMtrZRPAlGv9FiQKyOtd8wjyDmwgLVc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NcQSYLnsWwnpegN+qlJpt4bjBGwOo9/LU92Ty3mH1CRahsFSoAxWG0wod0GKtPuIS
 OZN2Z1+7NOSOJ1OvSLj/MBePEfaXinD1fpaVNwy1XiXSD/BhrTWu0rxFHiobnHqpwV
 FF26ttU7xDgZ/70+MCbf+5zq8oqFBj4M6PIbFF0Q=
Date: Thu, 1 Jul 2021 14:50:26 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Julia Suvorova <jusual@redhat.com>
Subject: Re: [PATCH v5 4/7] hw/pci/pcie: Do not set HPC flag if acpihp is used
Message-ID: <YN1Jkk81asSQuCd0@yekko>
References: <20210617190739.3673064-1-jusual@redhat.com>
 <20210617190739.3673064-5-jusual@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JgXa0HPge0J0jPpk"
Content-Disposition: inline
In-Reply-To: <20210617190739.3673064-5-jusual@redhat.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


--JgXa0HPge0J0jPpk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 17, 2021 at 09:07:36PM +0200, Julia Suvorova wrote:
> Instead of changing the hot-plug type in _OSC register, do not
> set the 'Hot-Plug Capable' flag. This way guest will choose ACPI
> hot-plug if it is preferred and leave the option to use SHPC with
> pcie-pci-bridge.
>=20
> The ability to control hot-plug for each downstream port is retained,
> while 'hotplug=3Doff' on the port means all hot-plug types are disabled.
>=20
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  include/hw/pci/pcie_port.h |  5 ++++-
>  hw/acpi/pcihp.c            |  8 ++++++++
>  hw/core/machine.c          |  1 -
>  hw/i386/pc_q35.c           | 11 +++++++++++
>  hw/pci/pcie.c              |  8 +++++++-
>  hw/pci/pcie_port.c         |  1 +
>  6 files changed, 31 insertions(+), 3 deletions(-)
>=20
> diff --git a/include/hw/pci/pcie_port.h b/include/hw/pci/pcie_port.h
> index bea8ecad0f..e25b289ce8 100644
> --- a/include/hw/pci/pcie_port.h
> +++ b/include/hw/pci/pcie_port.h
> @@ -57,8 +57,11 @@ struct PCIESlot {
>      /* Disable ACS (really for a pcie_root_port) */
>      bool        disable_acs;
> =20
> -    /* Indicates whether hot-plug is enabled on the slot */
> +    /* Indicates whether any type of hot-plug is allowed on the slot */
>      bool        hotplug;
> +
> +    bool        native_hotplug;
> +
>      QLIST_ENTRY(PCIESlot) next;
>  };
> =20
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 5355618608..7a6bc1b31e 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -31,6 +31,7 @@
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_bridge.h"
>  #include "hw/pci/pci_host.h"
> +#include "hw/pci/pcie_port.h"
>  #include "hw/i386/acpi-build.h"
>  #include "hw/acpi/acpi.h"
>  #include "hw/pci/pci_bus.h"
> @@ -332,6 +333,13 @@ void acpi_pcihp_device_plug_cb(HotplugHandler *hotpl=
ug_dev, AcpiPciHpState *s,
>              object_dynamic_cast(OBJECT(dev), TYPE_PCI_BRIDGE)) {
>              PCIBus *sec =3D pci_bridge_get_sec_bus(PCI_BRIDGE(pdev));
> =20
> +            /* Remove all hot-plug handlers if hot-plug is disabled on s=
lot */
> +            if (object_dynamic_cast(OBJECT(dev), TYPE_PCIE_SLOT) &&
> +                !PCIE_SLOT(pdev)->hotplug) {
> +                qbus_set_hotplug_handler(BUS(sec), NULL);
> +                return;
> +            }
> +
>              qbus_set_hotplug_handler(BUS(sec), OBJECT(hotplug_dev));
>              /* We don't have to overwrite any other hotplug handler yet =
*/
>              assert(QLIST_EMPTY(&sec->child));
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 55b9bc7817..6ed0575d81 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -582,7 +582,6 @@ static void machine_set_memdev(Object *obj, const cha=
r *value, Error **errp)
>      ms->ram_memdev_id =3D g_strdup(value);
>  }
> =20
> -
>  static void machine_init_notify(Notifier *notifier, void *data)
>  {
>      MachineState *machine =3D MACHINE(qdev_get_machine());
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 46a0f196f4..a0ec7964cc 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -37,6 +37,7 @@
>  #include "sysemu/kvm.h"
>  #include "hw/kvm/clock.h"
>  #include "hw/pci-host/q35.h"
> +#include "hw/pci/pcie_port.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/i386/x86.h"
>  #include "hw/i386/pc.h"
> @@ -136,6 +137,7 @@ static void pc_q35_init(MachineState *machine)
>      ram_addr_t lowmem;
>      DriveInfo *hd[MAX_SATA_PORTS];
>      MachineClass *mc =3D MACHINE_GET_CLASS(machine);
> +    bool acpi_pcihp;
> =20
>      /* Check whether RAM fits below 4G (leaving 1/2 GByte for IO memory
>       * and 256 Mbytes for PCI Express Enhanced Configuration Access Mapp=
ing
> @@ -236,6 +238,15 @@ static void pc_q35_init(MachineState *machine)
>      object_property_set_link(OBJECT(machine), PC_MACHINE_ACPI_DEVICE_PRO=
P,
>                               OBJECT(lpc), &error_abort);
> =20
> +    acpi_pcihp =3D object_property_get_bool(OBJECT(lpc),
> +                                          "acpi-pci-hotplug-with-bridge-=
support",
> +                                          NULL);
> +
> +    if (acpi_pcihp) {
> +        object_register_sugar_prop(TYPE_PCIE_SLOT, "enable-native-hotplu=
g",
> +                                  "false", true);
> +    }
> +
>      /* irq lines */
>      gsi_state =3D pc_gsi_create(&x86ms->gsi, pcmc->pci_enabled);
> =20
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index fd0fa157e8..6e95d82903 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -529,7 +529,13 @@ void pcie_cap_slot_init(PCIDevice *dev, PCIESlot *s)
>                                 PCI_EXP_SLTCAP_PIP |
>                                 PCI_EXP_SLTCAP_AIP |
>                                 PCI_EXP_SLTCAP_ABP);
> -    if (s->hotplug) {
> +
> +    /*
> +     * Enable native hot-plug on all hot-plugged bridges unless
> +     * hot-plug is disabled on the slot.
> +     */
> +    if (s->hotplug &&
> +        (s->native_hotplug || DEVICE(dev)->hotplugged)) {
>          pci_long_test_and_set_mask(dev->config + pos + PCI_EXP_SLTCAP,
>                                     PCI_EXP_SLTCAP_HPS |
>                                     PCI_EXP_SLTCAP_HPC);
> diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
> index eb563ad435..a410111825 100644
> --- a/hw/pci/pcie_port.c
> +++ b/hw/pci/pcie_port.c
> @@ -148,6 +148,7 @@ static Property pcie_slot_props[] =3D {
>      DEFINE_PROP_UINT8("chassis", PCIESlot, chassis, 0),
>      DEFINE_PROP_UINT16("slot", PCIESlot, slot, 0),
>      DEFINE_PROP_BOOL("hotplug", PCIESlot, hotplug, true),
> +    DEFINE_PROP_BOOL("enable-native-hotplug", PCIESlot, native_hotplug, =
true),
>      DEFINE_PROP_END_OF_LIST()
>  };
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--JgXa0HPge0J0jPpk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDdSZIACgkQbDjKyiDZ
s5LF+hAAxcoxpDX1op0VIsuSThZGu4vnnB1ZIfI4YP+k63YBxzbGq7BapIsEb3qQ
PK8k7EJOPiya+MwvRDP31ZqIjRqE4/el5n0apZC0gZQM33RtZHNtF6tU2w9ankRY
84E/l/aIM1OiyVR0G0OeN7qL7LUKPSOQA61RObi43zWb37ojKZPqgxenOp4sovxf
bXX+q2Jv6l17gMMl+J3Y87I1OZyEw1kf7HMtzqrgtqwDWNkg6Df9MjI/qGm6NQpC
QBSY50mlIATzOCS5A7BhEK7xz93eHTyf+bJVLdK6QZAC8KrN7vZAo95vclXCMosg
4jWbZarO9SBh1Kl7z1Z8W0LfI4YXrjq5n+KlF9v3r8eh4Ks/Y44rlFyxLFJ3g7fK
FC7KTXP581tUsMeWLCVKBOw++J3fZ8r/8SpWUfTaWZ+IgJm2jXohsw2nodPlNhha
kED54a9gGLRx+vN2DeC3HvVDCAGyS5eQ1+6sDo8QB7sBIE0m2/Zf7WgxoAGI+X+u
yQWxueyyQyhwNqRD+Bv+MYnUOQQy0coPZaBI+C2t/MZ8VZUjcWQgS2DJHOmHyM3d
z57INDCTdHzMhdtzqH5qSm65AAKAavLlsvVpMbnx6VhYZmvWJpOB2TxpwUqWv0vp
nb9DMPx1hfe9UbHiJSEpDgg8NpC82jCG9sy2u1ckVozAvsKZTCA=
=XQrS
-----END PGP SIGNATURE-----

--JgXa0HPge0J0jPpk--

