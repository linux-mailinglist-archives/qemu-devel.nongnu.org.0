Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2912136187B
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 06:00:10 +0200 (CEST)
Received: from localhost ([::1]:38380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXFeL-0002S0-8a
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 00:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lXFdC-0001e5-Ou; Thu, 15 Apr 2021 23:58:58 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42033 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lXFdA-0002jS-Jf; Thu, 15 Apr 2021 23:58:58 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FM2WW6ljmz9sWK; Fri, 16 Apr 2021 13:58:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618545527;
 bh=7vQiY2t/xEt2dVnlZGQ57p0yvaAVFvzZ7z85miLJuoQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=inZAxbrbm7YzBR71Cqr9aPP2msSAvJ1z/o8a1tSZ9Ql2w/fVs59Rma+yPriA2Y2Q6
 crjBeE0w2vQpWXl4d3joTSWUocDmlVWuByYxMqV/NbQ708LXOtO9EgubndD+kZFHZd
 bmA00tr5Mi4vKGcCoJvUXl/gOxMPx1wSrzCIo4cg=
Date: Fri, 16 Apr 2021 13:52:07 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [RFC PATCH 0/3] tests/tcg/ppc64le: paddi tests
Message-ID: <YHkJ52c/ysoS00qk@yekko.fritz.box>
References: <20210415214138.563795-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PWsxE9i/vAnRpZ5c"
Content-Disposition: inline
In-Reply-To: <20210415214138.563795-1-matheus.ferst@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: thuth@redhat.com, gustavo.romero@protonmail.com, qemu-devel@nongnu.org,
 wainersm@redhat.com, f4bug@amsat.org, luis.pires@eldorado.org.br,
 qemu-ppc@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--PWsxE9i/vAnRpZ5c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 15, 2021 at 06:41:35PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>=20
> Based-on: <20210413211129.457272-1-luis.pires@eldorado.org.br>

First things first: it's unclear to me if this is testing stuff that's
already merged, or it's speculative tests for the in-progress prefixed
instruction stuff.  i.e. If these tests are applied right now, will
they pass?

> This series adds gcc-10 based images to enable the build of tests with Po=
wer10
> instructions. Then two tests for paddi are added:
> - The first one checks a weird behavior observed on POWER10 Functional Si=
mulator
>   1.1.0, where the 34-bit immediate is treated as a 32-bits one;
> - The second one exercises the R=3D1 path of paddi, where CIA is used ins=
tead of RA.
>   The test is failing with the current implementation because we use cpu_=
nip,
>   which is not updated all the time. Luis already has the fix, it should =
be
>   applied on the next version of his patch series.
>=20
> The main reason to submit this patch as an RFC first is the docker part. =
I would
> lie if I tell you that I understand half of what is going on there.
>  - 'make docker-test-tcg' fails, but apparently on unrelated things;
>  - 'make docker-run-test-tcg@debian-ppc64el-cross' passes, but it looks
>    like the test is skipped?
>  - 'make check-tcg' runs the test and passes (with the fix in place for t=
he
>    second).

What sort of host was that on?  Unfortunately 'make check-tcg' has
been broken on a POWER host for some time, and I've never had time to
look into it.

>=20
> Finally, get_maintainer.pl found no maintainers for
> tests/tcg/ppc64{,le}/Makefile.target. Would it be Mr. Gibson?

Uh... sorta?  I also don't know much about what's going on here, but
I'm probably maintainer by default.


>=20
> Thanks,
> Matheus K. Ferst
>=20
> Matheus Ferst (3):
>   tests/docker: gcc-10 based images for ppc64{,le} tests
>   tests/tcg/ppc64le: load 33-bits constant with paddi
>   tests/tcg/ppc64le: R=3D1 test for paddi
>=20
>  tests/docker/Makefile.include                 |  4 +++
>  .../debian-ppc64-test-cross.docker            | 13 ++++++++++
>  .../debian-ppc64el-test-cross.docker          | 17 ++++++++++++
>  tests/tcg/configure.sh                        | 12 ++++++---
>  tests/tcg/ppc64/Makefile.target               |  6 +++++
>  tests/tcg/ppc64le/Makefile.target             |  6 +++++
>  tests/tcg/ppc64le/pla.c                       | 26 +++++++++++++++++++
>  tests/tcg/ppc64le/pli_33bits.c                | 22 ++++++++++++++++
>  8 files changed, 102 insertions(+), 4 deletions(-)
>  create mode 100644 tests/docker/dockerfiles/debian-ppc64-test-cross.dock=
er
>  create mode 100644 tests/docker/dockerfiles/debian-ppc64el-test-cross.do=
cker
>  create mode 100644 tests/tcg/ppc64le/pla.c
>  create mode 100644 tests/tcg/ppc64le/pli_33bits.c
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PWsxE9i/vAnRpZ5c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB5CecACgkQbDjKyiDZ
s5JqUQ/8DrqsZqI3rs3Sr4FZGjLMtZMwInxRrRA1w+gFOcjE2/wVkonUP5kSQyAm
ZrsV4iJjAauDVCY8LkJ/3LRKQ9EtZf3+76zBM1YWLv6YxbM9g33Dy50DS2enUSZJ
Cux90p4FQJBwVD8YxRN3WlIkVy+WSP2sJ2BxSMkmg2xToSYcZ6aayHQ0F7gDFuhZ
Iwrb6dw9+IlxnPPX1MXWu+TqH2Qn6XYVRrk3TIxq16+keGtb8kT/HehAXZbXOw7p
K4mwbH45lGI2cgcTLXpN+lBKIR6sIqhAfvBbnffhVmGPCrAlgdBlOhb2pWzRU8YN
RXDFKTxxNjcOU8wlKvflShFt1oE1u75A26X0SuVkIF/lMbn/8znSZTa+sFdnUMHa
PM8A3qi6p1CNKiITBfjoCj8iN4yZL0yP7nf0rjN7dSngYvTt/IU4ttbfwvgMq5Qq
JuGKtSJTfgXhCxkN9DUNE497MoOraaou6aw0RcBgCi9EztFBbe7MC8Z9wLxCCYad
Eul5c6XJJ6UF6kKB4bwB4U1M5QGn3IHIrseBbzpLYZhLAUzHS8YZdlNg+1LXswRI
xF3tXYH/sQ4iM2wXzHjiLH4gIHVREzZI2qKVa/tnrBab0NY9FPfrG1eTU6tFQgXu
5cuoS47FnHGUD3uxP+mkCqrZUOk4slgjwFap8Jon44R06hk+SQ0=
=85F2
-----END PGP SIGNATURE-----

--PWsxE9i/vAnRpZ5c--

