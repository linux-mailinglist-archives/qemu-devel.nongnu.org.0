Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 905DC47E0BD
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 10:13:34 +0100 (CET)
Received: from localhost ([::1]:35610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0KAH-0007xh-J2
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 04:13:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n0K2f-0007t7-HS; Thu, 23 Dec 2021 04:05:44 -0500
Received: from [2a00:1450:4864:20::432] (port=47023
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n0K2d-00068L-W3; Thu, 23 Dec 2021 04:05:41 -0500
Received: by mail-wr1-x432.google.com with SMTP id i22so10045104wrb.13;
 Thu, 23 Dec 2021 01:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=F0v2j8wDvTCZLEzLQyqs4QCz7oMsp+bWgd3Uz6iqkaQ=;
 b=ZAJ3jFxKTWCmKcq15ITJ0X+RZpV5p7TYNja4uiaIVuhxiZfldcxI1WWnGUSf2WlKEq
 FCAUZKsovAsagy7PEdLqAc8g38Xfvw9+FR52IpDBeTyfLQMNOlaEn941mRVZ+JanLXO/
 ivlg+0P+k+UmBOg7L5SXeRod67MmGjHu3qXo/KLP0QAOIM9bGRFm5OW+ETE9+97BHG8n
 kPM27NUh9oSvMJcF58sM2XeHSTI8cAE9Wtn1R8PQJdGN+3536NOlzWdjZjC4AKvlm2FO
 +mVZ7p05Gqf7vKLOoTlRCFgpP3t2cHhcf+q0i9hKer1DvMeG8EO3p9dS2zt50rsQBsPK
 S6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=F0v2j8wDvTCZLEzLQyqs4QCz7oMsp+bWgd3Uz6iqkaQ=;
 b=CCDGiQ57HOxxEssMj3FZ/ATZcGD1Qs7YgYPWzIaT1DMXJb3Sv+yZ1zBZERZyM0LAJ5
 R/q62sM8a1DPzftINWVbH834ntxdLSFpS7txPwpQ8OjPN1EQ6G/4Tf7n3kAywcw43IhI
 pYtR4VS+oOpx6i0forfmxuy5aB5MrGYoJWmXy21MgyGufPD2D8K4vLbUIScX71PdAs2M
 JK+hHRSeRoYWitMdrpBtKyPhNOq4Be9VG+If7GDIKr0xLQVYMylxMrLnS1xYu3nFS68H
 YR/Ss3vKIMWHFQNYEXIWr6d+X6Z2QCP6nwN0TsVEk2XCwsC7VuF5XHCdo2NJkE4Jr+DI
 dLzw==
X-Gm-Message-State: AOAM530bNxobu53Qdp7KeZhWrjKsiPqYSq5PyTXQ4BIHEJaRYbngoLKJ
 5XvRi+XworJy9cg2kAyoLu2E/vfywp4=
X-Google-Smtp-Source: ABdhPJwRQczkFGMH50mkEK7wIRt0S15mjyoJX29vHtUEe2zc6GrlfTdDgxZ0Y3IToMp3ZcV8eToTDA==
X-Received: by 2002:a05:6000:2aa:: with SMTP id
 l10mr1071616wry.518.1640250337840; 
 Thu, 23 Dec 2021 01:05:37 -0800 (PST)
Received: from [192.168.43.238] (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id c11sm8703912wmq.48.2021.12.23.01.05.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 01:05:37 -0800 (PST)
Message-ID: <5a44d69a-3db9-6629-50b3-dbf48ab4f8d5@amsat.org>
Date: Thu, 23 Dec 2021 08:01:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 0/5] hw/qdev: Clarify qdev_connect_gpio_out()
 documentation
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20211218130437.1516929-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211218130437.1516929-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.264,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Yanan Wang <wangyanan55@huawei.com>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter.

Since you reviewed v1, and Ack-by on v2 would be welcomed.
Otherwise, if you don't object, I plan to queue this via
machine-next tree.

Thanks,

Phil.

On 12/18/21 14:04, Philippe Mathieu-Daudé wrote:
> Trivial patches clarifying qdev_connect_gpio_out() use,
> basically that the qemu_irq argument is an input.
> 
> Since v1:
> - Addressed Yanan Wang and Peter Maydell comments:
> - Correct qdev_init_gpio_out_named() doc
> - Drop i8042_setup_a20_line() wrapper
> 
> Philippe Mathieu-Daudé (5):
>   hw/qdev: Cosmetic around documentation
>   hw/qdev: Correct qdev_init_gpio_out_named() documentation
>   hw/qdev: Correct qdev_connect_gpio_out_named() documentation
>   hw/qdev: Rename qdev_connect_gpio_out*() 'input_pin' parameter
>   hw/input/pckbd: Open-code i8042_setup_a20_line() wrapper
> 
>  include/hw/input/i8042.h |  1 -
>  include/hw/qdev-core.h   | 24 ++++++++++++++++++------
>  hw/core/gpio.c           | 13 +++++++------
>  hw/i386/pc.c             |  3 ++-
>  hw/input/pckbd.c         |  5 -----
>  5 files changed, 27 insertions(+), 19 deletions(-)
> 

