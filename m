Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCC73B2800
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 08:54:09 +0200 (CEST)
Received: from localhost ([::1]:45354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwJFY-00066k-Kg
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 02:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lwJAK-0002vT-6U; Thu, 24 Jun 2021 02:48:44 -0400
Received: from ozlabs.org ([203.11.71.1]:37415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lwJAH-0000UC-LK; Thu, 24 Jun 2021 02:48:43 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G9W1V42fKz9sXk; Thu, 24 Jun 2021 16:48:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1624517310;
 bh=J343yfOeduOtllxc7ecNVB581F/KUXS4NxjecfBdY+Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KXwrwGyPRjUJtfUcvvbzr0YXzRrLJ49/sMxcaptJ+TzDauhIYBHbM15oV+8sArKMf
 OogL9Ia+rjhIwYUz2ziKGARYaq37DgGKxVQjV2rJwNF2wSaGsEPRc3Xq12x01Ne167
 opXL9T5w91UQFoHto5HSPWNVIO9vA3+SDM6jc/f0=
Date: Thu, 24 Jun 2021 16:35:16 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v2 09/10] target/ppc: Restrict ppc_cpu_tlb_fill to TCG
Message-ID: <YNQnpA/vSK41TD3G@yekko>
References: <20210621125115.67717-1-bruno.larsen@eldorado.org.br>
 <20210621125115.67717-10-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PAdnb9sHM6r1E4vz"
Content-Disposition: inline
In-Reply-To: <20210621125115.67717-10-bruno.larsen@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: farosas@linux.ibm.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, clg@kaod.org, matheus.ferst@eldorado.org.br,
 luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--PAdnb9sHM6r1E4vz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 21, 2021 at 09:51:14AM -0300, Bruno Larsen (billionai) wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
>=20
> This function is used by TCGCPUOps, and is thus TCG specific.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/mmu_helper.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index a0e4e027d3..ba1952c77d 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -2948,6 +2948,7 @@ hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, va=
ddr addr)
>      return -1;
>  }
> =20
> +#ifdef CONFIG_TCG
>  bool ppc_cpu_tlb_fill(CPUState *cs, vaddr eaddr, int size,
>                        MMUAccessType access_type, int mmu_idx,
>                        bool probe, uintptr_t retaddr)
> @@ -2968,3 +2969,4 @@ bool ppc_cpu_tlb_fill(CPUState *cs, vaddr eaddr, in=
t size,
>      raise_exception_err_ra(&cpu->env, cs->exception_index,
>                             cpu->env.error_code, retaddr);
>  }
> +#endif

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PAdnb9sHM6r1E4vz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDUJ6QACgkQbDjKyiDZ
s5L6oBAApK8zGJmx+VNVn8WFF86ot/AglkOZozSM6IDAAeppDxOxafPbaWZKkU2W
Al8lGAutIId0gqD5k4ez6WZaEgp+qcu/N6hpoWd8v3n2MPBRg3rXOKMRsvAME1Bt
yBamZOOtCIx7mlONsuvh5ZMmqH+Q3Gq6ROwOiR+uETZxdR/r+W3fcPKEXDF5z6nG
RA+vsofH741zxjuqxyuN+GZXp/TJL0LH+XtJg7lDD2YLCL1nT/2MGHLouNJbp8ua
+i8NW7Kf2XHFiu+nWoyvl/R8ov36/JX28zk9kj72XdPCwtUGVpHwUomDP6nmIF6v
5GJ8qikXk1WKaRCt53jew/WKPH26VpKIsYQ926bzvdlspnsW1qIBZTra/TbULpH5
qyKwTZE1oqmKAojqILjTh+PthdmkqV6xnf5ILR+yCNlgU+Oh3O8hNtBMeKPV7zNM
knKxvK/ZkMI4jaY/jWlzVJILGlmMSYJrnYd7W1fMIzomS6Ty4q5XR2RVubXzTfYO
jkgdGS1VBFHF9sK3tPdJ/S3qDqK4H86ABMqQ+jQXyWAv1KmYQGyxxEgptr4eBiLj
bV7UfEDGhhG6jCiTidohOrlZwhlgTZegd47C5b/5eHpOtdz9+co13mm9tVv2MHrq
9EACDIk6I/VhsoHBeXIwnCTWCF5TWHbkNIenVYoBlW+5dQOAMVw=
=ndfW
-----END PGP SIGNATURE-----

--PAdnb9sHM6r1E4vz--

