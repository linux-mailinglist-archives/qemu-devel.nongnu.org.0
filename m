Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8391F3F0FD9
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 03:11:12 +0200 (CEST)
Received: from localhost ([::1]:48894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGWaN-0005pt-4i
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 21:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGWYx-00057T-3e
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 21:09:43 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:42574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGWYt-0007cv-GR
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 21:09:42 -0400
Received: by mail-pg1-x530.google.com with SMTP id o2so4252202pgr.9
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 18:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=F5uNX9vZHed1HJrkaa4ElnLANUPlhQTuFtbVlUi9EHs=;
 b=a/eEy3N4XHlUjHKt28gU7tjqOgUMQMOesfZc6CiSItgHNqEQyOelvWCEYIqF862G1l
 hvB138/iNLEF3jU+6n0jVGPDljDrY67KFs40cLfePxQ10/NtIjijqsU1p9ER/1JLTvlK
 eoJKOHKjamQaselAwhiuUiYbnhKJEeb0exXn72cMaFFER1/xMKZaIfY3ftghnb2e7nb9
 cPs9kqn74hk5BBbfroxrQMvNJL9y0CeYxrLZDVBdXPYEQcyoy3O1IOdThPw8iI2BH/U2
 U/pjAvccvYu5sRSRUlmc1dqWjkk6U+dj6BqCjaswnlx8dXM3/IPPPzfyiL/601JInbzF
 LJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F5uNX9vZHed1HJrkaa4ElnLANUPlhQTuFtbVlUi9EHs=;
 b=TN9hE5mGTbtdfetaVYEUkCYWrKhWoYatWVoGzus19BZze1tlVt+26VNWbXseuyTwCx
 3/sY/lEg05GjG/uYMAhD4QDTzX5Yy0D32VoP8kF+gDCQU+y4X5ggGfNS4OITPXUdDbB0
 Cq42ty3TmvpsybWr/ZVvusJJafQTSRVbH8h58wlmdM5zPQwRZ/zQhgXE3wqeXGfiMlxO
 Ljfz7dcyiFDSn6WiRhplMipHAQnzUPbUNjDxVH26sywrDfeEQoXzOwnFcf4b8EO12quf
 HuG2IopH6IUq6w3/iVfBVZnPNYNH3XwBsoCJEH8l1CSOobHz4OJY6/7D+wb73CEWdX2J
 eWLw==
X-Gm-Message-State: AOAM531KSxBsGuuoRmd1JzJPjcTnM7Kg3nW1Sx3JSmIp9G5zR8kPPAOD
 RGBSoi9loAQW/PEiURHxMzN0hA==
X-Google-Smtp-Source: ABdhPJzM1uy+2uj0xa5NaKkTGoxW1rSCyBP5z8sNbYCxs5MbJshY/QICEW3L94KM4Dzn46VPDlOtDA==
X-Received: by 2002:a63:1d63:: with SMTP id d35mr11707837pgm.238.1629335377615; 
 Wed, 18 Aug 2021 18:09:37 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id u3sm5836646pjr.2.2021.08.18.18.09.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 18:09:37 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] target/riscv: update Zb[abcs] to 1.0.0 (public
 review) specification
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20210818203233.791599-1-philipp.tomsich@vrull.eu>
 <20210818203233.791599-3-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7750e59b-9498-19ef-bf41-804f6e0bcae2@linaro.org>
Date: Wed, 18 Aug 2021 15:09:33 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818203233.791599-3-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URI_DOTEDU=0.844 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 10:32 AM, Philipp Tomsich wrote:
> The ratification package for Zb[abcs] does not contain all instructions
> that have been added to QEmu and don't define misa.B for these: the
> individual extensions are now Zba, Zbb, Zbc and Zbs.
> 
> Some of the instructions that had previously been added and now need to
> be dropped are:
>   - shift-one instructions
>   - generalized reverse and or-combine
>   - w-forms of single-bit instructions
>   - w-form of rev8


Do not try to do this all in one patch.  It's too large to review that way.

> The following have been adjusted:
>   - rori and slli.uw only accept a 6-bit shamt field
>     (if the bit that is reserved for a future 7-bit shamt for RV128 is
>      set, the encoding is illegal on RV64)

The gen_shifti helper should be taking care of testing that the shamt is in range.  You 
really should match the base shift instructions here.


>  
> -static bool trans_grevi(DisasContext *ctx, arg_grevi *a)
> +static void gen_orc_b(TCGv ret, TCGv source1)
>  {
> -    REQUIRE_EXT(ctx, RVB);
> -
> -    if (a->shamt >= TARGET_LONG_BITS) {
> -        return false;
> -    }
> -
> -    return gen_grevi(ctx, a);
> +    TCGv  tmp = tcg_temp_new();
> +    tcg_gen_andi_tl(tmp, source1, (TARGET_LONG_BITS == 64) ? 0x5555555555555555LL
> +                                                           : 0x55555555);
> +    tcg_gen_shli_tl(tmp, tmp, 1);
> +    tcg_gen_or_tl(source1, source1, tmp);
> +    tcg_gen_andi_tl(tmp, source1, (TARGET_LONG_BITS == 64) ? 0xaaaaaaaaaaaaaaaaLL
> +                                                           : 0xaaaaaaaa);
> +    tcg_gen_shri_tl(tmp, tmp, 1);
> +    tcg_gen_or_tl(source1, source1, tmp);
> +    tcg_gen_andi_tl(tmp, source1, (TARGET_LONG_BITS == 64) ? 0x3333333333333333LL
> +                                                           : 0x33333333);
> +    tcg_gen_shli_tl(tmp, tmp, 2);
> +    tcg_gen_or_tl(source1, source1, tmp);
> +    tcg_gen_andi_tl(tmp, source1, (TARGET_LONG_BITS == 64) ? 0xccccccccccccccccLL
> +                                                           : 0xcccccccc);
> +    tcg_gen_shri_tl(tmp, tmp, 2);
> +    tcg_gen_or_tl(source1, source1, tmp);
> +    tcg_gen_andi_tl(tmp, source1, (TARGET_LONG_BITS == 64) ? 0x0f0f0f0f0f0f0f0fLL
> +                                                           : 0x0f0f0f0f);
> +    tcg_gen_shli_tl(tmp, tmp, 4);
> +    tcg_gen_or_tl(source1, source1, tmp);
> +    tcg_gen_andi_tl(tmp, source1, (TARGET_LONG_BITS == 64) ? 0xf0f0f0f0f0f0f0f0LL
> +                                                           : 0xf0f0f0f0);
> +    tcg_gen_shri_tl(tmp, tmp, 4);
> +    tcg_gen_or_tl(ret, source1, tmp);
>  }

You can use the simpler algorithm from
  https://graphics.stanford.edu/~seander/bithacks.html#ZeroInWord

   /* Set msb in each byte if the byte was zero. */
   tcg_gen_subi_tl(tmp, src1, dup_const(MO_8, 0x01));
   tcg_gen_andc_tl(tmp, tmp, src1);
   tcg_gen_andi_tl(tmp, tmp, dup_const(MO_8, 0x80));
   /* Replicate the msb of each byte across the byte. */
   tcg_gen_shri_tl(tmp, tmp, 7);
   tcg_gen_muli_tl(dest, tmp, 0xff);


> 
> +static void gen_clmulx(DisasContext *ctx, arg_r *a, bool reverse)
> +{
> +    TCGv source1 = tcg_temp_new();
> +    TCGv source2 = tcg_temp_new();
> +    TCGv zeroreg = tcg_const_tl(0);
> +    TCGv t0 = tcg_temp_new();
> +    TCGv t1 = tcg_temp_new();
> +    TCGv result = tcg_temp_new();
> +
> +    gen_get_gpr(source1, a->rs1);
> +    gen_get_gpr(source2, a->rs2);
> +    tcg_gen_movi_tl(result, 0);
> +
> +    for (int i = 0; i < TARGET_LONG_BITS; i++) {
> +        tcg_gen_shri_tl(t0, source2, i);
> +        if (reverse) {
> +            tcg_gen_shri_tl(t1, source1, TARGET_LONG_BITS - i - 1);
> +        } else {
> +            tcg_gen_shli_tl(t1, source1, i);
> +        }
> +        tcg_gen_andi_tl(t0, t0, 1);
> +        tcg_gen_xor_tl(t1, result, t1);
> +        tcg_gen_movcond_tl(TCG_COND_NE, result, t0, zeroreg, t1, result);
> +    }
> +
> +    gen_set_gpr(a->rd, result);
> +    tcg_temp_free(source1);
> +    tcg_temp_free(source2);
> +    tcg_temp_free(t0);
> +    tcg_temp_free(t1);
> +    tcg_temp_free(zeroreg);
> +    tcg_temp_free(result);
> +}

This inline is way too large -- up to 384 instructions.
Use a couple of out-of-line helpers.


r~

