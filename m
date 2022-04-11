Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0D14FC17D
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 17:52:27 +0200 (CEST)
Received: from localhost ([::1]:55376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndwL4-0003JF-RZ
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 11:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndwIE-0001S0-Av
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 11:49:30 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:41725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndwIC-0001Vw-FY
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 11:49:29 -0400
Received: by mail-yb1-xb31.google.com with SMTP id e71so13703285ybf.8
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 08:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DP5tM8qoB3TXB51K44XzG6p0DUHGWWFU4P3bHYwzRBk=;
 b=HAChq/iTVVu2zBNakpZJn6CLT846ok4PomJ1mP3G5IXSZfmWScuzfZSU25Z4SKb5R9
 Bw9PQ4+0egvnJ0r5mW4LvR6a85j/dBOvQ+dBW+K9XTTSQUdqd0GT1OLjOP20cvFsdRMn
 /44Qe4NRtVLsOnqUmWybbH3ob63M8GelCy9RJvQ+hU/Ihiq3WPrDY7OS8iUuELYdXTL3
 kUb1THKaHdOqLzlTOHxCtIDIToogNbGVO/71xG0e+SGjEv5mP8+0lFqhkgiknRU7NdBt
 OvlG+it/c8FxadRZxldLyBGt5GKBXCcadauLeBJOhMCOfLey/KhCUY+93Vdeo4hRiiQZ
 4dhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DP5tM8qoB3TXB51K44XzG6p0DUHGWWFU4P3bHYwzRBk=;
 b=6K9URBtoVF6PE9d5OCZuV135VkucqfoWsNymbKY2k5FlpaankrcJhYiNd9ShxWjbyy
 LZ4vegW++Utjf3xRz2Hq9+USqvKOcCqCbWmXHEbxAccxZHrYaFCnvsks5cy0Zl5a21Wt
 vpgATOjH1cBvJLlMUjRt+AHGcbbFxZRrYjBHXM6xtWCrEY+iZY9bwzNMLxoZyMPwrW6K
 Yk+Q2T+6FmbcvfujndwKoGQC8Iy+F8bHmkztK6YsTyM9xO1qxL93imdBkU381I7G7JhV
 BUmGF3FxAVvWLb7DZ3t2niFFET7zhOAti2na+GMgaG7Fpre7c7NvME8/sm4zjjzDP3Jc
 x4Xg==
X-Gm-Message-State: AOAM531h5zbF/akqxOGXlydg+DCvMhAwOpw2GULiYMk8dNYnPI0ZnkvF
 SjvqrssXwHf7CCRRNXd1H6VdApRbIgYArxOOoXF8/Gd6Xuw=
X-Google-Smtp-Source: ABdhPJxb7N1cWlPLu7hYDFEx8yMod2cRj02PgjgSJkDLVlwft/vAguWXbr0ZS7xft2QWhRggpGYodf9Lj+tQV//46bU=
X-Received: by 2002:a05:6902:1502:b0:63d:4d6f:dc1 with SMTP id
 q2-20020a056902150200b0063d4d6f0dc1mr22513773ybu.140.1649692167465; Mon, 11
 Apr 2022 08:49:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-12-richard.henderson@linaro.org>
In-Reply-To: <20220409000742.293691-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 16:49:16 +0100
Message-ID: <CAFEAcA_ASQ7Dwm5YMsXvPa6SS721HNuUkD7JPSCpuNOyDikJtw@mail.gmail.com>
Subject: Re: [PATCH 11/16] target/arm: Add minimal RAS registers
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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

On Sat, 9 Apr 2022 at 01:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add only the system registers required to implement zero error
> records.  This means we need to save state for ERRSELR, but all
> values are out of range, so none of the indexed error record
> registers need be implemented.
>
> Add the EL2 registers required for injecting virtual SError.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> +/*
> + * Minimal RAS implementation with no Error Records.
> + * Which means that all of the Error Record registers:
> + *   ERXADDR_EL1
> + *   ERXCTLR_EL1
> + *   ERXFR_EL1
> + *   ERXMISC0_EL1
> + *   ERXMISC1_EL1
> + *   ERXMISC2_EL1
> + *   ERXMISC3_EL1
> + *   ERXPFGCDN_EL1  (RASv1p1)
> + *   ERXPFGCTL_EL1  (RASv1p1)
> + *   ERXPFGF_EL1    (RASv1p1)
> + *   ERXSTATUS_EL1
> + * may generate UNDEFINED, which is the effect we get by not
> + * listing them at all.
> + */
> +static const ARMCPRegInfo minimal_ras_reginfo_el1[] = {
> +    { .name = "DISR_EL1", .state = ARM_CP_STATE_BOTH,
> +      .opc0 = 3, .opc1 = 0, .crn = 0xc, .crm = 1, .opc2 = 1,

".crn = 12", please -- no other reginfo struct uses hex here.
Similarly below.

> +      .access = PL1_RW, .fieldoffset = offsetof(CPUARMState, cp15.disr_el1),
> +      .readfn = disr_read, .writefn = disr_write, .raw_writefn = raw_write },
> +    { .name = "ERRIDR_EL1", .state = ARM_CP_STATE_BOTH,
> +      .opc0 = 3, .opc1 = 0, .crn = 5, .crm = 3, .opc2 = 0,
> +      .access = PL1_R, .accessfn = access_terr,
> +      .type = ARM_CP_CONST, .resetvalue = 0 },
> +    { .name = "ERRSELR_EL1", .state = ARM_CP_STATE_BOTH,
> +      .opc0 = 3, .opc1 = 0, .crn = 5, .crm = 3, .opc2 = 1,
> +      .access = PL1_RW, .accessfn = access_terr,
> +      .fieldoffset = offsetof(CPUARMState, cp15.errselr_el1) },

By my reading of the spec we could make ERRSELR_EL1 RAZ/WI, because
writing an over-large number has a number of behaviours including
that the value the guest can read back is UNKNOWN. That would save
having the CPU state struct field.

> +    REGINFO_SENTINEL
> +};
> +
> +static const ARMCPRegInfo minimal_ras_reginfo_el2[] = {
> +    { .name = "VDISR_EL2", .state = ARM_CP_STATE_BOTH,
> +      .opc0 = 3, .opc1 = 4, .crn = 0xc, .crm = 1, .opc2 = 1,
> +      .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.vdisr_el2) },
> +    { .name = "VSESR_EL2", .state = ARM_CP_STATE_BOTH,
> +      .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 2, .opc2 = 3,
> +      .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.vsesr_el2) },
> +    REGINFO_SENTINEL
> +};
> +
> +static const ARMCPRegInfo minimal_ras_reginfo_no_el2[] = {
> +    { .name = "VDISR_EL2", .state = ARM_CP_STATE_BOTH,
> +      .opc0 = 3, .opc1 = 4, .crn = 0xc, .crm = 1, .opc2 = 1,
> +      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
> +    { .name = "VSESR_EL2", .state = ARM_CP_STATE_BOTH,
> +      .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 2, .opc2 = 3,
> +      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
> +    REGINFO_SENTINEL
> +};
> +
>  /* Return the exception level to which exceptions should be taken
>   * via SVEAccessTrap.  If an exception should be routed through
>   * AArch64.AdvSIMDFPAccessTrap, return 0; fp_exception_el should
> @@ -8452,6 +8550,15 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>          define_one_arm_cp_reg(cpu, &ssbs_reginfo);
>      }
>
> +    if (cpu_isar_feature(any_ras, cpu)) {
> +        define_arm_cp_regs(cpu, minimal_ras_reginfo_el1);
> +        if (arm_feature(env, ARM_FEATURE_EL2)) {
> +            define_arm_cp_regs(cpu, minimal_ras_reginfo_el2);
> +        } else {
> +            define_arm_cp_regs(cpu, minimal_ras_reginfo_no_el2);
> +        }
> +    }
> +
>      if (cpu_isar_feature(aa64_vh, cpu) ||
>          cpu_isar_feature(aa64_debugv8p2, cpu)) {
>          if (arm_feature(env, ARM_FEATURE_EL2)) {
> --
> 2.25.1

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

