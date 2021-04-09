Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9B035A2ED
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 18:20:59 +0200 (CEST)
Received: from localhost ([::1]:36592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUtsQ-0004f2-AR
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 12:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUtlV-0004ZO-MU
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:13:49 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:50948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUtlS-0002Bj-IQ
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:13:49 -0400
Received: by mail-pj1-x1036.google.com with SMTP id bg21so3151187pjb.0
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 09:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fIlJXCGSGZsMNvjQCoen+H+UQLQVBVsoEv/7gizkyZw=;
 b=igPogZ/XoEqmnEbItqD+/L4o0RoMaSx1u49fB73wPe/VR61Y0A0vRYdwHEnKT8XkqS
 OtF6XxVGSx7j7AeRyjFQ7oNv9m2gzVbVS7VO3lAKBTWo4XczJPHgyVTUNgmqM+aP6lNE
 vP/73pqn2OkQ+xxxUKosJMLmuA7V3M06FKRxLfVhQx3h9hG4YgqxHMuz9UNvQsOTI8hD
 lKpu9zGbvdF8meORnYvFLFtY16JwwJu7/gcWtK54IkLdxnN57FPwu9gbkMYxW+dwYErn
 ukMokOJhQj+4WFtAWpp7i4wM6+Keu8UGGqiSpsA3Ix7F5uPSkmL8190FSXkM0Lz25MMO
 +qtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fIlJXCGSGZsMNvjQCoen+H+UQLQVBVsoEv/7gizkyZw=;
 b=LPkG8iFUy3sDL64anSLTZbq0kTE+6D3I48y4FKVmv8IcHDM7xics/cKUKp94eU8odX
 Eq4kc3/cZGMsDQRIfsmwVCDNVeDjn9enKHQqcL81INUXaM0war7h+sBl8r/ROGTK0B9J
 d9PrxZT/GTod67LkPnU69UNR+1Lper3eaoMK/y7qkLMuNQWHDcKQt1hLi7E5LNXYkUo7
 rZ8s7qUgD+siSatEoJrJCxbu0bnjoBU4X2ob9JvoOEPfoLIFdw00IarPho8K8dthFGEd
 oZ0+5YFqZaKi/pmvnXQwRDhf4r6I2Qw9Osq+omUwb3appT/+PAm4BN2fervqD1N6ranq
 +Sqg==
X-Gm-Message-State: AOAM5339SlYjvW56Q5SFi/aWYZCcd8aHbhK+v6/57bIWgjboYlcrtWei
 Dur/p1jmUmh916DIJoD2t1ISgQ==
X-Google-Smtp-Source: ABdhPJxaQu4HYGu7tF5lTk6aYN/bktEU8480pzupuu03WnuWasq6nv2g4ui6TSq1eaiEtBsPTCWs2A==
X-Received: by 2002:a17:90a:9404:: with SMTP id
 r4mr14314658pjo.64.1617984824930; 
 Fri, 09 Apr 2021 09:13:44 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id h29sm3106581pgb.3.2021.04.09.09.13.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 09:13:44 -0700 (PDT)
Subject: Re: [RFC PATCH-for-6.1 v2 1/6] target/mips/cpu: Use
 clock_has_source() instead of clock_get()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210409093623.2402750-1-f4bug@amsat.org>
 <20210409093623.2402750-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2b1dce27-bfc6-b8bf-07a5-a4596a00d97b@linaro.org>
Date: Fri, 9 Apr 2021 09:13:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210409093623.2402750-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Luc Michel <luc@lmichel.fr>,
 Huacai Chen <chenhuacai@kernel.org>, Hao Wu <wuhaotsh@google.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/9/21 2:36 AM, Philippe Mathieu-Daudé wrote:
> clock_get() returns the clock period. With an unconnected clock
> we get 0. This is not what we want here. Use the API properly
> by using the clock_has_source() function instead.
> 
> Fixes: a0713e85bfa ("target/mips/cpu: Allow the CPU to use dynamic frequencies")
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/cpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

