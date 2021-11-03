Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88478443A5F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 01:23:05 +0100 (CET)
Received: from localhost ([::1]:51372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi43T-0001Qv-A4
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 20:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mi3yv-0007wQ-HX; Tue, 02 Nov 2021 20:18:23 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:54853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mi3ys-0001At-M5; Tue, 02 Nov 2021 20:18:21 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HkS6B137tz4xbP; Wed,  3 Nov 2021 11:18:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1635898690;
 bh=W66m+GcFvwOk4JKYQW2j32q0opxXNvWclJXHlT9sJHI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fPzWQdkO+sp8zLm8wdJknf+66YCHXsFvgu46zHdspJYuQuv1kkB7kt+Xw7BXsQ2jd
 mVyaEfgRPKNq/kISTZt3ULr1sBlJakAdTD/sSnh3gGY8mar79o1IOJFLzSrcSoZtiB
 3/OWxUkunUpEY+8BFYeccqiNCxlGqhbTfk9i8CsI=
Date: Wed, 3 Nov 2021 11:18:04 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH] ppc/pegasos2: Suppress warning when qtest enabled
Message-ID: <YYHVPLCOMEcsRsDP@yekko>
References: <20211101151023.F0D02748F5A@zero.eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pt5xXpLtHqOOgBNn"
Content-Disposition: inline
In-Reply-To: <20211101151023.F0D02748F5A@zero.eik.bme.hu>
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--pt5xXpLtHqOOgBNn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 01, 2021 at 04:08:31PM +0100, BALATON Zoltan wrote:
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Applied to ppc-for-6.2, thanks.

> ---
>  hw/ppc/pegasos2.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index e427ac2fe0..298e6b93e2 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -23,6 +23,7 @@
>  #include "hw/qdev-properties.h"
>  #include "sysemu/reset.h"
>  #include "sysemu/runstate.h"
> +#include "sysemu/qtest.h"
>  #include "hw/boards.h"
>  #include "hw/loader.h"
>  #include "hw/fw-path-provider.h"
> @@ -199,7 +200,7 @@ static void pegasos2_init(MachineState *machine)
>          if (!pm->vof) {
>              warn_report("Option -kernel may be ineffective with -bios.");
>          }
> -    } else if (pm->vof) {
> +    } else if (pm->vof && !qtest_enabled()) {
>          warn_report("Using Virtual OpenFirmware but no -kernel option.");
>      }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--pt5xXpLtHqOOgBNn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGB1TwACgkQbDjKyiDZ
s5JO3BAAvyLRc6ZhC5Dey291Lo++f588o50okNvx/FEGOBphIDiQeFNJYh2Dl0IX
PLm+EfHgOn3X9WAlFUXxBdALfY1OTLMwcZ2iGMR+s4Tj85sOoRuUXHDBikJ9BlIB
+E24FXg7q+21LD8cyBj8sbG6XrMsYKoDpvFxeQGLrDjgWOC2zqJ/3xlp2RbvztnV
iQ+hF8ez711e8uytTw0km2lMnfQiD7tEf6cpxwy7zm6zIRhv67SsBL4FgEFZPd2W
/kD1RgviinIYY5roy1sFSyO/w1za6Qg04VzZS+vzQMUSrujshmH/rbC1G9nqCU46
JPObLvqxkj2YcMXY7BA32gh8IVd+lDCuy+D+QJtolKmNwer9oycVJFuHp9To4QE0
9U3i+ho6OQsgZbjwYGwTUpL0srD8n9lHzut/vO+EhAFBQIlcanQjDTKbnWc6w2tG
2AUaNU7i/yemw70eabAT6CiQkPVbPvLTxm6hZ5fWGh8cYizDaPJVr8wAKz3m7++n
RjeN3+sSlJ7vuvIMMWLq8w1duNu185NIAjxxiwoKf8EzzZ3iHANfY+taHWC3cNd9
zdEpWwaYpXUZO36lmv8wPBDq34DmKenOr2+YE1Tc5cEG5ArgkYMWOn5P7XZNHOxA
+efxjxVvQqKKtU7JmiKQ77ZZ1vJcK+i6rPFyyLiejOtgr19n5Ns=
=z+TO
-----END PGP SIGNATURE-----

--pt5xXpLtHqOOgBNn--

