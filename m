Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 039703F80DE
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 05:14:31 +0200 (CEST)
Received: from localhost ([::1]:37892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJ5qX-0001uq-FA
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 23:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJ5nQ-0001Bg-Lk
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 23:11:16 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:41559 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJ5nM-0007qD-MO
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 23:11:16 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Gw7CY70QNz9sXM; Thu, 26 Aug 2021 13:11:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629947465;
 bh=qO24jTovk0/sYNwsxD4ZUdf+DpW25NAez5xJy3MufLw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hKSKd/OJEETC65K6A4YkOsd2d5qzMpTADxuy2wMnI/9qJYqi1pZytuVdvuhfSg0Zu
 iqcb8iFiJbaClvTLnkVkIAJZZgX/jq6VoeurXu/2RYhYm0pufNhZfKzhL7erCidlxA
 xymulhxmc7CErJqqAbLpeJYxZIKxQ0DG0RfZ6C9c=
Date: Thu, 26 Aug 2021 13:10:37 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH] RFC: build-sys: drop dtc submodule
Message-ID: <YScGLe9HTm404Jc8@yekko>
References: <20210825124309.223622-1-marcandre.lureau@redhat.com>
 <c79fb3c7-e6cc-adea-b694-ffe1f25c0d59@amsat.org>
 <CAFEAcA8YNwe-PCt2VuY4Fhjbyqnm2G7BpZDs6wyXNFh3pmee2Q@mail.gmail.com>
 <CAJ+F1CKx=24Hssrz=yz+D8Q2nTXcgaLeMFdB5tfHfdWRAZ-p+g@mail.gmail.com>
 <CAFEAcA-_Xcep33jG91M3j=bySpWS60zKyydm-jO8nn8nKg_6aQ@mail.gmail.com>
 <CAJ+F1CKo2hVhwKs+fH-W5rq04gCPiwjxe5HfFsg16gvTnH5U-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6j/nD3QvyS1wEwvn"
Content-Disposition: inline
In-Reply-To: <CAJ+F1CKo2hVhwKs+fH-W5rq04gCPiwjxe5HfFsg16gvTnH5U-A@mail.gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--6j/nD3QvyS1wEwvn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 26, 2021 at 12:11:17AM +0400, Marc-Andr=E9 Lureau wrote:
> Hi
>=20
> On Thu, Aug 26, 2021 at 12:00 AM Peter Maydell <peter.maydell@linaro.org>
> wrote:
>=20
> > On Wed, 25 Aug 2021 at 20:55, Marc-Andr=E9 Lureau
> > <marcandre.lureau@gmail.com> wrote:
> > > fdt_check_full was added in 1.4.7:
> > > https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tag/?h=3Dv1.4.7
> > >
> > > Only ubuntu appears to be lagging a bit behind. I wonder if they would
> > consider an update.
> >
> > I doubt it. You would need to wait until that actually falls off
> > our supported list. You also have a couple of years to wait until
> > Debian oldstable is no longer on our supported list.
> >
> > Maybe, I don't know why debian oldstable would have received a new vers=
ion
> plus fixes, and not ubuntu.
>=20
> It seems we could have our own fallback copy of fdt_check_full() though..
> I'll give that a try.

We could, but fdt_check_full() is actually a pretty complex function.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6j/nD3QvyS1wEwvn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEnBisACgkQbDjKyiDZ
s5KDTRAAy9XafNlVWpvuLCL/H7fPakqO6PycaR54/QaXfgE0vRwFG/4Bw5rZr3Ig
GOmPM6WJwhoAC9HsUEhDHz5qC7p7ZFtCiggdmGETQYddYLrk0LDOaTsHA+Sx/2Zf
qkcXqVH04I8j5NOwWYx0lkKpvgH3voTXKomeKSDhBcEZyLC/spFiLMhIdSDnp+Jc
FMPMxEXTx6AAZvF2lwZ2gKQMggKtf6xr3JaEq3HShljd2grGf/vuh3/E5hvcNZa2
eD26lXo6kXF9dyxJzpqepyTadfhsAB1ZPOjlWCtnKW8A6cigQhN68qHUoZU/Tv1i
TJB8Dvnw3LGGEbTRaNIry1H4pwX461PvYY0gA7MZ3pHBPK+wW4iV7Dmn/uXx2Bfw
lWYkhYj+r+xDk/cxtYZKSgMFi2Cs9Xg0+gFehOmxxvpQ1FvSxhw3AJqNam/IiGXv
gaogRatJkZUiEzZKJlpexB7xLFq+gobaa5tM5pQE4onNoAGrp5HMpt45XMkTXeLb
azTpLejDYNKjs/OUkRX1tfTiXjTwocjTSCHnM0wrhwxRwcmjogGfAMJQKgO0EZwP
X+zJBngV4vW6uJkzT6KC2F4569FBJjtu15Xi9rNg9XM1GuUMsQxJfiKIwhjaM+Rt
znJfynJlLFOOyOCh5MRdcAQi4YVgyBO7y/m53VAmmaIhKGlQ5c8=
=VPrd
-----END PGP SIGNATURE-----

--6j/nD3QvyS1wEwvn--

