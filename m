Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 054B0415077
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 21:26:45 +0200 (CEST)
Received: from localhost ([::1]:33680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT7tD-0003fc-RW
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 15:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mT7HX-0005uJ-No
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:47:47 -0400
Received: from [115.28.160.31] (port=40898 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mT7HU-00047w-OM
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:47:47 -0400
Received: from [192.168.9.172] (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 74CED63412;
 Thu, 23 Sep 2021 02:47:38 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632336458; bh=DlC3w/QanuZBN72fgur5lRkW0fh6lHQRQR0WdNelm/Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nmaqMcexLJ5u06quJ2fwXrgOFC0Usm+yAPW7qz05DkKZDcbj0kXk6il1/rhO70bwm
 BKaAPo7Puh4lVWIrP7uJVyAiW6NlMmF8d6ATAE3UW+uGQBfOHem4K/Sx2a9Hcpldfa
 PlXcmf8m0r2eCd+id7KmRMawjltYBIIkvH2iKQ8E=
Message-ID: <273478e1-7c02-f971-e78e-a383a25f54f1@xen0n.name>
Date: Thu, 23 Sep 2021 02:47:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH v3 03/30] tcg/loongarch64: Add the tcg-target.h file
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210922180927.666273-1-git@xen0n.name>
 <20210922180927.666273-4-git@xen0n.name>
 <5023a346-3d9e-104f-d51f-bf9815f720af@amsat.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <5023a346-3d9e-104f-d51f-bf9815f720af@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On 9/23/21 02:34, Philippe Mathieu-Daudé wrote:
> On 9/22/21 20:09, WANG Xuerui wrote:
>> Support for all optional TCG ops are initially marked disabled; the bits
>> are to be set in individual commits later.
>>
>> Signed-off-by: WANG Xuerui <git@xen0n.name>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/loongarch64/tcg-target.h | 180 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 180 insertions(+)
>>   create mode 100644 tcg/loongarch64/tcg-target.h
>>
>> diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
>> new file mode 100644
>> index 0000000000..0fd9b61e6d
>> --- /dev/null
>> +++ b/tcg/loongarch64/tcg-target.h
>> @@ -0,0 +1,180 @@
>> +/*
>> + * Tiny Code Generator for QEMU
>> + *
>> + * Copyright (c) 2021 WANG Xuerui <git@xen0n.name>
>> + *
>> + * Based on tcg/riscv/tcg-target.h
>> + *
>> + * Copyright (c) 2018 SiFive, Inc
>
> I thought you could drop this line.
That's the original file's copyright line, and I always thought dropping 
it in derivative files wouldn't be nice?
>
>> + *
>> + * Permission is hereby granted, free of charge, to any person 
>> obtaining a copy
>> + * of this software and associated documentation files (the 
>> "Software"), to deal
>> + * in the Software without restriction, including without limitation 
>> the rights
>> + * to use, copy, modify, merge, publish, distribute, sublicense, 
>> and/or sell
>> + * copies of the Software, and to permit persons to whom the 
>> Software is
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be 
>> included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
>> EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
>> MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT 
>> SHALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES 
>> OR OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
>> ARISING FROM,
>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
>> DEALINGS IN
>> + * THE SOFTWARE.
>> + */
>> +
>> +#ifndef LOONGARCH_TCG_TARGET_H
>> +#define LOONGARCH_TCG_TARGET_H
>> +
>> +/*
>> + * Loongson removed the (incomplete) 32-bit support from kernel and 
>> toolchain
>> + * for the initial upstreaming of this architecture, so don't bother 
>> and just
>> + * support the LP64 ABI for now.
>> + */
>> +#if defined(__loongarch64)
>> +# define TCG_TARGET_REG_BITS 64
>> +#else
>> +# error unsupported LoongArch register size
>> +#endif
>> +
>> +#define TCG_TARGET_INSN_UNIT_SIZE 4
>> +#define TCG_TARGET_NB_REGS 32
>> +#define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
>
> Is this SIZE_MAX?

I just did a quick grep across the tcg ports and found little similarity 
so far...

     aarch64      (2 * GiB)
     arm          UINT32_MAX
     i386         (2 * GiB)
     i386         UINT32_MAX
     loongarch64  ((size_t)-1)
     mips         (128 * MiB)
     ppc          (2 * GiB)
     ppc          (32 * MiB)
     riscv        ((size_t)-1)
     s390         (3 * GiB)
     sparc        (2 * GiB)
     tci          ((size_t)-1)

In that case, I think maybe SIZE_MAX would indeed be better for 
readability, so I'm going to change that...

>
>> +
>> +typedef enum {
>> +    TCG_REG_ZERO,
>> +    TCG_REG_RA,
>> +    TCG_REG_TP,
>> +    TCG_REG_SP,
>> +    TCG_REG_A0,
>> +    TCG_REG_A1,
>> +    TCG_REG_A2,
>> +    TCG_REG_A3,
>> +    TCG_REG_A4,
>> +    TCG_REG_A5,
>> +    TCG_REG_A6,
>> +    TCG_REG_A7,
>> +    TCG_REG_T0,
>> +    TCG_REG_T1,
>> +    TCG_REG_T2,
>> +    TCG_REG_T3,
>> +    TCG_REG_T4,
>> +    TCG_REG_T5,
>> +    TCG_REG_T6,
>> +    TCG_REG_T7,
>> +    TCG_REG_T8,
>> +    TCG_REG_RESERVED,
>> +    TCG_REG_S9,
>> +    TCG_REG_S0,
>> +    TCG_REG_S1,
>> +    TCG_REG_S2,
>> +    TCG_REG_S3,
>> +    TCG_REG_S4,
>> +    TCG_REG_S5,
>> +    TCG_REG_S6,
>> +    TCG_REG_S7,
>> +    TCG_REG_S8,
>
> Here could go:
>
>        TCG_TARGET_NB_REGS,
Good idea, something no other TCG ports has done... maybe we could 
refactor them all to avoid a little redundancy. I'll do this in v4.
>
>> +
>> +    /* aliases */
>> +    TCG_AREG0    = TCG_REG_S0,
>> +    TCG_REG_TMP0 = TCG_REG_T8,
>> +    TCG_REG_TMP1 = TCG_REG_T7,
>> +    TCG_REG_TMP2 = TCG_REG_T6,
>> +} TCGReg;
>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

