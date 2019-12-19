Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE321265BE
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 16:29:24 +0100 (CET)
Received: from localhost ([::1]:43616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihxjv-0001Dn-8a
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 10:29:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44955)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1ihxiu-0000f1-5w
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 10:28:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1ihxir-0002yR-Sq
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 10:28:20 -0500
Received: from 3.mo1.mail-out.ovh.net ([46.105.60.232]:52555)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1ihxir-0002ne-M1
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 10:28:17 -0500
Received: from player787.ha.ovh.net (unknown [10.108.42.83])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id E65981A5ED0
 for <qemu-devel@nongnu.org>; Thu, 19 Dec 2019 16:28:14 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player787.ha.ovh.net (Postfix) with ESMTPSA id 78953D98D173;
 Thu, 19 Dec 2019 15:28:10 +0000 (UTC)
Date: Thu, 19 Dec 2019 16:28:08 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 04/10] ppc/pnv: Introduce a "xics" property under the
 POWER8 chip
Message-ID: <20191219162808.19f1da11@bahia.lan>
In-Reply-To: <20191219073001.26790-5-clg@kaod.org>
References: <20191219073001.26790-1-clg@kaod.org>
 <20191219073001.26790-5-clg@kaod.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 10884637352940312971
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdduuddgjeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeekjedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.60.232
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Dec 2019 08:29:55 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> POWER8 is the only chip using the XICS interface. Add a "xics" link
> and a XICSFabric attribute under this chip to remove the use of
> qdev_get_machine()
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  include/hw/ppc/pnv.h |  2 ++
>  hw/ppc/pnv.c         | 26 ++++++++++++++++++++------
>  2 files changed, 22 insertions(+), 6 deletions(-)
>=20
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index f31180618672..8b957dfb5736 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -74,6 +74,8 @@ typedef struct Pnv8Chip {
>      Pnv8Psi      psi;
>      PnvOCC       occ;
>      PnvHomer     homer;
> +
> +    XICSFabric    *xics;
>  } Pnv8Chip;
> =20
>  #define TYPE_PNV9_CHIP "pnv9-chip"
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index d6fe5ba13535..6500efba1317 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -797,6 +797,13 @@ static void pnv_init(MachineState *machine)
>           */
>          object_property_set_link(chip, OBJECT(sysmem), "system-memory",
>                                   &error_abort);
> +        /*
> +         * The POWER8 machine use the XICS interrupt interface.
> +         * Propagate the XICS fabric to the chip and its controllers.
> +         */
> +        if (object_dynamic_cast(OBJECT(pnv), TYPE_XICS_FABRIC)) {
> +            object_property_set_link(chip, OBJECT(pnv), "xics", &error_a=
bort);
> +        }
>          object_property_set_bool(chip, true, "realized", &error_fatal);
>      }
>      g_free(chip_typename);
> @@ -838,12 +845,12 @@ static uint32_t pnv_chip_core_pir_p8(PnvChip *chip,=
 uint32_t core_id)
>  static void pnv_chip_power8_intc_create(PnvChip *chip, PowerPCCPU *cpu,
>                                          Error **errp)
>  {
> +    Pnv8Chip *chip8 =3D PNV8_CHIP(chip);
>      Error *local_err =3D NULL;
>      Object *obj;
>      PnvCPUState *pnv_cpu =3D pnv_cpu_state(cpu);
> =20
> -    obj =3D icp_create(OBJECT(cpu), TYPE_PNV_ICP, XICS_FABRIC(qdev_get_m=
achine()),
> -                     &local_err);
> +    obj =3D icp_create(OBJECT(cpu), TYPE_PNV_ICP, chip8->xics, &local_er=
r);
>      if (local_err) {
>          error_propagate(errp, local_err);
>          return;
> @@ -997,6 +1004,12 @@ static void pnv_chip_power8_instance_init(Object *o=
bj)
>  {
>      Pnv8Chip *chip8 =3D PNV8_CHIP(obj);
> =20
> +    object_property_add_link(obj, "xics", TYPE_XICS_FABRIC,
> +                             (Object **)&chip8->xics,
> +                             object_property_allow_set_link,
> +                             OBJ_PROP_LINK_STRONG,
> +                             &error_abort);
> +
>      object_initialize_child(obj, "psi",  &chip8->psi, sizeof(chip8->psi),
>                              TYPE_PNV8_PSI, &error_abort, NULL);
> =20
> @@ -1016,7 +1029,6 @@ static void pnv_chip_icp_realize(Pnv8Chip *chip8, E=
rror **errp)
>      PnvChipClass *pcc =3D PNV_CHIP_GET_CLASS(chip);
>      int i, j;
>      char *name;
> -    XICSFabric *xi =3D XICS_FABRIC(qdev_get_machine());
> =20
>      name =3D g_strdup_printf("icp-%x", chip->chip_id);
>      memory_region_init(&chip8->icp_mmio, OBJECT(chip), name, PNV_ICP_SIZ=
E);
> @@ -1032,7 +1044,7 @@ static void pnv_chip_icp_realize(Pnv8Chip *chip8, E=
rror **errp)
> =20
>          for (j =3D 0; j < CPU_CORE(pnv_core)->nr_threads; j++) {
>              uint32_t pir =3D pcc->core_pir(chip, core_hwid) + j;
> -            PnvICPState *icp =3D PNV_ICP(xics_icp_get(xi, pir));
> +            PnvICPState *icp =3D PNV_ICP(xics_icp_get(chip8->xics, pir));
> =20
>              memory_region_add_subregion(&chip8->icp_mmio, pir << 12,
>                                          &icp->mmio);
> @@ -1048,6 +1060,8 @@ static void pnv_chip_power8_realize(DeviceState *de=
v, Error **errp)
>      Pnv8Psi *psi8 =3D &chip8->psi;
>      Error *local_err =3D NULL;
> =20
> +    assert(chip8->xics);
> +
>      /* XSCOM bridge is first */
>      pnv_xscom_realize(chip, PNV_XSCOM_SIZE, &local_err);
>      if (local_err) {
> @@ -1067,8 +1081,8 @@ static void pnv_chip_power8_realize(DeviceState *de=
v, Error **errp)
>                              "bar", &error_fatal);
>      object_property_set_link(OBJECT(&chip8->psi), OBJECT(chip->system_me=
mory),
>                               "system-memory", &error_abort);
> -    object_property_set_link(OBJECT(&chip8->psi), OBJECT(qdev_get_machin=
e()),
> -                             ICS_PROP_XICS, &error_abort);
> +    object_property_set_link(OBJECT(&chip8->psi), OBJECT(chip8->xics),
> +                              ICS_PROP_XICS, &error_abort);
>      object_property_set_bool(OBJECT(&chip8->psi), true, "realized", &loc=
al_err);
>      if (local_err) {
>          error_propagate(errp, local_err);


