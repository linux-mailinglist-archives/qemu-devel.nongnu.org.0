Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6C63DE270
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 00:24:49 +0200 (CEST)
Received: from localhost ([::1]:56576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAgMZ-0006eJ-UE
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 18:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAgL4-0005jq-3E
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 18:23:14 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:51184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAgL1-0003oN-O9
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 18:23:13 -0400
Received: by mail-pj1-x102c.google.com with SMTP id l19so27241713pjz.0
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 15:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=MKrqpyqx/DBi1r1kDOO6sSlMKyhvTkcKJYB0AH1yfSQ=;
 b=EkzxGV5/wtFPnq6XBZ/ro91WCJeO8B76JuIiGarvX+6oy7TGPYiq6QF8KhFEZq8qfy
 MIfjGbij+9ohEtMWDyZJ4CKQKpMy2103Uvx3MrIWuVY1F5IWPx7HQPhc4ULo5Gap8q/q
 W09GWO82596cKgXRm1TDxxgbCDXZCH6yzio9YGieb6YxR0QHfYb4qKaZpFz2ch+jCm/D
 00mfWmNfNYwKCoj10TmEpmNNx4OryZ9Atqwlg48l3nn960ibyPVW1EQnUj0EZATrVMpW
 2WCR5OEkO0sFSpo5f/zTFQA0FhCSA4Rj2KwvThVbtwFZc9pXbsu7izg4gUVXCV4WZJP2
 frUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MKrqpyqx/DBi1r1kDOO6sSlMKyhvTkcKJYB0AH1yfSQ=;
 b=ZDLLIXwVlHKkUzE5qy/G/VATMPT4kh0gIgB5l0+JTzPLHS2eegthfH6Jvet3E16kPP
 ZpTRVmC2mDBTIDhZUsJDU7KuSu8xQsJmXkSAuDX1hy1AMsVMjpcTu6O9YsuRe46S2vvn
 6wxVh0uB5xXKU362i5ERHD/BW7aBdS3mu3sPTYzj02fLkwGeIiB7lsElxG+3bscNsmaL
 oLvoBLNH1a1NdsTiOAPQe/QvjFZbhCg6rragbG3KEx0jBNf/abJcPM1LICr13v73oYIG
 bSzbg5EeysNSLM9HlcSHJ1qiPbp9kBYrHuTZfZgcPfFd8p8tvgPDtamEQ8D01FxvaVEW
 oePQ==
X-Gm-Message-State: AOAM530/aPPoMJ1YwZoxJAiCbOTSFut3mefjTqepHn5Ov85prEk9E99x
 K4sOVNp7EJcjsFKQeFcEYVfG5CFOqvojXg==
X-Google-Smtp-Source: ABdhPJwxvC4Mx2c9i68bu5F4IvWW8JpBQeYE5chmhTXLqGdCRfsQjDk3LWxqV1kkcHA5nHeifuRYUQ==
X-Received: by 2002:a63:7405:: with SMTP id p5mr1730612pgc.426.1627942989915; 
 Mon, 02 Aug 2021 15:23:09 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id q19sm9297652pfk.49.2021.08.02.15.23.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 15:23:09 -0700 (PDT)
Subject: Re: [PATCH 0/2] arm: Implement M-profile trapping on division by zero
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210730151636.17254-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <98703606-f970-774f-f8ac-5bad2e67013d@linaro.org>
Date: Mon, 2 Aug 2021 12:23:05 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730151636.17254-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

On 7/30/21 5:16 AM, Peter Maydell wrote:
> Unlike A-profile, for M-profile the UDIV and SDIV insns can be
> configured to raise an exception on division by zero, using the CCR
> DIV_0_TRP bit.  This patchset implements that missing functionality
> by having the udiv and sdiv helpers raise an exception if needed.
> 
> Some questions:
> 
> Is it worth allowing A-profile to retain the mildly better codegen it
> gets from not having to pass in 'env' and marking the helper as
> no-side-effects (ie having M-specific udiv/sdiv helpers) ?

Probably not.

> Is it worth inlining either udiv or sdiv for the A-profile case?

Probably not.

>    mov_i32 tmp3,r2
>    mov_i32 tmp6,r3
>    movcond_i32 tmp3,tmp6,$0x0,$0x0,tmp3,eq
>    movcond_i32 tmp6,tmp6,$0x0,$0x1,tmp6,eq
>    mov_i32 tmp7,$0x0
>    divu2_i32 tmp3,tmp7,tmp3,tmp7,tmp6
>    mov_i32 r3,tmp3
> 
> but the x86 code is
> 0x7f5f1807dc0c:  45 33 f6                 xorl     %r14d, %r14d
> 0x7f5f1807dc0f:  45 85 ed                 testl    %r13d, %r13d
> 0x7f5f1807dc12:  45 0f 44 e6              cmovel   %r14d, %r12d


At the start of the first movcond, $0x0 is not allocated to a register, and the 
constraints allow a constant for argument 3.  Then, constraints do not allow a constant 
for argument 4 so we load $0x0 into a register.

> 0x7f5f1807dc16:  41 bf 01 00 00 00        movl     $1, %r15d
> 0x7f5f1807dc1c:  45 3b ee                 cmpl     %r14d, %r13d
> 0x7f5f1807dc1f:  45 0f 44 ef              cmovel   %r15d, %r13d

At the start of the second movcond, $0x0 is loaded into a register, so we use it.

> (Ideally of
> course it would notice that it already had generated the condition
> check and not repeat it.)

Yep.


r~

