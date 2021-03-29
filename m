Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE3234C2B3
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 06:27:21 +0200 (CEST)
Received: from localhost ([::1]:54592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQjUm-0007CW-DV
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 00:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lQjOZ-0007tl-3F; Mon, 29 Mar 2021 00:20:55 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:50229 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lQjOV-00005q-GU; Mon, 29 Mar 2021 00:20:54 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F7zs93hzxz9sVb; Mon, 29 Mar 2021 15:20:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616991645;
 bh=odO66/290eNIynQ0ATxRPgvLGevigChb0vFUkHx9E8Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KjB8UqDFRIjjvrC4w23npjeAl47oiuz0iRlIQq9peMUCGvwr3irq/Abn76j3jBGHd
 sJG7N7rBQLaKgnvd1I+qB+iF0Gt6uhS7kZO5WCbO42zwwndt4uAWjI+8j2WfEbS3Yt
 8fx116rKri0EdFUNzX8VwuMTyl6mqqsHdCYCeh00=
Date: Mon, 29 Mar 2021 15:15:25 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v11 0/7] Pegasos2 emulation
Message-ID: <YGFUXf1Ip4siaPqd@yekko.fritz.box>
References: <cover.1616680239.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/HDhPcnBqu8+nAIA"
Content-Disposition: inline
In-Reply-To: <cover.1616680239.git.balaton@eik.bme.hu>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--/HDhPcnBqu8+nAIA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 02:50:39PM +0100, BALATON Zoltan wrote:
> Hello,
>=20
> This is adding a new PPC board called pegasos2. More info on it can be
> found at:
>=20
> https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2
>=20
> Currently it needs a firmware ROM image that I cannot include due to
> original copyright holder (bPlan) did not release it under a free
> licence but I have plans to write a replacement in the future. With
> the original board firmware it can boot MorphOS now as:
>=20
> qemu-system-ppc -M pegasos2 -cdrom morphos.iso -device ati-vga,romfile=3D=
"" -serial stdio
>=20
> then enter "boot cd boot.img" at the firmware "ok" prompt as described
> in the MorphOS.readme. To boot Linux use same command line with e.g.
> -cdrom debian-8.11.0-powerpc-netinst.iso then enter
> "boot cd install/pegasos"
>=20
> The last patch adds the actual board code after previous patches
> adding VT8231 and MV64361 system controller chip emulation.

Applied to ppc-for-6.1, thanks.

>=20
> Regards,
> BALATON Zoltan
>=20
> v11: Changes to last two patches David asked for during review
>=20
> v10: Updated comments and added R-b from Mark
>=20
> v9: Rebased to master
>=20
> v8: Do not emulate setting of serial port address via register, just
>     hard code a default address instead
>=20
> v7: Fix errp usage in patch 2
>=20
> v6: Rebased on master, updated commit message about migration change
>=20
> v5: Changes for review comments from David and Philippe
>=20
> V4: Rename pegasos2_reset to pegasos2_cpu_reset
>     Add new files to MAINTAINERS
>=20
> BALATON Zoltan (6):
>   vt82c686: QOM-ify superio related functionality
>   vt82c686: Add VT8231_SUPERIO based on VIA_SUPERIO
>   vt82c686: Introduce abstract TYPE_VIA_ISA and base vt82c686b_isa on it
>   vt82c686: Add emulation of VT8231 south bridge
>   hw/pci-host: Add emulation of Marvell MV64361 PPC system controller
>   hw/ppc: Add emulation of Genesi/bPlan Pegasos II
>=20
> Philippe Mathieu-Daud=E9 (1):
>   hw/isa/Kconfig: Add missing dependency VIA VT82C686 -> APM
>=20
>  MAINTAINERS                             |  10 +
>  default-configs/devices/ppc-softmmu.mak |   2 +
>  hw/isa/Kconfig                          |   1 +
>  hw/isa/vt82c686.c                       | 422 +++++++++--
>  hw/pci-host/Kconfig                     |   4 +
>  hw/pci-host/meson.build                 |   2 +
>  hw/pci-host/mv64361.c                   | 951 ++++++++++++++++++++++++
>  hw/pci-host/mv643xx.h                   | 918 +++++++++++++++++++++++
>  hw/pci-host/trace-events                |   6 +
>  hw/ppc/Kconfig                          |   9 +
>  hw/ppc/meson.build                      |   2 +
>  hw/ppc/pegasos2.c                       | 144 ++++
>  include/hw/isa/vt82c686.h               |   2 +-
>  include/hw/pci-host/mv64361.h           |   8 +
>  include/hw/pci/pci_ids.h                |   4 +-
>  15 files changed, 2403 insertions(+), 82 deletions(-)
>  create mode 100644 hw/pci-host/mv64361.c
>  create mode 100644 hw/pci-host/mv643xx.h
>  create mode 100644 hw/ppc/pegasos2.c
>  create mode 100644 include/hw/pci-host/mv64361.h
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/HDhPcnBqu8+nAIA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBhVF0ACgkQbDjKyiDZ
s5IOvQ/+PaJNsAHlFCIvdfuWBEzLbk0Ar4FJofybWcGiha5usSEC+E4NUz1Rg4Kh
wo8xbGEAAY6A75h9dRf2TF615/7KxyIsPEqHWQgf5HzFuYX6oN6L1Vd0ARjGHmEF
vwbOzk/vNHBcUGCbCL7PYEj34DBEWE6GfOlByWbYBVEJX0yFd7Ztar1/WoeVUOD9
RlrZQw/Zi20cIoz/UwJaAD/qIY43ssuZwMgtZrpZx2qcScJdgzP/GsOtxBEhqfj8
kns4mCguiSJ6LilCdC8vC9G1lT4NuE2w9g9n6wmhD4vwNAMIPPg1Y2yjEYPkjI2g
bdMUygjLnastaamOjeTriLY4mKX78iDW+fyFq7ehMYx+sY40Gv+lLwIlSpCVPpRt
CGH+Rrl9ypwmoR2UjqShO57uIg7nHyye1hacBMVtrfGm0xxx+Kjh2Hxyu938bU5r
ugz3FJGvFlTtBEFZOssEXexe8+YW85H919TrVyji+fwrYPaEzW1vJ88H+5fiq59e
2KFlTMmpxSdpdoYwKyx2XxObYwtnM1toXutwID/6v7YBCw8odKaiSjilxrJPb4Th
RAtAJfC+2gWaMjyivUE83XXUtJp10QlAeigetTxGuYusw9vA+RpOArA0wSWny6ef
v+2tGfqSUU/2C93icU4pH0gWP81xx1LS5vy3OArORMeL/hwnwYs=
=F8a6
-----END PGP SIGNATURE-----

--/HDhPcnBqu8+nAIA--

