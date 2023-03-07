Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2E16AF7DA
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:43:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZf4l-0005ND-2e; Tue, 07 Mar 2023 16:42:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pZf4i-0005MY-W9; Tue, 07 Mar 2023 16:42:25 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pZf4g-0003iS-BY; Tue, 07 Mar 2023 16:42:23 -0500
Received: by mail-oi1-x22e.google.com with SMTP id bi17so10763584oib.3;
 Tue, 07 Mar 2023 13:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678225341;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FRbDK6lsB5/z9TI2fv9KfIJVEjcyXGvMjsQxN6B8/2Q=;
 b=S6mdW6elzPiDaAtFZAlCxF877tED5MegdrvTDbUuBTY4MmiCncsnrxwIfcc4crd8bn
 qkTWiFBhGTPQbySHlZ0cARuNst6JNi3mfVe9GQezaNe/v27jTvfwmOvY3lIyiBtUeduj
 55PmWOUNnfcSoRqrlN+i9ndPXuuECvgIf31LOKSG7Qsplpz0JPIIwejr+G8cj7H1nVHC
 BzMUSY8bxYo5s03HXHaju+9ThKWn5tbGmiSuW40mRyZFrMenGEwhtvdRCdtlFeY2x/42
 iT5uHDyO0pcjgBktAKMRyjdB3APQ3B5AvJPua23/1GWSzSLDFvQtNR0gZOvm+lt0j3UR
 oV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678225341;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FRbDK6lsB5/z9TI2fv9KfIJVEjcyXGvMjsQxN6B8/2Q=;
 b=ejtmwO0VA4PAoFJMUi6kwpF5a38xxU4Mp2JQvIkGLpyA91g1n1p7j51MblIjnareMN
 +3yRofPFDHfy/d5Y0ZFmJAmXqMJZrvS6OPtZtLVT9ZFoh01o6uHBnj5LwAchc83ZIUxG
 Dkq5PcCGCzsuVnvYvx8E2u2Za4QjH6pLAmw5geRyBQMHYUCwPMzcA7uGwFZ0DRbCM5gL
 4Pvdbrsyk9HDzDxX8W86o2rRxaOggc4cAFzXRzAaWxWO4KpPRb+BIT2kElvUP74CXsdL
 mZgRsjMXKLuLTzo21bXszBU3mE9mVjYFhx/dh/MYFByJkBq0JkzcL/tKLVFLEom5U+2r
 f/7A==
X-Gm-Message-State: AO0yUKXaTOSWI5gI5hHI/sk2wkd5VJ3TpMHdAaCWHTzrbduLL+yCbF83
 shkinrh7605XkRUns2ebEUQ=
X-Google-Smtp-Source: AK7set8xtif8QavMQdtzVyXstEwFS7I/sR4q5aD63KQW2zDvv1MZ843E1IFhu9jei8gyGf71NduAmg==
X-Received: by 2002:aca:f15:0:b0:384:1e0c:fbbf with SMTP id
 21-20020aca0f15000000b003841e0cfbbfmr6647143oip.40.1678225340826; 
 Tue, 07 Mar 2023 13:42:20 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 m186-20020acabcc3000000b00384d3003fa3sm1555218oif.26.2023.03.07.13.42.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 13:42:20 -0800 (PST)
Message-ID: <56a51f11-1b1c-605e-4198-88cd4c783fdf@gmail.com>
Date: Tue, 7 Mar 2023 18:42:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 15/25] target/ppc: Avoid tcg_const_* in vmx-impl.c.inc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
 <20230307183503.2512684-16-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230307183503.2512684-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22e.google.com
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
>   target/ppc/translate/vmx-impl.c.inc | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
> index ca27c11d87..112233b541 100644
> --- a/target/ppc/translate/vmx-impl.c.inc
> +++ b/target/ppc/translate/vmx-impl.c.inc
> @@ -1624,7 +1624,7 @@ static void glue(gen_, name)(DisasContext *ctx)                         \
>               gen_exception(ctx, POWERPC_EXCP_VPU);                       \
>               return;                                                     \
>           }                                                               \
> -        uimm = tcg_const_i32(UIMM5(ctx->opcode));                       \
> +        uimm = tcg_constant_i32(UIMM5(ctx->opcode));                    \
>           rb = gen_avr_ptr(rB(ctx->opcode));                              \
>           rd = gen_avr_ptr(rD(ctx->opcode));                              \
>           gen_helper_##name(cpu_env, rd, rb, uimm);                       \
> @@ -1965,7 +1965,7 @@ static void gen_vsldoi(DisasContext *ctx)
>       ra = gen_avr_ptr(rA(ctx->opcode));
>       rb = gen_avr_ptr(rB(ctx->opcode));
>       rd = gen_avr_ptr(rD(ctx->opcode));
> -    sh = tcg_const_i32(VSH(ctx->opcode));
> +    sh = tcg_constant_i32(VSH(ctx->opcode));
>       gen_helper_vsldoi(rd, ra, rb, sh);
>   }
>   
> @@ -2575,7 +2575,7 @@ static void gen_##op(DisasContext *ctx)             \
>       rb = gen_avr_ptr(rB(ctx->opcode));              \
>       rd = gen_avr_ptr(rD(ctx->opcode));              \
>                                                       \
> -    ps = tcg_const_i32((ctx->opcode & 0x200) != 0); \
> +    ps = tcg_constant_i32((ctx->opcode & 0x200) != 0); \
>                                                       \
>       gen_helper_##op(cpu_crf[6], rd, ra, rb, ps);    \
>   }
> @@ -2594,7 +2594,7 @@ static void gen_##op(DisasContext *ctx)             \
>       rb = gen_avr_ptr(rB(ctx->opcode));              \
>       rd = gen_avr_ptr(rD(ctx->opcode));              \
>                                                       \
> -    ps = tcg_const_i32((ctx->opcode & 0x200) != 0); \
> +    ps = tcg_constant_i32((ctx->opcode & 0x200) != 0); \
>                                                       \
>       gen_helper_##op(cpu_crf[6], rd, rb, ps);        \
>   }
> @@ -2726,7 +2726,7 @@ static void gen_##op(DisasContext *ctx)       \
>       }                                         \
>       ra = gen_avr_ptr(rA(ctx->opcode));        \
>       rd = gen_avr_ptr(rD(ctx->opcode));        \
> -    st_six = tcg_const_i32(rB(ctx->opcode));  \
> +    st_six = tcg_constant_i32(rB(ctx->opcode));  \
>       gen_helper_##op(rd, ra, st_six);          \
>   }
>   

