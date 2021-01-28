Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D02307745
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 14:41:28 +0100 (CET)
Received: from localhost ([::1]:57156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l57Y7-0006K7-Fy
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 08:41:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l57Vw-0005SF-1l; Thu, 28 Jan 2021 08:39:12 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:34251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l57Vu-0003Wx-Hw; Thu, 28 Jan 2021 08:39:11 -0500
Received: by mail-ed1-x536.google.com with SMTP id d22so6651852edy.1;
 Thu, 28 Jan 2021 05:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GalHh1nXX/ke6QiaqUZyT8gQDYgzmnIJasDVOmD5Myw=;
 b=CBN3fsIWN0plqp10muuts+B0I9D5H24ZmGpHrlVAifI6ORGEoOEqhYFoxB9Bf5sbZN
 PfqRdH19hTU9J8rl/O9ZS6yx4D+J7Ku/6qheE2Ogq8wVFedioWIBYZMN6AZvd9L52+Lh
 PhRu+em4rKYvpS/e8q6KJjxGgv+FLBtr6r1IPBQyrF14eQx3e5LguenU0XrC6cKjVttV
 xkG8DnF4gBzqPEJCTYexG1d8FVt9Mwca9+9t4dPrak/FeniitEcO+UDkfiFGwDm44kNM
 Eunmf9i77aHW6ihjzw39L3X01Ra0PZzbTe3bE10YEaYNYMie67WLf4AiEPaPc7yg50nq
 Z3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GalHh1nXX/ke6QiaqUZyT8gQDYgzmnIJasDVOmD5Myw=;
 b=nubDYVwVnvlFBGXMdpwsW4/cwmVo2SvEbAIt+M8qQ8rR4MWjmfv5+Qs7Kqb6vHXbvk
 J8cHUvuCO+kizD+ukZ5Cl+N5XtLtL1t1mCOHCmb2QJ2YXbNIRRz4r1FrUnWlWmhF5k5F
 bOPvaLhxLCKzpklUNxxO2pmqXZ8eYHo/t7ll8hWpnbUDwF0oZXPMrEjGTEL5Vie8ZRzX
 lEAkPLEmk3zXtaOoCxmkyvh3GAAo/SGbI2/ilI5RkPxTlPUoFFHZMBbJVraJRzj70nwg
 rKCImXxzGD+s7R3yA3Chd46qyAz0VFM0QjsRSPu1p3GkZaPy84UQVWvr+VHXeLRLgwuz
 xrLw==
X-Gm-Message-State: AOAM531uvPhcDFRidzUcpbrNXZllrrn7ZxZ8lRfG6mi2ZILBTOIkmWZt
 L7VTbMQKec4rWYlIO/iPcKc=
X-Google-Smtp-Source: ABdhPJz1WmlVkzQcctkaPcPqjqo4NepMuckJvWOnDmjmQZzK/dzM8yU3ilS3CmEJJRalSnRqMbPtWg==
X-Received: by 2002:a50:998f:: with SMTP id m15mr14286953edb.342.1611841148872; 
 Thu, 28 Jan 2021 05:39:08 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id u9sm3044084edv.32.2021.01.28.05.39.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 05:39:08 -0800 (PST)
Subject: Re: [PATCH v2 00/25] Convert CMSDK timer, watchdog, dualtimer to
 Clock framework
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210128114145.20536-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1394f5e0-d80a-a61f-9e59-325de416402b@amsat.org>
Date: Thu, 28 Jan 2021 14:39:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210128114145.20536-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Luc Michel <luc@lmichel.fr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/21 12:41 PM, Peter Maydell wrote:
> This patchset converts the CMSDK timer, watchdog and dualtimer devices
> to use the Clock framework instead of an integer property specifying
> a frequency in Hz. The series is quito a lot of patches but they
> should be mostly small and I hope easy to review.
> 
> The motivation here is the upcoming Arm SSE-300 model: this has a
> new kind of timer device, which I wanted to write in the modern style
> with a Clock input. That meant the ARMSSE container object needed
> to know about Clocks, so converting the existing devices it used
> to Clocks seemed like a good first step.
> 
> The series as a whole is a migration compat break for the machines
> involved: mps2-an385, mps2-an386, mps2-an500, mps2-an511, mps2-an505,
> mps2-an521, musca-a, musca-b1, lm3s811evb, lm3s6965evb.
> 
> v1->v2 changes (all very minor so I have left r-by tags in place):
>  * in test cases, remove set-but-never-used QTestState* variables; gcc
>    warns about these (I did my development with clang, which does not...)
>    (patches 3, 4, 5)
>  * in test cases, consistently phrase clock_step() arguments as calculations
>    based on tick counts and the ns-per-tick value rather than just the final
>    numbers (eg '500 * 40 + 1' instead of '20001') (patches 3, 5)
>  * correct the forward-step amount when looking for periodic timer reload
>    of the dualtimer (patch 5)
>  * actually wire up the ARMSSE MAINCLK callback function (patch 22)
> 
> The only patch still unreviewed is 5 ("tests: Add a simple test of the
> CMSDK APB dual timer").
> 
> thanks
> -- PMM
> 
> Peter Maydell (25):
>   ptimer: Add new ptimer_set_period_from_clock() function
>   clock: Add new clock_has_source() function
>   tests: Add a simple test of the CMSDK APB timer
>   tests: Add a simple test of the CMSDK APB watchdog
>   tests: Add a simple test of the CMSDK APB dual timer
>   hw/timer/cmsdk-apb-timer: Rename CMSDKAPBTIMER struct to CMSDKAPBTimer
>   hw/timer/cmsdk-apb-timer: Add Clock input
>   hw/timer/cmsdk-apb-dualtimer: Add Clock input
>   hw/watchdog/cmsdk-apb-watchdog: Add Clock input
>   hw/arm/armsse: Rename "MAINCLK" property to "MAINCLK_FRQ"
>   hw/arm/armsse: Wire up clocks
>   hw/arm/mps2: Inline CMSDK_APB_TIMER creation
>   hw/arm/mps2: Create and connect SYSCLK Clock
>   hw/arm/mps2-tz: Create and connect ARMSSE Clocks
>   hw/arm/musca: Create and connect ARMSSE Clocks
>   hw/arm/stellaris: Convert SSYS to QOM device
>   hw/arm/stellaris: Create Clock input for watchdog
>   hw/timer/cmsdk-apb-timer: Convert to use Clock input
>   hw/timer/cmsdk-apb-dualtimer: Convert to use Clock input
>   hw/watchdog/cmsdk-apb-watchdog: Convert to use Clock input
>   tests/qtest/cmsdk-apb-watchdog-test: Test clock changes
>   hw/arm/armsse: Use Clock to set system_clock_scale
>   arm: Don't set freq properties on CMSDK timer, dualtimer, watchdog,
>     ARMSSE
>   arm: Remove frq properties on CMSDK timer, dualtimer, watchdog, ARMSSE
>   hw/arm/stellaris: Remove board-creation reset of STELLARIS_SYS

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

