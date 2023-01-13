Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FA1669820
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 14:12:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGJqc-0005hC-T1; Fri, 13 Jan 2023 08:11:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGJqa-0005gb-CP
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:11:52 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGJqY-0006JI-88
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:11:51 -0500
Received: by mail-pg1-x52c.google.com with SMTP id 141so14974103pgc.0
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 05:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2+XTlWpfc4bl6Kl4kWdays/hzG+45VDkD1dV8oW6aNI=;
 b=FPxkka0jlYztNkPAIhl0Y9MyTGHNOdt1Y8bmsw209QZdoF64+mcHQ10Ifmqp/HuTOZ
 4FTHiHY0HnK13b88Ef+Tidg/iCajnI2H528AzWjGEqqcxE3IP+28w0AYC4JyQqnMQYto
 EfDdqIW2m0+8LJEqO/DL9YSz8JDRDOSkDb/x8zEslPYi/GmtffYtov1lcNgUPwmC2y9x
 5wqh6wTImso3hAEGfpi7yuraAejNR1LLX0Hc1R4AbzbbROe6Px/thAi04LLgJCE6N2Wx
 JiQ/ev3mz0ofamlgfe97bq7/TVCjebtTFdwbE/tf32OEcQrw0AagQUy8bT51kEaiyu/O
 QpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2+XTlWpfc4bl6Kl4kWdays/hzG+45VDkD1dV8oW6aNI=;
 b=YnFF1x9g2Bd0lnZ5Vgh0kZe31alyNiuQa4S1xDkuyp4+5fEUZfzUXN6IeGo9VQffdU
 vnwVkB3bC5f9sWa25RS4bWBrsi4n9xQ8AkECiQ6vJgbHyh8em8U5L5gC0GRKbvEpv3Gq
 vRv3sUVSJ7NoeAAVT+ESDJlzTnJElQVTE9SWXsvhgCf51MfbYyam9wb0Zwrr9I6m68g/
 EEkUPRECae5E2MYnE2v0+kG4d5IW3LqGpBhDnlRVtTFwDrmf/cnZciXTr0wZIKe6E18f
 G8zS5+16ErZTrM0KjeWxDdQpYCvibgNFIGlo2otzf7E50sex+xT1v3Mjt0GYZin4APms
 38YQ==
X-Gm-Message-State: AFqh2kqD171CSqBCPHhxD58RYierYCyNA9RGdyq1rvFTH8SK5AweSMyl
 tWpEFtVXW6Ulv/j9rbqiE/LKRL48zNcvv+DyUPEMhdPN22UwkQ==
X-Google-Smtp-Source: AMrXdXtbDIv7wcknbh1bK7dGr+j4jnOq+s7uAyTKtGwsSczWj+e5NVw/W3abFE78Gx7/5kKtZiYkP6UTzy39jGn/gYk=
X-Received: by 2002:aa7:999c:0:b0:582:74a2:1e4e with SMTP id
 k28-20020aa7999c000000b0058274a21e4emr3615978pfh.26.1673615508363; Fri, 13
 Jan 2023 05:11:48 -0800 (PST)
MIME-Version: 1.0
References: <20230105221251.17896-1-eiakovlev@linux.microsoft.com>
 <20230105221251.17896-2-eiakovlev@linux.microsoft.com>
In-Reply-To: <20230105221251.17896-2-eiakovlev@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Jan 2023 13:11:37 +0000
Message-ID: <CAFEAcA-N1hS2+6RL7gRYxyzu-zWzsnCujLqrQensLQFN9P8JiQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] target/arm: implement DBGCLAIM registers
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52c.google.com
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

On Thu, 5 Jan 2023 at 22:12, Evgeny Iakovlev
<eiakovlev@linux.microsoft.com> wrote:
>
> The architecture does not define any functionality for the CLAIM tag bits.
> So we will just keep the raw bits, as per spec.
>
> Helps Hyper-V boot on aarch64-tcg because it context-switches DBGCLAIM
> on EL2 entry/exit.
>
> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
> ---
>  target/arm/cpu.h          |  1 +
>  target/arm/debug_helper.c | 27 +++++++++++++++++++++++++++
>  2 files changed, 28 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 2b4bd20f9d..eddec155b0 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -494,6 +494,7 @@ typedef struct CPUArchState {
>          uint64_t dbgbcr[16]; /* breakpoint control registers */
>          uint64_t dbgwvr[16]; /* watchpoint value registers */
>          uint64_t dbgwcr[16]; /* watchpoint control registers */
> +        uint64_t dbgclaim;   /* DBGCLAIM bits */
>          uint64_t mdscr_el1;
>          uint64_t oslsr_el1; /* OS Lock Status */
>          uint64_t osdlr_el1; /* OS DoubleLock status */
> diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
> index c21739242c..b244e146e2 100644
> --- a/target/arm/debug_helper.c
> +++ b/target/arm/debug_helper.c
> @@ -629,6 +629,18 @@ static void osdlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>      }
>  }
>
> +static void dbgclaimset_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                              uint64_t value)
> +{
> +    env->cp15.dbgclaim |= (value & 0xFF);
> +}
> +
> +static void dbgclaimclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                              uint64_t value)
> +{
> +    env->cp15.dbgclaim &= ~(value & 0xFF);
> +}
> +
>  static const ARMCPRegInfo debug_cp_reginfo[] = {
>      /*
>       * DBGDRAR, DBGDSAR: always RAZ since we don't implement memory mapped
> @@ -712,6 +724,21 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
>        .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 0,
>        .access = PL1_RW, .accessfn = access_tda,
>        .type = ARM_CP_NOP },
> +    /*
> +     * Dummy DBGCLAIM registers.
> +     * "The architecture does not define any functionality for the CLAIM tag bits.",
> +     * so we only keep the raw bits
> +     */
> +    { .name = "DBGCLAIMSET_EL1", .state = ARM_CP_STATE_BOTH,
> +      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 7, .crm = 8, .opc2 = 6,
> +      .access = PL1_RW, .accessfn = access_tda,
> +      .writefn = dbgclaimset_write,
> +      .fieldoffset = offsetof(CPUARMState, cp15.dbgclaim) },

DBGCLAIMSET_EL1 CLAIM bits are supposed to RAO. (In v7 this
was done so software could identify how many claim bits are
implemented by writing all-1s and then reading back.) So we
need a readfn that just returns 0xff, and can skip the .fieldoffset.

We should mark DBGCLAIMSET_EL1 as ARM_CP_ALIAS, because the
actual state is handled by DBGCLAIMCLR_EL1.

> +    { .name = "DBGCLAIMCLR_EL1", .state = ARM_CP_STATE_BOTH,
> +      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 6,
> +      .access = PL1_RW, .accessfn = access_tda,
> +      .writefn = dbgclaimclr_write,
> +      .fieldoffset = offsetof(CPUARMState, cp15.dbgclaim) },

This also needs .raw_writefn = raw_write,
so that on migration restore we can write the value in
and not have it go via the "clear these bits" writefn.

thanks
-- PMM

