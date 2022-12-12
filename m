Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 192EA649A01
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 09:31:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4eCS-0000ST-Gj; Mon, 12 Dec 2022 03:30:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4eCH-0000RX-Rg
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 03:30:02 -0500
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4eCG-0002jt-0J
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 03:30:01 -0500
Received: by mail-lf1-x133.google.com with SMTP id cf42so17352649lfb.1
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 00:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o8y0cD/ObAm2hDQMhScrrgtdyfbL81DeMy3vX26Zs8I=;
 b=dWt8HX7cmL+VYdnwc7hpd7N+/cJIbKhkbKxyDjvlwDFxhJTMr2LfK9sGPI3/gtoj4V
 ZOVr5f+rHGPtTml4p0itbLUTUZckVwZZPQmHjfN2EzWPAcRz7Lf4PzB2FFwRIAX4VVP0
 S15luPf9QCkwefdvxSr7W5BiSUZKrqfC+4UI+bu/s3DfMrfWKBsQZg96Kzr0Mv3SpZvR
 TSTQDQGG4t6nNE+Dbvbx/couzLSkYi+Jud50LJkzVZi58bWk6lnNbYc3bpE+4LUEmoQP
 o+0CoiH6p1DKCpfumaQn0WNj7WFZ1b+tu1lRBtGGgOk5nNeLiRLFkdUHInD3H9jrZ3xn
 ci7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o8y0cD/ObAm2hDQMhScrrgtdyfbL81DeMy3vX26Zs8I=;
 b=dYnJSaBjpvWOhIPX055amcLL2timO1ft10eRVqXz0+U7F5xj5TEHGtRPSdQL+19Hq7
 R2x/hB1wAXUbRvtZWc3VjCNyBKwkCb9BLkxrrmU9RRiMDqtaBKqDFxvcV8l4oLAMyYBW
 4SDg9eCryUzCVA5f2kwTQLc1dPsDnskkQPmqxYStoDuj9JiVUooashwnJ7GX2jwxl0ZF
 o206SCl12L8YPGvKfbnVxvTGib7ZfIOap+mxATOaLxBbGIlv4l4UlJeQanKnFMcjVaUH
 ZosERRzXcj4brIBpcWAbKZVN4PQC8ZELRYYoocDy7h4+KicVwN6p8QFa2ntjAUUqc3i8
 XeTA==
X-Gm-Message-State: ANoB5plXyYcfZZQdEFKf7AImmrwbFJQRuJUd+ustb48mo9DZoHejpBJr
 x2MyhBU9jcJaNweAsL4joI/nzbAbPjoPJssGZcU=
X-Google-Smtp-Source: AA0mqf77HeSQxJyPR5z0coXLt2h/OEAqyBNFOYtrxZO0QpuVI0DwJBwHLnTzeDJlg35EAnAxmHbxRHvBaaKY5k3DUFw=
X-Received: by 2002:a19:f016:0:b0:4b5:886b:d4af with SMTP id
 p22-20020a19f016000000b004b5886bd4afmr5005136lfc.276.1670833797870; Mon, 12
 Dec 2022 00:29:57 -0800 (PST)
MIME-Version: 1.0
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-10-pbonzini@redhat.com>
In-Reply-To: <20221209112409.184703-10-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 12 Dec 2022 12:29:45 +0400
Message-ID: <CAJ+F1CJ2FgpD72+Z4x9UMhWy_1PaexZ06a28nG4KiHdvWRj2aA@mail.gmail.com>
Subject: Re: [PATCH 09/30] meson: use prefer_static option
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Dec 9, 2022 at 3:42 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The option is new in Meson 0.63 and removes the need to pass "static:
> true" to all dependency and find_library invocation.  Actually cleaning
> up the invocations is left for a separate patch.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  configure                   |  4 +---
>  docs/devel/build-system.rst |  3 +--
>  meson.build                 | 11 ++++-------
>  qga/meson.build             |  2 +-
>  4 files changed, 7 insertions(+), 13 deletions(-)
>
> diff --git a/configure b/configure
> index 411dfe977958..6efc2055ce09 100755
> --- a/configure
> +++ b/configure
> @@ -2315,9 +2315,6 @@ fi
>  if test "$solaris" =3D "yes" ; then
>    echo "CONFIG_SOLARIS=3Dy" >> $config_host_mak
>  fi
> -if test "$static" =3D "yes" ; then
> -  echo "CONFIG_STATIC=3Dy" >> $config_host_mak
> -fi
>  echo "SRC_PATH=3D$source_path" >> $config_host_mak
>  echo "TARGET_DIRS=3D$target_list" >> $config_host_mak
>  if test "$modules" =3D "yes"; then
> @@ -2540,6 +2537,7 @@ if test "$skip_meson" =3D no; then
>    # Built-in options
>    test "$bindir" !=3D "bin" && meson_option_add "-Dbindir=3D$bindir"
>    test "$default_feature" =3D no && meson_option_add -Dauto_features=3Dd=
isabled
> +  test "$static" =3D yes && meson_option_add -Dprefer_static=3Dtrue
>    test "$pie" =3D no && meson_option_add -Db_pie=3Dfalse
>    test "$werror" =3D yes && meson_option_add -Dwerror=3Dtrue
>
> diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
> index 189472174340..9db18aff159e 100644
> --- a/docs/devel/build-system.rst
> +++ b/docs/devel/build-system.rst
> @@ -311,8 +311,7 @@ dependency will be used::
>    sdl_image =3D not_found
>    if not get_option('sdl_image').auto() or have_system
>      sdl_image =3D dependency('SDL2_image', required: get_option('sdl_ima=
ge'),
> -                           method: 'pkg-config',
> -                           static: enable_static)
> +                           method: 'pkg-config')
>    endif
>
>  This avoids warnings on static builds of user-mode emulators, for exampl=
e.
> diff --git a/meson.build b/meson.build
> index 19b023985325..dced840bfbee 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -18,10 +18,7 @@ sh =3D find_program('sh')
>  cc =3D meson.get_compiler('c')
>  config_host =3D keyval.load(meson.current_build_dir() / 'config-host.mak=
')
>  enable_modules =3D 'CONFIG_MODULES' in config_host
> -enable_static =3D 'CONFIG_STATIC' in config_host
> -
> -# Allow both shared and static libraries unless --enable-static
> -static_kwargs =3D enable_static ? {'static': true} : {}
> +static_kwargs =3D {}
>
>  # Temporary directory used for files created while
>  # configure runs. Since it is in the build directory
> @@ -183,7 +180,7 @@ qemu_cflags =3D config_host['QEMU_CFLAGS'].split()
>  qemu_objcflags =3D config_host['QEMU_OBJCFLAGS'].split()
>  qemu_ldflags =3D config_host['QEMU_LDFLAGS'].split()
>
> -if enable_static
> +if get_option('prefer_static')
>    qemu_ldflags +=3D get_option('b_pie') ? '-static-pie' : '-static'
>  endif
>
> @@ -830,7 +827,7 @@ if targetos =3D=3D 'linux' and have_tools and get_opt=
ion('mpath').allowed()
>                                      kwargs: static_kwargs)
>    if libmpathpersist.found()
>      mpathlibs +=3D libmpathpersist
> -    if enable_static
> +    if get_option('prefer_static')
>        mpathlibs +=3D cc.find_library('devmapper',
>                                       required: get_option('mpath'),
>                                       kwargs: static_kwargs)
> @@ -1214,7 +1211,7 @@ if not gnutls_crypto.found()
>      # Debian has removed -lgpg-error from libgcrypt-config
>      # as it "spreads unnecessary dependencies" which in
>      # turn breaks static builds...
> -    if gcrypt.found() and enable_static
> +    if gcrypt.found() and get_option('prefer_static')
>        gcrypt =3D declare_dependency(dependencies: [
>          gcrypt,
>          cc.find_library('gpg-error', required: true, kwargs: static_kwar=
gs)])
> diff --git a/qga/meson.build b/qga/meson.build
> index 3cfb9166e5d8..ec67326b25f3 100644
> --- a/qga/meson.build
> +++ b/qga/meson.build
> @@ -22,7 +22,7 @@ have_qga_vss =3D get_option('qga_vss') \
>      Then run configure with: --extra-cxxflags=3D"-isystem /path/to/vss/i=
nc/win2003"''') \
>    .require(midl.found() or widl.found(),
>             error_message: 'VSS support requires midl or widl') \
> -  .require(not enable_static,
> +  .require(not get_option('prefer_static'),
>             error_message: 'VSS support requires dynamic linking with GLi=
b') \
>    .allowed()
>
> --
> 2.38.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

