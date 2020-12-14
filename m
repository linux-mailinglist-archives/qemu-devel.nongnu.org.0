Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C57F2D9294
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 06:24:33 +0100 (CET)
Received: from localhost ([::1]:40348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kogLY-0007wO-7K
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 00:24:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofx0-000656-SL; Sun, 13 Dec 2020 23:59:10 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:59227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwy-0004wW-VD; Sun, 13 Dec 2020 23:59:10 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CvTg66b0Bz9sWw; Mon, 14 Dec 2020 15:58:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607921906;
 bh=hWoqKq0OnrmSRq6Pp+C0Kizpc+2N6IE0FLu7tzlzA1A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kM3OdhiaYYwes/CoLQYt9gqnUNRiRiwngawuVuURjqfGbrQEhloajG6cciEJvDfqr
 XDHvBr70QVSJSZC4Cdz4BFbHZsJhaiuc18KdJuiokxr14dMrwk7WN0SD3xpy3ZXQj2
 bl3AILDsLrDTMUD+ixnf2ypsMs6QTcTSUSPhUkm0=
Date: Mon, 14 Dec 2020 15:58:19 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/30] ppc-for-6.0 queue 20201211
Message-ID: <20201214045819.GA4717@yekko.fritz.box>
References: <20201211041507.425378-1-david@gibson.dropbear.id.au>
 <442b503f-1bd5-4fef-254d-d57c5d7b57be@redhat.com>
 <CAFEAcA80wPxky=SdOzc1yAKa+JNbceO8zvmWWWqcwyuSE=qNKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline
In-Reply-To: <CAFEAcA80wPxky=SdOzc1yAKa+JNbceO8zvmWWWqcwyuSE=qNKA@mail.gmail.com>
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
Cc: Giuseppe Musacchio <thatlemon@gmail.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 11, 2020 at 12:48:05PM +0000, Peter Maydell wrote:
> On Fri, 11 Dec 2020 at 12:35, Philippe Mathieu-Daud=E9 <philmd@redhat.com=
> wrote:
> >
> > On 12/11/20 5:14 AM, David Gibson wrote:
> > > LemonBoy (5):
> > >       ppc/translate: Fix unordered f64/f128 comparisons
> > >       ppc/translate: Turn the helper macros into functions
> > >       ppc/translate: Delay NaN checking after comparison
> > >       ppc/translate: Raise exceptions after setting the cc
> > >       ppc/translate: Rewrite gen_lxvdsx to use gvec primitives
> >
> > I was surprised by that author and went to check the wiki
> > https://wiki.qemu.org/Contribute/SubmitAPatch#Patch_emails_must_include=
_a_Signed-off-by:_line
> >
> >   Please use your real name to sign a patch (not an alias or acronym).
> >   If you wrote the patch, make sure your "From:" and "Signed-off-by:"
> >   lines use the same spelling.
> >
> > The patches are signed with Giuseppe real name, so this is OK.
> > Author can be fixed up later in .mailmap.
>=20
> Well, it could be, but since we've caught this before the pullreq
> has been merged into master we might as well fix up the From
> lines in the commits directly. David, would you mind doing that
> and resending?

Done.

>=20
> Thanks for the catch, Philippe.
>=20
> thanks
> -- PMM
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/W8OoACgkQbDjKyiDZ
s5J3MBAAoqGswpDaj6wPgbbzNk3CjPb6H+rQEfVLe2vPh6n8QDHPG90yrHPdxun4
yNxdNj/X0uWeOMankzlSYLJaALfp2cRG98Ws2ae58+fGSI3qoR1yXcemotqXW5eC
jyheoyyBT2oOuD4KsxvcrgB5gA7nnLF/+vzwQrnu7V/Bp/NRlmKelXnk1NE8Gj2V
dFC0I2YY9YjHOKh+qimVRG3B7YE0d9Pjv3Bx8+QIQNPimBc6SE+9NFjw4GRXi274
uV10bPpxhU5KObiTyqj94R/xw7k3VpXeM0G23HawRmb8NewgGUVccaoqvajykHpM
lBHoOcwuujkR1L363qqz/ee+fvdMRo+usmHB+EnGzsrhEouy0otScCUwOs5gxVp1
m1g8P3ToYSsRiz9FFmqf02vOu8VbjqK9fDn776QjlhbeCB+NfoNmwgrPxzKQs2a0
X6OVL9SaEhTkdOC7szPbcQG7xW2oWkB49pDFGNjfBD7oTAZnTd3RQKyeaSoDCLTn
aeGa8kFB7MD/wxK8hHU2WUlY05LChx97ivqz/75VCJcRiv7FAbVhweKsKGDUNpf5
SUCndjN8lYHnch/Zc36wqpTeUv11riQ+bDdhz7bSjVrEVIL8PvSCPzYbjNyJCaEB
Nvr7c7z1N33WMHhulhRVu0sM9CHEp/xrd4KvKtnk/GtfCW9F3tc=
=ghtY
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--

