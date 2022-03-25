Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE964E72D0
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 13:16:47 +0100 (CET)
Received: from localhost ([::1]:32822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXis2-00028e-Bk
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 08:16:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXioP-00088s-Ix
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 08:13:01 -0400
Received: from [2607:f8b0:4864:20::112b] (port=44820
 helo=mail-yw1-x112b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXioM-0006HQ-N7
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 08:13:01 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2d07ae0b1c4so80397047b3.11
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 05:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=COZbaNTQaCWJ2leK6FSehHPA5uPUySNylpv0xwyCRZ0=;
 b=Fu9jcvSPByBrwg1Q94xwJL/msPUVTVW0AA35VI2wT2XzNn/6FACzziFoIxrVDzR5Re
 fIbdkhIg5t7aHcsQbNv5nbFH+VPAAewNrI6okkvb04jtGYkBk5KwJpDgUM5PuD17VvEE
 LVVJ2qDIWkbOhV4hZYTmWkxnJDRFFSbHhUNkQoOU7AJh+G/Qkce8L2bndnoU23r0dC/u
 DACt4upuKzTgR53usEsWZBodk24qaZM7pI8y9IbFhP/3Ynn9b4BLPNy0DgNWsZ6slsbT
 6Iea6rsm5Sr9RDOA8SF8wFHHXnrbIFBTT36W5/Vycp7IW/nGv3yHKaOdesugrZRJXPxi
 n/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=COZbaNTQaCWJ2leK6FSehHPA5uPUySNylpv0xwyCRZ0=;
 b=noLYzlh4oezOJloG6PGR6DB3cEywL4Buvz/bkFqoenoEIdTcZshVXTAWZV8TPFIlGB
 HMaKuurPiduXz2DDQarkbzzbxB+bOH8uQmmTXFRX1Y+ntAVzxcxmylJqKzKcsnL1Y8HU
 7qGazwsbMD9H0SXsy4L+RN+xOUm7Q2hqZooFaigeX3PUAE8nWtW5lAAKEQh6NTT1QLfI
 ymA4/WHgomOX/PybP90cyHpFJBliEJ9c3nwLSwlvw0xRlAHGkvWRVsEV94e/QW6GD0iv
 q8dJaunVFkqL+cxKWIDIsJQ5rTeXgh+I6J2Qp+qF0B2aGy83f317FknHX8JBSqajYZ4l
 apdA==
X-Gm-Message-State: AOAM532/k320xulIWVMR6DJ8urN7tYu4t0/HOX7G79tBJiULRUkNGNsX
 853Cq0fNp9mSOhgpEhl3ajq3ruIarT2LrJW9cRtb4g==
X-Google-Smtp-Source: ABdhPJy+N9XqYQAnFefT9vDey8zv/MTLRMp529fK0LDUDbJ67oTfVFN4exBpinPeGaZYT6I9t9JFSPaEj5C//js/CVA=
X-Received: by 2002:a81:1151:0:b0:2e5:99ec:9933 with SMTP id
 78-20020a811151000000b002e599ec9933mr10206006ywr.64.1648210375057; Fri, 25
 Mar 2022 05:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220320160009.2665152-1-richard.henderson@linaro.org>
 <20220320160009.2665152-4-richard.henderson@linaro.org>
In-Reply-To: <20220320160009.2665152-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Mar 2022 12:12:41 +0000
Message-ID: <CAFEAcA-RSLe-fF+EcuoOfXnOynz8zc7_N_AnNt3uRx5PZTvq9A@mail.gmail.com>
Subject: Re: [PATCH 3/7] linux-user/nios2: Adjust error return
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 20 Mar 2022 at 16:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Follow syscall_set_return_value rather than the kernel assembly
> in setting the syscall return values.  Only negate ret on error.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/nios2/cpu_loop.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
> index ac71f4ee47..2ae94f4a95 100644
> --- a/linux-user/nios2/cpu_loop.c
> +++ b/linux-user/nios2/cpu_loop.c
> @@ -48,9 +48,18 @@ void cpu_loop(CPUNios2State *env)
>                                   env->regs[7], env->regs[8], env->regs[9],
>                                   0, 0);
>
> -                env->regs[2] = abs(ret);
> -                /* Return value is 0..4096 */
> -                env->regs[7] = ret > 0xfffff000u;
> +                /*
> +                 * See syscall_set_return_value.
> +                 * Use the QEMU traditional -515 error indication in
> +                 * preference to the < 0 indication used in entry.S.
> +                 */

Well, it is traditional, in that we've used it for sparc for
instance right back to commit 060366c5ad18b3e in 2004, and
even earlier for ppc since commit 678673089d1b.
probably for about as long for ppc. But *why* do we use this?
Well, 516 is ERESTART_RESTARTBLOCK, and that's what the
arch/sparc/kernel/entry.S code is comparing against (it does a
greater-than-or-equal check, I think, hence 516, not 515).

For powerpc, however, the kernel handles setting the CCR
bit in syscall_exit_prepare(), and there it checks against
-MAX_ERRNO.

nios2, as you note in the commit message, does a < 0 check.

So I think:
 * 515 is correct for SPARC, but we really ought not to use
   a hardcoded constant there
 * we are checking against the wrong value for PPC and should
   be checking MAX_ERRNO
 * this patch does the wrong thing for nios2

If we do the same < 0 check that the kernel does, does anything
break ?

thanks
-- PMM

