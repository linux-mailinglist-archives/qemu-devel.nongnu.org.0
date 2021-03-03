Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BD432ACC0
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 02:37:04 +0100 (CET)
Received: from localhost ([::1]:37518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHGRj-0006mm-8N
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 20:37:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lHGOK-0005dh-Ff; Tue, 02 Mar 2021 20:33:32 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:44433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lHGOG-0004rP-QM; Tue, 02 Mar 2021 20:33:32 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DqxN23j7nz9sVS; Wed,  3 Mar 2021 12:33:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1614735202;
 bh=jco5Xm2vksaKpo3OJEPUWmdKoJ7MBnKbhUp7+HBdTao=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kV4kIHG99Dm0COspfvYm2O+BWAJaaMqbnfxV5u5eEMAbhU2qwA5IBywuSUXIb1GPC
 HETxaJuk6rLLmu4Q+xGhOwMiGumYoUdStKNoi1L+/5VUFtQ1oYXWyk0RI9+4FxQJfP
 NZhBt4YI6HLtbTrDR+sTYpU7hSF2SpaPsayRnoFo=
Date: Wed, 3 Mar 2021 11:21:43 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v4 6/6] hw/ppc: Add emulation of Genesi/bPlan Pegasos II
Message-ID: <YD7Wl/21vn7Dkizg@yekko.fritz.box>
References: <cover.1614282456.git.balaton@eik.bme.hu>
 <848089b1c91e0c28eb7c52ccdc55dc870eb49dc0.1614282457.git.balaton@eik.bme.hu>
 <97399e18-3217-40db-5021-702371d196bc@amsat.org>
 <c0403b8b-fee1-11e2-a8d0-2af36f66c9@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="u1I/ed05Bq2TGgCB"
Content-Disposition: inline
In-Reply-To: <c0403b8b-fee1-11e2-a8d0-2af36f66c9@eik.bme.hu>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--u1I/ed05Bq2TGgCB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 02, 2021 at 10:13:19AM +0100, BALATON Zoltan wrote:
> On Tue, 2 Mar 2021, Philippe Mathieu-Daud=E9 wrote:
> > On 2/25/21 8:47 PM, BALATON Zoltan wrote:
> > > Add new machine called pegasos2 emulating the Genesi/bPlan Pegasos II,
> > > a PowerPC board based on the Marvell MV64361 system controller and the
> > > VIA VT8231 integrated south bridge/superio chips. It can run Linux,
> > > AmigaOS and a wide range of MorphOS versions. Currently a firmware ROM
> > > image is needed to boot and only MorphOS has a video driver to produce
> > > graphics output. Linux could work too but distros that supported this
> > > machine don't include usual video drivers so those only run with
> > > serial console for now.
> > >=20
> > > Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> > > ---
> > >  MAINTAINERS                             |  10 ++
> > >  default-configs/devices/ppc-softmmu.mak |   2 +
> > >  hw/ppc/Kconfig                          |  10 ++
> > >  hw/ppc/meson.build                      |   2 +
> > >  hw/ppc/pegasos2.c                       | 144 ++++++++++++++++++++++=
++
> > >  5 files changed, 168 insertions(+)
> > >  create mode 100644 hw/ppc/pegasos2.c
> > >=20
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 9b2aa18e1f..a023217702 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -1345,6 +1345,16 @@ F: pc-bios/canyonlands.dt[sb]
> > >  F: pc-bios/u-boot-sam460ex-20100605.bin
> > >  F: roms/u-boot-sam460ex
> > >=20
> > > +pegasos2
> > > +M: BALATON Zoltan <balaton@eik.bme.hu>
> > > +R: David Gibson <david@gibson.dropbear.id.au>
> >=20
> > :)
>=20
> He's also listed as reviewer for the sam460ex and I think as the PPC
> maintainer probably should be notified about changes that's why this is
> here. I guess he can complain or submit a patch later if he wants to be
> removed.

Including me as reviewer is fine for now.

>=20
> > > +L: qemu-ppc@nongnu.org
> > > +S: Maintained
> > > +F: hw/ppc/pegasos2.c
> > > +F: hw/pci-host/mv64361.c
> > > +F: hw/pci-host/mv643xx.h
> > > +F: include/hw/pci-host/mv64361.h
> > > +
> > >  RISC-V Machines
> > >  ---------------
> > >  OpenTitan
> > > diff --git a/default-configs/devices/ppc-softmmu.mak b/default-config=
s/devices/ppc-softmmu.mak
> > > index 61b78b844d..4535993d8d 100644
> > > --- a/default-configs/devices/ppc-softmmu.mak
> > > +++ b/default-configs/devices/ppc-softmmu.mak
> > > @@ -14,5 +14,7 @@ CONFIG_SAM460EX=3Dy
> > >  CONFIG_MAC_OLDWORLD=3Dy
> > >  CONFIG_MAC_NEWWORLD=3Dy
> > >=20
> > > +CONFIG_PEGASOS2=3Dy
> > > +
> > >  # For PReP
> > >  CONFIG_PREP=3Dy
> > > diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> > > index d11dc30509..98d8dd1a84 100644
> > > --- a/hw/ppc/Kconfig
> > > +++ b/hw/ppc/Kconfig
> > > @@ -68,6 +68,16 @@ config SAM460EX
> > >      select USB_OHCI
> > >      select FDT_PPC
> > >=20
> > > +config PEGASOS2
> > > +    bool
> > > +    select MV64361
> > > +    select VT82C686
> > > +    select IDE_VIA
> > > +    select SMBUS_EEPROM
> > > +# These should come with VT82C686
> > > +    select APM
> > > +    select ACPI_X86
> > > +
> > >  config PREP
> > >      bool
> > >      imply PCI_DEVICES
> > > diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
> > > index 218631c883..86d6f379d1 100644
> > > --- a/hw/ppc/meson.build
> > > +++ b/hw/ppc/meson.build
> > > @@ -78,5 +78,7 @@ ppc_ss.add(when: 'CONFIG_E500', if_true: files(
> > >  ))
> > >  # PowerPC 440 Xilinx ML507 reference board.
> > >  ppc_ss.add(when: 'CONFIG_VIRTEX', if_true: files('virtex_ml507.c'))
> > > +# Pegasos2
> > > +ppc_ss.add(when: 'CONFIG_PEGASOS2', if_true: files('pegasos2.c'))
> > >=20
> > >  hw_arch +=3D {'ppc': ppc_ss}
> > > diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> > > new file mode 100644
> > > index 0000000000..427e884fbf
> > > --- /dev/null
> > > +++ b/hw/ppc/pegasos2.c
> > > @@ -0,0 +1,144 @@
> > > +/*
> > > + * QEMU PowerPC CHRP (Genesi/bPlan Pegasos II) hardware System Emula=
tor
> > > + *
> > > + * Copyright (c) 2018-2020 BALATON Zoltan
> >=20
> > 2018-2021
>=20
> Not really. I've done this between Christmas of 2018 and 2020. This year
> were only changes for upstreaming and review comments so I preserved the
> dates to record when the actual code was written.

Fwiw, Red Hat's internal guidelines have the opinion that the years
don't matter that much and are usually out of date, so they suggest
simply "Copyright Red Hat." for contributions from us. IANAL.

> > > + *
> > > + * This work is licensed under the GNU GPL license version 2 or late=
r.
> > > + *
> > > + */
> > > +
> > > +#include "qemu/osdep.h"
> > > +#include "qemu-common.h"
> > > +#include "qemu/units.h"
> > > +#include "qapi/error.h"
> > > +#include "hw/hw.h"
> > > +#include "hw/ppc/ppc.h"
> > > +#include "hw/sysbus.h"
> > > +#include "hw/pci/pci_host.h"
> > > +#include "hw/irq.h"
> > > +#include "hw/pci-host/mv64361.h"
> > > +#include "hw/isa/vt82c686.h"
> > > +#include "hw/ide/pci.h"
> > > +#include "hw/i2c/smbus_eeprom.h"
> > > +#include "hw/qdev-properties.h"
> > > +#include "sysemu/reset.h"
> > > +#include "hw/boards.h"
> > > +#include "hw/loader.h"
> > > +#include "hw/fw-path-provider.h"
> > > +#include "elf.h"
> > > +#include "qemu/log.h"
> > > +#include "qemu/error-report.h"
> > > +#include "sysemu/kvm.h"
> > > +#include "kvm_ppc.h"
> > > +#include "exec/address-spaces.h"
> > > +#include "trace.h"
> > > +#include "qemu/datadir.h"
> > > +#include "sysemu/device_tree.h"
> > > +
> > > +#define PROM_FILENAME "pegasos2.rom"
> > > +#define PROM_ADDR     0xfff00000
> > > +#define PROM_SIZE     0x80000
> > > +
> > > +#define BUS_FREQ 133333333
> >=20
> > Can you rename as BUS_FREQ_HZ?
> >=20
> > > +
> > > +static void pegasos2_cpu_reset(void *opaque)
> > > +{
> > > +    PowerPCCPU *cpu =3D opaque;
> > > +
> > > +    cpu_reset(CPU(cpu));
> > > +    cpu->env.spr[SPR_HID1] =3D 7ULL << 28;
> > > +}
> > > +
> > > +static void pegasos2_init(MachineState *machine)
> > > +{
> > > +    PowerPCCPU *cpu =3D NULL;
> > > +    MemoryRegion *rom =3D g_new(MemoryRegion, 1);
> > > +    DeviceState *mv;
> > > +    PCIBus *pci_bus;
> > > +    PCIDevice *dev;
> > > +    I2CBus *i2c_bus;
> > > +    const char *fwname =3D machine->firmware ?: PROM_FILENAME;
> > > +    char *filename;
> > > +    int sz;
> > > +    uint8_t *spd_data;
> > > +
> > > +    /* init CPU */
> > > +    cpu =3D POWERPC_CPU(cpu_create(machine->cpu_type));
> > > +    if (PPC_INPUT(&cpu->env) !=3D PPC_FLAGS_INPUT_6xx) {
> > > +        error_report("Incompatible CPU, only 6xx bus supported");
> > > +        exit(1);
> > > +    }
> > > +
> > > +    /* Set time-base frequency */
> > > +    cpu_ppc_tb_init(&cpu->env, BUS_FREQ / 4);
> > > +    qemu_register_reset(pegasos2_cpu_reset, cpu);
> > > +
> > > +    /* RAM */
> > > +    memory_region_add_subregion(get_system_memory(), 0, machine->ram=
);
> > > +
> > > +    /* allocate and load firmware */
> > > +    filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, fwname);
> > > +    if (!filename) {
> > > +        error_report("Could not find firmware '%s'", fwname);
> > > +        exit(1);
> > > +    }
> > > +    memory_region_init_rom(rom, NULL, "pegasos2.rom", PROM_SIZE, &er=
ror_fatal);
> > > +    memory_region_add_subregion(get_system_memory(), PROM_ADDR, rom);
> > > +    sz =3D load_elf(filename, NULL, NULL, NULL, NULL, NULL, NULL, NU=
LL, 1,
> > > +                  PPC_ELF_MACHINE, 0, 0);
> > > +    if (sz <=3D 0) {
> > > +        sz =3D load_image_targphys(filename, PROM_ADDR, PROM_SIZE);
> > > +    }
> > > +    if (sz <=3D 0 || sz > PROM_SIZE) {
> > > +        error_report("Could not load firmware '%s'", filename);
> > > +        exit(1);
> > > +    }
> > > +    g_free(filename);
> > > +
> > > +    /* Marvell Discovery II system controller */
> > > +    mv =3D DEVICE(sysbus_create_simple(TYPE_MV64361, -1,
> > > +                        ((qemu_irq *)cpu->env.irq_inputs)[PPC6xx_INP=
UT_INT]));
> >=20
> > Indent off.
>=20
> There's no other way to fit in the 80 chars line length limit in a sensib=
le
> way. (Aligning to DEVICE( would be confusing as last arg belongs to
> sysbus_create_simple().)

You could declare a temporary variable with the complex irq_inputs expressi=
on.

>=20
> > Otherwise:
> > Reviewed-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>=20
> Thanks, I'll do the other changes you've recommended.
>=20
> Regards,
> BALATON Zoltan


--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--u1I/ed05Bq2TGgCB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmA+1pUACgkQbDjKyiDZ
s5JF6BAA33AF2UEx5Ermo8MrY0QCYJkLhq36epYW3R9Dp3/Ln9KFGp/fBj4syHCu
YW3wWPRjyCX1fGjwEMTvjY+j99YQOLmUVzULKnHRtetPSAKvq8BYzW+lX5zYiH/l
NB7F5habCoujDKBw0c4O9mUr29z7qhOYAcq/xS7cSF5IfkMJH9smyf7aFulbS3hQ
6EF+AdLOg1fQyO0HKgVm3WIuHNvmiOKfen+UNFvcwPtOy1J///X+1fEPytv/7Pdb
EZIg7uO7UKQSjAbrS1J2WgJE7/tgw976bqHWXiXsLKOm2EsjfqnLpXaWrlpmjP7E
WopGhbRqkzPDnvH9tijgva9U6So43LJIeknTvF10Hps8uKek6B46+H3xPYEwn9ql
HcWUm9CxsMvNJOwQPcbT4uVkpMPpYak9l2vp+npBYGZ64VsFmwccLaWaIbKj6T8S
PuTC6CV1cNyRNIy6DqKtHyLNhXonf3uvsVEVFNezOebCFwTyrxPPXQpPys6d/WCY
SnvUpD+o+I7Ci7orve4Pj33TSkzE+wrZ+A/aDTkIZioO0sJ/RgP4kanmbsxC8Rxi
1Aeceu9z5dwP7GufogKHaExBGMdnygbylc2H0mcc1XNxlQdF/CVww66BhOzrA+9D
Vdot0gMK0thG7dCbyfENCUQ73o0YJ6M0PrEkYBIonXDjUtTuZFs=
=uWeH
-----END PGP SIGNATURE-----

--u1I/ed05Bq2TGgCB--

