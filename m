Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC61C6F82CC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 14:19:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puuPJ-0002xz-LO; Fri, 05 May 2023 08:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuPH-0002xT-IF
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:19:27 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuPE-0008U7-P9
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:19:27 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-50bc25f0c7dso3275124a12.3
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 05:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683289163; x=1685881163;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9F9nrHIqT4cHL2HPKkO52PNi9k2pPqn6K/rFeFi5Ry4=;
 b=HGMtyuoLL2+O/0f+8+w50i63tj0yXTMCLP2v3JPX7nJC9FCfGcpA4KjJpA+1vIb6QR
 E9nTKpdB0i1TcaNrvpIjFZVCWH9Y6xVET6pPJqPeIkLT6mQn6j8idScb8ormzNtYNbbP
 3ublb9KCEIidaaaSQ2DOaYbtnVJRBBgE9SSdtXQBooXp6GI2NVATSxJLLjRoRWaWiPUm
 QHY/gmmifpyJEFXb1sGs7kr15vQ0du1U7qkL8JhSJcpLPNyqWGxOj0WfCbhInu59Az3F
 Lnbic9lNYNFZiWnEecgRno57jmfFHDIGp7fkib7xo+uCVh78fU5kHPQGbJD+pcqlTBic
 uo9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683289163; x=1685881163;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9F9nrHIqT4cHL2HPKkO52PNi9k2pPqn6K/rFeFi5Ry4=;
 b=OgkPkHjpauym6Q1Kf4RbWh3JptwcRn763Nh+TnvrN/hr/qYbuXwvd66+DaOMk7dLT9
 y9yHyCu1AQObRoaferFCa7M+A3yy28yfQ3hLJDi83U6YadrhOMoIRphwdDfXVLvAPqec
 NdW5Yu+60il5jrEXrRqeF+4cYeHqn9YzSpS3Ctu2xeCYAQ/McdssEp+Ej0BU/F+V2cgy
 soUWULN2Oq2b5ViuzIbFaryKuYgIo47ZGJehZ+mBPEvmVZOBUmMjE0IA17SuEEtm/4+w
 yIvrAyTzi7q+uHoA9i8Hi7XzQnFMY5o7J6JSna78KK+AgTPuCckAiuhwWq+m9YOyo9w2
 0FiA==
X-Gm-Message-State: AC+VfDwkVvp2LiQ8xK5V8G9bF2XSpErQVru3NUxbnPgvbvlQKZViLKXl
 Q/SoHRLiyIKnbDpTGgHLl1J2UkRkeA2RQsfKvcN0WQ==
X-Google-Smtp-Source: ACHHUZ6QAfVwxWhkcz81dwgHcFXBHtnk/WCBYBlBJAyV/JiLaCJhSBKzXrSuMd0haRe8LLCYeVeVJaz+1/xkQ4lJAxA=
X-Received: by 2002:a05:6402:685:b0:50b:f7b2:79d0 with SMTP id
 f5-20020a056402068500b0050bf7b279d0mr1284208edy.31.1683289163158; Fri, 05 May
 2023 05:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-31-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-31-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:19:12 +0100
Message-ID: <CAFEAcA9dOpZUeCnkHxmSAPTs20ZuUW++kFEtp2icmmST=yGPvA@mail.gmail.com>
Subject: Re: [PATCH v4 30/57] tcg/sparc64: Allocate %g2 as a third temporary
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 3 May 2023 at 08:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/sparc64/tcg-target.c.inc | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
> index e997db2645..64464ab363 100644
> --- a/tcg/sparc64/tcg-target.c.inc
> +++ b/tcg/sparc64/tcg-target.c.inc
> @@ -83,9 +83,10 @@ static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
>  #define ALL_GENERAL_REGS     MAKE_64BIT_MASK(0, 32)
>  #define ALL_QLDST_REGS       (ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
>
> -/* Define some temporary registers.  T2 is used for constant generation.  */
> +/* Define some temporary registers.  T3 is used for constant generation.  */
>  #define TCG_REG_T1  TCG_REG_G1
> -#define TCG_REG_T2  TCG_REG_O7
> +#define TCG_REG_T2  TCG_REG_G2
> +#define TCG_REG_T3  TCG_REG_O7
>
>  #ifndef CONFIG_SOFTMMU
>  # define TCG_GUEST_BASE_REG TCG_REG_I5
> @@ -110,7 +111,6 @@ static const int tcg_target_reg_alloc_order[] = {
>      TCG_REG_I4,
>      TCG_REG_I5,
>
> -    TCG_REG_G2,
>      TCG_REG_G3,
>      TCG_REG_G4,
>      TCG_REG_G5,
> @@ -492,8 +492,8 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
>  static void tcg_out_movi(TCGContext *s, TCGType type,
>                           TCGReg ret, tcg_target_long arg)
>  {
> -    tcg_debug_assert(ret != TCG_REG_T2);
> -    tcg_out_movi_int(s, type, ret, arg, false, TCG_REG_T2);
> +    tcg_debug_assert(ret != TCG_REG_T3);
> +    tcg_out_movi_int(s, type, ret, arg, false, TCG_REG_T3);
>  }

Why do we need to change this usage of TCG_REG_T2 but not
any of the others ?

thanks
-- PMM

