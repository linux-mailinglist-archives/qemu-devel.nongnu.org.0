Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12919320492
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 10:08:00 +0100 (CET)
Received: from localhost ([::1]:59646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDOF4-0006BL-S0
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 04:07:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lDOE1-0005jh-Oz; Sat, 20 Feb 2021 04:06:53 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:53581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lDODy-0002Zp-HX; Sat, 20 Feb 2021 04:06:53 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DjMy56WD2z9sVt; Sat, 20 Feb 2021 20:06:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1613811997;
 bh=qhUv4V/sd9vJvPXCL6LhQFfI+ToUjFZ6hUJFv/TvJZ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jP3H4orkRmJcY2FduEgBvDwKkj/KoPmz3C+oRkSLgewlp6WBqSV239AC+g8YyQXua
 /1dT6duok1XubKvlNCvrxNJOklbg7WR/ye7d9+jIHDFrvBDovsbA8ADjnEu/WzIOiB
 j10b+nkkNNgb5abLv5y7Y+Q+PBwZYi5y36tcEJfQ=
Date: Sat, 20 Feb 2021 19:19:36 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: who's using the ozlabs patchwork install for QEMU patches ?
Message-ID: <YDDGGBfC4K62AtM7@yekko.fritz.box>
References: <CAFEAcA8h8QVoGsfJCLTYnbk3yzmrtphsWdSsDUrgQkB=vGh3zw@mail.gmail.com>
 <99af17f9-10cf-7c9b-8222-2318b464f5b0@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qXKHJWRe/RNSK7HK"
Content-Disposition: inline
In-Reply-To: <99af17f9-10cf-7c9b-8222-2318b464f5b0@redhat.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Peter Maydell <peter.maydell@linaro.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--qXKHJWRe/RNSK7HK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 19, 2021 at 05:51:02PM +0100, Thomas Huth wrote:
> On 19/02/2021 17.26, Peter Maydell wrote:
> > Does anybody use the ozlabs patchwork install for QEMU patches,
> > either occasionally or on a regular basis ?
> > http://patchwork.ozlabs.org/project/qemu-devel/list/
> > The admins for that system are trying to identify which of
> > the various projects are really using their patchwork instances,
> > so I figured I'd do a quick survey here. We don't use it
> > as an official project tool but it's certainly possible to
> > use it as an individual developer in one way or another.
>=20
> I think it might be used by some of the ppc hackers ... so CC:-ing to
> qemu-pcc ...

Well, I'm not.  TBH, I've never got the hang of patchwork.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--qXKHJWRe/RNSK7HK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAwxhYACgkQbDjKyiDZ
s5KXRxAAikCNZx/N2Fp1vvRPDJVz5zwOZAjmY8JdB1Dd891Hlq60KJ/52qFLOuYK
Ji9BnmCISrd7mF31siSbO5x3EEMluWmFHR+orwz8SMQyhAngbE7hHxORvcqS8+S0
pPHLFAgghir7xs5Eg8Ku3NRLosGsER0Av5v5jLVMOyX4wkr/dSwdxrlaoFLT8OCx
uRBBJRgHHefVpiM2cNfqrkSxZ119JlrKvSoXsbDaQmzS7bu/ufoJTkukeppLCrj4
5LK2gv4SrhtzW43YBM7hl00ysuKN6jov6xW5ikNSjgv3nZcAnBGsnpzu4KPjNFMG
oJnx54keh7fbDW09nHyD8W0uam7bmxx3oP7TO+BhtxM8D3qLEh/raG/At3qafa6N
ULHoUkTjdMtVpesAUMOxKB62GFJadaSAE6Xct7r8KPKwGmoGmNQ3qZo8AqIXWjQE
gsrPVXwrBfboeURgphqgo60YmdzAyGBNy/9jloafcK9qAE3qpnW2re2JnG1APqvx
xBW7LoYY2E82JO8Dl5qZ8BpmWLakfqtaFPyAaSqMNKVvmQ3okVqsvKswDnXExFgI
vu7gr9Qw7waCjIBIg6Cf7ljF+3yNiLlrugOSCRrw3wLDCdqpYlxvT0oEnRnaUyh3
sNYlYN5PSiu6+jgXHP4Gl4XWmqRsJwGpaxkHwOxHfmT9ZQDkdSQ=
=q/z7
-----END PGP SIGNATURE-----

--qXKHJWRe/RNSK7HK--

