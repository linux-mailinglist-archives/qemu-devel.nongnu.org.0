Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A520411A0C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 18:45:11 +0200 (CEST)
Received: from localhost ([::1]:41272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSMPk-00073l-Sb
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 12:45:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mSM7r-0002d8-LX
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:26:39 -0400
Received: from [115.28.160.31] (port=40292 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mSM7o-0006ib-7m
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:26:39 -0400
Received: from [192.168.9.172] (unknown [101.88.25.142])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 1BBEA600FF;
 Tue, 21 Sep 2021 00:20:44 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632154844; bh=vofcx4B2MHYTu0PNvg0LN14bFdQj/7wolfvhBWkiT38=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=kw09b0nun4KbRBsrOieFy1wdJXU0bbStWcR+/UQjqSU7aRWkN+MDTXDTapudc4TPR
 g9iE2R/p4+XtpXIJlUutl7fyArHjdvUUsSZcgco7yGHHzZ7VExnV83QsfpJSBOQxO/
 Efv6FHzaZLuRJhkgBwwX2siOC6OHQEX3QqWXpEe8=
Message-ID: <c43cba8a-0b05-a2f2-9537-a38bccf57c87@xen0n.name>
Date: Tue, 21 Sep 2021 00:20:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH 03/30] tcg/loongarch: Add the tcg-target.h file
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-4-git@xen0n.name>
 <c5104c22-e09f-d8b9-3429-fec2c52a7494@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <c5104c22-e09f-d8b9-3429-fec2c52a7494@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 9/20/21 22:23, Richard Henderson wrote:
> On 9/20/21 1:04 AM, WANG Xuerui wrote:
>> Signed-off-by: WANG Xuerui <git@xen0n.name>
>> ---
>>   tcg/loongarch/tcg-target.h | 183 +++++++++++++++++++++++++++++++++++++
>>   1 file changed, 183 insertions(+)
>>   create mode 100644 tcg/loongarch/tcg-target.h
>>
>> diff --git a/tcg/loongarch/tcg-target.h b/tcg/loongarch/tcg-target.h
>> new file mode 100644
>> index 0000000000..b5e70e01b5
>> --- /dev/null
>> +++ b/tcg/loongarch/tcg-target.h
>> @@ -0,0 +1,183 @@
>> +/*
>> + * Tiny Code Generator for QEMU
>> + *
>> + * Copyright (c) 2021 WANG Xuerui <git@xen0n.name>
>> + *
>> + * Based on tcg/riscv/tcg-target.h
>> + *
>> + * Copyright (c) 2018 SiFive, Inc
>
> You may have copied too much from the riscv port?  :-)

First of all, thanks for the *extremely* quick review!

As for the copying, I admit that I thought the riscv port generally was 
doing things the recent and preferred way, so most of the logic are only 
lightly touched. However the LoongArch is substantially similar to riscv 
too, so much of the traits expressed here would be the same regardless.

But in such a case of outstanding similarity, should I just drop my 
"copyright" line? I'm actually okay with dropping if that's the best 
thing to do.

>
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
>> +# error unsupported LoongArch bitness
>
> s/bitness/register size/
Sure; will fix in v2.
>
>
>> +#define TCG_TARGET_TLB_DISPLACEMENT_BITS 20
>
> Hmm.  I was about to say this is more copying from riscv, and should 
> be X, but now I see that this is no longer used.  You can omit it now; 
> I'll remove the other instances myself.
Thanks for the explanation, I'm only into qemu internals for 2 weeks and 
that's something I haven't read about yet! I'll try to remove irrelevant 
parts like this in v2.
>
>> +/* optional instructions */
>> +#define TCG_TARGET_HAS_movcond_i32      0
>> +#define TCG_TARGET_HAS_div_i32          1
>> +#define TCG_TARGET_HAS_rem_i32          1
>> +#define TCG_TARGET_HAS_div2_i32         0
>> +#define TCG_TARGET_HAS_rot_i32          1
>> +#define TCG_TARGET_HAS_deposit_i32      1
>> +#define TCG_TARGET_HAS_extract_i32      1
>> +#define TCG_TARGET_HAS_sextract_i32     0
>> +#define TCG_TARGET_HAS_extract2_i32     0
>> +#define TCG_TARGET_HAS_add2_i32         0
>> +#define TCG_TARGET_HAS_sub2_i32         0
>> +#define TCG_TARGET_HAS_mulu2_i32        0
>> +#define TCG_TARGET_HAS_muls2_i32        0
>> +#define TCG_TARGET_HAS_muluh_i32        1
>> +#define TCG_TARGET_HAS_mulsh_i32        1
>> +#define TCG_TARGET_HAS_ext8s_i32        1
>> +#define TCG_TARGET_HAS_ext16s_i32       1
>> +#define TCG_TARGET_HAS_ext8u_i32        1
>> +#define TCG_TARGET_HAS_ext16u_i32       1
>> +#define TCG_TARGET_HAS_bswap16_i32      0
>> +#define TCG_TARGET_HAS_bswap32_i32      1
>> +#define TCG_TARGET_HAS_not_i32          1
>> +#define TCG_TARGET_HAS_neg_i32          1
>> +#define TCG_TARGET_HAS_andc_i32         1
>> +#define TCG_TARGET_HAS_orc_i32          1
>> +#define TCG_TARGET_HAS_eqv_i32          0
>> +#define TCG_TARGET_HAS_nand_i32         0
>> +#define TCG_TARGET_HAS_nor_i32          1
>> +#define TCG_TARGET_HAS_clz_i32          1
>> +#define TCG_TARGET_HAS_ctz_i32          1
>> +#define TCG_TARGET_HAS_ctpop_i32        0
>> +#define TCG_TARGET_HAS_direct_jump      0
>> +#define TCG_TARGET_HAS_brcond2          0
>> +#define TCG_TARGET_HAS_setcond2         0
>> +#define TCG_TARGET_HAS_qemu_st8_i32     0
>> +
>> +#if TCG_TARGET_REG_BITS == 64
>
> You don't need this conditional, since you've asserted it at the top 
> (and unlike riscv, have no plans to add support for riscv32 at some 
> future point).
OK, will remove all such conditionals in v2 too.

