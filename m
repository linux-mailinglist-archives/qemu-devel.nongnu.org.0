Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA89F580A85
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 06:43:13 +0200 (CEST)
Received: from localhost ([::1]:36282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGCPZ-0002yL-02
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 00:43:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGCNS-0000sg-E8
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 00:41:05 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:46004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGCNL-0000AN-5A
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 00:40:56 -0400
Received: by mail-pl1-x629.google.com with SMTP id w7so12247458ply.12
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 21:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OsbmZy1iQp03ox7tQRMghj+VEKCMy7YUpaAQ5jYopM8=;
 b=Jr7RQI1HFkWNzeb060gijixXCOYftEFuTaz48A2OYQ8bQzXj6QC9NWCviNZqTV2qPs
 qOmvq0UJvi2SvSW8pXhwmFWNoXM53FGhB8/ULEdMYJmWAeAuo5lEFqamidluQMaBSufZ
 jvt9B0lVRUqK8ZPXZ6nMQp4tkcdP2oIQxsflz95qUYRTH8K1SpjM15Hn4zVCJkDYZJ+c
 sBFjJVJSQT4yMCg5h5z8nvNgm1fExBNTbhm5elp0WuuWlGoraP6aiQ8wEIkgfP7S8NRJ
 3R24wSa5BcQy1dxc9ZE5YRMbghuqUvdbPV9XQXqfkQUj64j+ltMKVOdORd5UybKVDTMV
 s2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OsbmZy1iQp03ox7tQRMghj+VEKCMy7YUpaAQ5jYopM8=;
 b=L/87sOIJttLSdiRGNnSjX+2ewICof9t8lEY2nX3LXpTecjdu0lPUhV5B+zPx1udyev
 lSFQvi2Rhs/qpqm2K0+4lgkk2lTnahVdtEmbbu+/LBlo6BLTj3t8RhxZZWkd9ZVKsHqy
 lmFRYIcspZAELrAh4QJezZuXPH6tgoqm4TviKwZi+n1i++xr6XfY9AYGPwrv6FrnHwPr
 ZqBJm4kPfz8iUiydIRRiLwijTBbNVAixf7O46HxKTwUafA5v1/5REKKK5RPRy+14dLpF
 6P/i7iUUeFOqCODzUxVc3zEgBVA6B9fZeYsA9h65Y53Bjkl7UVT5ccdB0WLV4x58vnls
 FheA==
X-Gm-Message-State: AJIora8aIWfCXfhGovGEjE0JyvZDsN/+AjEYK6oWn3CCt7RE7JZdRszq
 XQbdakm1YC57x9EVZxiyc5q46w==
X-Google-Smtp-Source: AGRyM1tiXM0lFxyiKj96UcHFybeFUNb1pA+F93XHZAU53XtFdkV2c++TxHWphQYE1BoTPFejYt6wHg==
X-Received: by 2002:a17:903:31c9:b0:16c:3024:69c4 with SMTP id
 v9-20020a17090331c900b0016c302469c4mr15342359ple.81.1658810453146; 
 Mon, 25 Jul 2022 21:40:53 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:673b:b40:a955:bc1b?
 ([2602:ae:1549:801:673b:b40:a955:bc1b])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a1709026bc700b0016be834d54asm10067069plt.306.2022.07.25.21.40.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 21:40:52 -0700 (PDT)
Message-ID: <4d385c58-2c8f-6f40-7953-50424f766b9d@linaro.org>
Date: Mon, 25 Jul 2022 21:40:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] target/arm: Create kvm_arm_svm_supported
Content-Language: en-US
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220725181457.41083-1-richard.henderson@linaro.org>
 <20220725181457.41083-2-richard.henderson@linaro.org>
 <8d493056-fc22-cc0a-29ab-15a810ff1c30@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <8d493056-fc22-cc0a-29ab-15a810ff1c30@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/25/22 19:02, Zenghui Yu wrote:
> Hi Richard,
> 
> On 2022/7/26 2:14, Richard Henderson wrote:
>> Indication for support for SVE will not depend on whether we
>> perform the query on the main kvm_state or the temp vcpu.
>> Mirror kvm_arm_pauth_supported.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/kvm64.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
>> index d16d4ea250..36ff20c9e3 100644
>> --- a/target/arm/kvm64.c
>> +++ b/target/arm/kvm64.c
>> @@ -496,6 +496,11 @@ static bool kvm_arm_pauth_supported(void)
>>              kvm_check_extension(kvm_state, KVM_CAP_ARM_PTRAUTH_GENERIC));
>>  }
>>
>> +static bool kvm_arm_svm_supported(void)
>> +{
>> +    return kvm_check_extension(kvm_state, KVM_CAP_ARM_SVE);
>> +}
>> +
> 
> Not sure if it's a typo. Maybe we should instead use
> kvm_arm_sve_supported() which was introduced in commit 14e99e0fbbc6.

Oof, it certainly is.

r~

