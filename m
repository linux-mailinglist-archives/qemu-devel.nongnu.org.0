Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A583482715
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Jan 2022 09:36:32 +0100 (CET)
Received: from localhost ([::1]:54452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3ZsL-0003BY-UV
	for lists+qemu-devel@lfdr.de; Sat, 01 Jan 2022 03:36:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n3Zoh-0001ft-J8; Sat, 01 Jan 2022 03:32:43 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:59955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n3Zof-0006JR-Mx; Sat, 01 Jan 2022 03:32:43 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JQwHS5rKsz4xXW; Sat,  1 Jan 2022 19:32:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1641025956;
 bh=Yz51vDaNm0BSi8nwK4MPy9FIEsh9PVgL+VAO1kGTxx0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VrdnFC/g1oSuPKn3HOuWsi4nOCSVyF+oGZbAYyZ1nK96q4U4RMiEr8YbBsan/K404
 WO9y0IIR2k3gfUs7LPCKexngVhxbrCL6usnUWCJI98+Ui+34bX9CkiVGIrRLR0RLvB
 jLOuYBTB7tkM1Pgb1ke2XTDvh3R2g5kg7LWEiGK8=
Date: Sat, 1 Jan 2022 19:31:56 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH v2 3/5] target/ppc: powerpc_excp: Set vector earlier
Message-ID: <YdARfHm0SB7gn8UC@yekko>
References: <20211229165751.3774248-1-farosas@linux.ibm.com>
 <20211229165751.3774248-4-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ap2/PF8qkf/rlKXe"
Content-Disposition: inline
In-Reply-To: <20211229165751.3774248-4-farosas@linux.ibm.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ap2/PF8qkf/rlKXe
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 29, 2021 at 01:57:49PM -0300, Fabiano Rosas wrote:
> None of the interrupt setup code touches 'vector', so we can move it
> earlier in the function. This will allow us to later move the System
> Call Vectored setup that is on the top level into the
> POWERPC_EXCP_SYSCALL_VECTORED code block.
>=20
> This patch also moves the verification for when 'excp' does not have
> an address associated with it. We now bail a little earlier when that
> is the case. This should not cause any visible effects.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> Reviewed-by: C=E9dric Le Goater <clg@kaod.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/excp_helper.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 9a03e4b896..1fe20b4806 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -356,6 +356,14 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int=
 excp_model, int excp)
>      }
>  #endif
> =20
> +    vector =3D env->excp_vectors[excp];
> +    if (vector =3D=3D (target_ulong)-1ULL) {
> +        cpu_abort(cs, "Raised an exception without defined vector %d\n",
> +                  excp);
> +    }
> +
> +    vector |=3D env->excp_prefix;
> +
>      switch (excp) {
>      case POWERPC_EXCP_CRITICAL:    /* Critical input                    =
     */
>          switch (excp_model) {
> @@ -832,14 +840,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int=
 excp_model, int excp)
>      }
>  #endif
> =20
> -    vector =3D env->excp_vectors[excp];
> -    if (vector =3D=3D (target_ulong)-1ULL) {
> -        cpu_abort(cs, "Raised an exception without defined vector %d\n",
> -                  excp);
> -    }
> -
> -    vector |=3D env->excp_prefix;
> -
>  #if defined(TARGET_PPC64)
>      if (excp_model =3D=3D POWERPC_EXCP_BOOKE) {
>          if (env->spr[SPR_BOOKE_EPCR] & EPCR_ICM) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ap2/PF8qkf/rlKXe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHQEXsACgkQbDjKyiDZ
s5Ifng//QiYogbeQI1roFrUU9DiPci5BOgEnyGuJGneA5EWd8WCI1oZ2+P0upuAm
kEFTFkfOj0ifAzYEhg8Tj9HL/HYmQshf/e6OXQ+yjR1dnsBQR7MW8hz/fIbHm4Ef
JXCHKmQ6b/EHoWQSi8EIfYPGt5iBeBBEWntSDpqEAKqTPx1QAmSL7jar7lng9W4U
JovOyuFcwi0r2oIuwqPwgXf+r3HWrXhrhmErD4pqqlk2KpPTA1cL4qTkcrACjYus
TFlalo8w297UqEOPIvuehmBc1LzhviQ/Zn9ypFC4SUqjqm83PYmSjfV0VK6fY7WB
KcgQaK6NJBBlLy1tZRZ7uVFt3aeb92his47DDK4ZeVReSoJuaYqFijePbeGFYueA
lxtihnPgJzZ5GAFwZ2RZ2OH/3+10+Vt7VYu2GNAdy5EVDQFQn+mSav7cILNFoxBE
fPplNcIjUSUNmyH7h7jVrVYTQgf6RZVz/Jti7tbzJa752KMqZxBeoi65+9nx5dwH
v34M0kutz599720oUP+YpzW5vuzrHbmVyj3gzx6VXHea8arZDn5sOSYLPVDxBrPL
8VCIzWfipqOQ1jSO63lFfUcgE3okti6Pz6HTLmYAksnq9WMBS6Io903UQHepqNBx
HDPKz5J51y30UMA37+cHqaf2RBcmiVTVOWs9+Nr3PSXNT6900lQ=
=w13t
-----END PGP SIGNATURE-----

--ap2/PF8qkf/rlKXe--

