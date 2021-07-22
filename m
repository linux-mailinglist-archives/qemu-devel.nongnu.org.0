Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C14BC3D1BDB
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 04:44:06 +0200 (CEST)
Received: from localhost ([::1]:57740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Ogv-0007v9-9M
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 22:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m6OdC-0006wx-W9; Wed, 21 Jul 2021 22:40:15 -0400
Received: from ozlabs.org ([203.11.71.1]:36185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m6Od9-0007Ya-S3; Wed, 21 Jul 2021 22:40:14 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GVc9p4tvMz9sS8; Thu, 22 Jul 2021 12:39:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626921598;
 bh=Kcl3lgA7y0rfOq8GrxpOD1ElMXOxih14906z/L07Hsc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZTPWbDZFWfwHF2r5iaW8zgD/5FaX0wFAk53NpZaVsEYpfT9M3kTRCFbCydyXbdo7b
 Ow0KJxOCSom4jXIf1ssOLWL69ipGjTcx4jk3oQ6nUrXk0HjH0pIW9B1i1fkd1wpKLF
 snMo/kPpEhE1Z/UqcVtWUE2yKeNP2W8vCobqAiiY=
Date: Thu, 22 Jul 2021 12:39:51 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [RFC PATCH v3 0/5] pSeries FORM2 affinity support
Message-ID: <YPjad3FXVRIU8Cbv@yekko>
References: <20210713194045.916263-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ps8Gmj2Pwa8ewSPc"
Content-Disposition: inline
In-Reply-To: <20210713194045.916263-1-danielhb413@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: aneesh.kumar@linux.ibm.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ps8Gmj2Pwa8ewSPc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 13, 2021 at 04:40:40PM -0300, Daniel Henrique Barboza wrote:
> Hi,
>=20
> This new version drops all the NVDIMM related changes from the
> previous iteraction after the reviews done in the kernel mailing
> list [1]. FORM2 will not use ibm,associativity-reference-points to
> determine a second NUMA mode for different operation modes of
> PAPR-SCM.
>=20
> [1]
> https://lore.kernel.org/linuxppc-dev/20210628151117.545935-1-aneesh.kumar=
@linux.ibm.com/

Sorry, I'm going to punt on reviewing this again, until the kernel
side patches are sorted out.

>=20
>=20
> changes from v2:
> - patch 3:
>   * reworded commit msg and comments to reflect the current state of
> the specification
> - patches 5 and 6: removed
> - v2 link: https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg04056=
=2Ehtml=20
>=20
>=20
> changes from v1:
> - patches 1 and 2: switched places
> - patch 3: folded into patch 2
> - patch 2:
>     * only make CAS related changes when using the newest
>     machine version
> - patch 3 (former 4):
>     * only advertise FORM2 support for the newest machine version
> - patches 5 and 6 (former 6 and 7):
>     * detect if 'device-node' was set in the command line, and if not,
>     use the 'node' value when writing in the device tree
>=20
> v1 link: https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg03617.h=
tml
>=20
>=20
> Daniel Henrique Barboza (5):
>   spapr_numa.c: split FORM1 code into helpers
>   spapr: move NUMA data init to post-CAS
>   spapr_numa.c: base FORM2 NUMA affinity support
>   spapr: simplify spapr_numa_associativity_init params
>   spapr: move memory/cpu less check to spapr_numa_FORM1_affinity_init()
>=20
>  hw/ppc/spapr.c              |  60 ++++------
>  hw/ppc/spapr_hcall.c        |   4 +
>  hw/ppc/spapr_numa.c         | 224 +++++++++++++++++++++++++++++++++---
>  include/hw/ppc/spapr.h      |   1 +
>  include/hw/ppc/spapr_numa.h |   3 +-
>  include/hw/ppc/spapr_ovec.h |   1 +
>  6 files changed, 236 insertions(+), 57 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ps8Gmj2Pwa8ewSPc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD42ncACgkQbDjKyiDZ
s5JQTQ/7BjUm5KQftHp9asdBE1TGM8Qowml3wYz+8ciFyqk1OawHEz6ZbZi7veaS
LdA+MUbBnNOk/9MX+ZUFeOh3v5+TzhZvyqba9ssgxQ6P0QjeZBEKi24WO3E1mrNV
b/DhE+EmnAf4QrDCYKULjGS/0BLFALbfB64gRpBghKgTNskpI8ei9n9m+5HfkqXd
Q/LiOaDuByVydZRzUupWKlJHcnzaG6OokFG9kDdTpfOcY5MxDHeN31N6LlZ1GoRS
3JfbgQojO/x9b0U+OnyvJTkdxvNlqw8uVjjIaGOBlporvPr4frDE5civHiq5fsoi
Q5dYNNBF0TXp0Z0X252JSzG16SDNyeKgSuG4gCrk6ZfkGchFWbPmDouNM7P1CXa1
7EEbMyuadxDJw9hzXzlMpRIMHMIW2RvdDx/rwMt3Fc4z6kxFg25OKE48edYhXCLO
dqNY2CZs6hrG3srgLIlXWxkXbT4oK0iCc4FVmoM/Z74s2F/FDjsWfHBM0/Bhz2B/
TIdKAK7L+P7jjZBVl8nZm+8Kf/hLBe5qVS5FSbgdX1yyPPVGogq9ubJAh+/PaQLr
EJ5hAOX8u5iUZDg3z5PTtbdWGyuhcfT6b/ukdZQBLAlSBBui+BYINRJg4icR6ni2
JEeAHq/Za1a6olsbdjGgTdKtXQF+NTo+yriFH+O3FVZO/MLSBbI=
=WDlk
-----END PGP SIGNATURE-----

--ps8Gmj2Pwa8ewSPc--

