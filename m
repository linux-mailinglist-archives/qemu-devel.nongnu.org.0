Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 330AD4D9A06
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 12:09:58 +0100 (CET)
Received: from localhost ([::1]:55848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU53t-0005KO-74
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 07:09:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU4vb-0005su-8q; Tue, 15 Mar 2022 07:01:24 -0400
Received: from [2607:f8b0:4864:20::632] (port=39605
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU4vX-00047A-25; Tue, 15 Mar 2022 07:01:22 -0400
Received: by mail-pl1-x632.google.com with SMTP id d18so785486plr.6;
 Tue, 15 Mar 2022 04:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KYtHNEstvZGIOiE3a6YgbpbRIwxG5sKHoFYZisFizN0=;
 b=H7WMDthtOJpo8RVjxavQ3gvy9HZBJb397z0Et0CcoEpvbtC4qk8PE4QWLiucVvEpa1
 K/UnXRSlEqy/ao5iK4TiRheY7zHGxepoD1METaliUFutaVMxkQYB10ababG3rtuAzLCT
 90AURVZCUzw+r2VE/zyz+SeFyuyXHNdmtPLrOHTJh/bv4BBb7XjpkRwuJIxpN3uA99J6
 711nDyggs8KxAgAQ6BU+lWYUva2f1uy6LI0XabSNLABbZ+tPZwk+nT8WsgsS3N1z00if
 540DBXsVKGA3LBCsMPFkQ3Z+Z5FLHpiVsP/rsCXIR/JWkl5xmfmnD2JfFWCRv0mMQvSb
 A/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KYtHNEstvZGIOiE3a6YgbpbRIwxG5sKHoFYZisFizN0=;
 b=Vw7tyqcgG8F1dpSnJ9zbxP3P2K31zx5BxuaYLhzwURcN4cKxpan5Ud8RlC2DzskBGm
 TXf+jmXfKxSgFNrxgNnqLc+F7mnQvrjszCnS13B4eu6AiDsNxHvH1DSvVbM6x78dZfiD
 cKUBiRhTYeqkOW/ZS5D56CBWzLkv/P7eWNlJNF0nKcqwxSHsDKW4YhLQHDpq56er11Fu
 y42V/xrgZ6N7UZ+dBJQhgIznENbQK+YszRBL9DQlajhNvp2R1NMAombncwQAujg82zZF
 A9MfRLMFhV/TPcwxHzvS1PBTMZE3pjOJUIk4D9S/JUmCNxdBcVftv4qeh0OCeVgxqZ34
 0BVA==
X-Gm-Message-State: AOAM532miX8p2XdJ7wB6L/XW1QG704q0gT6pBNMkm4CYwnNq7Z47eqi0
 l8F6qSK3F9d3q7jG0jOtY9k=
X-Google-Smtp-Source: ABdhPJyaJKOaEX/F9b/fOhYwCsD7MnyxNRx7T0+RCBAp3FyY1aq04Ihqsu3nOxnDE0uu+iHCQTrC7w==
X-Received: by 2002:a17:903:2406:b0:14d:2f71:2e6d with SMTP id
 e6-20020a170903240600b0014d2f712e6dmr27873898plo.98.1647342076824; 
 Tue, 15 Mar 2022 04:01:16 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a056a0016c500b004f768db4c94sm5467303pfc.212.2022.03.15.04.01.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 04:01:16 -0700 (PDT)
Message-ID: <3b178e54-4e46-9ddc-5178-93e809b409db@gmail.com>
Date: Tue, 15 Mar 2022 12:01:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] target/arm: Fix pauth_check_trap vs SEL2
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?R=c3=a9mi_Denis-Courmont?= <remi.denis.courmont@huawei.com>
References: <20220315021205.342768-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220315021205.342768-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Rémi

On 15/3/22 03:12, Richard Henderson wrote:
> When arm_is_el2_enabled was introduced, we missed
> updating pauth_check_trap.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/788
> Fixes: e6ef0169264b ("target/arm: use arm_is_el2_enabled() where applicable")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/pauth_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
> index cd6df18150..739aa520dd 100644
> --- a/target/arm/pauth_helper.c
> +++ b/target/arm/pauth_helper.c
> @@ -390,7 +390,7 @@ static void QEMU_NORETURN pauth_trap(CPUARMState *env, int target_el,
>   
>   static void pauth_check_trap(CPUARMState *env, int el, uintptr_t ra)
>   {
> -    if (el < 2 && arm_feature(env, ARM_FEATURE_EL2)) {
> +    if (el < 2 && arm_is_el2_enabled(env)) {
>           uint64_t hcr = arm_hcr_el2_eff(env);
>           bool trap = !(hcr & HCR_API);
>           if (el == 0) {

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

