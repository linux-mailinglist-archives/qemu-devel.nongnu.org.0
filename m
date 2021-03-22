Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9305134383A
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 06:19:25 +0100 (CET)
Received: from localhost ([::1]:36388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOCyK-0000du-B5
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 01:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOCu0-0004Hp-RJ; Mon, 22 Mar 2021 01:14:56 -0400
Received: from ozlabs.org ([203.11.71.1]:51397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOCtw-0004as-3F; Mon, 22 Mar 2021 01:14:56 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F3jNk2yJgz9sWL; Mon, 22 Mar 2021 16:14:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616390086;
 bh=ukdD7qdlH0wtLxNN+PyL43gdzvwUFuwsQ3U5HrhjvBo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cLFd0yXIZ5D/3eN8bJ2v8uH2JaxUZ24Wj0HlBGYSIH8uGJaNu/0Cw+4giR2ItBh3p
 WVvb0AGQgnk1DWZ9i2e6E4PdAPVwnZ/FUdBMacrcmEGCEBYuKfjXqqwWl0eVQFaMrL
 49frMtB1oUfktXW+7EZ+caLh1ZuwR2Rx3vr+Qp0A=
Date: Mon, 22 Mar 2021 15:27:15 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 14/17] hw/ppc/pnv_core: Update hflags after setting msr
Message-ID: <YFgcoyfkHORXO7sF@yekko.fritz.box>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
 <20210315184615.1985590-15-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="P5i4nDRP20Upgnut"
Content-Disposition: inline
In-Reply-To: <20210315184615.1985590-15-richard.henderson@linaro.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--P5i4nDRP20Upgnut
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 15, 2021 at 12:46:12PM -0600, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-6.0, thanks.

> ---
>  hw/ppc/pnv_core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
> index bd2bf2e044..8c2a15a0fb 100644
> --- a/hw/ppc/pnv_core.c
> +++ b/hw/ppc/pnv_core.c
> @@ -29,6 +29,7 @@
>  #include "hw/ppc/pnv_xscom.h"
>  #include "hw/ppc/xics.h"
>  #include "hw/qdev-properties.h"
> +#include "helper_regs.h"
> =20
>  static const char *pnv_core_cpu_typename(PnvCore *pc)
>  {
> @@ -55,8 +56,8 @@ static void pnv_core_cpu_reset(PnvCore *pc, PowerPCCPU =
*cpu)
>      env->gpr[3] =3D PNV_FDT_ADDR;
>      env->nip =3D 0x10;
>      env->msr |=3D MSR_HVB; /* Hypervisor mode */
> -
>      env->spr[SPR_HRMOR] =3D pc->hrmor;
> +    hreg_compute_hflags(env);
> =20
>      pcc->intc_reset(pc->chip, cpu);
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--P5i4nDRP20Upgnut
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBYHKMACgkQbDjKyiDZ
s5Ijjg/+KChmLmuoMYvW21lXENtPIMvUR7EWO9s7LzeM1soJqYziMp5e012CHLUI
dTsXyCaaP5bFF/j9HWj6jo4PRa07v7ZtgMfH6gsyhspCTOp9ybwrgfJt3DBMcYiP
t2VCW3iFOCWlvq/DOB1P92usL9VxqZ+dNF1JT4mbbvRCi8FEVnhto45ahBvNur1H
KP4olhsL5dPubfCJ53n2yaRdXAe7SqWuIVPRoXNNLBLUEXqYs23XTdc85d/XYK52
zwwIVQzG6iagGkeJ1pjXJ8JvWWgUMy/mwILPQdlkGo6WXhaQOqOssL9oUOItT792
l9Y+7rz2EgpjH+DUOUDK0ZDovWLTwKWeh5kpHILjBgC0q/XBiG0Yb7RPTYjfG5IQ
qD9qvH7nd/Vvag+I1VDDgr6NYCX3DFJXCiXAASdorOsFp/CFfLSCJ21VvW4Ikygj
qLKbU9YMEmbh2y+ecnEl+jrftRIfHl/uam0dexSH9tHjSGV7ju4mKND+JEZNxmde
i1p2mCEAYTCvKoijDRaze7MThK+ctmEc8W1aBLveF/KAfZbJgReo9IBPubp9vZ7e
y4BJ0oH/4S0yYHblN2z/+Nc/gJ1PNEbLhuMrTUJLEIeTwnMiEqal7YyIa8qMF269
LMuUDSg9yDiWUEOuEnsr4QOnKhf9yuNAoOTEoc6GDgDkDNeVaZk=
=U868
-----END PGP SIGNATURE-----

--P5i4nDRP20Upgnut--

