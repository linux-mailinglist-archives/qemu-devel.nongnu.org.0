Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8930A4AAD07
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 00:28:31 +0100 (CET)
Received: from localhost ([::1]:49354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGUTm-0002xD-D6
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 18:28:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUS8-0001iW-FD
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:26:48 -0500
Received: from [2607:f8b0:4864:20::62f] (port=46940
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUS7-0002fn-0d
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:26:48 -0500
Received: by mail-pl1-x62f.google.com with SMTP id t9so6091530plg.13
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 15:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mXPS4mRkVfO/LTE16Dj/HAKe6V3Q4L/fdxhLc8z6FGs=;
 b=qsRFSTYKdzIFBghuCO8mKpZJwWuuuugVgyFyMpRzunSF55YJfmwalgFYAKRqbfOShZ
 b6z1lfp3iaAuz4JO1lbwxCCIe9xiXujdD28Xqblb/bO4sno0SwK5qbNhX4P8F9SrVKw+
 mw08GTfBeUFmie1Meg5qWscDHXAAUPCyV9m1331iM1IH48fEU54I/JNwbMC1menq26gY
 L7xKz027JRIDW1k18NtjICg0zNn92aNKBlL9cKpQRmgqr2XX+ZaOwuYlqgsg0UAks5e3
 taA45Fu7h1L5CpLca6vKdUKHGju3m943KP+lpXxIJjZmuWoDg9LopYb/hnUyeZ6ls+xw
 ENWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mXPS4mRkVfO/LTE16Dj/HAKe6V3Q4L/fdxhLc8z6FGs=;
 b=ie+0exGVnQ6dRpPFrkJyhGgoRCAEdKJzsZ+ui0YqkGXo8iohhlqHIII8pDQr/ZyKU7
 +YVB3fzanLZK5apH1INRfihxAZTR4FBsK/R/4t2jCj3BzyEzHfMgLy2fTMx1yhKhFimv
 Yi6zIMdumj/Tr27pA4xIhvbflCvPuI9cJ92CxoQfAKs1Y6EGa96hLZg4cxxa6KY9qOx6
 juwRi0r8aNGpCUErsjC//c4z2CF1ndgqgh0IIBBbizp2KMMCIYevC/4UWStojBCqs/kR
 +4OfdZqU8OBL7wn7L7aQPvopskUoFR18NRYoGjLsIDNcnG/3g79cmjQ7MdLh3/2YSbKm
 PQDg==
X-Gm-Message-State: AOAM533Jc4FjFk1MdZwfVri44ZR70oxym39hdf7BkP/T3oyuyktUFvMK
 bjwODHelJyWdQfv9ajnabXnfvA==
X-Google-Smtp-Source: ABdhPJz8Y1lnIaWhG8JlgNdkj75alOHmUzoCUhAYEnJ//qwIYNbmhRWhQ6fzUesYL8eHGVxJ6+zg/Q==
X-Received: by 2002:a17:90b:4c0c:: with SMTP id
 na12mr10668510pjb.140.1644103605796; 
 Sat, 05 Feb 2022 15:26:45 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id g17sm7088147pfj.148.2022.02.05.15.26.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 15:26:45 -0800 (PST)
Message-ID: <ab3856b7-a75d-4f97-7ad0-87bd93ef3d4b@linaro.org>
Date: Sun, 6 Feb 2022 10:26:41 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 14/21] softmmu/physmem: Remove unnecessary include
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203191814.45023-1-f4bug@amsat.org>
 <20220203191814.45023-15-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220203191814.45023-15-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   softmmu/physmem.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index eb4b3bcae7..09951c0996 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -60,7 +60,6 @@
>   
>   #include "exec/memory-internal.h"
>   #include "exec/ram_addr.h"
> -#include "exec/log.h"
>   
>   #include "qemu/pmem.h"
>   

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

