Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BBF8E727
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 10:44:02 +0200 (CEST)
Received: from localhost ([::1]:39556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyBMW-0006fA-Mb
	for lists+qemu-devel@lfdr.de; Thu, 15 Aug 2019 04:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39665)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hyBLg-00068G-Nw
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 04:43:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hyBLe-0000tF-MC
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 04:43:08 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:45434 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hyBLa-0000p1-N3; Thu, 15 Aug 2019 04:43:02 -0400
Received: from lhreml708-cah.china.huawei.com (unknown [172.18.7.106])
 by Forcepoint Email with ESMTP id 9B17652D7327F24699D7;
 Thu, 15 Aug 2019 09:42:54 +0100 (IST)
Received: from LHREML524-MBS.china.huawei.com ([169.254.2.44]) by
 lhreml708-cah.china.huawei.com ([10.201.108.49]) with mapi id 14.03.0415.000; 
 Thu, 15 Aug 2019 09:42:48 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>
Thread-Topic: [PATCH-for-4.2 v9 01/12] hw/acpi: Make ACPI IO address space
 configurable
Thread-Index: AQHVUhsepJ6BzbHQTUih0D7/qq9SU6b74kAA
Date: Thu, 15 Aug 2019 08:42:48 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA83F36E598@lhreml524-mbs.china.huawei.com>
References: <20190813210539.31164-1-shameerali.kolothum.thodi@huawei.com>
 <20190813210539.31164-2-shameerali.kolothum.thodi@huawei.com>
In-Reply-To: <20190813210539.31164-2-shameerali.kolothum.thodi@huawei.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.227.237]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.176.76.210
Subject: Re: [Qemu-devel] [PATCH-for-4.2 v9 01/12] hw/acpi: Make ACPI IO
	address space	configurable
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "sameo@linux.intel.com" <sameo@linux.intel.com>,
 "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>,
 Linuxarm <linuxarm@huawei.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>,
 "lersek@redhat.com" <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Linuxarm [mailto:linuxarm-bounces@huawei.com] On Behalf Of Shameer
> Kolothum
> Sent: 13 August 2019 22:05
> To: qemu-devel@nongnu.org; qemu-arm@nongnu.org;
> eric.auger@redhat.com; imammedo@redhat.com
> Cc: peter.maydell@linaro.org; sameo@linux.intel.com;
> ard.biesheuvel@linaro.org; Linuxarm <linuxarm@huawei.com>;
> shannon.zhaosl@gmail.com; sebastien.boeuf@intel.com; lersek@redhat.com
> Subject: [PATCH-for-4.2 v9 01/12] hw/acpi: Make ACPI IO address space
> configurable
>=20
> This is in preparation for adding support for ARM64 platforms
> where it doesn't use port mapped IO for ACPI IO space. We are
> making changes so that MMIO region can be accommodated
> and board can pass the base address into the aml build function.

Looks like, this now breaks the "make check" on x86_64 and needs
updating bios-tables-test-allowed-diff.h with DSDT entries. But I am=20
not sure what changed now compared to v8(and older ones) that makes
it to complain now!.=20

Patchew URL: https://patchew.org/QEMU/20190813210539.31164-1-shameerali.kol=
othum.thodi@huawei.com/

ERROR:/tmp/qemu-test/src/tests/bios-tables-test.c:447:test_acpi_asl: assert=
ion failed: (all_tables_match)

Thanks,
Shameer

> Also move few MEMORY_* definitions to header so that other memory
> hotplug event signalling mechanisms (eg. Generic Event Device on
> HW-reduced acpi platforms) can use the same from their respective
> event handler code.
>=20
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
> v8 --> v9
>   -base address is an input into build_memory_hotplug_aml()
>   -Removed R-by tags from Igor and Eric for now.
> ---
>  hw/acpi/memory_hotplug.c         | 29 ++++++++++++++---------------
>  hw/i386/acpi-build.c             |  4 +++-
>  hw/i386/pc.c                     |  3 +++
>  include/hw/acpi/memory_hotplug.h |  9 +++++++--
>  include/hw/i386/pc.h             |  3 +++
>  5 files changed, 30 insertions(+), 18 deletions(-)
>=20
> diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> index 297812d5f7..1734d4b44f 100644
> --- a/hw/acpi/memory_hotplug.c
> +++ b/hw/acpi/memory_hotplug.c
> @@ -29,12 +29,7 @@
>  #define MEMORY_SLOT_PROXIMITY_METHOD "MPXM"
>  #define MEMORY_SLOT_EJECT_METHOD     "MEJ0"
>  #define MEMORY_SLOT_NOTIFY_METHOD    "MTFY"
> -#define MEMORY_SLOT_SCAN_METHOD      "MSCN"
>  #define MEMORY_HOTPLUG_DEVICE        "MHPD"
> -#define MEMORY_HOTPLUG_IO_LEN         24
> -#define MEMORY_DEVICES_CONTAINER     "\\_SB.MHPC"
> -
> -static uint16_t memhp_io_base;
>=20
>  static ACPIOSTInfo *acpi_memory_device_status(int slot, MemStatus *mdev)
>  {
> @@ -209,7 +204,7 @@ static const MemoryRegionOps
> acpi_memory_hotplug_ops =3D {
>  };
>=20
>  void acpi_memory_hotplug_init(MemoryRegion *as, Object *owner,
> -                              MemHotplugState *state, uint16_t
> io_base)
> +                              MemHotplugState *state, hwaddr
> io_base)
>  {
>      MachineState *machine =3D MACHINE(qdev_get_machine());
>=20
> @@ -218,12 +213,10 @@ void acpi_memory_hotplug_init(MemoryRegion *as,
> Object *owner,
>          return;
>      }
>=20
> -    assert(!memhp_io_base);
> -    memhp_io_base =3D io_base;
>      state->devs =3D g_malloc0(sizeof(*state->devs) * state->dev_count);
>      memory_region_init_io(&state->io, owner, &acpi_memory_hotplug_ops,
> state,
>                            "acpi-mem-hotplug",
> MEMORY_HOTPLUG_IO_LEN);
> -    memory_region_add_subregion(as, memhp_io_base, &state->io);
> +    memory_region_add_subregion(as, io_base, &state->io);
>  }
>=20
>  /**
> @@ -342,7 +335,8 @@ const VMStateDescription vmstate_memory_hotplug
> =3D {
>=20
>  void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
>                                const char *res_root,
> -                              const char *event_handler_method)
> +                              const char *event_handler_method,
> +                              AmlRegionSpace rs, hwaddr
> memhp_io_base)
>  {
>      int i;
>      Aml *ifctx;
> @@ -365,14 +359,19 @@ void build_memory_hotplug_aml(Aml *table,
> uint32_t nr_mem,
>              aml_name_decl("_UID", aml_string("Memory hotplug
> resources")));
>=20
>          crs =3D aml_resource_template();
> -        aml_append(crs,
> -            aml_io(AML_DECODE16, memhp_io_base, memhp_io_base, 0,
> -                   MEMORY_HOTPLUG_IO_LEN)
> -        );
> +        if (rs =3D=3D AML_SYSTEM_IO) {
> +            aml_append(crs,
> +                aml_io(AML_DECODE16, memhp_io_base,
> memhp_io_base, 0,
> +                       MEMORY_HOTPLUG_IO_LEN)
> +            );
> +        } else {
> +            aml_append(crs, aml_memory32_fixed(memhp_io_base,
> +                            MEMORY_HOTPLUG_IO_LEN,
> AML_READ_WRITE));
> +        }
>          aml_append(mem_ctrl_dev, aml_name_decl("_CRS", crs));
>=20
>          aml_append(mem_ctrl_dev, aml_operation_region(
> -            MEMORY_HOTPLUG_IO_REGION, AML_SYSTEM_IO,
> +            MEMORY_HOTPLUG_IO_REGION, rs,
>              aml_int(memhp_io_base), MEMORY_HOTPLUG_IO_LEN)
>          );
>=20
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index f3fdfefcd5..e76d6631ea 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1871,7 +1871,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>          build_cpus_aml(dsdt, machine, opts, pm->cpu_hp_io_base,
>                         "\\_SB.PCI0", "\\_GPE._E02");
>      }
> -    build_memory_hotplug_aml(dsdt, nr_mem, "\\_SB.PCI0",
> "\\_GPE._E03");
> +    build_memory_hotplug_aml(dsdt, nr_mem, "\\_SB.PCI0",
> +                             "\\_GPE._E03", AML_SYSTEM_IO,
> +                             pcms->memhp_io_base);
>=20
>      scope =3D  aml_scope("_GPE");
>      {
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 549c437050..be973cea99 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1936,6 +1936,9 @@ void pc_memory_init(PCMachineState *pcms,
>=20
>      /* Init default IOAPIC address space */
>      pcms->ioapic_as =3D &address_space_memory;
> +
> +    /* Init ACPI memory hotplug IO base address */
> +    pcms->memhp_io_base =3D ACPI_MEMORY_HOTPLUG_BASE;
>  }
>=20
>  /*
> diff --git a/include/hw/acpi/memory_hotplug.h
> b/include/hw/acpi/memory_hotplug.h
> index 77c65765d6..dfe9cf3fde 100644
> --- a/include/hw/acpi/memory_hotplug.h
> +++ b/include/hw/acpi/memory_hotplug.h
> @@ -5,6 +5,10 @@
>  #include "hw/acpi/acpi.h"
>  #include "hw/acpi/aml-build.h"
>=20
> +#define MEMORY_SLOT_SCAN_METHOD      "MSCN"
> +#define MEMORY_DEVICES_CONTAINER     "\\_SB.MHPC"
> +#define MEMORY_HOTPLUG_IO_LEN         24
> +
>  /**
>   * MemStatus:
>   * @is_removing: the memory device in slot has been requested to be
> ejected.
> @@ -29,7 +33,7 @@ typedef struct MemHotplugState {
>  } MemHotplugState;
>=20
>  void acpi_memory_hotplug_init(MemoryRegion *as, Object *owner,
> -                              MemHotplugState *state, uint16_t
> io_base);
> +                              MemHotplugState *state, hwaddr
> io_base);
>=20
>  void acpi_memory_plug_cb(HotplugHandler *hotplug_dev, MemHotplugState
> *mem_st,
>                           DeviceState *dev, Error **errp);
> @@ -48,5 +52,6 @@ void acpi_memory_ospm_status(MemHotplugState
> *mem_st, ACPIOSTInfoList ***list);
>=20
>  void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
>                                const char *res_root,
> -                              const char *event_handler_method);
> +                              const char *event_handler_method,
> +                              AmlRegionSpace rs, hwaddr
> memhp_io_base);
>  #endif
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 859b64c51d..49b47535cf 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -69,6 +69,9 @@ struct PCMachineState {
>      /* Address space used by IOAPIC device. All IOAPIC interrupts
>       * will be translated to MSI messages in the address space. */
>      AddressSpace *ioapic_as;
> +
> +    /* ACPI Memory hotplug IO base address */
> +    hwaddr memhp_io_base;
>  };
>=20
>  #define PC_MACHINE_ACPI_DEVICE_PROP "acpi-device"
> --
> 2.17.1
>=20
>=20
> _______________________________________________
> Linuxarm mailing list
> Linuxarm@huawei.com
> http://hulk.huawei.com/mailman/listinfo/linuxarm

