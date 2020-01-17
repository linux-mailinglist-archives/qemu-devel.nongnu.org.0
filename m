Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1F5140EC1
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 17:14:49 +0100 (CET)
Received: from localhost ([::1]:59710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isUGm-0000IG-8o
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 11:14:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43650)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1isUFY-00083L-5d
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 11:13:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1isUFW-0003fq-SO
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 11:13:32 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30651
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1isUFW-0003fS-Nz
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 11:13:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579277610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AsdTwAJa6S2NADCNapDyqKRfKYgDX03+qTM3qG+YDy4=;
 b=GBD//lNYy/sPNTzOew5J5B7RtW5aLoCcQNseJ7MM8OW9MwE/TecdTjIad0VZ9u1fzYVpTu
 BtHyRSTw+k5fQCwgxiA+o90aSJneI7bYvk4Rls9dW/6Jsvjc1JnYo3LZn1BEbaRo5gLb9n
 74hZAlnRuV/DS2LAHBVcMg3b6o1GunI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-jM8hODY9NnWrqY9VRlamZA-1; Fri, 17 Jan 2020 11:13:26 -0500
Received: by mail-wr1-f69.google.com with SMTP id 90so10614386wrq.6
 for <qemu-devel@nongnu.org>; Fri, 17 Jan 2020 08:13:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AsdTwAJa6S2NADCNapDyqKRfKYgDX03+qTM3qG+YDy4=;
 b=CIZ64oRVlZWDYafJpMw6/LQvKdZlGMOtJZz2s51oITccF96jh44aFVhjQn+FsqF/XR
 ilHMUdsoTK56cuR3R9O7y6PzgioH93TXcOODnZcsiUiFblWuCQiIgZ6MwdpIXb2LJNqY
 qM5vVZgWQ8/AKNRGpsmeXHXo4W1JlSexQLkJu51hiVx98hUis+23tegxb5+/vCfBIJhL
 +6CqSc8gGKJxJtnheB7+QaEaH2UvQS+Dd6KT9cDcXgKe1nRCYv4L/CR9FefVGQqF2wfN
 Cavdt4AsXXHvxrSxiFUDNYOnFG32CcTZ+7lZQyKy90O+MYk3sw/5scp4Wq2stzrevrhS
 ENpw==
X-Gm-Message-State: APjAAAUN9sHOtE4zbF2lY0E/lcmWFJQHAt5jOu39R3SkkjBeaj8vO4Lg
 o0HPBDD1jd5+9a2eRe94UdnG9H8HCwcFFkWvfesOPAKcKNXn0zo+Sklky8H0X/zZHF15IIZouf+
 TsRSRzHji4R1BevA=
X-Received: by 2002:a1c:a9c6:: with SMTP id s189mr5429551wme.151.1579277605424; 
 Fri, 17 Jan 2020 08:13:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqxwNRlRl4zhGm7hobRis1lxN8BQvtAxMgnLJRpZxdxXulX9hy+oE84Djqaq9XC6wPi7n1mpnQ==
X-Received: by 2002:a1c:a9c6:: with SMTP id s189mr5429527wme.151.1579277605195; 
 Fri, 17 Jan 2020 08:13:25 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id w8sm1078487wmd.2.2020.01.17.08.13.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jan 2020 08:13:24 -0800 (PST)
Subject: Re: [PATCH] target/hppa: Allow, but diagnose, LDCW aligned only mod 4
To: Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20200117015322.12953-1-richard.henderson@linaro.org>
 <7b14c840-0d3f-0c67-06be-81b058c727fb@gmx.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <08c4bdcb-b07d-eb30-a38d-f27ed6400952@redhat.com>
Date: Fri, 17 Jan 2020 17:13:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <7b14c840-0d3f-0c67-06be-81b058c727fb@gmx.de>
Content-Language: en-US
X-MC-Unique: jM8hODY9NnWrqY9VRlamZA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: dave.anglin@bell.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/17/20 4:49 PM, Helge Deller wrote:
> On 17.01.20 02:53, Richard Henderson wrote:
>> The PA-RISC 1.1 specification says that LDCW must be aligned mod 16
>> or the operation is undefined.  However, real hardware only generates
>> an unaligned access trap for unaligned mod 4.
>>
>> Match real hardware, but diagnose with GUEST_ERROR a violation of the
>> specification.
>>
>> Reported-by: Helge Deller <deller@gmx.de>
>> Suggested-by: John David Anglin <dave.anglin@bell.net>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>
>> Helge, can you please test this against your failing kernel?
>> You will of course want to add -D logfile -d guest_errors to
>> you qemu command-line.
> 
> Yes, works as expected.
> Thanks!
> 
> Please add:
> Tested-by: Helge Deller <deller@gmx.de>
> 
> 
> [deller]$ tail -f logfile
> Undefined ldc to address unaligned mod 16: 00000504fa6c7848
> Undefined ldc to address unaligned mod 16: 00000504fa6c7a48
> Undefined ldc to address unaligned mod 16: 00000506f9434848
> Undefined ldc to address unaligned mod 16: 00000506f9434a48
> Undefined ldc to address unaligned mod 16: 00000508fa036848
> Undefined ldc to address unaligned mod 16: 00000508fa036a48
> Undefined ldc to address unaligned mod 16: 0000050afa8c4848
> Undefined ldc to address unaligned mod 16: 0000050afa8c4a48
> Undefined ldc to address unaligned mod 16: 0000050cf94d1848
> Undefined ldc to address unaligned mod 16: 0000050cf94d1a48
> ....
> 
> 
> 
>>
>>
>> r~
>>
>> ---
>>   target/hppa/helper.h    | 2 ++
>>   target/hppa/op_helper.c | 9 +++++++++
>>   target/hppa/translate.c | 6 +++++-
>>   3 files changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/hppa/helper.h b/target/hppa/helper.h
>> index 38d834ef6b..2d483aab58 100644
>> --- a/target/hppa/helper.h
>> +++ b/target/hppa/helper.h
>> @@ -17,6 +17,8 @@ DEF_HELPER_FLAGS_3(stby_b_parallel, TCG_CALL_NO_WG, void, env, tl, tr)
>>   DEF_HELPER_FLAGS_3(stby_e, TCG_CALL_NO_WG, void, env, tl, tr)
>>   DEF_HELPER_FLAGS_3(stby_e_parallel, TCG_CALL_NO_WG, void, env, tl, tr)
>>
>> +DEF_HELPER_FLAGS_1(ldc_check, TCG_CALL_NO_RWG, void, tl)
>> +
>>   DEF_HELPER_FLAGS_4(probe, TCG_CALL_NO_WG, tr, env, tl, i32, i32)
>>
>>   DEF_HELPER_FLAGS_1(loaded_fr0, TCG_CALL_NO_RWG, void, env)
>> diff --git a/target/hppa/op_helper.c b/target/hppa/op_helper.c
>> index f0516e81f1..345cef2c08 100644
>> --- a/target/hppa/op_helper.c
>> +++ b/target/hppa/op_helper.c
>> @@ -153,6 +153,15 @@ void HELPER(stby_e_parallel)(CPUHPPAState *env, target_ulong addr,
>>       do_stby_e(env, addr, val, true, GETPC());
>>   }
>>
>> +void HELPER(ldc_check)(target_ulong addr)
>> +{
>> +    if (unlikely(addr & 0xf)) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "Undefined ldc to address unaligned mod 16: "

"to unaligned address mod 16"?

>> +                      TARGET_FMT_lx "\n", addr);
>> +    }
>> +}
>> +
>>   target_ureg HELPER(probe)(CPUHPPAState *env, target_ulong addr,
>>                             uint32_t level, uint32_t want)
>>   {
>> diff --git a/target/hppa/translate.c b/target/hppa/translate.c
>> index 2f8d407a82..669381dc1d 100644
>> --- a/target/hppa/translate.c
>> +++ b/target/hppa/translate.c
>> @@ -2942,7 +2942,7 @@ static bool trans_st(DisasContext *ctx, arg_ldst *a)
>>
>>   static bool trans_ldc(DisasContext *ctx, arg_ldst *a)
>>   {
>> -    MemOp mop = MO_TEUL | MO_ALIGN_16 | a->size;
>> +    MemOp mop = MO_TE | MO_ALIGN | a->size;


Hmmm you changed MO_TEUL -> MO_TE, so from MO_32 to MO_8.

Per your description, shouldn't this be MO_TEUL | MO_ALIGN_4?

>>       TCGv_reg zero, dest, ofs;
>>       TCGv_tl addr;
>>
>> @@ -2958,8 +2958,12 @@ static bool trans_ldc(DisasContext *ctx, arg_ldst *a)
>>
>>       form_gva(ctx, &addr, &ofs, a->b, a->x, a->scale ? a->size : 0,
>>                a->disp, a->sp, a->m, ctx->mmu_idx == MMU_PHYS_IDX);
>> +
>> +    gen_helper_ldc_check(addr);
>>       zero = tcg_const_reg(0);
>>       tcg_gen_atomic_xchg_reg(dest, addr, zero, ctx->mmu_idx, mop);
>> +    tcg_temp_free(zero);
>> +
>>       if (a->m) {
>>           save_gpr(ctx, a->b, ofs);
>>       }
>>
> 
> 


