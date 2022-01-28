Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D82D49F1B3
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 04:14:01 +0100 (CET)
Received: from localhost ([::1]:48106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDHi4-0001Ou-0W
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 22:14:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDHgL-0007aG-LH
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:12:13 -0500
Received: from [2607:f8b0:4864:20::62b] (port=42733
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDHgK-0006nE-3t
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:12:13 -0500
Received: by mail-pl1-x62b.google.com with SMTP id i1so4606609pla.9
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 19:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Q75phySsGtxd9QnzfTnWdDBiB9wfLlzN3qw40EZsVto=;
 b=yxy94r5LYqr4TKCmTaJ9s72InXt0Ld3FTkp0Ux/lDZNnVWm4/6hV2q1sbreoziPosu
 afCCXr7X5rPomo9TVQqc7BI4781tpgtUUCBqG+aUxM9IuJwLBCPrqKxtsfTuUFmAtl8F
 JJcniPe3gcee0IFv7wM03Gaaj1lwsFDskn/5LZdFWfdnds/jpyKNtcjEQUFVB7XTOI/n
 6AEEQwAfm0gr/VnHl2tn1bSRLsgX14gbPr+Xgs3IPsqa+ZPcqtV8VMgFlafbv5ePVex/
 csi5rau1bb+bK4FVvxKkrwLsDhs2KLkUXBmXa4VhmZWCVxAxm6hNGyjGcrva/MVsXfKq
 hfLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Q75phySsGtxd9QnzfTnWdDBiB9wfLlzN3qw40EZsVto=;
 b=OKcdmVCmkimAE0ZZtsnWv2sqbkhtdgwvpotJEFlftvFnMO+6qsCbPrT2rGUKFyo+ix
 bWxFvISlPpLlQu5ObpanA40O+gyEopEmW3spjHTKO0eaHfDSMun9PGIZzx+GZjfawN+E
 gVbhqKbwNq1mIt116EvuPfEklBQzvGXSxwiA1UoAOLqZAkXc2schUyasyOwc7wDb2oUN
 p+ZZ/ZoVZzWOG4fH+oW3U3now4pPwSlnHJ8LtpdaurYwYUQW015Fzls3IiHk+WPfhMsj
 pIuS2K6xt934s4UpuUAuoKKmA2urr4dL/8B7kIHg9F1ECjcP16E2wfvWFTAZhBJ43Jdh
 Qg0w==
X-Gm-Message-State: AOAM532pJgQZaRwp6qqpFBvp7dBkfSAzRTH38lOTJ8yVsIzSpQUf+kV5
 McPOwLOM6qF1AYtU14hHEeRQ5hQO6nflNxB/
X-Google-Smtp-Source: ABdhPJwAHzO8dzLgy7/bFSH/SkwJLb9SwpuA4JDKagjq9gwTnhdsc3AKCa9RUQ8utsMMcdUJgCk2zQ==
X-Received: by 2002:a17:90b:2281:: with SMTP id
 kx1mr7596563pjb.60.1643339530767; 
 Thu, 27 Jan 2022 19:12:10 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id z13sm3938486pfh.45.2022.01.27.19.12.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 19:12:10 -0800 (PST)
Message-ID: <540229ae-75ca-d492-a045-cc20ddfe49fb@linaro.org>
Date: Fri, 28 Jan 2022 14:12:05 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 03/14] hw/intc/arm_gicv3: Initialise dma_as in GIC, not ITS
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220122182444.724087-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/23/22 05:24, Peter Maydell wrote:
> In our implementation, all ITSes connected to a GIC share a single
> AddressSpace, which we keep in the GICv3State::dma_as field and
> initialized based on the GIC's 'sysmem' property. The right place
> to set it up by calling address_space_init() is therefore in the
> GIC's realize method, not the ITS's realize.
> 
> This fixes a theoretical bug where QEMU hangs on startup if the board
> model creates two ITSes connected to the same GIC -- we would call
> address_space_init() twice on the same AddressSpace*, which creates
> an infinite loop in the QTAILQ that softmmu/memory.c uses to store
> its list of AddressSpaces and causes any subsequent attempt to
> iterate through that list to loop forever.  There aren't any board
> models like that in the tree at the moment, though.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_common.c | 5 +++++
>   hw/intc/arm_gicv3_its.c    | 3 ---
>   2 files changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

