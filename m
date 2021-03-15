Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 966AA33AED7
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 10:30:55 +0100 (CET)
Received: from localhost ([::1]:41344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLjYs-00011P-Kg
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 05:30:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLjWQ-0007je-QE; Mon, 15 Mar 2021 05:28:22 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:42553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLjWP-0006mM-0l; Mon, 15 Mar 2021 05:28:22 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 b2-20020a7bc2420000b029010be1081172so19013466wmj.1; 
 Mon, 15 Mar 2021 02:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3gE21AGus4Y8yIWR45Z/yuQMO8pdjey0F7sBwoUOX6Y=;
 b=l7is9P38Q+ReFoO7+fkZ14Kpqb5zd6jOjb29Ihh4SU15WJyIrEDht9Q2uAWh3FI6Dx
 dAp+tFHtpROrvmKPqhkJBOPE1XlUp5vDpvpQ9LFkRmxBMzy14zrtShnroLl9DIbsl9z1
 HXkHR7ygV5nahIOrqt6WT5/Y5c/SHl/F0s7t9weqYFNcZ8JxhP0TX8N79tjVrLvsSMfJ
 WKlfgVX2jNCFoZx0hM9Qe58/eYlci5TutrEWrHLKKvs7/v78hycs4n8gXgoLP5Lleu/z
 sQIyjAcr4ftsgauJf44w3ojueNJKCnP9dLLhQV/Xqj4bmuqfP3WXBYpmxQ8hSbMhCdqT
 78TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3gE21AGus4Y8yIWR45Z/yuQMO8pdjey0F7sBwoUOX6Y=;
 b=FLf8kh4C1F+5SDA5ZabM7QfdjvP/dVXQ2v2UAzzkijfhnqoWDpLCp2mXMRMe0siL1P
 tX+gNKleZ/xg7NGAfzcwWYvrWQZwJ9ZtqMckstrHbzBH2AuHV5mrX7DREOzunKeYQBax
 LUEqdf/rvgtFnRExmQRIg7WTBk4FJqIoa/NQYybo4/WdoE4AGcVZgoDdrn/QMtlXc0yO
 8VQu3YpmAa206MuNd7JyLVRfVo6VutqOAiza9iXp4RhBtNGT525bUm+JLQ4LqQfFSsQe
 9y1OmSpvW29Ztnlj/PSurGae9bovNymkF+x7kFhP/F03QwZLkVUshez3vyI762lshjON
 ofFA==
X-Gm-Message-State: AOAM533cuR6iLVjC/IOH975c2AzlihZL+fejA7TZN//YSiNnvxk+UwP2
 jAidHxllLI1cJawvLV5w7dAMa604wrOj5A==
X-Google-Smtp-Source: ABdhPJwVeZg8S18I0c8J473rk7L9o1BgANv3mqo9WRAqR+v0lEHTHBOsJLP4cPUhFGJ6PY5i8Ug1zg==
X-Received: by 2002:a1c:e389:: with SMTP id a131mr25201121wmh.78.1615800498423; 
 Mon, 15 Mar 2021 02:28:18 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u3sm17524178wrt.82.2021.03.15.02.28.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 02:28:17 -0700 (PDT)
Subject: Re: [PATCH] Hexagon (target/hexagon) fix typo in comment
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1615784115-26559-1-git-send-email-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3ee6512a-62be-72ff-2b29-12285f0168e0@amsat.org>
Date: Mon, 15 Mar 2021 10:28:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1615784115-26559-1-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 5:55 AM, Taylor Simpson wrote:
> Signed-of-by: Taylor Simpson <tsimpson@quicinc.com>

'git-commit -s' flag add the S-o-b line automatically ;)

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/hexagon/op_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
> index 9f19007..7361a07 100644
> --- a/target/hexagon/op_helper.c
> +++ b/target/hexagon/op_helper.c
> @@ -297,7 +297,7 @@ int32_t HELPER(fcircadd)(int32_t RxV, int32_t offset, int32_t M, int32_t CS)
>  }
>  
>  /*
> - * Hexagon FP operations return ~0 insteat of NaN
> + * Hexagon FP operations return ~0 instead of NaN
>   * The hex_check_sfnan/hex_check_dfnan functions perform this check
>   */
>  static float32 hex_check_sfnan(float32 x)
> 


