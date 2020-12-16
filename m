Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B422DC269
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 15:42:52 +0100 (CET)
Received: from localhost ([::1]:57600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpY0w-0006zn-Ph
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 09:42:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpXfB-0000Vq-C9
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 09:20:21 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:34681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpXf7-0000s9-MS
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 09:20:20 -0500
Received: by mail-wm1-x331.google.com with SMTP id g25so2034942wmh.1
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 06:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Gs7meh+3bJjbFTHnZwM+9bF5c3lflXz6smvvrrqWq6A=;
 b=mrJ29aEseAk1UKyb3wRefs8/YswhHS2OM+t6gwKmNvOcBNWkYOKlrpAf8knx+MUVQm
 a3HaFKgwi6ESGAYtT6eeZCuLcmeFQgDkrM3ZybrpVXcLSOINqRaL0lB23FmQfUzo1rZK
 gXBbK42cbgtYBvBmhE4pmfLew4uTaloH1/d7z+8L1AAfvvpKrQROZSxM0PPoHDvkevJt
 rinQ+j6XW2pgAgf7YtzDw79GAvkk4aUvDa3Yxyo73dl+SmPr8le5SWnsCsbyFU62dHrp
 zEcCbptY7rT6H8VtYV46O3iW1ybgF3kt3vW3qxarXElWT5Yxruhi+b3QV889rtvlytyZ
 G1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Gs7meh+3bJjbFTHnZwM+9bF5c3lflXz6smvvrrqWq6A=;
 b=LulavaiK7Zhw0L6geGzYtRbWRTdNN4+M7t4jRN2MvFOA8oTb29VkRJ8OPCfFPdhWOM
 9/pDV+Pyd0Zxhr32O04AORFSViDQ3wVXbxx1Q+A8QUjimfRaqh/RpaZfWCo+gSjuxCTr
 kYO3hddhkzBpdGlg9x0ZMFcHMDs32pm7heXELKoUko5R08LOgZBnM/F1LkxyudAkQFG7
 tqtODwODpOmgnqGnrHB8e9Jh9XM3g6SsP4Bdsk/c5hU9jqAAC3cr68aTsCtCZH/Uba/e
 PPu3yjl2LCaqbkZrAoWZQQ4ozfmj1OZo/VC9sr0D5JspBqY2OhV8K31gdfSoYK3xIb6q
 x0iA==
X-Gm-Message-State: AOAM533+sQmRBgxNZTUFIw8wVjhKHRdrY2w4JwSk/6R9bRoixpehVsvj
 fZ5bI/osaiHH13DjeCIzQtDVYg==
X-Google-Smtp-Source: ABdhPJxTU4Dyp41BsmsArQoq1vOxCtSVEWmk9aAgvaPJbkiWqsrD4zdUyxh/fahJTYZWwu+7EbpeAA==
X-Received: by 2002:a1c:6446:: with SMTP id y67mr3556506wmb.144.1608128415706; 
 Wed, 16 Dec 2020 06:20:15 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a65sm3007981wmc.35.2020.12.16.06.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 06:20:14 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 76B0D1FF7E;
 Wed, 16 Dec 2020 14:20:13 +0000 (GMT)
References: <20201210190417.31673-1-alex.bennee@linaro.org>
 <20201210190417.31673-4-alex.bennee@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH  v2 3/8] configure: move gettext detection to meson.build
Date: Wed, 16 Dec 2020 14:19:59 +0000
In-reply-to: <20201210190417.31673-4-alex.bennee@linaro.org>
Message-ID: <873605u92a.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> This will allow meson to honour -Dauto_features=3Ddisabled later.
>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

ping Paolo, are you happy with this bit?

> ---
>  configure         | 19 +++----------------
>  meson_options.txt |  2 +-
>  po/meson.build    |  2 +-
>  3 files changed, 5 insertions(+), 18 deletions(-)
>
> diff --git a/configure b/configure
> index 8f2095a2db..46fdea88c7 100755
> --- a/configure
> +++ b/configure
> @@ -448,7 +448,7 @@ libdaxctl=3D""
>  meson=3D""
>  ninja=3D""
>  skip_meson=3Dno
> -gettext=3D""
> +gettext=3D"auto"
>=20=20
>  bogus_os=3D"no"
>  malloc_trim=3D"auto"
> @@ -1014,9 +1014,9 @@ for opt do
>    ;;
>    --enable-vnc) vnc=3D"enabled"
>    ;;
> -  --disable-gettext) gettext=3D"false"
> +  --disable-gettext) gettext=3D"disabled"
>    ;;
> -  --enable-gettext) gettext=3D"true"
> +  --enable-gettext) gettext=3D"enabled"
>    ;;
>    --oss-lib=3D*) oss_lib=3D"$optarg"
>    ;;
> @@ -2839,19 +2839,6 @@ if test "$xen_pci_passthrough" !=3D "disabled"; th=
en
>    fi
>  fi
>=20=20
> -##########################################
> -# gettext probe
> -if test "$gettext" !=3D "false" ; then
> -  if has xgettext; then
> -    gettext=3Dtrue
> -  else
> -    if test "$gettext" =3D "true" ; then
> -      feature_not_found "gettext" "Install xgettext binary"
> -    fi
> -    gettext=3Dfalse
> -  fi
> -fi
> -
>  ##########################################
>  # X11 probe
>  if $pkg_config --exists "x11"; then
> diff --git a/meson_options.txt b/meson_options.txt
> index f6f64785fe..191e848600 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -9,7 +9,7 @@ option('sphinx_build', type : 'string', value : '',
>=20=20
>  option('docs', type : 'feature', value : 'auto',
>         description: 'Documentations build support')
> -option('gettext', type : 'boolean', value : true,
> +option('gettext', type : 'feature', value : 'auto',
>         description: 'Localization of the GTK+ user interface')
>  option('install_blobs', type : 'boolean', value : true,
>         description: 'install provided firmware blobs')
> diff --git a/po/meson.build b/po/meson.build
> index 1387fd979a..a863f0575f 100644
> --- a/po/meson.build
> +++ b/po/meson.build
> @@ -1,6 +1,6 @@
>  i18n =3D import('i18n')
>=20=20
> -if get_option('gettext')
> +if find_program('xgettext', required: get_option('gettext')).found()
>    i18n.gettext(meson.project_name(),
>                 args: '--msgid-bugs-address=3Dqemu-devel@nongnu.org',
>                 preset: 'glib')


--=20
Alex Benn=C3=A9e

