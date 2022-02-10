Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D48624B0477
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 05:28:36 +0100 (CET)
Received: from localhost ([::1]:57360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI14N-0006qT-Pi
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 23:28:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nI0yb-0003Ig-P0; Wed, 09 Feb 2022 23:22:39 -0500
Received: from [2404:9400:2221:ea00::3] (port=44405 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nI0yU-0000kv-9q; Wed, 09 Feb 2022 23:22:36 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JvNrF1kclz4xdh; Thu, 10 Feb 2022 15:22:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644466941;
 bh=/Kidu7/5A8ZWbVhcwRLR/DpraGUGI4QpbPEidvwKChM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DixM9s7KoSvkrMDFmxAd8UYWCH+XSUQuWh9q+oFsu0m+NjkL4xX0NyihxNy0vwuhq
 HBr/PHNk+oma1ay+i2rksJq/L1INXaYCsAVkaAcunumHOxU7O7oevRDQeHO5JsTYLj
 3JKuY49PW1JwpKsSnYrYs3iCKbfz7gTOB5tI1Slc=
Date: Thu, 10 Feb 2022 13:20:34 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v10 1/3] target/ppc: fix indent of function parameters
Message-ID: <YgR2cteNWWce2BOJ@yekko>
References: <20220208194838.169257-1-danielhb413@gmail.com>
 <20220208194838.169257-2-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4wKdktr9MIn+wgx/"
Content-Disposition: inline
In-Reply-To: <20220208194838.169257-2-danielhb413@gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2404:9400:2221:ea00::3
 (failed)
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--4wKdktr9MIn+wgx/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 04:48:36PM -0300, Daniel Henrique Barboza wrote:
> Fix indentation of powerpc_set_excp_state() and ppc_excp_apply_ail()
> parameters.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/excp_helper.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index c107953dec..8a49a4ab90 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -265,9 +265,9 @@ static int powerpc_reset_wakeup(CPUState *cs, CPUPPCS=
tate *env, int excp,
>   * +--------------------------------------------------------------------+
>   */
>  static void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
> -                                      target_ulong msr,
> -                                      target_ulong *new_msr,
> -                                      target_ulong *vector)
> +                               target_ulong msr,
> +                               target_ulong *new_msr,
> +                               target_ulong *vector)
>  {
>  #if defined(TARGET_PPC64)
>      CPUPPCState *env =3D &cpu->env;
> @@ -362,7 +362,7 @@ static void ppc_excp_apply_ail(PowerPCCPU *cpu, int e=
xcp_model, int excp,
>  }
> =20
>  static void powerpc_set_excp_state(PowerPCCPU *cpu,
> -                                          target_ulong vector, target_ul=
ong msr)
> +                                   target_ulong vector, target_ulong msr)
>  {
>      CPUState *cs =3D CPU(cpu);
>      CPUPPCState *env =3D &cpu->env;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--4wKdktr9MIn+wgx/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIEdmcACgkQgypY4gEw
YSJRyQ/9GfsX1cOc5RpoWlXbroa/Pk4pY9/vPfO9eZPTiLu9x9jsf7Bo76A3kM9r
gQ7rQaCUvRWfeQc3whGCwysr1lAG7k4M/101dfejPOKC1XVSF2VdKQ7eNFkiIM/1
zrMtgf9eTUj70a/bg1fXqhGDP1k2BYSmvywWxM0U4kPC/iMAU8yZaR+oZcJFALKB
XVq/KO6NzyRsUB0FirEVJCX8BA/aGhIB/hFr2ExVCh9/XWyc8EfI+J9n4hW38JRI
GNssLheIfDEhARa/5Y3iP4WHg7XIkSu3nS9ulHq5TwOaNi9u0ZMvEJfkvkhljhms
r+N7vf3/JR71MJaLs+XJ2i0gu7yCXcBwjKheXXl0EgI/07cAjPf3l+N9h0xLNouR
KbhsTeqGvzQL0F65BRhQpEoQGPPRm6tUt2ALtcGRixzSjxRc+pw772kIUFxDTCNf
6D+wn8+4UKPkMINbmXbYEBqGPMhbMk5GVj61BcDHLxNGxhaKNJ5X05V1uHxyMdJk
G6XAaZRC6n7pXebwrMZ8epqttMgYnE417CWv6otjx9QqcSwCMoxmN7pG/ZQ1cyK+
B86WK+r6Mj6WsRmyNbfR74An8Ffds6aVE/mm2GVhdQYG/W8UwU1OOwuV3XZJzWb7
0q1K89d988hH9NyTfZ8qdmYy2rkLObtfWSFv5eJAcliWcbfd+rM=
=GCTQ
-----END PGP SIGNATURE-----

--4wKdktr9MIn+wgx/--

