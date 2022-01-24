Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BC1497ABA
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 09:51:55 +0100 (CET)
Received: from localhost ([::1]:33970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBv4s-0007rM-RT
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 03:51:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBuei-0000Ir-3P
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 03:24:54 -0500
Received: from [2607:f8b0:4864:20::536] (port=37675
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBueg-0005j8-Kg
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 03:24:51 -0500
Received: by mail-pg1-x536.google.com with SMTP id e16so5387834pgn.4
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 00:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FrqiAYvVb60I0lurg+7juXBsIWokkKE9C1yvMv98Qr0=;
 b=j9CiAHL3p7axi5UiRA8dk1dXiAqOBk735AgdzZAih4xqMXODz+5NiAHjbUbb8T7Omv
 KbYUhcvIz3GI8HKCExlhXs0P7LHhJ5o8NtAASty7aUUpaW2E6TSzCQQFrXLq69PagkFC
 VFHJPXB8IBrF88c8lXFeQW8rDKmlBXl/qU5p56gsB+EVKAnMHkFKjufnDyUGcVTu+4xc
 1lycmnlaqQ0Bbw+nikkNWKGkGb7EyhM+Wy+mpYa4iM+EcV4aPFyV77jAaECyjcf+c3z8
 XZoEGBDhpl0hVezoeOHC7cwzRyIEZMAGK28EerH4Cp1DZtVo7xG0LU3eE6ni0Wh3T8Iy
 3FmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FrqiAYvVb60I0lurg+7juXBsIWokkKE9C1yvMv98Qr0=;
 b=UFirxqZWi77uY6cr3UYinfyJiAOYjpW2cIMO38Vb5q1lcm7YW735qF2nQujuBUj6vy
 vJPaGTcP3XoY7gLMUOZZCDljuE/sFEowDyKE/0ija6+v36CYbAsJo0+c1uAEE0HRQlW9
 x1Dt9lWNJf0SbgdlVZGQOHV1k7jkTwy3eshxlgaW8jq8FTE0WgNccfm0MCf4rAeO5f03
 24kNyroSuLVIw+E/OgSkMVIt3xHuYMxjaDl2A9QshS98dU4FxoWAeHLSVWuVjrGkmO9Q
 8uKcxN8GBe3UxPyYmeeclPG1cVzGf+Y5itjcjPPTAKVqhcrR0xpxsKKlnxLs5fNDqwiZ
 f5bA==
X-Gm-Message-State: AOAM533p+ETcM9i/TgZYdc6ERIao6lKjuf507SKe8ZAObOk4TNKeswwR
 5T+PVKPQt50e2rDUg3sBfRbdLQ==
X-Google-Smtp-Source: ABdhPJw5zxzWv1zYSQV8rQ6M20IqWhnaMnIZpmigUs+9uyziLRuUWYJYRtdsNU1CSn/hCwpHRyu+6Q==
X-Received: by 2002:a05:6a00:987:b0:4c7:ac09:5430 with SMTP id
 u7-20020a056a00098700b004c7ac095430mr10068393pfg.67.1643012689019; 
 Mon, 24 Jan 2022 00:24:49 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id h10sm15330858pfc.103.2022.01.24.00.24.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 00:24:48 -0800 (PST)
Subject: Re: [PATCH] target/rx: Remove unused ENV_OFFSET definition
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220122002304.84016-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f33b39a6-1ed9-273e-a1eb-023729893ef2@linaro.org>
Date: Mon, 24 Jan 2022 19:24:43 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220122002304.84016-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/22/22 11:23 AM, Philippe Mathieu-Daudé via wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/rx/cpu.h | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/target/rx/cpu.h b/target/rx/cpu.h
> index 657db84ef0..58adf9edf6 100644
> --- a/target/rx/cpu.h
> +++ b/target/rx/cpu.h
> @@ -116,8 +116,6 @@ struct RXCPU {
>   
>   typedef RXCPU ArchCPU;
>   
> -#define ENV_OFFSET offsetof(RXCPU, env)
> -
>   #define RX_CPU_TYPE_SUFFIX "-" TYPE_RX_CPU
>   #define RX_CPU_TYPE_NAME(model) model RX_CPU_TYPE_SUFFIX
>   #define CPU_RESOLVING_TYPE TYPE_RX_CPU
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

For the viewers at home, the last use of ENV_OFFSET was removed in 
5e1401969b25f676fee6b1c564441759cf967a43; the commit of target/rx came in just afterward.


r~

