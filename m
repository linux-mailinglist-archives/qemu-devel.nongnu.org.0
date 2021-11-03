Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1B1444136
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 13:22:19 +0100 (CET)
Received: from localhost ([::1]:33088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miFHW-0005iV-DJ
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 08:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miFD8-0003iU-Tu
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 08:17:46 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:42497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miFD6-0003n0-K2
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 08:17:46 -0400
Received: by mail-qt1-x831.google.com with SMTP id v22so552217qtk.9
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 05:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+yrqNVJ5qlMI51kiPlnQ3ifkFKHZ1fWTKJUYeoJdPbc=;
 b=BwpIGiHXGZtcJ9CwCOpC2YxFWm1Wx0Q77XM8UcUEe3xeMobCmOW193PEZzvl2yTx1X
 dRFaqzl+oyrU2UiyQ1hVDOIlKIc2VMqdRMV7XtdKy+CNPotwfLaxK97pzwo3H4fE0bVp
 lg0rm2HLefN/SDHLWNXiFeDttKt1MH4DP5eq58w5MOWZv6f+n6ZQmxRZisyMAaOSws98
 ZKJnp30vXRNOq96RmjcJA1DTfYIBIwgFRY4YLKg/jAOJ8nKzfBzNiJmpYzPlve8qfTjx
 bANvS/qaekGkpzo9n9+2SpnxM8mMaJvk9ofIbPIawWbCYThrA1LFXwa509fb9QMSd4XX
 INjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+yrqNVJ5qlMI51kiPlnQ3ifkFKHZ1fWTKJUYeoJdPbc=;
 b=Wfc+XH/Bj9cKs34S5OViz8kUtlwLwt/X/xGhgb3q/Kj3RxGvqOUevaKLWWJwYWPKMQ
 zjTciZqlnGmNLKdO8e11SwrHDZbiN4zbfScZJ7Q1Y7A5JtwvZjGkRT9PmLthBjUuUDdg
 Q0Q74RT9BA6U7kRIuOBjEGCtrP2QkXl3ANaXgBMvnpUkMgLjFrR6jGTZFnZmOj3ON9sr
 9wjotooMZIUBDOFIRd+J8boKHteLz7iK21vhrJfeKyTTX9n0SROKh8/mJMM7v14QJasU
 DINT9qqJoMh3YIX9UrGqRJQ9TYHTihLqqdLidhuwlP6Ge1tPLKwpmhhjcaQSDEETda+u
 3G1g==
X-Gm-Message-State: AOAM533QA7PVi8loY47U5jLN+98jMWWj+P3IPhc7U0ue516q4gSfzUhM
 VWuTQntk/H84R7IQ7gcDE+w8qQ==
X-Google-Smtp-Source: ABdhPJyXv/6BEcU5CokbekqwtpeAKQBnD2pnqTa1yzgcPbKahCXjgs/PMlmZau4qdKOY1FH1gxwJNQ==
X-Received: by 2002:ac8:5853:: with SMTP id h19mr35406638qth.273.1635941862656; 
 Wed, 03 Nov 2021 05:17:42 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id w5sm1414104qko.54.2021.11.03.05.17.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 05:17:42 -0700 (PDT)
Subject: Re: [PATCH] hw/m68k: Fix typo in SPDX tag
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211103105311.3399293-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ae3378eb-4117-f5b2-d781-49886d69ba44@linaro.org>
Date: Wed, 3 Nov 2021 08:17:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211103105311.3399293-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x831.google.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.528,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/3/21 6:53 AM, Philippe Mathieu-Daudé wrote:
> Fix 'Identifer' -> 'Identifier' typo.
> 
> Cc: Laurent Vivier<laurent@vivier.eu>
> Fixes: 8c6df16ff60 ("hw/char: add goldfish-tty")
> Fixes: 87855593903 ("hw/intc: add goldfish-pic")
> Fixes: 2fde99ee312 ("m68k: add an interrupt controller")
> Fixes: 0791bc02b8f ("m68k: add a system controller")
> Fixes: e1cecdca559 ("m68k: add Virtual M68k Machine")
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/hw/char/goldfish_tty.h | 2 +-
>   include/hw/intc/goldfish_pic.h | 2 +-
>   include/hw/intc/m68k_irqc.h    | 2 +-
>   include/hw/misc/virt_ctrl.h    | 2 +-
>   hw/char/goldfish_tty.c         | 2 +-
>   hw/intc/goldfish_pic.c         | 2 +-
>   hw/intc/m68k_irqc.c            | 2 +-
>   hw/m68k/virt.c                 | 2 +-
>   hw/misc/virt_ctrl.c            | 2 +-
>   9 files changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

