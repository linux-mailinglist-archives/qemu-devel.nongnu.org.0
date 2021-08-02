Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 349123DE271
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 00:26:31 +0200 (CEST)
Received: from localhost ([::1]:58828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAgOD-0008CZ-GN
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 18:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAgLh-0006V5-9S
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 18:23:53 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:37543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAgLg-0004Ey-0A
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 18:23:53 -0400
Received: by mail-pl1-x631.google.com with SMTP id j3so6254081plx.4
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 15:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=XUKekG2iztZi06QuFftTXXYolQqk4b2faKhKenQWaM4=;
 b=hmSz0kOYUnh3F8m1C5aaG5mPZv9erEQ+e8NVNGwqXRH+/Y4DV0iaexySn35i3M7uri
 9kWccVkOIrtFFZl2rQVIDQYPxvtcAmgK7evuHfy+G/BaU0ubi1tLMd4W/FgDvud+pwJf
 Jp5Zj+woG96nBQpr2a0VxHR57xKWm2MTelIOPq7HdLNWco19uf2OD/N+vhdzOyiGbKch
 6trXEuu8D9xa6pnr4pLdvti5Lr6ShJeMjFt1dniR8yQcaVvBFvLcVV7lYtX1RzVKXY14
 zokNN44NNPy3xC+/E2DaxgbeuyD2X9kI75cqcZcV57uLUgQ1/DKGwx/MaNTAxtx8Yy7X
 hf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XUKekG2iztZi06QuFftTXXYolQqk4b2faKhKenQWaM4=;
 b=WFxolBqGgzvB43p/CxVE6Jt26rho9+esacFMYW54Mz64EMup7cEuGmyK5Dm/spFsgW
 RunYlv+lFJjld5JEzOKJ8ZKfwjFiq4xN3PNc9q8iETgAmpI+aJTa1Dwpot/DcSNhQnmh
 5CddCkoYUf1DUgD9UK0k/dZQtSL7YvWR6Kbas32pTGeRhB+zjR/c14c3P3IwY5hmsZSN
 0v0a2R3Rq2AESz97b8g7Zjpcr3iN+dKut982E+VO3H+85V+1auVvMVldyNPec1EsV+73
 SyL4SwGplVewtnJFwnVElekaWlLvenHA4y7bR5pu1WMvUvqSzXL+uOZ/04qbP7R8ZDGL
 yjvw==
X-Gm-Message-State: AOAM531YKEOaF0qh4jJ95R795qMtlA8J8KXqFxQPKlJmCcHJtJYYWpn5
 +FMcoYUKws8RelVtcgCW626rad+RhFdlZQ==
X-Google-Smtp-Source: ABdhPJxw1CdAr7UIXCAfkpJtetJp1KARjsN0bJpOjkNUx8tzhtWG9aZzHFlTVPhCOGcHWDrpRkzBPw==
X-Received: by 2002:a63:204a:: with SMTP id r10mr2466861pgm.365.1627943030730; 
 Mon, 02 Aug 2021 15:23:50 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id z9sm13020170pfa.2.2021.08.02.15.23.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 15:23:50 -0700 (PDT)
Subject: Re: [PATCH 1/2] target/arm: Re-indent sdiv and udiv helpers
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210730151636.17254-1-peter.maydell@linaro.org>
 <20210730151636.17254-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6925ba1f-2f07-1308-7e08-f88d1766d8d8@linaro.org>
Date: Mon, 2 Aug 2021 12:23:48 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730151636.17254-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/30/21 5:16 AM, Peter Maydell wrote:
> We're about to make a code change to the sdiv and udiv helper
> functions, so first fix their indentation and coding style.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

