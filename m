Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A80903FE80A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 05:33:41 +0200 (CEST)
Received: from localhost ([::1]:56080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLdTw-0000cK-PL
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 23:33:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mLdLV-0001Vw-Fc; Wed, 01 Sep 2021 23:24:57 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:45465 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mLdLJ-0008N7-HM; Wed, 01 Sep 2021 23:24:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630553072;
 bh=aP968+tJ6957u5BHY0OhzWZdvia4RdEmOg0sdGYrXCc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jYzus3Nn+ef4MRgNBjm5aGpnTFVNU1cpAm/AOS9WqHDFpkgxB0N1wzW7a4dkE9bl2
 ShTm2Nn39Z8R+WimYWloAw8g248plwJ71/GLNrpA+Y2ydUR9mwXpQnHNfLPg4qfxT4
 jKGqdZqaikGKxoIubEZmwcTo7mcHxvesmMT3e2Jo=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H0R9r0QxJz9t0J; Thu,  2 Sep 2021 13:24:31 +1000 (AEST)
Date: Thu, 2 Sep 2021 11:34:01 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 2/8] ppc/spapr: Add a POWER10 DD2 CPU
Message-ID: <YTAqCY8s3TlmQdZP@yekko>
References: <20210901094153.227671-1-clg@kaod.org>
 <20210901094153.227671-3-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HMGvEBcLSfwCIeeK"
Content-Disposition: inline
In-Reply-To: <20210901094153.227671-3-clg@kaod.org>
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--HMGvEBcLSfwCIeeK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 01, 2021 at 11:41:47AM +0200, C=E9dric Le Goater wrote:
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Applied to ppc-for-6.2, thanks.

> ---
>  hw/ppc/spapr_cpu_core.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> index 4f316a6f9d31..58e7341cb784 100644
> --- a/hw/ppc/spapr_cpu_core.c
> +++ b/hw/ppc/spapr_cpu_core.c
> @@ -382,6 +382,7 @@ static const TypeInfo spapr_cpu_core_type_infos[] =3D=
 {
>      DEFINE_SPAPR_CPU_CORE_TYPE("power9_v1.0"),
>      DEFINE_SPAPR_CPU_CORE_TYPE("power9_v2.0"),
>      DEFINE_SPAPR_CPU_CORE_TYPE("power10_v1.0"),
> +    DEFINE_SPAPR_CPU_CORE_TYPE("power10_v2.0"),
>  #ifdef CONFIG_KVM
>      DEFINE_SPAPR_CPU_CORE_TYPE("host"),
>  #endif

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--HMGvEBcLSfwCIeeK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEwKgkACgkQbDjKyiDZ
s5LLyBAAyJggwwxxDay/4zGQ4s6xgnWLhO+Dw1wxirdWJCZdRCB1/ngzYyu3U4mi
jKIfllacMHpMS5sBxe6BU+XZ+FvyyLiAnnPHTMLwRq45BwuP8KjVPUWoc6L19sLv
YR7bYceylICxh2SaAFkKGcZ5DBspwPB95/ctda3ao+1IMg/oR/ergso7Y3Ulc987
6GTRADJAr5b3GE6ljQ1urSfVOV+eWfNehWKz8RZRCjCysYE3yMI4plWYDLCcKBmO
ofyfzVuTYPjjstTWDCqSvlTVMLDxJXO2mpZTCaIhFcqamFZM0RGIEXBhiJ4O1UtZ
YiriNTf88D+L/iHIG/MP4J9RSfPeoEd0BYK11cuK9EDLO+TZhdPSIlebWFsdPKRk
FEaihc/qLybK48qbiQ7/EHHEPjAOlDFEhbCImnUwIRU9XX4th+lujZ2nXWkFtIZz
hKMTHWlBRALCM3ZmqIx9VWF5LcExLhlvmLzkBgO7vA9cDTVKus5LGzT6BnmV49i9
B6yr5IUDH++IvtyjF8eeuQ379LDRQ7lhjN8Pb50nax2S61ik8Tr5PB6WgWuiW/8H
GkVXPvhhmle9ihgRgd1cN9Jl4x3AKhb0cjnFHPenYBBemnCgAXwbydN3iWRu4yaM
HUpuICkgfUMIqR6LunmGZ30H4/U5m5ibBr2yXkllcwkU5bQkwxY=
=H01S
-----END PGP SIGNATURE-----

--HMGvEBcLSfwCIeeK--

