Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE2E345454
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 01:59:13 +0100 (CET)
Received: from localhost ([::1]:40222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOVO4-0000wU-8i
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 20:59:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOVLT-0007SY-8A; Mon, 22 Mar 2021 20:56:31 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:52167 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOVLP-0002TB-Fm; Mon, 22 Mar 2021 20:56:30 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F4CbS0CRHz9sVt; Tue, 23 Mar 2021 11:55:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616460948;
 bh=g4VtbIAlOo21P/I9sjS4l4bLBQW9yoCgqsX8oZRpSeM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E5HlQDarfCF8jKO7sqF8cI/MNZ2rmeqPMwqmgogy1C1Bc1JvWebMbSNL02EAZODjj
 jn6bmMYD9LO8BzCnx7NlYfjSrd/eKGh9Z5G4lxYsRXYV3dySeGNR3cbVlIpvgyTXvJ
 G/ZTXw/nHeAT6UNpejPUlldojDIGZKeLqdof17cY=
Date: Tue, 23 Mar 2021 11:55:36 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v10 7/7] hw/ppc: Add emulation of Genesi/bPlan Pegasos II
Message-ID: <YFk8iCC3IhGw1TqL@yekko.fritz.box>
References: <cover.1615943871.git.balaton@eik.bme.hu>
 <b1639705f196d229647a8fc36e5d1a92f6c58b76.1615943871.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oKtQEfAXsfZHYhpL"
Content-Disposition: inline
In-Reply-To: <b1639705f196d229647a8fc36e5d1a92f6c58b76.1615943871.git.balaton@eik.bme.hu>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--oKtQEfAXsfZHYhpL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 17, 2021 at 02:17:51AM +0100, BALATON Zoltan wrote:
> Add new machine called pegasos2 emulating the Genesi/bPlan Pegasos II,
> a PowerPC board based on the Marvell MV64361 system controller and the
> VIA VT8231 integrated south bridge/superio chips. It can run Linux,
> AmigaOS and a wide range of MorphOS versions. Currently a firmware ROM
> image is needed to boot and only MorphOS has a video driver to produce
> graphics output. Linux could work too but distros that supported this
> machine don't include usual video drivers so those only run with
> serial console for now.
>=20
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> Reviewed-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  MAINTAINERS                             |  10 ++
>  default-configs/devices/ppc-softmmu.mak |   2 +
>  hw/ppc/Kconfig                          |   9 ++
>  hw/ppc/meson.build                      |   2 +
>  hw/ppc/pegasos2.c                       | 144 ++++++++++++++++++++++++
>  5 files changed, 167 insertions(+)
>  create mode 100644 hw/ppc/pegasos2.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b6ab3d25a7..1c3c55ef09 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1353,6 +1353,16 @@ F: pc-bios/canyonlands.dt[sb]
>  F: pc-bios/u-boot-sam460ex-20100605.bin
>  F: roms/u-boot-sam460ex
> =20
> +pegasos2
> +M: BALATON Zoltan <balaton@eik.bme.hu>
> +R: David Gibson <david@gibson.dropbear.id.au>
> +L: qemu-ppc@nongnu.org
> +S: Maintained
> +F: hw/ppc/pegasos2.c
> +F: hw/pci-host/mv64361.c
> +F: hw/pci-host/mv643xx.h
> +F: include/hw/pci-host/mv64361.h

Oh, sorry about the comment in the previous patch.

>  RISC-V Machines
>  ---------------
>  OpenTitan
> diff --git a/default-configs/devices/ppc-softmmu.mak b/default-configs/de=
vices/ppc-softmmu.mak
> index 61b78b844d..4535993d8d 100644
> --- a/default-configs/devices/ppc-softmmu.mak
> +++ b/default-configs/devices/ppc-softmmu.mak
> @@ -14,5 +14,7 @@ CONFIG_SAM460EX=3Dy
>  CONFIG_MAC_OLDWORLD=3Dy
>  CONFIG_MAC_NEWWORLD=3Dy
> =20
> +CONFIG_PEGASOS2=3Dy

I don't think we can have this default to enabled while it requires a
non-free ROM to start.

>  # For PReP
>  CONFIG_PREP=3Dy
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index d11dc30509..e51e0e5e5a 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -68,6 +68,15 @@ config SAM460EX
>      select USB_OHCI
>      select FDT_PPC
> =20
> +config PEGASOS2
> +    bool
> +    select MV64361
> +    select VT82C686
> +    select IDE_VIA
> +    select SMBUS_EEPROM
> +# This should come with VT82C686
> +    select ACPI_X86
> +
>  config PREP
>      bool
>      imply PCI_DEVICES
> diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
> index 218631c883..86d6f379d1 100644
> --- a/hw/ppc/meson.build
> +++ b/hw/ppc/meson.build
> @@ -78,5 +78,7 @@ ppc_ss.add(when: 'CONFIG_E500', if_true: files(
>  ))
>  # PowerPC 440 Xilinx ML507 reference board.
>  ppc_ss.add(when: 'CONFIG_VIRTEX', if_true: files('virtex_ml507.c'))
> +# Pegasos2
> +ppc_ss.add(when: 'CONFIG_PEGASOS2', if_true: files('pegasos2.c'))
> =20
>  hw_arch +=3D {'ppc': ppc_ss}
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> new file mode 100644
> index 0000000000..0bfd0928aa
> --- /dev/null
> +++ b/hw/ppc/pegasos2.c
> @@ -0,0 +1,144 @@
> +/*
> + * QEMU PowerPC CHRP (Genesi/bPlan Pegasos II) hardware System Emulator
> + *
> + * Copyright (c) 2018-2020 BALATON Zoltan
> + *
> + * This work is licensed under the GNU GPL license version 2 or later.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +#include "qemu/units.h"
> +#include "qapi/error.h"
> +#include "hw/hw.h"
> +#include "hw/ppc/ppc.h"
> +#include "hw/sysbus.h"
> +#include "hw/pci/pci_host.h"
> +#include "hw/irq.h"
> +#include "hw/pci-host/mv64361.h"
> +#include "hw/isa/vt82c686.h"
> +#include "hw/ide/pci.h"
> +#include "hw/i2c/smbus_eeprom.h"
> +#include "hw/qdev-properties.h"
> +#include "sysemu/reset.h"
> +#include "hw/boards.h"
> +#include "hw/loader.h"
> +#include "hw/fw-path-provider.h"
> +#include "elf.h"
> +#include "qemu/log.h"
> +#include "qemu/error-report.h"
> +#include "sysemu/kvm.h"
> +#include "kvm_ppc.h"
> +#include "exec/address-spaces.h"
> +#include "trace.h"
> +#include "qemu/datadir.h"
> +#include "sysemu/device_tree.h"
> +
> +#define PROM_FILENAME "pegasos2.rom"
> +#define PROM_ADDR     0xfff00000
> +#define PROM_SIZE     0x80000
> +
> +#define BUS_FREQ_HZ 133333333
> +
> +static void pegasos2_cpu_reset(void *opaque)
> +{
> +    PowerPCCPU *cpu =3D opaque;
> +
> +    cpu_reset(CPU(cpu));
> +    cpu->env.spr[SPR_HID1] =3D 7ULL << 28;
> +}
> +
> +static void pegasos2_init(MachineState *machine)
> +{
> +    PowerPCCPU *cpu =3D NULL;
> +    MemoryRegion *rom =3D g_new(MemoryRegion, 1);
> +    DeviceState *mv;
> +    PCIBus *pci_bus;
> +    PCIDevice *dev;
> +    I2CBus *i2c_bus;
> +    const char *fwname =3D machine->firmware ?: PROM_FILENAME;
> +    char *filename;
> +    int sz;
> +    uint8_t *spd_data;
> +
> +    /* init CPU */
> +    cpu =3D POWERPC_CPU(cpu_create(machine->cpu_type));
> +    if (PPC_INPUT(&cpu->env) !=3D PPC_FLAGS_INPUT_6xx) {
> +        error_report("Incompatible CPU, only 6xx bus supported");
> +        exit(1);
> +    }
> +
> +    /* Set time-base frequency */
> +    cpu_ppc_tb_init(&cpu->env, BUS_FREQ_HZ / 4);
> +    qemu_register_reset(pegasos2_cpu_reset, cpu);
> +
> +    /* RAM */
> +    memory_region_add_subregion(get_system_memory(), 0, machine->ram);
> +
> +    /* allocate and load firmware */
> +    filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, fwname);
> +    if (!filename) {
> +        error_report("Could not find firmware '%s'", fwname);
> +        exit(1);
> +    }
> +    memory_region_init_rom(rom, NULL, "pegasos2.rom", PROM_SIZE, &error_=
fatal);
> +    memory_region_add_subregion(get_system_memory(), PROM_ADDR, rom);
> +    sz =3D load_elf(filename, NULL, NULL, NULL, NULL, NULL, NULL, NULL, =
1,
> +                  PPC_ELF_MACHINE, 0, 0);
> +    if (sz <=3D 0) {
> +        sz =3D load_image_targphys(filename, PROM_ADDR, PROM_SIZE);
> +    }
> +    if (sz <=3D 0 || sz > PROM_SIZE) {
> +        error_report("Could not load firmware '%s'", filename);
> +        exit(1);
> +    }
> +    g_free(filename);
> +
> +    /* Marvell Discovery II system controller */
> +    mv =3D DEVICE(sysbus_create_simple(TYPE_MV64361, -1,
> +                        ((qemu_irq *)cpu->env.irq_inputs)[PPC6xx_INPUT_I=
NT]));
> +    pci_bus =3D mv64361_get_pci_bus(mv, 1);
> +
> +    /* VIA VT8231 South Bridge (multifunction PCI device) */
> +    /* VT8231 function 0: PCI-to-ISA Bridge */
> +    dev =3D pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0), t=
rue,
> +                                          TYPE_VT8231_ISA);
> +    qdev_connect_gpio_out(DEVICE(dev), 0,
> +                          qdev_get_gpio_in_named(mv, "gpp", 31));
> +
> +    /* VT8231 function 1: IDE Controller */
> +    dev =3D pci_create_simple(pci_bus, PCI_DEVFN(12, 1), "via-ide");
> +    pci_ide_create_devs(dev);
> +
> +    /* VT8231 function 2-3: USB Ports */
> +    pci_create_simple(pci_bus, PCI_DEVFN(12, 2), "vt82c686b-usb-uhci");
> +    pci_create_simple(pci_bus, PCI_DEVFN(12, 3), "vt82c686b-usb-uhci");
> +
> +    /* VT8231 function 4: Power Management Controller */
> +    dev =3D pci_create_simple(pci_bus, PCI_DEVFN(12, 4), TYPE_VT8231_PM);
> +    i2c_bus =3D I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
> +    spd_data =3D spd_data_generate(DDR, machine->ram_size);
> +    smbus_eeprom_init_one(i2c_bus, 0x57, spd_data);
> +
> +    /* VT8231 function 5-6: AC97 Audio & Modem */
> +    pci_create_simple(pci_bus, PCI_DEVFN(12, 5), TYPE_VIA_AC97);
> +    pci_create_simple(pci_bus, PCI_DEVFN(12, 6), TYPE_VIA_MC97);
> +
> +    /* other PC hardware */
> +    pci_vga_init(pci_bus);
> +}
> +
> +static void pegasos2_machine(MachineClass *mc)
> +{
> +    mc->desc =3D "Genesi/bPlan Pegasos II";
> +    mc->init =3D pegasos2_init;
> +    mc->block_default_type =3D IF_IDE;
> +    mc->default_boot_order =3D "cd";
> +    mc->default_display =3D "std";
> +    mc->default_cpu_type =3D POWERPC_CPU_TYPE_NAME("7400_v2.9");
> +    mc->default_ram_id =3D "pegasos2.ram";
> +    mc->default_ram_size =3D 512 * MiB;
> +}
> +
> +DEFINE_MACHINE("pegasos2", pegasos2_machine)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--oKtQEfAXsfZHYhpL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBZPIUACgkQbDjKyiDZ
s5JzeRAAw0yqhMGSE2ScrJ47lAG/v53jhj2vi+6bPh4z8e+wvllQGhPV+0gn7Nk7
8JifG2x8SCuJiFJRR1dXFgNQ/X5EE5zVRkNIQn6fvEfexVuSH1L97RkRY8NWemr3
hW4ypvJ74pwtExtODVzKl0n46NUixnmxIGI4jeyE49ZRUgwWApfXWk0GvoyRNvST
44Km9PMdKA3yNzZJNQYaFI3T1int2tSeodcDk9RfcAKGBvpTH+Am68MX7fMCMnr8
RMpTVqqI2ofTGzZScjLOR478/IYDPZp+3/3CU9mYY9jl1Po6N+D/amEiYM/BBJ2u
HCbzIBJIQ+mCRXXjL6gKC1b8ckKbRODXkA2xC0qyH20P3Cnycl2K606ZWA94RfC+
f8k4W7k4mZYFwjy6On+L674MCsji+uunYU0H+/MvWF70KKOJBH9/JzS8GPzAaSjK
V1+qGODCZs1KQewOZV1+5/3zutnLkMNpsP3V3b8e8TtmKYVsuHkQENrFyypXNMYi
KJiVd/LrFg0It0lOANqDAtzaSUmNbim1irBhzUz8No6bY0XtFaij+5shJkv03Oyn
6eKnNld27Lw9tYsMBOFyVH9h4cBgoZmLeJ/68I9irkV/LFc06XcgPe1gA8fOLvcH
ZmuRvnRoyG8Mcydz3mnw1/YLvyKjJuykEOKETDHSozC0usSpwm4=
=4wWx
-----END PGP SIGNATURE-----

--oKtQEfAXsfZHYhpL--

