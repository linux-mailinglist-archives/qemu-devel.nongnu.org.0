Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEEA65F685
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 23:12:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDYS0-0005r4-4Y; Thu, 05 Jan 2023 17:11:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDYRx-0005qP-JF
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 17:11:01 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDYRv-0000Tc-7n
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 17:11:01 -0500
Received: by mail-wm1-x333.google.com with SMTP id ay40so29075852wmb.2
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 14:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j2Oh2ZpUHjMC/KmyJpyrzHuu6L2yAhMXOSHypcxlum8=;
 b=v9kBZKRtPOkiuRmIEPyDohKcw3q8XXo3IoK4w1lJSsrcB1867bzAh7jmQ8OvieKVai
 BPfR0U0Mql2skudUiyiRtcA0r/k6qR3z9VumHxCu8f5Ub6tI6aJBv7PRfu2kGsn2E2Ov
 1IOdbJeilftHSacwXjaa4QBnEqXvs8RZdYAnIsHP9SYmfozFBaq2ap59AdpOdNJNyh2V
 Zb32ROnRelZAQvKKN2QHN+UkTAnh4tweLWMZr2SeyzUflQDjKtCIyJnxvJXYHmRVy9++
 flsomDnOeF1qZEe1GIruGr/O1mXGUfMExKEL5/yFlaNhVNbe903ManPeLswFCY7IPkvo
 OdVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j2Oh2ZpUHjMC/KmyJpyrzHuu6L2yAhMXOSHypcxlum8=;
 b=GTbyu4w/ZnxKlcu0i6LJZlVkjY+6FYhXh/3aWc0rhrRwKZH/ivTWDQb0+ds0eixMXd
 3JFzkLuKfvP6+KSYiUwSDu3Gkpwuw43Ojkxjy+dHB+G9yBhv+Fbt7PebKCyTgAOinaKz
 hIadinE/Kv5gmNM5UzFNVkS0SC18bks9ZZnTeTbMhmcOoOppAgsM/1D5FlwLd0z+tsQf
 MBfn6IS2Wm5y7fPyJhbWlRkA5cHfgGIxV2N0Im5W+s9iyQRn50KNAQTxyaigl1Vxlzap
 lESMnINerdDAYh0dqEzT/YtkNYvlN5sKpsO193bGnGA4lgEpzuRsoIuJB+LqlS+guU1m
 vfMw==
X-Gm-Message-State: AFqh2kr5SkOhMLReRyWtN05A9J7pSIOzxYSeYfB5BSR7X92cs349gpe9
 caI01mVnqPk3k6VWDMdAeJC5LA==
X-Google-Smtp-Source: AMrXdXvJrrYxJzXhCT9TDfIlPvsA4se2eUzA3b+nWwI1mNLuR9Y5YeuyULuKkQNLMG0/7Ky3Ukdqaw==
X-Received: by 2002:a7b:ce06:0:b0:3cf:a483:3100 with SMTP id
 m6-20020a7bce06000000b003cfa4833100mr37348025wmc.3.1672956657457; 
 Thu, 05 Jan 2023 14:10:57 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a05600c310c00b003c70191f267sm4212748wmo.39.2023.01.05.14.10.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 14:10:56 -0800 (PST)
Message-ID: <5e5eb072-6013-210a-4911-10298ca5f3c4@linaro.org>
Date: Thu, 5 Jan 2023 23:10:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 24/40] target/arm/hvf: Probe host into ARMCPUClass
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
References: <20230103181646.55711-1-richard.henderson@linaro.org>
 <20230103181646.55711-25-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230103181646.55711-25-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 3/1/23 19:16, Richard Henderson wrote:
> We can now store these values into ARMCPUClass instead of into
> a temporary ARMHostCPUFeatures structure.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.h     |  5 ----
>   target/arm/hvf_arm.h |  2 +-
>   target/arm/cpu.c     | 13 ----------
>   target/arm/cpu64.c   |  4 +--
>   target/arm/hvf/hvf.c | 59 +++++++++++---------------------------------
>   5 files changed, 17 insertions(+), 66 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


