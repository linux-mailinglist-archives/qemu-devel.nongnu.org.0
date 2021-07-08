Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 544D23BF46A
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 06:05:53 +0200 (CEST)
Received: from localhost ([::1]:49920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1LIN-00038N-Ty
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 00:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1LFU-0001Pi-6m; Thu, 08 Jul 2021 00:02:52 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:35919 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1LFR-0004eJ-LM; Thu, 08 Jul 2021 00:02:51 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GL2gk44XCz9sX2; Thu,  8 Jul 2021 14:02:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625716962;
 bh=NipMwljLBKnlyMqBE//p/SR1naiPKf/AnYYuYiG+y10=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lbgiQAAM75sbFP427WHL8L6GvPOFIFtMbu1JAE8Fc6B+6S8AnuLuiFgc11+dAzLXY
 upWUEChRxs1pjyFXO2opEGf4Zyii/i5oPRoP3/9jSn1ITYh9nWujGYlAprHLObLyg6
 +E7YSbFNbMJzdEjtnmM13DkQlQBZzJ3u92YbnplM=
Date: Thu, 8 Jul 2021 12:47:55 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 1/4] ppc/pegasos2: Introduce Pegasos2MachineState structure
Message-ID: <YOZnW+lrqRCGl2kX@yekko>
References: <cover.1624811233.git.balaton@eik.bme.hu>
 <7f6d5fbf4f70c64dba001483174a2921dd616ecd.1624811233.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+Zh1hYFkkbFCbVfw"
Content-Disposition: inline
In-Reply-To: <7f6d5fbf4f70c64dba001483174a2921dd616ecd.1624811233.git.balaton@eik.bme.hu>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--+Zh1hYFkkbFCbVfw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 27, 2021 at 06:27:13PM +0200, BALATON Zoltan wrote:
> Add own machine state structure which will be used to store state
> needed for firmware emulation.
>=20
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> Reviewed-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Applied to ppc-for-6.1.

> ---
>  hw/ppc/pegasos2.c | 50 +++++++++++++++++++++++++++++++++++------------
>  1 file changed, 37 insertions(+), 13 deletions(-)
>=20
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index 0bfd0928aa..07971175c9 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -1,7 +1,7 @@
>  /*
>   * QEMU PowerPC CHRP (Genesi/bPlan Pegasos II) hardware System Emulator
>   *
> - * Copyright (c) 2018-2020 BALATON Zoltan
> + * Copyright (c) 2018-2021 BALATON Zoltan
>   *
>   * This work is licensed under the GNU GPL license version 2 or later.
>   *
> @@ -41,6 +41,15 @@
> =20
>  #define BUS_FREQ_HZ 133333333
> =20
> +#define TYPE_PEGASOS2_MACHINE  MACHINE_TYPE_NAME("pegasos2")
> +OBJECT_DECLARE_TYPE(Pegasos2MachineState, MachineClass, PEGASOS2_MACHINE)
> +
> +struct Pegasos2MachineState {
> +    MachineState parent_obj;
> +    PowerPCCPU *cpu;
> +    DeviceState *mv;
> +};
> +
>  static void pegasos2_cpu_reset(void *opaque)
>  {
>      PowerPCCPU *cpu =3D opaque;
> @@ -51,9 +60,9 @@ static void pegasos2_cpu_reset(void *opaque)
> =20
>  static void pegasos2_init(MachineState *machine)
>  {
> -    PowerPCCPU *cpu =3D NULL;
> +    Pegasos2MachineState *pm =3D PEGASOS2_MACHINE(machine);
> +    CPUPPCState *env;
>      MemoryRegion *rom =3D g_new(MemoryRegion, 1);
> -    DeviceState *mv;
>      PCIBus *pci_bus;
>      PCIDevice *dev;
>      I2CBus *i2c_bus;
> @@ -63,15 +72,16 @@ static void pegasos2_init(MachineState *machine)
>      uint8_t *spd_data;
> =20
>      /* init CPU */
> -    cpu =3D POWERPC_CPU(cpu_create(machine->cpu_type));
> -    if (PPC_INPUT(&cpu->env) !=3D PPC_FLAGS_INPUT_6xx) {
> +    pm->cpu =3D POWERPC_CPU(cpu_create(machine->cpu_type));
> +    env =3D &pm->cpu->env;
> +    if (PPC_INPUT(env) !=3D PPC_FLAGS_INPUT_6xx) {
>          error_report("Incompatible CPU, only 6xx bus supported");
>          exit(1);
>      }
> =20
>      /* Set time-base frequency */
> -    cpu_ppc_tb_init(&cpu->env, BUS_FREQ_HZ / 4);
> -    qemu_register_reset(pegasos2_cpu_reset, cpu);
> +    cpu_ppc_tb_init(env, BUS_FREQ_HZ / 4);
> +    qemu_register_reset(pegasos2_cpu_reset, pm->cpu);
> =20
>      /* RAM */
>      memory_region_add_subregion(get_system_memory(), 0, machine->ram);
> @@ -96,16 +106,16 @@ static void pegasos2_init(MachineState *machine)
>      g_free(filename);
> =20
>      /* Marvell Discovery II system controller */
> -    mv =3D DEVICE(sysbus_create_simple(TYPE_MV64361, -1,
> -                        ((qemu_irq *)cpu->env.irq_inputs)[PPC6xx_INPUT_I=
NT]));
> -    pci_bus =3D mv64361_get_pci_bus(mv, 1);
> +    pm->mv =3D DEVICE(sysbus_create_simple(TYPE_MV64361, -1,
> +                             ((qemu_irq *)env->irq_inputs)[PPC6xx_INPUT_=
INT]));
> +    pci_bus =3D mv64361_get_pci_bus(pm->mv, 1);
> =20
>      /* VIA VT8231 South Bridge (multifunction PCI device) */
>      /* VT8231 function 0: PCI-to-ISA Bridge */
>      dev =3D pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0), t=
rue,
>                                            TYPE_VT8231_ISA);
>      qdev_connect_gpio_out(DEVICE(dev), 0,
> -                          qdev_get_gpio_in_named(mv, "gpp", 31));
> +                          qdev_get_gpio_in_named(pm->mv, "gpp", 31));
> =20
>      /* VT8231 function 1: IDE Controller */
>      dev =3D pci_create_simple(pci_bus, PCI_DEVFN(12, 1), "via-ide");
> @@ -129,8 +139,10 @@ static void pegasos2_init(MachineState *machine)
>      pci_vga_init(pci_bus);
>  }
> =20
> -static void pegasos2_machine(MachineClass *mc)
> +static void pegasos2_machine_class_init(ObjectClass *oc, void *data)
>  {
> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> +
>      mc->desc =3D "Genesi/bPlan Pegasos II";
>      mc->init =3D pegasos2_init;
>      mc->block_default_type =3D IF_IDE;
> @@ -141,4 +153,16 @@ static void pegasos2_machine(MachineClass *mc)
>      mc->default_ram_size =3D 512 * MiB;
>  }
> =20
> -DEFINE_MACHINE("pegasos2", pegasos2_machine)
> +static const TypeInfo pegasos2_machine_info =3D {
> +    .name          =3D TYPE_PEGASOS2_MACHINE,
> +    .parent        =3D TYPE_MACHINE,
> +    .class_init    =3D pegasos2_machine_class_init,
> +    .instance_size =3D sizeof(Pegasos2MachineState),
> +};
> +
> +static void pegasos2_machine_register_types(void)
> +{
> +    type_register_static(&pegasos2_machine_info);
> +}
> +
> +type_init(pegasos2_machine_register_types)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+Zh1hYFkkbFCbVfw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDmZ1sACgkQbDjKyiDZ
s5KMJg/8DHpRHFDp9fb4SyWIGjVCHT0uFbtiMbV4gOBRW/Is2HXPwSM8fnTymQ09
hn8tPSR26gwtANE3egvwtRyP+treG2TG1RSAFaAgWnyc89OtAr0DQxyr8YTUBzYt
gm1RXzFivBoZwl0ovH5/zTIlMXiv8sOEF+qvtpvFADns2mmcOIyIBOUHw6vdNXPA
07agfttVndzkaIcULR6ynhs4HHEmmvzkVqxRpkyJHYzmESfoaogSPd27iLxkC8wu
ELW9tg/mgGsZWXH6jem7XXT2eXEPS+aikaaGWRMRoheV9bMMsSESaLzuwt7FtmhA
QcDYTVTgCc3Y5uX5L43BdZYtA8eKzzPdzxnygdYuV/nmZ1NIgnVHcFdhSdawhF0g
QZIq7ozT3VF16QCvr13YIH8zPd+WVf2NA2/XaoHgW3b5VdVNN42NcuoC58MMDCyi
ayhV6ZPuiBB6NF7QB0/mWMK36AO3Fa08jERA3f+DCaX0KAESgUZ749GifXtJIfpA
5p4kiUkDXiMVawwAbQ7gJRNccshrdLQ3iI7n5Ma21xo8XKW/TeLEuaqQNRjc9Iiw
5Al7EKxQl9IfCw6Em+AJWjAJsc52zMUMdT/HAPf+UQWIjk8DgTOoHWRKymTWZ8Kq
hQSp43ln6cnh6XLQ0MN8CwqGZXH4Eb8a58M8tYSGB2Zb2laPUbU=
=HnOE
-----END PGP SIGNATURE-----

--+Zh1hYFkkbFCbVfw--

