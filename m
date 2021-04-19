Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 976943638FA
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 03:05:57 +0200 (CEST)
Received: from localhost ([::1]:39438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYIMO-0001W2-Mb
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 21:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lYIJf-0000XJ-Uf; Sun, 18 Apr 2021 21:03:11 -0400
Received: from ozlabs.org ([203.11.71.1]:32859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lYIJb-0001lX-4A; Sun, 18 Apr 2021 21:03:05 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FNpTB1SkHz9vFP; Mon, 19 Apr 2021 11:02:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618794174;
 bh=6eiyBcmIajEzxUROuDAH9Wm2SBk+wYtW4i+6cvsKA2g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gjBCCby9ChkCqnW4pyog7nTQPiJk4VVhTK3id1zwoAzVy2Jb6eCLsvVYUKsTl/WDs
 /Ldys5tS8yGBL4Wd/I5h+q23lFgm7adJ7mJj69SNqxXM9ra9P/4W7rnj6TG5SGUwF7
 zvPAenIwRImcXJSN5WjwJYoNL0/ElgWVcOMr9Zsc=
Date: Mon, 19 Apr 2021 11:00:14 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 06/11] hw/pci-host/raven: Assert PCI I/O AddressSpace
 is based at 0x80000000
Message-ID: <YHzWHjCfy5Lnweo0@yekko.fritz.box>
References: <20210417103028.601124-1-f4bug@amsat.org>
 <20210417103028.601124-7-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FiQmdDVfRdXuaV5z"
Content-Disposition: inline
In-Reply-To: <20210417103028.601124-7-f4bug@amsat.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--FiQmdDVfRdXuaV5z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 17, 2021 at 12:30:23PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Commit 1ae1dc5ba24 ("raven: Set a correct PCI I/O memory region")
> abused an AddressSpace API weakness which allows set non-zero base
> address to AddressSpace root region. We will fix that in the next
> commit. First add an assertion to ensure no regression is introduced.
> As raven_io_address() is called by both MemoryRegionOps handlers, it
> is a good place for such assert call.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/pci-host/raven.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
> index 730f31a8931..36652122424 100644
> --- a/hw/pci-host/raven.c
> +++ b/hw/pci-host/raven.c
> @@ -141,6 +141,17 @@ static const MemoryRegionOps raven_intack_ops =3D {
>  static inline hwaddr raven_io_address(PREPPCIState *s,
>                                        hwaddr addr)
>  {
> +    /*
> +     * We shouldn't access AddressSpace internals. However this assert
> +     * is temporarily introduced to prove a subtle inconsistency from
> +     * commit 1ae1dc5ba24 ("raven: Set a correct PCI I/O memory region"):
> +     * AddressSpace root region must be zero-based, but the Raven use is=
 not.
> +     *
> +     * Assert the root region is based on physical address 0x80000000
> +     * until the issue is fixed.
> +     */
> +    assert(s->pci_io_as.root->addr =3D=3D PCI_IO_BASE_ADDR);
> +
>      if (s->contiguous_map =3D=3D 0) {
>          /* 64 KB contiguous space for IOs */
>          addr &=3D 0xFFFF;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--FiQmdDVfRdXuaV5z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB81h4ACgkQbDjKyiDZ
s5KLXw/+MSCgeMg1ZscaZ1jUs3WJ4RPrTnovi9HEIlQIYrV0tKWmp9d9rKX3VG8W
RJP/2DPeV7IUqVfflbJD4hx+QTJ0h8X4yrMCqXDgDs8VGSPqIGVAoYyXSigEApC/
d4BShVvr7PijhLuLHrB1MpJZzt6z80D4q+aSJEz4GbHeJsAln9EjObeBKFcQchs7
W0USaeNo7iarg8LA+ed5NFSOAkU/S5DzgtdLkG3MUSXbEO0kpBH69ahQm/P00xec
D773R9wMQaLI5c0gYitAiaNb8PTBvB7EBHyb+Tjor0+DRoj+L2LMJQ4naT34+l6r
4CeXJ+QQkG+c5Ik9d+JSPsB559ksGML4ZK6Q4r8yI4YH0bEcP/vPwJ8bofnC1JrC
lD+eNQZ8NC1R4yB+1mCh8IdvNn/FKyzf1APpLEwx17L1KAYxlu8kRwoJXpnH00gF
OqTwOB9bhZp3viU+BIIVBoknpCVaeUAO0qIksMx4TFZAf44X6MDvJmBDj0vWe0BY
7KG95mCT5dhvFqRZTaMHPTfveLLul0rwv2Nd6o8dtgrBDrQycR3oXRdrreYX1DwT
HgUVfQmOjjwLW0c2DOrWw5tt0dmSOWZRAcbQa62HfjEljKEpMVCPgRGQyAWuoNEa
d2KOy0sDLEy3l9e/UEqsKuNJgTCr4HPgV9Kd/f5lATj/8/pswDM=
=r3qB
-----END PGP SIGNATURE-----

--FiQmdDVfRdXuaV5z--

