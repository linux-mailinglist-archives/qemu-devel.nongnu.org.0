Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8137B37F032
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 02:04:03 +0200 (CEST)
Received: from localhost ([::1]:43876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgype-0004lu-K5
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 20:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lgyo6-0003FC-6l; Wed, 12 May 2021 20:02:26 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:32959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lgyo1-0003yO-3T; Wed, 12 May 2021 20:02:23 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FgX0467smz9sWD; Thu, 13 May 2021 10:02:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620864132;
 bh=ivdo1KTYrGth/+JkAaFNI5iI3U0rU7smdj9joehPMxM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=idFYreAkWMxOgRZfM7gdR8RMFC3m5We+wolF3Dj09hd9BgRGa7GPMQuaZCYJkfJPD
 q9E8pO4cLbfAprILNts7gyH1E63NACQ6y0xclnH3TdXCE3C9bHM9iSp8sV1S1Wg0Vt
 8SKHIle9zbXyVliYZH259JSrtqyCn4c1ePEbwbqw=
Date: Wed, 12 May 2021 17:02:34 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH 1/5] hw/mem/nvdimm: Use Kconfig 'imply' instead of
 'depends on'
Message-ID: <YJt9iiXF48P77gOY@yekko>
References: <20210511155354.3069141-1-philmd@redhat.com>
 <20210511155354.3069141-2-philmd@redhat.com>
 <YJs8anLs1zL3nPdS@yekko>
 <21e0a306-ccfb-a627-1496-14f831fe80a7@redhat.com>
 <dba0c284-b279-5e5b-74c9-2da719a8ce2e@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fC7dX5wvbkpFIsSX"
Content-Disposition: inline
In-Reply-To: <dba0c284-b279-5e5b-74c9-2da719a8ce2e@redhat.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Igor Mammedov <imammedo@redhat.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--fC7dX5wvbkpFIsSX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 06:53:22AM +0200, Thomas Huth wrote:
> On 12/05/2021 05.57, Philippe Mathieu-Daud=E9 wrote:
> > On 5/12/21 4:24 AM, David Gibson wrote:
> > > On Tue, May 11, 2021 at 05:53:50PM +0200, Philippe Mathieu-Daud=E9 wr=
ote:
> > > > Per the kconfig.rst:
> > > >=20
> > > >    A device should be listed [...] ``imply`` if (depending on
> > > >    the QEMU command line) the board may or  may not be started
> > > >    without it.
> > > >=20
> > > > This is the case with the NVDIMM device, so use the 'imply'
> > > > weak reverse dependency to select the symbol.
> > >=20
> > > Uh.. It should definitely be possible to start a pseries machine
> > > without NVDIMM.  I would have guessed the same for PC.
> >=20
> > Yes, this is what this patch does. With it we can build with:
> > CONFIG_NVDIMM=3Dn
>=20
> But with "imply" you could end up with a PSERIES that does not have NVDIMM
> when also using --without-default-devices, couldn't you? Why don't you use
> "select" instead of "imply" ?

Oh.. clearly I misunderstand the semantics of "imply".  If we don't
need NVDIMM for PSERIES, why does there need to be any Kconfig
connection between them at all?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--fC7dX5wvbkpFIsSX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCbfYcACgkQbDjKyiDZ
s5Jofw/9FCrSSe6dOlMYzTYhM54r6tz+JwuCU4UU4+RscM/Q/splCZ5Hf/gSPTrq
tiLti0vUrkTCISkwaTFhuWoZIcrC1uL5wyIcr7cpl0xrw+7q6uz5S4zvXxZZxdS7
++7MXeyg/FhhdJlSbfUUAqM9ZZ3Yr8Ye2NzjI0qhowEAI6s5i00HPQQe2HvwwtLd
snjaTLeE9fioXuv0V+2YISVjsX1rsIOHC/pdNmj948qQhbFeDO+C301wQKJL5s+N
ytK/mxUyuRqh1FXf59fuDTukNlrqrTOi96LwZIuuKgwWcBZ1X/x0zn2En2iJQT64
KGWz5PLvdldkVB9yOaMOHAL8mN97BxB2NWNCUBYTztW/m2aLb4SyAj1eastj4a2O
3YH+Clp+PwURJBVWa357BwJFtzegXvSeGf55A+5Rldhv4AWNegHlKbTAl+Lw9ZUE
08CMtsbqkXoRca5I1KZbJdyc7yy4udwAB92YJNCUDNRHpgZ/l98HuJKeJOkmvwJL
+KpmAck25ssipmkhbwSKUGZfn3xfeir4xo/DK9KPa1KPFe/MmVK0alvIhPBM5ZBr
Y7B7NjoR6q3XdPSZPA6MhfklCvOPiS4DmLaJG7eOdpkZ6WW4pI/wKS8798m8q/EZ
xPdFeN6wIH6uZGH5PJ1Hp3dQYoHPw1QgU+7Vr9hcduNrVu+pNEk=
=MVAO
-----END PGP SIGNATURE-----

--fC7dX5wvbkpFIsSX--

