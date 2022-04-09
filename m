Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E4F4FAA11
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 20:04:06 +0200 (CEST)
Received: from localhost ([::1]:34748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndFRN-0002Ft-0K
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 14:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFQO-0001MP-0i
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 14:03:04 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:44986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFQM-0006nm-I3
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 14:03:03 -0400
Received: by mail-pl1-x62b.google.com with SMTP id j8so10598339pll.11
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 11:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vcGSDAfAxzh26JjC+V7GBL+wdHh29jzWvfnj4KBYshQ=;
 b=ElCvUIcZSnxGL1OIgV7euX7QOyJHOrs8ZtR5hqIzOQYihXRWoswBJFm1igKhZz3WMW
 pqhSxecSsv5QKHnEQsIgIsTWCQgdiDUG0D1lYE3ZRyyXzQQgsXOaKmxs5kfTDtc4Ty7n
 6A1rsf7YI8sGOFwBNb8kYTClG89CXP4vDdrS2XobBVp65w3I2nJuxDbL3++8PBX8aA9v
 fYcmc6w9c4wMNNsAsqB2zciRnQnjtXNhFmxW6bui/2vUsj8H23jGk0/0OvkHG+04nJMH
 Rz3/xKiXVZrAf95hCyT3CIgvyAK3JhIecF6YiUpdEj5iVPf6CTCJAGN05IrBVmYGoO8r
 iSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vcGSDAfAxzh26JjC+V7GBL+wdHh29jzWvfnj4KBYshQ=;
 b=PUud+3AapL5xcsqM3AxpXTXEGWlZtqtP6OFOmp8/WnGDzodWviGugSRhcBh3betvp7
 35q7JrO39RCZ5+kd5JNSg2gqa510yFwd+1+0eR+Xwo9GL7bou4cjgB7eWYrtW7J/AhoW
 qH8h7wZ+gHgSq6xV6nAmWuVU9LOsslfKLFmeTva2MN0sD5hFH9i3oYYu/oX8CMVfx+d7
 5eg5BX9SkmQ44BwVwxuYXf0D44mwNEkyk+fwjMlMlHbGPoK0+3Kin3LsRr4yiOGw7QPq
 e+mOsvBj2qxCNvWwoYd5i0I/FDizdav1qVqcBKTynP27Dzy/fo6bhAcebQdNonSR9gR+
 OX1g==
X-Gm-Message-State: AOAM532Qc2oAGqywqvJhRaspubhQQ8dvcUyOTRzzGCY5AWTH3STXLM8w
 ZV6e/sTYQBVFN+0TbrXNz6mJFA==
X-Google-Smtp-Source: ABdhPJyEk6c6ZtWe9TpY1YJ0X5rBHcVVpGCPUYxhNeQQOahRM1S3slu6fRn4KbO6wH2lq5mGsWyHaw==
X-Received: by 2002:a17:902:8e81:b0:154:710b:c2e8 with SMTP id
 bg1-20020a1709028e8100b00154710bc2e8mr25049519plb.126.1649527381033; 
 Sat, 09 Apr 2022 11:03:01 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 a9-20020aa78649000000b004fe3d6c1731sm16955999pfo.175.2022.04.09.11.03.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 11:03:00 -0700 (PDT)
Message-ID: <648469f7-e060-01d9-3ce3-2d0e93db76b7@linaro.org>
Date: Sat, 9 Apr 2022 11:02:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 14/41] hw/intc/arm_gicv3_its: Handle virtual interrupts in
 process_its_cmd()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/22 07:15, Peter Maydell wrote:
> For GICv4, interrupt table entries read by process_its_cmd() may
> indicate virtual LPIs which are to be directly injected into a VM.
> Implement the ITS side of the code for handling this.  This is
> similar to the existing handling of physical LPIs, but instead of
> looking up a collection ID in a collection table, we look up a vPEID
> in a vPE table.  As with the physical LPIs, we leave the rest of the
> work to code in the redistributor device.
> 
> The redistributor half will be implemented in a later commit;
> for now we just provide a stub function which does nothing.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h   | 17 +++++++
>   hw/intc/arm_gicv3_its.c    | 99 +++++++++++++++++++++++++++++++++++++-
>   hw/intc/arm_gicv3_redist.c |  9 ++++
>   hw/intc/trace-events       |  2 +
>   4 files changed, 125 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

