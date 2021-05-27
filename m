Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 723D7392860
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 09:19:38 +0200 (CEST)
Received: from localhost ([::1]:57974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmAIr-0000Lp-IM
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 03:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lmAC5-00074R-O4; Thu, 27 May 2021 03:12:37 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:52855 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lmAC2-0004kR-L1; Thu, 27 May 2021 03:12:37 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FrJsx4RXzz9sXH; Thu, 27 May 2021 17:12:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622099541;
 bh=jxLaDyKsNf6Qb6qpyIceoFSRTfKOdg5SbS6t7R1m/go=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NiHYOM7shRMoZTSKA5oMcUeQ5Aw6WfjtQMR1jaS51DWqOtxqZKZmwofyTaxRl/zAd
 /w4PF9V7SjQe9SU/uN5SaafOKLFSPb90HFwLAyn2Zzro+jtBEfm8Zr0eYvmHOBOAOG
 o9GnZgvVUq9M7pDaGRnV1ddEQ+a2wgg8PG6hs6vc=
Date: Thu, 27 May 2021 15:10:20 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v5 4/4] target/ppc: updated meson.build to support
 disable-tcg
Message-ID: <YK8pvHyHshd5xs6Z@yekko>
References: <20210525115355.8254-1-bruno.larsen@eldorado.org.br>
 <20210525115355.8254-5-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NN9QWRRgkIciaMhE"
Content-Disposition: inline
In-Reply-To: <20210525115355.8254-5-bruno.larsen@eldorado.org.br>
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--NN9QWRRgkIciaMhE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 08:53:55AM -0300, Bruno Larsen (billionai) wrote:
> updated build file to not compile some sources that are unnecessary if
> TCG is disabled on the system.
>=20
> Signed-off-by: Bruno Larsen (billionai)
> <bruno.larsen@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/meson.build | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/ppc/meson.build b/target/ppc/meson.build
> index 848e625302..a6a53a8d5c 100644
> --- a/target/ppc/meson.build
> +++ b/target/ppc/meson.build
> @@ -3,11 +3,14 @@ ppc_ss.add(files(
>    'cpu-models.c',
>    'cpu.c',
>    'cpu_init.c',
> -  'dfp_helper.c',
>    'excp_helper.c',
> -  'fpu_helper.c',
>    'gdbstub.c',
>    'helper_regs.c',
> +))
> +
> +ppc_ss.add(when: 'CONFIG_TCG', if_true: files(
> +  'dfp_helper.c',
> +  'fpu_helper.c',
>    'int_helper.c',
>    'mem_helper.c',
>    'misc_helper.c',

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--NN9QWRRgkIciaMhE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCvKboACgkQbDjKyiDZ
s5LuEQ/+KR3oB0CFHYqiohQcs+nAdMbBQKcXc2orTwmhWNxqMtClEb5HaWmpKZxc
YzSK7znsb5i+KooR2LdY5cTGfSMgnbIFTQoWfCvAFEP36TuVq4BLGXaCc98fNuB5
kTDpJ15Cr4ETO/OkuzOcMsTPGLueT+6qmNiNSXL0FDXPv4NV5eQhrpEQ5OKZjstI
mgFx8L0qN6GNm86x/U3RgZKf3bsCxrDPOu+v9bfIyjKe9LYNEMj8Go43SoaMIoJ8
Eh+lEF796wYuCAzpB1uM23TVvvRjBFDoiF9zi2GuqcecG0ETTbl53daZf72pJTCN
B3KT8yjuw1fZUsYxSYoADANMgeXYmaRFInQjMOA+0QYGqZMQAbB+jD2Yt28yhuRQ
L4aaZz4nGnFohUScpUqV75gx1dxKbmuXoDUBl7ULK8629FQGlGpVjoA6LEmxRiRT
D/WgEsRg4YwmP0m+09QdZBerCR9r86aP9l6+nrntvnTpvb+xbIw185JsUDsbkIdY
M0paWsBQ1WsKVm0pbeCqASyYtckr8f5fiq/fyRDUVpOf+D76SrcEMKjiBdA6oGEW
WAF6ewRFS/ZJBzddmNTmYyoPM74txJwwgYdCCQvIdNhhL7wARkZhfi80imF/6mWD
ub7FrGzoexvWwRfc+MgSGx2uvFmAHOYtZLQJIjQG71oUjOlGAZw=
=xJcI
-----END PGP SIGNATURE-----

--NN9QWRRgkIciaMhE--

