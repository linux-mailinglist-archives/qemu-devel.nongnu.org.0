Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9552D51EB
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 04:48:31 +0100 (CET)
Received: from localhost ([::1]:52610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knCwQ-0004Mv-Qe
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 22:48:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knCmB-0006ot-Uk; Wed, 09 Dec 2020 22:37:55 -0500
Received: from ozlabs.org ([203.11.71.1]:33155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knCm8-0003UM-6l; Wed, 09 Dec 2020 22:37:55 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cs03n65nhz9sWW; Thu, 10 Dec 2020 14:37:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607571461;
 bh=3F7ZhRZappIFDoAxukwDchcl7lF9/SurbTPCk2nceXk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WKauYGoP9mCRwT9lQrcBSRJ6YFFhxQ08T0pLsiRcn/e+PgqymYkQnsG2yF9cS3k2g
 y46CtBGSABzsvL5Jw1GoayD132ktTCh6S7WKV47LrDyDocw7DgqS+J9GneDK+JZzbM
 v74UlY9+PC8+bJF/qj0OANuVlD+tnwIAECK6PHx8=
Date: Thu, 10 Dec 2020 14:30:13 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 4/6] spapr: Don't use qdev_get_machine() in
 spapr_msi_write()
Message-ID: <20201210033013.GI2555@yekko.fritz.box>
References: <20201209170052.1431440-1-groug@kaod.org>
 <20201209170052.1431440-5-groug@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xGGVyNQdqA79rdfn"
Content-Disposition: inline
In-Reply-To: <20201209170052.1431440-5-groug@kaod.org>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--xGGVyNQdqA79rdfn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 09, 2020 at 06:00:50PM +0100, Greg Kurz wrote:
> spapr_phb_realize() passes the sPAPR machine state as opaque data
> for the I/O callbacks:
>=20
> memory_region_init_io(&sphb->msiwindow, OBJECT(sphb), &spapr_msi_ops, spa=
pr,
>                                                                       ^^^=
^^
>                       "msi", msi_window_size);
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied to ppc-for-6.0.

> ---
>  hw/ppc/spapr_pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 149bf4c21d22..890a0cc1d6af 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -747,7 +747,7 @@ static PCIINTxRoute spapr_route_intx_pin_to_irq(void =
*opaque, int pin)
>  static void spapr_msi_write(void *opaque, hwaddr addr,
>                              uint64_t data, unsigned size)
>  {
> -    SpaprMachineState *spapr =3D SPAPR_MACHINE(qdev_get_machine());
> +    SpaprMachineState *spapr =3D opaque;
>      uint32_t irq =3D data;
> =20
>      trace_spapr_pci_msi_write(addr, data, irq);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--xGGVyNQdqA79rdfn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/RlkUACgkQbDjKyiDZ
s5J+ZRAAuQ5hTTGIycPmL0+R45LETl/r0R9oivPQ1d23pgjQ3DOUMJD69h2T42lX
HYoz4t2NJrClTBNI6gRTFVfAkSlKAkHcGXKWcE1f4ePNwzX6JrKq2mCtawTFgaDR
YrHbiLn5MOcsHIRE69g7aI/h6dshSaD6whUV4G9AKZaJID2R8x9La2H4Z2EykbsF
7+8OCZoYDbDivzVw6yHI+4jNKr8ohbmbVAgtLJIqZBj7IUZXpoSVVHoULA25MAqF
FQj1rT2Va8SWb6KLsZPTQoHJP3FsOSVoh5kv1B0JY2VLAuy9IVeDkPDXqdVZrO0s
80tdB6n60s8v3fnYjhAsQhkie08UFCxIeW17uqjOrRn9l3gYt1VSdMdMW09oNNfq
8EGLjNIRk4763BklmpChnHrnBpTzNpdBv6OH2pMshQFhu/b2YEiEjWeOSIkxAtzx
pKsNopcQGEvyFhOR86eVsm1364AqSOHLEYtdJjOQTxLK7gicbOBqfzZrZ+Mi0ii5
tym9N3gp6s7zE2lYw95hDbHnWfo9rCmzKOoAn28IFFpulZ5R6pqssG54+gPhY+ef
Afth2GnwU1k2rCyUkb9M+eo/3mo0Fwu8wtEx6CtTezbxkqSgxXEj7DFDRfV02KsU
ZvfnzH7GbQY/Ura5LxHbtUXNgFMiHxw9LNfRLYKWEy8z9nM/5is=
=Lcbx
-----END PGP SIGNATURE-----

--xGGVyNQdqA79rdfn--

