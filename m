Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2496C97F8
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Mar 2023 23:11:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgXdc-0006YM-DD; Sun, 26 Mar 2023 17:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pgXda-0006YB-M1
 for qemu-devel@nongnu.org; Sun, 26 Mar 2023 17:10:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pgXdZ-0007yE-1Q
 for qemu-devel@nongnu.org; Sun, 26 Mar 2023 17:10:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679865048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZINaB3Lc0rdSyg+kSRlpaRbqyFeO5Dd2XyhAUG7KN1M=;
 b=RnhFE+fDs/VlIYJK9pb+/lm1b2KlmPxAuDeXVy+Qux3AqQXU1mTfBzVQPskTR0Fk4vAy6G
 pTJ3MhT8FBiX6XLERsLnlKFEFkT0MUQB1ZkzSlcVh5Y8CjWz+of0XXt33GEdnHiybyzl/C
 EUDZdBI9KxDSE5raWGdqUeNiI9zcAHc=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-jHnX2ctyNtmzPSRDOlXTnQ-1; Sun, 26 Mar 2023 17:10:45 -0400
X-MC-Unique: jHnX2ctyNtmzPSRDOlXTnQ-1
Received: by mail-ot1-f72.google.com with SMTP id
 y16-20020a9d7150000000b006a113233807so2784154otj.9
 for <qemu-devel@nongnu.org>; Sun, 26 Mar 2023 14:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679865045;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZINaB3Lc0rdSyg+kSRlpaRbqyFeO5Dd2XyhAUG7KN1M=;
 b=TcBba5rwx0U7VCcgw8TD7wPPfs1PPm2rNiFFlZdLgCLs3xOaMioRgYsrAxcZblWy6O
 PMKvL8Km7HxjKFRcaGMObPX6ZcuDC2WoUv3oKBobeohyzJ/T/IdZlbVm7itkuSBKvIpU
 0RMXWrAxZec/6R+aJB43dSnN9lPq2I/w8tLBeZ8OAUiCIW5JWSQZiWZXtkwh2E0cdG17
 daRxL7aUqIrx27tDfEqmr9CX9e0CZtU8iWERGt+vm5nvrm4sFlFUWyXvCQPCW8fKDmbA
 e6eqoPbIxzg24aVnMPoU1pc+mtUqDOg4NpiZpC3YlERzmm/WbUqBiK28e9jFqdeinZsv
 mU9g==
X-Gm-Message-State: AO0yUKU/Kl5CvakgF2xkbZ9pi28/dDKhaPWXnx8RprajvZfkTnp4gK1i
 IbBVTay5aixfBYpfUGOQxkI5jg7lZrA3CyTzjEVxZQ4mfSK0Mpp69sPSxU6yCAddhGD5xPuF6YI
 aQYrxde455gXgXViGZt7hLZOyUxppsyNgsSfahcneJw==
X-Received: by 2002:a05:6808:1981:b0:384:253:642d with SMTP id
 bj1-20020a056808198100b003840253642dmr2654109oib.3.1679865045023; 
 Sun, 26 Mar 2023 14:10:45 -0700 (PDT)
X-Google-Smtp-Source: AK7set9LRIfmPPswRb8N9OrMPMPvnbVyw1fiCldceb4cFKXbGCGUx8jc7BWFgmIQC9bvw4jnGpxSDwH/TkV83kSpJMw=
X-Received: by 2002:a05:6808:1981:b0:384:253:642d with SMTP id
 bj1-20020a056808198100b003840253642dmr2654107oib.3.1679865044778; Sun, 26 Mar
 2023 14:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230102161903.3857354-1-casantos@redhat.com>
In-Reply-To: <20230102161903.3857354-1-casantos@redhat.com>
From: Carlos Santos <casantos@redhat.com>
Date: Sun, 26 Mar 2023 18:10:34 -0300
Message-ID: <CAC1VKkMGu7Nxy6nCf94np1gJVaV1xWzO+=MsjLUVarmUjpB1tQ@mail.gmail.com>
Subject: Re: [PATCH] meson: allow disablind the installation of keymaps
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=casantos@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Mon, Jan 2, 2023 at 1:19=E2=80=AFPM <casantos@redhat.com> wrote:
>
> From: Carlos Santos <casantos@redhat.com>
>
> There are situatuions in which the keyboard maps are not necessary (e.g.
> when building only tools or linux-user emulator). Add an option to avoid
> installing them, as already possible to do with firmware blobs.
>
> Signed-off-by: Carlos Santos <casantos@redhat.com>
> ---
>  configure                     | 2 ++
>  meson_options.txt             | 2 ++
>  pc-bios/keymaps/meson.build   | 6 ++++--
>  scripts/meson-buildoptions.sh | 4 ++++
>  4 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/configure b/configure
> index 789a4f6cc9..c6ed6a23d0 100755
> --- a/configure
> +++ b/configure
> @@ -889,6 +889,8 @@ for opt do
>    ;;
>    --disable-blobs) meson_option_parse --disable-install-blobs ""
>    ;;
> +  --disable-keymaps) meson_option_parse --disable-install-keymaps ""
> +  ;;
>    --enable-vfio-user-server) vfio_user_server=3D"enabled"
>    ;;
>    --disable-vfio-user-server) vfio_user_server=3D"disabled"
> diff --git a/meson_options.txt b/meson_options.txt
> index 559a571b6b..be27137e98 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -48,6 +48,8 @@ option('module_upgrades', type : 'boolean', value : fal=
se,
>         description: 'try to load modules from alternate paths for upgrad=
es')
>  option('install_blobs', type : 'boolean', value : true,
>         description: 'install provided firmware blobs')
> +option('install_keymaps', type : 'boolean', value : true,
> +       description: 'install provided keyboard maps')
>  option('sparse', type : 'feature', value : 'auto',
>         description: 'sparse checker')
>  option('guest_agent', type : 'feature', value : 'auto',
> diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
> index 06c75e646b..7d80c23005 100644
> --- a/pc-bios/keymaps/meson.build
> +++ b/pc-bios/keymaps/meson.build
> @@ -47,7 +47,7 @@ if native_qemu_keymap.found()
>                         build_by_default: true,
>                         output: km,
>                         command: [native_qemu_keymap, '-f', '@OUTPUT@', a=
rgs.split()],
> -                       install: true,
> +                       install: get_option('install_keymaps'),
>                         install_dir: qemu_datadir / 'keymaps')
>    endforeach
>
> @@ -56,4 +56,6 @@ else
>    install_data(keymaps.keys(), install_dir: qemu_datadir / 'keymaps')
>  endif
>
> -install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
> +if get_option('install_keymaps')
> +  install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
> +endif
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.s=
h
> index aa6e30ea91..f17d9c196e 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -11,6 +11,8 @@ meson_options_help() {
>    printf "%s\n" '  --datadir=3DVALUE          Data file directory [share=
]'
>    printf "%s\n" '  --disable-coroutine-pool coroutine freelist (better p=
erformance)'
>    printf "%s\n" '  --disable-install-blobs  install provided firmware bl=
obs'
> +  printf "%s\n" '  --disable-install-keymaps'
> +  printf "%s\n" '                           install provided keyboard ma=
ps'
>    printf "%s\n" '  --docdir=3DVALUE           Base directory for documen=
tation installation'
>    printf "%s\n" '                           (can be empty) [share/doc]'
>    printf "%s\n" '  --enable-block-drv-whitelist-in-tools'
> @@ -291,6 +293,8 @@ _meson_option_parse() {
>      --includedir=3D*) quote_sh "-Dincludedir=3D$2" ;;
>      --enable-install-blobs) printf "%s" -Dinstall_blobs=3Dtrue ;;
>      --disable-install-blobs) printf "%s" -Dinstall_blobs=3Dfalse ;;
> +    --enable-install-keymaps) printf "%s" -Dinstall_keymaps=3Dtrue ;;
> +    --disable-install-keymaps) printf "%s" -Dinstall_keymaps=3Dfalse ;;
>      --interp-prefix=3D*) quote_sh "-Dinterp_prefix=3D$2" ;;
>      --enable-jack) printf "%s" -Djack=3Denabled ;;
>      --disable-jack) printf "%s" -Djack=3Ddisabled ;;
> --
> 2.31.1
>

This patch can be ignored. I submitted a better solution, which make
the installation depend on have_linux_user or have_bsd_user or
have_system.
--=20
Carlos Santos
Senior Software Maintenance Engineer
Red Hat
casantos@redhat.com    T: +55-11-3534-6186


