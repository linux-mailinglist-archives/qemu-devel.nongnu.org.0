Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6056C34BC80
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 15:28:03 +0200 (CEST)
Received: from localhost ([::1]:43934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQVST-0005bd-Vj
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 09:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lQVQp-0004r9-Me; Sun, 28 Mar 2021 09:26:19 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:53563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lQVQe-0002Ss-4t; Sun, 28 Mar 2021 09:26:17 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F7c0Z3jnkz9sVt; Mon, 29 Mar 2021 00:25:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616937950;
 bh=rLs9BCZbae80jcv0xjio7eL5HK1KVmCoHgcUYULq9p0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HvvPJuBhcqmk+19GGq4FPB5r4GOUnV3km8wqXm9sGM9PPWaoNOmxv9jRLo4ObWPs2
 V3kNg3TWSlezfCUzpXoPezgE0jWSeEBejE3+nwdjnovSLpjGR60nWt6VGJIohUe4k7
 /n6l/x2RRssW8OshtqOtePbsRsubBeOOuY5wzwfI=
Date: Mon, 29 Mar 2021 00:09:51 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 10/10] target/ppc: Validate hflags with CONFIG_DEBUG_TCG
Message-ID: <YGCAHzQ//dyTyUku@yekko.fritz.box>
References: <20210323184340.619757-1-richard.henderson@linaro.org>
 <20210323184340.619757-11-richard.henderson@linaro.org>
 <YFqD5JOVEXVFv9Tr@yekko.fritz.box>
 <YFxONrbZarGMH34O@yekko.fritz.box>
 <0ea867e5-e2f5-954f-a07d-5a71090985e3@linaro.org>
 <4c323791-02c4-4ad3-be58-3472ed23e21c@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rGXq24hya0bKzOHH"
Content-Disposition: inline
In-Reply-To: <4c323791-02c4-4ad3-be58-3472ed23e21c@linaro.org>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--rGXq24hya0bKzOHH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 27, 2021 at 06:46:15AM -0600, Richard Henderson wrote:
> On 3/26/21 6:41 AM, Richard Henderson wrote:
> > On 3/25/21 2:47 AM, David Gibson wrote:
> > > On Wed, Mar 24, 2021 at 11:12:20AM +1100, David Gibson wrote:
> > > > On Tue, Mar 23, 2021 at 12:43:40PM -0600, Richard Henderson wrote:
> > > > > Verify that hflags was updated correctly whenever we change
> > > > > cpu state that is used by hflags.
> > > > >=20
> > > > > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > > >=20
> > > > Applied to ppc-for-6.0, thanks.
> > >=20
> > > Alas, this appears to cause a failure in the 'build-user' test on
> > > gitlab CI :(.=A0 I haven't managed to reproduce it locally, so I'm not
> > > sure what's going on.
> >=20
> > I guess you mean e.g.
> >=20
> > https://gitlab.com/dgibson/qemu/-/jobs/1126364147

Yes, sorry I meant to give you a link.

> >=20
> > ?=A0 I'll have a look.
>=20
> I haven't been able to repo locally, or on gitlab:
>=20
> https://gitlab.com/rth7680/qemu/-/pipelines/277073704

Huh..

> Have you tried simply re-running that job?

Several times :/

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rGXq24hya0bKzOHH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBggB0ACgkQbDjKyiDZ
s5JQsg//SzJ+1TOOsTfvAO8CZWaHvTC6NMrtTtToolESAQWOnO5kJN5OlYrQKm3G
DwnYSxrWBkch/Fgg9bk8oe79DzsHTipdvoRv4nGuADqoSMIneCH94nAC3xT+FQyR
aB4PbvDkAovNH6gX7x3KYGIF6P19vFb+tXVItl9bpjwHfeZ54oqiAiEqwsoBieoz
XPa+RrHPju5JOfqFsnZZmh7zuDbb3PyhAaX0wkGf26gZKfwO+TxT/jDY/fMLPCrX
nfnLrzcu0r4QwbW9RpCxMXd6goYlPxDYiD6oyBuM/nPxzym/4jfAbb/flp13Rxrc
qGhPeMat+nIVsmb6AtKYV8NyE2Jwchy7nTcekwlC3J8uATrAIHWYTrsTrd4+r/BD
w4sjuqi+Ahmro4Jezr4X/XfYaOTZYGXscaykQhSdopLiSdRnYfD2PeKwTQyxVetR
YCaxtf0IG2KTRaGyzHGgan4kFVbBx1HiCJzN6j9SyKeggtVE8Wc/PuWH6H0xVGru
5b3XhxQQfrzCPRi30jxrtAREdvXV2gcBrwP2AzjA5C5Hcjg4SasnUU+JTqwU+1FA
rHqtcuVSuw4sTAX/v5GOw7S61MlRZYQmgOkpmGouPCpek/DBDgGbgxIxKx38c43E
cjMh5dKja0CplUFFBEuuiIhAA5EcIALrQIpFmkYERzjmYk0/238=
=CZeb
-----END PGP SIGNATURE-----

--rGXq24hya0bKzOHH--

