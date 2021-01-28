Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B7F306AB1
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 02:49:52 +0100 (CET)
Received: from localhost ([::1]:51696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4wRT-0003MS-Lg
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 20:49:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l4wO4-0007ti-Ok; Wed, 27 Jan 2021 20:46:20 -0500
Received: from ozlabs.org ([203.11.71.1]:55043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l4wO1-0005Av-UM; Wed, 27 Jan 2021 20:46:20 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DR3GS6N0Vz9sW8; Thu, 28 Jan 2021 12:46:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611798368;
 bh=cuvEU7gm8hSNLc4vcOPFfpV40qqp/ZatDWRGe78M9yU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pn5GYdIrbYb8NJkm9T91UqID3SrxA8RID2pfMDoTbY1KMDTlx2vY6Ak4d18tZ4lDm
 Q4UywHeiHQXBJrheSv60NZ2ea9RVW+DeOIzlm9wXzyKGi6tb6eO40VLlTWGbeBC4j5
 4cUwPKZ9uzcCVmF65G5RN80XereNi8sSQv+HArwk=
Date: Thu, 28 Jan 2021 11:46:55 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 3/7] ppc/pnv: Use skiboot addresses to load kernel and
 ramfs
Message-ID: <20210128004655.GF18347@yekko.fritz.box>
References: <20210126171059.307867-1-clg@kaod.org>
 <20210126171059.307867-4-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JcvBIhDvR6w3jUPA"
Content-Disposition: inline
In-Reply-To: <20210126171059.307867-4-clg@kaod.org>
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
Cc: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--JcvBIhDvR6w3jUPA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 26, 2021 at 06:10:55PM +0100, C=E9dric Le Goater wrote:
> The current settings are useful to load large kernels (with debug) but
> it moves the initrd image in a memory region not protected by
> skiboot. If skiboot is compiled with DEBUG=3D1, memory poisoning will
> corrupt the initrd.
>=20
> Cc: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Applied to ppc-for-6.0, thanks.

> ---
>=20
>  If we want to increase the kernel size limit as commit b45b56baeecd
>  ("ppc/pnv: increase kernel size limit to 256MiB") intented to do, I
>  think we should add a machine option.
>=20
>  hw/ppc/pnv.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 14fc9758a973..e500c2e2437e 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -65,9 +65,9 @@
>  #define FW_MAX_SIZE             (16 * MiB)
> =20
>  #define KERNEL_LOAD_ADDR        0x20000000
> -#define KERNEL_MAX_SIZE         (256 * MiB)
> -#define INITRD_LOAD_ADDR        0x60000000
> -#define INITRD_MAX_SIZE         (256 * MiB)
> +#define KERNEL_MAX_SIZE         (128 * MiB)
> +#define INITRD_LOAD_ADDR        0x28000000
> +#define INITRD_MAX_SIZE         (128 * MiB)
> =20
>  static const char *pnv_chip_core_typename(const PnvChip *o)
>  {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--JcvBIhDvR6w3jUPA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmASCX8ACgkQbDjKyiDZ
s5LT9Q/+L4RzJqPQ9BgF4JPWNd9Z3f8QIZdbtmCDWKiJ9/JoXbfZKs0esTiTZUFi
sq5HxRxlLPhmbcrM/TQpoVg//thfPBh9e1cxe1Ns7djEdsTVOeB721snf8lzM8/a
wndUyYa+sLkedxr1UJkJXtzSJgaHsUmcYP7YuiCkyVoJUGlWSIlqE6uB+mFrdTSV
7hDuElEN+8FNxN+wqWS422qQT/hyksO/3qbL4iRSn+8E0HLonzcY52rG5UJ6vLD6
MUajpxIqK3x4cfSd7jBQowl5439fyn7xvUjLJydyvNaENpF+UyBfngpJLyN088lI
fMBaJnfqRBvIe3F2GRcgVvkpp5SX2QUTpdWk/D77IO/J8foXXByLkx6/rI6H5RGC
7s1I0oUTH2J3vUim5NQl+Z5L5sAcMztXvIieeRU/4HbEaPyKUTkR7b/0R5lcfx5p
tYj5r5wsJG1BY5vcV39/UAdGVMPqdPnQHywecqA9ECIdD4+Eu9YoEU3nKMI6+cy+
cJGNnkKFJDro3mi/4/kh3C2YyKbFueicklgHjzXOIW2TO/stivwtneMpcqEjgDmf
L/1NhrBg0MPi2sAPmIK4xEZKWg0OFqWGm+IjkFA1bCT22OLQAhe5kSZsshLEJkIA
6XaJ6MgAvr59kgGmJcHyG5NAuxGHUnszwTSL1xGYIDy8ZjRqzsc=
=7Rej
-----END PGP SIGNATURE-----

--JcvBIhDvR6w3jUPA--

