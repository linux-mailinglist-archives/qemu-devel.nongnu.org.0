Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 946BC579EA9
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 15:03:52 +0200 (CEST)
Received: from localhost ([::1]:49728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDmtD-0006nP-6J
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 09:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDmpk-0004Cc-SX
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:00:16 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:38551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDmpi-0001ri-Kt
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:00:16 -0400
Received: by mail-yb1-xb32.google.com with SMTP id i206so26304506ybc.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 06:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rSHRQm/31u/kTonXKEjtLnLZk7uCeDMas7o+NQTUOno=;
 b=XkqkcxgFEjjj6vrsmuwQ2HnT8GFyiEV7rAuMsy6GV6x4GuX/efrnMEU4LCcL7H3XEX
 qpZzC1ez7HukizVodESbwj4GYJwWiqrsMyOrYPGws7myrNXHEyZ/Qxt4fZdhaGufKA+8
 HgfO7Rchs8PLQzduo35kCdtefdt1q9XLxFI6mtFGoaccngqX5ZGFd+jvX0Yavs4KwCob
 FOp6eFFEEXRVKdBcNQL7OYl3NUFoDnEI9lqbF6yvlDrhWTv9/ANNEteMHdE9bGZYLFXd
 9eoeL8wMdHowyi+WIU6gd+BPwricBjuxdsnSbuuNpaxvA2fpJaPxZWJ4FY2TiDpTuBkF
 dYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rSHRQm/31u/kTonXKEjtLnLZk7uCeDMas7o+NQTUOno=;
 b=vX1G1LALOfDoLWUdUxi9GHLvXngSjf0AhF3xDoS6WEvyOYpMdTiki6wQkpwfJ5zr8D
 swRlVcpLA9/JbaQobCcK5JHOPbmh05Tz8sJntrmkbSunAkIj5iCZ3f9RQG0HSWLsnznb
 eqTQsyxGo0K9sLILpWkyGisTDtZGkEs3TPTKkdCgzqnnBZsIyIWKfl2AaIuQaoprmkVc
 xiVYLFZKwNt87VtkArQlJIxq+z9M2HaFFlLjfXlJ6GhunFbkGZmDhwRPF5Fq5RK9CSGt
 AT6TGzc1eI5p09hDet9ZHDj6pUNMrjEIr1nCfGFLgJbyACm0qhrL0rDd/WnlIgFu5qq2
 gc0g==
X-Gm-Message-State: AJIora/qGgqbudArxjOd9G/W7Bi+2gqW97CMroUIUz/SKNLyuwi3Xpa2
 Voc0Rk3DLcRjfeI5xf2MbVzObnUPYRiXxr5BTGC3HA==
X-Google-Smtp-Source: AGRyM1s3r4n1BI+HGEygeNFw5OxAM6Vd/Ft5LHVTqcAnmObVovdshifuKUoe1vS2ulFIPBRgLspRFHAbqlDjFjchvug=
X-Received: by 2002:a25:d307:0:b0:670:80fd:85c4 with SMTP id
 e7-20020a25d307000000b0067080fd85c4mr2712109ybf.67.1658235611942; Tue, 19 Jul
 2022 06:00:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211219141711.248066-1-pbonzini@redhat.com>
 <20211219141711.248066-8-pbonzini@redhat.com>
In-Reply-To: <20211219141711.248066-8-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jul 2022 14:00:00 +0100
Message-ID: <CAFEAcA-uAYrZPzGZfSVOQ16cxfYiR8k_J5D0XWNYn49V_hdmCA@mail.gmail.com>
Subject: Re: [PULL 07/16] configure, meson: move ARCH to meson.build
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sun, 19 Dec 2021 at 14:25, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> $ARCH and the HOST_* symbols are only used by the QEMU build; configure
> uses $cpu instead.  Remove it from config-host.mak.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure   | 21 ++++-----------------
>  meson.build | 26 +++++++++++++++++---------
>  2 files changed, 21 insertions(+), 26 deletions(-)
>
> diff --git a/configure b/configure
> index 108b7621e2..6e06ac6161 100755
> --- a/configure
> +++ b/configure
> @@ -635,11 +635,9 @@ else
>    cpu=$(uname -m)
>  fi
>
> -ARCH=
> -# Normalise host CPU name, set ARCH and multilib cflags
> +# Normalise host CPU name, set multilib cflags
>  # Note that this case should only have supported host CPUs, not guests.
>  case "$cpu" in
> -  aarch64|riscv) ;;
>    armv*b|armv*l|arm)
>      cpu="arm" ;;
>
> @@ -668,8 +666,7 @@ case "$cpu" in
>      CPU_CFLAGS="-m64 -mlittle" ;;
>
>    s390)
> -    CPU_CFLAGS="-m31"
> -    ARCH=unknown ;;
> +    CPU_CFLAGS="-m31" ;;
>    s390x)
>      CPU_CFLAGS="-m64" ;;
>
> @@ -678,15 +675,7 @@ case "$cpu" in
>      CPU_CFLAGS="-m32 -mv8plus -mcpu=ultrasparc" ;;
>    sparc64)
>      CPU_CFLAGS="-m64 -mcpu=ultrasparc" ;;
> -
> -  *)
> -    # This will result in either an error or falling back to TCI later
> -    ARCH=unknown
> -  ;;
>  esac
> -if test -z "$ARCH"; then
> -  ARCH="$cpu"
> -fi
>
>  : ${make=${MAKE-make}}

shellcheck points out that this (old) commit removed the code
setting ARCH from configure, but left behind a use of it:

case "$ARCH" in
alpha)
  # Ensure there's only a single GP
  QEMU_CFLAGS="-msmall-data $QEMU_CFLAGS"
;;
esac

Presumably meson.build needs to do some equivalent of this ?

thanks
-- PMM

