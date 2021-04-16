Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC41336277A
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 20:08:46 +0200 (CEST)
Received: from localhost ([::1]:45656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXStZ-0004UZ-Pe
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 14:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXS7N-0003Pm-Ag
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 13:18:57 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:46008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXS7G-0005nV-D3
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 13:18:56 -0400
Received: by mail-pl1-x630.google.com with SMTP id p16so10379152plf.12
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 10:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Zp31axjs5xHYANLSnr8mmAIyOsJuQyRkqTgy2wOTsxQ=;
 b=bVmIqkcDfUFQcsElUKTwV9uHkpFhtsEwjrEv2taPcmjndAIrObZqzfvi0VWGr+AUOD
 I37WB4G9LdmgFhWDSmhixF6eRuccghIGYOXH6vki/A3qe8k2r0GJd7zx8usTUl5BUgx3
 L4B0EJNVxzZRbBxg7I2vSg+9wIJ9tW0Q0AagEOpFoGiB1697ux3iAvWeALIXG+QmaBul
 ZnXyOtM/yuCKCoOc+UPAxbBF/4lBAQgxewCVoxmeNGWNn/s2NqxagkqptFA49s561yPZ
 A4MSjR7GDQJN9V40R76E/PBqIPJCd51L9bYuq6oMG3iLrJFbmo61v1n11dIg5FMqWMew
 3+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zp31axjs5xHYANLSnr8mmAIyOsJuQyRkqTgy2wOTsxQ=;
 b=NrfN9Z0fn6RVQU7NBv3R3bbIxzEd4LIQ17zH5QbY26gywH9rnxVx8rDtWODfsghtvi
 xhT7b5tkOxTzVbHksDIj1MPOmaSZfzbeEUehlGAYHWWMz3u1nybrKYy13OW3lKkF1dtC
 5f1tLLP/FwdIWHu+rkvegW9kgXwnYflefAFrUP3swKWGW1xT4kL6ivr9jnMk8iJiMWcf
 8EPpiEkaiCKWrWsNujakH7pbwCPOvknk72ia6bxLyoyK+QDj2fBMZppA7WI5G9Ezueri
 zUPNDgTZLC9VR1zWNb1HYURdf20qjRwvR9y9na+Pt+FDZWMlnLh/iGcnNER1u98UsFA1
 nGnA==
X-Gm-Message-State: AOAM530Zo8pJGb6kWZZRD5RlW64AukdfX3tU0Ko3Dm0aQsa8ZAhtdI8T
 tiDCmExDB8tH8LN2VUBcSz5YKQ==
X-Google-Smtp-Source: ABdhPJxGx0CLrAbu3d/16DfHxiVHFHyGP4xlnfQEhHo4enWb6a/GhMwxcBPFYGXOIrBYuUyOdvGz7g==
X-Received: by 2002:a17:902:f212:b029:e9:56f2:18ba with SMTP id
 m18-20020a170902f212b02900e956f218bamr10581136plc.75.1618593528330; 
 Fri, 16 Apr 2021 10:18:48 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id a14sm1882926pfl.82.2021.04.16.10.18.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 10:18:47 -0700 (PDT)
Subject: Re: [PATCH for-6.0? 6/6] include/disas/dis-asm.h: Handle being
 included outside 'extern "C"'
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210416135543.20382-1-peter.maydell@linaro.org>
 <20210416135543.20382-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9ef14e53-b2fc-a138-011f-d1ff9e60c64b@linaro.org>
Date: Fri, 16 Apr 2021 10:18:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210416135543.20382-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/16/21 6:55 AM, Peter Maydell wrote:
> Make dis-asm.h handle being included outside an 'extern "C"' block;
> this allows us to remove the 'extern "C"' blocks that our two C++
> files that include it are using.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/disas/dis-asm.h | 12 ++++++++++--
>   disas/arm-a64.cc        |  2 --
>   disas/nanomips.cpp      |  2 --
>   3 files changed, 10 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

