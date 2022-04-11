Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FF64FC3A2
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 19:47:41 +0200 (CEST)
Received: from localhost ([::1]:34172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndy8Z-0008Q5-Q7
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 13:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndy7D-0007SM-QC
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 13:46:15 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:46130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndy7B-0004OS-Px
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 13:46:15 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2edbd522c21so13735757b3.13
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 10:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bbQuUtont1oSyCYqxbubViOfHA1DPay6MUibc8+Zxso=;
 b=LqzL+l9GhcMte+C7xnZlLDZCMXefSaZ7VcSLq34b7SqacgzBIDnrjDrr8so/rVrYw0
 idta5v06yMEBBWs24CxPcXJzYvVMt4W3fr5ZSzfvdYFhaydCh1jRlz0v+BTltd5/fUv6
 TzScKX4OyG/nqcQUSXz3EY4+wdKIij79EXXki3DTTglqdQ9RUdE5JlGFgzCnSz7E16+W
 8xLhkeQhQfongKHLOmzr03J8jWobTlWmzLSOyxbN+57jZ0AXfSJS/EF5Dtq1Hepo8E45
 RdN2G7EhOOKTI/eikxYcv9l4VA29e6+Y1dr05yUYI20ghLc7yG9s5Cpl3tmNrJURRxLJ
 nx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bbQuUtont1oSyCYqxbubViOfHA1DPay6MUibc8+Zxso=;
 b=QRcUYnBckQsJn0X4GLw5cpyoprd6SYFDWp4Qv+kXKjhUxgn8JVQPWJ9Rs09wXS2WzF
 4jwJLxCgPPNUztEMVXWzR1RgkBV2sViKIywJ/CxQOJ59LmbegP4Qj9kj/v5h9zbOWWYQ
 oZjMjPfCS36lp5013a2kJQPDl50rdrNaEoRHav+rk+IrP3HCWKgyAJXH4pxh/J7mK1iL
 iDvr+52okbMT3238dh48vLqRqHZYHLUHFvF/0vMTQ2R4jMKsCkHjjGqM9cnGXzbZXbFZ
 dn1MEUss1Bu+Ez8KGX+e5AY881SK+7jXdy2CIOUuHHOcn9XeldkKCEOBqXo+MEvItj/i
 6WEw==
X-Gm-Message-State: AOAM5325SE/MKc5f2ZyU6p8MuZ/ry/8kLPiQfAAfgd0ZhVJiSYh70O1d
 YjO7ghfqsyXqUOxto/y9kXMwUu6SvyKEbbFjkJhdfA==
X-Google-Smtp-Source: ABdhPJyMfbF+uKDBlBZt90Pva3dnVV80KD1pfpsR5zkffS6/jpzCukpESNs7xsvMkrfi+SNCmmrucX/ksFtIpLptAAY=
X-Received: by 2002:a81:db05:0:b0:2ea:2b92:c317 with SMTP id
 u5-20020a81db05000000b002ea2b92c317mr27474094ywm.329.1649699172728; Mon, 11
 Apr 2022 10:46:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220410055725.380246-1-richard.henderson@linaro.org>
 <20220410055725.380246-4-richard.henderson@linaro.org>
In-Reply-To: <20220410055725.380246-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 18:46:01 +0100
Message-ID: <CAFEAcA-hQGeZ7n=X2BfxVGwPTGttUEg7rxqw28xw3JhCSfH+3w@mail.gmail.com>
Subject: Re: [PATCH 3/7] target/arm: Enable FEAT_CSV2_2 for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 10 Apr 2022 at 07:03, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There is no branch prediction in TCG, therefore there is no
> need to actually include the context number into the predictor.
> Therefore all we need to do is add the state for SCXTNUM_ELx.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h    | 16 +++++++++++
>  target/arm/cpu64.c  |  2 +-
>  target/arm/helper.c | 70 ++++++++++++++++++++++++++++++++++++++++++++-
>  3 files changed, 86 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index c6c6d89a69..0b89620662 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -688,6 +688,8 @@ typedef struct CPUArchState {
>          ARMPACKey apdb;
>          ARMPACKey apga;
>      } keys;
> +
> +    uint64_t scxtnum_el[4];
>  #endif
>
>  #if defined(CONFIG_USER_ONLY)
> @@ -1211,6 +1213,7 @@ void pmu_init(ARMCPU *cpu);
>  #define SCTLR_WXN     (1U << 19)
>  #define SCTLR_ST      (1U << 20) /* up to ??, RAZ in v6 */
>  #define SCTLR_UWXN    (1U << 20) /* v7 onward, AArch32 only */
> +#define SCTLR_TSCXT   (1U << 20) /* FEAT_CSV2_1p2, AArch64 only */
>  #define SCTLR_FI      (1U << 21) /* up to v7, v8 RES0 */
>  #define SCTLR_IESB    (1U << 21) /* v8.2-IESB, AArch64 only */
>  #define SCTLR_U       (1U << 22) /* up to v6, RAO in v7 */
> @@ -4368,6 +4371,19 @@ static inline bool isar_feature_aa64_dit(const ARMISARegisters *id)
>      return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, DIT) != 0;
>  }
>
> +static inline bool isar_feature_aa64_scxtnum(const ARMISARegisters *id)
> +{
> +    int key = FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, CSV2);
> +    if (key >= 2) {
> +        return true;      /* FEAT_CSV2_2 */
> +    }
> +    if (key == 1) {
> +        key = FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, CSV2_FRAC);
> +        return key >= 2;  /* FEAT_CSV2_1p2 */
> +    }
> +    return false;
> +}
> +
>  static inline bool isar_feature_aa64_ssbs(const ARMISARegisters *id)
>  {
>      return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, SSBS) != 0;
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index c1006a067c..9ff08bd995 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -805,7 +805,7 @@ static void aarch64_max_initfn(Object *obj)
>      t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
>      t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
>      t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
> -    t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 1);      /* FEAT_CSV2 */
> +    t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 2);      /* FEAT_CSV2_2 */

I think we should probably explicitly zero ID_AA64PFR1.CSV2_frac.
Doesn't matter now, but might if in future we move 'max' from
"a57 with extras" to "some CPU with CSV2_1p1 plus extras".

>      cpu->isar.id_aa64pfr0 = t;
>
>      t = cpu->isar.id_aa64pfr1;
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index bd1c8e01cb..66af3397ee 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1780,6 +1780,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>          if (cpu_isar_feature(aa64_mte, cpu)) {
>              valid_mask |= SCR_ATA;
>          }
> +        if (cpu_isar_feature(aa64_scxtnum, cpu)) {
> +            valid_mask |= SCR_ENSCXT;
> +        }
>      } else {
>          valid_mask &= ~(SCR_RW | SCR_ST);
>          if (cpu_isar_feature(aa32_ras, cpu)) {
> @@ -5312,6 +5315,9 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
>          if (cpu_isar_feature(aa64_mte, cpu)) {
>              valid_mask |= HCR_ATA | HCR_DCT | HCR_TID5;
>          }
> +        if (cpu_isar_feature(aa64_scxtnum, cpu)) {
> +            valid_mask |= HCR_ENSCXT;
> +        }
>      }
>
>      /* Clear RES0 bits.  */
> @@ -5965,6 +5971,10 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
>          { K(3, 0,  5, 6, 0), K(3, 4,  5, 6, 0), K(3, 5, 5, 6, 0),
>            "TFSR_EL1", "TFSR_EL2", "TFSR_EL12", isar_feature_aa64_mte },
>
> +        { K(3, 0, 0xd, 0, 7), K(3, 4, 0xd, 0, 7), K(3, 5, 0xd, 0, 7),

Use decimal to follow the style of the rest of this table, please.

> +          "SCXTNUM_EL1", "SCXTNUM_EL2", "SCXTNUM_EL12",
> +          isar_feature_aa64_scxtnum },
> +
>          /* TODO: ARMv8.2-SPE -- PMSCR_EL2 */
>          /* TODO: ARMv8.4-Trace -- TRFCR_EL2 */
>      };
> @@ -7434,7 +7444,61 @@ static const ARMCPRegInfo mte_el0_cacheop_reginfo[] = {
>      REGINFO_SENTINEL
>  };
>
> -#endif
> +static CPAccessResult access_scxtnum(CPUARMState *env, const ARMCPRegInfo *ri,
> +                                     bool isread)
> +{
> +    uint64_t hcr;
> +
> +    switch (arm_current_el(env)) {
> +    case 0:
> +        hcr = arm_hcr_el2_eff(env);
> +        if ((hcr & (HCR_TGE | HCR_E2H)) != (HCR_TGE | HCR_E2H)) {
> +            if (env->cp15.sctlr_el[1] & SCTLR_TSCXT) {
> +                if (hcr & HCR_TGE) {
> +                    return CP_ACCESS_TRAP_EL2;
> +                }
> +                return CP_ACCESS_TRAP;
> +            }
> +            if (arm_is_el2_enabled(env) && !(hcr & HCR_ENSCXT)) {
> +                return CP_ACCESS_TRAP_EL2;
> +            }
> +        } else {
> +            QEMU_FALLTHROUGH;
> +    case 1:

I'm sure this is valid C, but firm 'no' to interleaving
case labels and if/else statements.

> +            if (env->cp15.sctlr_el[2] & SCTLR_TSCXT) {
> +                return CP_ACCESS_TRAP_EL2;
> +            }
> +        }
> +        QEMU_FALLTHROUGH;
> +    case 2:
> +        if (arm_feature(env, ARM_FEATURE_EL3)
> +            && !(env->cp15.scr_el3 & SCR_ENSCXT)) {
> +            return CP_ACCESS_TRAP_EL3;
> +        }
> +    }
> +    return CP_ACCESS_OK;
> +}
> +
> +static const ARMCPRegInfo scxtnum_reginfo[] = {
> +    { .name = "SCXTNUM_EL0", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 3, .crn = 0xd, .crm = 0, .opc2 = 7,
> +      .access = PL0_RW, .accessfn = access_scxtnum,
> +      .fieldoffset = offsetof(CPUARMState, scxtnum_el[0]) },
> +    { .name = "SCXTNUM_EL1", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 0, .crn = 0xd, .crm = 0, .opc2 = 7,
> +      .access = PL1_RW, .accessfn = access_scxtnum,
> +      .fieldoffset = offsetof(CPUARMState, scxtnum_el[1]) },
> +    { .name = "SCXTNUM_EL2", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 4, .crn = 0xd, .crm = 0, .opc2 = 7,
> +      .access = PL2_RW, .accessfn = access_scxtnum,
> +      .fieldoffset = offsetof(CPUARMState, scxtnum_el[2]) },
> +    { .name = "SCXTNUM_EL3", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 6, .crn = 0xd, .crm = 0, .opc2 = 7,
> +      .access = PL3_RW,
> +      .fieldoffset = offsetof(CPUARMState, scxtnum_el[3]) },
> +    REGINFO_SENTINEL

Decimal not hex here too, please.

thanks
-- PMM

