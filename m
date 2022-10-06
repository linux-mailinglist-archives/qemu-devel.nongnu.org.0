Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD525F6F3C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 22:35:09 +0200 (CEST)
Received: from localhost ([::1]:58172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogXaF-0003Gr-VP
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 16:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogXYO-00015j-9B
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 16:33:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogXYK-0005il-DT
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 16:33:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665088386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YiotQuT/vgif3eq9VfrZpECdlG6F8hdBr2QpMAcxcTU=;
 b=ZBzXKDnKb05sIuqGMr0e6k6mMcSOX9lFDX06lihWtsQI9FMJEFFQzpZpDnf8zcZcvBCF49
 OLTHGSJ7Y4AtD38ucIjeL3GL4AEFZU4uD+LkdTq05t/1FkFPORzOAlj7ONcfH6QgfXOal9
 OP5qYwFLxoj0vLMFxLlgXFfUMVqTqmE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-BOFfvxuhOdedwRHkRZEeJw-1; Thu, 06 Oct 2022 16:33:05 -0400
X-MC-Unique: BOFfvxuhOdedwRHkRZEeJw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF84B862FDC;
 Thu,  6 Oct 2022 20:33:04 +0000 (UTC)
Received: from localhost (unknown [10.39.193.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 696CB14588B6;
 Thu,  6 Oct 2022 20:33:04 +0000 (UTC)
Date: Thu, 6 Oct 2022 16:33:02 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 26/54] configure: unify creation of cross-compilation
 Makefiles
Message-ID: <Yz87fr2/PLMdX6wK@fedora>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
 <20221004130138.2299307-27-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="f82SccM3T0OeE0pN"
Content-Disposition: inline
In-Reply-To: <20221004130138.2299307-27-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--f82SccM3T0OeE0pN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 04, 2022 at 02:01:10PM +0100, Alex Benn=E9e wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
>=20
> Let write_target_makefile handle both host and container cross compilers.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> Message-Id: <20220929114231.583801-27-alex.bennee@linaro.org>

I think this commit breaks bisection:

  configure: line 2498: syntax error near unexpected token `('
  configure: line 2498: `      echo "run-tcg-tests-$target: $qemu\$(EXESUF)=
" >> Makefile.prereqs'

It has already been merged into qemu.git/master, so there's no fixing it
now. I wanted to leave a comment in case someone hits this problem in
the future and wonders what's going on.

I had to use git bisect skip.

Stefan

>=20
> diff --git a/configure b/configure
> index cbeac99b2b..8b495d4453 100755
> --- a/configure
> +++ b/configure
> @@ -2157,51 +2157,49 @@ probe_target_compiler() {
> =20
>  write_target_makefile() {
>    echo "EXTRA_CFLAGS=3D$target_cflags"
> -  if test -n "$target_cc"; then
> -    echo "CC=3D$target_cc"
> -    echo "CCAS=3D$target_ccas"
> -  fi
> -  if test -n "$target_ar"; then
> -    echo "AR=3D$target_ar"
> -  fi
> -  if test -n "$target_as"; then
> -    echo "AS=3D$target_as"
> -  fi
> -  if test -n "$target_ld"; then
> -    echo "LD=3D$target_ld"
> -  fi
> -  if test -n "$target_nm"; then
> -    echo "NM=3D$target_nm"
> -  fi
> -  if test -n "$target_objcopy"; then
> -    echo "OBJCOPY=3D$target_objcopy"
> -  fi
> -  if test -n "$target_ranlib"; then
> -    echo "RANLIB=3D$target_ranlib"
> -  fi
> -  if test -n "$target_strip"; then
> -    echo "STRIP=3D$target_strip"
> -  fi
> -}
> -
> -write_container_target_makefile() {
> -  echo "$1: docker-image-$container_image" >> Makefile.prereqs
> -  echo "EXTRA_CFLAGS=3D$target_cflags"
> -  if test -n "$container_cross_cc"; then
> -    echo "CC=3D$docker_py cc --cc $container_cross_cc -i qemu/$container=
_image -s $source_path --"
> -    echo "CCAS=3D$docker_py cc --cc $container_cross_cc -i qemu/$contain=
er_image -s $source_path --"
> +  if test -z "$target_cc" && test -z "$target_as"; then
> +    test -z "$container_image" && error_exit "Internal error: could not =
find cross compiler for $1?"
> +    echo "$1: docker-image-$container_image" >> Makefile.prereqs
> +    if test -n "$container_cross_cc"; then
> +      echo "CC=3D$docker_py cc --cc $container_cross_cc -i qemu/$contain=
er_image -s $source_path --"
> +      echo "CCAS=3D$docker_py cc --cc $container_cross_cc -i qemu/$conta=
iner_image -s $source_path --"
> +    fi
> +    echo "AR=3D$docker_py cc --cc $container_cross_ar -i qemu/$container=
_image -s $source_path --"
> +    echo "AS=3D$docker_py cc --cc $container_cross_as -i qemu/$container=
_image -s $source_path --"
> +    echo "LD=3D$docker_py cc --cc $container_cross_ld -i qemu/$container=
_image -s $source_path --"
> +    echo "NM=3D$docker_py cc --cc $container_cross_nm -i qemu/$container=
_image -s $source_path --"
> +    echo "OBJCOPY=3D$docker_py cc --cc $container_cross_objcopy -i qemu/=
$container_image -s $source_path --"
> +    echo "RANLIB=3D$docker_py cc --cc $container_cross_ranlib -i qemu/$c=
ontainer_image -s $source_path --"
> +    echo "STRIP=3D$docker_py cc --cc $container_cross_strip -i qemu/$con=
tainer_image -s $source_path --"
> +  else
> +    if test -n "$target_cc"; then
> +      echo "CC=3D$target_cc"
> +      echo "CCAS=3D$target_ccas"
> +    fi
> +    if test -n "$target_ar"; then
> +      echo "AR=3D$target_ar"
> +    fi
> +    if test -n "$target_as"; then
> +      echo "AS=3D$target_as"
> +    fi
> +    if test -n "$target_ld"; then
> +      echo "LD=3D$target_ld"
> +    fi
> +    if test -n "$target_nm"; then
> +      echo "NM=3D$target_nm"
> +    fi
> +    if test -n "$target_objcopy"; then
> +      echo "OBJCOPY=3D$target_objcopy"
> +    fi
> +    if test -n "$target_ranlib"; then
> +      echo "RANLIB=3D$target_ranlib"
> +    fi
> +    if test -n "$target_strip"; then
> +      echo "STRIP=3D$target_strip"
> +    fi
>    fi
> -  echo "AR=3D$docker_py cc --cc $container_cross_ar -i qemu/$container_i=
mage -s $source_path --"
> -  echo "AS=3D$docker_py cc --cc $container_cross_as -i qemu/$container_i=
mage -s $source_path --"
> -  echo "LD=3D$docker_py cc --cc $container_cross_ld -i qemu/$container_i=
mage -s $source_path --"
> -  echo "NM=3D$docker_py cc --cc $container_cross_nm -i qemu/$container_i=
mage -s $source_path --"
> -  echo "OBJCOPY=3D$docker_py cc --cc $container_cross_objcopy -i qemu/$c=
ontainer_image -s $source_path --"
> -  echo "RANLIB=3D$docker_py cc --cc $container_cross_ranlib -i qemu/$con=
tainer_image -s $source_path --"
> -  echo "STRIP=3D$docker_py cc --cc $container_cross_strip -i qemu/$conta=
iner_image -s $source_path --"
>  }
> =20
> -
> -
>  ##########################################
>  # check for vfio_user_server
> =20
> @@ -2560,15 +2558,9 @@ for target in $target_list; do
>        ;;
>    esac
> =20
> -  probe_target_compiler $target
> -  if test $got_cross_cc =3D yes; then
> -      write_target_makefile >> "$config_target_mak"
> -  elif test -n "$container_image"; then
> -      build_static=3Dy
> -      write_container_target_makefile build-tcg-tests-$target >> "$confi=
g_target_mak"
> -      got_cross_cc=3Dyes
> -  fi
> -  if test $got_cross_cc =3D yes; then
> +  if probe_target_compiler $target || test -n "$container_image"; then
> +      test -n "$container_image" && build_static=3Dy
> +      write_target_makefile "build-tcg-tests-$target >> "$config_target_=
mak"
>        mkdir -p "tests/tcg/$target"
>        ln -sf "$source_path/tests/tcg/Makefile.target" "tests/tcg/$target=
/Makefile"
>        ln -sf "../config-$target.mak" "tests/tcg/$target/config-target.ma=
k"
> --=20
> 2.34.1
>=20

--f82SccM3T0OeE0pN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmM/O34ACgkQnKSrs4Gr
c8iXsQf/WxSTyDT2alQ0zIbBfMBgK5Aff5zDkUI2n8jb1jEDntMzqR+o4esbsN+g
trTycrMm4rvehNmLb7smXiqlZvYOkQg1AefdH72xxJ8nLEQGTVZrZAvI+oJH6gd/
CVlGEhwpJZvJ23DGeStfvRyfcWlWyQTYRZue8A/dH0+19nBmF2Zf2HXXp9K+x8Dz
BIxJ8y/Uin+j0yvE2j87BM8E39qjOivy1e/6eAMttNy/aO6dOtRUmRTSVmPyJX9g
Zy9mFkEhz7bdYnoiZWVSOgvARmuIi/+EOWiuUFsy/T57npRZMOmocerkn598UmMP
cyeSJ3aLqxQbiWJfMOlF/13lTESWDw==
=BJFP
-----END PGP SIGNATURE-----

--f82SccM3T0OeE0pN--


