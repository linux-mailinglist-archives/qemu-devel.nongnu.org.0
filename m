Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE04306AC9
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 02:56:30 +0100 (CET)
Received: from localhost ([::1]:33204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4wXt-0007bf-M1
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 20:56:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l4wOB-00088o-Pd; Wed, 27 Jan 2021 20:46:27 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:51517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l4wO8-0005Bs-VV; Wed, 27 Jan 2021 20:46:27 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DR3GW02Nvz9sWd; Thu, 28 Jan 2021 12:46:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611798371;
 bh=ivVKVoR04xRkdiECTJBUrXsE/c5z8T2YMeORW8shlck=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NhNdDIbVRL2Cs7G/1SbZ+8AhIkzKiBqoK/UUgXChXKlqGgJctLyegttRYXQl8vCtd
 Hq4SbYrkqhiYGe/B6VG+p8B737uZmhco9ax5alqx27xgYsSLvxgL26nhZ03R7gtUPb
 kjbsZsbWdyTOakZxmTqa+aQlarAiPC4lX/HD8yF0=
Date: Thu, 28 Jan 2021 11:54:32 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 7/7] ppc/pnv: Introduce a LPC FW memory region attribute
 to map the PNOR
Message-ID: <20210128005432.GJ18347@yekko.fritz.box>
References: <20210126171059.307867-1-clg@kaod.org>
 <20210126171059.307867-8-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QxN5xOWGsmh5a4wb"
Content-Disposition: inline
In-Reply-To: <20210126171059.307867-8-clg@kaod.org>
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--QxN5xOWGsmh5a4wb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 26, 2021 at 06:10:59PM +0100, C=E9dric Le Goater wrote:
> This to map the PNOR from the machine init handler directly and finish
> the cleanup of the LPC model.
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Applied to ppc-for-6.0, thanks.

> ---
>  include/hw/ppc/pnv.h |  1 +
>  hw/ppc/pnv.c         | 11 +++++++++++
>  hw/ppc/pnv_lpc.c     |  7 -------
>  3 files changed, 12 insertions(+), 7 deletions(-)
>=20
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index ee7eda3e0102..d69cee17b232 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -58,6 +58,7 @@ struct PnvChip {
>      MemoryRegion xscom;
>      AddressSpace xscom_as;
> =20
> +    MemoryRegion *fw_mr;
>      gchar        *dt_isa_nodename;
>  };
> =20
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index e500c2e2437e..50810df83815 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -871,6 +871,14 @@ static void pnv_init(MachineState *machine)
>          pnv_ipmi_bt_init(pnv->isa_bus, pnv->bmc, 10);
>      }
> =20
> +    /*
> +     * The PNOR is mapped on the LPC FW address space by the BMC.
> +     * Since we can not reach the remote BMC machine with LPC memops,
> +     * map it always for now.
> +     */
> +    memory_region_add_subregion(pnv->chips[0]->fw_mr, PNOR_SPI_OFFSET,
> +                                &pnv->pnor->mmio);
> +
>      /*
>       * OpenPOWER systems use a IPMI SEL Event message to notify the
>       * host to powerdown
> @@ -1150,6 +1158,7 @@ static void pnv_chip_power8_realize(DeviceState *de=
v, Error **errp)
>      qdev_realize(DEVICE(&chip8->lpc), NULL, &error_fatal);
>      pnv_xscom_add_subregion(chip, PNV_XSCOM_LPC_BASE, &chip8->lpc.xscom_=
regs);
> =20
> +    chip->fw_mr =3D &chip8->lpc.isa_fw;
>      chip->dt_isa_nodename =3D g_strdup_printf("/xscom@%" PRIx64 "/isa@%x=
",
>                                              (uint64_t) PNV_XSCOM_BASE(ch=
ip),
>                                              PNV_XSCOM_LPC_BASE);
> @@ -1479,6 +1488,7 @@ static void pnv_chip_power9_realize(DeviceState *de=
v, Error **errp)
>      memory_region_add_subregion(get_system_memory(), PNV9_LPCM_BASE(chip=
),
>                                  &chip9->lpc.xscom_regs);
> =20
> +    chip->fw_mr =3D &chip9->lpc.isa_fw;
>      chip->dt_isa_nodename =3D g_strdup_printf("/lpcm-opb@%" PRIx64 "/lpc=
@0",
>                                              (uint64_t) PNV9_LPCM_BASE(ch=
ip));
> =20
> @@ -1592,6 +1602,7 @@ static void pnv_chip_power10_realize(DeviceState *d=
ev, Error **errp)
>      memory_region_add_subregion(get_system_memory(), PNV10_LPCM_BASE(chi=
p),
>                                  &chip10->lpc.xscom_regs);
> =20
> +    chip->fw_mr =3D &chip10->lpc.isa_fw;
>      chip->dt_isa_nodename =3D g_strdup_printf("/lpcm-opb@%" PRIx64 "/lpc=
@0",
>                                              (uint64_t) PNV10_LPCM_BASE(c=
hip));
>  }
> diff --git a/hw/ppc/pnv_lpc.c b/hw/ppc/pnv_lpc.c
> index 11739e397b27..bcbca3db9743 100644
> --- a/hw/ppc/pnv_lpc.c
> +++ b/hw/ppc/pnv_lpc.c
> @@ -824,7 +824,6 @@ ISABus *pnv_lpc_isa_create(PnvLpcController *lpc, boo=
l use_cpld, Error **errp)
>      ISABus *isa_bus;
>      qemu_irq *irqs;
>      qemu_irq_handler handler;
> -    PnvMachineState *pnv =3D PNV_MACHINE(qdev_get_machine());
> =20
>      /* let isa_bus_new() create its own bridge on SysBus otherwise
>       * devices specified on the command line won't find the bus and
> @@ -850,11 +849,5 @@ ISABus *pnv_lpc_isa_create(PnvLpcController *lpc, bo=
ol use_cpld, Error **errp)
> =20
>      isa_bus_irqs(isa_bus, irqs);
> =20
> -    /*
> -     * TODO: Map PNOR on the LPC FW address space on demand ?
> -     */
> -    memory_region_add_subregion(&lpc->isa_fw, PNOR_SPI_OFFSET,
> -                                &pnv->pnor->mmio);
> -
>      return isa_bus;
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--QxN5xOWGsmh5a4wb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmASC0gACgkQbDjKyiDZ
s5K4ihAAtheGB09GON4p1b2GAPzUgnJDZnXFhho6a4gXLYaB82CI6GpHJA/LxUOl
qQn1f4f/uvT9FU6Wbtka1ZtjCNMa5GG63aYGVsDQb5hyHx7SA+RjvG9+wgqhiRNa
Md/rDN2pfGDZ2e1psAMxKzMDwZzJ0lVAvKzbS35Co2CkaZXdjWs77RD+S4X92WAe
rRhO2cRmhC+KGW5G6j+I3Om2FvnXv/4EQJ0JD/NCgjtTX67uF6yXpf5cFhbxtqdg
h/a42U6A/0+TXhvx1gE+1CJCTLWslzDea8uZ35KL4zoCNesDYJqG7qKuWddZlS8U
BNprfemzQmH3sgvqXuIvY1ILTsuJG/hMkrfWoQTrpLCF+SQw1PgIoJy67bMA/PPX
MjY8bGvXce/RyAxYlBLOU5nAuT1nK9hjJUyDKtaUL0KUo7MTt351Ga7ndCmzvyJA
qesIe+7XwOX9r8+p7c0UvMcZYQjRlVYTLTv35wSeMw+ITICCbq0AzJHWQqk3rJqB
N4jLzqJxNiZ4NtR98RBMTidtLczXBfWEhFehq3e6cLdSg9riGI6fgpawvSbGr92p
mrohdU7L1iQwSMs6tLuGuevM38aCOKuzYcChIlNMGABZX1YMoRpyXfeTa0RckQnc
IyBTbgvry4eVhX+arGAFqnsX2sicz+XxsjGOCYSLzq6gV3sZOI4=
=kU9S
-----END PGP SIGNATURE-----

--QxN5xOWGsmh5a4wb--

