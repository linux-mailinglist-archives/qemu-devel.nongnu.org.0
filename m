Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 877BF6AF80A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:52:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZfE6-0001Ml-QN; Tue, 07 Mar 2023 16:52:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pZfE4-0001Ly-7M; Tue, 07 Mar 2023 16:52:04 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pZfE2-0005Xz-C7; Tue, 07 Mar 2023 16:52:03 -0500
Received: by mail-oi1-x236.google.com with SMTP id s41so10740630oiw.13;
 Tue, 07 Mar 2023 13:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678225920;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6PD57IzsERyb0ZaPhEhMgWoh9I40jDB0YKs1BENhvqc=;
 b=ogZ5KK9QXTxAdsN3haxh/LfXjkUWZz1a29UQJ+3vYkj4Rl+Ovawa055/+fmNVSl2zd
 zxf++lssrXYCBrAHXivIG88NnC2k2FuLySin2atUVrgexehjMyAEFSREKBiUbmLlpUJW
 3NShsSVRQxVitXgIrX7NLBv0A568VDZ/0DeUScJcbSBwanH5DpRy5cRxXFsdVr2BNpie
 tFKzTCT3JtMnOTxR8D0JVz21rAdVSPtbgf0+N2zQy6cx0hAADKFfCbHt4FH36l5kf7On
 /f2feU57lXyyPGGCO37HAA+u22L+LSK27EreHdDSg5Dkg1oFs/qUfcs380YV/5bxPJ0T
 HYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678225920;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6PD57IzsERyb0ZaPhEhMgWoh9I40jDB0YKs1BENhvqc=;
 b=PbI1WB+TsODPCuOKhzCSLDwyh8HDk7nUyTkAHGQaJ5yF7j3RfKyYcu9wJVvmTdvM4H
 0CzIRU1zv2bUjKbcOEvEHabPuvnUNKUMVmRkFatKC3ABWY3Nn+wqagNS7lM80db6ELqZ
 c1wKl/1sX/YIK3qfsVyd5yBeS4uphgS92Ry3mEyY4iH2rX/7VKinaapNC5tW1aLAlCVK
 YoCdEktdKzQJkT8f7DXT415k1wBGQbod4A2foSlHaX6PBqxtiYyUoQMjgyVK2F+Ticwz
 DrGWd3uR1PLuPcNUvd9BiY9guWve3XkCVJc83eDcVFl9WIzrbkQkt97YmzdnT7oe3A6I
 R/8A==
X-Gm-Message-State: AO0yUKVQxJwqa0Q+Ke+OXlOv+v2ik3cRb4QPtOL2yFPLh616OcMztE0Y
 tqwFW8pTjBl6yJgmA7OBIeM=
X-Google-Smtp-Source: AK7set+DiY6He2YHqk1rFOOqnmY14H/AQiyvRpU8uhEmCNvKDT+l8fnBWoCQy2c4VG/OHZwq8I378g==
X-Received: by 2002:a54:4789:0:b0:378:2762:2770 with SMTP id
 o9-20020a544789000000b0037827622770mr7584976oic.15.1678225920534; 
 Tue, 07 Mar 2023 13:52:00 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a0568080aa800b00383cc29d6b2sm5558590oij.51.2023.03.07.13.51.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 13:52:00 -0800 (PST)
Message-ID: <4951ac67-2bfd-b6db-4cb6-94d7ead96325@gmail.com>
Date: Tue, 7 Mar 2023 18:51:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 20/25] target/ppc: Rewrite trans_ADDG6S
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
 <20230307183503.2512684-21-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230307183503.2512684-21-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x236.google.com
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
> Compute all carry bits in parallel instead of a loop.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Hmmmm the function was added by 6addef4d27268 9 months ago. All tcg ops you used
here were available back then.

I guess this existing implementation was an oversight on our end.


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

> Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
> Cc: Cédric Le Goater <clg@kaod.org>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: qemu-ppc@nongnu.org
> ---
>   target/ppc/translate/fixedpoint-impl.c.inc | 44 +++++++++++-----------
>   1 file changed, 23 insertions(+), 21 deletions(-)
> 
> diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
> index 20ea484c3d..02d86b77a8 100644
> --- a/target/ppc/translate/fixedpoint-impl.c.inc
> +++ b/target/ppc/translate/fixedpoint-impl.c.inc
> @@ -484,33 +484,35 @@ static bool trans_PEXTD(DisasContext *ctx, arg_X *a)
>   
>   static bool trans_ADDG6S(DisasContext *ctx, arg_X *a)
>   {
> -    const uint64_t carry_bits = 0x1111111111111111ULL;
> -    TCGv t0, t1, carry, zero = tcg_constant_tl(0);
> +    const target_ulong carry_bits = (target_ulong)-1 / 0xf;
> +    TCGv in1, in2, carryl, carryh, tmp;
> +    TCGv zero = tcg_constant_tl(0);
>   
>       REQUIRE_INSNS_FLAGS2(ctx, BCDA_ISA206);
>   
> -    t0 = tcg_temp_new();
> -    t1 = tcg_const_tl(0);
> -    carry = tcg_const_tl(0);
> +    in1 = cpu_gpr[a->ra];
> +    in2 = cpu_gpr[a->rb];
> +    tmp = tcg_temp_new();
> +    carryl = tcg_temp_new();
> +    carryh = tcg_temp_new();
>   
> -    for (int i = 0; i < 16; i++) {
> -        tcg_gen_shri_tl(t0, cpu_gpr[a->ra], i * 4);
> -        tcg_gen_andi_tl(t0, t0, 0xf);
> -        tcg_gen_add_tl(t1, t1, t0);
> +    /* Addition with carry. */
> +    tcg_gen_add2_tl(carryl, carryh, in1, zero, in2, zero);
> +    /* Addition without carry. */
> +    tcg_gen_xor_tl(tmp, in1, in2);
> +    /* Difference between the two is carry in to each bit. */
> +    tcg_gen_xor_tl(carryl, carryl, tmp);
>   
> -        tcg_gen_shri_tl(t0, cpu_gpr[a->rb], i * 4);
> -        tcg_gen_andi_tl(t0, t0, 0xf);
> -        tcg_gen_add_tl(t1, t1, t0);
> +    /*
> +     * The carry-out that we're looking for is the carry-in to
> +     * the next nibble.  Shift the double-word down one nibble,
> +     * which puts all of the bits back into one word.
> +     */
> +    tcg_gen_extract2_tl(carryl, carryl, carryh, 4);
>   
> -        tcg_gen_andi_tl(t1, t1, 0x10);
> -        tcg_gen_setcond_tl(TCG_COND_NE, t1, t1, zero);
> -
> -        tcg_gen_shli_tl(t0, t1, i * 4);
> -        tcg_gen_or_tl(carry, carry, t0);
> -    }
> -
> -    tcg_gen_xori_tl(carry, carry, (target_long)carry_bits);
> -    tcg_gen_muli_tl(cpu_gpr[a->rt], carry, 6);
> +    /* Invert, isolate the carry bits, and produce 6's. */
> +    tcg_gen_andc_tl(carryl, tcg_constant_tl(carry_bits), carryl);
> +    tcg_gen_muli_tl(cpu_gpr[a->rt], carryl, 6);
>       return true;
>   }
>   

