Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3E96065C2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 18:27:03 +0200 (CEST)
Received: from localhost ([::1]:36232 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYNo-00050i-7j
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:27:00 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYIz-0008IM-4K
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1olVWD-00064q-IJ
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 09:23:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1olVWB-0000iM-OL
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 09:23:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666272207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QPBIz/kswUZyaGSfJ/hj5iTH8Ofc75qU3Z9Nq/vh8qg=;
 b=KW2JqhBYi2Akwh3dO9bkBT3nUIA3U4b223ax/ye8zudw55pBXMK8nBrRFlTr5qx4VssirW
 d8hu1q/ZIHybRdCEVhDYrWFTo8wqb+l7sSLOGOkqSZp//9UMJrm2nPOlU/++I44x2/srq0
 U32lUwlLaVn+Kbx0OC5lF+daj83f5IY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-656-TQumUl_dOAGIKkjR7cN3Fg-1; Thu, 20 Oct 2022 09:23:25 -0400
X-MC-Unique: TQumUl_dOAGIKkjR7cN3Fg-1
Received: by mail-ed1-f70.google.com with SMTP id
 m20-20020a056402511400b0045da52f2d3cso8622905edd.20
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 06:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QPBIz/kswUZyaGSfJ/hj5iTH8Ofc75qU3Z9Nq/vh8qg=;
 b=17wmFm2e9fhLp352w7+Gpcp0BnJZHsunndyKHoWUe3YgFk2MxC/79catvQBitE9iAw
 WT9km6jAK3hOiLAY9egIZP4ctuV2O7K5Wmpd5Jwbh5hneSs2KHiVYJowj7vOIes0WDwK
 Q3GcSa3wpPeBqQWyczeCRHl84c1eZ483w0kDSof28Kfsa4bOcr6rUFTOsfwF1ENMMU0x
 c4CVbTId0SWQ/ibXI4WL19oJyawz3tEJ2TyUoDN0GKNmm4f+Rl3bsNQst2eZDhQ8imKI
 2B4xiJFHTs3W/AjKZk9Q6GcjaRZ8KT7ZSshiKDQnP5PsVOlvuztZ2KVmEcM76GOBoZg7
 mqeQ==
X-Gm-Message-State: ACrzQf2zoeIVlGL5My2Pk1ihncW6CC+IWPJX5iGw34sKavXZ2NrWTTEZ
 1fJ4+q4bciBq2hJ8+SHbAXYm/sH9HMcZgUnhWSMfd1ir2cu0lWoQDJvbBz1FE3NNaqrr3OzQM01
 5XH0nbYGORzf5nr0=
X-Received: by 2002:a17:907:980e:b0:78d:b6ea:25b3 with SMTP id
 ji14-20020a170907980e00b0078db6ea25b3mr11025137ejc.98.1666272204440; 
 Thu, 20 Oct 2022 06:23:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM72nKgTbfWxcuMfkfZcneB8NDvW59inUILtsgPiu+bihURAzCsdZN5X9zKz9GSgcZRM/6Ds6g==
X-Received: by 2002:a17:907:980e:b0:78d:b6ea:25b3 with SMTP id
 ji14-20020a170907980e00b0078db6ea25b3mr11025116ejc.98.1666272204177; 
 Thu, 20 Oct 2022 06:23:24 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 i18-20020a0564020f1200b00458a03203b1sm12196597eda.31.2022.10.20.06.23.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 06:23:23 -0700 (PDT)
Message-ID: <c729c3ec-5538-d9d4-6eec-3c7ee3d43f31@redhat.com>
Date: Thu, 20 Oct 2022 15:23:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 4/4] target/i386: implement FMA instructions
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221019150616.929463-1-pbonzini@redhat.com>
 <20221019150616.929463-5-pbonzini@redhat.com>
 <ce91008a-d9d3-853f-fed1-e064e5d49d9a@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <ce91008a-d9d3-853f-fed1-e064e5d49d9a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/22 05:02, Richard Henderson wrote:
> On 10/20/22 01:06, Paolo Bonzini wrote:
>> The only issue with FMA instructions is that there are _a lot_ of them
>> (30 opcodes, each of which comes in up to 4 versions depending on VEX.W
>> and VEX.L).
>>
>> We can reduce the number of helpers to one third by passing four operands
>> (one output and three inputs); the reordering of which operands go to
>> the multiply and which go to the add is done in emit.c.
>>
>> Scalar versions do not do any merging; they only affect the bottom 32
>> or 64 bits of the output operand.  Therefore, there is no separate XMM
>> and YMM of the scalar helpers.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   target/i386/cpu.c                |  5 ++-
>>   target/i386/ops_sse.h            | 63 ++++++++++++++++++++++++++++++++
>>   target/i386/ops_sse_header.h     | 28 ++++++++++++++
>>   target/i386/tcg/decode-new.c.inc | 38 +++++++++++++++++++
>>   target/i386/tcg/decode-new.h     |  1 +
>>   target/i386/tcg/emit.c.inc       | 43 ++++++++++++++++++++++
>>   tests/tcg/i386/test-avx.py       |  2 +-
>>   7 files changed, 177 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index 6292b7e12f..22b681ca37 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -625,10 +625,11 @@ void x86_cpu_vendor_words2str(char *dst, 
>> uint32_t vendor1,
>>             CPUID_EXT_SSE41 | CPUID_EXT_SSE42 | CPUID_EXT_POPCNT | \
>>             CPUID_EXT_XSAVE | /* CPUID_EXT_OSXSAVE is dynamic */   \
>>             CPUID_EXT_MOVBE | CPUID_EXT_AES | CPUID_EXT_HYPERVISOR | \
>> -          CPUID_EXT_RDRAND | CPUID_EXT_AVX | CPUID_EXT_F16C)
>> +          CPUID_EXT_RDRAND | CPUID_EXT_AVX | CPUID_EXT_F16C | \
>> +          CPUID_EXT_FMA)
>>             /* missing:
>>             CPUID_EXT_DTES64, CPUID_EXT_DSCPL, CPUID_EXT_VMX, 
>> CPUID_EXT_SMX,
>> -          CPUID_EXT_EST, CPUID_EXT_TM2, CPUID_EXT_CID, CPUID_EXT_FMA,
>> +          CPUID_EXT_EST, CPUID_EXT_TM2, CPUID_EXT_CID,
>>             CPUID_EXT_XTPR, CPUID_EXT_PDCM, CPUID_EXT_PCID, 
>> CPUID_EXT_DCA,
>>             CPUID_EXT_X2APIC, CPUID_EXT_TSC_DEADLINE_TIMER */
>> diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
>> index 33c61896ee..041a048a70 100644
>> --- a/target/i386/ops_sse.h
>> +++ b/target/i386/ops_sse.h
>> @@ -2522,6 +2522,69 @@ void helper_vpermd_ymm(Reg *d, Reg *v, Reg *s)
>>   }
>>   #endif
>> +/* FMA3 op helpers */
>> +#if SHIFT == 1
>> +#define SSE_HELPER_FMAS(name, elem, 
>> F)                                         \
>> +    void name(CPUX86State *env, Reg *d, Reg *a, Reg *b, Reg 
>> *c)                \
>> +    
>> {                                                                          \
>> +        d->elem(0) = F(a->elem(0), b->elem(0), 
>> c->elem(0));                    \
>> +    }
>> +#define SSE_HELPER_FMAP(name, elem, num, 
>> F)                                    \
>> +    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *a, Reg *b, 
>> Reg *c)  \
>> +    
>> {                                                                          \
>> +        int 
>> i;                                                                 \
>> +        for (i = 0; i < num; i++) 
>> {                                            \
>> +            d->elem(i) = F(a->elem(i), b->elem(i), 
>> c->elem(i));                \
>> +        
>> }                                                                      \
>> +    }
>> +
>> +#define FMADD32(a, b, c) float32_muladd(a, b, c, 0, &env->sse_status)
>> +#define FMADD64(a, b, c) float64_muladd(a, b, c, 0, &env->sse_status)
>> +
>> +#define FMNADD32(a, b, c) float32_muladd(a, b, c, float_muladd_negate_product, &env->sse_status)
>> +#define FMNADD64(a, b, c) float64_muladd(a, b, c, float_muladd_negate_product, &env->sse_status)
>> [...]
>
> Would it be worth passing the muladd constant(s) as a parameter to a 
> reduced number of helper functions?

Sure, will do that.

> void fmas_name(..., int flags)
> {
>      d = type_muladd(a, b, c, flags, status);
> }
> 
> void fmap_name(..., int flags2)
> {
>      int f_even = flags2 & 0xf;
>      int f_odd = flags2 >> 4;
>      for (int i = 0; i < num; ) {
>         d(i) = type_muladd(a(i), b(i), c(i), f_even, status);
>         i++;
>         d(i) = type_muladd(a(i), b(i), c(i), f_odd, status);
>         i++;
>      }

Another possibility is to add two arguments for even and odd.

>> +FMA_SSE(VFNMSUB231,   fmnsub,   OP_PTR1, OP_PTR2, OP_PTR0)
>> +FMA_SSE(VFNMSUB213,   fmnsub,   OP_PTR1, OP_PTR0, OP_PTR2)
>> +FMA_SSE(VFNMSUB132,   fmnsub,   OP_PTR0, OP_PTR2, OP_PTR1)
>> +
>> +FMA_SSE_PACKED(VFMSUBADD231, fmsubadd, OP_PTR1, OP_PTR2, OP_PTR0)
>> +FMA_SSE_PACKED(VFMSUBADD213, fmsubadd, OP_PTR1, OP_PTR0, OP_PTR2)
>> +FMA_SSE_PACKED(VFMSUBADD132, fmsubadd, OP_PTR0, OP_PTR2, OP_PTR1)
> 
> Is it more or less confusing to macroize this further?

I think more. :)

Paolo


