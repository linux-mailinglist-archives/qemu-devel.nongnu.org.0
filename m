Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5A84AE393
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 23:23:59 +0100 (CET)
Received: from localhost ([::1]:55770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHYty-00022J-8Y
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 17:23:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHYoB-0005PW-Ns
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 17:17:59 -0500
Received: from [2607:f8b0:4864:20::42a] (port=41756
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHYo9-0001mG-Fx
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 17:17:59 -0500
Received: by mail-pf1-x42a.google.com with SMTP id i30so863087pfk.8
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 14:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ENJPvEO9NPOc2YFMOfLceTg4Ax+7MYoM5+kSll0k7Kc=;
 b=DyfN/cha5cVytbjEF26n3EK+H9CeSBiCmdkv4wbo/DzP4akF/oaKfhNSjnOUO5tvkR
 rCUcGX2qpMg7O86h3x9aWYkQ3cBMf3bwG4Q9Tx7yIFw4FIh5ufw1OFxj8GcJvTAmhucY
 ZItgbZmSTQulCek7xVXJbj0epot1Ug9lU+vEeXAiNQIrNtUwNSPd9IS4wxqYyED3v5KA
 24HFu4MYl+NLHtrHbd/qda4IyhX3bD/tSvG2/WAQ34E1awABh9VbMEpB0qxfYdOM67CB
 2WRGYUs20X5wg1+d0pwYeg+RUw3fBm3PyWfsF/8HntahfuygF8fni+WMBVH9e2ds6ZUJ
 F11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ENJPvEO9NPOc2YFMOfLceTg4Ax+7MYoM5+kSll0k7Kc=;
 b=Fb/WsThXuzBmMrvYIFDc70aZXllnz6Fkofq2K8u9UH+3HH8IgZu/9yTbC09P1ggHF6
 fsjkRTy052zOLWOy8LPDr3EuspUfSspuYlW79Xz+Csb5uVb0SgSe1Ysqjgyx5n/D3+7N
 Lg9FdgWpsSCqICMdE75O5lZ39O1QppmmBH+qGbxFBZL4LJbpA5o1bcl0hB7CII0HSqR0
 qcw0XKlOr7s04KPSQz9sCygJa6z9TL4oPg2Ad2a6+Tkaf7/FGx8EG8sfwIWn9YH8SCLk
 hL1yiUpvRXD+8lpNXtkJ9qVuyCUL2xJk8Fh9QQmE22Xyh8bK5A/33ujVEOm0aDr6sal8
 CA0g==
X-Gm-Message-State: AOAM533yAf+k6mvQjezzaPEyyH3/YJLE77ey52nzkMqq2hVO+oLLROxk
 BR3pXXh6w3h2VYrh8eO5ZZpOEg==
X-Google-Smtp-Source: ABdhPJzsWP9qp3QwFjOntr4EhLKI89tWMGHLjc3oY4C9pR67MG12ZIlzc6eCqonCZkHHIRkgv96g3w==
X-Received: by 2002:aa7:8055:: with SMTP id y21mr6309772pfm.62.1644358670814; 
 Tue, 08 Feb 2022 14:17:50 -0800 (PST)
Received: from [192.168.1.118] (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id d15sm16512450pfu.127.2022.02.08.14.17.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 14:17:50 -0800 (PST)
Message-ID: <561ff00f-c029-e8a6-5818-7d6f5d29b599@linaro.org>
Date: Wed, 9 Feb 2022 09:17:46 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 06/13] cpu: Add missing 'exec/exec-all.h' and
 ''exec/exec-all.h'' headers
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220208152243.16452-1-f4bug@amsat.org>
 <20220208152243.16452-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220208152243.16452-7-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

On 2/9/22 02:22, Philippe Mathieu-Daudé wrote:
> cpu.c requires "exec/exec-all.h" to call tlb_flush() and
> "qemu/accel.h" to call accel_cpu_realizefn().
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   cpu.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/cpu.c b/cpu.c
> index 834e2b4cdb..a728f3e762 100644
> --- a/cpu.c
> +++ b/cpu.c
> @@ -35,10 +35,12 @@
>   #include "sysemu/tcg.h"
>   #include "sysemu/kvm.h"
>   #include "sysemu/replay.h"
> +#include "exec/exec-all.h"
>   #include "exec/translate-all.h"
>   #include "exec/log.h"
>   #include "hw/core/accel-cpu.h"
>   #include "trace/trace-root.h"
> +#include "qemu/accel.h"

Duplicate exec-all.h in subject.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

