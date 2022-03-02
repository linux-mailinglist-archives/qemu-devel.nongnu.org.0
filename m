Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2CE4CA674
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 14:50:58 +0100 (CET)
Received: from localhost ([::1]:51760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPPNZ-0000wK-Mv
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 08:50:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPOLz-0000nD-5o
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:45:18 -0500
Received: from [2607:f8b0:4864:20::b2c] (port=45753
 helo=mail-yb1-xb2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPOLs-0004HT-NW
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:45:14 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id w16so3056304ybi.12
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 04:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=upbrBEhwUZyFY/NsnvLpUnn5WDSPfPN4lGWULVn9sfE=;
 b=bAmI6bE6EQwNgHCia282SCwNrtXyXJVaZh4JDcpk1C5vNZYUJ6s6Os97s0ceHDj7Hp
 KLQKY3zpaizLbH37lGAktQAsHhJhAoyzfUKtGl7fC2Xl+4YtFZ8f+8OiaH9ht3LYNWvd
 xJbZJZCxBRhI1RKiRY/8yYwxZc/jVzFNBHKxW5IuMfT1XB8OGSCmyIWa8TWgfBYOa2Vb
 VgXd/0Y13NmybTiizlaMHtoQ43Z+EuYKlezyfsy8FNhu5Ih/5UR+sSKSimRFrOTSt5TE
 93jjSTHDEa2jCkXMlJ087aX5H6LYsp2Nfa3nSwhn8G2OAT3ykYcS7MjNQHZXq7OHAAV4
 awnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=upbrBEhwUZyFY/NsnvLpUnn5WDSPfPN4lGWULVn9sfE=;
 b=tMo6M/GRGLH0aQjHkzChNAAzQhINHRSFdGFfDWusLHguEL7trAIpTvm/xhVwMCSX0X
 Sf3ImZcU4M624DE0X0hzY1uNGpzL+eAwwAqZPiACEh7KAFJdR2V4pGVZxLtVhzAdXDjk
 7WzruTnigSJOUxGEJFEU5an36xtv2eBLSUVbRD7dQ2IiRJjOOtPDNrwN3FYXIM+WGmMr
 Q0FaNTqUojlJvK+JmurP8ijPYbTaEiXdw2Eab2zLe/+L++K6J6O5Atxw/PAkJwDpD0Kg
 Vg1W051vU1yDOHKZ+N4myUl2DB7NEaq7eI0HPa58TE9L9mH6Za4Xu/Cl83ab3iWpA0Wx
 xViA==
X-Gm-Message-State: AOAM5305VMN4gSV+yQme3YD8p35BjiZyB8hcCMg6VMIISXVK0zxUKX6E
 MWV9dMMHy6hsU6a/4hiok2Yqsqa06IlJJOb79xAkNw==
X-Google-Smtp-Source: ABdhPJyW04HiHeiZKg67IQwECXWmm9H6Gdvgymsq3AiG0BVDzL5yUbtTU4O9fnvgkCVakYQ0S6MmNP0YHkFlUuJWfMA=
X-Received: by 2002:a25:dad5:0:b0:628:7b94:c196 with SMTP id
 n204-20020a25dad5000000b006287b94c196mr7228148ybf.85.1646225105613; Wed, 02
 Mar 2022 04:45:05 -0800 (PST)
MIME-Version: 1.0
References: <20220227182125.21809-1-richard.henderson@linaro.org>
 <20220227182125.21809-2-richard.henderson@linaro.org>
In-Reply-To: <20220227182125.21809-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Mar 2022 12:44:54 +0000
Message-ID: <CAFEAcA9Jm47RuP7wk2az6xP4Fay9hCDg7NNp-ARrLyk8xmMOEQ@mail.gmail.com>
Subject: Re: [PATCH 1/7] target/nios2: Remove mmu_read_debug
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
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
Cc: amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 27 Feb 2022 at 18:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This functionality can be had via plugins, if desired.
> In the meantime, it is unused code.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/helper.h    |  1 -
>  target/nios2/mmu.h       |  1 -
>  target/nios2/mmu.c       | 20 --------------------
>  target/nios2/op_helper.c |  5 -----
>  target/nios2/translate.c | 17 -----------------
>  5 files changed, 44 deletions(-)

> --- a/target/nios2/translate.c
> +++ b/target/nios2/translate.c
> @@ -448,23 +448,6 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
>      gen_check_supervisor(dc);
>
>      switch (instr.imm5 + CR_BASE) {
> -    case CR_PTEADDR:
> -    case CR_TLBACC:
> -    case CR_TLBMISC:
> -    {
> -#if !defined(CONFIG_USER_ONLY)
> -        if (likely(instr.c != R_ZERO)) {
> -            tcg_gen_mov_tl(cpu_R[instr.c], cpu_R[instr.imm5 + CR_BASE]);
> -#ifdef DEBUG_MMU
> -            TCGv_i32 tmp = tcg_const_i32(instr.imm5 + CR_BASE);
> -            gen_helper_mmu_read_debug(cpu_R[instr.c], cpu_env, tmp);
> -            tcg_temp_free_i32(tmp);
> -#endif
> -        }
> -#endif
> -        break;
> -    }
> -

For a moment I thought this was changing the behaviour of these
registers for linux-user, but gen_check_supervisor() means we
never execute the code generated here. (Side note: it would
be more sensible to stop generating code rather than generating
the "throw an exception" code and then the "write/read reg"
code as known-dead-code after it. But that's a different issue.)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

