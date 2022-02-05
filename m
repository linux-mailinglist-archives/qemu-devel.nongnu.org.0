Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3F64AAD0C
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 00:33:39 +0100 (CET)
Received: from localhost ([::1]:54290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGUYj-0006RY-UE
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 18:33:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUWL-0003zc-UR
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:31:10 -0500
Received: from [2607:f8b0:4864:20::62c] (port=37757
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUWI-000371-VF
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:31:08 -0500
Received: by mail-pl1-x62c.google.com with SMTP id x4so722357plb.4
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 15:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uEjsNtgXZo/IwUgiqLKKuBtJ60fbYYRmVpatTJBt314=;
 b=G4bbAZ60ocXumKBc/SpsO2Ga15hc39UKtLsZVorueqrgC+kROs/KMZGLGTXsuGzNBM
 GjP3hux5YoZ48S3sJNSTi8zzAxqj66SK45irGAio/AFMQTSdUffffJCtya/LQ6UeIHab
 s06V+cWWF7GgUjFTQBKbkWrZQYg9qy2g1zegP7GCWVV7pMi6oElR7JqSo3TYQdL+YsRS
 GVKZtLPnZb0lkCGNTS+8vV4zKNjlXWBq/zaIzbqGRzJf/J7KqB4W19/Pl3lp4Bda1tgn
 AXDWWJjyZHxvfb3d+Oy8nO/Vq3SgWZP9gsUomtCBcKf6cMtJ0sa+ClH1EhpOGVKGethD
 6wOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uEjsNtgXZo/IwUgiqLKKuBtJ60fbYYRmVpatTJBt314=;
 b=4XP24S0NcNqx/RWAdCkAiHLMw0+8R8ck3UVFOTmx0pjSpttiK3wKRYkirEuZbvjUar
 bz2bYmnWIO7DaSKT1fvZ7wsGK7l7rs6bmUuR+dBYVvcLVnWDQKV6dW5Do7kJAwIA4Y9y
 33jFHZbi9+z+MyhNXw/ltnxg/zrTa/flSFZtIR9WyH/i8Afwnw5aGDF3cUHFBGCmgw3A
 soj41zN31hFOioWxHBQkY9UulUaWfSrz06mmAeyziCYepdtfP/h63qjyJl/UyLHbp617
 mJv3FixHsQwp3hYkzTyMT8TWYqzyvMAA1dIQwq8Pxfqmmea5kgiiB9RsMcPzfmrEd4tT
 I4mQ==
X-Gm-Message-State: AOAM531XADYR3PImNs7EEuWPsSEY0tBanfZn4UoeM6vvshcKohoA/bfZ
 5r/z/8rQlj9pJC5Hhg0Cx+S6gyoFYNORxVZE
X-Google-Smtp-Source: ABdhPJyxSHR/mHOcfIDEaiUySy7/xVSrsn7twWYXPbnIIdsNqTzzfQyjc7mwBEGCekSm09A3d6FraA==
X-Received: by 2002:a17:903:41c8:: with SMTP id
 u8mr10000260ple.81.1644103854347; 
 Sat, 05 Feb 2022 15:30:54 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id 84sm4641517pgd.66.2022.02.05.15.30.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 15:30:54 -0800 (PST)
Message-ID: <7824bf82-d8b1-74b0-83a1-8fca5d177adb@linaro.org>
Date: Sun, 6 Feb 2022 10:30:49 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 17/21] misc: Add missing "sysemu/cpu-timers.h" include
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203191814.45023-1-f4bug@amsat.org>
 <20220203191814.45023-18-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220203191814.45023-18-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

On 2/4/22 06:18, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   accel/tcg/tcg-accel-ops-icount.c | 1 +
>   accel/tcg/tcg-accel-ops-mttcg.c  | 1 +
>   accel/tcg/tcg-accel-ops-rr.c     | 1 +
>   accel/tcg/tcg-accel-ops.c        | 1 +
>   include/exec/exec-all.h          | 1 -
>   target/riscv/csr.c               | 1 +
>   6 files changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

