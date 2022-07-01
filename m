Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3B4563261
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 13:16:18 +0200 (CEST)
Received: from localhost ([::1]:41988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7EdF-000078-CO
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 07:16:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7EUZ-0001pQ-3P
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 07:07:19 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:45996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7EUW-00059o-70
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 07:07:18 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id x184so3375795ybg.12
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 04:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W4jXB5T3meV9NiyR+tWk7XghehPWLvJvVx8mCRwcKOM=;
 b=wqltM/qlF3OjHmWMMkjklWjzcd3cGv1vCZ2qsGXmc+3vkV3Ny+dg283Q7h5Gj7qSQd
 P5+Yl6UF604lfKUqINACpyqJBt6rGu9mu0GTVJ8RGX/HI4Qkgykn1PGeIMZzTKpLyIee
 0SpN4UphYhQTKuO49AAQ3xXmARTy7HRSXyBgkQ+mJfqASOmZlRl+lwEcOWp6zpX1V53X
 Ml5SqKIK8IoC1CYnohazR6YM3H6VPwKAU9AkpPBAiAb5Qf3xTkLoSiTkZBRoUxqswUIj
 qynSWsgsDwx35M6D9OBiv4BS0rhgErF8ubox47yliXATOKWsT4ggr6qpxxDX7h5BZtdh
 bg3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W4jXB5T3meV9NiyR+tWk7XghehPWLvJvVx8mCRwcKOM=;
 b=gXYMb89qiZiMUraQVZAJ/3pApB7UXBtyCLUOhD4MOrKg9QD2jzLrIjA/FcgFRyV5cj
 yiwbPN1EV2m8BDuUULM5ceIJV7/fZ6Sod4IWauGErla8dbxkEPFWMLWh9ra48NoQHHdz
 LZCIs2aNfqCNUzmGUD5twcCJEQo1GZdfBK+PqSK89uPXsP83+q/7s/O7GG/TQsD/KPaE
 PalhvdKTtZNlHcGj5fdTITnJzzLcaxedhkMUfAUtOd/V8VAnlSCpfITMVN/sWOzfUgZx
 UP0uoK2Dx5DIk4zjmM2G6QXISJhYHHOS5j3vzFke3wbG9tNZCnlZK1ytMrZKdLsrZjzw
 JLTQ==
X-Gm-Message-State: AJIora/S1ez/Q9D1V7t6CuPSJzpKLpZpl4Aft8j34N5DALSVThLNBHbk
 aB0uY4sTDB3VPrgOb7uKpMx8CkNk4Ak9nCLC4mtWyg==
X-Google-Smtp-Source: AGRyM1symZo+4Ch9w/7nppGPYG/L/33GQb4Hh04sEDTzK3Nkv5FYkDoMO6AzQ5CiDm010H6c7Ydfk3u6g+NjsI+sFrc=
X-Received: by 2002:a25:6644:0:b0:66d:c0b8:81ab with SMTP id
 z4-20020a256644000000b0066dc0b881abmr6840334ybm.85.1656673634913; Fri, 01 Jul
 2022 04:07:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-4-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2022 12:06:36 +0100
Message-ID: <CAFEAcA9MNTrD=O+v53TsejbbpJrNzfhWv-uq6tJfXnXzLKSQRg@mail.gmail.com>
Subject: Re: [PATCH v4 03/45] target/arm: Trap non-streaming usage when
 Streaming SVE is active
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 28 Jun 2022 at 05:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This new behaviour is in the ARM pseudocode function
> AArch64.CheckFPAdvSIMDEnabled, which applies to AArch32
> via AArch32.CheckAdvSIMDOrFPEnabled when the EL to which
> the trap would be delivered is in AArch64 mode.
>
> Given that ARMv9 drops support for AArch32 outside EL0, the trap EL
> detection ought to be trivially true, but the pseudocode still contains
> a number of conditions, and QEMU has not yet committed to dropping A32
> support for EL[12] when v9 features are present.
>
> Since the computation of SME_TRAP_NONSTREAMING is necessarily different
> for the two modes, we might as well preserve bits within TBFLAG_ANY and
> allocate separate bits within TBFLAG_A32 and TBFLAG_A64 instead.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> +# These patterns are taken from Appendix E1.1 of DDI0616 A.a,
> +# Arm Architecture Reference Manual Supplement,
> +# The Scalable Matrix Extension (SME), for Armv9-A
> +
> +{
> +  [
> +    OK  0-00 1110 0000 0001 0010 11-- ---- ----   # SMOV W|Xd,Vn.B[0]
> +    OK  0-00 1110 0000 0010 0010 11-- ---- ----   # SMOV W|Xd,Vn.H[0]
> +    OK  0100 1110 0000 0100 0010 11-- ---- ----   # SMOV Xd,Vn.S[0]
> +    OK  0000 1110 0000 0001 0011 11-- ---- ----   # UMOV Wd,Vn.B[0]
> +    OK  0000 1110 0000 0010 0011 11-- ---- ----   # UMOV Wd,Vn.H[0]
> +    OK  0000 1110 0000 0100 0011 11-- ---- ----   # UMOV Wd,Vn.S[0]
> +    OK  0100 1110 0000 1000 0011 11-- ---- ----   # UMOV Xd,Vn.D[0]
> +  ]
> +  FAIL  0--0 111- ---- ---- ---- ---- ---- ----   # Advanced SIMD vector operations
> +}
> +
> +{
> +  [
> +    OK  0101 1110 --1- ---- 11-1 11-- ---- ----   # FMULX/FRECPS/FRSQRTS (scalar)
> +    OK  0101 1110 -10- ---- 00-1 11-- ---- ----   # FMULX/FRECPS/FRSQRTS (scalar, FP16)
> +    OK  01-1 1110 1-10 0001 11-1 10-- ---- ----   # FRECPE/FRSQRTE/FRECPX (scalar)
> +    OK  01-1 1110 1111 1001 11-1 10-- ---- ----   # FRECPE/FRSQRTE/FRECPX (scalar, FP16)
> +  ]
> +  FAIL  01-1 111- ---- ---- ---- ---- ---- ----   # Advanced SIMD single-element operations
> +}
> +
> +FAIL    0-00 110- ---- ---- ---- ---- ---- ----   # Advanced SIMD structure load/store
> +FAIL    1100 1110 ---- ---- ---- ---- ---- ----   # Advanced SIMD cryptography extensions
> +
> +# These are the "avoidance of doubt" final table of Illegal Advanced SIMD instructions
> +# We don't actually need to include these, as the default is OK.
> +#       -001 111- ---- ---- ---- ---- ---- ----   # Scalar floating-point operations
> +#       --10 110- ---- ---- ---- ---- ---- ----   # Load/store pair of FP registers
> +#       --01 1100 ---- ---- ---- ---- ---- ----   # Load FP register (PC-relative literal)
> +#       --11 1100 --0- ---- ---- ---- ---- ----   # Load/store FP register (unscaled imm)
> +#       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
> +#       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)

Don't we need a FAIL line for the "FJCVTZS should be illegal" case ?

> +FAIL    0000 0100 --1- ---- 1010 ---- ---- ----   # ADR
> +FAIL    0000 0100 --1- ---- 1011 -0-- ---- ----   # FTSSEL, FEXPA
> +FAIL    0000 0101 --10 0001 100- ---- ---- ----   # COMPACT
> +FAIL    0010 0101 --01 100- 1111 000- ---0 ----   # RDFFR, RDFFRS
> +FAIL    0010 0101 --10 1--- 1001 ---- ---- ----   # WRFFR, SETFFR
> +FAIL    0100 0101 --0- ---- 1011 ---- ---- ----   # BDEP, BEXT, BGRP
> +FAIL    0100 0101 000- ---- 0110 1--- ---- ----   # PMULLB, PMULLT (128b result)
> +FAIL    0110 0100 --1- ---- 1110 01-- ---- ----   # FMMLA, BFMMLA
> +FAIL    0110 0101 --0- ---- 0000 11-- ---- ----   # FTSMUL
> +FAIL    0110 0101 --01 0--- 100- ---- ---- ----   # FTMAD
> +FAIL    0110 0101 --01 1--- 001- ---- ---- ----   # FADDA
> +FAIL    0100 0101 --0- ---- 1001 10-- ---- ----   # SMMLA, UMMLA, USMMLA
> +FAIL    0100 0101 --1- ---- 1--- ---- ---- ----   # SVE2 string/histo/crypto instructions
> +FAIL    1000 010- -00- ---- 10-- ---- ---- ----   # SVE2 32-bit gather NT load (vector+scalar)
> +FAIL    1000 010- -00- ---- 111- ---- ---- ----   # SVE 32-bit gather prefetch (vector+imm)
> +FAIL    1000 0100 0-1- ---- 0--- ---- ---- ----   # SVE 32-bit gather prefetch (scalar+vector)
> +FAIL    1000 010- -01- ---- 1--- ---- ---- ----   # SVE 32-bit gather load (vector+imm)
> +FAIL    1000 0100 0-0- ---- 0--- ---- ---- ----   # SVE 32-bit gather load byte (scalar+vector)
> +FAIL    1000 0100 1--- ---- 0--- ---- ---- ----   # SVE 32-bit gather load half (scalar+vector)
> +FAIL    1000 0101 0--- ---- 0--- ---- ---- ----   # SVE 32-bit gather load word (scalar+vector)
> +FAIL    1010 010- ---- ---- 011- ---- ---- ----   # SVE contiguous FF load (scalar+scalar)
> +FAIL    1010 010- ---1 ---- 101- ---- ---- ----   # SVE contiguous NF load (scalar+imm)
> +FAIL    1010 010- -10- ---- 000- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+scalar)
> +FAIL    1010 010- -100 ---- 001- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+imm)
> +FAIL    1100 010- ---- ---- ---- ---- ---- ----   # SVE 64-bit gather load/prefetch
> +FAIL    1110 010- -00- ---- 001- ---- ---- ----   # SVE2 64-bit scatter NT store (vector+scalar)
> +FAIL    1110 010- -10- ---- 001- ---- ---- ----   # SVE2 32-bit scatter NT store (vector+scalar)
> +FAIL    1110 010- ---- ---- 1-0- ---- ---- ----   # SVE scatter store (scalar+32-bit vector)
> +FAIL    1110 010- ---- ---- 101- ---- ---- ----   # SVE scatter store (misc)

> @@ -11312,6 +11338,21 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
>          DP_TBFLAG_ANY(flags, PSTATE__IL, 1);
>      }
>
> +    /*
> +     * The SME exception we are testing for is raised via
> +     * AArch64.CheckFPAdvSIMDEnabled(), and for AArch32 this is called
> +     * when EL1 is using A64 or EL2 using A64 and !TGE.
> +     * See AArch32.CheckAdvSIMDOrFPEnabled().
> +     */
> +    if (el == 0
> +        && FIELD_EX64(env->svcr, SVCR, SM)
> +        && (!arm_is_el2_enabled(env)
> +            || (arm_el_is_aa64(env, 2) && !(env->cp15.hcr_el2 & HCR_TGE)))
> +        && arm_el_is_aa64(env, 1)
> +        && !sme_fa64(env, el)) {

I can't get any of:
 * the logic in the comment
 * the logic in the C code
 * the logic in the the pseudocode AArch32.CheckAdvSIMDOrFPEnabled()
   which causes it to call AArch64.CheckFPEnabled()
to line up with each other.

The comment has:
 * (EL1 A64) OR (EL2 A64 && !TGE)
The pseudocode has:
 * (!TGE && EL1 A64) OR (TGE && EL2 A64 && EL1 A64)
   [seems odd that it is checking the width of EL1 in the TGE case
    but I haven't followed the logic through to find out why]
The C code here has:
 * (!TGE && EL2 A64 && EL1 A64)

What am I missing ?

thanks
-- PMM

