Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3CF6499C3
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 08:53:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4dch-00044J-Jm; Mon, 12 Dec 2022 02:53:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4dcb-00043L-6k
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 02:53:09 -0500
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4dcZ-0004Zm-Ce
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 02:53:08 -0500
Received: by mail-lj1-x235.google.com with SMTP id b9so11631341ljr.5
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 23:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8uyh7l0Z+i05U3SKYGJBiCMAaowAObAfe0D18dtL8wg=;
 b=Pwk+L9CR8Ek1Kk7ZhK722gS6JhQqrAyCcsGSu6iy0Y4Zy3OcCK/5c8nlSaJ1yJTeKf
 NC6KCkYI+CORJe+kk13fPRfQvUWUHqosBxaezg7VZsB+UBenDi86ufflLRHzEuiZ85Oj
 jLm1QvTByKlaRmSiD/iR15r3vyQLRTiHx3BYSf5a0hKgp5qKXFnF7NhkHGirxDVZi9Rt
 lLCM9LeC/TGCnnA+JGqT+XGp+uEikhtVUQIl5H4KpzDkFTWqnvktfRKv3qFcYlK/wCl5
 kH36i9AIPFZGoSUHW8BNKFT0qt1fYzqFFTCuIbuve6lTnMPLv0WghAjkMt7/qyGGoyfl
 lkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8uyh7l0Z+i05U3SKYGJBiCMAaowAObAfe0D18dtL8wg=;
 b=iBdEXz+l9+PJjKkkkYIptvVEf/7Z08QOh7oMP32sGaukK4WhOKY4NB+rZ1z/LQVmrI
 8+Z/Id3xAA+2FBRygV+0C3OnTgeQwyPCskFiyuWuqC0FskVPwIu6vzAJJAKr7PeK8YOF
 3znskaL9OQYlFVfK/3pgWky6GUyvrL/8wqGw0Opl0Y33PShgexD/GaQaWNHvbCS+inMC
 8Ji7CLft+RbwD5zYw/adB3CH2hL1PpjPlcfmR/e4ccgHuwVmeE4W4tp1G9DnS4auvQab
 Fw7NFztb6oPqDCuI75hhfa9MjxSP2RCtQBLt+oVl/xOiKe8FpYfFWX9Vrbm1KpG9kMqB
 SCuw==
X-Gm-Message-State: ANoB5pl1RR59ImBpVCT5OjS6pH2BBOYjwEThWd8j8sHCB5b+ll8xIKH9
 5HDtyJtECFGl79D4FekWF6R2wFkVJbsTocl+ML4=
X-Google-Smtp-Source: AA0mqf7scFyHiIlAV8+xEa80TndcT/PGl3Y9r1XJZQQP0L1rpttx8zhxlm8gwkjpby45Kard409E0865TH/eRl2CPVY=
X-Received: by 2002:a05:651c:200c:b0:279:3d7a:c240 with SMTP id
 s12-20020a05651c200c00b002793d7ac240mr26365169ljo.289.1670831584900; Sun, 11
 Dec 2022 23:53:04 -0800 (PST)
MIME-Version: 1.0
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-5-pbonzini@redhat.com>
In-Reply-To: <20221209112409.184703-5-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 12 Dec 2022 11:52:53 +0400
Message-ID: <CAJ+F1CKM7=o0Ei2YnDzSWR5tqGAnGfyC5QVfuzbbtbn6jqpGag@mail.gmail.com>
Subject: Re: [PATCH 04/30] configure: preserve qemu-ga variables
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x235.google.com
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

On Fri, Dec 9, 2022 at 3:28 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Ensure that qemu-ga variables set at configure time are kept
> later when the script is rerun.  For preserve_env to work,
> the variables need to be empty so move the default values
> to config-host.mak generation.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  configure | 23 ++++++-----------------
>  1 file changed, 6 insertions(+), 17 deletions(-)
>
> diff --git a/configure b/configure
> index db2b45740449..4d14ff9c319c 100755
> --- a/configure
> +++ b/configure
> @@ -2222,20 +2222,6 @@ if test "$have_ubsan" =3D "yes"; then
>    QEMU_LDFLAGS=3D"-fsanitize=3Dundefined $QEMU_LDFLAGS"
>  fi
>
> -##########################################
> -# Guest agent Windows MSI package
> -
> -if test "$QEMU_GA_MANUFACTURER" =3D ""; then
> -  QEMU_GA_MANUFACTURER=3DQEMU
> -fi
> -if test "$QEMU_GA_DISTRO" =3D ""; then
> -  QEMU_GA_DISTRO=3DLinux
> -fi
> -if test "$QEMU_GA_VERSION" =3D ""; then
> -    QEMU_GA_VERSION=3D$(cat "$source_path"/VERSION)
> -fi
> -
> -
>  #######################################
>  # cross-compiled firmware targets
>
> @@ -2331,9 +2317,9 @@ if test "$debug_tcg" =3D "yes" ; then
>  fi
>  if test "$mingw32" =3D "yes" ; then
>    echo "CONFIG_WIN32=3Dy" >> $config_host_mak
> -  echo "QEMU_GA_MANUFACTURER=3D${QEMU_GA_MANUFACTURER}" >> $config_host_=
mak
> -  echo "QEMU_GA_DISTRO=3D${QEMU_GA_DISTRO}" >> $config_host_mak
> -  echo "QEMU_GA_VERSION=3D${QEMU_GA_VERSION}" >> $config_host_mak
> +  echo "QEMU_GA_MANUFACTURER=3D${QEMU_GA_MANUFACTURER-QEMU}" >> $config_=
host_mak
> +  echo "QEMU_GA_DISTRO=3D${QEMU_GA_DISTRO-Linux}" >> $config_host_mak
> +  echo "QEMU_GA_VERSION=3D${QEMU_GA_VERSION-$(cat "$source_path"/VERSION=
)}" >> $config_host_mak
>  else
>    echo "CONFIG_POSIX=3Dy" >> $config_host_mak
>  fi
> @@ -2647,6 +2633,9 @@ preserve_env PKG_CONFIG
>  preserve_env PKG_CONFIG_LIBDIR
>  preserve_env PKG_CONFIG_PATH
>  preserve_env PYTHON
> +preserve_env QEMU_GA_MANUFACTURER
> +preserve_env QEMU_GA_DISTRO
> +preserve_env QEMU_GA_VERSION
>  preserve_env SDL2_CONFIG
>  preserve_env SMBD
>  preserve_env STRIP
> --
> 2.38.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

