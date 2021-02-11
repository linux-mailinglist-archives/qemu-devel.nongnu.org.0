Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0BB319687
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 00:25:28 +0100 (CET)
Received: from localhost ([::1]:45702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lALKx-0005K3-CU
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 18:25:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lALHx-00042F-IV
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 18:22:21 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lALHv-0006sQ-1d
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 18:22:21 -0500
Received: by mail-wr1-x435.google.com with SMTP id v15so5864991wrx.4
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 15:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eOpb4CJrL8IXWg/ifr+MtEWFFwQ/Tp0LpgR1805iCvI=;
 b=dgcmNdviJyQBOJeKTJ60PrYEIn1v+DNHXZNPT5B319YOaPE2vnyhQp5qg5/9bpUTYJ
 oEMVuXdYGMWrh0cfv4sVoa95wBjsaE+PDGT8T9Ng3BVrIVFVm9gG2Lqbyiq4I73Z/68R
 WxGlAd65GKsv1prP/wLjbQ8xHZBsQTw7jxIO+Y8Vhbt+PowPZKpJuoVEQdg+wiY/C3Ol
 5zWpySAsX3CaqZBAgwDcv6Xlnixt8UV9VLtF9FZZBchAwFgikDc8s8V3MVU4BNPvGU5G
 kROhWIg3AjI3GqE8p8S9C151RYGwlDEuJ6boLVJobHVkwkVHHOyf08G5upEBVMphkoV6
 xCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eOpb4CJrL8IXWg/ifr+MtEWFFwQ/Tp0LpgR1805iCvI=;
 b=YcGy2ZLli5A37GHOPab+wIJIN+EPkHC6Jelk0x2fgbrSTHqvnBgslWYGKCRgyLt4Pf
 dnPd3nnVcWK7lyMsDUraYTiK5dJC1ZBuxQK95NumlQhgXn/oxLH+ON7TN6wr3tmvWE3f
 CUiIshsP7KjslDfCo++MDq9GLzdIJD1E/Isc2nnZKd97k6rOjEpKaAzxGpXZ8qh9lUFp
 Kvqc0TfXOwtYcX6oYJEW0j3zCryC6qW5bTWZJWFPKqoF0IyRSBW9yqQC1GQkvKJIxXkP
 CTOzDK2eLYo5RJEc1/xBAWj/Fe80U5dD9i1e2YRuJxDLnM3Bo8oAVTIXsPDeaPnYfN/J
 2Isw==
X-Gm-Message-State: AOAM531ceRtj4ZU4MgfkENZPs7xGsKOhZdnVdzxptoqng7Cb+IpHNUBT
 cejJfh/j2iEBfr7eu8yq0TI=
X-Google-Smtp-Source: ABdhPJwqTzFMwFkTv5PGLPM6llMOBMHqFTlAwIWXj8FZuwzy1/5Dw9xabEcX4ppH7TDnktid84JCaw==
X-Received: by 2002:a05:6000:2cf:: with SMTP id
 o15mr174938wry.184.1613085737544; 
 Thu, 11 Feb 2021 15:22:17 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b13sm6717443wrt.31.2021.02.11.15.22.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 15:22:17 -0800 (PST)
Subject: Re: [RFC PATCH 04/10] target/hexagon: introduce new helper functions
To: Alessandro Di Federico <ale.qemu@rev.ng>, qemu-devel@nongnu.org
References: <20210211215051.2102435-1-ale.qemu@rev.ng>
 <20210211215051.2102435-5-ale.qemu@rev.ng>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6808f7ac-0ac0-61a4-e07a-0c2b483f3376@amsat.org>
Date: Fri, 12 Feb 2021 00:22:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210211215051.2102435-5-ale.qemu@rev.ng>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: babush@rev.ng, bcain@quicinc.com, tsimpson@quicinc.com, nizzo@rev.ng,
 Alessandro Di Federico <ale@rev.ng>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/21 10:50 PM, Alessandro Di Federico via wrote:
> From: Niccolò Izzo <nizzo@rev.ng>
> 
> These helpers will be employed by the idef-parser generated code.
> 

Shouldn't this be signed by Niccolò too?

> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> ---
>  target/hexagon/genptr.c | 224 ++++++++++++++++++++++++++++++++++++++++
>  target/hexagon/genptr.h |  19 ++++
>  2 files changed, 243 insertions(+)
> 
> diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
> index 97de669f38..33446bd713 100644
> --- a/target/hexagon/genptr.c
> +++ b/target/hexagon/genptr.c
> @@ -334,5 +334,229 @@ static inline void gen_store_conditional8(CPUHexagonState *env,
>      tcg_gen_movi_tl(hex_llsc_addr, ~0);
>  }
>  
> +void gen_fbrev(TCGv result, TCGv src)
> +{
> +    TCGv lo = tcg_temp_new();
> +    TCGv tmp1 = tcg_temp_new();
> +    TCGv tmp2 = tcg_temp_new();
> +
> +    /* Bit reversal of low 16 bits */
> +    tcg_gen_andi_tl(lo, src, 0xffff);
> +    tcg_gen_andi_tl(tmp1, lo, 0xaaaa);
> +    tcg_gen_shri_tl(tmp1, tmp1, 1);
> +    tcg_gen_andi_tl(tmp2, lo, 0x5555);
> +    tcg_gen_shli_tl(tmp2, tmp2, 1);
> +    tcg_gen_or_tl(lo, tmp1, tmp2);
> +    tcg_gen_andi_tl(tmp1, lo, 0xcccc);
> +    tcg_gen_shri_tl(tmp1, tmp1, 2);
> +    tcg_gen_andi_tl(tmp2, lo, 0x3333);
> +    tcg_gen_shli_tl(tmp2, tmp2, 2);
> +    tcg_gen_or_tl(lo, tmp1, tmp2);
> +    tcg_gen_andi_tl(tmp1, lo, 0xf0f0);
> +    tcg_gen_shri_tl(tmp1, tmp1, 4);
> +    tcg_gen_andi_tl(tmp2, lo, 0x0f0f);
> +    tcg_gen_shli_tl(tmp2, tmp2, 4);
> +    tcg_gen_or_tl(lo, tmp1, tmp2);
> +    tcg_gen_bswap16_tl(lo, lo);
> +
> +    /* Final tweaks */
> +    tcg_gen_andi_tl(result, src, 0xffff0000);
> +    tcg_gen_ori_tl(result, lo, 8);

Maybe use tcg_gen_extract_tl() here?

> +
> +    tcg_temp_free(lo);
> +    tcg_temp_free(tmp1);
> +    tcg_temp_free(tmp2);
> +}
> +
> +TCGv gen_set_bit(int i, TCGv result, TCGv src)
> +{

I wonder if i should be tcg_target_long.

> +    TCGv mask = tcg_const_tl(~(1 << i));
> +    TCGv bit = tcg_temp_new();

> +    tcg_gen_shli_tl(bit, src, i);
> +    tcg_gen_and_tl(result, result, mask);
> +    tcg_gen_or_tl(result, result, bit);

Maybe optimize with tcg_gen_deposit_tl()?

> +    tcg_temp_free(mask);
> +    tcg_temp_free(bit);
> +
> +    return result;
> +}
> +
> +void gen_cancel(TCGv slot)
> +{
> +    TCGv one = tcg_const_tl(1);
> +    TCGv mask = tcg_temp_new();

> +    tcg_gen_shl_tl(mask, one, slot);

Similarly this looks like a deposit.

> +    tcg_gen_or_tl(hex_slot_cancelled, hex_slot_cancelled, mask);
> +    tcg_temp_free(one);
> +    tcg_temp_free(mask);
> +}
> +
> +void gen_store32(TCGv vaddr, TCGv src, int width, int slot)

tcg_target_long width?

unsigned slot (various).

> +{
> +    tcg_gen_mov_tl(hex_store_addr[slot], vaddr);
> +    tcg_gen_movi_tl(hex_store_width[slot], width);
> +    tcg_gen_mov_tl(hex_store_val32[slot], src);
> +}

