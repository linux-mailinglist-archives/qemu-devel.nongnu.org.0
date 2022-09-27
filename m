Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E995EC03A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:58:54 +0200 (CEST)
Received: from localhost ([::1]:46278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od8Ie-0004nJ-Hp
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1od8EP-0006uT-Le
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:54:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1od8EM-0001wf-JA
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:54:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664276065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XbCsEkRI/CpahZal0hOEohBKYKNSblBModwEzEeRy3w=;
 b=P586AHcHaANxm75WqY47tpC8bgqV5FF5zeJTqxn7kuY7+DH7TgV/ZaTcJyCRc/mPPs/09t
 NM4UFEBFGi/fDL1ic3vMEsCStrPnSDuLGlYpD45A2LPPm+jUUrhUDaA9n8P7Au3rL9C3JE
 z7ho8B8ZTmcJNgEfpVy1espnhON0aJw=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-625-NgbeZSa6Pu-v2RPtfSK5wA-1; Tue, 27 Sep 2022 06:54:24 -0400
X-MC-Unique: NgbeZSa6Pu-v2RPtfSK5wA-1
Received: by mail-ot1-f71.google.com with SMTP id
 f13-20020a056830056d00b006549b545aa6so4518829otc.0
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 03:54:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=XbCsEkRI/CpahZal0hOEohBKYKNSblBModwEzEeRy3w=;
 b=locCE0HpqcxoILGp2E6Eav61ei9Lwp3EQuzO8SCp/BmTdUULoBpfVOQOVcC/nTDtUp
 o4RHq+GjIieeicwzUD+hTKs6eQ8+dCmVBWwhVyvRQ93m3yev6UlWUZkRBN4HaYsEFAk/
 XN4+8igbmrthAzgmc+wbkVzOtqTYoTqT6iIXlVENdN8uPfkRXDNgUdv+sbI/2TAZA4mV
 zXsGuwpLDy4JLL3A8l1vJMkdyLqUWFQRCT0aPeFm2fmpOwFy6/BJ5fbYrLUVKs820pd3
 4m0nd1FuFZPEDpMnXog0ZoFQPU06OYDPgn0VosY1VBCnSKoC1mUlniZpqZLXEMi44hTM
 T/wA==
X-Gm-Message-State: ACrzQf0SM6WehO5g4UCjK01VQHnPuIMEQUEiwIATkvQhPFXWDi12HsP+
 p5KyV9SMmRluJBop6sM7B6tTllA+q7nR1Yv7j3HISiF8ixcqy5jONUZrzevaJAVHCVGFbxk7GVr
 IS9c+dBotkzvMy6mUV1wfSq3ZGFhlKlw=
X-Received: by 2002:a05:6808:1687:b0:347:cbd3:3dcf with SMTP id
 bb7-20020a056808168700b00347cbd33dcfmr1476363oib.53.1664276063395; 
 Tue, 27 Sep 2022 03:54:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4HLok5hmyYHMyhwbkTYd+vwK2mZo7mdEQ1+eUMa9X7uTTbGT3rfMTRcZDRLmNANqDe8p9HJEP+irdoENkaAuM=
X-Received: by 2002:a05:6808:1687:b0:347:cbd3:3dcf with SMTP id
 bb7-20020a056808168700b00347cbd33dcfmr1476355oib.53.1664276063122; Tue, 27
 Sep 2022 03:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220927095921.261760-1-pbonzini@redhat.com>
 <20220927095921.261760-3-pbonzini@redhat.com>
In-Reply-To: <20220927095921.261760-3-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 27 Sep 2022 14:54:11 +0400
Message-ID: <CAMxuvazbKH_tZq0CNOuMn0hR4v_jyjtK9+2Fg=hab0K8n2Gj+w@mail.gmail.com>
Subject: Re: [PATCH 2/5] meson: require 0.61.3
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On Tue, Sep 27, 2022 at 1:59 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> This removes the dependency of dbus-display on --enable-modules.  It also=
 allows
> cleanups in modinfo collection and allows moving C++ compiler detection t=
o
> meson.build.
>
> Because it is now deprecated to use install_subdir to create an empty dir=
ectory,
> replace it with install_emptydir.
>
> Updating the Meson submodule to 0.61.5 also removes the message
>
>     WARNING: Broken python installation detected. Python files installed
>     by Meson might not be found by python interpreter.
>
> unless using system meson is forced with --meson.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/873
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/848
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

lgtm
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  configure       | 2 +-
>  meson           | 2 +-
>  meson.build     | 5 +----
>  qga/meson.build | 2 +-
>  4 files changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/configure b/configure
> index a963e6afb3..680d96d09f 100755
> --- a/configure
> +++ b/configure
> @@ -1114,7 +1114,7 @@ fi
>  python=3D"$python -B"
>
>  if test -z "$meson"; then
> -    if test "$explicit_python" =3D no && has meson && version_ge "$(meso=
n --version)" 0.59.3; then
> +    if test "$explicit_python" =3D no && has meson && version_ge "$(meso=
n --version)" 0.61.5; then
>          meson=3Dmeson
>      elif test "$git_submodules_action" !=3D 'ignore' ; then
>          meson=3Dgit
> diff --git a/meson b/meson
> index 12f9f04ba0..3a9b285a55 160000
> --- a/meson
> +++ b/meson
> @@ -1 +1 @@
> -Subproject commit 12f9f04ba0decfda425dbbf9a501084c153a2d18
> +Subproject commit 3a9b285a55b91b53b2acda987192274352ecb5be
> diff --git a/meson.build b/meson.build
> index 1f6634d4cd..8be01ba1c3 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1,4 +1,4 @@
> -project('qemu', ['c'], meson_version: '>=3D0.59.3',
> +project('qemu', ['c'], meson_version: '>=3D0.61.3',
>          default_options: ['warning_level=3D1', 'c_std=3Dgnu11', 'cpp_std=
=3Dgnu++11', 'b_colorout=3Dauto',
>                            'b_staticpic=3Dfalse', 'stdsplit=3Dfalse', 'op=
timization=3D2', 'b_pie=3Dtrue'],
>          version: files('VERSION'))
> @@ -1669,12 +1669,9 @@ endif
>  have_host_block_device =3D (targetos !=3D 'darwin' or
>      cc.has_header('IOKit/storage/IOMedia.h'))
>
> -# FIXME enable_modules shouldn't be necessary, but: https://github.com/m=
esonbuild/meson/issues/8333
>  dbus_display =3D get_option('dbus_display') \
>    .require(gio.version().version_compare('>=3D2.64'),
>             error_message: '-display dbus requires glib>=3D2.64') \
> -  .require(enable_modules,
> -           error_message: '-display dbus requires --enable-modules') \
>    .require(gdbus_codegen.found(),
>             error_message: '-display dbus requires gdbus-codegen') \
>    .require(opengl.found() and gbm.found(),
> diff --git a/qga/meson.build b/qga/meson.build
> index 65c1e93846..a0ffd6d268 100644
> --- a/qga/meson.build
> +++ b/qga/meson.build
> @@ -138,7 +138,7 @@ else
>    if get_option('guest_agent_msi').enabled()
>      error('MSI guest agent package is available only for MinGW Windows c=
ross-compilation')
>    endif
> -  install_subdir('run', install_dir: get_option('localstatedir'))
> +  install_emptydir(get_option('localstatedir') / 'run')
>  endif
>
>  alias_target('qemu-ga', all_qga)
> --
> 2.37.3
>


