Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D42996481E4
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:41:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3beY-0003cP-Fn; Fri, 09 Dec 2022 06:34:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p3beV-0003ak-Rd
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:34:51 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p3beT-0001Z0-RQ
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:34:51 -0500
Received: by mail-pf1-x433.google.com with SMTP id g1so3490744pfk.2
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XV0XqeyQU6PLvsHuKc069f8ZdwRDaPwDyrc0TVa3h/0=;
 b=b4vSI9qCTO7ZMUFA1YUFUOv0uQfIPFCta9Q0fYbIWcYlykrJ14zSz6SWBLHF666meP
 YE/f1icVvl4zsB3DrOxvHJwUZxTQEO4lpbHRbA7y4kn1YK0HWfZ72Cu9osnU6TIp5hYx
 zOpPgCwrtoVlqihxmNO82LJJ6qqbcG6/Ukx77vSdh7L1xOyxRZUlxM1sOoSgiQHjwJSn
 AAdaYNm2LT8P4tPM6BUHR3mXJvzqdUlxJrcfaIeJZFgRnGRh7dHux4z4RwnLORSXQDt+
 u54GC9j3HOVtt35+qlMK5ehlo3wrhUa8F8nZ6kHy3gkXrtUKtrTrE/xYFh4WEvL/AxSJ
 7H4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XV0XqeyQU6PLvsHuKc069f8ZdwRDaPwDyrc0TVa3h/0=;
 b=WqYwB3Kr3hSB1T/+mrSkmtNUwPJ4zwYCiUI/Jle4nZ9aHLlR3AYzJ7XYUdpG1Rb+aX
 AP+lwAyXFfI3rDmjQpXVNBQAyxOV0Er62d5qOvpk/1HsqV1tZiRLOkCVOokMCqYEj199
 dv71tcnmRQNSLuYLgyjNCQ/1FUFjRJjwh8Q8Z8LVkRLByP0mnIdueKLFgwYLiDkXn3S3
 Qs8JvH61MmpFvq6JTivYYoEhaY3Z1wttyW0q/cHjtRPHhP/R4p9xuTPqZ3Nff1LAiN6z
 138so4kU1ACfHvfCljj904+GnKYSzAgksPljPf+To+M7zXu/wH6MF+5Ldwxgjg+RaKc/
 dgsw==
X-Gm-Message-State: ANoB5pkQsW7vaSase6tQSEfD3Ahk2+mM5pPeZ+fuStAmvi1G/YvG/CKq
 aYjg4g6mXcW7SEygO0aLnTwR4bfgJGSeBQjWDcYL2w==
X-Google-Smtp-Source: AA0mqf7qbTicLsHNcjupug9Vy7CLbiz08njNrl/znLDo0atf4yeC1/s6QtGwYca+B9GVj+WIfJfWXDLC4cOMy5aduuY=
X-Received: by 2002:a62:b501:0:b0:573:1959:c356 with SMTP id
 y1-20020a62b501000000b005731959c356mr78483372pfe.51.1670585688175; Fri, 09
 Dec 2022 03:34:48 -0800 (PST)
MIME-Version: 1.0
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-4-pbonzini@redhat.com>
In-Reply-To: <20221209112409.184703-4-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Dec 2022 11:34:36 +0000
Message-ID: <CAFEAcA9QbCxBW0ZmnzXr=ry3XyHX6YKH0ZxGDCfTmRmSbao+3Q@mail.gmail.com>
Subject: Re: [PATCH 03/30] configure: remove useless test
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, 9 Dec 2022 at 11:25, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> $cpu is derived from preprocessor defines rather than uname these days,
> so do not bother using isainfo on Solaris.  Likewise do not recognize
> BeOS's uname -m output.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
>
> diff --git a/configure b/configure
> index 543fd5a48bf0..db2b45740449 100755
> --- a/configure
> +++ b/configure
> @@ -337,9 +337,6 @@ for opt do
>    ;;
>    esac
>  done
> -# OS specific
> -# Using uname is really, really broken.  Once we have the right set of checks
> -# we can eliminate its usage altogether.

I note that the fallback if we match no #defines is still "use uname".
We can only get rid of that if we're willing to say "must be a
known host architecture, even if using TCI", though. Or we could
force the 1 person using that setup to specify --cpu manually, perhaps.

>  # Preferred compiler:
>  #  ${CC} (if set)
> @@ -489,13 +486,6 @@ sunos)
>    QEMU_CFLAGS="-D_XOPEN_SOURCE=600 $QEMU_CFLAGS"
>  # needed for TIOCWIN* defines in termios.h
>    QEMU_CFLAGS="-D__EXTENSIONS__ $QEMU_CFLAGS"
> -  # $(uname -m) returns i86pc even on an x86_64 box, so default based on isainfo
> -  # Note that this check is broken for cross-compilation: if you're
> -  # cross-compiling to one of these OSes then you'll need to specify
> -  # the correct CPU with the --cpu option.
> -  if test -z "$cpu" && test "$(isainfo -k)" = "amd64"; then
> -    cpu="x86_64"
> -  fi

I found a random stackoverflow answer that says the Solaris
compiler does define the __x86_64__ macro that we check for, so
this should be OK.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

