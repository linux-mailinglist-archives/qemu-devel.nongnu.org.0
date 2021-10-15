Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C4242EA68
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 09:39:15 +0200 (CEST)
Received: from localhost ([::1]:42870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbHoA-00065P-Ra
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 03:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mbHHX-0004ko-DF; Fri, 15 Oct 2021 03:05:31 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:33625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mbHHR-0000GO-PU; Fri, 15 Oct 2021 03:05:31 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HVy2N3W8Yz4xqQ; Fri, 15 Oct 2021 18:05:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634281500;
 bh=KfaltYztkT9xzumHdXHfhRGkelnt+p7txTuUe3HEHpI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EzaAAHu8Y97S8KBc9ojGN9RpC4IHlHqWwphRvp5CSTzwNPohQPXRIXXhsqDHEieMO
 ubT2BPDUyZQ7UrzK4BBYGW03ZLiTR11pqFmGU/Z+uJYK4EjkTfKlYuL0f9JWP/DAu5
 GvZE/1I2MUhnhCRK+hayWZxtd9i8amsO2hn21lHo=
Date: Fri, 15 Oct 2021 14:19:11 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 5/6] ppc/pegasos2: Add constants for PCI config addresses
Message-ID: <YWjzL1bM23tNnP9y@yekko>
References: <cover.1634241019.git.balaton@eik.bme.hu>
 <9bd8e84d02d91693b71082a1fadeb86e6bce3025.1634241019.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yGV+vfK7VBhkrNC9"
Content-Disposition: inline
In-Reply-To: <9bd8e84d02d91693b71082a1fadeb86e6bce3025.1634241019.git.balaton@eik.bme.hu>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--yGV+vfK7VBhkrNC9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2021 at 09:50:19PM +0200, BALATON Zoltan wrote:
> Define a constant for PCI config addresses to make it clearer what
> these numbers are.
>=20
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Applied, thanks.

> ---
>  hw/ppc/pegasos2.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index a861bf16b8..39e96d323f 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -54,11 +54,13 @@
> =20
>  #define BUS_FREQ_HZ 133333333
> =20
> +#define PCI0_CFG_ADDR 0xcf8
>  #define PCI0_MEM_BASE 0xc0000000
>  #define PCI0_MEM_SIZE 0x20000000
>  #define PCI0_IO_BASE  0xf8000000
>  #define PCI0_IO_SIZE  0x10000
> =20
> +#define PCI1_CFG_ADDR 0xc78
>  #define PCI1_MEM_BASE 0x80000000
>  #define PCI1_MEM_SIZE 0x40000000
>  #define PCI1_IO_BASE  0xfe000000
> @@ -226,7 +228,7 @@ static void pegasos2_mv_reg_write(Pegasos2MachineStat=
e *pm, uint32_t addr,
>  static uint32_t pegasos2_pci_config_read(Pegasos2MachineState *pm, int b=
us,
>                                           uint32_t addr, uint32_t len)
>  {
> -    hwaddr pcicfg =3D bus ? 0xc78 : 0xcf8;
> +    hwaddr pcicfg =3D bus ? PCI1_CFG_ADDR : PCI0_CFG_ADDR;
>      uint64_t val =3D 0xffffffffULL;
> =20
>      if (len <=3D 4) {
> @@ -239,7 +241,7 @@ static uint32_t pegasos2_pci_config_read(Pegasos2Mach=
ineState *pm, int bus,
>  static void pegasos2_pci_config_write(Pegasos2MachineState *pm, int bus,
>                                        uint32_t addr, uint32_t len, uint3=
2_t val)
>  {
> -    hwaddr pcicfg =3D bus ? 0xc78 : 0xcf8;
> +    hwaddr pcicfg =3D bus ? PCI1_CFG_ADDR : PCI0_CFG_ADDR;
> =20
>      pegasos2_mv_reg_write(pm, pcicfg, 4, addr | BIT(31));
>      pegasos2_mv_reg_write(pm, pcicfg + 4, len, val);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--yGV+vfK7VBhkrNC9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFo8y8ACgkQbDjKyiDZ
s5L/4A/8Cedmzxeiyzj3IwzE3/a5KB3pFdelguipQsgM/YqRAbfeHrdpb6CqX8bm
Ix1a+whJEzq97RLbixdV1I0TZoA9CFu3/sgfOJhYdQhFGwImqZ9tC7JcIBgKnMH4
QFQvP8DaAbS35WT7kUJPdv+Ou+EDv9HW225J1/ync8aF28oEXu9UDbPuww2quzRz
gSAyH6lumUos/0nOTerJwp1lbKEiFZw/kFOr0P0ZlQDbfoSSZtmJblIpaxwgDZ0o
v3FcnVrxCT1ZhuLPepUL3InJXS4djbWue6Giah09ts5arSnHk+3+xV+IzaI83Jh6
Js+heLJEtwTeReafrqkQLlLyoP+DYvOXv7WzRU2wJ/M9kZFrihttBDqAuFYA9NLs
dAl9B1pDyBdtvWoxUb74BhxiusR4InnVtdyi8xjwDXW/pF7Baq1qNcSazLvcNVNZ
43vHhA2vrykzcg8Fr3pLA6nCFitJbX+RMxBudbS/kAiyhNvXIKSSZo+nvqVAIy8z
kNoQ+EwRKhmFaINs5lhTOtAz+PQVj9te+ts/nNXjfLkpzVKLcPQBnq0ZVQdH4Kkz
ZbatUe5W3nmNAofotC4Bt9uMoOKMfIVX18SRet3JX3DGwClH41ulyzs6/6OE0dqp
E4GdmWgJpuZp/Eer8hp122idM6LJfIukYpLNxjhgskvPtMcVNH8=
=yEzo
-----END PGP SIGNATURE-----

--yGV+vfK7VBhkrNC9--

