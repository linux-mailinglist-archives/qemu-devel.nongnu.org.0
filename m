Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A6E68203B
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 01:00:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMe3O-0002Kt-9q; Mon, 30 Jan 2023 18:59:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMe3M-0002Kl-Ky
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:59:12 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMe3K-0006G9-Sk
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:59:12 -0500
Received: by mail-wr1-x42a.google.com with SMTP id bk16so12728581wrb.11
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 15:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h5kjHuvn29LxgMhx9a+ueOZQi83kakPuFxu7YmLR/t0=;
 b=FRfNPY3C1lE1s91OGPlInG+bC82nokOea3nR5vF1iODDaxV56s66PUp2nCRrQ32v2f
 K8c98x7O+Bp3TygHJr526Pe3MZ/1v2+TMIQKZvGp+w9FufBxNay3nFpruQG0Milu2Oil
 0BxmqPK6ogD7bxK+3fbg0bREQRojlWLHhzUkO+xBHHn7lHQRc1pc5e70BF+38AYn87Oh
 3Y2rVK8faO8QswHAlv+a+RjxxA12BiBndigWLKj3rrFWuSTOMxLJuh7CTRK8tooiTdT5
 4WkPVQXK197xTOS0cbYz343GoSeXlEd+iQ1dP7ZyduwOdQ6msk584jLoo6ZKnDQGhLj1
 MWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h5kjHuvn29LxgMhx9a+ueOZQi83kakPuFxu7YmLR/t0=;
 b=WyG6SIVD9lYZK/3Y19Ie421DYZQTGxNrnIfFIBAiRynKZO2VkWViIpJQuESxDZ4pLd
 lT7WWVq/wwvE99veEa5QipcAX+fPcYsEsN0BpX9vWkxYve9WsvnUh1xlQjy8fN2Jd5HJ
 0gIqH51Bvv5+Z5gJfU/38hRrD0Y/11bhdjWgsMxnZfzMFXINeLfCKjRg/XQ2V06qjnee
 q+xTkHB2V0DScXbzjArLbWcDRilYTxzuAmriFnpCMuPm2ql45hcyMDeIvUKGdV76aoM2
 +cV1px1R38lyxvm9OcAP8eKSyvNT+rF/9GF6mFzveDEc0n8REvk/ESyqH9RTmnMjo2RO
 kwfg==
X-Gm-Message-State: AO0yUKUeV8ZVPP/zIF4aDUMeychgZAY7d4pLK/Iun62pkvlVKpzcBhss
 Z2zw/w2UtJWCOJIjmfOqtj6kZg==
X-Google-Smtp-Source: AK7set/RNmNvqW4m0kXZJrEIRTRuM5lm3Gzb0QauUnQdPWKNisR7KYzn8qizEk0eKvXza19JFKa4xA==
X-Received: by 2002:adf:fccc:0:b0:2bf:e9fb:f1d4 with SMTP id
 f12-20020adffccc000000b002bfe9fbf1d4mr6430632wrs.38.1675123147399; 
 Mon, 30 Jan 2023 15:59:07 -0800 (PST)
Received: from [192.168.1.4] ([41.141.105.34])
 by smtp.gmail.com with ESMTPSA id
 y3-20020adff143000000b002be546f947asm13204881wro.61.2023.01.30.15.59.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 15:59:06 -0800 (PST)
Message-ID: <990db792-2ca5-2916-5a44-8ae20bab7284@linaro.org>
Date: Tue, 31 Jan 2023 00:59:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 11/27] tcg: Use tcg_temp_ebb_new_* in tcg/
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, cota@braap.org
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
 <20230130205935.1157347-13-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230130205935.1157347-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 30/1/23 21:59, Richard Henderson wrote:
> All of these have obvious and quite local scope.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg-op-gvec.c | 270 +++++++++++++++++++++++-----------------------
>   tcg/tcg-op.c      | 258 ++++++++++++++++++++++----------------------
>   tcg/tcg.c         |   2 +-
>   3 files changed, 265 insertions(+), 265 deletions(-)

Reviewed using 'git-diff --function-context'.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


