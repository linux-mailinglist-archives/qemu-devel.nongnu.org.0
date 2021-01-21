Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 850CA2FF7BE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 23:10:44 +0100 (CET)
Received: from localhost ([::1]:52130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2iA7-0005xN-HO
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 17:10:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2i4S-0002QJ-9l; Thu, 21 Jan 2021 17:04:53 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:42477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2i4Q-0006wL-LQ; Thu, 21 Jan 2021 17:04:51 -0500
Received: by mail-ed1-x52f.google.com with SMTP id g24so4303785edw.9;
 Thu, 21 Jan 2021 14:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vuwzp+KofayMUt7tPD5F1m553xJPWL58EvfiWDj4T4A=;
 b=WMCJM4u4SiuKzCnholzsfKQlKdfXlekg0WZrNt2aT1qSU6tg/162fx7HOw2wB9sNSx
 7bqw0nkH38itiJhKqvctXAf9A74Dk3l7n944Ud1fenvfObHjmPMkJE2vNa8MjVaCvT5Q
 5SR/LAqVW9qNOG94FEoNwT9ReqSY3lMkbzLqyNqcJNMBzBWlsWkxOd7L6gyl1oTV9eIk
 V8IRZATg8yEOYYlDsp9C3mqaHUVI/QMqBTcF0fHmAHtOQRQCtG5LfOv6/MmJncUHiOzJ
 Lcxxa7Q59f/IFH9ad+9iDOo0roE9BV01SfCLRjDm182vs0zARhixAu4T6Bf4nCdrGEWz
 gebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vuwzp+KofayMUt7tPD5F1m553xJPWL58EvfiWDj4T4A=;
 b=ab3ubxrM2IlXeLavvPYJ8LhbWIWyhgJTOlIFiqGtXSityV1kwRUZR1gsLC3zwNPS8L
 NjxHRkOKTxnSJ5WJFbnKW58/xZmr3wBuprY1UrsQzgyLeOpq2zjON6ZZhTLVbpoFAJia
 Iuj2NhGfXKVcA1Jolt+c6kyF1Bbt63luOlhZfRlTVG5JU/I+ouGfva6xccdRmd26xIzJ
 h2pnP0c4Y+Ede8RXsoTaTMN/O5s4vKf1mqBrSccVHtus5/w5eL4ol13nH/8JBXMRcDwb
 RAUJbtJ0j2j7BIxvhzXIrxRPCHzsCtqmvFhMZ0x4952w//+VpPk4CH2AHBdSVIi4GL3F
 WiYQ==
X-Gm-Message-State: AOAM532OzwDTfyck1oOwkoeamXdzQ+QDrArETFNGXtfQjnwSqJP8lJW8
 VFGhy/QVf6+PiWAOEWiYT0k=
X-Google-Smtp-Source: ABdhPJy2xe7iRON3CvtHBFB48QglpaGgMjfAUH6aq7uc7jqZXWiwh/pTlfcDiMSLBwGTD+wjvwEZQQ==
X-Received: by 2002:aa7:d352:: with SMTP id m18mr972891edr.190.1611266688845; 
 Thu, 21 Jan 2021 14:04:48 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id z1sm3593401edm.89.2021.01.21.14.04.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 14:04:48 -0800 (PST)
Subject: Re: [PATCH 21/25] tests/qtest/cmsdk-apb-watchdog-test: Test clock
 changes
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-22-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <25e41627-e6a0-1754-6f75-0819219dc2e5@amsat.org>
Date: Thu, 21 Jan 2021 23:04:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121190622.22000-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52f.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 8:06 PM, Peter Maydell wrote:
> Now that the CMSDK APB watchdog uses its Clock input, it will
> correctly respond when the system clock frequency is changed using
> the RCC register on in the Stellaris board system registers.  Test
> that when the RCC register is written it causes the watchdog timer to
> change speed.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  tests/qtest/cmsdk-apb-watchdog-test.c | 52 +++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
...

> +static void test_clock_change(void)
> +{
> +    uint32_t rcc;
> +
> +    /*
> +     * Test that writing to the stellaris board's RCC register to
> +     * change the system clock frequency causes the watchdog
> +     * to change the speed it counts at.
> +     */
> +    g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 0);
> +
> +    writel(WDOG_BASE + WDOGCONTROL, 1);
> +    writel(WDOG_BASE + WDOGLOAD, 1000);
> +
> +    /* Step to just past the 500th tick */
> +    clock_step(80 * 500 + 1);

I was wondering about asking you to change that 40000 in patch #3.
Since you use that clearer form here, it would be nice to have it
in #3 too.

Otherwise,
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

