Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6E86AF7DC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:43:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZf5f-0006mU-8L; Tue, 07 Mar 2023 16:43:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pZf5c-0006UR-7X; Tue, 07 Mar 2023 16:43:20 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pZf5Y-0003pc-35; Tue, 07 Mar 2023 16:43:17 -0500
Received: by mail-oi1-x232.google.com with SMTP id t22so10721116oiw.12;
 Tue, 07 Mar 2023 13:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678225394;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z5bFLOyz4Q0+N7gyRn3Mw8b40eLOvU6v0V3t8wPyeFY=;
 b=ENd2ryNeg9z4wdSYCJR/RCWYx22WfuIWtJZy/GIBPYcYmkpj4s6D9j31EDpIrTK2nJ
 D/z3ZFSP7p+c5qAz+KZ+pswU3MPPjT4qqfywezRalrrZGWOttHolsdCTxlVOfcR7LGOI
 rMLaxhkl612zBJCwudMdMeopjou34Qp+FQXQwZuE+iU+igauVGjQ0YbMfFV6SZTPlzI3
 8vQN6uaTaNzV53vnEhnLmwzLtYzAIv4jPkpyqI92WNw7Mea0+FtLR1ln7H5wP1HDrGTl
 +mab7wTf2lml0f6eB7D/bS2LSDeni0kxQADXIQs/RdhrMmHNGbM2A0/fXQUeZfX++Xvl
 1HyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678225394;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z5bFLOyz4Q0+N7gyRn3Mw8b40eLOvU6v0V3t8wPyeFY=;
 b=rMsvGySqVnKCXoSiti6an86zZcOJ4JxfjNcYhorPRhQL+TjRq20rrxIwusVsuYNG6/
 cUa0B/w+OHwt761izOBJq0EFy+edl1BOiQp7RQHzA+zvPH0w3DapuY2CoM5nOxOy3w3+
 21a7bkx/iXQZTGCW8e93EC/BvGS6b6+YVYEOwDZmv02farIzmqy9iBuOpqKgfAybsfzf
 d8Y7gMFcJJCMymHRU2C2l5/1vySsgJA36Y9vdvH9HOrvIv2cav5wv8EjfdWpSCAl4oOG
 VTX8564YHV9nymyznoik2pgAtAB4KC9GgokHm7hg+6aogppABrvh2ivwfpimMiDECim4
 IEFg==
X-Gm-Message-State: AO0yUKVTDYtQ074eOr21B4LJkf2FVcjqvQhSInbcoAH5YtJyM7VFvq7Y
 oyeNO5UxBVOKCskwErL3QTo=
X-Google-Smtp-Source: AK7set+o6x+GspAUArfH5NAxsIjcQBLrcVA+/1NibMfsGXI2un4GOlFwfVDkXZaQGs417eQdeTQEDw==
X-Received: by 2002:a05:6808:153:b0:37f:9528:2b57 with SMTP id
 h19-20020a056808015300b0037f95282b57mr7057245oie.54.1678225394333; 
 Tue, 07 Mar 2023 13:43:14 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 r128-20020acaf386000000b00383ef567cfdsm5632121oih.21.2023.03.07.13.43.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 13:43:13 -0800 (PST)
Message-ID: <7a0cb784-2522-7a3d-0c5d-4e3292642d8c@gmail.com>
Date: Tue, 7 Mar 2023 18:43:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 18/25] target/ppc: Avoid tcg_const_* in fp-impl.c.inc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
 <20230307183503.2512684-19-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230307183503.2512684-19-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 3/7/23 15:34, Richard Henderson wrote:
> All uses are strictly read-only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

> Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
> Cc: Cédric Le Goater <clg@kaod.org>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: qemu-ppc@nongnu.org
> ---
>   target/ppc/translate/fp-impl.c.inc | 26 ++++++++++++--------------
>   1 file changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
> index d5d88e7d49..57d8437851 100644
> --- a/target/ppc/translate/fp-impl.c.inc
> +++ b/target/ppc/translate/fp-impl.c.inc
> @@ -348,7 +348,7 @@ static void gen_fcmpo(DisasContext *ctx)
>       t0 = tcg_temp_new_i64();
>       t1 = tcg_temp_new_i64();
>       gen_reset_fpstatus();
> -    crf = tcg_const_i32(crfD(ctx->opcode));
> +    crf = tcg_constant_i32(crfD(ctx->opcode));
>       get_fpr(t0, rA(ctx->opcode));
>       get_fpr(t1, rB(ctx->opcode));
>       gen_helper_fcmpo(cpu_env, t0, t1, crf);
> @@ -368,7 +368,7 @@ static void gen_fcmpu(DisasContext *ctx)
>       t0 = tcg_temp_new_i64();
>       t1 = tcg_temp_new_i64();
>       gen_reset_fpstatus();
> -    crf = tcg_const_i32(crfD(ctx->opcode));
> +    crf = tcg_constant_i32(crfD(ctx->opcode));
>       get_fpr(t0, rA(ctx->opcode));
>       get_fpr(t1, rB(ctx->opcode));
>       gen_helper_fcmpu(cpu_env, t0, t1, crf);
> @@ -541,7 +541,7 @@ static void gen_mcrfs(DisasContext *ctx)
>       tcg_gen_andi_i64(tnew_fpscr, tnew_fpscr,
>                        ~((0xF << shift) & FP_EX_CLEAR_BITS));
>       /* FEX and VX need to be updated, so don't set fpscr directly */
> -    tmask = tcg_const_i32(1 << nibble);
> +    tmask = tcg_constant_i32(1 << nibble);
>       gen_helper_store_fpscr(cpu_env, tnew_fpscr, tmask);
>   }
>   
> @@ -681,9 +681,7 @@ static void gen_mtfsb0(DisasContext *ctx)
>       crb = 31 - crbD(ctx->opcode);
>       gen_reset_fpstatus();
>       if (likely(crb != FPSCR_FEX && crb != FPSCR_VX)) {
> -        TCGv_i32 t0;
> -        t0 = tcg_const_i32(crb);
> -        gen_helper_fpscr_clrbit(cpu_env, t0);
> +        gen_helper_fpscr_clrbit(cpu_env, tcg_constant_i32(crb));
>       }
>       if (unlikely(Rc(ctx->opcode) != 0)) {
>           tcg_gen_trunc_tl_i32(cpu_crf[1], cpu_fpscr);
> @@ -703,9 +701,7 @@ static void gen_mtfsb1(DisasContext *ctx)
>       crb = 31 - crbD(ctx->opcode);
>       /* XXX: we pretend we can only do IEEE floating-point computations */
>       if (likely(crb != FPSCR_FEX && crb != FPSCR_VX && crb != FPSCR_NI)) {
> -        TCGv_i32 t0;
> -        t0 = tcg_const_i32(crb);
> -        gen_helper_fpscr_setbit(cpu_env, t0);
> +        gen_helper_fpscr_setbit(cpu_env, tcg_constant_i32(crb));
>       }
>       if (unlikely(Rc(ctx->opcode) != 0)) {
>           tcg_gen_trunc_tl_i32(cpu_crf[1], cpu_fpscr);
> @@ -733,10 +729,12 @@ static void gen_mtfsf(DisasContext *ctx)
>           gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);
>           return;
>       }
> -    if (l) {
> -        t0 = tcg_const_i32((ctx->insns_flags2 & PPC2_ISA205) ? 0xffff : 0xff);
> +    if (!l) {
> +        t0 = tcg_constant_i32(flm << (w * 8));
> +    } else if (ctx->insns_flags2 & PPC2_ISA205) {
> +        t0 = tcg_constant_i32(0xffff);
>       } else {
> -        t0 = tcg_const_i32(flm << (w * 8));
> +        t0 = tcg_constant_i32(0xff);
>       }
>       t1 = tcg_temp_new_i64();
>       get_fpr(t1, rB(ctx->opcode));
> @@ -767,8 +765,8 @@ static void gen_mtfsfi(DisasContext *ctx)
>           return;
>       }
>       sh = (8 * w) + 7 - bf;
> -    t0 = tcg_const_i64(((uint64_t)FPIMM(ctx->opcode)) << (4 * sh));
> -    t1 = tcg_const_i32(1 << sh);
> +    t0 = tcg_constant_i64(((uint64_t)FPIMM(ctx->opcode)) << (4 * sh));
> +    t1 = tcg_constant_i32(1 << sh);
>       gen_helper_store_fpscr(cpu_env, t0, t1);
>       if (unlikely(Rc(ctx->opcode) != 0)) {
>           tcg_gen_trunc_tl_i32(cpu_crf[1], cpu_fpscr);

