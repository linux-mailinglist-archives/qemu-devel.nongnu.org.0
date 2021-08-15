Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF023ECA3A
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Aug 2021 18:33:46 +0200 (CEST)
Received: from localhost ([::1]:47116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFJ4z-000229-De
	for lists+qemu-devel@lfdr.de; Sun, 15 Aug 2021 12:33:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFJ3x-00018r-EC; Sun, 15 Aug 2021 12:32:41 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFJ3v-0006fZ-Dp; Sun, 15 Aug 2021 12:32:40 -0400
Received: by mail-wr1-x42a.google.com with SMTP id r6so20329356wrt.4;
 Sun, 15 Aug 2021 09:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D1GMl8qMTprfka49hX0HlbC5b5EM2AOSgSUwzW5IqVg=;
 b=oq0+FAgzCB0W7z9n4+EYDiXA3yByX8hxodYsU0xa1Np5u/hVCPtDZpJ96BwxI/2nJT
 d58wvp4EpTH8kajTYj5/nycJ1bXese8baRuX6vEX/QMjOixJ+QiggXE1vnTzBiAnZ83c
 p4SXIBoxSZxORaN4irpp3C+DmwAdGdBapQwtlztuX5oKPhbBokm3LKpDt0xeE2j0E3Ys
 GlsO3CX3NwvdoSM6aBWOrEWUwPfTasGUvsFVjMiuQyoOt6x6+PAxjrde7ZJX271/NMgQ
 tk7NWYqXT5V/MZGKIofYdGeDwt1amkGdv8s10GpHro3ysm3BTsVKuoauBLtK+wwVIpFl
 VyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D1GMl8qMTprfka49hX0HlbC5b5EM2AOSgSUwzW5IqVg=;
 b=jc9mDHnjho9J9Pbqe7ERL4Zp8QGo0idSZZobK4fvQeUGJfEygjXLmwuEvdg7wfmCnF
 22Tl3HcpUiH/jvkSh3GLcg9SGASNq5dh9uXAe321Gbf+oq6PWM5NQVUcOaDo6+fMmwZH
 qGmmQz9MUPjPWJqLNdx6sYMB0CwYkN8/qA43RHwlDNhHEWDLkJFbX2tmZ5om7fJ0rEIw
 mzb6C/5HSpkgPIB7r7A9VBeNuA8CQuoh/8dbXR7Ai2Dny+ysppAqPAvil7rutMw3v7ux
 tkcmO+786gJwex+MaKRKegVxFEZLKFPLQ8TNPqer5giJKNVUXdLHIum5cu6JpxGhsKzN
 yuew==
X-Gm-Message-State: AOAM530p3soP3JQGVGiiWgA6zfyeFPRCiXr7zXpnHclj+05R3K/W4bTj
 NSJkOGlqLAuLqJ4s9rY11FI=
X-Google-Smtp-Source: ABdhPJxq7tX+Tp4tX74I3L77xF1UCmTSVVQI2RxV1HJ2KQ2vbhZThO4ETjRdPdA2HousMeZb2PCqmg==
X-Received: by 2002:a5d:50c6:: with SMTP id f6mr13656418wrt.178.1629045157431; 
 Sun, 15 Aug 2021 09:32:37 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id l19sm6009526wmi.4.2021.08.15.09.32.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Aug 2021 09:32:36 -0700 (PDT)
Subject: Re: [PATCH for-6.2 09/25] clock: Provide builtin multiplier/divider
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-10-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <86d7a767-f53e-dfa2-3641-9e39512c0512@amsat.org>
Date: Sun, 15 Aug 2021 18:32:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210812093356.1946-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.147,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/12/21 11:33 AM, Peter Maydell wrote:
> It is quite common for a clock tree to involve possibly programmable
> clock multipliers or dividers, where the frequency of a clock is for
> instance divided by 8 to produce a slower clock to feed to a
> particular device.
> 
> Currently we provide no convenient mechanism for modelling this.  You
> can implement it by having an input Clock and an output Clock, and
> manually setting the period of the output clock in the period-changed
> callback of the input clock, but that's quite clunky.
> 
> This patch adds support in the Clock objects themselves for setting a
> multiplier or divider.  The effect of setting this on a clock is that
> when the clock's period is changed, all the children of the clock are
> set to period * multiplier / divider, rather than being set to the
> same period as the parent clock.

This is super nice!

> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/devel/clocks.rst   | 23 +++++++++++++++++++++++
>  include/hw/clock.h      | 29 +++++++++++++++++++++++++++++
>  hw/core/clock-vmstate.c | 24 +++++++++++++++++++++++-
>  hw/core/clock.c         | 29 +++++++++++++++++++++++++----
>  4 files changed, 100 insertions(+), 5 deletions(-)

> +void clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divider)
> +{
> +    assert(divider != 0);

I only wonder if we shouldn't check clock_is_enabled() here.
Maybe not assert, but at least report a GUEST_ERROR?

Also a trace-event "mul: %u -> %u, div: %u -> %u" would be useful IMHO.

> +    clk->multiplier = multiplier;
> +    clk->divider = divider;
> +}

