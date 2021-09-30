Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E407C41D0ED
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 03:22:49 +0200 (CEST)
Received: from localhost ([::1]:52030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVkme-00056y-BG
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 21:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVkjC-00049l-BD; Wed, 29 Sep 2021 21:19:15 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:46599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVkj6-00044T-QX; Wed, 29 Sep 2021 21:19:14 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKb3y6q4pz4xbL; Thu, 30 Sep 2021 11:18:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632964734;
 bh=SKD5slPbWY4lKaF3ODSGtiitdWB0KQCFsPbWg9KpzcQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DXDnYCJFm3htQ1utJL5BOCNpzSUK7qxJCT7DaiJ/lWYuUhB/7cvrWEb5CA6MT2wMX
 /0rzq97G53wAAXE6KRuWLN1thtE4v2ANIMfJrOA3Jkt+wKXSkL5PkZuA7bv3EaZhKX
 dMOadwR/XZUL9AlRLuJpbdTLJOW4hO5fncbfvN0A=
Date: Thu, 30 Sep 2021 11:15:26 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH v3 0/7] Reduce load on ppc target maintainers
Message-ID: <YVUPrnvWT80f7IxR@yekko>
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Re6+eGJxBZo9vC7o"
Content-Disposition: inline
In-Reply-To: <20210927044808.73391-1-david@gibson.dropbear.id.au>
Received-SPF: pass client-ip=150.107.74.76;
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
Cc: peter.maydell@linaro.org, dbarboza@redhat.com, aik@ozlabs.ru,
 mark.cave-ayland@ilande.co.uk, groug@kaod.org, wainersm@redhat.com,
 hpoussin@reactos.org, clg@kaod.org, crosa@redhat.com,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Re6+eGJxBZo9vC7o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 27, 2021 at 02:48:01PM +1000, David Gibson wrote:
> Greg Kurz and myself have been co-maintainers for the ppc and ppc64
> targets for some time now.  However, both our day job responsibilities
> and interests are leading us towards other areas, so we have less time
> to devote to this any more.
>=20
> Therefore, here's a bunch of updates to MAINTAINERS, intended to
> reduce the load on us.  Mostly this is marking fairly obscure
> platforms as orphaned (if someone wants to take over maintainership,
> let me know ASAP).  Bigger changes may be coming, but we haven't
> decided exactly what that's going to look like yet.

Thanks for the feedback and acks on this.  I'm now merging v3 into
ppc-for-6.2 to go into a pull request shortly.

>=20
> Changes since v2:
>  * Clarified overly broad TCG CPUs entry
> Changes since v1:
>  * Reworked how OpenPIC is listed
>=20
> David Gibson (7):
>   qemu: Split machine_ppc.py acceptance tests
>   MAINTAINERS: Remove machine specific files from ppc TCG CPUs entry
>   MAINTAINERS: Remove David & Greg as reviewers for a number of boards
>   MAINTAINERS: Orphan obscure ppc platforms
>   MAINTAINERS: Remove David & Greg as reviewers/co-maintainers of
>     powernv
>   MAINTAINERS: Add information for OpenPIC
>   MAINTAINERS: Demote sPAPR from "Supported" to "Maintained"
>=20
>  MAINTAINERS                          | 51 ++++++++------------
>  tests/acceptance/machine_ppc.py      | 69 ----------------------------
>  tests/acceptance/ppc_mpc8544ds.py    | 32 +++++++++++++
>  tests/acceptance/ppc_pseries.py      | 35 ++++++++++++++
>  tests/acceptance/ppc_virtex_ml507.py | 34 ++++++++++++++
>  5 files changed, 121 insertions(+), 100 deletions(-)
>  delete mode 100644 tests/acceptance/machine_ppc.py
>  create mode 100644 tests/acceptance/ppc_mpc8544ds.py
>  create mode 100644 tests/acceptance/ppc_pseries.py
>  create mode 100644 tests/acceptance/ppc_virtex_ml507.py
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Re6+eGJxBZo9vC7o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFVD60ACgkQbDjKyiDZ
s5K4dA//XK3rxHJAV6Tv72Qz0kHsFG1UssanxVaWlcCSjXoNT39xeCWlJhmFzcIk
RYYhJBREih9Xc4RWfovirOvdeZsaN47VAFKWDPaEc5C3o1gxHK4spj0huX5KnCg7
U6cHep2RSJFwS82muEVoa3+1ABTtSOdhnq4uvz0g7QMNLSnNuCx/sfZRx4jChDNK
SCoi1Ke7cpVw+VJ4/TBqHaZs5E3Kirrpd10ukWReMPDxqZo/fYnj7iUPWQOZUtsK
QHxftYdAMqqRgfyCOJrbXXZJu1fJzWbXF03VLbLgO6WFsQaRlUr9eCIaQ/Kmss6r
QIZbeV9sRGOUiiTQpKk/qoYimmy8MayF6LX1+CB95e70T3E7ceJ22NrEsi5Rn4jH
1xWdwqUYFErywzyLQK8eJT+loI/aRrQR9pEUKn5ai20v/rVWvjweyXpAXLBR8fb8
bJI3ba0a9Q0TPOVtb4dd/NYdPMxFk/XpBRJmpbDvI2vuGwYa8vXPaMvQKCz6LfGe
ZlH23dWP0+yzRA4x9oey1rBB8ETtnf/pOE1nMV74mUXUL+2Ku2z0SPfsDhmgRHbn
aFiU9HQY2LUTErNZt2uI+19vIKXZDKMUNSPYReUwCkIaJc2UiQgg0B1d0b5Womm+
M6u7n7bw9j1OGdNJRLvIuM1HGAxYVaaYAg6VObUGQj0TLSgEXjg=
=/dHt
-----END PGP SIGNATURE-----

--Re6+eGJxBZo9vC7o--

