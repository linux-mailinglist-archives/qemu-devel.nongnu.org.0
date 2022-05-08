Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1571E51EB58
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 06:06:18 +0200 (CEST)
Received: from localhost ([::1]:44720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnYBU-00011W-LJ
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 00:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnY99-0000A1-KX
 for qemu-devel@nongnu.org; Sun, 08 May 2022 00:03:51 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:41731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnY97-0005lR-OC
 for qemu-devel@nongnu.org; Sun, 08 May 2022 00:03:51 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 z5-20020a17090a468500b001d2bc2743c4so10143758pjf.0
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 21:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=m+kG9P+MqKMwT15u3ig/Ei86gFONKW5RrH10VQd5Z6o=;
 b=duCQxfTQv3+BHiysP7DCrPvgfJSiGhtyf3EwefMpu5O1lZxJtjOP1oqd3b/whttsO4
 wETfVAsb8v83p/mUWjApSrNUvsm9TZC5OwmJacztNgzvjR+9lUGOQe4k1vwRgT9whpmp
 V6/qFqWMcTLQMixJUgE+LB1ZUa8FTKxiux/ViYbPDMWHvpOZWa9737Ig5BZUob7zC+TF
 iPepqx785v6u9C3iggSV37z5kM3FmKxOe3lUwvnByOoEXkzsTTYlzkbe2WMIULBNJclQ
 0mNRH7C4dVh+4JKZRXzueaiaGOHwIk16nj/RA3XKO6477GxfsDbZrMV7anpQQbqlaYN9
 oMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=m+kG9P+MqKMwT15u3ig/Ei86gFONKW5RrH10VQd5Z6o=;
 b=3uFh6i4iFPJ0sOwuJ6tt2JKFG30+0QwztAugn3QklJtQXccQ0F4ax7Yba741eO2lyH
 Zf/nFyyQ6M/wtawxPy0Yb5zIT3TWUfjjU3tgAURxpmhLsSdUAWqmByhhj2XNcXzDuqVH
 NK7JZYZxIbcSgnbN00qiOyyqdY9YK7vyRuhNJInG7kRM+HySrbuzhi/KH9biLf0bzxUo
 d5KhRtNB0RMKx5ns9MkfJG/Oym5Rlok5G1zlfedBY6QfIiWGllL3XoKqpl/6wdwjhw9V
 lhJADhj7XgwJxJC+lt7Km8UhGLFYAaVKiWIQKBc9q6JxjtPhR+1lD0sTqLG/c13SOJki
 xc+w==
X-Gm-Message-State: AOAM5313iQwPXtvBTV1IOUOKmffk96dVr9TZj+vehcZLUiBm5q9o/rwX
 DHyfDHW9HCz2ma4WFktj3c2CjQ==
X-Google-Smtp-Source: ABdhPJwcJRpwpFElLUduU6si3/dgT8x4PcC+hNUviKBuxTpfZV5taD3/i4NHmK8KROw92Fi3QMFNjg==
X-Received: by 2002:a17:902:7891:b0:15e:f845:b816 with SMTP id
 q17-20020a170902789100b0015ef845b816mr5801835pll.60.1651982627756; 
 Sat, 07 May 2022 21:03:47 -0700 (PDT)
Received: from [192.168.4.112] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 x23-20020a170902821700b0015e8d4eb248sm4358559pln.146.2022.05.07.21.03.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 21:03:47 -0700 (PDT)
Message-ID: <a846d013-881d-943e-8042-5696fbe6f102@linaro.org>
Date: Sat, 7 May 2022 23:03:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v2 4/7] target/ppc: Implemented xvf*ger*
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220506121844.18969-1-lucas.araujo@eldorado.org.br>
 <20220506121844.18969-5-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220506121844.18969-5-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/6/22 07:18, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
> 
> Implement the following PowerISA v3.1 instructions:
> xvf32ger:   VSX Vector 32-bit Floating-Point GER (rank-1 update)
> xvf32gernn: VSX Vector 32-bit Floating-Point GER (rank-1 update) Negative
> multiply, Negative accumulate
> xvf32gernp: VSX Vector 32-bit Floating-Point GER (rank-1 update) Negative
> multiply, Positive accumulate
> xvf32gerpn: VSX Vector 32-bit Floating-Point GER (rank-1 update) Positive
> multiply, Negative accumulate
> xvf32gerpp: VSX Vector 32-bit Floating-Point GER (rank-1 update) Positive
> multiply, Positive accumulate
> xvf64ger:   VSX Vector 64-bit Floating-Point GER (rank-1 update)
> xvf64gernn: VSX Vector 64-bit Floating-Point GER (rank-1 update) Negative
> multiply, Negative accumulate
> xvf64gernp: VSX Vector 64-bit Floating-Point GER (rank-1 update) Negative
> multiply, Positive accumulate
> xvf64gerpn: VSX Vector 64-bit Floating-Point GER (rank-1 update) Positive
> multiply, Negative accumulate
> xvf64gerpp: VSX Vector 64-bit Floating-Point GER (rank-1 update) Positive
> multiply, Positive accumulate
> 
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
> ---
>   target/ppc/cpu.h                    |   4 +
>   target/ppc/fpu_helper.c             | 178 ++++++++++++++++++++++++++++
>   target/ppc/helper.h                 |  10 ++
>   target/ppc/insn32.decode            |  13 ++
>   target/ppc/translate/vsx-impl.c.inc |  12 ++
>   5 files changed, 217 insertions(+)
> 
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 348a898950..eb50ad699e 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -2639,6 +2639,8 @@ static inline bool lsw_reg_in_range(int start, int nregs, int rx)
>   #define VsrSW(i) s32[i]
>   #define VsrD(i) u64[i]
>   #define VsrSD(i) s64[i]
> +#define VsrSF(i) f32[i]
> +#define VsrDF(i) f64[i]
>   #else
>   #define VsrB(i) u8[15 - (i)]
>   #define VsrSB(i) s8[15 - (i)]
> @@ -2648,6 +2650,8 @@ static inline bool lsw_reg_in_range(int start, int nregs, int rx)
>   #define VsrSW(i) s32[3 - (i)]
>   #define VsrD(i) u64[1 - (i)]
>   #define VsrSD(i) s64[1 - (i)]
> +#define VsrSF(i) f32[3 - (i)]
> +#define VsrDF(i) f64[1 - (i)]
>   #endif
>   
>   static inline int vsr64_offset(int i, bool high)
> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
> index f6c8318a71..138b30d08f 100644
> --- a/target/ppc/fpu_helper.c
> +++ b/target/ppc/fpu_helper.c
> @@ -3462,3 +3462,181 @@ void helper_xssubqp(CPUPPCState *env, uint32_t opcode,
>       *xt = t;
>       do_float_check_status(env, GETPC());
>   }
> +
> +static void set_rounding_mode_rn(CPUPPCState *env)
> +{
> +    uint8_t rmode = (env->fpscr & FP_RN) >> FPSCR_RN0;
> +    switch (rmode) {
> +    case 0:
> +        set_float_rounding_mode(float_round_nearest_even, &env->fp_status);
> +        break;
> +    case 1:
> +        set_float_rounding_mode(float_round_to_zero, &env->fp_status);
> +        break;
> +    case 2:
> +        set_float_rounding_mode(float_round_up, &env->fp_status);
> +        break;
> +    case 3:
> +        set_float_rounding_mode(float_round_down, &env->fp_status);
> +        break;
> +    default:
> +        abort();
> +    }
> +}

How is this different from fpscr_set_rounding_mode and why do you need to call it at all?


r~

