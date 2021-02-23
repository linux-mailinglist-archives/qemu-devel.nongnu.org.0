Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6607832247D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 04:09:34 +0100 (CET)
Received: from localhost ([::1]:44474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEO4r-00081M-5H
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 22:09:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lEO38-0006EW-6t; Mon, 22 Feb 2021 22:07:46 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:37435 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lEO36-0003Dw-As; Mon, 22 Feb 2021 22:07:45 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Dl3rT3JXjz9sW2; Tue, 23 Feb 2021 14:07:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1614049657;
 bh=DTTafehZ9QShz/ECaP+6MNbQIIdib0s6y8l3kuPRdTM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gkNt8IwLo74sNsmMvkGOt48UW3x2oERx/+i1TOWD/ZxM7712REBbDVmZF4gEm4KQc
 Io8fnwNnkXml0HGu+VpYGkLdvHEP+lf35IvmYOHn63hO6m9wEQR9TLb0mTEZBZF9ia
 dPmhXnWJ7ETdQqiWuYhAmBcbXbyDwGfx4Ih/t0CQ=
Date: Tue, 23 Feb 2021 11:28:23 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] docs/system: Extend PPC section
Message-ID: <YDRMJ2CjTb+3L20p@yekko.fritz.box>
References: <20210222133956.156001-1-clg@kaod.org>
 <20210222150441.50bc423a@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RMErYMenB6KLSv/N"
Content-Disposition: inline
In-Reply-To: <20210222150441.50bc423a@bahia.lan>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org,
 programmingkidx@gmail.com, qemu-ppc@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, lagarcia@br.ibm.com,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--RMErYMenB6KLSv/N
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2021 at 03:04:41PM +0100, Greg Kurz wrote:
> On Mon, 22 Feb 2021 14:39:56 +0100
> C=E9dric Le Goater <clg@kaod.org> wrote:
>=20
> > This moves the current documentation in files specific to each
> > platform family. PowerNV machine is updated, the other machines need
> > to be done.
> >=20
> > Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> > ---
>=20
> Looks pretty good to me. Just one small nit in docs/system/target-ppc.rst.
>=20
> Reviewed-by: Greg Kurz <groug@kaod.org>

Applied to ppc-for-6.0...

[snip]

> > -QEMU emulates the following PowerMac peripherals:
> > +you can get a complete list by running ``qemu-system-ppc64 --machine
>=20
> Usual capitalization rules call for s/you/You .

=2E. and I corrected that inline.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--RMErYMenB6KLSv/N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmA0TCYACgkQbDjKyiDZ
s5KKEg/+NjgpNcWPEXEi7uuFQgV5UHMDeemrEh24XAJya8X+Thv1j9+nmJ4Et2T4
cXdmRiHSHabtgFDnVOTsyMFfPug4kJJs/JAeS2HR6FvK0MxHOPHYx8s7pXz2HN8G
2Bl7WUYtLKGNteXn91USE2k/ayy1vQLh6DCsS78UtZgL/+P645K4OeltMlGQJti2
79CaYhXAv0N9g21/CbvC3RLsaaQ+1aFkI7ZFgwVJE0lgs/azTUn1M+i1oZCgWAvE
Pc13XnpTJqIgRCzvMz9JPCu0VJLibitrQ941fgFIdaPNYdyNP7JFCMetwkDOenQX
rZyiTqZmdCvHsKBI0iHWmzVt4Qoq29+nti1GS7RLf/VtEwcDwWq2XN2PrwvWm2PY
jljiYy9Qz1WTPbd/RSlvQQWIx0/+6tig2VSyR6AqtK54KDe8l6zOVoPni174ia4N
f9YTzch9ChtHdtpCS1Ow9sU0E/AZfalFJfJjHz0ImYLxCyEMRbuDAcQEjsTChPmn
inA1af5MAN07xqaZ0lJd73rTZ4Ydm6P6f9XxkwzlzpTY2tuqz6b7T5fgvFfiFV+j
a7JbkGuadY6bNYg4BJ14lvI6KxIGXfS1rSBpfJayldrq+b9FWNq0sikjTPz7E37u
O+CPn3j7RNp9SBxBBG51+mjwXg7R++oPMvZhMtJW4leYA8VEICo=
=sznM
-----END PGP SIGNATURE-----

--RMErYMenB6KLSv/N--

