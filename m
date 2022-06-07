Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4605400A0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 16:03:23 +0200 (CEST)
Received: from localhost ([::1]:53290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyZnm-0003jd-DE
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 10:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <redha.gouicem@gmail.com>)
 id 1nyZlr-0001bk-BN; Tue, 07 Jun 2022 10:01:23 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:36365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <redha.gouicem@gmail.com>)
 id 1nyZll-0006ZN-K5; Tue, 07 Jun 2022 10:01:23 -0400
Received: by mail-ej1-x635.google.com with SMTP id s12so28191798ejx.3;
 Tue, 07 Jun 2022 07:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oXgybdcYtYZuzCG91L7ihvaqawohrOipKmT+HQ/vK0A=;
 b=pg5GM3XRTV8jecwFeWNuEjp456TSy3SmiTFl1REyinlma1KYgztVa/Ah29ny7Wnyht
 xzaLJu8dxJZalZx6s2fKiK77ojAFZa9cjdKmMjqsyxpKQ13Ln3vI5MfaQgCVrEu/Rj4j
 976i6+OrPGC8QA8iJN5kVJyKo2vJDMm5/f/3X2MqLzHkcblIqvyRmkVtvE8Clkeg+8QB
 tFskOwfoRQ0BNJST5/T8Qeg1xVZNaWSkhwPGD69+eKdoEru6k5uPenbKtHDoJgGBNn63
 Z3cxeJTAIVRKVrK5kxjS4Bw+7HzetQb+WXo75PcvJ62hpehUFS155IweAR6L1eSwVQQ7
 wSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oXgybdcYtYZuzCG91L7ihvaqawohrOipKmT+HQ/vK0A=;
 b=VggL7rdwPSSDWWFB9I3ulSvMbpFfyMFXTjM/jAChFyefttIC0z3y1SFWLuEJLtMqfO
 JEiZzWyajhoGzBKFuKPNDtA8DJkdsLOp8QqCRvzt0mPAgISLl3auQ26eWw+Nymc1Hc0H
 UXm4i5Uv6/s8Tb3vgiLkSqfcIJrb4AYvGCLkwvr+bAQv0TW6yINfDc+/ml0IBZMWTvAt
 SSn/ZigQl6hQ+ysfhYPDuy+d2Qg3Pd+90gTDqquEduwYHUGJS6YRnA34JCESutxELXqg
 d47ie6svFpwCAowihNUBvULF5hDtXI2KZOaijsPa43s3xh9KTT4ccSoeUfxd/u6DSYiE
 iiDg==
X-Gm-Message-State: AOAM531fFjoEWczxUHfnFaCwp+9duf8Gaib4/LRp0IM8l4wul3lR6HL2
 Wg14IgbhjB6JRgy+SD5iloE=
X-Google-Smtp-Source: ABdhPJwZBcfsxTJjCrIXN/5VROkTmDWHaNmgGr/hpUOEhXNaobd4P5Q2E+v+DX7bqF3zCnniPY+o+w==
X-Received: by 2002:a17:907:7212:b0:706:fd77:86cb with SMTP id
 dr18-20020a170907721200b00706fd7786cbmr26603497ejc.69.1654610473863; 
 Tue, 07 Jun 2022 07:01:13 -0700 (PDT)
Received: from ?IPV6:2001:a61:240a:e01:3b2e:e985:60ef:f421?
 ([2001:a61:240a:e01:3b2e:e985:60ef:f421])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a1709062c0100b0070bdc059ab2sm6277467ejh.138.2022.06.07.07.01.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 07:01:13 -0700 (PDT)
Message-ID: <d1916722-6a1a-4e21-cd95-4ffbd09e943c@gmail.com>
Date: Tue, 7 Jun 2022 16:01:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] tcg: Special case split barriers before/after load
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org
References: <20220430234534.446733-1-richard.henderson@linaro.org>
 <e22c20ff-d6dd-66e6-4143-d60f81609261@amsat.org>
From: Redha <redha.gouicem@gmail.com>
In-Reply-To: <e22c20ff-d6dd-66e6-4143-d60f81609261@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=redha.gouicem@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi Richard and Philippe,

I was finally able to test the patch.

As expected, the fences generated by TCG with your patch are the same
ones as in mine.

However, I was not able to reproduce the failure with the ahci-test on
my ARM system (2x 28-core Thunder X2, 4 threads per core).  I ran 500
tests concurrently to load the system, but I did not get the assert
failure.  However, I got another qemu error 229 times:

  qemu-system-x86_64: Failed to get "write" lock
  Is another process using the image [/tmp/qtest.IksKVs]?

Each time with a different temporary path. Not sure if that is directly 
related to the actual test.

Also, are we sure the test failure on the gitlab runner is due to memory
ordering issues with regular memory accesses?  Is there a way to check
the code generated by TCG for this test, similar to `-d op,out_asm`?


Redha



On 30/05/2022 17:10, Philippe Mathieu-Daudé wrote:
> Hi Richard,
> 
> On 1/5/22 01:45, Richard Henderson wrote:
>> When st:ld is not required by the guest but ld:st is, we can
>> put ld:ld+ld:st barriers after loads, and then st:st barriers
>> before stores to enforce all required barriers.
>>
>> The st:st barrier is often special cased by hosts, and that
>> is expected to be more efficient than a full barrier.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>
>> Redha, I expect this to produce exactly the same barriers as you
>> did with your 'fix guest memory ordering enforcement' patch.
>>
>> While this compiles, it does not fix the failures that I see
>> occasionally with our private gitlab runner.  The standalone
>> version of this failure is
>>
>>    export QTEST_QEMU_BINARY=./qemu-system-i386
>>    for i in `seq 1 100`; do
>>      ./tests/qtest/ahci-test > /dev/null &
>>    done
>>    wait
>>
>> About 10 to 15% of the runs will fail with
>>
>> ERROR:../src/tests/qtest/ahci-test.c:92:verify_state: assertion failed (ahci_fingerprint == ahci->fingerprint): (0xe0000000 == 0x29228086)
>>
>> Note that this test never seems to fail unless the system is under
>> load, thus starting 100 tests on my 80 core neoverse-n1 system.
>>
>>
>> r~
>>
>>
>> ---
>>   tcg/tcg-op.c | 55 +++++++++++++++++++++++++++++++++++++++++++++-------
>>   1 file changed, 48 insertions(+), 7 deletions(-)
>>
>> diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
>> index 5d48537927..4c568a2592 100644
>> --- a/tcg/tcg-op.c
>> +++ b/tcg/tcg-op.c
>> @@ -2834,9 +2834,6 @@ static void gen_ldst_i64(TCGOpcode opc, TCGv_i64 val, TCGv addr,
>>     static void tcg_gen_req_mo(TCGBar type)
>>   {
>> -#ifdef TCG_GUEST_DEFAULT_MO
>> -    type &= TCG_GUEST_DEFAULT_MO;
>> -#endif
>>       type &= ~TCG_TARGET_DEFAULT_MO;
>>       if (type) {
>>           tcg_gen_mb(type | TCG_BAR_SC);
>> @@ -2868,12 +2865,49 @@ static void plugin_gen_mem_callbacks(TCGv vaddr, MemOpIdx oi,
>>   #endif
>>   }
>>   +typedef enum {
>> +    BAR_LD_BEFORE,
>> +    BAR_LD_AFTER,
>> +    BAR_ST_BEFORE,
>> +} ChooseBarrier;
>> +
>> +static TCGBar choose_barrier(ChooseBarrier which)
>> +{
>> +#ifdef TCG_GUEST_DEFAULT_MO
>> +    const TCGBar guest_mo = TCG_GUEST_DEFAULT_MO;
>> +#else
>> +    const TCGBar guest_mo = TCG_MO_ALL;
>> +#endif
>> +    TCGBar ret[3];
>> +
>> +    if (guest_mo == 0) {
>> +        return 0;
>> +    }
> 
> This part ...:
> 
>> +    /*
>> +     * Special case for i386 and s390x.  Because store-load is not
>> +     * required by the guest, we can split the barriers such that we
>> +     * wind up with a store-store barrier, which is expected to be
>> +     * quicker on some hosts.
>> +     */
>> +    if (guest_mo == (TCG_MO_ALL & ~TCG_MO_ST_LD)) {
>> +        ret[BAR_LD_BEFORE] = 0;
>> +        ret[BAR_LD_AFTER]  = TCG_MO_LD_LD | TCG_MO_LD_ST;
>> +        ret[BAR_ST_BEFORE] = TCG_MO_ST_ST;
>> +    } else {
> 
> ... could deserve another patch.
> 
>> +        ret[BAR_LD_BEFORE] = (TCG_MO_LD_LD | TCG_MO_ST_LD) & guest_mo;
>> +        ret[BAR_ST_BEFORE] = (TCG_MO_LD_ST | TCG_MO_ST_ST) & guest_mo;
>> +        ret[BAR_LD_AFTER]  = 0;
>> +    }
>> +    return ret[which];
>> +}
>> +
>>   void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
>>   {
>>       MemOp orig_memop;
>>       MemOpIdx oi;
>>   -    tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
>> +    tcg_gen_req_mo(choose_barrier(BAR_LD_BEFORE));
>> +
>>       memop = tcg_canonicalize_memop(memop, 0, 0);
>>       oi = make_memop_idx(memop, idx);
>>   @@ -2904,6 +2938,8 @@ void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
>>               g_assert_not_reached();
>>           }
>>       }
>> +
>> +    tcg_gen_req_mo(choose_barrier(BAR_LD_AFTER));
>>   }
>>     void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
>> @@ -2911,7 +2947,8 @@ void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
>>       TCGv_i32 swap = NULL;
>>       MemOpIdx oi;
>>   -    tcg_gen_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
>> +    tcg_gen_req_mo(choose_barrier(BAR_ST_BEFORE));
>> +
>>       memop = tcg_canonicalize_memop(memop, 0, 1);
>>       oi = make_memop_idx(memop, idx);
>>   @@ -2959,7 +2996,8 @@ void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
>>           return;
>>       }
>>   -    tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
>> +    tcg_gen_req_mo(choose_barrier(BAR_LD_BEFORE));
>> +
>>       memop = tcg_canonicalize_memop(memop, 1, 0);
>>       oi = make_memop_idx(memop, idx);
>>   @@ -2994,6 +3032,8 @@ void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
>>               g_assert_not_reached();
>>           }
>>       }
>> +
>> +    tcg_gen_req_mo(choose_barrier(BAR_LD_AFTER));
>>   }
>>     void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
>> @@ -3006,7 +3046,8 @@ void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
>>           return;
>>       }
>>   -    tcg_gen_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
>> +    tcg_gen_req_mo(choose_barrier(BAR_ST_BEFORE));
>> +
>>       memop = tcg_canonicalize_memop(memop, 1, 1);
>>       oi = make_memop_idx(memop, idx);
>>   
> 
> Redha, could you test this patch?
> 
> Regards,
> 
> Phil.

