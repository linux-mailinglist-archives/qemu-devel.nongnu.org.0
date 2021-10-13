Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8816E42B74D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 08:32:10 +0200 (CEST)
Received: from localhost ([::1]:52962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maXo9-0000is-Ep
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 02:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1maXix-0005Aw-6p; Wed, 13 Oct 2021 02:26:52 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:39841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1maXiu-0002zL-3K; Wed, 13 Oct 2021 02:26:46 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HTjGs5GV2z4xqX; Wed, 13 Oct 2021 17:26:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634106389;
 bh=W6lE8wEgUuJMWo/3jjZSAPk73IGaBHUfFPS0TgMhTc8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E5DVJ8jnRIncGURwz3gX09JSrkNuRJfyViNrYyit7N0LHASe/jHbMe+0YKFrEkMIx
 jQqxrbOttISLq1ayRIHPSs/jobDNlJCzM0OPg3zxyomc+yWaYRLBqq4C1ne9T9rxrd
 yaGmnwHZvAbCOEUeKnJk5e0oV7lvyPGdaNl4kF8U=
Date: Wed, 13 Oct 2021 17:20:20 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] tests/acceptance: Add tests for the ppc405 boards
Message-ID: <YWZ6pCmBpuIxnLZS@yekko>
References: <20211011125930.750217-1-thuth@redhat.com>
 <f25a7d3a-cc47-fc18-9c79-c80d4a300ff9@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ivOf3e5pdx3gplPU"
Content-Disposition: inline
In-Reply-To: <f25a7d3a-cc47-fc18-9c79-c80d4a300ff9@redhat.com>
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ivOf3e5pdx3gplPU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 11, 2021 at 03:22:17PM +0200, Philippe Mathieu-Daud=E9 wrote:
> On 10/11/21 14:59, Thomas Huth wrote:
> > Using the U-Boot firmware, we can check that at least the serial console
> > of the ppc405 boards is still usable.
> >=20
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >  Based-on: 20211006071140.565952-1-thuth@redhat.com
> >=20
> >  tests/acceptance/ppc_405.py | 40 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 40 insertions(+)
> >  create mode 100644 tests/acceptance/ppc_405.py
>=20
> > +    def test_ppc_taihu(self):
> > +        """
> > +        :avocado: tags=3Darch:ppc
> > +        :avocado: tags=3Dmachine:taihu
>=20
> Please consider adding:
>=20
>   tags=3Dcpu:405ep

I've merged this, adding this tag as suggested.

>=20
> > +        """
> > +        self.do_test_ppc405()
> > +
> > +    def test_ppc_ref405ep(self):
> > +        """
> > +        :avocado: tags=3Darch:ppc
> > +        :avocado: tags=3Dmachine:ref405ep
> > +        """
> > +        self.do_test_ppc405()
> >=20
>=20
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ivOf3e5pdx3gplPU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFmeqIACgkQbDjKyiDZ
s5LpUg/9HYJYMenjDHhkJDWvAhdDTFU6xherDmDRfdmyzhKOqkD/bVhfVum95lSy
FCCyrqdPa3PTk7Bxau/1nYRJ/f4aC/2vMBe+ueaCU0kQ/qfASZJv808wbghCrUKS
rUUA5TKuqYXBlWquQymcU589e6W+Ykx06g1IoHC37vz9LY9Qmyp8FfdSvGF11d8U
gxZysd8yrhmIvccOTZz51P/k7fbOMvRBa4Dyq4qWLqL68dKIyKHqiDuqOvukvBKr
4x3e0phgMtpY3ifCyDflS4hry7qMrzN01jq2wXNfsgVMRdZ557MknoCqq07/+8DW
evG8njArR4XI9NzDr5OCODqLokfqaTAM7ug1+6LYWkYQQl34Au9rW9Evwzrb/Qfx
rP6+w1DKnkpOHorgMKE6opcyZHkcgfOdj7/9xGcXqbUflV+xkbpVpde2Z5j5lCDn
onyqEiS+WfEzBa+cuwhTGIYAgkyfrJkXTT9ymHrK1jOL+kaZxNiElkKEFPwErQ/h
gQ7RJVmqXv8A4lTnQxZqmfg2hy6ON0XUnHN56xNQpYociS5zlbksOvJZMF152TKD
4Cnz+TlzX1GPc/1BQ+wPm4HoFWPpvAdnpIAbiwRjIxxDG/SyRUGD4fp3DGontYct
mngCxOPvpirgiawpjsEfO2PSJexLotYPsOv2l67iZiVjzCAiP2I=
=EM5h
-----END PGP SIGNATURE-----

--ivOf3e5pdx3gplPU--

