Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A01D418E60
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 06:34:57 +0200 (CEST)
Received: from localhost ([::1]:35424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUiLv-000570-O1
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 00:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mUiI4-0004DA-HT; Mon, 27 Sep 2021 00:30:56 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:33757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mUiI0-0002g8-Nz; Mon, 27 Sep 2021 00:30:56 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HHqSk0XcHz4xZx; Mon, 27 Sep 2021 14:30:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632717046;
 bh=V2Q336eJF1ThVAdTcfJp2sF2NXO61DMutKWZMldBIWQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jt66M1qC0MUxuvBCO1o9QNvy/Mima6RkJGIVQmN5vCEpKXjudqIuJZWK0kijLmtDE
 6PKROgT8sEl7AYaSOuRdTwLk5jGydzfbd8ZoFLPLA0MCH2RWfzrRUEYdIBdUUNLU/J
 MMvcN+tRWKluRjP4vr3iwkNIDu+FubKfQuQ2w+K4=
Date: Mon, 27 Sep 2021 14:26:49 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 0/5] Reduce load on ppc target maintainers
Message-ID: <YVFICT74xKATaOYQ@yekko>
References: <20210924095536.441849-1-david@gibson.dropbear.id.au>
 <b466a1f8-4459-b6f5-ad3e-51370231ec94@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AH15QrYpP+5GSKPC"
Content-Disposition: inline
In-Reply-To: <b466a1f8-4459-b6f5-ad3e-51370231ec94@amsat.org>
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
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
Cc: peter.maydell@linaro.org, dbarboza@redhat.com, aik@ozlabs.ru,
 mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--AH15QrYpP+5GSKPC
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 24, 2021 at 05:16:45PM +0200, Philippe Mathieu-Daud=E9 wrote:
65;6402;1c> On 9/24/21 11:55, David Gibson wrote:
> > Greg Kurz and myself have been co-maintainers for the ppc and ppc64
> > targets for some time now.  However, both our day job responsibilities
> > and interests are leading us towards other areas, so we have less time
> > to devote to this any more.
> >=20
> > Therefore, here's a bunch of updates to MAINTAINERS, intended to
> > reduce the load on us.  Mostly this is marking fairly obscure
> > platforms as orphaned (if someone wants to take over maintainership,
> > let me know ASAP).  Bigger changes may be coming, but we haven't
> > decided exactly what that's going to look like yet.
> >=20
> > Changes since v1:
> >   * Reworked how OpenPIC is listed
> >=20
> > David Gibson (5):
> >    MAINTAINERS: Orphan obscure ppc platforms
> >    MAINTAINERS: Remove David & Greg as reviewers for a number of boards
> >    MAINTAINERS: Remove David & Greg as reviewers/co-maintainers of
> >      powernv
> >    MAINTAINERS: Add information for OpenPIC
> >    MAINTAINERS: Demote sPAPR from "Supported" to "Maintained"
> >=20
> >   MAINTAINERS | 42 ++++++++++++++----------------------------
> >   1 file changed, 14 insertions(+), 28 deletions(-)
> >=20
>=20
> So after this series we still have:
>=20
> PowerPC TCG CPUs
> M: David Gibson <david@gibson.dropbear.id.au>
> M: Greg Kurz <groug@kaod.org>
> L: qemu-ppc@nongnu.org
> S: Maintained
> F: target/ppc/
> F: hw/ppc/
> F: include/hw/ppc/
> F: disas/ppc.c
> F: tests/acceptance/machine_ppc.py
>=20
> You might want to drop the *hw/ppc* lines which should
> be covered elsewhere now.

Good idea, I'll revise that.

> tests/acceptance/machine_ppc.py should be split in multiple
> files to ease the tests maintainance.

Also a good idea.

> Thanks for staying PPC/TCG maintainers :)

Uhhh... we're not.  I just haven't tackled that side of things yet to
reduce the number of spinning plates.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--AH15QrYpP+5GSKPC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFRSAYACgkQbDjKyiDZ
s5KmCg//XkmjFwCae425zm9iCRA1O8hF7+BH9j+KY6KkZJC4BX7Gks5FUZCpI6+R
jHSmMIi37Zk6Eg8cv4tTOI4Q7g1M/5kG+I8r7ZA2XQp7EE3oDYv+1vjsYgXn530b
/B6LnT1rkdiMa4DwM1J/ys0/JWigZ9aF7epj8eFZQaHRqjdWRyp1L69s5Q5xPKPu
T+VgCxuICt0W6GyA4Tv6tYk88TU0I+HX1nK0QNBteFgdimaDeQJeaoir+zbbTqke
mKEa5aNIPIwEfdC9wGydp+xQgbEM515vgQzTxTjcFbpsHJtjNwD1DwrrFw0FFZuQ
W2/rrvsqXKh7tB/gtrkyW9eF1kl3XUwMFKoGEIiCDaWOyBctLOGGM3bcAETE8VX7
jnyjpd4m7WQ+TJhcx6BIEVNql54cks4QWmq1oFi+lfZCIL50a8SnsxViZSz03k6N
1aWgXS2b70MjgG8MFt950vBNPtrlE4hYS6fludr3aOJZQPwRZerJPvvURPQxzsQn
mXFINjowaLowGyhSnmZziwKUQKsg35r4AlT37vs83k3Bj8KvsmZ7ays1/TEnu/gz
3wza5Gd/ifWikiZTSrFpjvGc37bzfcRoMxS6taK/es8Kmv2XysBjc7CBM4I4LJVO
t5pdkecOonv+ksaUgkRUM0vnLkfWXuTBi16m7uNzjM9USYxqRS4=
=V3SM
-----END PGP SIGNATURE-----

--AH15QrYpP+5GSKPC--

