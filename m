Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF97E4DCB8E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 17:40:11 +0100 (CET)
Received: from localhost ([::1]:45106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUtAY-0003pj-TT
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 12:40:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUt8b-0002mM-2C
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:38:09 -0400
Received: from [2607:f8b0:4864:20::112e] (port=46366
 helo=mail-yw1-x112e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUt8Y-00068o-89
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:38:08 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2e58e59d101so64185157b3.13
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 09:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZQA7fbHJ+SES0s55SkoUKB+uYxNvQ5hxbmce1b7d4L4=;
 b=qWXn2kjH1ctVGvDl8X/NFTLEmzHR661qVRwBe99tdWFxs0GIaFTDQT5oe68aJNRnRi
 nF77tKHSx4VLR8+FEqI8p+zivlUXzqobwReDsDIsR0Ks4alYTqpOJ03yRtnFK2ZH67NE
 hiRmJz4EnzECChGwS2G01GBLjm4xf/AVt1aMgbV2CCPLJz2PJu3OUQhdJkQ9ZNNUZ1Ot
 cmQKuK1QXnt1J7nsmWH61ZobINCi6Ls92bs+6luVOJ4YYV3zi8JvrH8s/by2n4u+RWXf
 YBKhsfqaWw3PyBaj5bWOx0YMjBVwCAWc1SwDQWAFiKzp1Mz9YxS/Q0p9smKNaC6DsFU5
 5Mxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZQA7fbHJ+SES0s55SkoUKB+uYxNvQ5hxbmce1b7d4L4=;
 b=Vc71y1BTyw5/kBWiNpklSR1NsCwfkL70D8kKMN3INP8P6biSzP0VOqzPth9JsSudzL
 IDtUWQgK/mLQXSsIvwbnNRiiF5UL9gVpm0C28VWQAHpjl/E1WBO/+xSThUQWXTpN0K0v
 ZwbgtFp5RUVmWnY4vmQ1M66F1jA6Lk/jb5qZBqHtOHLBZ9cVdAL/d32u5MihR/m567PZ
 +6iX5asQQpR6KfBR5Dg7m1Yhj6mMuzhroLCO3G2qQUTdM/gCJT/h8zU1kx1/IIG5izfN
 FqU6MWk9XwXydiI1QgoGvqdsBGIkJuHJF9gNMSDpbLvq7e0xVd4VydQ8UFuSMjWH61YT
 OKew==
X-Gm-Message-State: AOAM5330gtbtRFuySTZrl2c4fw20w0Azn2U8Tc+g82JUZIt/Vx3B3opV
 YzybaqckoB0JMU/0NeZ9fs2jdoUQt+HsxzD/0aw7qg==
X-Google-Smtp-Source: ABdhPJzMcBlcwki6w6gxUP4cNffAinvK0/qSSUgqtnns9RhmZGnocvW5ELGErfbUXNE9dIB8h75ked+GoSCF24caYDA=
X-Received: by 2002:a0d:fd02:0:b0:2e5:9617:fda8 with SMTP id
 n2-20020a0dfd02000000b002e59617fda8mr6664551ywf.10.1647535081989; Thu, 17 Mar
 2022 09:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220317050538.924111-1-richard.henderson@linaro.org>
 <20220317050538.924111-40-richard.henderson@linaro.org>
In-Reply-To: <20220317050538.924111-40-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Mar 2022 16:37:50 +0000
Message-ID: <CAFEAcA8Z8OJpDNOBOAWa4mxh4-Mf4C6Gebfe-CuH87ote2_Odw@mail.gmail.com>
Subject: Re: [PATCH for-7.1 v6 39/51] target/nios2: Implement Misaligned
 destination exception
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Mar 2022 at 05:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Indirect branches, plus eret and bret optionally raise
> an exception when branching to a misaligned address.
> The exception is required when an mmu is enabled, but
> enable it always because the fallback behaviour is not
> documented (though presumably it discards low bits).
>
> For the purposes of the linux-user cpu loop, if EXCP_UNALIGN
> (misaligned data) were to arrive, it would be treated the
> same as EXCP_UNALIGND (misaligned destination).  See the
> !defined(CONFIG_NIOS2_ALIGNMENT_TRAP) block in kernel/traps.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/nios2/cpu_loop.c |  6 ++++++
>  target/nios2/op_helper.c    |  9 ++++++++-
>  target/nios2/translate.c    | 15 ++++++++++++++-
>  3 files changed, 28 insertions(+), 2 deletions(-)


> @@ -64,6 +64,13 @@ uint32_t helper_divu(CPUNios2State *env, uint32_t num, uint32_t den)
>  void helper_eret(CPUNios2State *env, uint32_t new_status, uint32_t new_pc)
>  {
>      Nios2CPU *cpu = env_archcpu(env);
> +    CPUState *cs = env_cpu(env);
> +
> +    if (unlikely(new_pc & 3)) {
> +        env->ctrl[CR_BADADDR] = new_pc;
> +        cs->exception_index = EXCP_UNALIGND;
> +        cpu_loop_exit_restore(cs, GETPC());
> +    }
>
>      /*
>       * Both estatus and bstatus have no constraints on write;
> @@ -74,6 +81,6 @@ void helper_eret(CPUNios2State *env, uint32_t new_status, uint32_t new_pc)
>
>      env->ctrl[CR_STATUS] = new_status;
>      env->pc = new_pc;
> -    cpu_loop_exit(env_cpu(env));
> +    cpu_loop_exit(cs);
>  }

The spec isn't clear about whether an unaligned-destination on
an eret is handled as "do the eret (ie restore status), then take
the exception when trying to set the new PC" or "take the exception
immediately" (ie whether it's always a nested exception, effectively).
I guess this is as good a guess as any.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

