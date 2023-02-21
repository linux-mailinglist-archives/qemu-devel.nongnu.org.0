Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 480AF69DB9D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 09:02:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUNaR-000670-I3; Tue, 21 Feb 2023 03:01:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUNaN-00063w-Ru
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 03:01:16 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUNaL-0002XJ-Vd
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 03:01:15 -0500
Received: by mail-wr1-x433.google.com with SMTP id o4so3396859wrs.4
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 00:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HAcfC9786N1eWYX1X9Q+nPdpXUymxoc3uknfRJNSbXg=;
 b=KbqgUTVyIOjnpXumZ5k9JwjhUl92YtNT3PksfYTsregNz4R6QOw9X6sj+FE++MPCVo
 E4RSRHh6jRlkNdYZbHOrNG0t1aOJe6Eb6VKMGjxqXVv/npiCnIWfWNBF3RzIqKn6xRpZ
 s0LVpwHfliM9k8VH+FJlsUObwV1S3Fo69cerbVTkuTYidVJJZhXv1tZc4OXdH2zMS/aN
 UVBq6uB1z1SCS5KCj9X/e0ABPOPBQS44esnChABknSfVjf0Pu1An8tbXKEi9ujqFBlDX
 IrEm0Nztl8XbWB7TZyQNmAC/YIzFlqbsr+DfPBPkMh9YzS7bUQ/b+E+XrgyF+ugVyT+A
 0Rzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HAcfC9786N1eWYX1X9Q+nPdpXUymxoc3uknfRJNSbXg=;
 b=a920s8kot47Jj9C+WKPcCy4kEQrpoR40fsVPvGWCYEAbSX/V8aH7CNAZ5bIWB39/Cm
 Q7UJ2aPDpUUIWMeCByVrO3+l73RNCpcoHMU3Hg0GEgtVO3zJ1DJs81ffy6lMi+/COcCm
 S+Z9mN/zBVtHzWhhCeBPV4VQWHPEErwOVzdL+cmgMgNfDcvYBOUrIKjm+K0fjq87VGet
 ygCH++4JzokdZBKVKAPM4pTPD8QCG+KeEaFhgbvD14GjtZyyp7UmjkeL3JblebUuEfz6
 g2OZ2eoviaxV4lux4KGdnnyD3aR7Hf0lTeNzswWtJGBrZ8FFFc0MA7a8/pRC0hjaIldZ
 AvIA==
X-Gm-Message-State: AO0yUKW0cHfYLc4xGthVy857n6IdjDVDRSvJa9eJKbSvRKPMOA5FVLPv
 N0ELWeKQnearE/JOYLY9luAIyVuSoWqlFp0X
X-Google-Smtp-Source: AK7set+4kEyei06oDsZx2EZ4bowyE9Ybfg7+8kib5viLjFPFfP58fyrtBx1OyFBC28TMUKDNu+mFpg==
X-Received: by 2002:adf:f390:0:b0:2c5:8353:e0ec with SMTP id
 m16-20020adff390000000b002c58353e0ecmr3104693wro.10.1676966472429; 
 Tue, 21 Feb 2023 00:01:12 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o24-20020a5d58d8000000b002c7066a6f77sm441810wrf.31.2023.02.21.00.01.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 00:01:11 -0800 (PST)
Message-ID: <f0fd8c19-6660-7fdf-1db7-05537b45b91a@linaro.org>
Date: Tue, 21 Feb 2023 09:01:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] target/arm: Fix arm_cpu_get_phys_page_attrs_debug for
 m-profile
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230221034122.471707-1-richard.henderson@linaro.org>
 <20230221034122.471707-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230221034122.471707-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 21/2/23 04:41, Richard Henderson wrote:
> M-profile is not supported by arm_is_secure, so using it as
> a replacement when bypassing get_phys_addr was incorrect.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1421
> Fixes: 4a35855682ce ("target/arm: Plumb debug into S1Translate")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index cb073ac477..057cc9f641 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -2974,9 +2974,10 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
>   {
>       ARMCPU *cpu = ARM_CPU(cs);
>       CPUARMState *env = &cpu->env;
> +    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
>       S1Translate ptw = {
> -        .in_mmu_idx = arm_mmu_idx(env),
> -        .in_secure = arm_is_secure(env),
> +        .in_mmu_idx = mmu_idx,
> +        .in_secure = regime_is_secure(env, mmu_idx),
>           .in_debug = true,
>       };
>       GetPhysAddrResult res = {};

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


