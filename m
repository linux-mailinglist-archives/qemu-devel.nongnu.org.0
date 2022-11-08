Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A92620A19
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 08:22:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osIvK-0001ZG-KJ; Tue, 08 Nov 2022 02:21:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1osIuQ-0001Ts-Uz
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 02:20:38 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1osIuP-0005mN-9p
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 02:20:34 -0500
Received: by mail-pl1-x62f.google.com with SMTP id y4so13411588plb.2
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 23:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bc4W1yjwdWqakp0H76k1u3BlvMchjvU4wwr1s0K7yzY=;
 b=HK8o9pDeQq2grgt0BRnEyU5/hVEr5x3hdW/nA7LOzTWX2K8Mftqi2XqUtvS6t+8T0b
 qxyba1QRhnww2VIOwP0b/Ez4r7kjQmeFmLzJvalKUHwOb+X4s2qkgubDxMG4A16x3krC
 nQ7g8HJNGoBwwALuUTCBTlQiMqMP/uh1KFa48tg1RKzi5tYo0Kr5+KyAyWeStOjCTPZE
 pMeuISUMEeU4ZJI1+sn5zaNjN/G+8oNhc9iijPzmtT7KzM5dCHsEov86O+6dw6gjBW6u
 N2Xu9+LkO2/pJXjzLxQxS1vj6sp52moeZInDqv9tJD2AJ+or+rTOd3eDJzyXSGzuzDs8
 t8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bc4W1yjwdWqakp0H76k1u3BlvMchjvU4wwr1s0K7yzY=;
 b=TYwV41UH0wnLjsmem47ShWRNDWYUGJRaIqGPkC83IVLm8pJvCr4nU2LnfVrzHAdl1y
 tHa7S8T3Eg/7G8WkkjrUdXNqcygb0/nn7M1U8ADYm6XGH4otrOlVJpoyR2kiXxCwcql6
 34D8Ngqd9N1uW9JkROCpVuCmH1bKv0JjsXHydshpg+jHBmY/2uyYIsgPzEoV41lZdYkR
 KNV5eLbDd5jIUvt6SolESzXL9O+FcHF68FCQJolW0fnIELGyx1p50PZxtU7YY2XVL//H
 L+/9mKafAFnJ2JDfOpBtwvTIO1J8iOhsBzIl1BRixVk/bdzLm7yPmJMFSnIu0fpHP7OI
 0qIA==
X-Gm-Message-State: ACrzQf3tvqmdEHuEBa9bWqN3ofE3ZTvyROsgkNUmUZt6giMvM3yJPCB5
 50d+f1zxaJxPO+EFjw69Q/67cQ==
X-Google-Smtp-Source: AMsMyM7Qz0xHxuBQdVcHXr5YlWtPaVvrP6nYo3WaVB09Bs91U256ldGsYLnInuyE7f5IvdB3gDiO7A==
X-Received: by 2002:a17:902:ebc5:b0:186:b848:c6a with SMTP id
 p5-20020a170902ebc500b00186b8480c6amr54337937plg.46.1667892024803; 
 Mon, 07 Nov 2022 23:20:24 -0800 (PST)
Received: from ?IPV6:2001:8003:d918:7a00:2588:8f43:55e5:fca3?
 ([2001:8003:d918:7a00:2588:8f43:55e5:fca3])
 by smtp.gmail.com with ESMTPSA id
 b16-20020a170902e95000b00186616b8fbasm6227531pll.10.2022.11.07.23.20.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 23:20:24 -0800 (PST)
Message-ID: <65665a1c-8eed-f487-de8b-5b75b183992a@linaro.org>
Date: Tue, 8 Nov 2022 18:19:51 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 03/11] Hexagon (target/hexagon) Add overrides for
 S2_asr_r_r_sat/S2_asl_r_r_sat
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20221108040552.22175-1-tsimpson@quicinc.com>
 <20221108040552.22175-4-tsimpson@quicinc.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221108040552.22175-4-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 11/8/22 15:05, Taylor Simpson wrote:
> +/* Shift left with saturation */
> +static void gen_shl_sat(TCGv dst, TCGv src, TCGv shift_amt)
> +{
> +    TCGv_i64 src64 = tcg_temp_local_new_i64();
> +    TCGv_i64 shift64 = tcg_temp_new_i64();
> +    TCGv_i64 dst64 = tcg_temp_new_i64();
> +    TCGv dst_sar = tcg_temp_new();
> +    TCGv ovf = tcg_temp_new();
> +    TCGv satval = tcg_temp_new();
> +    TCGv min = tcg_constant_tl(0x80000000);
> +    TCGv max = tcg_constant_tl(0x7fffffff);
> +
> +    /*
> +     *     dst64 = (int64_t)src << (int64_t)shift_amt
> +     *     dst = (int32_t)dst64
> +     *     dst_sar = dst >> shift_amt
> +     *     if (dst_sar != src) {
> +     *         usr.OVF = 1
> +     *         dst = src < 0 ? min : max
> +     *     }
> +     */
> +    tcg_gen_ext_i32_i64(src64, src);
> +    tcg_gen_ext_i32_i64(shift64, shift_amt);
> +    tcg_gen_shl_i64(dst64, src64, shift64);
> +
> +    tcg_gen_extrl_i64_i32(dst, dst64);
> +    tcg_gen_sar_tl(dst_sar, dst, shift_amt);

I don't think this is quite right.  In particular:

> +static void gen_asr_r_r_sat(TCGv RdV, TCGv RsV, TCGv RtV)
> +{
> +    TCGv shift_amt = tcg_temp_local_new();
> +    TCGLabel *positive = gen_new_label();
> +    TCGLabel *done = gen_new_label();
> +
> +    tcg_gen_sextract_i32(shift_amt, RtV, 0, 7);

This suggests shift amounts -64 ... 63.

> +    tcg_gen_brcondi_tl(TCG_COND_GE, shift_amt, 0, positive);
> +
> +    /* Negative shift amount => shift left */
> +    tcg_gen_neg_tl(shift_amt, shift_amt);

-64 -> 64.

So!  We have two out-of-range shifts in gen_shl_sat, both i64 and i32.
If we fix one, then we don't even need the extension to i64 either.

Consider

     /*
      * sh32 = shift & 31;
      * dst = sh32 == shift ? src : 0;
      * dst <<= sh32;
      * dst_sar = dst >> sh32;
      * if (dst_sar != src) ...
      */
     tcg_gen_andi_i32(sh32, shift_amt, 31);
     tcg_gen_movcond_i32(TCG_COND_EQ, dst,
                         sh32, shift_amt,
                         src, tcg_constant_i32(0));
     tcg_gen_shl_i32(dst, dst, sh32);
     tcg_gen_sar_i32(dst_sar, dst, sh32);


r~


