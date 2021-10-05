Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD677423541
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 02:47:51 +0200 (CEST)
Received: from localhost ([::1]:42278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXv66-0000nL-55
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 20:47:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mXv0v-0007yb-Nc; Tue, 05 Oct 2021 20:42:30 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:53441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mXv0p-0003j2-Vs; Tue, 05 Oct 2021 20:42:28 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HPFyr09dnz4xbC; Wed,  6 Oct 2021 11:42:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1633480932;
 bh=q7DFbNBwqchQFzE+LLoKcpg1ORgavd8QEKRnaj/qga4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l0Nxa2BEu56wDv3ddmt0CiW8RcHwp78DXE9Whm0dXBmDoLTHrZRKXhyolCODShs04
 rj3HWlHZn8cHVYKWqJ6RlpgnAWQ62y7J2ypI/hwPyEV4gYn+RAJbOwxEsJs+lDSZEy
 7tuF2rL6sf9K8piet8eI8BP2WrB29cDgZjbm8lto=
Date: Tue, 5 Oct 2021 19:46:32 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2] target/ppc: Fix the test raising the decrementer
 exception
Message-ID: <YVwQ6O/vVYdGkFnK@yekko>
References: <20211005053324.441132-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YdIbZBtMLAdBnFJi"
Content-Disposition: inline
In-Reply-To: <20211005053324.441132-1-clg@kaod.org>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--YdIbZBtMLAdBnFJi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 05, 2021 at 07:33:24AM +0200, C=E9dric Le Goater wrote:
> Commit 4d9b8ef9b5ab ("target/ppc: Fix 64-bit decrementer") introduced
> new int64t variables and broke the test triggering the decrementer
> exception. Revert partially the change to evaluate both clause of the
> if statement.
>=20
> Reported-by: Coverity CID 1464061
> Fixes: 4d9b8ef9b5ab ("target/ppc: Fix 64-bit decrementer")
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Applied to ppc-for-6.2 thanks.

> ---
>  hw/ppc/ppc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index f5d012f860af..a724b0bb5ecb 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -848,7 +848,7 @@ static void __cpu_ppc_store_decr(PowerPCCPU *cpu, uin=
t64_t *nextp,
>       * On MSB edge based DEC implementations the MSB going from 0 -> 1 t=
riggers
>       * an edge interrupt, so raise it here too.
>       */
> -    if ((signed_value < 3) ||
> +    if ((value < 3) ||
>          ((tb_env->flags & PPC_DECR_UNDERFLOW_LEVEL) && signed_value < 0)=
 ||
>          ((tb_env->flags & PPC_DECR_UNDERFLOW_TRIGGERED) && signed_value =
< 0
>            && signed_decr >=3D 0)) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--YdIbZBtMLAdBnFJi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFcEOUACgkQbDjKyiDZ
s5IVWxAAp4w/tPnQ931DEkZ1XZHlBgUqDLtefNwRj0ZGAl0VFhd0G+ZB0ieqFCLm
HcM6ZWQhkmaJl6M62vxtodrhRiOYs58Qif965sh/qfehGpG9YFe1wmf2Paa9HUIk
+glZGaM0bLbXVE+kX8s8Po0WC5EIPGn2K9x1axH4UQEtz9NERk/lUtSGiuy/kY3T
MXp80CDQZVrrdappe+dV8c+flH06bdNmYawvgRMV4x9R4mGE+202fCaeLOqa4TfI
9wWA6HOOdgbaKYn2LeLtbUO9Fdt7F/MueYoP/YtDh0/f2G0EMih/bOcZK1RLMA7w
1/C3nZ1RX3ArsJE3IfwZvWICEDQOmdb04Qz2VvSNtc4nEGE3jmQjiEQ0K1yumefO
NybphmxS5BZCpkVlu6HMLVbPn9uCp2+VW473XCXn8L5HMac7Ud01LeTBchjekm2f
O51dCmaoU1xdK5ILisn0Ww5DMhJ3ao4OFGXQDWUvPW2btZdY1eFDioNduoa2zwNP
qPvJRj7uhnYTvFV4MdSrxh/jkGkCTLEpOA1et0VuqKd7GmfNG3vT/D/qkFw+JfNF
rh9nebH47scgUOnKXAlDyCE9wbcjJ6fwa8SVk11OrUb21K/NJjxykdsP4pZvePuO
Me5OBOk+khAOTtmAI+WUALo4E3Lol0xUtJtHrSdOBPekE0QBlf0=
=+/Z9
-----END PGP SIGNATURE-----

--YdIbZBtMLAdBnFJi--

