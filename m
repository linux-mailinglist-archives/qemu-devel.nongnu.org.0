Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B219965DC40
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 19:37:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD8c7-0007ZD-Pq; Wed, 04 Jan 2023 13:35:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD8c6-0007Z5-Jq
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 13:35:46 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD8c5-0002M8-11
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 13:35:46 -0500
Received: by mail-ej1-x633.google.com with SMTP id t17so84620354eju.1
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 10:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/F0QL/NslfGs2iRFvF0ppWsEHa2erkG5cwyYY1DWahQ=;
 b=Fwv8Rtu7L1/Hor0EZx9xDaL5Nl+YlGVbiVfyKk8FJLyYSH5J4k2IbzA5DkH23amnP8
 wgshlJ0FLrewZybSGESv2amisgY+a/Owq0THemJafqx5wVYEMnv8EoWlrSJWiHA2xWqC
 eLlFZ9GLFyvRTHYbtmg7s29nNOJNpXcXa242fKu+v4+2cK0+t7NPOXMUZufDybOx//5W
 hQlvhBDglAoGlAbbuCpM40rdObdtca8Keb44/QzV99EzdNrInRGFkfZmwW27WYZHlIR2
 KvjmA7S2qCwEWu8sZMAUdJmmE2R/jthAl8jNdVSS4An+IZs9A30f/GOLZ54OK6C/tbFm
 6OiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/F0QL/NslfGs2iRFvF0ppWsEHa2erkG5cwyYY1DWahQ=;
 b=NRKZ0E43qVavBWZgnC/I6qd0ccOH4l2gNao6KiwF8UZTcVjpYhHr8CcmLpI72Oo1Hr
 6tg4tWcIKDONWyUl6Y+Np++o1QkkGMBOJsZEvB3Qp2zYCUOZirp+Ax+PfjiTciJHjYUz
 3yiNF5y74saCs7en8rMhLorr95sOtdNU64WOQKC4KjL21W3hPRobq8hxgy5tkD9pohwm
 BSu1cVJTx7kkIKRkq8vupoSswnSwW8VkIpaN3oYf9pM+Zas1sgWBVlN3r6RzlrmQX7FQ
 9SaFkaIEYu3ECvmvJLLOV9sFmNi22TZsjtLFU9xNDKAQPf9UE7bSdlN9nMEwleBSxsti
 gVLQ==
X-Gm-Message-State: AFqh2kqsBKbK2cZ/nL2+wNIdKGwkI++ArJS+A2ZVvVsT6O7K+Y0FT2M7
 7y7mSQFXYRP7xdBELpi541Yz3Q==
X-Google-Smtp-Source: AMrXdXsSBR9rFJoCmKAiDiBjDDnCtGnxQUHhODYF9Z+3gBuBMgwidrPnBZGfHYtdhPPsflQcZK0tPw==
X-Received: by 2002:a17:906:279a:b0:7c1:10b4:4742 with SMTP id
 j26-20020a170906279a00b007c110b44742mr40436848ejc.55.1672857342523; 
 Wed, 04 Jan 2023 10:35:42 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 la26-20020a170907781a00b0084767d40f0dsm15300242ejc.115.2023.01.04.10.35.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 10:35:42 -0800 (PST)
Message-ID: <77888431-5d4c-d65a-8835-a19a833a243d@linaro.org>
Date: Wed, 4 Jan 2023 19:35:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: ARM: ptw.c:S1_ptw_translate
Content-Language: en-US
To: Sid Manning <sidneym@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Mark Burton <mburton@qti.qualcomm.com>, qemu-arm <qemu-arm@nongnu.org>
References: <BYAPR02MB550905E891B95879D05846B9BEF59@BYAPR02MB5509.namprd02.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <BYAPR02MB550905E891B95879D05846B9BEF59@BYAPR02MB5509.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Cc'ing Richard & qemu-arm list.

On 4/1/23 17:55, Sid Manning wrote:
> ptw.c:S1_ptw_translate
> 
> After migrating to v7.2.0, an issue was found where we were not getting 
> the correct virtual address from a load insn.  Reading the address used 
> in the load insn from the debugger resulted in the execution of the insn 
> getting the correct value but simply stepping over the insn did not.
> 
> This is the instruction:
> 
> ldr           x0, [x1, #24]
> 
> The debug path varies based on the regime and if regime is NOT stage two 
> out_phys is set to addr if the regime is stage 2 then out_phys is set to 
> s2.f.phys_addr.  In the non-debug path out_phys is always set to 
> full->phys_addr.
> 
> I got around this by only using full->phys_addr if regime_is_stage2 was 
> true:
> 
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> 
> index 3745ac9723..87bc6754a6 100644
> 
> --- a/target/arm/ptw.c
> 
> +++ b/target/arm/ptw.c
> 
> @@ -266,7 +266,12 @@ static bool S1_ptw_translate(CPUARMState *env, 
> S1Translate *ptw,
> 
>           if (unlikely(flags & TLB_INVALID_MASK)) {
> 
>               goto fail;
> 
>           }
> 
> -        ptw->out_phys = full->phys_addr;
> 
> +
> 
> +        if (regime_is_stage2(s2_mmu_idx)) {
> 
> +            ptw->out_phys = full->phys_addr;
> 
> +        } else {
> 
> +            ptw->out_phys = addr;
> 
> +        }
> 
>           ptw->out_rw = full->prot & PAGE_WRITE;
> 
>           pte_attrs = full->pte_attrs;
> 
>           pte_secure = full->attrs.secure;
> 
> This change got me the answer I wanted but I’m not familiar enough with 
> the code to know if this is correct or not.
> 


