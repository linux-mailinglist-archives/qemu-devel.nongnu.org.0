Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C4336512A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 06:01:13 +0200 (CEST)
Received: from localhost ([::1]:48104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYhZY-000646-4J
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 00:01:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lYhYI-0005RF-3K; Mon, 19 Apr 2021 23:59:55 -0400
Received: from ozlabs.org ([203.11.71.1]:52875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lYhYE-00015N-W5; Mon, 19 Apr 2021 23:59:53 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FPVLm51l2z9vDx; Tue, 20 Apr 2021 13:59:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618891184;
 bh=bbgU6+zPAC8zyzB2+Yic02Crwo+2GTGvYF9NA34inVg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qCSNQCu0UJP7/4j+2NlGbkdJC3RnaRz/o2dth8bk7rqc9YnUjsqBLKrWzeGnurdC2
 E3ODmzGeRUyw99k0SNv4j/Ol1Pp0cC8ueXj933PL9ZRNjUPlV5Vq6TQiIqBm3mG3eB
 a5uOyGdHPDeY/dZuNp5gRJKu4WgpN7V7n9EPsOIE=
Date: Tue, 20 Apr 2021 13:59:14 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH 1/2] tests/docker: gcc-10 based images for ppc64{,le} tests
Message-ID: <YH5RkjCx2Bk4mbop@yekko.fritz.box>
References: <20210420013308.813323-1-matheus.ferst@eldorado.org.br>
 <20210420013308.813323-2-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="iaDrJPW2/DYWi7Hg"
Content-Disposition: inline
In-Reply-To: <20210420013308.813323-2-matheus.ferst@eldorado.org.br>
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
Cc: gustavo.romero@protonmail.com, qemu-devel@nongnu.org, f4bug@amsat.org,
 qemu-ppc@nongnu.org, bruno.larsen@eldorado.org.br, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--iaDrJPW2/DYWi7Hg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 19, 2021 at 10:33:07PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>=20
> A newer compiler is needed to build tests for Power10 instructions. As
> done for arm64 on c729a99d2701, a new '-test-cross' image is created for
> ppc64 and ppc64le. As done on 936fda4d771f, a test for compiler support
> is added to verify that the toolchain in use has '-mpower10'.
>=20
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>  tests/docker/Makefile.include                   |  2 ++
>  .../debian-powerpc-test-cross.docker            | 17 +++++++++++++++++
>  tests/tcg/configure.sh                          | 12 ++++++++----
>  3 files changed, 27 insertions(+), 4 deletions(-)
>  create mode 100644 tests/docker/dockerfiles/debian-powerpc-test-cross.do=
cker
>=20
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index 9f464cb92c..f1dbcc639f 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -152,10 +152,12 @@ docker-image-debian-sparc64-cross: docker-image-deb=
ian10
>  docker-image-debian-tricore-cross: docker-image-debian10
>  docker-image-debian-all-test-cross: docker-image-debian10
>  docker-image-debian-arm64-test-cross: docker-image-debian11
> +docker-image-debian-power-test-cross: docker-image-debian11
> =20
>  # These images may be good enough for building tests but not for test bu=
ilds
>  DOCKER_PARTIAL_IMAGES +=3D debian-alpha-cross
>  DOCKER_PARTIAL_IMAGES +=3D debian-arm64-test-cross
> +DOCKER_PARTIAL_IMAGES +=3D debian-power-test-cross

You add these "power" (as opposed to "powerpc" or "ppc64" or whatever)
images here, but they don't seem to be referenced anywhere else.

>  DOCKER_PARTIAL_IMAGES +=3D debian-hppa-cross
>  DOCKER_PARTIAL_IMAGES +=3D debian-m68k-cross debian-mips64-cross
>  DOCKER_PARTIAL_IMAGES +=3D debian-powerpc-cross debian-ppc64-cross
> diff --git a/tests/docker/dockerfiles/debian-powerpc-test-cross.docker b/=
tests/docker/dockerfiles/debian-powerpc-test-cross.docker
> new file mode 100644
> index 0000000000..36b336f709
> --- /dev/null
> +++ b/tests/docker/dockerfiles/debian-powerpc-test-cross.docker
> @@ -0,0 +1,17 @@
> +#
> +# Docker powerpc/ppc64/ppc64le cross-compiler target
> +#
> +# This docker target builds on the debian Bullseye base image.
> +#
> +FROM qemu/debian11
> +
> +RUN apt update && \
> +    DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
> +    apt install -y --no-install-recommends \
> +        gcc-powerpc-linux-gnu \
> +        libc6-dev-powerpc-cross \
> +        gcc-10-powerpc64-linux-gnu \
> +        libc6-dev-ppc64-cross \
> +        gcc-10-powerpc64le-linux-gnu \
> +        libc6-dev-ppc64el-cross

I'm not really clear on what distinguishes a -cross.docker image and a
-test-cross.docker image.

> diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
> index fa1a4261a4..a0be066499 100755
> --- a/tests/tcg/configure.sh
> +++ b/tests/tcg/configure.sh
> @@ -170,13 +170,13 @@ for target in $target_list; do
>        ;;
>      ppc64-*)
>        container_hosts=3Dx86_64
> -      container_image=3Ddebian-ppc64-cross
> -      container_cross_cc=3Dpowerpc64-linux-gnu-gcc
> +      container_image=3Ddebian-powerpc-test-cross
> +      container_cross_cc=3Dpowerpc64-linux-gnu-gcc-10
>        ;;
>      ppc64le-*)
>        container_hosts=3Dx86_64
> -      container_image=3Ddebian-ppc64el-cross
> -      container_cross_cc=3Dpowerpc64le-linux-gnu-gcc
> +      container_image=3Ddebian-powerpc-test-cross
> +      container_cross_cc=3Dpowerpc64le-linux-gnu-gcc-10

Doesn't this remove all uses of the debian-pp64-cross and
debian-ppc64el-cross images, in which case you could remove the
matching docker files and so forth too, no?

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

--iaDrJPW2/DYWi7Hg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB+UZIACgkQbDjKyiDZ
s5KI3xAAlXO9AiXp6EQlsFjSMKgiKTuI9v87EdQRZ//gGrkJCAsmhqOPmNRnKPXK
h0TU68CgOROB83XI7HppfH/Q0nTT7ISHPl2CFIKEgKb41hLTtmj6uFo140FfCMAC
704zj/zKAJFG/qTCnyJzL42++s95FjDAgfLgcNfDqgbKcC/F5uSQNtzEYqGh8Z6b
3HP68OhJvedMjBDPdzDLfsph7278ak9c/7y5E3Y4rB+ba/OgRAFQZkuobB3lU5cN
uv7X6d6ixGQG7Z7r2YSwnxDYcNoGaK9UX9n3StMdyz2E/kUd+7zXbILLgiq47PfW
P72kwXOUclDJaPgKN4UnkDUR17vqCr0iqt+0rFhSRJjT81di3WtVLT3Bcfhktbw1
E/j+DffZNF0s4W/muweDtkN9XctEkY/pplOBT8TvZ3cpdKl0jE+L+T3eeEDp0DQU
NcrsXl66CebAMSjw2pbF/tnneH8m2fiypknI5WfifQH4J0XBpq5Vhh/RXK5e3koo
UqMzQyaqj4WoEyO2IzD9mOgpxBQU+BmCx5QBOPxddyVpcaFX/1azibLKljdxM6P7
5CrEj5IHxY3FFAMSLkCXDhiNzvYPtxq4jMDwsir2tLOkYCzvDK07Jxy9agygroQ0
BByV2Du1s4yscNgknWH3V+r2b35sc65kgRBjmTQAhCbDBCBnYIA=
=IvYG
-----END PGP SIGNATURE-----

--iaDrJPW2/DYWi7Hg--

