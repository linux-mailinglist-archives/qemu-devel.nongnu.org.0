Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE96931B7B9
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 12:02:44 +0100 (CET)
Received: from localhost ([::1]:33474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBbeN-0005zL-St
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 06:02:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBbao-0002ZA-Vg; Mon, 15 Feb 2021 05:59:02 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBban-0004YS-LB; Mon, 15 Feb 2021 05:59:02 -0500
Received: by mail-wm1-x32d.google.com with SMTP id m1so8911990wml.2;
 Mon, 15 Feb 2021 02:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r8WLhc7AiT4Ly26BYZI8yGfaF5n5veHS6b227dEdf5U=;
 b=sWywZsJF/xk1RWiIbYsjTcHQMFTzTMapYE6qSqxOC1gCHttM7R3TJKxRgbPKvP9UR3
 k852UY7gEiB6MTtQj3ediYUCRyBRtW+EpITJF9OzfOBldGZfn/YzUkvVJ7AQL5balu8g
 CeYa94nFIPtjz3j1SokyK41ngrW65YPxh0AgaiQEgw8mQisZnIMfq6EOZjadOAFm7h4R
 OZRRlNWxeKFFoeMcvXG/cgyI1UwkOGlgMGniRf6HNtxI0nAl9aZV/ZMWjyeXm9bBYkqx
 i0E6TFEsUD6zE8hpyJjWnljPvcR39ONFIqQ0QUJZFN0ACzp7m+UiZdl65Bwr94cidx3n
 8mOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r8WLhc7AiT4Ly26BYZI8yGfaF5n5veHS6b227dEdf5U=;
 b=uh4fJCzJbQtTipEjS9ZN+2ARwOKT1A1z2mXN06Cb2Al0IreoZ2270A1bR1AbvhYjNA
 5shctZ0MwkJcdYbSGtCykVIfubhbO3KfPQS015QYmtNqbwZZb1ZT30bMhoR93vtMyFSA
 yugLNKlJGDPykGsF2AVtxFRju3oqTlvbIwNO9DQT1QeFOfvJN0Pc86KhywBCMvC0RGD7
 ScWpqtCI+P+0COpGUq/r+GpC4t+NmIvpbBqwnxVo0bdrmLLVokIu2u1USL8/YfSK0Ii7
 TI2Ma1e/Z1Eq0lDmsN1FBzGNPy+j4neNImwIDWIpB0knX+q5cIIIuWENyUyDkn3p9MYU
 yDeg==
X-Gm-Message-State: AOAM530SVs6NQB1EfV3vHl9BOGzLqO0LEHFKy8k2VMd6tR1tucEIX6bd
 nzO0PeRuDtTxpT+lH6k5nas=
X-Google-Smtp-Source: ABdhPJykvgO3pxvyWmjWXI1oA+yaD6wO8+n5Yf2w082MwzHJ6o5ixPo0iDIt4fHPum7vH8+45gdxtA==
X-Received: by 2002:a05:600c:430b:: with SMTP id
 p11mr13943286wme.29.1613386740086; 
 Mon, 15 Feb 2021 02:59:00 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c22sm25589795wrb.91.2021.02.15.02.58.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 02:58:59 -0800 (PST)
Subject: Re: [PATCH 7/9] hw/display/omap_lcdc: Fix coding style issues in
 template header
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215103215.4944-1-peter.maydell@linaro.org>
 <20210215103215.4944-8-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1f51f8df-a4c2-3818-4d01-1109dccdcb40@amsat.org>
Date: Mon, 15 Feb 2021 11:58:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210215103215.4944-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 11:32 AM, Peter Maydell wrote:
> Fix some minor coding style issues in the template header,
> so checkpatch doesn't complain when we move the code.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/display/omap_lcd_template.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

