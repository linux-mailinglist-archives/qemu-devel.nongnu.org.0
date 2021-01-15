Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A472F6FDF
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 02:13:23 +0100 (CET)
Received: from localhost ([::1]:55548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Dg2-0000by-4k
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 20:13:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l0DaI-00041d-LZ; Thu, 14 Jan 2021 20:07:26 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:38029 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l0DaC-0003Q9-JP; Thu, 14 Jan 2021 20:07:23 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DH31c01Lhz9sWW; Fri, 15 Jan 2021 12:07:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1610672836;
 bh=99W15X76qGo6Dz8pHcZoDwwjEO534KEH8ogb/iLMRXA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OOuqyv5xRHKN8bciMDyhtp6SaQ880HHy74uF47RL8beYajcVbpaWIIn5QV2XXdWXa
 wL7VD5TTKGbM+LJrW5rmUNZQGiK6uguV2uxTskk5gbWpoE4BUy3liRC+wB8mq5zOLx
 zvkUjcB8L+V7zd15MUN4x26jnpw5qbIcwIZvej7s=
Date: Fri, 15 Jan 2021 11:45:50 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v1 4/7] spapr_rtas.c: fix identation of
 rtas_ibm_suspend_me() args
Message-ID: <20210115004550.GT435587@yekko.fritz.box>
References: <20210114180628.1675603-1-danielhb413@gmail.com>
 <20210114180628.1675603-5-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="k8r0khnpBuGu0wUi"
Content-Disposition: inline
In-Reply-To: <20210114180628.1675603-5-danielhb413@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--k8r0khnpBuGu0wUi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 03:06:25PM -0300, Daniel Henrique Barboza wrote:
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Applied to ppc-for-6.0, thanks.

> ---
>  hw/ppc/spapr_rtas.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> index d014684d60..fbefd5d3cb 100644
> --- a/hw/ppc/spapr_rtas.c
> +++ b/hw/ppc/spapr_rtas.c
> @@ -219,9 +219,9 @@ static void rtas_stop_self(PowerPCCPU *cpu, SpaprMach=
ineState *spapr,
>  }
> =20
>  static void rtas_ibm_suspend_me(PowerPCCPU *cpu, SpaprMachineState *spap=
r,
> -                           uint32_t token, uint32_t nargs,
> -                           target_ulong args,
> -                           uint32_t nret, target_ulong rets)
> +                                uint32_t token, uint32_t nargs,
> +                                target_ulong args,
> +                                uint32_t nret, target_ulong rets)
>  {
>      CPUState *cs;
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--k8r0khnpBuGu0wUi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAA5b4ACgkQbDjKyiDZ
s5K7xw//boDq304ux1BbuLd6f/OEAi/OW6QG9mg/5Rjt9Lu4kNfbQiwPn+2fc4jM
XgHZo5dOPjpxzwQcnHpgJFy1AiPvyUR/IlJ501kRJCj2JwuubFbfdTQ2ZvFzyoq+
gCJf5cxgtx58ypoAomam4K3r6W85xrwb0m5gvsGr77GBv7668qLRm7ZGK50hme3s
G800D86yx/tBK3jonq8M3Xcb0vb0xzCmPwPlhecQfVtFdPB2eSlKWxgXIVSB7ZgM
QUPAdJ5MNPW0j8+Pdg+lnfiM1/lB7BLyTCmTxcg2fBpXrJMUO+IyzlRhPuOLUXQR
yt5fZmfjQQorfU/ZctcslTdWYpsRiKiRQo8FJC/2NdLgrMg1+8ZXMjS3D194kJaN
C3GPdjuwt1FzEVXnsBES1QbUcm8r/tRNAshfviB2VGagjBNe2dNXEBNocvR8mk+s
2VAp3q7zO64gG3rZ5OWxsLIVUYy8R8Lp8tk8GmOmREH1lmdEypjr17NHOI31yHpF
Wj5oDwX38KsuXjQ+P+nqvynFHqlqIVaWQtYE/XFoaNbXIj1Tlya5wr8cZWOS50wV
myasHK+SAZ+86B29G5EeY4LUXCEOwrV2GNiKGAZIJ/MMrZNh7CK6Yv3zyi9BhYY7
8817ejagD8OaY38zygbKimOn/TWyV4E+y9aKD8uz/oEplbM2L9k=
=39Su
-----END PGP SIGNATURE-----

--k8r0khnpBuGu0wUi--

