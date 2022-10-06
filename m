Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7545E5F6F63
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 22:39:53 +0200 (CEST)
Received: from localhost ([::1]:42272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogXeq-0000VK-8y
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 16:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogXcP-0004zA-PR
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 16:37:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogXcM-0006PS-Rb
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 16:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665088637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xwQfG1zqq0G4Cfxx6zGxCAcZK5a8Rr7CYMT//NrkTeQ=;
 b=ZQ8bpy0L/3sZmthY8TGSEwPrYYdjCG/v9kuWEmZNJp97CRmVcw/duI8+4LG3C8HF1GBpJp
 Af0Sc8aZ+uQNnzlCGT7pj07RAfynzJSFbFvXXu4cY+ewCGoyrivaQoEVTywO5/bqTY0NEd
 t036Ttp9aWokeNoSkipcoKVD7QwjOkg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-SGb9d0gKPmeS1EntawnhaQ-1; Thu, 06 Oct 2022 16:37:13 -0400
X-MC-Unique: SGb9d0gKPmeS1EntawnhaQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 771323804504;
 Thu,  6 Oct 2022 20:37:13 +0000 (UTC)
Received: from localhost (unknown [10.39.193.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D418CC15BA4;
 Thu,  6 Oct 2022 20:37:12 +0000 (UTC)
Date: Thu, 6 Oct 2022 16:37:11 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 28/54] configure: build ROMs with container-based cross
 compilers
Message-ID: <Yz88d6iNGiVpWvtM@fedora>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
 <20221004130138.2299307-29-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zwm11/1fqoH5qJJN"
Content-Disposition: inline
In-Reply-To: <20221004130138.2299307-29-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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


--zwm11/1fqoH5qJJN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 04, 2022 at 02:01:12PM +0100, Alex Benn=E9e wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
>=20
> s390-ccw remains a bit more complex, because the -march=3Dz900 test is do=
ne
> only for the native cross compiler.  Otherwise, all that is needed is
> to pass the (now mandatory) target argument to write_target_makefile.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> Message-Id: <20220929114231.583801-29-alex.bennee@linaro.org>

This commit broke local builds on my machine because there were
root-owned files in my QEMU source tree from some testing I had done
previously. I think podman gives up when it encounters such files:

  Error: lsetxattr qemu/virtiofsd-1.sock: operation not permitted
  Traceback (most recent call last):
    File "qemu/tests/docker/docker.py", line 683, in <module>
      sys.exit(main())
    File "qemu/tests/docker/docker.py", line 679, in main
      return args.cmdobj.run(args, argv)
    File "qemu/tests/docker/docker.py", line 657, in run
      return Docker().run(cmd, False, quiet=3Dargs.quiet,
    File "qemu/tests/docker/docker.py", line 370, in run
      ret =3D self._do_check(["run", "--rm", "--label",
    File "qemu/tests/docker/docker.py", line 247, in _do_check
      return subprocess.check_call(self._command + cmd, **kwargs)
    File "/usr/lib64/python3.10/subprocess.py", line 369, in check_call
      raise CalledProcessError(retcode, cmd)
  subprocess.CalledProcessError: Command '['podman', 'run', '--rm', '--labe=
l', 'com.qemu.instance.uuid=3De5f732db938a455cb4dca486dc9534d6', '--userns=
=3Dkeep-id', '-u', '1000', '-w', 'qemu/build/pc-bios/s390-ccw', '-v', 'qemu=
/build/pc-bios/s390-ccw:qemu/build/pc-bios/s390-ccw:rw', '-v', 'qemu:qemu:r=
o,z', 'qemu/debian-s390x-cross', 's390x-linux-gnu-gcc', '-Wall', '-ffreesta=
nding', '-fno-delete-null-pointer-checks', '-fno-common', '-fPIE', '-fwrapv=
', '-fno-strict-aliasing', '-fno-asynchronous-unwind-tables', '-msoft-float=
', '-std=3Dgnu99', '-march=3Dz10', '-O2', '-g', '-nostdinc', '-Iqemu/pc-bio=
s/s390-ccw/../../roms/SLOF/lib/libc/include', '-Iqemu/pc-bios/s390-ccw/../.=
=2E/roms/SLOF/lib/libnet', '-DDHCPARCH=3D0x1F', '-MMD', '-MP', '-MT', 'ipv4=
=2Eo', '-MF', 'ipv4.d', '-c', '-o', 'ipv4.o', 'qemu/pc-bios/s390-ccw/../../=
roms/SLOF/lib/libnet/ipv4.c']' returned non-zero exit status 126.

After removing those kinds of files from my source tree the build
completed successfully.

It would be nice if the build didn't trip up over this. My podman
version is 4.2.0.

Do you think we should do anything about this?

Stefan

> diff --git a/configure b/configure
> index c175650eb9..a54e17aca9 100755
> --- a/configure
> +++ b/configure
> @@ -2152,7 +2152,7 @@ probe_target_compiler() {
>      target_ranlib=3D
>      target_strip=3D
>    fi
> -  test -n "$target_cc"
> +  test -n "$target_cc" || test -n "$container_image"
>  }
> =20
>  write_target_makefile() {
> @@ -2307,7 +2307,7 @@ if test "$targetos" !=3D "darwin" && test "$targeto=
s" !=3D "sunos" && \
>      config_mak=3Dpc-bios/optionrom/config.mak
>      echo "# Automatically generated by configure - do not modify" > $con=
fig_mak
>      echo "TOPSRC_DIR=3D$source_path" >> $config_mak
> -    write_target_makefile >> $config_mak
> +    write_target_makefile pc-bios/optionrom/all >> $config_mak
>  fi
> =20
>  if test "$softmmu" =3D yes && probe_target_compiler ppc-softmmu; then
> @@ -2315,25 +2315,31 @@ if test "$softmmu" =3D yes && probe_target_compil=
er ppc-softmmu; then
>      config_mak=3Dpc-bios/vof/config.mak
>      echo "# Automatically generated by configure - do not modify" > $con=
fig_mak
>      echo "SRC_DIR=3D$source_path/pc-bios/vof" >> $config_mak
> -    write_target_makefile >> $config_mak
> +    write_target_makefile pc-bios/vof/all >> $config_mak
>  fi
> =20
>  # Only build s390-ccw bios if the compiler has -march=3Dz900 or -march=
=3Dz10
>  # (which is the lowest architecture level that Clang supports)
>  if test "$softmmu" =3D yes && probe_target_compiler s390x-softmmu; then
> -  write_c_skeleton
> -  do_compiler "$target_cc" $target_cc_cflags -march=3Dz900 -o $TMPO -c $=
TMPC
> -  has_z900=3D$?
> -  if [ $has_z900 =3D 0 ] || do_compiler "$target_cc" $target_cc_cflags -=
march=3Dz10 -msoft-float -Werror -o $TMPO -c $TMPC; then
> -    if [ $has_z900 !=3D 0 ]; then
> -      echo "WARNING: Your compiler does not support the z900!"
> -      echo "         The s390-ccw bios will only work with guest CPUs >=
=3D z10."
> +  got_cross_cc=3Dno
> +  if test -n "$target_cc"; then
> +    write_c_skeleton
> +    do_compiler "$target_cc" $target_cc_cflags -march=3Dz900 -o $TMPO -c=
 $TMPC
> +    has_z900=3D$?
> +    if [ $has_z900 =3D 0 ] || do_compiler "$target_cc" $target_cc_cflags=
 -march=3Dz10 -msoft-float -Werror -o $TMPO -c $TMPC; then
> +      if [ $has_z900 !=3D 0 ]; then
> +        echo "WARNING: Your compiler does not support the z900!"
> +        echo "         The s390-ccw bios will only work with guest CPUs =
>=3D z10."
> +      fi
> +      got_cross_cc=3Dyes
>      fi
> +  fi
> +  if test "$got_cross_cc" =3D yes || test -n "$container_image"; then
>      roms=3D"$roms pc-bios/s390-ccw"
>      config_mak=3Dpc-bios/s390-ccw/config-host.mak
>      echo "# Automatically generated by configure - do not modify" > $con=
fig_mak
>      echo "SRC_PATH=3D$source_path/pc-bios/s390-ccw" >> $config_mak
> -    write_target_makefile >> $config_mak
> +    write_target_makefile pc-bios/s390-ccw/all >> $config_mak
>      # SLOF is required for building the s390-ccw firmware on s390x,
>      # since it is using the libnet code from SLOF for network booting.
>      git_submodules=3D"${git_submodules} roms/SLOF"
> @@ -2554,7 +2560,7 @@ for target in $target_list; do
>        ;;
>    esac
> =20
> -  if probe_target_compiler $target || test -n "$container_image"; then
> +  if probe_target_compiler $target; then
>        test -n "$container_image" && build_static=3Dy
>        mkdir -p "tests/tcg/$target"
>        config_target_mak=3Dtests/tcg/$target/config-target.mak
> --=20
> 2.34.1
>=20

--zwm11/1fqoH5qJJN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmM/PHcACgkQnKSrs4Gr
c8is8wgAiijcREwkhJLYiYtyKauAwq3dkORN4Sd1PMBMlXPNmnwR2ljGvLi854kd
FanUvMyUh9/3RwNjYeaM3GTBx08C+3NAw5rGo+gvsyxXUV65xwJ3H+1IVmrdWrNq
Wv8nvMLY0LAVlXrBqLqofC4k8H1zq8Gtw32PcYqlTLAgvqVp5pgxodzDyYZCAAtT
1Pz80VhoVmb3Jn0Izpdter4qXUmaW/Ls3md+j3CHLK71HziG98j6lZVnbzHI3d3t
2SSCVOvWstjI13o55FdYN0j8cnPvLDJR3qttXcnIYa3vFUdhxurspWSqCliEIGKg
+y9obiynjfPrsLeieW5p+ANwAriT3Q==
=d632
-----END PGP SIGNATURE-----

--zwm11/1fqoH5qJJN--


