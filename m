Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECFB3492B0
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 14:05:35 +0100 (CET)
Received: from localhost ([::1]:58802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPPg6-0007wi-4r
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 09:05:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPPdl-0007BL-RZ
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 09:03:09 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:45670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPPdh-0000hC-1s
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 09:03:06 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 91-20020a9d08640000b0290237d9c40382so1792335oty.12
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 06:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rvDKRNIn3F7yLqXvtsubm4DODZxNDgY/GJ4zAN5yRLo=;
 b=u9EVaewP1jfc/3JnGBjrab9nWR9bSoUJbCebeB0LJO+9ZBGpHxRmVSSEh+A7cKrSbW
 yYm2ekgTSr851oVjkF+dbpSqbcYwc/RDDNed5kL+74YGrdvoxRfzgCETfNGwa6ZZCu0p
 4vf/K/peKquOXsp66QV2gT4fqRJzgU+3Ee0Co7nbwb04Y0eNq/bzz2bxS0JkteuvhRzw
 Nu2OQXLFez+mhU+OSQHEowskbP6gt/D4dBXJ6zcLEG69ICzrQlBxdGj/WkcuZnE6Txs8
 sRJlTdcR2kuDtqKpProXzR3mDjBiD2QktA96kDIIBZ//WDkRgNZqyzx3uSqFBP3K6Lup
 fVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rvDKRNIn3F7yLqXvtsubm4DODZxNDgY/GJ4zAN5yRLo=;
 b=fZ9M4U/NwgxxIqWvNwj+LnquN75VJUAd6kJyjRY2KfGBmb0Kne8iwE1OeZNeL4dQ5d
 Dqi3bfQV5VzcRBMN0MMGSTWyhj6P3TOdUQ7cV/no7FvT2UsfvDwN87dCSDOvRFWxyXey
 uRCcBu8E8YP0WKc2es4HtThDqObgZ9Kp7kCrpHr+F/Jfg7A0xWKkeVdOOYuMUMRLVsdG
 0IM2x2cU3Vxsg5WPp0Hq9imtNm2bAfd+vxTFatJVPhIbrrWJ2xbfEuMDnPL4HhEjzy5K
 ZDCP2towzH8gjWA9vx9BC9qDgbrCKGXXnooGr6cU921WxE1Y7oDmYUM+hASfJx15nji5
 FVeA==
X-Gm-Message-State: AOAM531XWlxFzLe32NBgJNSDttMfasmzQ+ClaOt9949vu5lJNKdcUJvh
 s0mcTG2aqBNuxsRag7k9wMhTJg==
X-Google-Smtp-Source: ABdhPJwXyqu6/NUm4YvgDyOZZrOFr4XskjznQAf6fJo0Kx/+mDergRjJMMSKrfQoT0pN+2GBCIqq6Q==
X-Received: by 2002:a9d:7e8d:: with SMTP id m13mr7340803otp.54.1616677382232; 
 Thu, 25 Mar 2021 06:03:02 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id k11sm1365830otp.28.2021.03.25.06.03.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 06:03:01 -0700 (PDT)
Subject: Re: [PATCH 02/15] Hexagon (target/hexagon) remove unnecessary inline
 directives
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1616640610-17319-1-git-send-email-tsimpson@quicinc.com>
 <1616640610-17319-3-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <10c84189-40b2-2905-8cc3-8a511f55749e@linaro.org>
Date: Thu, 25 Mar 2021 07:02:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1616640610-17319-3-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 8:49 PM, Taylor Simpson wrote:
> Address feedback from Richard Henderson <richard.henderson@linaro.org>
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   linux-user/hexagon/cpu_loop.c |  2 +-
>   target/hexagon/cpu.c          |  9 ++++-----
>   target/hexagon/cpu.h          |  6 ++----
>   target/hexagon/decode.c       |  6 +++---
>   target/hexagon/fma_emu.c      | 39 ++++++++++++++++++++-------------------
>   target/hexagon/op_helper.c    | 39 +++++++++++++++++++--------------------
>   target/hexagon/translate.c    |  2 +-
>   7 files changed, 50 insertions(+), 53 deletions(-)
> 
> diff --git a/linux-user/hexagon/cpu_loop.c b/linux-user/hexagon/cpu_loop.c
> index 9a68ca0..a752a0a 100644
> --- a/linux-user/hexagon/cpu_loop.c
> +++ b/linux-user/hexagon/cpu_loop.c
> @@ -25,7 +25,7 @@
>   
>   void cpu_loop(CPUHexagonState *env)
>   {
> -    CPUState *cs = CPU(hexagon_env_get_cpu(env));
> +    CPUState *cs = CPUSTATE_FROM_ENV(env);

This is not removing inlines from functions in c files, so this patch should be 
split.

> -static inline HexagonCPU *hexagon_env_get_cpu(CPUHexagonState *env)
> -{
> -    return container_of(env, HexagonCPU, env);
> -}
> +#define HEXAGONCPU_FROM_ENV(env)    container_of((env), HexagonCPU, env)
> +#define CPUSTATE_FROM_ENV(env)      CPU(HEXAGONCPU_FROM_ENV(env))

Since a578cdfbdd8f, these should be replaced by env_archcpu and env_cpu 
respectively.


r~

