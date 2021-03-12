Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B436338362
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 03:01:33 +0100 (CET)
Received: from localhost ([::1]:52532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKX7M-0008QF-KM
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 21:01:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lKX5h-0007HH-DE; Thu, 11 Mar 2021 20:59:49 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:47569 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lKX5e-0000hC-RH; Thu, 11 Mar 2021 20:59:49 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DxTXG2qNvz9sW4; Fri, 12 Mar 2021 12:59:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1615514382;
 bh=N2IeNV0Z2K7IhYb4HMte0cKNGa4cPWuSvoIfaK4zNdA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CGP8vk/6RaoB0WptiKgo3ncQIkj8wuP6MxYYpQuLF46D0Se5ZLxwg9Ra9lg3qpIyV
 qO9Ko3UalT9dEeHCAiSjYM98lF699XNCce7ZCX3nne/OgSK3oPVZ9IfcaNmkRO3j29
 FUbOJJjcQg0EoE8NrklEwC1MyVC2wiIxGggTGjuo=
Date: Fri, 12 Mar 2021 12:56:40 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 1/1] spapr.c: remove 'ibm,chip-id' from DT
Message-ID: <YErKWKtJ1x6oyXE/@yekko.fritz.box>
References: <20210311151557.705863-1-danielhb413@gmail.com>
 <20210311172954.26e2b10d@bahia.lan>
 <0bbe42b0-a17c-550c-2e0c-fa8514db355b@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cGoli8IRaik5OtZx"
Content-Disposition: inline
In-Reply-To: <0bbe42b0-a17c-550c-2e0c-fa8514db355b@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, clg@kaod.org, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--cGoli8IRaik5OtZx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 03:22:39PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 3/11/21 1:29 PM, Greg Kurz wrote:
> > On Thu, 11 Mar 2021 12:15:57 -0300
> > Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> >=20
> > > The attribute 'ibm,chip-id' does not exist in PAPR. This alone would =
be
> > > enough reason to remove it from the spapr DT, but before doing that,
> > > let's give a brief context on how and why it was introduced.
> > >=20
> > > 'ibm,chip-id' was added in the spapr DT by commit 10582ff83279. This
> > > commit references kernel commit 256f2d4b463d ("powerpc: Use ibm, chip=
-id
> > > property to compute cpu_core_mask if available"). In this kernel comm=
it,
> > > the 'ibm,chip-id' DT attribute is being used to calculate the
> > > cpu_core_mask in traverse_siblings_chip_id(). This function still need
> > > to consider 'ibm,chip-id' not being available as well to avoid breaki=
ng
> > > older guests.
> > >=20
> > > Later on, kernel commit df52f6714071 ("powerpc/smp: Rework CPU topolo=
gy
> > > construction") removed traverse_siblings_chip_id() and its callers,
> > > making the CPU topology calculation independent of the 'ibm,chip-id'
> > > attribute. Today, the kernel uses 'ibm,chip-id' for PowerNV related c=
ode
> > > only - the pseries kernel does not rely on it.
> > >=20
> >=20
> > Thanks for the archaeology ! So this means that the pseries kernel used
> > to rely on it up to kernel v4.14, right ?
>=20
>=20
> The pseries kernel up to 4.14 used to consider the existence of 'ibm,chip=
-id',
> but it also had an error path for its absence as well.
>=20
> >=20
> > > All that said, since it's not in PAPR and the pseries kernel does not
> > > rely on it, let's remove ibm,chip-id from the DT.
> > >=20
> >=20
> > Even if it isn't part of PAPR, this is something that we've been
> > exposing to guests with existing machine types and someone could
> > have found a use for it or still using a pre-4.14 kernel, e.g.
> > debian stretch still relies on 4.9.
>=20
> I understand that it's generally not cool to change guest visible informa=
tion.
>=20
> If we want to be on the safe, I can send a v2 where this change if effect=
ive only
> on pseries-6.0.0 and newer.

Yes, we should do that.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--cGoli8IRaik5OtZx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBKylYACgkQbDjKyiDZ
s5JeBg//akTwB1OQ7I/7K/3R3tepMIr+rcE3p1RrIWn9mMTpr/cpR//mD57OfguI
0SOMiyb5L4cGgdHuPwRD485aatuHyQgYFPyRgpzDpg+dmx97VYxQxs1cFEeWtyhC
AOhg/cvzwhnq23R76TNI/xcOReI02jeY/7jYpbFu/qQFm3dMOOEIvbeuEB4N4mn/
hh6bZM6CnfezOExo898ec5ztKafhz0oqu2NphYIYBOY9zF97XSGoACeyTqa9EsXF
NKYqRwThm1gh0/dDqYUbeeQnl703jT3dVud4hULrgOh+O4fVpaYPZrVqYPJkEusm
QUqV5Pam3nK1Hvq503KyxAq8kP21LPX9NPFQzaCB2c2YS+xkgVZuORL8it3SexdO
1sGt1ZIelXU+5NQONCOqpgWFI2L+xRAfYhuuTU+Y8WbzZ4LhwI/pUyvpRzEcbVBp
75ZlTWbYS9mMvtVqnoDIgSin05ZUl8whTXgjmJdg/RPvE2dMpoYwCfRERZBSfQPl
RNSkJQ/ajdj0+Wuo+/YyAgKCyU2JTL0O1nMmqz4eP8uztiVOFYCB5MNbqDbe575R
SNamf4N8NbUuuBo6hJOsoU5cpI4azhp7ZTeI/dA/4ZgC28nWJ0+ckiW31apjLmvX
Xgvxg2nrZMCOeV8x4kX1PmOG113dTAYVGb5VDOfgRplnZyCo0eE=
=YvEF
-----END PGP SIGNATURE-----

--cGoli8IRaik5OtZx--

