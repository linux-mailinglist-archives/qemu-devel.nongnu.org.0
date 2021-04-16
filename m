Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5B136187F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 06:03:27 +0200 (CEST)
Received: from localhost ([::1]:43660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXFhW-0004pG-FQ
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 00:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lXFdE-0001eP-8L; Thu, 15 Apr 2021 23:59:00 -0400
Received: from ozlabs.org ([203.11.71.1]:39195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lXFdA-0002jT-K8; Thu, 15 Apr 2021 23:59:00 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FM2WX00Zmz9sWX; Fri, 16 Apr 2021 13:58:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618545528;
 bh=fW23em1aj8UtluFuFrdMpmjhEO995mrdhbmGyM1+/Gg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QnuLrqVTPOGzv+cSa/pvuT5+DmNFmnp3Ap8RDa+nEr7SH2Kzro0Bz8LXMIqmwpZxU
 3gdgo01kJ65mO5G7IrlcZgx9cY4R98+n9RUnYD25MnMSweAa30M1sJwrn/UxeqUovv
 SUNPDDjQLBN/e7VVtj8NFhNfruis1szgG4lMGy5g=
Date: Fri, 16 Apr 2021 13:58:11 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [RFC PATCH 1/3] tests/docker: gcc-10 based images for ppc64{, le}
 tests
Message-ID: <YHkLU6rlVOl2v6Al@yekko.fritz.box>
References: <20210415214138.563795-1-matheus.ferst@eldorado.org.br>
 <20210415214138.563795-2-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qG4kIO41eAdZg0fU"
Content-Disposition: inline
In-Reply-To: <20210415214138.563795-2-matheus.ferst@eldorado.org.br>
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


--qG4kIO41eAdZg0fU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 15, 2021 at 06:41:36PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>=20
> A newer compiler is needed to build tests for Power10 instructions. As
> done for arm64 on c729a99d2701, new '-test-cross' images are created for
> ppc64 and ppc64le. As done on 936fda4d771f, a test for compiler support
> is added to verify that the toolchain in use has '-mpower10'.
>=20
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>  tests/docker/Makefile.include                   |  4 ++++
>  .../dockerfiles/debian-ppc64-test-cross.docker  | 13 +++++++++++++
>  .../debian-ppc64el-test-cross.docker            | 17 +++++++++++++++++
>  tests/tcg/configure.sh                          | 12 ++++++++----
>  4 files changed, 42 insertions(+), 4 deletions(-)
>  create mode 100644 tests/docker/dockerfiles/debian-ppc64-test-cross.dock=
er
>  create mode 100644 tests/docker/dockerfiles/debian-ppc64el-test-cross.do=
cker
>=20
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index 9f464cb92c..1f8941d290 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -152,10 +152,14 @@ docker-image-debian-sparc64-cross: docker-image-deb=
ian10
>  docker-image-debian-tricore-cross: docker-image-debian10
>  docker-image-debian-all-test-cross: docker-image-debian10
>  docker-image-debian-arm64-test-cross: docker-image-debian11
> +docker-image-debian-ppc64-test-cross: docker-image-debian11
> +docker-image-debian-ppc64el-test-cross: docker-image-debian11
> =20
>  # These images may be good enough for building tests but not for test bu=
ilds
>  DOCKER_PARTIAL_IMAGES +=3D debian-alpha-cross
>  DOCKER_PARTIAL_IMAGES +=3D debian-arm64-test-cross
> +DOCKER_PARTIAL_IMAGES +=3D debian-ppc64-test-cross
> +DOCKER_PARTIAL_IMAGES +=3D debian-ppc64el-test-cross
>  DOCKER_PARTIAL_IMAGES +=3D debian-hppa-cross
>  DOCKER_PARTIAL_IMAGES +=3D debian-m68k-cross debian-mips64-cross
>  DOCKER_PARTIAL_IMAGES +=3D debian-powerpc-cross debian-ppc64-cross

Why are you adding new images, rather than updating the existing
debian-powerpc-cross image?  I don't think you should need separate
ppc64 and ppc64el images, a single image with a gcc that can target
both should suffice.  (Also, it's typically ppc64le, not ppc64el,
which, yes, is different from what the mips and arm people do for no
particularly good reason).

> diff --git a/tests/docker/dockerfiles/debian-ppc64-test-cross.docker b/te=
sts/docker/dockerfiles/debian-ppc64-test-cross.docker
> new file mode 100644
> index 0000000000..66abfdeb47
> --- /dev/null
> +++ b/tests/docker/dockerfiles/debian-ppc64-test-cross.docker
> @@ -0,0 +1,13 @@
> +#
> +# Docker ppc64 cross-compiler target (tests only)
> +#
> +# This docker target builds on the debian Bullseye base image.
> +#
> +FROM qemu/debian11
> +
> +# Add the foreign architecture we want and install dependencies
> +RUN dpkg --add-architecture ppc64
> +RUN apt update && \
> +    DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
> +        apt install -y --no-install-recommends \
> +        libc6-dev-ppc64-cross gcc-10-powerpc64-linux-gnu
> diff --git a/tests/docker/dockerfiles/debian-ppc64el-test-cross.docker b/=
tests/docker/dockerfiles/debian-ppc64el-test-cross.docker
> new file mode 100644
> index 0000000000..7582508467
> --- /dev/null
> +++ b/tests/docker/dockerfiles/debian-ppc64el-test-cross.docker
> @@ -0,0 +1,17 @@
> +#
> +# Docker ppc64el cross-compiler target (tests only)
> +#
> +# This docker target builds on the debian Bullseye base image.
> +#
> +FROM qemu/debian11
> +
> +# Add the foreign architecture we want and install dependencies
> +RUN dpkg --add-architecture ppc64el
> +RUN apt update && \
> +    DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
> +        apt install -y --no-install-recommends \
> +        crossbuild-essential-ppc64el gcc-10-powerpc64le-linux-gnu
> +
> +# Specify the cross prefix for this image (see tests/docker/common.rc)
> +#ENV QEMU_CONFIGURE_OPTS --cross-prefix=3Dpowerpc64le-linux-gnu-
> +#ENV DEF_TARGET_LIST ppc64-softmmu,ppc64-linux-user,ppc64abi32-linux-user
> diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
> index fa1a4261a4..5f5db91a01 100755
> --- a/tests/tcg/configure.sh
> +++ b/tests/tcg/configure.sh
> @@ -170,13 +170,13 @@ for target in $target_list; do
>        ;;
>      ppc64-*)
>        container_hosts=3Dx86_64
> -      container_image=3Ddebian-ppc64-cross
> -      container_cross_cc=3Dpowerpc64-linux-gnu-gcc
> +      container_image=3Ddebian-ppc64-test-cross
> +      container_cross_cc=3Dpowerpc64-linux-gnu-gcc-10
>        ;;
>      ppc64le-*)
>        container_hosts=3Dx86_64
> -      container_image=3Ddebian-ppc64el-cross
> -      container_cross_cc=3Dpowerpc64le-linux-gnu-gcc
> +      container_image=3Ddebian-ppc64el-test-cross
> +      container_cross_cc=3Dpowerpc64le-linux-gnu-gcc-10
>        ;;
>      riscv64-*)
>        container_hosts=3Dx86_64
> @@ -280,6 +280,10 @@ for target in $target_list; do
>                 -mpower8-vector -o $TMPE $TMPC; then
>                  echo "CROSS_CC_HAS_POWER8_VECTOR=3Dy" >> $config_target_=
mak
>              fi
> +            if do_compiler "$target_compiler" $target_compiler_cflags \
> +               -mpower10 -o $TMPE $TMPC; then
> +                echo "CROSS_CC_HAS_POWER10=3Dy" >> $config_target_mak
> +            fi
>          ;;
>          i386-linux-user)
>              if do_compiler "$target_compiler" $target_compiler_cflags \

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--qG4kIO41eAdZg0fU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB5C1IACgkQbDjKyiDZ
s5JlVQ//VqTdAihYSgzaFb2JSrzuXU8CDY9fz2CfBrcwuaW+zEH8dHI5CU/GlPkB
S+3s6+eSkbCU/+dAu4+7zr8+BeKhZ5Do4gnXieZEk2kMnTZ5Vh77YNjMsf/Gq+Ee
j3bOl2mW7FngbnsT6medwHOhMfbEjvUohSX9Nc4fov+HcvG+iE4d8m4+EJINNQ6u
wLm5p2RO38r9pTmFLXoXlJCzy+qXsm6sPdAY2A3j4/PsF4/oVdiL7li+hpkU8xt6
Nyq7vzhiFGTPKa9Iqa7GSg5taf5cYzVqnYak/edyGGfKoY3mp5CUfXE60q+F/6ZO
a2pmiAitE3UyCy8EpVoWoypasIxKSZqRCU5M+oyA2ftxTwCpdHZsVR6rhRQmSQul
kEu9w9OcGLdWUiqSxKtgAtWcYXxBylQIlNK5z7aqpexXEU7f6tuu1KgimbN/mSZa
tJP4BqY3+qTFmhE5jsORZd92u8KxxG2uXrtT2gZVW7w5BpsKEwa3BEgqe8CHy7pf
C6jsAWqXagK8khPOMITgJe60IHbhCAsQemysLVzGa8fGF7vqmcZbv/UcbIF6o2Bx
/olqmqNzJHPRkSf5/i4RBuigLRoQUf5n4SVAqeMmpXVVzDTFU7vLxpj7qq7v77+h
5CVLYuRkDUcNkkLCupiKyhBQymUAYuRuLD3iWIw/+YZzpJkOiaI=
=nK92
-----END PGP SIGNATURE-----

--qG4kIO41eAdZg0fU--

