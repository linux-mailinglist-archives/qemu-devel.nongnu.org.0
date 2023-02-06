Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4349268C62F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 19:55:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP6bo-0004yc-3J; Mon, 06 Feb 2023 13:52:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pP6bl-0004xh-Rg
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:52:53 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pP6bj-0005Tr-K2
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:52:53 -0500
Received: by mail-pl1-x629.google.com with SMTP id m13so13140159plx.13
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 10:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q478AxlTUaHNPjJfTzgp+5LnAX8emdR6WXcGf+alPSQ=;
 b=vyEm3niVCPZ68K4soHeVmTUTbeTlBIJbE1B05ntE3cQKk5AbSesszC0cH1zI96R/TC
 JFJV860rraKcV6OF9+4yY5U64KT4NwPM+0ooTyNS4BNS2X2bZnIkJxQDhk6cPXDajlX+
 K9WbGKQYBWLLD1I3j+mcilRGLVPpS0u6fjRbiE4zL3HXLM8KTOft1H3E3D+4id2iRXzO
 /LJBmriZlayJ8o8PeSW07IJwoT8B3S4sKQmADYbwJTVHjze1aU6u89dPcrurPwW14d+h
 oTPoDSUQmdDGEDPSp7owUwneDiPK9woesCLFfbIljnB/g5dqmQ8bRxL2WSTgvBXXlxiN
 +A0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q478AxlTUaHNPjJfTzgp+5LnAX8emdR6WXcGf+alPSQ=;
 b=bK2fBFuFlhIV4dtTXMY/CXg6v9XVZuXK6d7S07k2z0mfzHTYseHogkq/BUFtcvsd3C
 zYfdya6RkSJhv/o73DhqqS2xn2FX/D2+lQA0Li0V3CwrIdRKJGv6YOcdAZRGGrNlLZaB
 oravUusGPcqxDRL6kGhB4HGgMl7N6+6IZ81iHc8JL8DDT3Prpgp9vqi4ESHxjxy+dykk
 D1qA+9k5vZS4+FnwA1425K/3MyFskoI0DRmHMFBxHu/liSIo37cOiTEYwttMZ+BihLaB
 IdH98CEfJbjrMToZeQ+ezobjPhptafzs0MuF+j06OTOYK2b35rokEo5xolQpOUE0rTd7
 1PvA==
X-Gm-Message-State: AO0yUKUXlQu2WPgPpNCG/bMe+PvOzPuZeLfW8wfDC963BS49X8VsHEcH
 S05KrEF55eka9Vx/ZgbSysZ8Hg==
X-Google-Smtp-Source: AK7set/beFc3VE3TD70ClEZtbNkAGOL0ZK+bhuXmKAX0waQiiGUWbq9l8KybR0MAexjal+XNC8YBLw==
X-Received: by 2002:a17:902:e3c1:b0:199:18ac:cd33 with SMTP id
 r1-20020a170902e3c100b0019918accd33mr3640879ple.33.1675709570109; 
 Mon, 06 Feb 2023 10:52:50 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 v3-20020a170902e8c300b0019602274208sm6653087plg.186.2023.02.06.10.52.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 10:52:49 -0800 (PST)
Message-ID: <bc6354f6-6e25-fc68-5982-054299b0c3c1@linaro.org>
Date: Mon, 6 Feb 2023 08:52:46 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 4/9] target/arm: Restrict CPUARMState::arm_boot_info to
 sysemu
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230206121714.85084-1-philmd@linaro.org>
 <20230206121714.85084-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230206121714.85084-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 2/6/23 02:17, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/cpu.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index bbbcf2e153..01d478e9ce 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -770,9 +770,10 @@ typedef struct CPUArchState {
>   #if defined(CONFIG_USER_ONLY)
>       /* For usermode syscall translation.  */
>       int eabi;
> +#else
> +    const struct arm_boot_info *boot_info;
>   #endif
>       void *nvic;
> -    const struct arm_boot_info *boot_info;
>       /* Store GICv3CPUState to access from this struct */
>       void *gicv3state;
>   

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

