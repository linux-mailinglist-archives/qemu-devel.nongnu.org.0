Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6DC5FD7FE
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 12:58:33 +0200 (CEST)
Received: from localhost ([::1]:50350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oivv6-00016d-8q
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 06:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oivcz-0004X3-IF
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 06:39:51 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:44618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oivcx-0000d7-Oe
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 06:39:49 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 t10-20020a17090a4e4a00b0020af4bcae10so1528246pjl.3
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 03:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kuNawtouOZLW6RUeRZHyY+qHdiCrUJRgf+jG6HpBO6Y=;
 b=bEMilSjmxIJ+GQ6vvBICyFALkW0/eyaNi8yCo//4pKEgHr863jxj4uM1Q1+posPpYE
 6uPWYO7uBxDfbCfGxstaUU/OVxDsAjv6jJQr46CVHJYiKc0ir8sIGzTxdCLHrgK7At01
 rOE8uy46AeC3Dmb2LQ3M7r4X9tnGxRmcKIPpWlgCmB0nh5rV6vh604vapsPWOBCGAie7
 xYt2RKsk20SAQUMRJFnJDgp1QD+3i2j89+5OWJ+FP0UNgUBh8Mva8EASm06OXZ4ihQzy
 V719uIbqZv5Yduqd3ImcjZ2RmUH6UUSJB7eT91aEmc1foG9pzljGPn2O+cvbJqzA0IlK
 Sweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kuNawtouOZLW6RUeRZHyY+qHdiCrUJRgf+jG6HpBO6Y=;
 b=NDbowchW/sld9biyiAu6y8RX81ByWruHYLA7Ib5ANklguVwFoABz/2OU/54RRwfyM2
 8rBSqVFuNII52iiD7QY9dbJk/U270VOVwpZ1XmGCgW+R5dRmdGaYAzM+iZag5+CN4012
 9dCnHZzfy7UzRt3X0961KIeQ057LbjPjvwt/2mubKbt42CkvPOpIzNxIO6Fg1NbRDHTH
 tz9k1/XXCwpdH6+p4KSfnNNb+FOqq1DyIcHXj95Tw4uxp/fruGpHzHnjBxDrqBFwZn1j
 QlypvwnCxzCR8yhSW5tPV95Vr/v7L2fNb12CQR8BVYgRLEBO1p3FDQLyLYUu3RTfzE+D
 oUVQ==
X-Gm-Message-State: ACrzQf1okzS1IK0Dt7gnuGfuPRR8LYs5HMXKxLHXE7rxxYQa/hxVYDtn
 /Z5nOApW9iMuudUp17tjhPXTPPlCQjQJYQDJF9anxg==
X-Google-Smtp-Source: AMsMyM7y+u0JCj0BK1OI04WOQhbzjzvFPsxmPv0t5YBxBA5kj3g/vQ/qhEl2NXw41OblCy6Ar7NV+lGoZtBHJ9R55EA=
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr34281101plb.60.1665657586186; Thu, 13
 Oct 2022 03:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <83824abdddf124d76f9f265f77808e859dc094a8.1665650275.git.mprivozn@redhat.com>
In-Reply-To: <83824abdddf124d76f9f265f77808e859dc094a8.1665650275.git.mprivozn@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Oct 2022 11:39:34 +0100
Message-ID: <CAFEAcA_U_mXy5haEZjEKbH_qS_oi38LK4RMD-z42QC5h2Z67cA@mail.gmail.com>
Subject: Re: [PATCH] configure: Avoid using strings binary
To: Michal Privoznik <mprivozn@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1033.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 13 Oct 2022 at 09:47, Michal Privoznik <mprivozn@redhat.com> wrote:
>
> When determining the endiandness of the target architecture we're
> building for a small program is compiled, which in an obfuscated
> way declares two strings. Then, we look which string is in
> correct order (using strings binary) and deduct the endiandness.
> But using the strings binary is problematic, because it's part of
> toolchain (strings is just a symlink to
> x86_64-pc-linux-gnu-strings or llvm-strings). And when
> (cross-)compiling, it requires users to set the symlink to the
> correct toolchain.
>
> Fortunately, we have a better alternative anyways. Since we
> require either clang or gcc we can rely on macros they declare.
>
> Bug: https://bugs.gentoo.org/876933
> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>

If we can determine this just by looking at C macros, does
this really need to be a configure test at all ? Paolo?



> ---
>  configure | 33 ++++++++++++++++++---------------
>  1 file changed, 18 insertions(+), 15 deletions(-)
>
> diff --git a/configure b/configure
> index 45ee6f4eb3..91e04635cb 100755
> --- a/configure
> +++ b/configure
> @@ -1426,27 +1426,30 @@ fi
>  # ---
>  # big/little endian test
>  cat > $TMPC << EOF
> -#include <stdio.h>
> -short big_endian[] = { 0x4269, 0x4765, 0x4e64, 0x4961, 0x4e00, 0, };
> -short little_endian[] = { 0x694c, 0x7454, 0x654c, 0x6e45, 0x6944, 0x6e41, 0, };
> -int main(int argc, char *argv[])
> -{
> -    return printf("%s %s\n", (char *)big_endian, (char *)little_endian);
> -}
> +#if defined(__BYTE_ORDER) && __BYTE_ORDER == __BIG_ENDIAN || \
> +    defined(__BIG_ENDIAN__)
> +# error BIG
> +#endif
> +int main(void) { return 0; }
>  EOF
>
>  if compile_prog ; then
> -    if strings -a $TMPE | grep -q BiGeNdIaN ; then
> -        bigendian="yes"
> -    elif strings -a $TMPE | grep -q LiTtLeEnDiAn ; then
> -        bigendian="no"
> -    else
> -        echo big/little test failed
> -        exit 1
> -    fi
> +  bigendian="yes"
>  else
> +  cat > $TMPC << EOF
> +#if defined(__BYTE_ORDER) && __BYTE_ORDER == __LITTLE_ENDIAN || \
> +    defined(__LITTLE_ENDIAN__)
> +# error LITTLE
> +#endif
> +int main(void) { return 0; }
> +EOF
> +
> +  if compile_prog ; then
> +    bigendian="no"
> +  else
>      echo big/little test failed
>      exit 1
> +  fi
>  fi

thanks
-- PMM

