Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5448A3E8AAA
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 08:59:29 +0200 (CEST)
Received: from localhost ([::1]:45600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDiD2-0002ns-Bz
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 02:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDi0k-0006FG-4f; Wed, 11 Aug 2021 02:46:46 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:46141 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDi0g-0002S5-7R; Wed, 11 Aug 2021 02:46:45 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Gl0j540Sxz9sWc; Wed, 11 Aug 2021 16:46:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628664393;
 bh=WEBacQfk0P1TpdF71WmrA06cBD5EBwhLWtCC9ppgeZ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JsZr3uIKYnD7tIMfzHiSO0SOwSPXrlUq7ZX1E9w107gdySRYk9tyi9SbsHqlWehBr
 b9Qz3CEMqT5Fd5ACZSf9CY/MejYUfOc4reN5n1mncuk+2NNmm7vGJUwetVP41OlUU6
 HoQhWrrCm1JfxkKMiqGh1dS08dl6ocYm0sDsZtB0=
Date: Wed, 11 Aug 2021 13:37:28 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 18/19] target/ppc/pmu_book3s_helper.c: add PM_CMPLU_STALL
 mock events
Message-ID: <YRNF+PyU22DNatBa@yekko>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-19-danielhb413@gmail.com>
 <YRH96w0+vMRHob7w@yekko>
 <79d98671-0da4-bc89-aa7d-a6778e0af4da@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+7CkGsoqNbZAxdau"
Content-Disposition: inline
In-Reply-To: <79d98671-0da4-bc89-aa7d-a6778e0af4da@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
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
Cc: gustavo.romero@linaro.org, clg@kaod.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--+7CkGsoqNbZAxdau
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 10, 2021 at 04:48:59PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 8/10/21 1:17 AM, David Gibson wrote:
> > On Mon, Aug 09, 2021 at 10:10:56AM -0300, Daniel Henrique Barboza wrote:
> > > EBB powerpc kernel test 'multi_counter_test' uses PM_CMPLU_STALL even=
ts
> > > that we do not support. These events are related to CPU stalled/wasted
> > > cycles while waiting for resources, cache misses and so on.
> > >=20
> > > Unlike the 0xFA event added previously, there's no available equivale=
nt
> > > for us to use, and at this moment we can't sample those events as wel=
l.
> > > What we can do is mock those events as if we were calculating them.
> > >=20
> > > This patch implements PM_CMPLU_STALL, PM_CMPLU_STALL_FXU,
> > > PM_CMPLU_STALL_OTHER_CMPL and PM_CMPLU_STALL_THRD mock events by givi=
ng
> > > them a fixed amount of the total elapsed cycles.
> > >=20
> > > The chosen sample values for these events (25% of total cycles for
> > > PM_CMPLU_STALL and 5% for the other three) were chosen at random and =
has
> > > no intention of being truthful with what a real PowerPC hardware would
> > > give us. Our intention here is to make 'multi_counter_test' EBB test
> > > pass.
> >=20
> > Hmm.  I guess these mock values make sense for getting the kernel
> > tests to pass, but I'm not sure if it's a good idea in general.  Would
> > we be better off just reporting 0 always - that would be a strong hint
> > to someone attempting to analyze results that something is fishy (in
> > this case that they don't actually have a real CPU).
>=20
> We can drop this patch and I'll add a note in the docs that the EBB kernel
> test 'multi_counter_test' fails because the PMU does not implement STALL
> events.

Sounds good for now.  We can reconsider this if we have a specific
justification for it.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+7CkGsoqNbZAxdau
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmETRfgACgkQbDjKyiDZ
s5JyQxAAxS3IfDlP6z1fAgUWjIdQiRj1TD0EQqzPQkEIOPVFclz8Hx8RKeRhsYbd
KDmQ+WpLmCIIyCI6KAp3Pg6JSI82TOmci/FEZT4IEotaAE53voRsCAJ4NslWnO9q
OeLyNFO+TQ7Q7foegp6oAG/WQSDDSCO717P4z887fDhYDCXwW1Chxh4y25RU3Sww
zQHbzAPdTYkke7WVT8UuVugCWsp9BQMfjrdyx+JNlIIslKS/AAi9RuxgYbvrlIaN
VKLadaMarMUTyQNSHeu0W+EO0NC6kMZ34/l77mOHTT6t8LluLLgDyalJdo9gSnrf
PxxyDzRoB0ExPeeGPxWjyi0i6bjC186iJO1D/KDSfsKj6pcaRRcHVQMH7BoaaGI/
AQ+mRz7bgEFFd8d6YKhPKhj3g3cCUe266j/6UbvFOlxSGHVqRahyprDS4+w2Lpn7
4a2rNG5pthTqKIod60/oiCl07/Mau9X37u9kIK6xDsummmMwTQgIlpFTh4OZzo3b
U5emiLM9feXXpce89om95FhSsC9swfhRc/QYhENnc5llBdhlezbtcurhSKM1Yp2O
EImgc6XbrcBpXHi6YecmO6AC0oXjuFbhydWgezG64+uQ9L3RdQrrPXjuCEuMCwra
oUq+qZAU+PLV43xKBRKNEVnPe7DFnlEsQUcbyc/QzCP1kRexM5M=
=PVfo
-----END PGP SIGNATURE-----

--+7CkGsoqNbZAxdau--

