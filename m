Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4A252EF51
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 17:38:00 +0200 (CEST)
Received: from localhost ([::1]:47672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns4hT-00037a-1k
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 11:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ns4gD-0002FW-Mo
 for qemu-devel@nongnu.org; Fri, 20 May 2022 11:36:41 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:37782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ns4g8-0006ru-WF
 for qemu-devel@nongnu.org; Fri, 20 May 2022 11:36:41 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 oe17-20020a17090b395100b001df77d29587so11808666pjb.2
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 08:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=FwWFH7lfd17PKhOaGfN/m5L8aANzn2UWylj4ahB3xEI=;
 b=XH/GdsPmQDW0aiLUJRIlFobSM6ANJmhoujSqoit4/8fU8dSf3m2fl17EMm5TX/sO8p
 8noyUjGerxd431R+Kf8eTB7a48AfzUwNANRyG9fpJzirTBuEgt2Ke4bcIHQWXE0e82ZG
 8oKSWvTREi1vfVbUPPfzzuWaeKgYKhx6sp4ALKgFTE7i86+8brtc1k6gGgseqmU5ZFOc
 GseiJDcwqqerblPUPv+0K1a/1oax9/Y3Cb0OrVH7deYWHx9Nci20tx9/nEFC91/ifGQh
 sL77ISf46+YqFnuaApE39OcqJ6ebXufHOHMa5iOMI+KHgn9d8+cYHGC551247RdYw4eq
 0bGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FwWFH7lfd17PKhOaGfN/m5L8aANzn2UWylj4ahB3xEI=;
 b=oTcGS77VeqAiYmC0L7TBkN/8fm4Dm8e1TH/PIUvbNLI/qjy5xrKxZDwGjqrUbwR2nr
 WjJGSGyN1JWhPNowGS2Khbh+wa4KTzXYce9LRSC3h31fsFJpS3xVEBHRZT061RpO0DBF
 du8wcccf55dGuNflZDsQSjMQBuMKviJIoMbZz/tvwitfx2dm908XgySwmlLmsTYJRlj9
 o/0Gote/SbtFgAnmzlb8q3i5f6sGvkG9GMSP2OcS6MgPh0xymAXsOlzVfF9Z48QeaVTh
 87V+UhIpFtA9AU9w/YSRJOsKsgJb9OVh4HDAWX6JDNQqpAfjSl8uE7ycBDo1QzaHMDUK
 q5cg==
X-Gm-Message-State: AOAM533Gz9CKoIJY1wxNG62QU9AVxN5UZaOtzyBReMFBCavuasjedwU6
 5Equ38XOc8rpNSbdKqZyk07qSw==
X-Google-Smtp-Source: ABdhPJyaRWfxodOi7LrH4BaHf3T/5YiY1As4iPZjKamEUsneKKKCc3tw8j/cWQyEax+og362MCeOnQ==
X-Received: by 2002:a17:902:70c3:b0:15e:f8ef:67b5 with SMTP id
 l3-20020a17090270c300b0015ef8ef67b5mr10524937plt.115.1653060995053; 
 Fri, 20 May 2022 08:36:35 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a17090a6d9700b001dbe7ccdd4dsm2018410pjk.10.2022.05.20.08.36.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 May 2022 08:36:34 -0700 (PDT)
Message-ID: <bed03755-576d-6473-efe8-f7d09211f061@linaro.org>
Date: Fri, 20 May 2022 08:36:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] docs/system/arm: Add FEAT_HCX to list of emulated features
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220520084320.424166-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220520084320.424166-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/20/22 01:43, Peter Maydell wrote:
> In commit 5814d587fe861fe9 we added support for emulating
> FEAT_HCX (Support for the HCRX_EL2 register). However we
> forgot to add it to the list in emulated.rst. Correct the
> omission.
> 
> Fixes: 5814d587fe861fe9 ("target/arm: Enable FEAT_HCX for -cpu max")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Oops, missed this during review...

Oops, my bad.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> 
>   docs/system/arm/emulation.rst | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
> index 3e95bba0d24..49cc3e8340e 100644
> --- a/docs/system/arm/emulation.rst
> +++ b/docs/system/arm/emulation.rst
> @@ -29,6 +29,7 @@ the following architecture extensions:
>   - FEAT_FRINTTS (Floating-point to integer instructions)
>   - FEAT_FlagM (Flag manipulation instructions v2)
>   - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
> +- FEAT_HCX (Support for the HCRX_EL2 register)
>   - FEAT_HPDS (Hierarchical permission disables)
>   - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
>   - FEAT_IDST (ID space trap handling)


