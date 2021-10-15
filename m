Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5304B42E9EA
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 09:19:36 +0200 (CEST)
Received: from localhost ([::1]:45550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbHV9-0004nI-2L
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 03:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mbHHM-0004Pl-SU; Fri, 15 Oct 2021 03:05:22 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:41673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mbHH8-0006MV-6z; Fri, 15 Oct 2021 03:05:20 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HVy2N3JXZz4xqM; Fri, 15 Oct 2021 18:05:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634281500;
 bh=kxfdjx/aOM9NU/k4iLfhiDRSI2eL/A0/M8eQqOFPbJE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N73xW3gQAipPlUqZmiQmQhkzeC7EH+Nbguoew/C2F2OjF49zYy1ge5P9pLBA/Gdxn
 HIFyybrmG3kHPjSnaxz3TSomPD3XnBhAW5Iy+Ouoizxa9+rtKzANhD/JRRlIz+xaUr
 GjUWMNG7gQflaEdP+OBY1gB8qNZ3M8p2vRhxG1i4=
Date: Fri, 15 Oct 2021 14:17:26 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 3/6] ppc/pegasos2: Implement get-time-of-day RTAS
 function with VOF
Message-ID: <YWjyxvGlkzgi2nl6@yekko>
References: <cover.1634241019.git.balaton@eik.bme.hu>
 <6233eb07c680d6c74427e11b9641958f98d53378.1634241019.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fLGQ6Rf7lIvGJR2s"
Content-Disposition: inline
In-Reply-To: <6233eb07c680d6c74427e11b9641958f98d53378.1634241019.git.balaton@eik.bme.hu>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--fLGQ6Rf7lIvGJR2s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2021 at 09:50:19PM +0200, BALATON Zoltan wrote:
> This is needed for Linux to access RTC time.
>=20
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/ppc/pegasos2.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>=20
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index a1dd1f6752..a9e3625f56 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -31,6 +31,8 @@
>  #include "sysemu/kvm.h"
>  #include "kvm_ppc.h"
>  #include "exec/address-spaces.h"
> +#include "qom/qom-qobject.h"
> +#include "qapi/qmp/qdict.h"
>  #include "trace.h"
>  #include "qemu/datadir.h"
>  #include "sysemu/device_tree.h"
> @@ -369,6 +371,29 @@ static target_ulong pegasos2_rtas(PowerPCCPU *cpu, P=
egasos2MachineState *pm,
>          return H_PARAMETER;
>      }
>      switch (token) {
> +    case RTAS_GET_TIME_OF_DAY:
> +    {
> +        QObject *qo =3D object_property_get_qobject(qdev_get_machine(),
> +                                                  "rtc-time", &error_fat=
al);
> +        QDict *qd =3D qobject_to(QDict, qo);
> +
> +        if (nargs !=3D 0 || nrets !=3D 8 || !qd) {
> +            stl_be_phys(as, rets, -1);
> +            qobject_unref(qo);
> +            return H_PARAMETER;
> +        }
> +
> +        stl_be_phys(as, rets, 0);
> +        stl_be_phys(as, rets + 4, qdict_get_int(qd, "tm_year") + 1900);
> +        stl_be_phys(as, rets + 8, qdict_get_int(qd, "tm_mon") + 1);
> +        stl_be_phys(as, rets + 12, qdict_get_int(qd, "tm_mday"));
> +        stl_be_phys(as, rets + 16, qdict_get_int(qd, "tm_hour"));
> +        stl_be_phys(as, rets + 20, qdict_get_int(qd, "tm_min"));
> +        stl_be_phys(as, rets + 24, qdict_get_int(qd, "tm_sec"));

Doing a separate dictionary lookup for every component seems like it
might be pretty expensive.  You might want to look at how spapr does
this.

However, you're maintainer for pegasos, so really it's your call -
applied, thanks.

> +        stl_be_phys(as, rets + 28, 0);
> +        qobject_unref(qo);
> +        return H_SUCCESS;
> +    }
>      case RTAS_READ_PCI_CONFIG:
>      {
>          uint32_t addr, len, val;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--fLGQ6Rf7lIvGJR2s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFo8sYACgkQbDjKyiDZ
s5K8QhAAgM7Wpo3qyGM6E2cmplGHi3wvFcPrst33vlrtk64itDEjT/eVu86kRqpC
viICYkEtmnjUsHSYisv/fFjnGsIOgoD1G1dtKQ0FvsnsZ3k0YzW06o8hjTvrRLXj
Yp4/C0Yc0PvsnfmRpEDwrr89JWRubAeY/aEhOgG6eQWlha0anEBeLgOdhSa6iLcS
xhb+/Mn/94KxOn74DaczM02AO8RmHXXq0H8K+q33jUewcy5AvN7cQPXrfKJ5NhsS
Qxk37HeghjSymm7EKHY5ggT2omksHJz3dPdtwNnFljm+cTT8j/Bq150heV4M/g+o
zU+zSN7n2NTY4dNq/Qzmf7bZCChnyaMLdCFaEsulARPDoyGgxFKJ3TS8eqzCWLWO
aLXy7tH1fLV81RqLA+Ot+GX5QowpjCovIng0F82y3NVwUKbqrr4azOFB8yV2EPLm
Yp91MT0Jv1qwcxrJbW9BFe2WXYNAIX23SnMOvSlxx79n3mJeTwybGWpOohEZr3P2
/JcWsh4g0BLvaWRfIm9tdLxpHOXGSByaNfUgrPB2ObtLCV1/9zm14odwTBnEs5qA
okWY2kmLTHpM4Ie0SPdhCCDLdOstzFJ12Ayo2gzigdJkZLfIWR4ZWUnqIeQnIHia
L7Vl0zF6ysWpTcRUJaFqOjXodn8VQnJ2K8Dp/onv2aq/C8mHrE4=
=KRSC
-----END PGP SIGNATURE-----

--fLGQ6Rf7lIvGJR2s--

