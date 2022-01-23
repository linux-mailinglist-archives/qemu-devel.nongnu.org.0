Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9A74975C5
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Jan 2022 22:43:45 +0100 (CET)
Received: from localhost ([::1]:33346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBkeG-0002ea-L5
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 16:43:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBkbR-0000Ic-Nz
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 16:40:50 -0500
Received: from [2607:f8b0:4864:20::52c] (port=39690
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBkbQ-0000fh-8o
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 16:40:49 -0500
Received: by mail-pg1-x52c.google.com with SMTP id j10so1276094pgc.6
 for <qemu-devel@nongnu.org>; Sun, 23 Jan 2022 13:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M9Gsmo8dbiOGymB1DCOFEonJzeZo7nZ9NRmKTwhcdwg=;
 b=XkXNqmaOEvCK6Q8PoFX06UOeBWyNeNCvzfhKrCUBkvf3rCtktzvXHA9JbNuLPb83b2
 9JSa5fi7qThdJQ3GE4RVTHXB0LYy6G/TyznLXmGsdk30uQml3CtfbpXWEF1bZYHCyNMx
 yjn2R1286hztjU4TiWimWBlmMHbzAS9YjeBpz0MDZbX94Buyx2eqd9i0EyHV4d7ceXqe
 FTaV5fkvdIp5p7xqL7v0FIS0R8IAknWJLyLztKSlJqLXAnoBfK9yLCKQpjvXvevn00iz
 NOj2/gBJsPYiW/VSbvb7bKN4QGO5bAZl8MbH0glpgDC7FPHfQQ+h4sfG6ioNssbPtGPZ
 /EAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M9Gsmo8dbiOGymB1DCOFEonJzeZo7nZ9NRmKTwhcdwg=;
 b=shLe8J+nWBJOSCKcltD4M+DpAW/OCz0Dyy5T2Pivl+U/e4MDTI/nUNpNTEu+BAwpiF
 Z3TgSikpTn62j+80AKtHIUFx8f1xqbeBHBepKVSaxK4cbkv8gIkhQcYswuMOQ8gnra80
 /0T08ge9iWtdVPusSe5xKSe99VpaWo+KuNnvtIgw1kFnJQKEeM2Kg67D7tjzkxUfP9KC
 9pEwwFJoUHyEVfFbtXRJ13oxd9MrXjXW4q/6mBTzaoeDQ0joxmkJugdZJYL+d7sLmCq9
 jHRY3SR9m+jrNrUSTXxqwFgw2vyrVkC6XCS8FmQMkXTbg0JSULAX+yJn9k2ACNQmaknB
 HV7w==
X-Gm-Message-State: AOAM532E7fot+lkt5qOpNt4OmczvoHKSbC8IgBYug8P6puzqAr3zq5h6
 /NYS5CJSOQio1Sbx0HOIwn37/evQ0JyMpWiu
X-Google-Smtp-Source: ABdhPJz7NfXiUu7/HM4MY2U0fV5vpkrJDYxUBNInbCSJIU+8oKI6i2U/9aUxBS13sT7LTJ00o43UxA==
X-Received: by 2002:a62:6415:0:b0:4c6:fe2f:6a94 with SMTP id
 y21-20020a626415000000b004c6fe2f6a94mr11936074pfb.25.1642974043843; 
 Sun, 23 Jan 2022 13:40:43 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id n2sm10110160pga.39.2022.01.23.13.40.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jan 2022 13:40:43 -0800 (PST)
Subject: Re: [PATCH 05/30] bsd-user/arm/arget_arch_cpu.h: Move EXCP_DEBUG and
 EXCP_BKPT together
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-6-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6e5e5d4b-83a6-0c48-59a0-7c67194bcfa3@linaro.org>
Date: Mon, 24 Jan 2022 08:40:39 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220109161923.85683-6-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/22 3:18 AM, Warner Losh wrote:
> Implement EXCP_DEBUG and EXCP_BKPT the same, as is done in
> linux-user. The prior adjustment of register 15 isn't needed, so remove
> that. Remove a redunant comment (that code in FreeBSD never handled
> break points).
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/target_arch_cpu.h | 23 +++--------------------
>   1 file changed, 3 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

