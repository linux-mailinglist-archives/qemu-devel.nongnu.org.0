Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 051153EA278
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 11:49:47 +0200 (CEST)
Received: from localhost ([::1]:51688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE7LO-0007eF-3N
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 05:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mE7Bz-0007iV-V6
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:40:03 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mE7Bx-0004Fe-Ul
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:40:03 -0400
Received: by mail-wr1-x42d.google.com with SMTP id r6so7387908wrt.4
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 02:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=E6OTNO1ilkF9rgGQfiCuCQdkjFqisEiGwnqUZ1o/nFM=;
 b=k1BOe1cicgRmn/skyO/iUIPFGDCtqjBwwovQD0Z2U482ZqvqNWw7GWhTPkIRA9pOEQ
 F9ir55BnUOgxqU8Zc8Wsgug/Zunq3pEyUfDLG2qlqkXcjRlHN89J8k6/u4EXqD3z1taR
 J/oQ4FAFaEBjTYzPkqOFPKSA/pxDBMCLmcr9Z1eYXkxz97Wo1TehlfObLmDeICbwBVHs
 LEKLem4MQ76ERMzA+nPJYdxiX1Cc0bd0V+qGoNbWxwgg2sO9pkSo6XIvA95z0yHeByOC
 +4DCwd7Ndb7Fbd86UPpLDckelZzrNQ41pJFWYN1tVIzdNuRJUftdvekb79+rrG28DdAq
 14oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=E6OTNO1ilkF9rgGQfiCuCQdkjFqisEiGwnqUZ1o/nFM=;
 b=M0GokEfwSJCWJrfsPTE3ik4TOg1/up30o+S+Xm9uuW42WXgr1aT1942aPbgzb4fPI2
 FH6zYgvRWxDkq9nqdzSYaUDd1RjArLzArv/02Nem8X4UrO37gVZD9hKvJEj1oxH0q+lb
 +SKfPoRbo5oF5Yw37cb8hxLjurDTAlTte2+YvhsnOOSHE2b2S/N0dbeX3AnMMGDX588r
 +ba7EMCh/ZL/4pcZe9q3T0tpWrtRC6nbrZ7kFkke+O4RBWfcUT20DGpeI2oMaIK/nD96
 LsjO3pCku62cNpRbRrtp88nl6njVpQN4eUhIkHk2jQ91hnSqLOmn4lbWAnSlEsRPE9oW
 JV/A==
X-Gm-Message-State: AOAM532jB9Zu0jl0m6VVnUr9Hgs2wNPy/QeYeAW1s5hq1wuNlGLTpf5a
 3vSmXERyqDX/zWIbT9H72DdaeQ==
X-Google-Smtp-Source: ABdhPJx7nOnGtFhoq6ywc95dd+TseSIZ5IMnkKFNBkZEqSdzanpseill9SUflzN7BYsW8doRWqX/UA==
X-Received: by 2002:a05:6000:11c5:: with SMTP id
 i5mr2938207wrx.183.1628761199597; 
 Thu, 12 Aug 2021 02:39:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q3sm1914894wmf.37.2021.08.12.02.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:39:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A22011FF96;
 Thu, 12 Aug 2021 10:39:57 +0100 (BST)
References: <20210811100550.54714-1-pbonzini@redhat.com>
User-agent: mu4e 1.6.2; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for 6.1] plugins: do not limit exported symbols if
 modules are active
Date: Thu, 12 Aug 2021 10:36:20 +0100
In-reply-to: <20210811100550.54714-1-pbonzini@redhat.com>
Message-ID: <875ywb6lxu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> On Mac --enable-modules and --enable-plugins are currently incompatible, =
because the
> Apple -Wl,-exported_symbols_list command line options prevents the export=
 of any
> symbols needed by the modules.  On x86 -Wl,--dynamic-list does not have t=
his effect,
> but only because the -Wl,--export-dynamic option provided by gmodule-2.0.=
pc overrides
> it.  On Apple there is no -Wl,--export-dynamic, because it is the default=
, and thus
> no override.
>
> Either way, when modules are active there is no reason to include the plu=
gin_ldflags.
> While at it, avoid the useless -Wl,--export-dynamic when --enable-plugins=
 is
> specified but --enable-modules is not; this way, the GNU and Apple config=
urations
> are more similar.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/516
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure           |  5 ++---
>  plugins/meson.build | 14 ++++++++------
>  2 files changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/configure b/configure
> index 9a79a004d7..a8721601ea 100755
> --- a/configure
> +++ b/configure
> @@ -3187,9 +3187,8 @@ glib_req_ver=3D2.56
>  glib_modules=3Dgthread-2.0
>  if test "$modules" =3D yes; then
>      glib_modules=3D"$glib_modules gmodule-export-2.0"
> -fi
> -if test "$plugins" =3D "yes"; then
> -    glib_modules=3D"$glib_modules gmodule-2.0"
> +elif test "$plugins" =3D "yes"; then
> +    glib_modules=3D"$glib_modules gmodule-noexport-2.0"

This brings in a new dependency because I can't configure now:

  =E2=9E=9C  ../../configure

  ERROR: glib-2.56 gmodule-noexport-2.0 is required to compile QEMU

Should it be gmodule-no-export? Hopefully the different distros aren't
packaging different .pc files.

>  fi
>=20=20
>  for i in $glib_modules; do
> diff --git a/plugins/meson.build b/plugins/meson.build
> index e77723010e..bfd5c9822a 100644
> --- a/plugins/meson.build
> +++ b/plugins/meson.build
> @@ -1,9 +1,11 @@
> -if 'CONFIG_HAS_LD_DYNAMIC_LIST' in config_host
> -  plugin_ldflags =3D ['-Wl,--dynamic-list=3D' + (meson.build_root() / 'q=
emu-plugins-ld.symbols')]
> -elif 'CONFIG_HAS_LD_EXPORTED_SYMBOLS_LIST' in config_host
> -  plugin_ldflags =3D ['-Wl,-exported_symbols_list,' + (meson.build_root(=
) / 'qemu-plugins-ld64.symbols')]
> -else
> -  plugin_ldflags =3D []
> +plugin_ldflags =3D []
> +# Modules need more symbols than just those in plugins/qemu-plugins.symb=
ols
> +if not enable_modules
> +  if 'CONFIG_HAS_LD_DYNAMIC_LIST' in config_host
> +    plugin_ldflags =3D ['-Wl,--dynamic-list=3D' + (meson.build_root() / =
'qemu-plugins-ld.symbols')]
> +  elif 'CONFIG_HAS_LD_EXPORTED_SYMBOLS_LIST' in config_host
> +    plugin_ldflags =3D ['-Wl,-exported_symbols_list,' + (meson.build_roo=
t() / 'qemu-plugins-ld64.symbols')]
> +  endif
>  endif

Does this mean --enable-modules would allow plugins to access more of
the API space than we intended in the first place?

--=20
Alex Benn=C3=A9e

