Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB0230EA9D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 04:04:02 +0100 (CET)
Received: from localhost ([::1]:50002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Uw5-0005XS-Ng
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 22:04:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7UbV-0003e9-2b
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 21:42:46 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:40863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7UbT-0004BD-3I
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 21:42:44 -0500
Received: by mail-pg1-x531.google.com with SMTP id b21so1106836pgk.7
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 18:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lraR9xE8i2aZbJ+4fA2HN6+J9q0NoUwvY0P2hQgn6P0=;
 b=qUG4ETbHdvQ1cxCcomBao0Z0xtuDbMl9ZMqbYF9h3HDlziYvxaNoEH9JdJWEP8kUYk
 sXAxNNMwSRN0zwUbLoDC7p9YthClpRzLNyg1/BrZ0binyPGXp46CmYeFf8Kd8tS1vJ7B
 iJb84tQoIp6RSRxhitInjYlQgZBBD/rHeou2bvCOH1wbLkkndqU3FzjE45dCF785gG7K
 tZoDRUxdpYNrkxEcrmkGSwuV6wKkUNDC/YVyVPwUqdzNWsI77en9SWdsMVldbvai46xJ
 T+gGTQT7rQ8oqbFdTsmdtq/nwuIMjb6RtUUY3zqPZ8ae+ARg1K/+jj3RsPABAkJSgXkh
 yRJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lraR9xE8i2aZbJ+4fA2HN6+J9q0NoUwvY0P2hQgn6P0=;
 b=eOQILuT+HiDFK6fYWFo9VStOuxjlQgk5SkQTyCIuYWqMlMnwmy8w95Hv9QoBDVGGqB
 DCqcGmnClrkvy/mw2myFuwyBbHa38oyfP2tQnFw0eojcRlnuVndf4Lpped+lQTyHew1f
 xC9Tq63HGkQAmiZ94mFhUjKOhjz/zqyUf65j4JoGogzI2YUip5slXZL2eVOeMHxLZnhe
 liASX/HFKJXVglzHWUVUt26VfeE6OucIO5Tuw6xKOW5YJOO3kCJ1+F9r/lLVlFnLixRN
 3RfEMHjNUjz7MDmAzjIgI/nwtnJhrpo0DMkWyDFxeKQW67A6V0mY82K4JGcI8OR8b7EE
 1jCA==
X-Gm-Message-State: AOAM531rKg9DANv9U3TD1kK9ffqvptebZBl4kXzumifV6yJDFJIQ/A7N
 6C76WXp4anxUJkUJV6Afr22CRA==
X-Google-Smtp-Source: ABdhPJxQmUlar0vKnhbJA89Nq4c8Dj1LwWwMZA3Qp35Rtv8Us8crrtXmeBZGMt54eMGYk3eIgHKQvg==
X-Received: by 2002:aa7:824e:0:b029:1d2:a000:b0d8 with SMTP id
 e14-20020aa7824e0000b02901d2a000b0d8mr4210098pfn.35.1612406561734; 
 Wed, 03 Feb 2021 18:42:41 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id z2sm3668375pfa.121.2021.02.03.18.42.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 18:42:41 -0800 (PST)
Subject: Re: [PATCH 5/5] target/sh4: Remove unused definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210127232151.3523581-1-f4bug@amsat.org>
 <20210127232151.3523581-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6b864d27-5a31-bbf6-8c08-d53580df6e10@linaro.org>
Date: Wed, 3 Feb 2021 16:42:38 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210127232151.3523581-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.178,
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
Cc: Joe Komlodi <komlodi@xilinx.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/21 1:21 PM, Philippe Mathieu-Daudé wrote:
> Remove these confusing and unused definitions.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/sh4/cpu.h | 11 -----------
>  1 file changed, 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


