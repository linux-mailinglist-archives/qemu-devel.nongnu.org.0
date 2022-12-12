Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F00E64A2E8
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 15:11:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4jMl-0001jK-DK; Mon, 12 Dec 2022 09:01:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4jMF-0001VV-DT
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:00:49 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4jMD-0000NR-Jh
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:00:39 -0500
Received: by mail-lf1-x132.google.com with SMTP id cf42so18768324lfb.1
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 06:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H6UmqMD0sKrfqZxWSvtUASt90O7Mf0KqO/lxMOu6WyI=;
 b=oZ0TADT84dWzQySqIyA8l7pVFj+AoYagRb4iCD/IPlDMmMDu2xQrxKg6r+wN2X1nFi
 YBF9O4tU4+Cn6xgV+xKltYM9+ek0f5Hf8Op90iYOGvyoPxG9ygh35TWmv7sGIW9aMiPj
 cKLIGjiGYb+CRHQdBdol55DWL4kh7umz8Y5zh0Zt2LV+GfW0dt6CQCWlgdYtRXVn0q+W
 zybUfdZMjc/Tzuucu272U9qLRd+4JmsfneIP17//W5BVqFJrj31H2xSYUnw1/am8cp3O
 bxke8na+tc3TqObuwNvIu9xT2YI0Z0ikULnB7egqBb9l8rLwK/2nOISFGUJpBwtQ92Ge
 vBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H6UmqMD0sKrfqZxWSvtUASt90O7Mf0KqO/lxMOu6WyI=;
 b=lgWPY2mgGLhieJ7SWaMfQyYnurUkR084czffzzqGpU2IA0R/MYXTWpzFuqgUFsVxmx
 PyFKIjZZAnyFRez5bEbP4uFeqdi5qM4hjXVCj+3loNbSkDrf1rxF2nLSBgWm4sGZc3p9
 Fm3TNW2//TubNuhw6EGvSSP/sD32+UtBoo9/SzIgVOHaGEjqofWgXTmdNg8+JesAGaFx
 5cBNx7KrQV5Xh2wy+2beJdDb/UWLPpt5kA2FwnxcnB6gJrbkzHqjDyp7IXd3N1ZEYmAH
 JWeVV/tgdbxdvUX6/i+n5bZStt27xfSuv0jrH2tHdVDhqgaaB0HCtZJjDt2WgPLzh+Qj
 0fDA==
X-Gm-Message-State: ANoB5pnVmTQbuxyJpPJWKcCX7MsfQ6ux/Fn891Z1EzJjkfSEKJ2cBkQh
 dJGwJjXRhHAp2vLY7SHF1vu6QpIVM2vveimoy8A=
X-Google-Smtp-Source: AA0mqf66AcQdRCIpyKc7EWOAfyl4ThQLyA9bNck+wsd+YFLscWSNDlawG0NlXjmFYt1hs6V/b/PQkIm0QrE0McyJ/sQ=
X-Received: by 2002:a05:6512:1395:b0:4b5:57fe:44da with SMTP id
 p21-20020a056512139500b004b557fe44damr8383379lfa.362.1670853633834; Mon, 12
 Dec 2022 06:00:33 -0800 (PST)
MIME-Version: 1.0
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-30-pbonzini@redhat.com>
In-Reply-To: <20221209112409.184703-30-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 12 Dec 2022 18:00:22 +0400
Message-ID: <CAJ+F1CJy++K7=MOVcb_GnBpsXqbisAkj+=1oihZHZ6ktvtzzqA@mail.gmail.com>
Subject: Re: [PATCH 29/30] configure: do not rerun the tests with -Werror
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x132.google.com
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

Hi

On Fri, Dec 9, 2022 at 3:44 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Tests run in configure are pretty trivial at this point, so
> do not bother with the extra complication of running tests
> both with and without -Werror.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  configure | 35 +----------------------------------
>  1 file changed, 1 insertion(+), 34 deletions(-)
>
> diff --git a/configure b/configure
> index a7c95535fd01..745745ded35b 100755
> --- a/configure
> +++ b/configure
> @@ -119,41 +119,8 @@ lines: ${BASH_LINENO[*]}"
>    $compiler "$@" >> config.log 2>&1 || return $?
>  }
>
> -do_compiler_werror() {
> -    # Run the compiler, capturing its output to the log. First argument
> -    # is compiler binary to execute.
> -    compiler=3D"$1"
> -    shift
> -    if test -n "$BASH_VERSION"; then eval '
> -        echo >>config.log "
> -funcs: ${FUNCNAME[*]}
> -lines: ${BASH_LINENO[*]}"
> -    '; fi
> -    echo $compiler "$@" >> config.log
> -    $compiler "$@" >> config.log 2>&1 || return $?
> -    # Test passed. If this is an --enable-werror build, rerun
> -    # the test with -Werror and bail out if it fails. This
> -    # makes warning-generating-errors in configure test code
> -    # obvious to developers.
> -    if test "$werror" !=3D "yes"; then
> -        return 0
> -    fi
> -    # Don't bother rerunning the compile if we were already using -Werro=
r
> -    case "$*" in
> -        *-Werror*)
> -           return 0
> -        ;;
> -    esac
> -    echo $compiler -Werror "$@" >> config.log
> -    $compiler -Werror "$@" >> config.log 2>&1 && return $?
> -    error_exit "configure test passed without -Werror but failed with -W=
error." \
> -        "This is probably a bug in the configure script. The failing com=
mand" \
> -        "will be at the bottom of config.log." \
> -        "You can run configure with --disable-werror to bypass this chec=
k."
> -}
> -
>  do_cc() {
> -    do_compiler_werror "$cc" $CPU_CFLAGS "$@"
> +    do_compiler "$cc" $CPU_CFLAGS "$@"
>  }
>
>  compile_object() {
> --
> 2.38.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

