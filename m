Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FE451EB4D
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 05:42:20 +0200 (CEST)
Received: from localhost ([::1]:37232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnXoJ-00035D-Ib
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 23:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnXnD-0002BX-B2
 for qemu-devel@nongnu.org; Sat, 07 May 2022 23:41:11 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:40810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnXnA-0002xt-4x
 for qemu-devel@nongnu.org; Sat, 07 May 2022 23:41:11 -0400
Received: by mail-pl1-x62a.google.com with SMTP id i1so10998837plg.7
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 20:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/btLTFWjdorx03sdvKfbVef2OKFWUZUNiHynRMr0Edg=;
 b=WUmPb1S5WEoft4ndmdCMKgd2lEb5C4qXRqnv2FkM5Kpgvpnz9qX7RSkJlr2l0h0J7f
 p/4NG5tf/5eZpDGHxQKgx9SHistowu9oQiBhNDfiJIGWhTeu3lYUjmvYp+QyubYHBMrQ
 6Hz2Z65WeXGqUDoWYSeyloLcT+8ayVIIeSDl9KIzCWFpxSMo37gbgoqUnTQq1S+3eBV0
 p4jtrNE5FEvQ7EytMu4ELRdWuh8x53mWUMQZhJplnfvmaVft8Fwz3ZWcFGXGqOOTaNc8
 GquIIi7im9XJVCFwPL45+2TALMfKdfHy5i+kG9BmCKY2fA8ErfVWuSu7MwvL5nRZYn0Y
 IPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/btLTFWjdorx03sdvKfbVef2OKFWUZUNiHynRMr0Edg=;
 b=d/rXzVB6HUMHGF0Sf4RCGUs0A4yx1hy7d+lhGekNcKPxQNNjMHQgSqNojDuVKOCJi/
 o20nssboFKXXqrddq9mbZHOKTL664Z6sBihNedPaZ252U+nXK5MonCMNLkbLuoVa5/4s
 YiDRYuAJWtB9tlCB0hF8k1hzppez7Okt5zwZ/0MuqWAFLOK/6LTh8M5ztXL2Wz5hTzTb
 Aquyqy+4gxnN0OnKUd2kWnN5dc/HnWOb1VuwEBEHntr8vlrfkzkoDFN7z9lYatA778ew
 wwiW2aDWPY5+8yCgF0wZo+fepqMd1vB6S/jTjZUQKISUx6bQ7/PGV4Q9BM/bxl5RNXYs
 lEpA==
X-Gm-Message-State: AOAM533GVloGa9GOpkmu30ibcACjT38VLOWEGGNImdAJEiltuLYHRe/W
 54c78V2G/vzFQfEUXS+w9tNhpg==
X-Google-Smtp-Source: ABdhPJzr+FOKX7AjT2aSiLe7e/2VhkFAvHktpWgS7/LJ74TmizMaPbPlMSMKBqr1gwWMCRmxdYAPew==
X-Received: by 2002:a17:90b:1001:b0:1d8:4978:c7d5 with SMTP id
 gm1-20020a17090b100100b001d84978c7d5mr11888046pjb.167.1651981266657; 
 Sat, 07 May 2022 20:41:06 -0700 (PDT)
Received: from [192.168.4.112] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 q6-20020a631f46000000b003c67e472338sm1998285pgm.42.2022.05.07.20.41.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 20:41:06 -0700 (PDT)
Message-ID: <c58d0bc1-8f69-e69d-318b-a7bcacf800ff@linaro.org>
Date: Sat, 7 May 2022 22:41:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v2 2/7] target/ppc: Implemented xvi*ger* instructions
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220506121844.18969-1-lucas.araujo@eldorado.org.br>
 <20220506121844.18969-3-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220506121844.18969-3-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 10c6d7ae43..348a898950 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -238,6 +238,7 @@ typedef union _ppc_vsr_t {
>   
>   typedef ppc_vsr_t ppc_avr_t;
>   typedef ppc_vsr_t ppc_fprp_t;
> +typedef ppc_vsr_t ppc_acc_t;
>   
>   #if !defined(CONFIG_USER_ONLY)
>   /* Software TLB cache */
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index aa6773c4a5..61217e0a10 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -537,6 +537,15 @@ DEF_HELPER_5(XXBLENDVB, void, vsr, vsr, vsr, vsr, i32)
>   DEF_HELPER_5(XXBLENDVH, void, vsr, vsr, vsr, vsr, i32)
>   DEF_HELPER_5(XXBLENDVW, void, vsr, vsr, vsr, vsr, i32)
>   DEF_HELPER_5(XXBLENDVD, void, vsr, vsr, vsr, vsr, i32)
> +DEF_HELPER_5(XVI4GER8, void, env, vsr, vsr, vsr, i32)
> +DEF_HELPER_5(XVI4GER8PP, void, env, vsr, vsr, vsr, i32)
> +DEF_HELPER_5(XVI8GER4, void, env, vsr, vsr, vsr, i32)
> +DEF_HELPER_5(XVI8GER4PP, void, env, vsr, vsr, vsr, i32)
> +DEF_HELPER_5(XVI8GER4SPP, void, env, vsr, vsr, vsr, i32)
> +DEF_HELPER_5(XVI16GER2, void, env, vsr, vsr, vsr, i32)
> +DEF_HELPER_5(XVI16GER2S, void, env, vsr, vsr, vsr, i32)
> +DEF_HELPER_5(XVI16GER2PP, void, env, vsr, vsr, vsr, i32)
> +DEF_HELPER_5(XVI16GER2SPP, void, env, vsr, vsr, vsr, i32)

Did you intend to use "acc" here, for documentation purposes?
It's just a couple of #defines above.

Either way, much cleaner.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

