Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DD93DC009
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 22:50:17 +0200 (CEST)
Received: from localhost ([::1]:49146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9ZST-0007zz-1H
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 16:50:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9ZRF-0006xF-3L
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:49:01 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:35752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9ZRD-0003r5-NW
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:49:00 -0400
Received: by mail-pl1-x62b.google.com with SMTP id u16so3979719ple.2
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 13:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=vgVFuxf2rLZXSYCkuQUbGG9dbIAiMzI2CjfI/Y8bqPg=;
 b=GhTQEPnL7n/udj7WJvSoC11+DVNxiL07zGF0ilL97kDNYHhp8f7vMRWI1Nu7/qFeAE
 CNcedSq/qxKM/nqd+eQhusoRfujRZ2Mub9YPRE7qIv1p2XtBLBFaqj8KXx6JH9xN6FIz
 m1fFVRyc3CCmuDlr962dUjnDPNPQ6Pn928lqG96rTdWxCSXSciFJoezo3N6gke8n/bvd
 DA3A4wUKFuf5ParNfjaj1gqVk4INhrezkcuOGdqMiiUwyysG/xrMHNUSs7S2/Jidbrq3
 E2T+Ol12fXVvRBBRh0D/fYBnOkzQsX8gkjIVCtHQ0kuRCdNgGDWfxZHxuWDxt0UWiEKb
 9FCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vgVFuxf2rLZXSYCkuQUbGG9dbIAiMzI2CjfI/Y8bqPg=;
 b=RqCDqMr7SwG8hK+Vi+reVD/EQq50Bz6xINbg8X/BKF3qK+VlUo3EMmIlnsxG2ZqDBJ
 lppim0mLxAgYe7Czb2x3kaQv/OcAPijHs0+9Orzd2zGJwDaSU0McnHvNVPyJSmdQHIQ6
 3K/7YUYnKuSzMmS+vjPU6m9jBsa9vQGe5ojtbJ0ERuvvPn66aLtuStqUwB6r1xleXdMK
 AF4AWau4zFfg4805ppnUuZKZLb0R/n+/Go/4NS3JhiwcgKEer+OS7TQUzNOG3puewPWp
 p16IlI+mTuS17qrNC58gMvfb522tdm0LmwZE19FyY7GiEAdUIccL72IYpjQnXINhi1pE
 99cw==
X-Gm-Message-State: AOAM533hARtJL4TV3mB/HAp6h/RZgKWcB1hxx4F1485uEY5JVymEhXuO
 3Qw5XRQfbZltEMonkNSFrvH7I4HW0HPhow==
X-Google-Smtp-Source: ABdhPJwRXi69Sma9X9DQ4sVxmHhEg6GhXkQPLnl+c7ETwJEvxRc+MO+c+GlRioqfxWJDaCX1x+wrEQ==
X-Received: by 2002:a17:90b:1d0b:: with SMTP id
 on11mr4970353pjb.94.1627678138385; 
 Fri, 30 Jul 2021 13:48:58 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id a14sm3524672pjg.38.2021.07.30.13.48.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 13:48:57 -0700 (PDT)
Subject: Re: [PATCH for-6.2 53/53] target/arm: Enable MVE in Cortex-M55
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-54-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a4084013-5648-342f-17e9-3ca125830160@linaro.org>
Date: Fri, 30 Jul 2021 10:48:54 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-54-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 1:15 AM, Peter Maydell wrote:
> We now have a complete MVE emulation, so we can enable it in our
> Cortex-M55 model by setting the ID registers to match those of a
> Cortex-M55 with full MVE support.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   docs/system/arm/emulation.rst | 1 +
>   target/arm/cpu_tcg.c          | 7 ++-----
>   2 files changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

