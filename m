Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABE4512461
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 23:14:00 +0200 (CEST)
Received: from localhost ([::1]:53070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njoyy-0006qs-T8
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 17:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1njox4-0004z9-UJ; Wed, 27 Apr 2022 17:11:58 -0400
Received: from [187.72.171.209] (port=8276 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1njox0-0000ed-BO; Wed, 27 Apr 2022 17:11:58 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 27 Apr 2022 18:11:46 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 569C580031A;
 Wed, 27 Apr 2022 18:11:46 -0300 (-03)
Content-Type: multipart/alternative;
 boundary="------------4SJgCvy3W391BJtKRzVAHxco"
Message-ID: <b7441766-6fa9-7438-fe61-c041d4237fe0@eldorado.org.br>
Date: Wed, 27 Apr 2022 18:11:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 5/7] target/ppc: Implemented xvf16ger*
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org
References: <20220426125028.18844-1-lucas.araujo@eldorado.org.br>
 <20220426125028.18844-6-lucas.araujo@eldorado.org.br>
 <e5abeb2f-892f-af8d-0457-c9f8e66ddeb6@linaro.org>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
In-Reply-To: <e5abeb2f-892f-af8d-0457-c9f8e66ddeb6@linaro.org>
X-OriginalArrivalTime: 27 Apr 2022 21:11:46.0653 (UTC)
 FILETIME=[673678D0:01D85A7B]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------4SJgCvy3W391BJtKRzVAHxco
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 26/04/2022 21:26, Richard Henderson wrote:
> On 4/26/22 05:50, Lucas Mateus Castro(alqotel) wrote:
>> +#define VSXGER16(NAME, ORIG_T, 
>> OR_EL)                                   \
>> +    void NAME(CPUPPCState *env, uint32_t a_r, uint32_t 
>> b_r,             \
>> +              uint32_t  at_r, uint32_t mask, uint32_t 
>> packed_flags)     \
>> + { \
>> +        ppc_vsr_t 
>> *at;                                                  \
>> +        float32 psum, aux_acc, va, vb, vc, 
>> vd;                          \
>> +        int i, j, xmsk_bit, 
>> ymsk_bit;                                   \
>> +        uint8_t xmsk = mask & 
>> 0x0F;                                     \
>> +        uint8_t ymsk = (mask >> 4) & 
>> 0x0F;                              \
>> +        uint8_t pmsk = (mask >> 8) & 
>> 0x3;                               \
>> +        ppc_vsr_t *b = cpu_vsr_ptr(env, 
>> b_r);                           \
>> +        ppc_vsr_t *a = cpu_vsr_ptr(env, 
>> a_r);                           \
>> +        float_status *excp_ptr = 
>> &env->fp_status;                       \
>> +        bool acc = 
>> ger_acc_flag(packed_flags);                          \
>> +        bool neg_acc = 
>> ger_neg_acc_flag(packed_flags);                  \
>> +        bool neg_mul = 
>> ger_neg_mul_flag(packed_flags);                  \
>> +        for (i = 0, xmsk_bit = 1 << 3; i < 4; i++, xmsk_bit >>= 1) 
>> {    \
>> +            at = cpu_vsr_ptr(env, at_r + 
>> i);                            \
>> +            for (j = 0, ymsk_bit = 1 << 3; j < 4; j++, ymsk_bit >>= 
>> 1) {\
>> +                if ((xmsk_bit & xmsk) && (ymsk_bit & ymsk)) 
>> {           \
>> +                    va = !(pmsk & 2) ? float32_zero 
>> :                   \
>> +                                       GET_VSR(Vsr##OR_EL, 
>> a,           \
>> +                                               2 * i, ORIG_T, 
>> float32); \
>> +                    vb = !(pmsk & 2) ? float32_zero 
>> :                   \
>> +                                       GET_VSR(Vsr##OR_EL, 
>> b,           \
>> +                                               2 * j, ORIG_T, 
>> float32); \
>> +                    vc = !(pmsk & 1) ? float32_zero 
>> :                   \
>> +                                       GET_VSR(Vsr##OR_EL, 
>> a,           \
>> +                                            2 * i + 1, ORIG_T, 
>> float32);\
>> +                    vd = !(pmsk & 1) ? float32_zero 
>> :                   \
>> +                                       GET_VSR(Vsr##OR_EL, 
>> b,           \
>> +                                            2 * j + 1, ORIG_T, 
>> float32);\
>> +                    psum = float32_mul(va, vb, 
>> excp_ptr);               \
>> +                    psum = float32_muladd(vc, vd, psum, 0, 
>> excp_ptr);   \
>
> This isn't correct -- the intermediate 'prod' (the first multiply) is 
> not rounded.  I
> think the correct way to implement this (barring new softfloat 
> functions) is to compute
> the intermediate product as float64 with float_round_to_odd, then 
> float64r32_muladd into
> the correct rounding mode to finish.
While not mentioned in the pseudocode the instruction description says:

- Let prod be the single-precision product of src10 and src20

Which I understand as the result of the first multiplication being 
stored in a float32

But in xvbf16ger2* it's different (and I think this is the reason the 
last patch is resulting in the wrong signal in some 0 and inf results), 
the description says:

- Let prod be the product of src10 and src20, having infinite precision 
and unbounded exponent range. - Let psum be the sum of the product, 
src11 multiplied by src21, and prod, having infinite precision and 
unbounded exponent range.
- Let r1 be the value psum with its significand rounded to 24-bit 
precision using the rounding mode specified by RN, but retaining 
unbounded exponent range (i.e., cannot overflow or underflow).

>
>> +                    if (acc) 
>> {                                          \
>> +                        if (neg_mul) 
>> {                                  \
>> +                            psum = 
>> float32_neg(psum);                   \
>> + }                                               \
>> +                        if (neg_acc) 
>> {                                  \
>> +                            aux_acc = 
>> float32_neg(at->VsrSF(j));        \
>> +                        } else 
>> {                                        \
>> +                            aux_acc = 
>> at->VsrSF(j);                     \
>> + }                                               \
>> +                        at->VsrSF(j) = float32_add(psum, 
>> aux_acc,       \
>> + excp_ptr);           \
>
> This one, thankfully, uses the rounded intermediate result 'msum', so 
> is ok.
Yes this one is the easier one to deal with, in the description for the 
xvf16ger2* it specifies that msum and the result is rounded to 
single-precision and in the description for the xvbf16ger2 it specifies 
that r1 is 'rounded to a 24-bit significand precision and 8-bit exponent 
range (i.e., single-precision)'
>
> Please do convert this from a macro.  Given that float16 and bfloat16 
> are addressed the
> same, I think the only callback you need is the conversion from 
> float16_to_float64.  Drop
> the bf16 accessor to ppc_vsr_t.
>
Will do, although I'm considering instead of the callback being the 
conversion, maybe have it be a 4 float multiplication
     typedef float32 mul_4float(float16, float16, float16, float16);
Since float16 and bfloat16 are addressed the same, any thoughts?
>
> r~
-- 
Lucas Mateus M. Araujo e Castro
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>
--------------4SJgCvy3W391BJtKRzVAHxco
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 26/04/2022 21:26, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:e5abeb2f-892f-af8d-0457-c9f8e66ddeb6@linaro.org">On
      4/26/22 05:50, Lucas Mateus Castro(alqotel) wrote:
      <br>
      <blockquote type="cite">+#define VSXGER16(NAME, ORIG_T,
        OR_EL)                                   \
        <br>
        +    void NAME(CPUPPCState *env, uint32_t a_r, uint32_t
        b_r,             \
        <br>
        +              uint32_t  at_r, uint32_t mask, uint32_t
        packed_flags)     \
        <br>
        +   
        {                                                                  
        \
        <br>
        +        ppc_vsr_t
        *at;                                                  \
        <br>
        +        float32 psum, aux_acc, va, vb, vc,
        vd;                          \
        <br>
        +        int i, j, xmsk_bit,
        ymsk_bit;                                   \
        <br>
        +        uint8_t xmsk = mask &amp;
        0x0F;                                     \
        <br>
        +        uint8_t ymsk = (mask &gt;&gt; 4) &amp;
        0x0F;                              \
        <br>
        +        uint8_t pmsk = (mask &gt;&gt; 8) &amp;
        0x3;                               \
        <br>
        +        ppc_vsr_t *b = cpu_vsr_ptr(env,
        b_r);                           \
        <br>
        +        ppc_vsr_t *a = cpu_vsr_ptr(env,
        a_r);                           \
        <br>
        +        float_status *excp_ptr =
        &amp;env-&gt;fp_status;                       \
        <br>
        +        bool acc =
        ger_acc_flag(packed_flags);                          \
        <br>
        +        bool neg_acc =
        ger_neg_acc_flag(packed_flags);                  \
        <br>
        +        bool neg_mul =
        ger_neg_mul_flag(packed_flags);                  \
        <br>
        +        for (i = 0, xmsk_bit = 1 &lt;&lt; 3; i &lt; 4; i++,
        xmsk_bit &gt;&gt;= 1) {    \
        <br>
        +            at = cpu_vsr_ptr(env, at_r +
        i);                            \
        <br>
        +            for (j = 0, ymsk_bit = 1 &lt;&lt; 3; j &lt; 4; j++,
        ymsk_bit &gt;&gt;= 1) {\
        <br>
        +                if ((xmsk_bit &amp; xmsk) &amp;&amp; (ymsk_bit
        &amp; ymsk)) {           \
        <br>
        +                    va = !(pmsk &amp; 2) ? float32_zero
        :                   \
        <br>
        +                                       GET_VSR(Vsr##OR_EL,
        a,           \
        <br>
        +                                               2 * i, ORIG_T,
        float32); \
        <br>
        +                    vb = !(pmsk &amp; 2) ? float32_zero
        :                   \
        <br>
        +                                       GET_VSR(Vsr##OR_EL,
        b,           \
        <br>
        +                                               2 * j, ORIG_T,
        float32); \
        <br>
        +                    vc = !(pmsk &amp; 1) ? float32_zero
        :                   \
        <br>
        +                                       GET_VSR(Vsr##OR_EL,
        a,           \
        <br>
        +                                            2 * i + 1, ORIG_T,
        float32);\
        <br>
        +                    vd = !(pmsk &amp; 1) ? float32_zero
        :                   \
        <br>
        +                                       GET_VSR(Vsr##OR_EL,
        b,           \
        <br>
        +                                            2 * j + 1, ORIG_T,
        float32);\
        <br>
        +                    psum = float32_mul(va, vb,
        excp_ptr);               \
        <br>
        +                    psum = float32_muladd(vc, vd, psum, 0,
        excp_ptr);   \
        <br>
      </blockquote>
      <br>
      This isn't correct -- the intermediate 'prod' (the first multiply)
      is not rounded.  I
      <br>
      think the correct way to implement this (barring new softfloat
      functions) is to compute
      <br>
      the intermediate product as float64 with float_round_to_odd, then
      float64r32_muladd into
      <br>
      the correct rounding mode to finish.
      <br>
    </blockquote>
    While not mentioned in the pseudocode the instruction description
    says:<br>
    <p>- Let prod be the single-precision product of src10 and src20</p>
    <p>Which I understand as the result of the first multiplication
      being stored in a float32</p>
    <p>But in xvbf16ger2* it's different (and I think this is the reason
      the last patch is resulting in the wrong signal in some 0 and inf
      results), the description says:<br>
    </p>
    <p>- Let prod be the product of src10 and src20, having infinite
      precision and unbounded exponent range.
      - Let psum be the sum of the product, src11 multiplied by src21,
      and prod, having infinite precision and
      unbounded exponent range.<br>
      - Let r1 be the value psum with its significand rounded to 24-bit
      precision using the rounding mode specified by RN, but retaining
      unbounded exponent range (i.e., cannot overflow or underflow).</p>
    <blockquote type="cite"
      cite="mid:e5abeb2f-892f-af8d-0457-c9f8e66ddeb6@linaro.org">
      <br>
      <blockquote type="cite">+                    if (acc)
        {                                          \
        <br>
        +                        if (neg_mul)
        {                                  \
        <br>
        +                            psum =
        float32_neg(psum);                   \
        <br>
        +                       
        }                                               \
        <br>
        +                        if (neg_acc)
        {                                  \
        <br>
        +                            aux_acc =
        float32_neg(at-&gt;VsrSF(j));        \
        <br>
        +                        } else
        {                                        \
        <br>
        +                            aux_acc =
        at-&gt;VsrSF(j);                     \
        <br>
        +                       
        }                                               \
        <br>
        +                        at-&gt;VsrSF(j) = float32_add(psum,
        aux_acc,       \
        <br>
        +                                                  
        excp_ptr);           \
        <br>
      </blockquote>
      <br>
      This one, thankfully, uses the rounded intermediate result 'msum',
      so is ok.
      <br>
    </blockquote>
    Yes this one is the easier one to deal with, in the description for
    the xvf16ger2* it specifies that msum and the result is rounded to
    single-precision and in the description for the xvbf16ger2 it
    specifies that r1 is 'rounded to a 24-bit significand precision and
    8-bit exponent range (i.e., single-precision)'<br>
    <blockquote type="cite"
      cite="mid:e5abeb2f-892f-af8d-0457-c9f8e66ddeb6@linaro.org">
      <br>
      Please do convert this from a macro.  Given that float16 and
      bfloat16 are addressed the
      <br>
      same, I think the only callback you need is the conversion from
      float16_to_float64.  Drop
      <br>
      the bf16 accessor to ppc_vsr_t.
      <br>
      <br>
    </blockquote>
    Will do, although I'm considering instead of the callback being the
    conversion, maybe have it be a 4 float multiplication<br>
        typedef float32 mul_4float(float16, float16, float16, float16);<br>
    Since float16 and bfloat16 are addressed the same, any thoughts?<br>
    <blockquote type="cite"
      cite="mid:e5abeb2f-892f-af8d-0457-c9f8e66ddeb6@linaro.org">
      <br>
      r~
      <br>
    </blockquote>
    <div class="moz-signature">-- <br>
      Lucas Mateus M. Araujo e Castro<br>
      <a
href="https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&amp;utm_medium=email&amp;utm_source=RD+Station">Instituto
        de Pesquisas ELDORADO</a><br>
      Departamento Computação Embarcada<br>
      Analista de Software Trainee<br>
      <a href="https://www.eldorado.org.br/disclaimer.html">Aviso Legal
        - Disclaimer</a></div>
  </body>
</html>

--------------4SJgCvy3W391BJtKRzVAHxco--

