Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CC23D0900
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 08:36:43 +0200 (CEST)
Received: from localhost ([::1]:35488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m65qU-0006Nr-Kf
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 02:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m65ne-0003c9-W3; Wed, 21 Jul 2021 02:33:47 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34773 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m65nb-0006q4-Hz; Wed, 21 Jul 2021 02:33:46 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GV5Pv6DKyz9sXb; Wed, 21 Jul 2021 16:33:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626849219;
 bh=chv527h7QGU8MrYgp6pApDntYCUsPp71Wk7aK6RM2OI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fp49iFOWL3h34dooCMs99NXGt3qGRGZ9tDDhYYuDfJOA86kIg944J8hlZRM3AbSSA
 Fnr8eTTKfpTZa2N6ggJcZqb5smK+jpOP5qg00827n8K1Xk3jybm4jTXiidiZcnqaRp
 IjrlGdoogW/ZiII4W2tVjnsElpFWH+yT1Z0cpGB8=
Date: Wed, 21 Jul 2021 16:23:17 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH for-6.2 v6 0/7] DEVICE_UNPLUG_ERROR QAPI event
Message-ID: <YPe9VWZCpmoRHfn0@yekko>
References: <20210719200827.1507276-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YxXseZ6L7GAUzkFk"
Content-Disposition: inline
In-Reply-To: <20210719200827.1507276-1-danielhb413@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: armbru@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--YxXseZ6L7GAUzkFk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 19, 2021 at 05:08:20PM -0300, Daniel Henrique Barboza wrote:
> Hi,
>=20
> This version was rebased with QEMU master @ 7457b407edd6e8555e4b4 and
> has a few simple changes based on Greg's review.

Tentatively applied to ppc-for-6.2.
>=20
> changes from v5:
> - patch 1:
>   * fixed function name in commit msg
> -patch 6:
>   * kept error message in a single line
> - all patches:
>   * added Greg's R-b
> - v5 link: https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg03239=
=2Ehtml
>=20
> changes from v4:
> - patch 1 (new):
>   * avoid emitting MEM_UNPLUG_ERROR when dev->id =3D=3D NULL in
> memory_hotplug.c
> - patch 2 (new):
>   * avoid emitting MEM_UNPLUG_ERROR when dev->id =3D=3D NULL in
> spapr.c
> - patch 3 (new):
>   * do not error_report() when drc->dev->id =3D=3D NULL
> - patch 4 (new):
>   * update DEVICE_DELETED API docs
> - patch 5 (former 1):
>   * added 2 spaces after each sentence
>   * appended "Some errors cannot be detected." in DEVICE_UNPLUG_ERROR
> docs
>   * changed release from 6.1 to 6.2 in docs
>   * changed DEVICE_UNPLUG_ERROR API to behave more like device_deleted
> - patches 6 and 7:
>   * changed to use the new DEVICE_UNPLUG_ERROR API
> - v4 link: https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg01355=
=2Ehtml
>=20
> changes from v3:
> - patch 1:
>   * fixed format
> - all patches:
>   * rebased with master
>   * added David's R-b
> - v3 link: https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg05842=
=2Ehtml
>=20
> changes from v2:
> - patch 1:
>   * moved DEVICE_UNPLUG_ERROR declaration to qapi/qdev.json
>   * updated 'device_del' description
>   * added 'deprecated' notice on MEM_UNPLUG_ERROR
>   * added MEM_UNPLUG_ERROR 'deprecated' info in docs/system/deprecated.rst
> - patch 2:
>   * send both MEM_UNPLUG_ERROR and DEVICE_UNPLUG_ERROR
> - patch 3 (new):
>   * send DEVICE_UNPLUG_ERROR in acpi/memory_hotplug.c
> - v2 link: https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg01304=
=2Ehtml
>=20
> changes from v1:
> - former patches 1 and 2: dropped
> - patch 1 (former 3): changed the version to '6.1'
> - patch 2 (former 4): add a DEVICE_UNPLUG_ERROR event in the device
>   unplug error path of CPUs and DIMMs
> - v1 link: https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg04682=
=2Ehtml
>=20
>=20
> Daniel Henrique Barboza (7):
>   hw/acpi/memory_hotplug.c: avoid sending MEM_UNPLUG_ERROR if dev->id is
>     NULL
>   spapr.c: avoid sending MEM_UNPLUG_ERROR if dev->id is NULL
>   spapr_drc.c: do not error_report() when drc->dev->id =3D=3D NULL
>   qapi/qdev.json: fix DEVICE_DELETED parameters doc
>   qapi/qdev.json: add DEVICE_UNPLUG_ERROR QAPI event
>   spapr: use DEVICE_UNPLUG_ERROR to report unplug errors
>   memory_hotplug.c: send DEVICE_UNPLUG_ERROR in
>     acpi_memory_hotplug_write()
>=20
>  docs/about/deprecated.rst | 10 ++++++++++
>  hw/acpi/memory_hotplug.c  | 19 +++++++++++++++++--
>  hw/ppc/spapr.c            | 17 +++++++++++++----
>  hw/ppc/spapr_drc.c        | 21 +++++++++++++++------
>  qapi/machine.json         |  6 +++++-
>  qapi/qdev.json            | 34 +++++++++++++++++++++++++++++++---
>  stubs/qdev.c              |  7 +++++++
>  7 files changed, 98 insertions(+), 16 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--YxXseZ6L7GAUzkFk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD3vVUACgkQbDjKyiDZ
s5Kx2xAAzLZ/YDWPKR8nHn/TMOZTkVO9+cz24liVSSpoo1BTwq16NWuw3jCmVYjz
4aorwgOu5YDLfHiVcSCwTWek7Raao89sCoDA3JHcOxNjBOygkIZnJd87lEyGSW1D
K0CJGcSil7R4LIMnrg9vl1sbwWWS4NlyYpCpCg6PA0VmcqqlYzbmRL9uyNLUn8Ws
O/Z2jtKH3a59dSo25z/EfDwM/aBAgONK4+RTRntqOWKDr7EagqI56fFe2P6LSisp
vH/2HgGzcii3x1PsLXtGGb9smQjFLoZobnyTP9xRJuoOyYwx/jHjcou2gCLLenM6
Un0zLyGYfl7HzMpcxicq1R1ukYlJnAhEk4gD2DNdHaxEzuAA9QzvM9ZoPWsl39p3
3GDT5mvNSyD/NO+4QyrH01nek4Z+VLXBh9HcYaYA1YpXtCPMyAOix958cZ0eFwfy
P5P4fh+LYU+tCuHQPHsOsAN9jUpBOMj3oH2S+sa6kCivWv1SbBnMtRJcsSgXVTsU
Ma95ruHIkmoXX62TRxVZO/Eo88OrDY6mR18+TD9CxIJzbnPTZZjqDgUg86NVO3WO
bvYuuqb1jeyF+QFN+hF7x4NKWBd6I30VLYpqZaAkp8UhV9pl+njFLmzovSSMyHXt
mFalg4iMcrYx+RhF/WOefHBJ7rsTFjBnm1Ph/VCv+2jRC6dOxNc=
=HOpH
-----END PGP SIGNATURE-----

--YxXseZ6L7GAUzkFk--

