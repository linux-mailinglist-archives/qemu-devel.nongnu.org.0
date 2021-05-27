Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BEC39248D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 03:50:14 +0200 (CEST)
Received: from localhost ([::1]:50330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm5A5-0008FS-Lh
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 21:50:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lm58P-0005xW-Un; Wed, 26 May 2021 21:48:30 -0400
Received: from ozlabs.org ([203.11.71.1]:45137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lm58M-0001jl-6h; Wed, 26 May 2021 21:48:29 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fr9gy5tFYz9sTD; Thu, 27 May 2021 11:48:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622080094;
 bh=A3DhMeSSG6cIIyFpKo4+a68mshyrvahSKGi7UX8cTbQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NojCji1TR4hUSWnQpO4ZdEEsNVs7EhoMf5uGBc1nV41QjGydFuQgMWLKC2tk85QEq
 0k+6h+gbBOqPPZGDz9cyAtQ/BZo65tjVeh1de90ijgiBqjLDfgSHq50cqQXDwHym9P
 QvLHhk9TVDkCKpnu2jWnCtEqH3CicgYmP2AzPxDE=
Date: Thu, 27 May 2021 11:09:26 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Subject: Re: [PATCH] spapr: nvdimm: Fix the persistent-memory root node name
 in device tree
Message-ID: <YK7xRlswfpLtkLES@yekko>
References: <162204278956.219.9061511386011411578.stgit@cc493db1e665>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MmlyuuNS79wky9Vo"
Content-Disposition: inline
In-Reply-To: <162204278956.219.9061511386011411578.stgit@cc493db1e665>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: aneesh.kumar@linux.ibm.com, nvdimm@lists.linux.dev, qemu-ppc@nongnu.org,
 groug@kaod.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--MmlyuuNS79wky9Vo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 26, 2021 at 11:27:15AM -0400, Shivaprasad G Bhat wrote:
> The FDT code is adding the pmem root node by name "persistent-memory"
> which should have been "ibm,persistent-memory".
>=20
> The linux fetches the device tree nodes by type and it has been working
> correctly as the type is correct. If someone searches by its intended
> name it would fail, so fix that.
>=20
> Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>

Applied to ppc-for-6.1, thanks.

> ---
>  hw/ppc/spapr_nvdimm.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
> index 252204e25f..d7a4a0a051 100644
> --- a/hw/ppc/spapr_nvdimm.c
> +++ b/hw/ppc/spapr_nvdimm.c
> @@ -163,11 +163,11 @@ int spapr_pmem_dt_populate(SpaprDrc *drc, SpaprMach=
ineState *spapr,
> =20
>  void spapr_dt_persistent_memory(SpaprMachineState *spapr, void *fdt)
>  {
> -    int offset =3D fdt_subnode_offset(fdt, 0, "persistent-memory");
> +    int offset =3D fdt_subnode_offset(fdt, 0, "ibm,persistent-memory");
>      GSList *iter, *nvdimms =3D nvdimm_get_device_list();
> =20
>      if (offset < 0) {
> -        offset =3D fdt_add_subnode(fdt, 0, "persistent-memory");
> +        offset =3D fdt_add_subnode(fdt, 0, "ibm,persistent-memory");
>          _FDT(offset);
>          _FDT((fdt_setprop_cell(fdt, offset, "#address-cells", 0x1)));
>          _FDT((fdt_setprop_cell(fdt, offset, "#size-cells", 0x0)));
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--MmlyuuNS79wky9Vo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCu8UQACgkQbDjKyiDZ
s5IG7A/+MkxGobqIMMaYVfju2UwdEfvsm++A/S10LRNAOtgpWYkOY8Es9XDXvxf1
+T3VA8gxva8gECKpAVc5+D0tXe4/mkUvk7F6aAIuMnak7YDO4TYXYjTn5RozYbfi
FdmqNNGwAhefM8CiI956TKby5RbMuepkaUTXYL67EYDJ3n3Sdmj7BqcunIO7WEVr
Cd9LCgU488pute8bsg9N3ieEHwSbYVh4OrWcQ7oTNzpwrMCgHTS0TY6gdmVZxVpO
z4/jVPMbaFteetV7PYoaVJfHfQ5OeWNtrwVIVdeEztcxSZyFXXmv66oQ7v+4ADpx
15wi61VZnij9kNuJcJmzi9uqbYKrWcm7v4ezn1Y/XX72Rch8U74ZIsjIaN5ailiP
syrEY/hhm+rnKd8B7Io4lWbPETxqTGc5tXtOuVFb9lyToimEIVDADvEMS5pQ1sAq
XXzU1wkSuzypi86fIGOAt9u1xxc91uJEjNs75M7Mj5PS8c7Rz/9+yDzuAh/HjBtn
n/coM4uLjELLBAZuJb51Jhe33NwYdeVHJFGuSHwL07F4HNYLXEvZ2DUHfapjlq+3
YtHkCVvC/4tj435CZov33Ol5pDJMBwKzA+kYEVleQSqtXYxQgBubBiqhkOEoVP6e
pqVZsj8bhYWtKUEKx/xW4+6cbWUDYlPVfZ8pOU20f9p8bqtDMjA=
=1fsy
-----END PGP SIGNATURE-----

--MmlyuuNS79wky9Vo--

