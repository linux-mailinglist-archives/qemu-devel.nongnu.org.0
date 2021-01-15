Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EB32F8889
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 23:41:07 +0100 (CET)
Received: from localhost ([::1]:42206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0XmE-0008Pb-82
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 17:41:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0XkZ-0007k6-Iv
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:39:23 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:36303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0XkX-0002La-Jt
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:39:23 -0500
Received: by mail-pj1-x102f.google.com with SMTP id l23so6054462pjg.1
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 14:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lCs2ElSylpYWIAZD926fny58Wtat9hgDyJ7eEZwOWoM=;
 b=Jj7j7FRWIUb4mvbjstDjl8apMp+qwyDa5XbQoSoxD6Nct7g1zDbCaO/okRzzL+dJ4f
 8vknxKqxAbAyyAP16lNnmUoN9KH69VlbpA4wl31ZwGTiSAZxJGZQ8gZoNL30XMHZ41si
 QBBErQM1u3GKQAxO2lkUOjHqNKCQUB3eKyRoJVmqmWiokJCx7IkjN6fyHHJ56P1ZS07F
 uIizu94f6qzfKNKeOX4d17WE1QAIXDEBWsFtwffZobnDzYRS57caLF6vxQUIN+8A5Zz0
 DAmAcVxJYOT08+SkmZMKEXwaSrnEFYmTQA+YqYmBC0gctwuX0PZXPEKynfgoaWjAovI7
 efmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lCs2ElSylpYWIAZD926fny58Wtat9hgDyJ7eEZwOWoM=;
 b=Pf+qyN84nctQ20UYnOvBQSWxa/jtHS1sMf9EvYi5mKtM/+a+ITMzOB/eyjo7EZ3h2B
 ft8t6lJjSngsbzBCCQXd10XYDK+2qhBhovyraZNh1kh8R4l5j9vGu7clklmHQAQw468u
 2fwwOKPWrBHK5v24rDpz2cmjuMNVpLsIf7mhCQ3rSjEGOXKFmOeJj8M9BAVNZriGCCU3
 2lultssy0y/RWiipQoIvaAkUG5kwOnwlEWHWjG06v/oHohlQ0Ba2we5dLDe4Z9YtU4F7
 25xB6gA+DVMmOWVFHlvjcyqs9E0Giz43yYHMODdezSbZ6gDo1HTEcKkIMzQQ/uPckxNZ
 3Mdg==
X-Gm-Message-State: AOAM530Rjxgo3SQx5tTaQjJn9S6/RXyHM4L6O+U2Q3eGWfgkJ0E4plA7
 Xjwt3nZEnYFfwHVXv2ceFOYKkwLCg4R5H1dM
X-Google-Smtp-Source: ABdhPJw7rqX7LZI0/GkcFWaRpWSM7cZcem2znce/s+PXrpi3phPWZ30V5bHzjtNnLCkv2nKfj9FIZA==
X-Received: by 2002:a17:90a:a382:: with SMTP id
 x2mr13176304pjp.178.1610750360069; 
 Fri, 15 Jan 2021 14:39:20 -0800 (PST)
Received: from [10.25.18.3] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id o32sm10129812pgm.10.2021.01.15.14.39.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 14:39:19 -0800 (PST)
Subject: Re: [PATCH v2 09/22] tcg/riscv: Split out target constraints to
 tcg-target-con-str.h
To: Alistair Francis <alistair23@gmail.com>
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-10-richard.henderson@linaro.org>
 <CAKmqyKN5CXyHTE22rB+TA57UxZbT1pD7f9QJLyWXyZ11crg1fA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f570dced-94f2-4c5e-1bcd-6e35c99d1dd8@linaro.org>
Date: Fri, 15 Jan 2021 12:39:16 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKN5CXyHTE22rB+TA57UxZbT1pD7f9QJLyWXyZ11crg1fA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/15/21 12:13 PM, Alistair Francis wrote:
> On Fri, Jan 15, 2021 at 1:09 PM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  tcg/riscv/tcg-target-con-str.h | 21 ++++++++++++++
>>  tcg/riscv/tcg-target.h         |  1 +
>>  tcg/riscv/tcg-target.c.inc     | 50 ++++++++--------------------------
>>  3 files changed, 33 insertions(+), 39 deletions(-)
>>  create mode 100644 tcg/riscv/tcg-target-con-str.h
>>
>> diff --git a/tcg/riscv/tcg-target-con-str.h b/tcg/riscv/tcg-target-con-str.h
>> new file mode 100644
>> index 0000000000..587fcd3593
>> --- /dev/null
>> +++ b/tcg/riscv/tcg-target-con-str.h
>> @@ -0,0 +1,21 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Define RISC-V target-specific operand constraints.
>> + * Copyright (c) 2021 Linaro
>> + */
>> +
>> +/*
>> + * Define constraint letters for register sets:
>> + * REGS(letter, register_mask)
>> + */
>> +REGS('r', ALL_GENERAL_REGS)
>> +REGS('L', ALL_QLDST_REGS)
>> +
>> +/*
>> + * Define constraint letters for constants:
>> + * CONST(letter, TCG_CT_CONST_* bit set)
>> + */
>> +CONST('I', TCG_CT_CONST_S12)
>> +CONST('N', TCG_CT_CONST_N12)
>> +CONST('M', TCG_CT_CONST_M12)
>> +CONST('Z', TCG_CT_CONST_ZERO)
>> diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
>> index 727c8df418..daf3ef7b5c 100644
>> --- a/tcg/riscv/tcg-target.h
>> +++ b/tcg/riscv/tcg-target.h
>> @@ -171,5 +171,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
>>  #define TCG_TARGET_NEED_POOL_LABELS
>>
>>  #define TCG_TARGET_HAS_MEMORY_BSWAP 0
>> +#define TCG_TARGET_CON_STR_H
>>
>>  #endif
>> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
>> index 71c0badc02..185b569f4b 100644
>> --- a/tcg/riscv/tcg-target.c.inc
>> +++ b/tcg/riscv/tcg-target.c.inc
>> @@ -122,6 +122,17 @@ static const int tcg_target_call_oarg_regs[] = {
>>  #define TCG_CT_CONST_N12   0x400
>>  #define TCG_CT_CONST_M12   0x800
>>
>> +#define ALL_GENERAL_REGS  0xffffffffu
>> +#ifdef CONFIG_SOFTMMU
>> +#define ALL_QLDST_REGS \
>> +    (ALL_GENERAL_REGS & ~((1 << TCG_REG_A0) | (1 << TCG_REG_A1) | \
>> +                          (1 << TCG_REG_A2) | (1 << TCG_REG_A3) | \
>> +                          (1 << TCG_REG_A5)))
> 
> Why is this not TCG_REG_A4?

Typo, thanks.


r~

