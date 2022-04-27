Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B55325123DD
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 22:27:05 +0200 (CEST)
Received: from localhost ([::1]:59456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njoFb-0004uc-NZ
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 16:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1njoDZ-00044a-P9; Wed, 27 Apr 2022 16:24:57 -0400
Received: from [187.72.171.209] (port=4995 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1njoDX-0002F5-Gh; Wed, 27 Apr 2022 16:24:57 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 27 Apr 2022 17:24:48 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 9AF7880031A;
 Wed, 27 Apr 2022 17:24:48 -0300 (-03)
Content-Type: multipart/alternative;
 boundary="------------yPYR02gCboN0objwXng0vj5q"
Message-ID: <d160958f-6703-8af7-aa8f-f3843d9b1066@eldorado.org.br>
Date: Wed, 27 Apr 2022 17:24:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 2/7] target/ppc: Implemented xvi*ger* instructions
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org
References: <20220426125028.18844-1-lucas.araujo@eldorado.org.br>
 <20220426125028.18844-3-lucas.araujo@eldorado.org.br>
 <7f3f38ab-9a15-3202-5c15-8159e95af6ab@linaro.org>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
In-Reply-To: <7f3f38ab-9a15-3202-5c15-8159e95af6ab@linaro.org>
X-OriginalArrivalTime: 27 Apr 2022 20:24:48.0842 (UTC)
 FILETIME=[D7AAA2A0:01D85A74]
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Greg Kurz <groug@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------yPYR02gCboN0objwXng0vj5q
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 26/04/2022 20:40, Richard Henderson wrote:
>
> On 4/26/22 05:50, Lucas Mateus Castro(alqotel) wrote:
>> +%xx_at          23:3 !function=times_4
>> +@XX3_at         ...... ... .. ..... ..... ........ ... &XX3 
>> xt=%xx_at xb=%xx_xb
>
> Hmm.  Depends, I suppose on whether you want acc[0-7] or vsr[0-28]
I mostly used VSR function here, but since I'll change the patch 1 to 
your suggestion (which will require creating acc_full_offset) I'll make 
a few changes to create some functions for the accumulator
>
>> +/*
>> + * Packed VSX Integer GER Flags
>> + * 00 - no accumulation no saturation
>> + * 01 - accumulate but no saturation
>> + * 10 - no accumulation but with saturation
>> + * 11 - accumulate with saturation
>> + */
>> +static inline bool get_sat(uint32_t flags)
>> +{
>> +    return flags & 0x2;
>> +}
>> +
>> +static inline bool get_acc(uint32_t flags)
>> +{
>> +    return flags & 0x1;
>> +}
>
> Better to have separate helpers for these?  They'd be immediate 
> operands to the function
> replacing XVIGER (see below) and thus optimize well.
Do you mean different functions or a function that receives packed_flags 
along with the callback functions?
>
>> +#define GET_VsrN(a, i) (extract32(a->VsrB((i) / 2), (i) % 2 ? 4 : 0, 
>> 4))
>> +#define GET_VsrB(a, i) a->VsrB(i)
>> +#define GET_VsrH(a, i) a->VsrH(i)
>> +
>> +#define GET_VsrSN(a, i) (sextract32(a->VsrSB((i) / 2), (i) % 2 ? 4 : 
>> 0, 4))
>> +#define GET_VsrSB(a, i) a->VsrSB(i)
>> +#define GET_VsrSH(a, i) a->VsrSH(i)
>
> These can be made into functions of the form
>
>     typedef int32_t xviger_extract(ppc_vsr_t *a, int i);
>
In this case it'd be necessary to receive 2 xviger_extract functions 
since XVI8GER4* multiply one value as signed and the other as unsigned 
(and other integer GER treat both as signed).

An alternative would be to isolate the innermost loop into a different 
function, like:

     typedef int64_t do_ger(int32_t a, int32_t b, int32_t at, int32_t pmsk);

     static int64_t ger_rank4(int32_t a, int32_t b, int32_t at, int32_t 
mask)
     {
         int64_t psum = 0, i;
         for (i = 0; i < 4; i++, mask >>= 1) {
             if (mask & 1) {
                 psum += (sextract32(a, i * 8, 8)) * (extract32(b, i * 
8, 8));
            }
         }
         return psum;
     }

That way we could avoid having 'rank' as a parameter, what do you think?

>
>
>> diff --git a/target/ppc/internal.h b/target/ppc/internal.h
>> index 8094e0b033..a994d98238 100644
>> --- a/target/ppc/internal.h
>> +++ b/target/ppc/internal.h
>> @@ -291,4 +291,32 @@ G_NORETURN void 
>> ppc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>>                                               uintptr_t retaddr);
>>   #endif
>>
>> +/*
>> + * Auxiliary functions to pack/unpack masks for GER instructions.
>> + *
>> + * Packed format:
>> + *  Bits 0-3: xmsk
>> + *  Bits 4-7: ymsk
>> + *  Bits 8-15: pmsk
>> + */
>> +static inline uint8_t ger_get_xmsk(uint32_t packed_masks)
>> +{
>> +    return packed_masks & 0xF;
>> +}
>> +
>> +static inline uint8_t ger_get_ymsk(uint32_t packed_masks)
>> +{
>> +    return (packed_masks >> 4) & 0xF;
>> +}
>> +
>> +static inline uint8_t ger_get_pmsk(uint32_t packed_masks)
>> +{
>> +    return (packed_masks >> 8) & 0xFF;
>> +}
>> +
>> +static inline int ger_pack_masks(int pmsk, int ymsk, int xmsk)
>> +{
>> +    return (pmsk & 0xFF) << 8 | (ymsk & 0xF) << 4 | (xmsk & 0xF);
>> +}
>
> Use hw/registerfields.h.  C.f. PREDDESC in target/arm/internals.h.
Ok, will do
>
>> +static bool do_ger_XX3(DisasContext *ctx, arg_XX3 *a, uint32_t op,
>> +                             void (*helper)(TCGv_env, TCGv_i32, 
>> TCGv_i32,
>> +                                            TCGv_i32, TCGv_i32, 
>> TCGv_i32))
>> +{
>> +    uint32_t mask;
>> +    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
>> +    REQUIRE_VSX(ctx);
>> +    if (unlikely((a->xa / 4 == a->xt / 4) || (a->xb / 4 == a->xt / 
>> 4))) {
>> +        gen_invalid(ctx);
>> +        return true;
>> +    }
>> +
>> +    mask = 0xFFFFFFFF;
>> +    helper(cpu_env, tcg_constant_i32(a->xa), tcg_constant_i32(a->xb),
>> +           tcg_constant_i32(a->xt), tcg_constant_i32(mask),
>> +           tcg_constant_i32(op));
>> +    return true;
>> +}
>
> Why are you passing register numbers instead of pointers, like 
> everywhere else?
Because here we are not working only with 1 register per register 
number, the ACC uses 4 and the XVF64GER* needs to use XA and XA+1, and 
while VSR is an array so I could do ppc_vsr_ptr+1 I thought it was 
better not to access memory I was not given a pointer to, so I passed XA 
so I can request cpu_vsr_ptr(env, xa) and cpu_vsr_ptr(env, xa + 1)
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
--------------yPYR02gCboN0objwXng0vj5q
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 26/04/2022 20:40, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:7f3f38ab-9a15-3202-5c15-8159e95af6ab@linaro.org"><br>
      On 4/26/22 05:50, Lucas Mateus Castro(alqotel) wrote:
      <br>
      <blockquote type="cite">+%xx_at          23:3 !function=times_4
        <br>
        +@XX3_at         ...... ... .. ..... ..... ........ ...         
        &amp;XX3 xt=%xx_at xb=%xx_xb
        <br>
      </blockquote>
      <br>
      Hmm.  Depends, I suppose on whether you want acc[0-7] or vsr[0-28]
      <br>
    </blockquote>
    I mostly used VSR function here, but since I'll change the patch 1
    to your suggestion (which will require creating acc_full_offset)
    I'll make a few changes to create some functions for the accumulator<br>
    <blockquote type="cite"
      cite="mid:7f3f38ab-9a15-3202-5c15-8159e95af6ab@linaro.org">
      <br>
      <blockquote type="cite">+/*
        <br>
        + * Packed VSX Integer GER Flags
        <br>
        + * 00 - no accumulation no saturation
        <br>
        + * 01 - accumulate but no saturation
        <br>
        + * 10 - no accumulation but with saturation
        <br>
        + * 11 - accumulate with saturation
        <br>
        + */
        <br>
        +static inline bool get_sat(uint32_t flags)
        <br>
        +{
        <br>
        +    return flags &amp; 0x2;
        <br>
        +}
        <br>
        +
        <br>
        +static inline bool get_acc(uint32_t flags)
        <br>
        +{
        <br>
        +    return flags &amp; 0x1;
        <br>
        +}
        <br>
      </blockquote>
      <br>
      Better to have separate helpers for these?  They'd be immediate
      operands to the function
      <br>
      replacing XVIGER (see below) and thus optimize well.
      <br>
    </blockquote>
    Do you mean different functions or a function that receives
    packed_flags along with the callback functions?<br>
    <blockquote type="cite"
      cite="mid:7f3f38ab-9a15-3202-5c15-8159e95af6ab@linaro.org">
      <br>
      <blockquote type="cite">+#define GET_VsrN(a, i)
        (extract32(a-&gt;VsrB((i) / 2), (i) % 2 ? 4 : 0, 4))
        <br>
        +#define GET_VsrB(a, i) a-&gt;VsrB(i)
        <br>
        +#define GET_VsrH(a, i) a-&gt;VsrH(i)
        <br>
        +
        <br>
        +#define GET_VsrSN(a, i) (sextract32(a-&gt;VsrSB((i) / 2), (i) %
        2 ? 4 : 0, 4))
        <br>
        +#define GET_VsrSB(a, i) a-&gt;VsrSB(i)
        <br>
        +#define GET_VsrSH(a, i) a-&gt;VsrSH(i)
        <br>
      </blockquote>
      <br>
      These can be made into functions of the form
      <br>
      <br>
          typedef int32_t xviger_extract(ppc_vsr_t *a, int i);
      <br>
      <br>
    </blockquote>
    <p>In this case it'd be necessary to receive 2 xviger_extract
      functions since XVI8GER4* multiply one value as signed and the
      other as unsigned (and other integer GER treat both as signed).</p>
    <p>An alternative would be to isolate the innermost loop into a
      different function, like:</p>
    <p>    typedef int64_t do_ger(int32_t a, int32_t b, int32_t at,
      int32_t pmsk);<br>
    </p>
    <p>    static int64_t ger_rank4(int32_t a, int32_t b, int32_t at,
      int32_t mask)<br>
          {<br>
              int64_t psum = 0, i;<br>
              for (i = 0; i &lt; 4; i++, mask &gt;&gt;= 1) {<br>
                  if (mask &amp; 1) {<br>
                      psum += (sextract32(a, i * 8, 8)) * (extract32(b,
      i * 8, 8));<br>
                 }<br>
              }<br>
              return psum;<br>
          }</p>
    <p>That way we could avoid having 'rank' as a parameter, what do you
      think?<br>
    </p>
    <blockquote type="cite"
      cite="mid:7f3f38ab-9a15-3202-5c15-8159e95af6ab@linaro.org">
      <br>
      <br>
      <blockquote type="cite">diff --git a/target/ppc/internal.h
        b/target/ppc/internal.h
        <br>
        index 8094e0b033..a994d98238 100644
        <br>
        --- a/target/ppc/internal.h
        <br>
        +++ b/target/ppc/internal.h
        <br>
        @@ -291,4 +291,32 @@ G_NORETURN void
        ppc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
        <br>
                                                      uintptr_t
        retaddr);
        <br>
          #endif
        <br>
        <br>
        +/*
        <br>
        + * Auxiliary functions to pack/unpack masks for GER
        instructions.
        <br>
        + *
        <br>
        + * Packed format:
        <br>
        + *  Bits 0-3: xmsk
        <br>
        + *  Bits 4-7: ymsk
        <br>
        + *  Bits 8-15: pmsk
        <br>
        + */
        <br>
        +static inline uint8_t ger_get_xmsk(uint32_t packed_masks)
        <br>
        +{
        <br>
        +    return packed_masks &amp; 0xF;
        <br>
        +}
        <br>
        +
        <br>
        +static inline uint8_t ger_get_ymsk(uint32_t packed_masks)
        <br>
        +{
        <br>
        +    return (packed_masks &gt;&gt; 4) &amp; 0xF;
        <br>
        +}
        <br>
        +
        <br>
        +static inline uint8_t ger_get_pmsk(uint32_t packed_masks)
        <br>
        +{
        <br>
        +    return (packed_masks &gt;&gt; 8) &amp; 0xFF;
        <br>
        +}
        <br>
        +
        <br>
        +static inline int ger_pack_masks(int pmsk, int ymsk, int xmsk)
        <br>
        +{
        <br>
        +    return (pmsk &amp; 0xFF) &lt;&lt; 8 | (ymsk &amp; 0xF)
        &lt;&lt; 4 | (xmsk &amp; 0xF);
        <br>
        +}
        <br>
      </blockquote>
      <br>
      Use hw/registerfields.h.  C.f. PREDDESC in target/arm/internals.h.
      <br>
    </blockquote>
    Ok, will do<br>
    <blockquote type="cite"
      cite="mid:7f3f38ab-9a15-3202-5c15-8159e95af6ab@linaro.org">
      <br>
      <blockquote type="cite">+static bool do_ger_XX3(DisasContext *ctx,
        arg_XX3 *a, uint32_t op,
        <br>
        +                             void (*helper)(TCGv_env, TCGv_i32,
        TCGv_i32,
        <br>
        +                                            TCGv_i32, TCGv_i32,
        TCGv_i32))
        <br>
        +{
        <br>
        +    uint32_t mask;
        <br>
        +    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
        <br>
        +    REQUIRE_VSX(ctx);
        <br>
        +    if (unlikely((a-&gt;xa / 4 == a-&gt;xt / 4) || (a-&gt;xb /
        4 == a-&gt;xt / 4))) {
        <br>
        +        gen_invalid(ctx);
        <br>
        +        return true;
        <br>
        +    }
        <br>
        +
        <br>
        +    mask = 0xFFFFFFFF;
        <br>
        +    helper(cpu_env, tcg_constant_i32(a-&gt;xa),
        tcg_constant_i32(a-&gt;xb),
        <br>
        +           tcg_constant_i32(a-&gt;xt), tcg_constant_i32(mask),
        <br>
        +           tcg_constant_i32(op));
        <br>
        +    return true;
        <br>
        +}
        <br>
      </blockquote>
      <br>
      Why are you passing register numbers instead of pointers, like
      everywhere else?
      <br>
    </blockquote>
    Because here we are not working only with 1 register per register
    number, the ACC uses 4 and the XVF64GER* needs to use XA and XA+1,
    and while VSR is an array so I could do ppc_vsr_ptr+1 I thought it
    was better not to access memory I was not given a pointer to, so I
    passed XA so I can request cpu_vsr_ptr(env, xa) and cpu_vsr_ptr(env,
    xa + 1)<br>
    <blockquote type="cite"
      cite="mid:7f3f38ab-9a15-3202-5c15-8159e95af6ab@linaro.org">
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

--------------yPYR02gCboN0objwXng0vj5q--

