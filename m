Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C9D37F229
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 06:26:45 +0200 (CEST)
Received: from localhost ([::1]:45522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh2vs-0007JH-2o
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 00:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sQ-0007A1-DF; Thu, 13 May 2021 00:23:10 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:41027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sK-0004Na-8A; Thu, 13 May 2021 00:23:07 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fgdms23Jhz9sjD; Thu, 13 May 2021 14:22:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620879773;
 bh=U2guEcGYv9evQ38Sg/AZ8JqzaVgMJ/4uRFvCpj6XUm4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M2GBAIC++jq162B4TFr1K4OqrEyheRMFCxXZRKt3BE1vbsoS4KsQYCzXBindnN7Zb
 IFH/SUZRfxY06N8pPSPg0WZpne1ucQrplGZfTLHaAWvuXob067LvMZiW6OUYdaA1En
 L4okyHwTfN6kPRosWEqEmBNSLH55rvKXgBKB7IfA=
Date: Thu, 13 May 2021 13:46:32 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 3/5] hw/ppc: Have pSeries depends on libfdt (via host
 Kconfig FDT symbol)
Message-ID: <YJyhGJFH4C53BCFq@yekko>
References: <20210511155354.3069141-1-philmd@redhat.com>
 <20210511155354.3069141-4-philmd@redhat.com>
 <YJs9BH+j1FAMIOjP@yekko>
 <83800531-8c99-0dca-d324-484dd6c57df6@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QteM4l+5PMXZadYY"
Content-Disposition: inline
In-Reply-To: <83800531-8c99-0dca-d324-484dd6c57df6@redhat.com>
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
Cc: Thomas Huth <thuth@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--QteM4l+5PMXZadYY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 10:01:20AM +0200, Paolo Bonzini wrote:
> On 12/05/21 04:27, David Gibson wrote:
> > On Tue, May 11, 2021 at 05:53:52PM +0200, Philippe Mathieu-Daud=E9 wrot=
e:
> > > Since commit fea35ca4b8e ("ppc/spapr: Receive and store device
> > > tree blob from SLOF") the pSeries machine depends on the libfdt
> > > fdt_check_full() call, which is available in libfdt v1.4.7.
> > >=20
> > > Add the corresponding Kconfig dependency.
> > >=20
> > > Signed-off-by: Philippe Mathieu-Daud=E9<philmd@redhat.com>
> > I don't love making this conditional.  Pseries is by far the best
> > tested and most widely used ppc machine type, so it seems like it
> > would break expectations to not compile this in rather than giving an
> > error saying you need a newer libfdt.
>=20
> It's not conditional; if libfdt is not found, scripts/minikconf.py will t=
ell
> you about the contradiction between CONFIG_PSERIES=3Dy and "CONFIG_PSERIES
> depends on FDT".
>=20
> So we still have the same "fdt_required" logic that is already in
> meson.build, but expressed as Kconfig rules instead of a random line in
> default-configs/targets.

Oh, ok.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--QteM4l+5PMXZadYY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCcoRgACgkQbDjKyiDZ
s5K1eg//dlHqxewQw583fNVpjb6Q+FIBDrLq/dVJ83cARbsBfAog+v+iF9MLA+t8
b6AN0rgsh0bV3ptHal5yz9UEko4qbVbjmW/mMEm90Xi8Fmidxs4Mq9ku9oYuqTik
OlCUcSY3rfs0vKysnWSc19wNtWlPAO9FBDI3j/gY9MKoeVUa8uLt2crsnk+408YC
eUgpVruMKoMnSaFvZ82lWxZIq+M4F2VqDXkkaaRupezn2zUpeYa2AgetO96utPNn
svWGPRYnw12X4DWbkT1YMtSMr+4VHCyUicncHS/TBk1cyoXRCvtMwtjO7G4ObrgN
W2ILaHnogAlwgEOvGgwAWEBSS6TkwrBD4jFbYwZtoB3lJ+0h9e1JZZSbvCgXIL37
uNptHUN+ruWWXIfXTJ4BE6dDvcoCVwKKjbwCiOK572wbAi+U3uqqLp3wRgX5LChD
g+axp+noRbfpB0EvNJV5lDtC/dS5/Q1UC1Dy6GaEnf2n99hXv19loourbmkQT4CH
xx9Wf3KOvNt5CyF3h8SXt+27uK9gJEILzlzJQ3m7zKVGMp/avRZ7jwTHwMHn1Ok1
tniNAXqWHu97By4nOrveMl/Q++JoLrg3Ssy/h8yDVc3bkF/0/3REmB8kJE8UFZUH
39nKE9ppupVHvOcR/noUonCdacasvfytIT7QjAwRC2ClatlEI3A=
=KK+C
-----END PGP SIGNATURE-----

--QteM4l+5PMXZadYY--

