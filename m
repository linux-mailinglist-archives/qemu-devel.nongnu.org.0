Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB8148606A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 06:51:03 +0100 (CET)
Received: from localhost ([::1]:37822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Lfx-0000Jm-RL
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 00:51:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n5LO3-0004th-Ly; Thu, 06 Jan 2022 00:32:31 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=54845
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n5LO0-0002YI-SK; Thu, 06 Jan 2022 00:32:31 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JTw3008ppz4y4C; Thu,  6 Jan 2022 16:32:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1641447132;
 bh=Fx2/ORoI3xv6rb8l/ahOLShKcM+idazKUka4VRFilts=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UkXLy+cWW/apAICf35UFiuKZ5qxYcvuM2govF2PRnfKrb3AXV6ujIAIUdCD7Xi+rw
 d7zC+HmCzxK2IuNI9hBiDkZazy8nfGCH7EnF5LpoDaj3NkUhKtnQDGDVLCbjsnJ4zj
 26IN0eYUPNNWAhoJ4+u3QL+sH2vG9AmiMPUiMJz4=
Date: Thu, 6 Jan 2022 16:31:49 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH v2 7/7] target/ppc: Introduce a wrapper for powerpc_excp
Message-ID: <YdZ+xayxxKeACKbL@yekko>
References: <20220105204029.4058500-1-farosas@linux.ibm.com>
 <20220105204029.4058500-8-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ysdJJSt5lZ4U5ehR"
Content-Disposition: inline
In-Reply-To: <20220105204029.4058500-8-farosas@linux.ibm.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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


--ysdJJSt5lZ4U5ehR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 05, 2022 at 05:40:29PM -0300, Fabiano Rosas wrote:
> Next patches will split powerpc_excp in multiple family specific
> handlers. This patch adds a wrapper to make the transition clearer.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/excp_helper.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index d16bdf9283..ea854a868e 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -397,7 +397,7 @@ static void powerpc_set_excp_state(PowerPCCPU *cpu,
>   * Note that this function should be greatly optimized when called
>   * with a constant excp, from ppc_hw_interrupt
>   */
> -static void powerpc_excp(PowerPCCPU *cpu, int excp)
> +static inline void powerpc_excp_legacy(PowerPCCPU *cpu, int excp)
>  {
>      CPUState *cs =3D CPU(cpu);
>      CPUPPCState *env =3D &cpu->env;
> @@ -868,6 +868,16 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp)
>      powerpc_set_excp_state(cpu, vector, new_msr);
>  }
> =20
> +static void powerpc_excp(PowerPCCPU *cpu, int excp)
> +{
> +    CPUPPCState *env =3D &cpu->env;
> +
> +    switch (env->excp_model) {
> +    default:
> +        powerpc_excp_legacy(cpu, excp);
> +    }
> +}
> +
>  void ppc_cpu_do_interrupt(CPUState *cs)
>  {
>      PowerPCCPU *cpu =3D POWERPC_CPU(cs);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ysdJJSt5lZ4U5ehR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHWfsUACgkQbDjKyiDZ
s5L7LQ//dW6YSqQ6F/7deeSKXQ+sL9N5MlVTYACU45EtTP1tE5WTWhGGTw88Yt9s
enISmfa7D7hI1Mf/O4pd5tpY++faC5KsUWFMMPMUk8FOKalDINMMxmrwHGdigStS
NIcEZrbdT9ITEARr6tJE2a+x792tQyWvZBdNK1K33mUzeuK6sNcSV2mTm1W+pf18
xTq6J+WuQ+kR6YXZ26j3XSXL81biZY9ZZksXuhLyjFLAu46s/ujPphr14gos3xO9
tFDa1f2Ljrq/m0zjlVp26hIGKmA3cORndpgby2mn5cIj4pnT5CrzUeBknkbaXLXA
V+X+q1wHTeiBx5B6rVzT7Z0hRAzxLDKTLKg+O6zBnihpOFx7UD8xTeCcpTWgFujB
EIfplykrRD1bG/KjyFiF9zUJnPou9tIiNnpsHFnFgeWAIWx79McaDWQHeqrFVXr3
WA0TUWY0+HdFMjp/kvRNhWjsdxZsXfiF2NXZKnkSTD82zJgt5/kifUbbdwipBpXR
qQtKDRONa+3P93rcAH/z2OtiKlrq1efVGIhNXP9pJog7rOxCAbAe4UGJpnyXurts
xTHP+NT3nE+sGciAO6Z+lqG2zpC1k0hhbNo1K2h/FrXsD5T6JRpuFVMOQLdzTakl
esPYNfE6WyXr6g9l4GOOraC0188kt48ov+aaVhDKwPXJJWglu4o=
=YDC0
-----END PGP SIGNATURE-----

--ysdJJSt5lZ4U5ehR--

