Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1ED8BBF5
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Aug 2019 16:48:34 +0200 (CEST)
Received: from localhost ([::1]:53030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxY6E-0000b2-5K
	for lists+qemu-devel@lfdr.de; Tue, 13 Aug 2019 10:48:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42585)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hxY5X-0007v0-Ua
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 10:47:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hxY5W-00071k-Q8
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 10:47:51 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:41581 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hxY5V-0006zP-Km; Tue, 13 Aug 2019 10:47:50 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 467Ftl62Y1z9sNf; Wed, 14 Aug 2019 00:47:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1565707663;
 bh=qj9v8BqTYNBavk3ErJeF1QoUPZhuxCr+XREnLWJLOCY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e3KTaBXU6FbREHNfDsYAvy34M2YrySW9pg3+e7k5T0UtDtSm+QeFoX9dOj3uO1qcW
 j9XYx7erKeRVvgepVmljjFuzOEw51/Rwb2IDT6+CY3bjXRbWJPrjLsc9/BBiKLQ3Pm
 4wu517GV4tTiVgDvaULm7LN050nqgt0ZiFoxk1Qg=
Date: Wed, 14 Aug 2019 00:17:55 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
Message-ID: <20190813141755.GN3947@umbus.fritz.box>
References: <20190719024555.18845-1-aik@ozlabs.ru>
 <ae3e5bd1-c7dd-d893-5c0e-803f4e4f2325@linux.vnet.ibm.com>
 <20190812100849.GF3947@umbus.fritz.box>
 <3722a768-c8bb-ed04-e450-b18cba8e6296@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="prC3/KjdfqNV7evK"
Content-Disposition: inline
In-Reply-To: <3722a768-c8bb-ed04-e450-b18cba8e6296@linux.vnet.ibm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-devel] [Qemu-ppc] [GIT PULL for qemu-pseries REPOST]
 pseries: Update SLOF firmware image
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


--prC3/KjdfqNV7evK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2019 at 01:00:24PM +0530, Aravinda Prasad wrote:
>=20
>=20
> On Monday 12 August 2019 03:38 PM, David Gibson wrote:
> > On Mon, Aug 05, 2019 at 02:14:39PM +0530, Aravinda Prasad wrote:
> >> Alexey/David,
> >>
> >> With the SLOF changes, QEMU cannot resize the RTAS blob. Resizing is
> >> required for FWNMI support which extends the RTAS blob to include an
> >> error log upon a machine check.
> >>
> >> The check to valid RTAS buffer fails in the guest because the rtas-size
> >> updated in QEMU is not reflecting in the guest.
> >>
> >> Any workaround for this?
> >=20
> > Well, we should still be able to do it, it just means fwnmi would need
> > a SLOF change.  It's an inconvenience, but not really a big deal.
>=20
> Yes. Alexey and I were discussing about the following changes to SLOf:
>=20
> diff --git a/lib/libhvcall/hvcall.S b/lib/libhvcall/hvcall.S
> index b19f6dbeff2c..880d29a29122 100644
> --- a/lib/libhvcall/hvcall.S
> +++ b/lib/libhvcall/hvcall.S
> @@ -134,6 +134,7 @@ ENTRY(hv_rtas)
>         ori     r3,r3,KVMPPC_H_RTAS@l
>         HVCALL
>         blr
> +    .space 2048
>         .globl hv_rtas_size
>  hv_rtas_size:
>         .long . - hv_rtas;
>=20
>=20
> But this will statically reserve space for RTAS even when
> SPAPR_CAP_FWNMI_MCE is OFF.

Sure.  We could flag that in the DT somehow, and have SLOF reserve the
space conditionally.

Or we could just ignore it. 2 kiB is miniscule compared to our minimum
guest size, and our current RTAS is microscopic compared to PowerVM.


--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--prC3/KjdfqNV7evK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl1SxpMACgkQbDjKyiDZ
s5KZQRAAjpKlTdgqpn6EAewEIG4mdnQ7ggBYnIlb4JsMVKq58sto0ziHTLfqCxpi
oOKKBo4IrVkZi4EYJ+3cnE0nr7Q1sGIcJIqaEUFSfaytMFVzY2oDCArHb0o/R+RB
slOQQoQtwdZTcf122J07Te5tMzHJaPvfWfG/Vk1YiTzkwi/FD2ZpH/jAvG3Li2k2
ijOb+PKPOTU37vpeC7QxNOlcQ+ORl5PgalZpxk8cnx8sxhMh5gteOuG6xETXml52
StWoLcMKh1HVk+MKTPgT4CJSgfjL0s9zbexjt7ppLXsStdeYuIUIho5PIwVfMcNv
fIycK5s9eLNy923r1h26xqWKSp75hgMG1+OnmAOcJsbw/E0EJ3bW+AUyNeZWBjYD
xKDY7LMwTo+jnwv6nzaBhj1Lp1krbiy+jjjDKmZGUZL7Cih7Qypoa16HBp/0HU3X
44vtaTzo8GQosOsZ8D7TZ9Ywv3es/kOUKRn9WB7yFekzjxm2UyxxrehWK1jdTgr8
T9aZyeIk9WqwzFEFu3DRGKORX58YndIatim19EL3MkahKZ1+K+8KngMsiOn4bL7Z
Gp/cH36IxjEbgnNk0r0+f33CDv8evRTK/0pGi8X26SfeuxEyLI1qRvFlmJa+LRhj
hwSaZ9urxvBUX8HprAJgilLPNrkRBrQ6yTsAteF4qDkptrQ54Zk=
=qdPN
-----END PGP SIGNATURE-----

--prC3/KjdfqNV7evK--

