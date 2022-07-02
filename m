Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADE656409F
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 16:08:36 +0200 (CEST)
Received: from localhost ([::1]:49188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7dnX-0007CX-Kv
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 10:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7dgB-0004ec-8j
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 10:01:00 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:52848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7dg9-0001Ef-F6
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 10:00:58 -0400
Received: by mail-pj1-x1031.google.com with SMTP id g7so5211017pjj.2
 for <qemu-devel@nongnu.org>; Sat, 02 Jul 2022 07:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=1JuR33BzYqyr6+KeHpsJC16sqyi/shf227lMYu09cj8=;
 b=glUC1gwLD5JxgLW3rZFWAOWD/kk9BrUAyIDp418U9SIZkkYytPVpoRdLLaDB+AoAYj
 KkY5fY3m15D3WpudQznxFoObf77PZ+34FmE8+EEzgUn53aK542TTt3q8T4d6eBRpBTrV
 p2mxk6wF5hMLJ+VNMjcA041E2YIPQytoypqGG+rX8nAL0JCOeFn6XQg2l4+xSCkPBkQf
 IACsJhjR328kz80DC2q2syGvQL1FRNvQDqOq9xTBhvxAB98KLDnfHDPF+h5UvcxRsHkP
 tZtkzJyO5Ivqdryaqjzn7ubEFy80+4EfRsu+MFl+m/3Yhh7DfSLoih8/luixeWeeQgkg
 ThGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1JuR33BzYqyr6+KeHpsJC16sqyi/shf227lMYu09cj8=;
 b=Sm7PLAGP4nij0+kYTdmCiUzz2vN5TEuyHIeUfK0IalQJwLSSEmZMlxil1j20sh9orX
 56+VN/M28l/RXMfyLZyVNK4IbxHO6mwec4y005UAH7PSRpOjxFi7dmtc5GIyEWozInCY
 d7y9IAtOhDgRtkIi5SVlPVCaWA39UBegAeBtmgvrOPVMmcvUEWe/gMmln4B2B6zius6v
 b1Fix6g6Od1iHsu2xuX8Cq1LgAAGsTTLHJHW6DUSJYjbDbaLhUfdKcUWADuQXJh/+8to
 Te2xis93Wd/+/oGKYcwpbLVSg6pJqMGU/qooToCoViKxQ7s3uwPuWGayLpDwbD9St8Px
 dIJA==
X-Gm-Message-State: AJIora/TrLAqH2x2GFGkdftN2ES9BEiIAgISuQBkTMtO76ZyRhv6B6G2
 z77JpczftjFqJGMXTtj8qXYMfg==
X-Google-Smtp-Source: AGRyM1vpDavPyUhf4C4oYysUPhW5DAxxBZLEPNrabCl6jX1ATxR9x8dx8NYWS7T4T9p6PrbCn3vscQ==
X-Received: by 2002:a17:90b:3ec7:b0:1ed:ded:abd1 with SMTP id
 rm7-20020a17090b3ec700b001ed0dedabd1mr22414420pjb.56.1656770455934; 
 Sat, 02 Jul 2022 07:00:55 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 a25-20020aa79719000000b0052551c1a413sm17793142pfg.204.2022.07.02.07.00.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jul 2022 07:00:54 -0700 (PDT)
Message-ID: <621fa4a0-27d3-1ca3-3e23-71dc6c4408d9@linaro.org>
Date: Sat, 2 Jul 2022 19:30:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/5] target/arm: Suppress debug exceptions when OS Lock set
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220630194116.3438513-1-peter.maydell@linaro.org>
 <20220630194116.3438513-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220630194116.3438513-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

On 7/1/22 01:11, Peter Maydell wrote:
> The "OS Lock" in the Arm debug architecture is a way for software
> to suppress debug exceptions while it is trying to power down
> a CPU and save the state of the breakpoint and watchpoint
> registers. In QEMU we implemented the support for writing
> the OS Lock bit via OSLAR_EL1 and reading it via OSLSR_EL1,
> but didn't implement the actual behaviour.
> 
> The required behaviour with the OS Lock set is:
>   * debug exceptions (apart from BKPT insns) are suppressed
>   * some MDSCR_EL1 bits allow write access to the corresponding
>     EDSCR external debug status register that they shadow
>     (we can ignore this because we don't implement external debug)
>   * similarly with the OSECCR_EL1 which shadows the EDECCR
>     (but we don't implement OSECCR_EL1 anyway)
> 
> Implement the missing behaviour of suppressing debug
> exceptions.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/debug_helper.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

