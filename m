Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ED265AF3F
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 11:04:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCHfz-0002Pq-CD; Mon, 02 Jan 2023 05:04:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pCHfx-0002Pa-1l
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 05:04:13 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pCHfv-0003eU-Fx
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 05:04:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QaGEN5bcQZS58T/Vg9a0VfIc3ZuJ9doVZ8jcc8TsgIg=; b=lGMK6SCR3izA0vmjuRfvMTSTE9
 2FL1NQFfnkjoH9oJlltZ69rzB5rcViBgKxCXnOSG0UtAjWgEkeC7n0Mu3QVIWJbvbYykSp8/0gZ81
 QBWUhD1gv0HXqHtvQINBvo3alrexTzeDWfjBBmSDmxIw1/yX10FvBIZ9w/uGAWSkosqzW0TAnYIi4
 HOqGDFkCmXUkxGyeqaQjUTYzSBPGAbc80cIUw9hmp2A+VLWzG+X0XjcPRrsjCon5kVWGG4S9JaCKt
 BupHBULFUdbSpIQ0VSFYQbexK/OrQOLs3x97pJVfNS2yiQmejUBd9WCY3SZgX1JrnXfMV45ZsGlYE
 J2pxV689qiuz7P2YzvMi33PlVCCJQTgYg6pRNPmnE7mWLB+FjeCe5G1C4lhzMdWkMFu3fnMTDX7Cs
 a7G/Uj0ESh6P5UkEsZeT6wMot7yyvo8kBZFDFt1x/6oeDqobhlG7AmQmjOjmOU/scDajqotnPkZFh
 OgVF1Gsum1ntRn2r71fLJapIKVLc1tagkbbcs33Ld0kIfapvQLUTQFEiAeWiFJQMVH4WwES2tdq+/
 joJDB4X327FUPQsF7ygi/i4Do9wF6oh5Q8pYnvu/Kra+BtII9aMtHuEGnSa4sdSRjIaG7p5mo4MA3
 nYgCfDlDqLDoBUGF9gfqjTpifNNF9U0rmIeFfz8M0=;
Received: from [2a00:23c4:8baa:1d00:e655:fde:753f:696a]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pCHfW-0007xS-Oq; Mon, 02 Jan 2023 10:03:50 +0000
Message-ID: <0b69efc0-92dc-fd69-64e9-d99f7e7dd972@ilande.co.uk>
Date: Mon, 2 Jan 2023 10:04:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20230101144339.60307-1-mark.cave-ayland@ilande.co.uk>
 <20230101144339.60307-3-mark.cave-ayland@ilande.co.uk>
 <0e418e12-2738-133e-e212-7c7dbbc241c8@vivier.eu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <0e418e12-2738-133e-e212-7c7dbbc241c8@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:1d00:e655:fde:753f:696a
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 2/4] target/m68k: pass sign directly into make_quotient()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.802,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 01/01/2023 17:26, Laurent Vivier wrote:

> Le 01/01/2023 à 15:43, Mark Cave-Ayland a écrit :
>> This enables the quotient parameter to be changed from int32_t to uint32_t and
>> also allows the extra sign logic in make_quotient() to be removed.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   target/m68k/fpu_helper.c | 15 +++++----------
>>   1 file changed, 5 insertions(+), 10 deletions(-)
>>
>> diff --git a/target/m68k/fpu_helper.c b/target/m68k/fpu_helper.c
>> index 0932c464fd..ae839785fa 100644
>> --- a/target/m68k/fpu_helper.c
>> +++ b/target/m68k/fpu_helper.c
>> @@ -515,15 +515,8 @@ uint32_t HELPER(fmovemd_ld_postinc)(CPUM68KState *env, 
>> uint32_t addr,
>>       return fmovem_postinc(env, addr, mask, cpu_ld_float64_ra);
>>   }
>> -static void make_quotient(CPUM68KState *env, int32_t quotient)
>> +static void make_quotient(CPUM68KState *env, int sign, uint32_t quotient)
>>   {
>> -    int sign;
>> -
>> -    sign = quotient < 0;
>> -    if (sign) {
>> -        quotient = -quotient;
>> -    }
>> -
>>       quotient = (sign << 7) | (quotient & 0x7f);
>>       env->fpsr = (env->fpsr & ~FPSR_QT_MASK) | (quotient << FPSR_QT_SHIFT);
>>   }
>> @@ -536,7 +529,8 @@ void HELPER(fmod)(CPUM68KState *env, FPReg *res, FPReg *val0, 
>> FPReg *val1)
>>           return;
>>       }
>> -    make_quotient(env, floatx80_to_int32(res->d, &env->fp_status));
>> +    make_quotient(env, extractFloatx80Sign(res->d),
>> +                  floatx80_to_int32(res->d, &env->fp_status));
>>   }
>>   void HELPER(frem)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
>> @@ -547,7 +541,8 @@ void HELPER(frem)(CPUM68KState *env, FPReg *res, FPReg *val0, 
>> FPReg *val1)
>>           return;
>>       }
>> -    make_quotient(env, floatx80_to_int32(res->d, &env->fp_status));
>> +    make_quotient(env, extractFloatx80Sign(res->d),
>> +                  floatx80_to_int32(res->d, &env->fp_status));
>>   }
>>   void HELPER(fgetexp)(CPUM68KState *env, FPReg *res, FPReg *val)
> 
> I think you need an "abs(floatx80_to_int32())" in both cases as you do in PATCH 4

Ah yes that's probably true - I suspect I didn't notice because the static tests fail 
immediately until patches 3 and 4.


ATB,

Mark.

