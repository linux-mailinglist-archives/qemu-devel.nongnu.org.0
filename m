Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 543B84AAD1B
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 00:54:02 +0100 (CET)
Received: from localhost ([::1]:49650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGUsT-00067k-5e
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 18:54:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUpw-0002Uj-5M
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:51:25 -0500
Received: from [2607:f8b0:4864:20::52c] (port=34574
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUpu-00062g-Nu
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:51:23 -0500
Received: by mail-pg1-x52c.google.com with SMTP id v3so8342107pgc.1
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 15:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Zw1aeIL5Oh+pTebYDniNJiBhtV+aaYo20JsVjNzKIRM=;
 b=HTvO95Ep7zjulzieVltKT58f2hM3CDnSRbeQpz1QS0GWSKF/Z1UOZnUrmxVzvg5QeT
 jSjarmEq2Yj8UGQ3y8HDHNiD/YwAOVEIy5JkfXWQVTxouMYYO8/g63JmFdAdBUYbwNL/
 ebBzB3qJbhlfez9wS7ROm3QWBHHxlE4DX/yzRHfo1gu6fkFZvuxeeL5E3yuY47Z5iwkF
 hM8k1r7oy0E0CzCj4YS3UYdHOyWOGSMSmj+5PI6VH8HxCLY+wfWvOytlzOVX4rpCGwju
 RpV9Hn2us2hVqs0WgmKuf66VKXKcXsTrBNiA6tS4YJ40tEVwH90ijaujg12Vdf9BXb8g
 2R9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Zw1aeIL5Oh+pTebYDniNJiBhtV+aaYo20JsVjNzKIRM=;
 b=4lezYQe4oE/TPiX37oGXHwL7tXWXSFWHRY9G1sLCj8RJtYL3b4+9UpJ5S7vLpJHl1f
 fRr9/8oV0+7GDx0iVpH4MSsbqZ/5CVn1WMi1IiqFF+T3DcTz/QsNxmABqjIw06cedW/s
 9ezAfXFWxrLfRVL+MpSKSzH6GV2u5sYYzCwJWemgZ6zkcDLTi0N6QVxSlA0r2cV2Ty6V
 zkMjB3h3VJifegA399P9qMzCVDB+bzePA37d6b3D9fboVfR/iIqsPJoZL5vAdfx7igam
 RwH/I+MzHzbtIXjWnci5vo2Dc61Vz+zZJpke2gTqmxh6m4lJKiaRqR31VZxRB5Dx7kmp
 V8lA==
X-Gm-Message-State: AOAM531geZBNloi+x+bDFu6vOBybJhUFCSkqwGOqPrJeNcCnxcaVyUEz
 J1nbQVFDcyiHXsDegjA4c3E73g==
X-Google-Smtp-Source: ABdhPJwtrEEPXQXCNEayt7w1CkEGj797MC5w4/QEuvdtpIERC+AJc8PXVvPjM740L1unRE7VNE35rA==
X-Received: by 2002:a62:7c4a:: with SMTP id x71mr9843343pfc.5.1644105081512;
 Sat, 05 Feb 2022 15:51:21 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id a38sm6752607pfx.162.2022.02.05.15.51.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 15:51:21 -0800 (PST)
Message-ID: <bdc4be57-7296-c761-ea38-71e6097d8a26@linaro.org>
Date: Sun, 6 Feb 2022 10:51:16 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 07/10] core/ptimers: Remove unnecessary 'sysemu/cpus.h'
 include
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203193803.45671-1-f4bug@amsat.org>
 <20220203193803.45671-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220203193803.45671-8-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/22 06:38, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/core/ptimer.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

