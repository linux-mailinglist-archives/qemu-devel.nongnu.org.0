Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6FB63D0DF
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 09:39:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0IbU-0004JK-1Z; Wed, 30 Nov 2022 03:38:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0IbR-0004J1-KL
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 03:38:01 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0IbP-0000b6-Sr
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 03:38:01 -0500
Received: by mail-wr1-x435.google.com with SMTP id q7so24996982wrr.8
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 00:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zcJ4sONZMJKC55fg/Zlb0LAo3EP4D7cNkMPcFF/NO34=;
 b=WSallXiEGNiTDpc2ZJ+eXDffJy2cZLDhAlnvi6F4s07XV+KGXc75YZaTVIH7t32XMR
 I1cDp0CdT4tE2tQUs14e/ZpA4mBLr3ISoowntfpRKEnL63DaXFEtnI2xFM5QViIIVBXO
 PCPctUc6mZA6XXEPCvznePQ9qH3S+aKnwqQpiV6WJ3z80IW8NpBo5jwsauHItkZsUIZs
 UzTvgPJdzmXzTP91TAxxglbMQqzag3b+smBl7uvbP6nsghcgTqwUXGDiOKjWO5Y+FWtI
 jgYJmHzCat4Pn+pDyFQnFFxgpWok+r/gm22AzYEkGZy9mu9+CJw56gMLDdVKDsEhfUzD
 U3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zcJ4sONZMJKC55fg/Zlb0LAo3EP4D7cNkMPcFF/NO34=;
 b=PDbTRTTi3M123IAREfDHO7i5/CxynS4TPw3trTnM7d7ZIcA9nFvmzHM+jTR2E6DUY8
 m5Ur+lTLfJfojIaQohjQLHXEKvYxeLsfis7bLtiMP6nneW3dIIvOClXw1I8LQNlkhG7J
 7olhYWgPg9XzMOeLZ1rgLKuABKanER/iGyNO/rD8d3+IGdJgNipGXjydX2EL0Zf6hm+j
 VUcS5zTkCcU/P8R0wbJwXwfeXYF7B+61WEjbLYQ9YgDeZje130UhwR15a5id9vhNCXf5
 k+HR4MwQvUoY7zzrBazrRs//tY8dTXuSbEoE6QXQTYYKjnMAMEZBVeSy2YcYmm6UHtM6
 +EPw==
X-Gm-Message-State: ANoB5pmslS9qcPoWvbwnSPiHF8LJBxJDQPOXdjuUudvWJLdUp4NgCD4K
 2fk/ZEeYle0KsNyYzv45jRIcrw==
X-Google-Smtp-Source: AA0mqf5npu5tw7HPY+Ziv/SpJhAgpsDtw6xHqpWRytBDLBRZl1M+i1Iz60rfSzYUfzLw0M6lg6qSsQ==
X-Received: by 2002:a5d:68d0:0:b0:242:6fb:128d with SMTP id
 p16-20020a5d68d0000000b0024206fb128dmr14670165wrw.422.1669797478010; 
 Wed, 30 Nov 2022 00:37:58 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l11-20020a1ced0b000000b003b3307fb98fsm1121802wmh.24.2022.11.30.00.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 00:37:56 -0800 (PST)
Message-ID: <db77bcb2-66c7-6f4f-6ada-8dc854ce6f2f@linaro.org>
Date: Wed, 30 Nov 2022 09:37:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-7.2] target/arm: Set TCGCPUOps.restore_state_to_opc
 for v7m
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
References: <20221129204146.550394-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221129204146.550394-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 29/11/22 21:41, Richard Henderson wrote:
> This setting got missed, breaking v7m.
> 
> Fixes: 56c6c98df85c ("target/arm: Convert to tcg_ops restore_state_to_opc")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1347
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> ---
>   target/arm/internals.h | 4 ++++
>   target/arm/cpu.c       | 6 +++---
>   target/arm/cpu_tcg.c   | 1 +
>   3 files changed, 8 insertions(+), 3 deletions(-)

> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
> index 60ff539fa1..9a2cef7d05 100644
> --- a/target/arm/cpu_tcg.c
> +++ b/target/arm/cpu_tcg.c
> @@ -1035,6 +1035,7 @@ static const struct TCGCPUOps arm_v7m_tcg_ops = {
>       .initialize = arm_translate_init,
>       .synchronize_from_tb = arm_cpu_synchronize_from_tb,
>       .debug_excp_handler = arm_debug_excp_handler,
> +    .restore_state_to_opc = arm_restore_state_to_opc,

Oops indeed :/

I double checked, arm_v7m_tcg_ops is the single TCGCPUOps missed.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


