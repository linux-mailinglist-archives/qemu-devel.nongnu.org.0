Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DBB6C15EE
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 15:59:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peGxx-0002WQ-LM; Mon, 20 Mar 2023 10:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peGxv-0002W9-G4
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 10:58:27 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peGxt-0005dD-UB
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 10:58:27 -0400
Received: by mail-wr1-x433.google.com with SMTP id m2so10648815wrh.6
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 07:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679324304;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9Y8jqeBoDflUXIsGserNUU5WVAYVN0zvJCXYkdk+DVo=;
 b=jhvX9zLba5dj7Lp2VEMLX1o+/4QzGlnlrAWJCjTJ2NfMVKk6viXUnMZWpa5Dz1Kjyp
 I5daL5g+XHWPKQ0cDdoYO+wbwnxchFeslmH6FbSv+sZdL7ZlWYxBWXntmzJVpSd91NE0
 8rYhErt7fPebW4jbOjn3sv/5Dop6N1hf+sggIqfWc9Le9jIsPRZjc5Spt9+9vJzVNjXo
 VzSTglnnYvyAfTCwS+SIP0k35MJWefsVfufEVt/CY3IPvrD3X2Cyebro9yaRQFA5yfR1
 sGPSpjVzDcko9agRR8yHIuO3gFId9rPlgRxiAI7laXjYT5wtBl0cCfU6/8WJDMymohs8
 xjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679324304;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9Y8jqeBoDflUXIsGserNUU5WVAYVN0zvJCXYkdk+DVo=;
 b=oCkzIvgXv0HfdtKZFhAlqrWd/v117nChWgK/3AUUsh/pe1DHHu6cfsafWolhf5Zol+
 Vmls9RRe9pK5hEFls19Dq2mR85OCHVbzTFDFsgbS32kDsEsSK/G4yF/DFKPxhYAuxC8f
 b8Qrez/WFRAVUPp2hlR0Tjr34FyzF5v3FDClzwcquQ18mCNLDGp2i8te6wL0jeOEq9WV
 77YCqItFnFzAg1f2+sHhuCaHJ8SoB6jCO9LxifCR6yrIDucYlQwObuJf20WNOIpmMGN3
 KbmuyWCryfUW9boUcE12CtYBiGx0yBZoznMIirmZgMGqwyrNv49wmbVJSS7UGYN/bW/y
 CxXw==
X-Gm-Message-State: AO0yUKXmDADa7Y6Yv2LG/wk7xsPIf4wurS2v8kZmfeO5/Lt+ApZKXvfK
 fu0tO4FTzzf2e5/dOMVa6u1Xdw==
X-Google-Smtp-Source: AK7set+GG8R0Z3vlYiep7TXBwJ7ne2Ry6ZGeRtAGGWf+2ub4TSOuIWVts/RkQJ6EkeY48AKRqYzarQ==
X-Received: by 2002:adf:eec6:0:b0:2cf:e0bc:9639 with SMTP id
 a6-20020adfeec6000000b002cfe0bc9639mr13861058wrp.37.1679324304273; 
 Mon, 20 Mar 2023 07:58:24 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j1-20020a5d4481000000b002d2033ec465sm9120770wrq.36.2023.03.20.07.58.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 07:58:23 -0700 (PDT)
Message-ID: <f327f4b1-4da9-74b9-127e-9c03ad47c0bf@linaro.org>
Date: Mon, 20 Mar 2023 15:58:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 09/10] accel/tcg: re-inline the filtering of virtual IRQs
 but data driven
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Alessandro Di Federico <ale@rev.ng>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
 <20230320101035.2214196-10-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230320101035.2214196-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 20/3/23 11:10, Alex Bennée wrote:
> Although only I386 currently uses it it is not inconceivable that
> other arches might find this facility useful.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/hw/core/tcg-cpu-ops.h |  5 +++++
>   accel/tcg/cpu-exec.c          | 29 +++++++++--------------------
>   target/i386/tcg/tcg-cpu.c     |  1 +
>   3 files changed, 15 insertions(+), 20 deletions(-)
> 
> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
> index 66c0cecdde..8e8df8c330 100644
> --- a/include/hw/core/tcg-cpu-ops.h
> +++ b/include/hw/core/tcg-cpu-ops.h
> @@ -121,6 +121,11 @@ struct TCGCPUOps {
>        */
>       bool (*io_recompile_replay_branch)(CPUState *cpu,
>                                          const TranslationBlock *tb);
> +    /**
> +     * @virtual_interrupts: IRQs that can be ignored for replay purposes
> +     */
> +    int virtual_interrupts;

Maybe rename as "virtual_interrupts_mask" and use 'unsigned' type?

