Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F27632E703
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 12:09:39 +0100 (CET)
Received: from localhost ([::1]:52228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI8Kv-00017R-Vr
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 06:09:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lI8K1-0000as-Pc; Fri, 05 Mar 2021 06:08:41 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:39408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lI8K0-0006kV-0n; Fri, 05 Mar 2021 06:08:41 -0500
Received: by mail-wm1-x32b.google.com with SMTP id u125so1086301wmg.4;
 Fri, 05 Mar 2021 03:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2MbWFLBgpLKgAR6SebVx/MnuuGEbOi8QdGuVkj+JHMY=;
 b=Bbnwj3EctN2d3VSdZpFlCphkyLzdp355ip8JgbDx0lAg1iK1SuPNlb2MlkSZDwZPv+
 yR7Uow43faVxSHh87jlKDy3w+td+oSxVjB0W/FLQ0cKc9fi96qvNgJHPl3FaPyGQ+C//
 qu6hJc7thFVhGzViM1OvY62ww9xzVxmyJB7yiudX0KRWwsm5lPTeT502o38UWchxaf/e
 cGawNNGqUzJ6l32gDZxK69X29G9dn69TOkDgbdBLY8S44R+YoKIAU7pItzhj/zPBhETu
 CBLpISaF5zeRrszW9vXoFWq8qLVyK82B+HnVtaIwqleWLRNaow7eFc0q8kC+63BgBUHI
 hCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2MbWFLBgpLKgAR6SebVx/MnuuGEbOi8QdGuVkj+JHMY=;
 b=qX4n1UYOeR3pupIJZZHc1KYJXr3VSlKTbsVPttaMgMupP1Uz/wMS7YgVgER4hNj5I5
 Irm9WyWxiZd5XWoTONf0A5um97gEXDUDM0kBYkmwGVZrYyA2SihtgBX1xnyfezR+fd/E
 6ht3AdDYUG6URzcKHtOm2U4wfEwphlflUoYZG8XC5LcE1mrl6QP5nyH0QpZarVpwS9iy
 fXUURL2geNKBFg8v/aJZQFAVv9hIZsGUpU7IMzahu7FITvAtP5s/GJPAu0jhea0Vuj+1
 Gnd5MsxiSgP8/GyallMFHVs0oOb1rfMc675niNSbgD2v7UfEqtvmWyAKay/7jkAITHvO
 NWyA==
X-Gm-Message-State: AOAM530Ki6Ma+ipqVdz3ILv/9P1WKzGzF/CrNBQ/DvuvWnOlLc+iFz30
 UmyGHCT0bDC9OljPT2C7J0X/QkYinxU=
X-Google-Smtp-Source: ABdhPJw56wiOmB9/M73IxmL0U7J91nfyKCN2f4ut0rTCJU6OQl4KdbQ9BoZNBwESVbg8me4YSeFGJQ==
X-Received: by 2002:a1c:7901:: with SMTP id l1mr8443592wme.114.1614942517728; 
 Fri, 05 Mar 2021 03:08:37 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f7sm1781486wmq.11.2021.03.05.03.08.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 03:08:37 -0800 (PST)
Subject: Re: [PATCH 44/44] tests/qtest/sse-timer-test: Add simple tests of the
 SSE timer and counter
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-45-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <18124a60-f27c-9f21-032f-42a753673532@amsat.org>
Date: Fri, 5 Mar 2021 12:08:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-45-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 2/19/21 3:46 PM, Peter Maydell wrote:
> Add a simple qtest to exercise the new system counter and
> system timer device in the SSE-300.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  tests/qtest/sse-timer-test.c | 240 +++++++++++++++++++++++++++++++++++
>  MAINTAINERS                  |   1 +
>  tests/qtest/meson.build      |   1 +
>  3 files changed, 242 insertions(+)
>  create mode 100644 tests/qtest/sse-timer-test.c

> +static void reset_counter_and_timer(void)
> +{
> +    /*
> +     * Reset the system counter and the timer between tests. This
> +     * isn't a full reset, but it's sufficient for what the tests check.
> +     */
> +    writel(COUNTER_BASE + CNTCR, 0);
> +    writel(TIMER_BASE + CNTP_CTL, 0);
> +    writel(TIMER_BASE + CNTP_AIVAL_CTL, 0);
> +    writel(COUNTER_BASE + CNTCV_LO, 0);
> +    writel(COUNTER_BASE + CNTCV_HI, 0);
> +}
> +
> +static void test_timer(void)
> +{
> +    /* Basic timer functionality test */

Minor comment, I'd move the timer mode test *after* the counter mode
ones, which are easier to review. Eventually consider adding this
single timer test as a separate patch to ease review, as it is quite
complex.

Having this patch preferably split (no need to repost):
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Regards,

Phil.

