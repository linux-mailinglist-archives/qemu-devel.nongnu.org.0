Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 533266AF7DE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:43:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZf5d-0006Qw-8G; Tue, 07 Mar 2023 16:43:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pZf5K-000667-Dl; Tue, 07 Mar 2023 16:43:08 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pZf5I-0003n3-Ix; Tue, 07 Mar 2023 16:43:02 -0500
Received: by mail-oi1-x234.google.com with SMTP id e21so10773543oie.1;
 Tue, 07 Mar 2023 13:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678225379;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mG52ftw09H5SYTgqyweunyYOKnwwqjxfvZbyJ0tRebk=;
 b=T6J72I/5iFNNsOUvlY3lspi3bVuXQVaAuyGQLc2ZPsKR2+rR+eljJxEPA/xvY6ikgK
 AavUUyKcuMAxxPGDedfJVvQWwTgqviEAZKyUt3/YmAgX9KvOUYeB2xF1IwQ95FCwHbuD
 CXtFBfvbo+J2B2B8sEO1QtuVB+0Qsnagmbiu2uZ0TpP4ZgMDWSHfVTN8rWt6F1lEBQwb
 h1moDEx8alOKIUayjr1JUucxjzn9orgkNyfWPUZYkSdskLT86BstyMvh6Hte5AHRQA9S
 8OUPc70komuZkC13yb93zCFyXPShPDVScI3rZO8VYwLxyYLX6FP5bPYdNUnsRoT+lYv6
 l/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678225379;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mG52ftw09H5SYTgqyweunyYOKnwwqjxfvZbyJ0tRebk=;
 b=jmV79YJ+u2+eaQuZ7+IqYYUIhOTi783PXOY/xmO+h6tZTQky9acyLkD0gi7yn5yBe6
 AfV+UksGQ5YzkTsMmRklNgAKFKlYu8NCAfyEceiwe0DOP/jZV0FjyDFpIhQ9eu44VfBX
 PNThK3bYFXg6g6ylOwphPy0ypWG0mEhnCZsjEQOxHPsN3vVfF8Mb2nINmk5Hbkl/Ugvx
 6w6Yr4qsZK1p6yYmJC+XpfLl8fwVnF6rImWz1uPq+4xsCqZgkv8Tuf+4MrzORuXJtdoU
 Ve3DvKJtYLDyn8U8CkFlazR/CXNVxVIvAysv4URjft31V0Ttx5EM6hprOhyVhYQZVLso
 SK8Q==
X-Gm-Message-State: AO0yUKU5y1CH/wElUBlneibCJvB4D+NPg0n5G/J7AZd0sQuJaRroxF4m
 dBylJdEyTlDS2b2G5Qc43gQRqJP2U98=
X-Google-Smtp-Source: AK7set+VmsoQ+daeM4FAPz7kI7RqfcfvhjebFyW2LvASBen89dkL5zrUQcFjQ78apja5SErV+sXHlg==
X-Received: by 2002:a54:4103:0:b0:378:2fb7:f6a6 with SMTP id
 l3-20020a544103000000b003782fb7f6a6mr6634055oic.45.1678225379145; 
 Tue, 07 Mar 2023 13:42:59 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 r11-20020acaa80b000000b0037fa035f4f3sm5658226oie.53.2023.03.07.13.42.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 13:42:58 -0800 (PST)
Message-ID: <5f513af2-30da-fd38-2c56-894cd149ce65@gmail.com>
Date: Tue, 7 Mar 2023 18:42:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 17/25] target/ppc: Avoid tcg_const_* in vsx-impl.c.inc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
 <20230307183503.2512684-18-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230307183503.2512684-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x234.google.com
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
> All remaining uses are strictly read-only.
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
>   target/ppc/translate/vsx-impl.c.inc | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
> index 9916784e64..0f5b0056f1 100644
> --- a/target/ppc/translate/vsx-impl.c.inc
> +++ b/target/ppc/translate/vsx-impl.c.inc
> @@ -154,7 +154,7 @@ static void gen_lxvdsx(DisasContext *ctx)
>   static void gen_bswap16x8(TCGv_i64 outh, TCGv_i64 outl,
>                             TCGv_i64 inh, TCGv_i64 inl)
>   {
> -    TCGv_i64 mask = tcg_const_i64(0x00FF00FF00FF00FF);
> +    TCGv_i64 mask = tcg_constant_i64(0x00FF00FF00FF00FF);
>       TCGv_i64 t0 = tcg_temp_new_i64();
>       TCGv_i64 t1 = tcg_temp_new_i64();
>   
> @@ -825,7 +825,7 @@ static bool trans_XSCVQPDP(DisasContext *ctx, arg_X_tb_rc *a)
>       REQUIRE_INSNS_FLAGS2(ctx, ISA300);
>       REQUIRE_VSX(ctx);
>   
> -    ro = tcg_const_i32(a->rc);
> +    ro = tcg_constant_i32(a->rc);
>   
>       xt = gen_avr_ptr(a->rt);
>       xb = gen_avr_ptr(a->rb);
> @@ -860,7 +860,7 @@ static void gen_##name(DisasContext *ctx)                                     \
>           gen_exception(ctx, POWERPC_EXCP_VSXU);                                \
>           return;                                                               \
>       }                                                                         \
> -    opc = tcg_const_i32(ctx->opcode);                                         \
> +    opc = tcg_constant_i32(ctx->opcode);                                      \
>       gen_helper_##name(cpu_env, opc);                                          \
>   }
>   
> @@ -900,7 +900,7 @@ static void gen_##name(DisasContext *ctx)                                     \
>           gen_exception(ctx, POWERPC_EXCP_VSXU);                                \
>           return;                                                               \
>       }                                                                         \
> -    opc = tcg_const_i32(ctx->opcode);                                         \
> +    opc = tcg_constant_i32(ctx->opcode);                                      \
>       xa = gen_vsr_ptr(xA(ctx->opcode));                                        \
>       xb = gen_vsr_ptr(xB(ctx->opcode));                                        \
>       gen_helper_##name(cpu_env, opc, xa, xb);                                  \
> @@ -915,7 +915,7 @@ static void gen_##name(DisasContext *ctx)                                     \
>           gen_exception(ctx, POWERPC_EXCP_VSXU);                                \
>           return;                                                               \
>       }                                                                         \
> -    opc = tcg_const_i32(ctx->opcode);                                         \
> +    opc = tcg_constant_i32(ctx->opcode);                                      \
>       xb = gen_vsr_ptr(xB(ctx->opcode));                                        \
>       gen_helper_##name(cpu_env, opc, xb);                                      \
>   }
> @@ -929,7 +929,7 @@ static void gen_##name(DisasContext *ctx)                                     \
>           gen_exception(ctx, POWERPC_EXCP_VSXU);                                \
>           return;                                                               \
>       }                                                                         \
> -    opc = tcg_const_i32(ctx->opcode);                                         \
> +    opc = tcg_constant_i32(ctx->opcode);                                      \
>       xt = gen_vsr_ptr(rD(ctx->opcode) + 32);                                   \
>       xa = gen_vsr_ptr(rA(ctx->opcode) + 32);                                   \
>       xb = gen_vsr_ptr(rB(ctx->opcode) + 32);                                   \
> @@ -945,7 +945,7 @@ static void gen_##name(DisasContext *ctx)                                     \
>           gen_exception(ctx, POWERPC_EXCP_VSXU);                                \
>           return;                                                               \
>       }                                                                         \
> -    opc = tcg_const_i32(ctx->opcode);                                         \
> +    opc = tcg_constant_i32(ctx->opcode);                                      \
>       xt = gen_vsr_ptr(rD(ctx->opcode) + 32);                                   \
>       xb = gen_vsr_ptr(rB(ctx->opcode) + 32);                                   \
>       gen_helper_##name(cpu_env, opc, xt, xb);                                  \
> @@ -960,7 +960,7 @@ static void gen_##name(DisasContext *ctx)                                     \
>           gen_exception(ctx, POWERPC_EXCP_VSXU);                                \
>           return;                                                               \
>       }                                                                         \
> -    opc = tcg_const_i32(ctx->opcode);                                         \
> +    opc = tcg_constant_i32(ctx->opcode);                                      \
>       xa = gen_vsr_ptr(rA(ctx->opcode) + 32);                                   \
>       xb = gen_vsr_ptr(rB(ctx->opcode) + 32);                                   \
>       gen_helper_##name(cpu_env, opc, xa, xb);                                  \
> @@ -1994,8 +1994,8 @@ static void gen_xsxsigdp(DisasContext *ctx)
>       exp = tcg_temp_new_i64();
>       t0 = tcg_temp_new_i64();
>       t1 = tcg_temp_new_i64();
> -    zr = tcg_const_i64(0);
> -    nan = tcg_const_i64(2047);
> +    zr = tcg_constant_i64(0);
> +    nan = tcg_constant_i64(2047);
>   
>       get_cpu_vsr(t1, xB(ctx->opcode), true);
>       tcg_gen_extract_i64(exp, t1, 52, 11);
> @@ -2026,8 +2026,8 @@ static void gen_xsxsigqp(DisasContext *ctx)
>       get_cpu_vsr(xbl, rB(ctx->opcode) + 32, false);
>       exp = tcg_temp_new_i64();
>       t0 = tcg_temp_new_i64();
> -    zr = tcg_const_i64(0);
> -    nan = tcg_const_i64(32767);
> +    zr = tcg_constant_i64(0);
> +    nan = tcg_constant_i64(32767);
>   
>       tcg_gen_extract_i64(exp, xbh, 48, 15);
>       tcg_gen_movi_i64(t0, 0x0001000000000000);
> @@ -2193,8 +2193,8 @@ static void gen_xvxsigdp(DisasContext *ctx)
>       get_cpu_vsr(xbl, xB(ctx->opcode), false);
>       exp = tcg_temp_new_i64();
>       t0 = tcg_temp_new_i64();
> -    zr = tcg_const_i64(0);
> -    nan = tcg_const_i64(2047);
> +    zr = tcg_constant_i64(0);
> +    nan = tcg_constant_i64(2047);
>   
>       tcg_gen_extract_i64(exp, xbh, 52, 11);
>       tcg_gen_movi_i64(t0, 0x0010000000000000);

