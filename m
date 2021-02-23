Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 208723224F9
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 05:46:06 +0100 (CET)
Received: from localhost ([::1]:54282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEPaH-0004M0-7A
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 23:46:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lEPWb-0000HU-MX; Mon, 22 Feb 2021 23:42:17 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:54475 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lEPWX-00058T-3s; Mon, 22 Feb 2021 23:42:17 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Dl5xX1Pzpz9sVR; Tue, 23 Feb 2021 15:42:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1614055328;
 bh=akRRaAiMrYXMFHmSs2DcX0sQkWthn3BHMGy4jApHqN8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EojDvRA6nRJUVczu6gbXAshpY1uyE0qgqEsTvospLFmnBLnAN6yFJ9V1h/qsfqIV7
 OEXp+A7xlzvbJ21wUJxtzuMe+vwZlCJg1t5UCxDNZ8rULjh0bvZizSGhoHk/YtqRI8
 h0mYj93TC0ZWVcqK7fuXF+ie6pDmxu7pxdor6a4w=
Date: Tue, 23 Feb 2021 15:38:52 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v3 6/6] hw/ppc: Add emulation of Genesi/bPlan Pegasos II
Message-ID: <YDSG3MEH2TWiIchJ@yekko.fritz.box>
References: <cover.1614007326.git.balaton@eik.bme.hu>
 <9d76a2aaa15380c76c97e4ee54ae00425420e667.1614007326.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KY/PwkYBAeJktoqI"
Content-Disposition: inline
In-Reply-To: <9d76a2aaa15380c76c97e4ee54ae00425420e667.1614007326.git.balaton@eik.bme.hu>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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


--KY/PwkYBAeJktoqI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2021 at 04:22:06PM +0100, BALATON Zoltan wrote:
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
> ---
>  default-configs/devices/ppc-softmmu.mak |   2 +
>  hw/ppc/Kconfig                          |  10 ++
>  hw/ppc/meson.build                      |   2 +
>  hw/ppc/pegasos2.c                       | 144 ++++++++++++++++++++++++
>  4 files changed, 158 insertions(+)
>  create mode 100644 hw/ppc/pegasos2.c
>=20
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
> +
>  # For PReP
>  CONFIG_PREP=3Dy
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index d11dc30509..98d8dd1a84 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -68,6 +68,16 @@ config SAM460EX
>      select USB_OHCI
>      select FDT_PPC
> =20
> +config PEGASOS2
> +    bool
> +    select MV64361
> +    select VT82C686
> +    select IDE_VIA
> +    select SMBUS_EEPROM
> +# These should come with VT82C686
> +    select APM
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
> index 0000000000..8b96961c90
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
> +#define BUS_FREQ 133333333
> +
> +static void pegasos2_reset(void *opaque)

I'd suggest pegasos2_cpu_reset() for clarity.  With the current name
I'd assume it was the machine reset function.

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
> +    cpu_ppc_tb_init(&cpu->env, BUS_FREQ / 4);
> +    qemu_register_reset(pegasos2_reset, cpu);
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

--KY/PwkYBAeJktoqI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmA0htwACgkQbDjKyiDZ
s5I7Bw//YZWTZyryC5s7WfDKprVLaOyCW8NMUD+PMwSg5EQ84aDhokKniK6CZhOq
rbhTRk4z4aQDSk44HBAug5AudguVBsbTtlB0JQx9pLJt1oooSxjnd6W6f35vZV2H
ZiBKeZkTLqE0UhiFXJbZ2loe9IX2LO14ZaShG5qSeix/EvlMO9ugM2l/3djeW2mP
h26+Bs/3+wnRAVBUoAhiPbX8ORqRqYGTfroOG7WjZs849FUlEg/N7ZiNjrSdRtO3
2jJgceYqxU5pa0GMPmVZ9Au2c6NJE/bMCSF03SewGzC1lgS+/DzdqQIHIuJYwhR4
+KPqqP6vr82jnPGsSdkkhixNNiKsl72hZt995j+KPl9B80uth5mZNFgBPsdYJtCC
6sRHCNJgYWY9G5K/r7WJ7Q6B2kZcW8H6slOUp2NC4fmGLxgVwrWEVo5K5AFLpC7o
c178rRvoaG60EvObQW8gIrcuWfad/6b0L/q9hRI8aR61U5bKzWLbetrTKAfbC0XJ
pGk5wY5KplnJj648IcD/dVOT9sF1qPc5YcdoU+QHzPbPoohvPPMfad64N5KURMmI
0pY+/bb+IKvI08YLICj6oIHbu9edykU/D19a3IVO1gXRYtA8xyTshBSBZcatPap2
L7Q4O1cT5KUfBxSEPAnAhXNjk9gVrO7qPM8Du2oN0sxz1XFEgSw=
=dA/p
-----END PGP SIGNATURE-----

--KY/PwkYBAeJktoqI--

