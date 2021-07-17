Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C63233CC6D8
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 01:36:58 +0200 (CEST)
Received: from localhost ([::1]:60836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4trd-0008Ep-TV
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 19:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4tqU-0006mL-NH
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 19:35:46 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:42779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4tqT-0001kF-3s
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 19:35:46 -0400
Received: by mail-ed1-x52f.google.com with SMTP id k27so17969602edk.9
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 16:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X69a2uodKUA3KTHfpK0rMAE6rYTBxXmofVrMjsX9UfI=;
 b=NiKunTeTXQYTRzsikMcoM6IOGUuPUOqIQNo93hpsOnuv5zGcrDym+hc1mjZXd83g+p
 /p2+jnISCddkPPivYu+fu0b45msmnPi+qoAtTGGTrsWnuMg0s/YerZfZejTKm1hIu/Mi
 myFqiZmh6apE3UEO+2KXQc/lzcKlhyv9I5MKYaK6xHZBXvk8YPINVWT1pPjQ49LwGZbh
 HF8lFKV0YEqjfkEpGJk2/LklwG+mcJV8Sw4/6u2KN2FIqxSiN5gfvFkB/dHdoMgoJtd/
 35lzc5GGPTTPjYFyob6/l1BModa5Sx0Bo+enrAtYPU7plBXdz3tf05K8Uvj7y8q/UOfI
 vBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X69a2uodKUA3KTHfpK0rMAE6rYTBxXmofVrMjsX9UfI=;
 b=pcG8W96h8dihVIf8GMBFI/Q9GwEH4WS7weVsq7wU+HIY9lhBxsJg8OPtcRCRthiawm
 L2rLoM7fLld3fTIvEKlGgWl3UJp85xvnuRcV+EZ6ccAsFnAoHdKHJEFhOi8kRwUxC9Ry
 pfz7j7LvOtBYkrlenqJvDFLzJ7Agm37/EE43nN9Aj+eEwd8m/VORUh2m0LaoNrdsK84M
 y7xAjEIVsP7xv7Sg8GjEn8i4GqIEr1ofySbdBKLfNl6aUpCNzV0OxQQ3EHFuqMz9sb/u
 Tc646xbgxhIvZad9UdOxm1nTZtBTNs3EKmF5OL8G3sFL0MjOCI5bsbnbllDP1eQliX3l
 YdRA==
X-Gm-Message-State: AOAM530kdyhPNIiRgpC6O6T4DeINtFAuBW+XMwfDdq1CbwqVhulZfwXX
 iYXk/ZjLWLdWXYdeZ+au7yC3hw2J1JKivNxG1eFxWNXrhaw=
X-Google-Smtp-Source: ABdhPJzlhGeHNe/fQn90y0Ld/CqhsHBZLUKW8IPbd3Id4eCNtPz1a82m9L8dpirx2muyn1yYQis88lYWKQ+eaVes3/w=
X-Received: by 2002:a05:6402:697:: with SMTP id
 f23mr24294531edy.44.1626564943722; 
 Sat, 17 Jul 2021 16:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210717221851.2124573-1-richard.henderson@linaro.org>
 <20210717221851.2124573-11-richard.henderson@linaro.org>
In-Reply-To: <20210717221851.2124573-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 18 Jul 2021 00:35:03 +0100
Message-ID: <CAFEAcA8C=8kAdsYeKqVwH=qeaWy3yoh+YgKm2Qi+SGcV7XWMtA@mail.gmail.com>
Subject: Re: [PATCH v3 10/13] target/riscv: Reduce riscv_tr_breakpoint_check
 pc advance to 2
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 17 Jul 2021 at 23:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The actual number of bytes advanced need not be 100% exact,
> but we should not cross a page when the insn would not.
>
> If rvc is enabled, the minimum insn size is 2.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index deda0c8a44..5527f37ada 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -973,7 +973,7 @@ static bool riscv_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
>         [tb->pc, tb->pc + tb->size) in order to for it to be
>         properly cleared -- thus we increment the PC here so that
>         the logic setting tb->size below does the right thing.  */
> -    ctx->base.pc_next += 4;
> +    ctx->base.pc_next += 2;
>      return true;
>  }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(What goes wrong if we just say "always use a TB size of 1 regardless
of target arch" rather than having the arch return the worst case
minimum insn length?)

thanks
-- PMM

