Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 456CA51FB8F
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 13:47:34 +0200 (CEST)
Received: from localhost ([::1]:60886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no1rR-0005wY-3l
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 07:47:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1no1eA-0006rt-Aj; Mon, 09 May 2022 07:33:52 -0400
Received: from [187.72.171.209] (port=14888 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1no1e7-0005S8-61; Mon, 09 May 2022 07:33:49 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 9 May 2022 08:33:39 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 137E8800068;
 Mon,  9 May 2022 08:33:39 -0300 (-03)
Content-Type: multipart/alternative;
 boundary="------------MqIWsYMwBWzjshYaDHca4RJE"
Message-ID: <50e33a23-83c1-9752-5684-68d90a49bb42@eldorado.org.br>
Date: Mon, 9 May 2022 08:33:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [RFC PATCH v2 4/7] target/ppc: Implemented xvf*ger*
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220506121844.18969-1-lucas.araujo@eldorado.org.br>
 <20220506121844.18969-5-lucas.araujo@eldorado.org.br>
 <a846d013-881d-943e-8042-5696fbe6f102@linaro.org>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
In-Reply-To: <a846d013-881d-943e-8042-5696fbe6f102@linaro.org>
X-OriginalArrivalTime: 09 May 2022 11:33:39.0309 (UTC)
 FILETIME=[A0E6D1D0:01D86398]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------MqIWsYMwBWzjshYaDHca4RJE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 08/05/2022 01:03, Richard Henderson wrote:
>
>
> On 5/6/22 07:18, Lucas Mateus Castro(alqotel) wrote:
>> From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
>>
>> Implement the following PowerISA v3.1 instructions:
>> xvf32ger:   VSX Vector 32-bit Floating-Point GER (rank-1 update)
>> xvf32gernn: VSX Vector 32-bit Floating-Point GER (rank-1 update) 
>> Negative
>> multiply, Negative accumulate
>> xvf32gernp: VSX Vector 32-bit Floating-Point GER (rank-1 update) 
>> Negative
>> multiply, Positive accumulate
>> xvf32gerpn: VSX Vector 32-bit Floating-Point GER (rank-1 update) 
>> Positive
>> multiply, Negative accumulate
>> xvf32gerpp: VSX Vector 32-bit Floating-Point GER (rank-1 update) 
>> Positive
>> multiply, Positive accumulate
>> xvf64ger:   VSX Vector 64-bit Floating-Point GER (rank-1 update)
>> xvf64gernn: VSX Vector 64-bit Floating-Point GER (rank-1 update) 
>> Negative
>> multiply, Negative accumulate
>> xvf64gernp: VSX Vector 64-bit Floating-Point GER (rank-1 update) 
>> Negative
>> multiply, Positive accumulate
>> xvf64gerpn: VSX Vector 64-bit Floating-Point GER (rank-1 update) 
>> Positive
>> multiply, Negative accumulate
>> xvf64gerpp: VSX Vector 64-bit Floating-Point GER (rank-1 update) 
>> Positive
>> multiply, Positive accumulate
>>
>> Signed-off-by: Lucas Mateus Castro (alqotel) 
>> <lucas.araujo@eldorado.org.br>
>> ---
>>   target/ppc/cpu.h                    |   4 +
>>   target/ppc/fpu_helper.c             | 178 ++++++++++++++++++++++++++++
>>   target/ppc/helper.h                 |  10 ++
>>   target/ppc/insn32.decode            |  13 ++
>>   target/ppc/translate/vsx-impl.c.inc |  12 ++
>>   5 files changed, 217 insertions(+)
>>
>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>> index 348a898950..eb50ad699e 100644
>> --- a/target/ppc/cpu.h
>> +++ b/target/ppc/cpu.h
>> @@ -2639,6 +2639,8 @@ static inline bool lsw_reg_in_range(int start, 
>> int nregs, int rx)
>>   #define VsrSW(i) s32[i]
>>   #define VsrD(i) u64[i]
>>   #define VsrSD(i) s64[i]
>> +#define VsrSF(i) f32[i]
>> +#define VsrDF(i) f64[i]
>>   #else
>>   #define VsrB(i) u8[15 - (i)]
>>   #define VsrSB(i) s8[15 - (i)]
>> @@ -2648,6 +2650,8 @@ static inline bool lsw_reg_in_range(int start, 
>> int nregs, int rx)
>>   #define VsrSW(i) s32[3 - (i)]
>>   #define VsrD(i) u64[1 - (i)]
>>   #define VsrSD(i) s64[1 - (i)]
>> +#define VsrSF(i) f32[3 - (i)]
>> +#define VsrDF(i) f64[1 - (i)]
>>   #endif
>>
>>   static inline int vsr64_offset(int i, bool high)
>> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
>> index f6c8318a71..138b30d08f 100644
>> --- a/target/ppc/fpu_helper.c
>> +++ b/target/ppc/fpu_helper.c
>> @@ -3462,3 +3462,181 @@ void helper_xssubqp(CPUPPCState *env, 
>> uint32_t opcode,
>>       *xt = t;
>>       do_float_check_status(env, GETPC());
>>   }
>> +
>> +static void set_rounding_mode_rn(CPUPPCState *env)
>> +{
>> +    uint8_t rmode = (env->fpscr & FP_RN) >> FPSCR_RN0;
>> +    switch (rmode) {
>> +    case 0:
>> +        set_float_rounding_mode(float_round_nearest_even, 
>> &env->fp_status);
>> +        break;
>> +    case 1:
>> +        set_float_rounding_mode(float_round_to_zero, &env->fp_status);
>> +        break;
>> +    case 2:
>> +        set_float_rounding_mode(float_round_up, &env->fp_status);
>> +        break;
>> +    case 3:
>> +        set_float_rounding_mode(float_round_down, &env->fp_status);
>> +        break;
>> +    default:
>> +        abort();
>> +    }
>> +}
>
> How is this different from fpscr_set_rounding_mode and why do you need 
> to call it at all?
It's not, I was worried that my tests weren't getting some edge case and 
searching in target/ppc/fpu_helper.c I couldn't find a function to set 
the rounding mode so I decided to create this one, but looking back now 
it's completely unnecessary so I'll remove it in v3.
>
>
> r~
-- 
Lucas Mateus M. Araujo e Castro
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>
--------------MqIWsYMwBWzjshYaDHca4RJE
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 08/05/2022 01:03, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:a846d013-881d-943e-8042-5696fbe6f102@linaro.org"><br>
      <br>
      On 5/6/22 07:18, Lucas Mateus Castro(alqotel) wrote:
      <br>
      <blockquote type="cite">From: "Lucas Mateus Castro (alqotel)"
        <a class="moz-txt-link-rfc2396E" href="mailto:lucas.araujo@eldorado.org.br">&lt;lucas.araujo@eldorado.org.br&gt;</a>
        <br>
        <br>
        Implement the following PowerISA v3.1 instructions:
        <br>
        xvf32ger:   VSX Vector 32-bit Floating-Point GER (rank-1 update)
        <br>
        xvf32gernn: VSX Vector 32-bit Floating-Point GER (rank-1 update)
        Negative
        <br>
        multiply, Negative accumulate
        <br>
        xvf32gernp: VSX Vector 32-bit Floating-Point GER (rank-1 update)
        Negative
        <br>
        multiply, Positive accumulate
        <br>
        xvf32gerpn: VSX Vector 32-bit Floating-Point GER (rank-1 update)
        Positive
        <br>
        multiply, Negative accumulate
        <br>
        xvf32gerpp: VSX Vector 32-bit Floating-Point GER (rank-1 update)
        Positive
        <br>
        multiply, Positive accumulate
        <br>
        xvf64ger:   VSX Vector 64-bit Floating-Point GER (rank-1 update)
        <br>
        xvf64gernn: VSX Vector 64-bit Floating-Point GER (rank-1 update)
        Negative
        <br>
        multiply, Negative accumulate
        <br>
        xvf64gernp: VSX Vector 64-bit Floating-Point GER (rank-1 update)
        Negative
        <br>
        multiply, Positive accumulate
        <br>
        xvf64gerpn: VSX Vector 64-bit Floating-Point GER (rank-1 update)
        Positive
        <br>
        multiply, Negative accumulate
        <br>
        xvf64gerpp: VSX Vector 64-bit Floating-Point GER (rank-1 update)
        Positive
        <br>
        multiply, Positive accumulate
        <br>
        <br>
        Signed-off-by: Lucas Mateus Castro (alqotel)
        <a class="moz-txt-link-rfc2396E" href="mailto:lucas.araujo@eldorado.org.br">&lt;lucas.araujo@eldorado.org.br&gt;</a>
        <br>
        ---
        <br>
          target/ppc/cpu.h                    |   4 +
        <br>
          target/ppc/fpu_helper.c             | 178
        ++++++++++++++++++++++++++++
        <br>
          target/ppc/helper.h                 |  10 ++
        <br>
          target/ppc/insn32.decode            |  13 ++
        <br>
          target/ppc/translate/vsx-impl.c.inc |  12 ++
        <br>
          5 files changed, 217 insertions(+)
        <br>
        <br>
        diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
        <br>
        index 348a898950..eb50ad699e 100644
        <br>
        --- a/target/ppc/cpu.h
        <br>
        +++ b/target/ppc/cpu.h
        <br>
        @@ -2639,6 +2639,8 @@ static inline bool lsw_reg_in_range(int
        start, int nregs, int rx)
        <br>
          #define VsrSW(i) s32[i]
        <br>
          #define VsrD(i) u64[i]
        <br>
          #define VsrSD(i) s64[i]
        <br>
        +#define VsrSF(i) f32[i]
        <br>
        +#define VsrDF(i) f64[i]
        <br>
          #else
        <br>
          #define VsrB(i) u8[15 - (i)]
        <br>
          #define VsrSB(i) s8[15 - (i)]
        <br>
        @@ -2648,6 +2650,8 @@ static inline bool lsw_reg_in_range(int
        start, int nregs, int rx)
        <br>
          #define VsrSW(i) s32[3 - (i)]
        <br>
          #define VsrD(i) u64[1 - (i)]
        <br>
          #define VsrSD(i) s64[1 - (i)]
        <br>
        +#define VsrSF(i) f32[3 - (i)]
        <br>
        +#define VsrDF(i) f64[1 - (i)]
        <br>
          #endif
        <br>
        <br>
          static inline int vsr64_offset(int i, bool high)
        <br>
        diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
        <br>
        index f6c8318a71..138b30d08f 100644
        <br>
        --- a/target/ppc/fpu_helper.c
        <br>
        +++ b/target/ppc/fpu_helper.c
        <br>
        @@ -3462,3 +3462,181 @@ void helper_xssubqp(CPUPPCState *env,
        uint32_t opcode,
        <br>
              *xt = t;
        <br>
              do_float_check_status(env, GETPC());
        <br>
          }
        <br>
        +
        <br>
        +static void set_rounding_mode_rn(CPUPPCState *env)
        <br>
        +{
        <br>
        +    uint8_t rmode = (env-&gt;fpscr &amp; FP_RN) &gt;&gt;
        FPSCR_RN0;
        <br>
        +    switch (rmode) {
        <br>
        +    case 0:
        <br>
        +        set_float_rounding_mode(float_round_nearest_even,
        &amp;env-&gt;fp_status);
        <br>
        +        break;
        <br>
        +    case 1:
        <br>
        +        set_float_rounding_mode(float_round_to_zero,
        &amp;env-&gt;fp_status);
        <br>
        +        break;
        <br>
        +    case 2:
        <br>
        +        set_float_rounding_mode(float_round_up,
        &amp;env-&gt;fp_status);
        <br>
        +        break;
        <br>
        +    case 3:
        <br>
        +        set_float_rounding_mode(float_round_down,
        &amp;env-&gt;fp_status);
        <br>
        +        break;
        <br>
        +    default:
        <br>
        +        abort();
        <br>
        +    }
        <br>
        +}
        <br>
      </blockquote>
      <br>
      How is this different from fpscr_set_rounding_mode and why do you
      need to call it at all?
      <br>
    </blockquote>
    It's not, I was worried that my tests weren't getting some edge case
    and searching in target/ppc/fpu_helper.c I couldn't find a function
    to set the rounding mode so I decided to create this one, but
    looking back now it's completely unnecessary so I'll remove it in
    v3.<br>
    <blockquote type="cite"
      cite="mid:a846d013-881d-943e-8042-5696fbe6f102@linaro.org">
      <br>
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

--------------MqIWsYMwBWzjshYaDHca4RJE--

