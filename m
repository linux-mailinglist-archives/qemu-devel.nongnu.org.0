Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE432D948E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 10:06:35 +0100 (CET)
Received: from localhost ([::1]:54100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kojoQ-0006pd-8g
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 04:06:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kojjA-0002EY-HG; Mon, 14 Dec 2020 04:01:08 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:58467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kojj6-0006tp-U2; Mon, 14 Dec 2020 04:01:08 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cvb2z6NJgz9sTv; Mon, 14 Dec 2020 20:00:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607936459;
 bh=KdqUSzG8Cs4IGKFpgQU46O68PPATtS1gj7a7BqPd3bU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oglxtCZ1A0CJ4strIxFtGsUquVF76Fc39A/DxvwElPAyBE93Z4XLDfKT4GTHbARrW
 cWlmJbh1W8qz4ZxL4K10cgVM3+NttO9Fz3N7rMh4Fj2a6DmRSG7P2ykBhAUnkDUOvP
 Xh2dFd6zB1xkzkbRroLR60mA4vopQN61v3QUsNEk=
Date: Mon, 14 Dec 2020 16:56:49 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 4/8] hw/ppc/ppc440_bamboo: Drop use of ppcuic_init()
Message-ID: <20201214055649.GE4717@yekko.fritz.box>
References: <20201212001537.24520-1-peter.maydell@linaro.org>
 <20201212001537.24520-5-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WK3l2KTTmXPVedZ6"
Content-Disposition: inline
In-Reply-To: <20201212001537.24520-5-peter.maydell@linaro.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--WK3l2KTTmXPVedZ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 12, 2020 at 12:15:33AM +0000, Peter Maydell wrote:
> Switch the bamboo board to directly creating and configuring the UIC,
> rather than doing it via the old ppcuic_init() helper function.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Applied to ppc-for-6.0.

> ---
>  hw/ppc/ppc440_bamboo.c | 38 +++++++++++++++++++++++++++-----------
>  1 file changed, 27 insertions(+), 11 deletions(-)
>=20
> diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
> index 665bc1784e1..b156bcb9990 100644
> --- a/hw/ppc/ppc440_bamboo.c
> +++ b/hw/ppc/ppc440_bamboo.c
> @@ -33,6 +33,9 @@
>  #include "sysemu/qtest.h"
>  #include "sysemu/reset.h"
>  #include "hw/sysbus.h"
> +#include "hw/intc/ppc-uic.h"
> +#include "hw/qdev-properties.h"
> +#include "qapi/error.h"
> =20
>  #define BINARY_DEVICE_TREE_FILE "bamboo.dtb"
> =20
> @@ -168,13 +171,13 @@ static void bamboo_init(MachineState *machine)
>      MemoryRegion *ram_memories =3D g_new(MemoryRegion, PPC440EP_SDRAM_NR=
_BANKS);
>      hwaddr ram_bases[PPC440EP_SDRAM_NR_BANKS];
>      hwaddr ram_sizes[PPC440EP_SDRAM_NR_BANKS];
> -    qemu_irq *pic;
> -    qemu_irq *irqs;
>      PCIBus *pcibus;
>      PowerPCCPU *cpu;
>      CPUPPCState *env;
>      target_long initrd_size =3D 0;
>      DeviceState *dev;
> +    DeviceState *uicdev;
> +    SysBusDevice *uicsbd;
>      int success;
>      int i;
> =20
> @@ -192,10 +195,17 @@ static void bamboo_init(MachineState *machine)
>      ppc_dcr_init(env, NULL, NULL);
> =20
>      /* interrupt controller */
> -    irqs =3D g_new0(qemu_irq, PPCUIC_OUTPUT_NB);
> -    irqs[PPCUIC_OUTPUT_INT] =3D ((qemu_irq *)env->irq_inputs)[PPC40x_INP=
UT_INT];
> -    irqs[PPCUIC_OUTPUT_CINT] =3D ((qemu_irq *)env->irq_inputs)[PPC40x_IN=
PUT_CINT];
> -    pic =3D ppcuic_init(env, irqs, 0x0C0, 0, 1);
> +    uicdev =3D qdev_new(TYPE_PPC_UIC);
> +    uicsbd =3D SYS_BUS_DEVICE(uicdev);
> +
> +    object_property_set_link(OBJECT(uicdev), "cpu", OBJECT(cpu),
> +                             &error_fatal);
> +    sysbus_realize_and_unref(uicsbd, &error_fatal);
> +
> +    sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_INT,
> +                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT]);
> +    sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_CINT,
> +                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT]);
> =20
>      /* SDRAM controller */
>      memset(ram_bases, 0, sizeof(ram_bases));
> @@ -203,14 +213,18 @@ static void bamboo_init(MachineState *machine)
>      ppc4xx_sdram_banks(machine->ram, PPC440EP_SDRAM_NR_BANKS, ram_memori=
es,
>                         ram_bases, ram_sizes, ppc440ep_sdram_bank_sizes);
>      /* XXX 440EP's ECC interrupts are on UIC1, but we've only created UI=
C0. */
> -    ppc4xx_sdram_init(env, pic[14], PPC440EP_SDRAM_NR_BANKS, ram_memorie=
s,
> +    ppc4xx_sdram_init(env,
> +                      qdev_get_gpio_in(uicdev, 14),
> +                      PPC440EP_SDRAM_NR_BANKS, ram_memories,
>                        ram_bases, ram_sizes, 1);
> =20
>      /* PCI */
>      dev =3D sysbus_create_varargs(TYPE_PPC4xx_PCI_HOST_BRIDGE,
>                                  PPC440EP_PCI_CONFIG,
> -                                pic[pci_irq_nrs[0]], pic[pci_irq_nrs[1]],
> -                                pic[pci_irq_nrs[2]], pic[pci_irq_nrs[3]],
> +                                qdev_get_gpio_in(uicdev, pci_irq_nrs[0]),
> +                                qdev_get_gpio_in(uicdev, pci_irq_nrs[1]),
> +                                qdev_get_gpio_in(uicdev, pci_irq_nrs[2]),
> +                                qdev_get_gpio_in(uicdev, pci_irq_nrs[3]),
>                                  NULL);
>      pcibus =3D (PCIBus *)qdev_get_child_bus(dev, "pci.0");
>      if (!pcibus) {
> @@ -223,12 +237,14 @@ static void bamboo_init(MachineState *machine)
>      memory_region_add_subregion(get_system_memory(), PPC440EP_PCI_IO, is=
a);
> =20
>      if (serial_hd(0) !=3D NULL) {
> -        serial_mm_init(address_space_mem, 0xef600300, 0, pic[0],
> +        serial_mm_init(address_space_mem, 0xef600300, 0,
> +                       qdev_get_gpio_in(uicdev, 0),
>                         PPC_SERIAL_MM_BAUDBASE, serial_hd(0),
>                         DEVICE_BIG_ENDIAN);
>      }
>      if (serial_hd(1) !=3D NULL) {
> -        serial_mm_init(address_space_mem, 0xef600400, 0, pic[1],
> +        serial_mm_init(address_space_mem, 0xef600400, 0,
> +                       qdev_get_gpio_in(uicdev, 1),
>                         PPC_SERIAL_MM_BAUDBASE, serial_hd(1),
>                         DEVICE_BIG_ENDIAN);
>      }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--WK3l2KTTmXPVedZ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/W/qEACgkQbDjKyiDZ
s5JiDw//TEL2Cw949mr+1fZ7ph7aMKu2EXU57dsroyWR4UBcIxDzSWVz0RtbW3v/
QnJF6cTRjiNWFFIG7JPsJZAz0jhvk41URQQgv9A/FPVzqmha/YPa8NvuHgrbnUJG
6kehi+kAgcx53tq+X3FOCKV4uGCNVAx4MaD7Bj1wDU9TGxIblQQT/+gVGBHGK56T
2nVrUzvl9Dg+RmdWi+O8iIKGsfPd9ms5acrMIm0lVhdMXqbNnr2Bhqc8HV4EFM/4
2JnsUeG5pC++owIiop5HrfGqP5vQCOX1+ZLEibMt5b3Q2x6+zYUZ0iabBT55q9vs
ryNDw26ksAmY9HV7X6IB8WVZa0jIacN1t3CGwnB8/o3jZCLCYZzYCYttkuLDoUDk
MfMF/BW5sBoRKT0InPeZ/5k08KLsT8+5UjajwNw/G4GUBXTCb7o/4fdpmhUwbMm1
vbwd8tFN+cSC7dY7RTQSSk6unJGC0DaltL16xgr8U9Bmmg48jXSJLz1JPbp4gD18
q/aGzUsigThtSadT5ErKlBObtXJ4ByhQZmiqUdNzHGxTHxYMUiQoD/gxFHpbZlnA
e1MsmlKTzltqAM47YVZx3wFSHvZIea+Y9YYZRWgjyR4i+PXS109i5M9PIlKOxVRL
czlk704fBJPx9idBG73jTAb3LUwge5Cedzp6XxsIBovsLIKblVw=
=qKLV
-----END PGP SIGNATURE-----

--WK3l2KTTmXPVedZ6--

