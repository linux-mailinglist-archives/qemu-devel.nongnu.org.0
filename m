Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6CB649AD2
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 10:13:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4elO-0000Ku-FB; Mon, 12 Dec 2022 04:06:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4elI-0000F5-8e
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 04:06:15 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4elF-0003vY-2n
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 04:06:10 -0500
Received: by mail-lf1-x136.google.com with SMTP id b13so17468850lfo.3
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 01:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sbnwi5Y4irZ+7olrSmEjRgVLrFNkVTrJyFImmezumUo=;
 b=brirgBweDyZ5/aKoalzlraYB6zUx6Me2Sezv82KNJOz68znCKbk0N9ANUyx4H9Cjzh
 0Krh0fm1mFdAb4NFT3qJCHx0mIrNC31MmVksiC72m77Wv1UA4lCAIxQ7HHBq4Hly8Oa1
 tmWYo5M8cKHzFhUatYEmwnH/yC0F1BRm+nj5NGISPHULJgouTjUc4Sj7xyYFFvUecMJp
 bOttIthn1eta3Ou5+68C5wXJ3uBY7COvTQ1/ulKUm149KbXrYjozNNldjykxaebuRGFc
 gUwkLrhjTYP9c0HFZ+mKPix/qJj2LPnpL5EltthGA9ChIJaOr22JgqSu46iDBbyGGF9g
 wJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sbnwi5Y4irZ+7olrSmEjRgVLrFNkVTrJyFImmezumUo=;
 b=kI7UhMYEtTfm4xKOiW1lhexRW3hppEjVinG1FEZIJbRQayx9TxzhNOxLH9KpopayFb
 ytMqsZo/tNG2oQ6wtWv54hpEMrd9HPvOQrhfo4lTPW7ZO/ZRZCQKUtrfJOLP5HTro5U3
 riDK0eFZzG9EwhX0G/l254fvdbNgx4lrgIJMOuDeF601N1p5/MqNl7SSmXZiImC+XpHh
 qVFxMyVIm2FIqugxPHDm1WjsDE6m2R41QbvCtOkag5X4exdpXEQGkG9BOyuVWht6JYh/
 08R3ELy9euvIeBZSeWMO5SgOr62Ip+RPV8rBwWdYw/jQg73xtTmr/LCG84FomVKbbD0y
 Zx/Q==
X-Gm-Message-State: ANoB5pmoEEMvYT1CUNP1USQ5gzerR197UVZq9YRAEgJvV3VNH9Rb+61W
 NSKqotXm/F/a1Un9wjIrSPkoJBf58AwDaTkrLgEIGV2mC2s=
X-Google-Smtp-Source: AA0mqf7sdxTT6/tduOysYJv3vs0udTlgGrThyQ5Qu7Np9aLNFWFPL3dB4M4jE5yBMIkvXbgQ0etwmFx/p36EMI5TfDY=
X-Received: by 2002:ac2:41c6:0:b0:4b0:4b08:6873 with SMTP id
 d6-20020ac241c6000000b004b04b086873mr35173239lfi.329.1670835966214; Mon, 12
 Dec 2022 01:06:06 -0800 (PST)
MIME-Version: 1.0
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-18-pbonzini@redhat.com>
In-Reply-To: <20221209112409.184703-18-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 12 Dec 2022 13:05:54 +0400
Message-ID: <CAJ+F1C+uYT9gvKgagufhEnF06ivYcVPRYB6bVUi3yxugQUvrcA@mail.gmail.com>
Subject: Re: [PATCH 17/30] configure: remove pkg-config functions
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x136.google.com
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

On Fri, Dec 9, 2022 at 3:39 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> All uses of pkg-config have been moved to Meson.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  configure                   | 19 +++----------------
>  docs/devel/build-system.rst |  4 ----
>  2 files changed, 3 insertions(+), 20 deletions(-)
>
> diff --git a/configure b/configure
> index fb28dd3963bd..9c336203d8d9 100755
> --- a/configure
> +++ b/configure
> @@ -365,11 +365,7 @@ smbd=3D"$SMBD"
>  strip=3D"${STRIP-${cross_prefix}strip}"
>  widl=3D"${WIDL-${cross_prefix}widl}"
>  windres=3D"${WINDRES-${cross_prefix}windres}"
> -pkg_config_exe=3D"${PKG_CONFIG-${cross_prefix}pkg-config}"
> -query_pkg_config() {
> -    "${pkg_config_exe}" ${QEMU_PKG_CONFIG_FLAGS} "$@"
> -}
> -pkg_config=3Dquery_pkg_config
> +pkg_config=3D"${PKG_CONFIG-${cross_prefix}pkg-config}"
>  sdl2_config=3D"${SDL2_CONFIG-${cross_prefix}sdl2-config}"
>
>  # default flags for all hosts
> @@ -745,9 +741,7 @@ for opt do
>    ;;
>    --without-default-features) # processed above
>    ;;
> -  --static)
> -    static=3D"yes"
> -    QEMU_PKG_CONFIG_FLAGS=3D"--static $QEMU_PKG_CONFIG_FLAGS"
> +  --static) static=3D"yes"
>    ;;
>    --bindir=3D*) bindir=3D"$optarg"
>    ;;
> @@ -1419,13 +1413,6 @@ EOF
>    fi
>  fi
>
> -##########################################
> -# pkg-config probe
> -
> -if ! has "$pkg_config_exe"; then
> -  error_exit "pkg-config binary '$pkg_config_exe' not found"
> -fi
> -
>  ##########################################
>  # fdt probe
>
> @@ -2423,7 +2410,7 @@ if test "$skip_meson" =3D no; then
>    test -n "$objcc" && echo "objc =3D [$(meson_quote $objcc $CPU_CFLAGS)]=
" >> $cross
>    echo "ar =3D [$(meson_quote $ar)]" >> $cross
>    echo "nm =3D [$(meson_quote $nm)]" >> $cross
> -  echo "pkgconfig =3D [$(meson_quote $pkg_config_exe)]" >> $cross
> +  echo "pkgconfig =3D [$(meson_quote $pkg_config)]" >> $cross
>    echo "ranlib =3D [$(meson_quote $ranlib)]" >> $cross
>    if has $sdl2_config; then
>      echo "sdl2-config =3D [$(meson_quote $sdl2_config)]" >> $cross
> diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
> index 9db18aff159e..66cfe7b8bdc8 100644
> --- a/docs/devel/build-system.rst
> +++ b/docs/devel/build-system.rst
> @@ -103,10 +103,6 @@ developers in checking for system features:
>     Print $MESSAGE to stderr, followed by $MORE... and then exit from the
>     configure script with non-zero status
>
> -``query_pkg_config $ARGS...``
> -   Run pkg-config passing it $ARGS. If QEMU is doing a static build,
> -   then --static will be automatically added to $ARGS
> -
>
>  Stage 2: Meson
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --
> 2.38.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

