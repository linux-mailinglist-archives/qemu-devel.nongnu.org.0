Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4338E42E9BE
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 09:12:06 +0200 (CEST)
Received: from localhost ([::1]:59320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbHNt-0003JN-8c
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 03:12:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mbHHU-0004cR-Uw; Fri, 15 Oct 2021 03:05:28 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:60965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mbHHR-0000GJ-S4; Fri, 15 Oct 2021 03:05:28 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HVy2N3bQXz4xqR; Fri, 15 Oct 2021 18:05:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634281500;
 bh=Za66A/46aqacvU3o6qCO5SOHUUJGu2FaOvncfQARm/Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IjYxjZchoYXo08o/SNBEqwF7KUPAG6jYRXklAm5Dp6QRhE6sv77/K3hzB+wzrxR69
 y783mFGWtdKZCc822Gho/R+zanLHU10q4d4JkEHoS0mZf5rUd5XRcapxiNm0ypr2dJ
 SiBGDUSRXyM1fDvzQY41s+NohkvNLuaWY04iPBec=
Date: Fri, 15 Oct 2021 14:19:46 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 6/6] ppc/pegasos2: Implement power-off RTAS function with
 VOF
Message-ID: <YWjzUu2L5eQVLfVa@yekko>
References: <cover.1634241019.git.balaton@eik.bme.hu>
 <1c1e030f2bbc86e950b3310fb5922facdc21ef86.1634241019.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="k/bPwJeu0ExD8ktt"
Content-Disposition: inline
In-Reply-To: <1c1e030f2bbc86e950b3310fb5922facdc21ef86.1634241019.git.balaton@eik.bme.hu>
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: 17
X-Spam_score: 1.7
X-Spam_bar: +
X-Spam_report: (1.7 / 5.0 requ) DATE_IN_PAST_03_06=1.592, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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


--k/bPwJeu0ExD8ktt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2021 at 09:50:19PM +0200, BALATON Zoltan wrote:
> This only helps Linux guests as only that seems to use it.
>=20
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Applied, thanks.

> ---
>  hw/ppc/pegasos2.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index 39e96d323f..e427ac2fe0 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -22,6 +22,7 @@
>  #include "hw/i2c/smbus_eeprom.h"
>  #include "hw/qdev-properties.h"
>  #include "sysemu/reset.h"
> +#include "sysemu/runstate.h"
>  #include "hw/boards.h"
>  #include "hw/loader.h"
>  #include "hw/fw-path-provider.h"
> @@ -429,6 +430,16 @@ static target_ulong pegasos2_rtas(PowerPCCPU *cpu, P=
egasos2MachineState *pm,
>          qemu_log_mask(LOG_UNIMP, "%c", ldl_be_phys(as, args));
>          stl_be_phys(as, rets, 0);
>          return H_SUCCESS;
> +    case RTAS_POWER_OFF:
> +    {
> +        if (nargs !=3D 2 || nrets !=3D 1) {
> +            stl_be_phys(as, rets, -1);
> +            return H_PARAMETER;
> +        }
> +        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> +        stl_be_phys(as, rets, 0);
> +        return H_SUCCESS;
> +    }
>      default:
>          qemu_log_mask(LOG_UNIMP, "Unknown RTAS token %u (args=3D%u, rets=
=3D%u)\n",
>                        token, nargs, nrets);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--k/bPwJeu0ExD8ktt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFo81IACgkQbDjKyiDZ
s5JAtQ//aTxkH5/lufti2P0UrcyIsohCl5q61nXml8toH7h146CWDte9ZjePxiOc
lvCzbkj+m2YB7/TbrREkGxNOTttgrOuJcfGWVFzY43nDba3eVO5ddKAYkY6ueaQs
8RL+Dmj7JC7JcLkAULyaTWREFeRxXuGtM0LaP76n/s994TOyVh05sL52ETS6WwG3
NX1DccqFoXZFMEiaui2plSjoMJh3EQjEuShKFNl2tjoS/AP5jaHDRQH1+fO0DM7i
Hqx+vwDpMISjIBM/e/zayAoLkJVjBIaNR9TLzyrntb4HMxs1p9dgY9dlLvS/0W2Z
gWz0I6H0UBQtBqzZWrS+H9H0ts51t5iQnu4Lbp8L0YSMkFNV0BPetfxfu4ZPtkPm
AlLG34JHpcNj9+eHXifF9fLVful/JB5yRmas8Q3M3Isyi4jx8hbM2bSr+maWycmf
rnFyvz8Y0zs2HYybFs6dM85dthHu4EbiwKOkoJIOnoK+W9rldDHj9WZTGzPJ661k
xFmXd10Musen2/dnlJ7YKtsOdRabwfiZSKMvTRh9cFyXhfxfpnRfhzv10YGw7E9i
7whyCOruPQLehneQgLMwA6N7hWHCtlbqcInFd1T0nLaTKxj4x/S5PbaKw5KpR7qt
zMfjglXlB1YO6Ia5Q6x4fNtASXO5rW6ZTKlr2P58Bya9DrHK7Ic=
=5Sq4
-----END PGP SIGNATURE-----

--k/bPwJeu0ExD8ktt--

