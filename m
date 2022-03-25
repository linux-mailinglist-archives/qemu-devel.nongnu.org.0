Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 727614E72ED
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 13:20:09 +0100 (CET)
Received: from localhost ([::1]:36798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXivH-0004zf-Sw
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 08:20:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXirp-0003Gn-F6
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 08:16:33 -0400
Received: from [2607:f8b0:4864:20::b2d] (port=35727
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXirn-00076E-M1
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 08:16:32 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id o5so13729222ybe.2
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 05:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P3ULO+zqTtjyw9KA8R+kghnz+xQ9dyu58q8wzND26D8=;
 b=gtcPAzQwOCqwG14WYtcM+/Kv9itTOLjcApbe6C1ENZ2UzxMeZ3n89boY4eSxORZwXU
 H6/v25MqSMrYIB/3R6DqAo6+cKsTIrOQyNuPVL3CrBPakcCeFhrGnxHktvlWFy4HzDAU
 wJCaI7ioVmcLjEULj1x9fabsih/GX5V5spRkz+9baovSiUDOYLkAmypHxzxDlEsscdE2
 jRTcN7A6dmGVZ2PGdAce2dJCJKngmo1CUFSwDIzSH6+3izEzGfqqNye3/crf8CqjkBtw
 gOs+5zA/VpvyPRw0RMlFAV7l8O8HQtHHHE1ec6p0EcQeqCM4OkA+P4Yrvop96DZc/a6s
 n8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P3ULO+zqTtjyw9KA8R+kghnz+xQ9dyu58q8wzND26D8=;
 b=ZQyXKyhX1qn1YVWtSsuyo6T2T+MzDSwqL0hdrqEj+Lil1hT7nywdxEA4zBz224IO0G
 /0gMVwoF6H9+4PCG5Yt4dOkVhBC72gkLXdiUVOLsNCnVwWwvNiKDuPi/B1jmXDodp6t6
 YMBpjR4W42A3jLBIF1C8GIP/ngy7NW1KED7cbiEg1Y3htKCGKi45WaynCTrn6njkUIln
 h0cVKYcYtng1YdWBAzYq5z1kbgYEoc9JvedZwCEFI0YJ9VBknEEINUcRVZ2100Ui9noh
 60FZnYYd2PQELoJNlKGYMWz8CbJV5ig2mIcix1ZyBYEyRrMiTjulLLtWuDSm8lANBQ/4
 8pjg==
X-Gm-Message-State: AOAM531mai6AOkrg1Ov8FbrqMxwZ/iuAb1XSErH3eF0hdafKaB0h8jjB
 HLTaXf1xEuvqupxia1lLhxCqQQm0ZNdjdq6os4H+xA==
X-Google-Smtp-Source: ABdhPJzsNgo4w8+P9OEh4EMNjJ2HjezUxjdRAlKgC3EffwutCMjWbyOmAsDLDZEXN7U+EiwhSLVnE61857fCKr8la+8=
X-Received: by 2002:a05:6902:701:b0:638:9404:baff with SMTP id
 k1-20020a056902070100b006389404baffmr6711449ybt.479.1648210590672; Fri, 25
 Mar 2022 05:16:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220320160009.2665152-1-richard.henderson@linaro.org>
 <20220320160009.2665152-7-richard.henderson@linaro.org>
In-Reply-To: <20220320160009.2665152-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Mar 2022 12:16:17 +0000
Message-ID: <CAFEAcA_H5u=86Sa4ii86E78ych8Pu9yZx-3fHWf9+E_jsuKfgg@mail.gmail.com>
Subject: Re: [PATCH 6/7] linux-user/nios2: Use QEMU_ESIGRETURN from
 do_rt_sigreturn
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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
> Drop the kernel-specific "pr2" code structure and use
> the qemu-specific error return value.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/nios2/signal.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
> index 133bc05673..4442974001 100644
> --- a/linux-user/nios2/signal.c
> +++ b/linux-user/nios2/signal.c
> @@ -77,8 +77,7 @@ static void rt_setup_ucontext(struct target_ucontext *uc, CPUNios2State *env)
>      __put_user(env->regs[R_SP], &gregs[28]);
>  }
>
> -static int rt_restore_ucontext(CPUNios2State *env, struct target_ucontext *uc,
> -                               int *pr2)
> +static int rt_restore_ucontext(CPUNios2State *env, struct target_ucontext *uc)
>  {
>      int temp;
>      unsigned long *gregs = uc->tuc_mcontext.gregs;
> @@ -128,8 +127,6 @@ static int rt_restore_ucontext(CPUNios2State *env, struct target_ucontext *uc,
>      __get_user(env->regs[R_SP], &gregs[28]);
>
>      target_restore_altstack(&uc->tuc_stack, env);
> -
> -    *pr2 = env->regs[2];
>      return 0;
>  }
>
> @@ -191,7 +188,6 @@ long do_rt_sigreturn(CPUNios2State *env)
>      abi_ulong frame_addr = env->regs[R_SP];
>      struct target_rt_sigframe *frame;
>      sigset_t set;
> -    int rval;
>
>      if (!lock_user_struct(VERIFY_READ, frame, frame_addr, 1)) {
>          goto badframe;
> @@ -200,12 +196,12 @@ long do_rt_sigreturn(CPUNios2State *env)
>      target_to_host_sigset(&set, &frame->uc.tuc_sigmask);
>      set_sigmask(&set);
>
> -    if (rt_restore_ucontext(env, &frame->uc, &rval)) {
> +    if (rt_restore_ucontext(env, &frame->uc)) {
>          goto badframe;
>      }
>
>      unlock_user_struct(frame, frame_addr, 0);
> -    return rval;
> +    return -QEMU_ESIGRETURN;
>
>  badframe:
>      unlock_user_struct(frame, frame_addr, 0);

Don't you also need to return -QEMU_ESIGRETURN in the badframe
error-handling case? The other guest architecture implementations
of do_sigreturn seem to do that.

thanks
-- PMM

