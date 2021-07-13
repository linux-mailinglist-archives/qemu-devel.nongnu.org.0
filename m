Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A313C691B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 06:16:03 +0200 (CEST)
Received: from localhost ([::1]:44236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m39py-0001yS-BG
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 00:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m39mG-00085C-23
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 00:12:12 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45657 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m39mD-00054v-1k
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 00:12:11 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GP6f745NPz9sWw; Tue, 13 Jul 2021 14:11:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626149519;
 bh=a/VgQyYlwuLE9PtDLwMomwppQ9gnrXxQI3qDLCvQ2XY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JDCLqfB7CCMrmbW2GyL0171bsN2sd9bzMDfzFYPez4guJgm3aQQhuOfIiv8vSaOCA
 NFtSm8Se8H9Tftnj9OxRHH93JfTHXRWU9xEdPaChZ1rna5Ua048g3DqErR2VZLUvNZ
 bq2ORA9EpzK3okZK7byPtxgyZE9m6pXdcnVf327U=
Date: Tue, 13 Jul 2021 14:02:29 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Julia Suvorova <jusual@redhat.com>
Subject: Re: [PATCH v6 1/6] hw/i386/acpi-build: Add ACPI PCI hot-plug methods
 to Q35
Message-ID: <YO0QVS0132RVmbai@yekko>
References: <20210713004205.775386-1-jusual@redhat.com>
 <20210713004205.775386-2-jusual@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="w+zUBqQLhjOUlU+H"
Content-Disposition: inline
In-Reply-To: <20210713004205.775386-2-jusual@redhat.com>
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
Cc: Igor Mammedov <imammedo@redhat.com>, David Gibson <dgibson@redhat.com>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--w+zUBqQLhjOUlU+H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 13, 2021 at 02:42:00AM +0200, Julia Suvorova wrote:
> Implement notifications and gpe to support q35 ACPI PCI hot-plug.
> Use 0xcc4 - 0xcd7 range for 'acpi-pci-hotplug' io ports.
>=20
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

I'm not especially familiar with either x86 or ACPI code, so my
review's depth is according.

> ---
>  hw/i386/acpi-build.h    |  4 ++++
>  include/hw/acpi/ich9.h  |  2 ++
>  include/hw/acpi/pcihp.h |  3 ++-
>  hw/acpi/pcihp.c         |  6 +++---
>  hw/acpi/piix4.c         |  4 +++-
>  hw/i386/acpi-build.c    | 30 +++++++++++++++++++-----------
>  6 files changed, 33 insertions(+), 16 deletions(-)
>=20
> diff --git a/hw/i386/acpi-build.h b/hw/i386/acpi-build.h
> index 74df5fc612..487ec7710f 100644
> --- a/hw/i386/acpi-build.h
> +++ b/hw/i386/acpi-build.h
> @@ -5,6 +5,10 @@
> =20
>  extern const struct AcpiGenericAddress x86_nvdimm_acpi_dsmio;
> =20
> +/* PCI Hot-plug registers bases. See docs/spec/acpi_pci_hotplug.txt */
> +#define ACPI_PCIHP_SEJ_BASE 0x8
> +#define ACPI_PCIHP_BNMR_BASE 0x10
> +
>  void acpi_setup(void);
> =20
>  #endif
> diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
> index df519e40b5..596120d97f 100644
> --- a/include/hw/acpi/ich9.h
> +++ b/include/hw/acpi/ich9.h
> @@ -28,6 +28,8 @@
>  #include "hw/acpi/acpi_dev_interface.h"
>  #include "hw/acpi/tco.h"
> =20
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
> =20
>  void acpi_pcihp_init(Object *owner, AcpiPciHpState *, PCIBus *root,
> -                     MemoryRegion *address_space_io, bool bridges_enable=
d);
> +                     MemoryRegion *address_space_io, bool bridges_enable=
d,
> +                     uint16_t io_base);
> =20
>  void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>                                     DeviceState *dev, Error **errp);
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 4999277d57..d98a284b7a 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -37,7 +37,6 @@
>  #include "qom/qom-qobject.h"
>  #include "trace.h"
> =20
> -#define ACPI_PCIHP_ADDR 0xae00
>  #define ACPI_PCIHP_SIZE 0x0018
>  #define PCI_UP_BASE 0x0000
>  #define PCI_DOWN_BASE 0x0004
> @@ -488,10 +487,11 @@ static const MemoryRegionOps acpi_pcihp_io_ops =3D {
>  };
> =20
>  void acpi_pcihp_init(Object *owner, AcpiPciHpState *s, PCIBus *root_bus,
> -                     MemoryRegion *address_space_io, bool bridges_enable=
d)
> +                     MemoryRegion *address_space_io, bool bridges_enable=
d,
> +                     uint16_t io_base)
>  {
>      s->io_len =3D ACPI_PCIHP_SIZE;
> -    s->io_base =3D ACPI_PCIHP_ADDR;
> +    s->io_base =3D io_base;
> =20
>      s->root =3D root_bus;
>      s->legacy_piix =3D !bridges_enabled;
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index 0bd23d74e2..48f7a1edbc 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -49,6 +49,8 @@
>  #define GPE_BASE 0xafe0
>  #define GPE_LEN 4
> =20
> +#define ACPI_PCIHP_ADDR_PIIX4 0xae00
> +
>  struct pci_status {
>      uint32_t up; /* deprecated, maintained for migration compatibility */
>      uint32_t down;
> @@ -607,7 +609,7 @@ static void piix4_acpi_system_hot_add_init(MemoryRegi=
on *parent,
> =20
>      if (s->use_acpi_hotplug_bridge || s->use_acpi_root_pci_hotplug) {
>          acpi_pcihp_init(OBJECT(s), &s->acpi_pci_hotplug, bus, parent,
> -                        s->use_acpi_hotplug_bridge);
> +                        s->use_acpi_hotplug_bridge, ACPI_PCIHP_ADDR_PIIX=
4);
>      }
> =20
>      s->cpu_hotplug_legacy =3D true;
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 357437ff1d..e1c246d6e8 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -219,10 +219,6 @@ static void acpi_get_pm_info(MachineState *machine, =
AcpiPmInfo *pm)
>          /* w2k requires FADT(rev1) or it won't boot, keep PC compatible =
*/
>          pm->fadt.rev =3D 1;
>          pm->cpu_hp_io_base =3D PIIX4_CPU_HOTPLUG_IO_BASE;
> -        pm->pcihp_io_base =3D
> -            object_property_get_uint(obj, ACPI_PCIHP_IO_BASE_PROP, NULL);
> -        pm->pcihp_io_len =3D
> -            object_property_get_uint(obj, ACPI_PCIHP_IO_LEN_PROP, NULL);
>      }
>      if (lpc) {
>          uint64_t smi_features =3D object_property_get_uint(lpc,
> @@ -238,6 +234,10 @@ static void acpi_get_pm_info(MachineState *machine, =
AcpiPmInfo *pm)
>          pm->smi_on_cpu_unplug =3D
>              !!(smi_features & BIT_ULL(ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT)=
);
>      }
> +    pm->pcihp_io_base =3D
> +        object_property_get_uint(obj, ACPI_PCIHP_IO_BASE_PROP, NULL);
> +    pm->pcihp_io_len =3D
> +        object_property_get_uint(obj, ACPI_PCIHP_IO_LEN_PROP, NULL);
> =20
>      /* The above need not be conditional on machine type because the res=
et port
>       * happens to be the same on PIIX (pc) and ICH9 (q35). */
> @@ -392,6 +392,9 @@ static void build_append_pci_bus_devices(Aml *parent_=
scope, PCIBus *bus,
> =20
>          if (!pdev) {
>              if (bsel) { /* add hotplug slots for non present devices */
> +                if (pci_bus_is_express(bus) && slot > 0) {
> +                    break;
> +                }
>                  dev =3D aml_device("S%.02X", PCI_DEVFN(slot, 0));
>                  aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
>                  aml_append(dev, aml_name_decl("_ADR", aml_int(slot << 16=
)));
> @@ -521,7 +524,7 @@ static void build_append_pci_bus_devices(Aml *parent_=
scope, PCIBus *bus,
>              QLIST_FOREACH(sec, &bus->child, sibling) {
>                  int32_t devfn =3D sec->parent_dev->devfn;
> =20
> -                if (pci_bus_is_root(sec) || pci_bus_is_express(sec)) {
> +                if (pci_bus_is_root(sec)) {
>                      continue;
>                  }
> =20
> @@ -1251,7 +1254,7 @@ static void build_piix4_isa_bridge(Aml *table)
>      aml_append(table, scope);
>  }
> =20
> -static void build_piix4_pci_hotplug(Aml *table)
> +static void build_x86_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr)
>  {
>      Aml *scope;
>      Aml *field;
> @@ -1260,20 +1263,22 @@ static void build_piix4_pci_hotplug(Aml *table)
>      scope =3D  aml_scope("_SB.PCI0");
> =20
>      aml_append(scope,
> -        aml_operation_region("PCST", AML_SYSTEM_IO, aml_int(0xae00), 0x0=
8));
> +        aml_operation_region("PCST", AML_SYSTEM_IO, aml_int(pcihp_addr),=
 0x08));
>      field =3D aml_field("PCST", AML_DWORD_ACC, AML_NOLOCK, AML_WRITE_AS_=
ZEROS);
>      aml_append(field, aml_named_field("PCIU", 32));
>      aml_append(field, aml_named_field("PCID", 32));
>      aml_append(scope, field);
> =20
>      aml_append(scope,
> -        aml_operation_region("SEJ", AML_SYSTEM_IO, aml_int(0xae08), 0x04=
));
> +        aml_operation_region("SEJ", AML_SYSTEM_IO,
> +                             aml_int(pcihp_addr + ACPI_PCIHP_SEJ_BASE), =
0x04));
>      field =3D aml_field("SEJ", AML_DWORD_ACC, AML_NOLOCK, AML_WRITE_AS_Z=
EROS);
>      aml_append(field, aml_named_field("B0EJ", 32));
>      aml_append(scope, field);
> =20
>      aml_append(scope,
> -        aml_operation_region("BNMR", AML_SYSTEM_IO, aml_int(0xae10), 0x0=
8));
> +        aml_operation_region("BNMR", AML_SYSTEM_IO,
> +                             aml_int(pcihp_addr + ACPI_PCIHP_BNMR_BASE),=
 0x08));
>      field =3D aml_field("BNMR", AML_DWORD_ACC, AML_NOLOCK, AML_WRITE_AS_=
ZEROS);
>      aml_append(field, aml_named_field("BNUM", 32));
>      aml_append(field, aml_named_field("PIDX", 32));
> @@ -1407,7 +1412,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>          build_piix4_isa_bridge(dsdt);
>          build_isa_devices_aml(dsdt);
>          if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
> -            build_piix4_pci_hotplug(dsdt);
> +            build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
>          }
>          build_piix4_pci0_int(dsdt);
>      } else {
> @@ -1455,6 +1460,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>          }
>          build_q35_isa_bridge(dsdt);
>          build_isa_devices_aml(dsdt);
> +        if (pm->pcihp_bridge_en) {
> +            build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
> +        }
>          build_q35_pci0_int(dsdt);
>          if (pcms->smbus && !pcmc->do_not_add_smb_acpi) {
>              build_smb0(dsdt, pcms->smbus, ICH9_SMB_DEV, ICH9_SMB_FUNC);
> @@ -1489,7 +1497,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>      {
>          aml_append(scope, aml_name_decl("_HID", aml_string("ACPI0006")));
> =20
> -        if (misc->is_piix4 && (pm->pcihp_bridge_en || pm->pcihp_root_en)=
) {
> +        if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
>              method =3D aml_method("_E01", 0, AML_NOTSERIALIZED);
>              aml_append(method,
>                  aml_acquire(aml_name("\\_SB.PCI0.BLCK"), 0xFFFF));

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--w+zUBqQLhjOUlU+H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDtEFMACgkQbDjKyiDZ
s5IVmg/+ORnH/HR829WfgqARgz3VSrtHWRzgQNBKR0vN8+UjIqkvl0hQkRIc1U3y
Xd8Aic8mTrx4MJDVAh+TlYGzc2GZCmPGSXvnAAOJLvjOMaV2WLhrdOHqHM7P4q/I
0NbI+YsJbVya3ezN5IN1b9FwyfTT0wqwU/AjyRDKaeVvO2eSP8IqbHCM8wNNy35F
KbseYrXFdwe7sQx8CK7bOgHEGF7mvf4IaW1FR2RWBtnOIMp+EeDVMH+di3OkREMJ
fXdmOLgZXoJqldcdphtGPkYTKGBG4pv2DgTEh6lm2sBoNaSneYoPOah2sCZzIaPi
gXsSg6rAWAC8MVzei3K4vNAS6ae0OSFOP4AN3oNUAqmo0JiUGCkxcx25hneqT63Q
GuWi4Ce8gGbIyqYJgl4FS6IuoPiGo7smbKCMgucO0K7dceQHLkWyg4FQh+ro6iHq
GLcrTq+LAqeSl1JABE2Nd5BUZ4jczkeC3RSADpmTqRpUQGH2etwRy/vqG8KNJ1fs
ZXe3mOg2gvgksd+NuN7VFkNvQY93vcESOCtnaBUTIeCxw4msr/9O31xL32i/h0ZD
sS/X934036W/ENIU5oLvs4B3vvLkKfiBIanPII0bFEBoDqfVADWUPVtfWqYE2yqQ
Fi8AR3io+r/bc2yms1N/1FjKj5IU7YQokpvYFcRrQF90SPTBadQ=
=yyyj
-----END PGP SIGNATURE-----

--w+zUBqQLhjOUlU+H--

