Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F17E521CFB
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 16:50:23 +0200 (CEST)
Received: from localhost ([::1]:42300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noRBu-00010g-2m
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 10:50:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1noR9V-0008T7-3W; Tue, 10 May 2022 10:47:54 -0400
Received: from [187.72.171.209] (port=29929 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1noR9S-0006CH-Fs; Tue, 10 May 2022 10:47:52 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 10 May 2022 11:47:41 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id BD24B80046B;
 Tue, 10 May 2022 11:47:40 -0300 (-03)
Content-Type: multipart/alternative;
 boundary="------------gr0WK0NQqlXCelTxo47g0Ayr"
Message-ID: <bf28f183-1d2f-8c28-0a99-af0752ec4ba9@eldorado.org.br>
Date: Tue, 10 May 2022 11:47:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [RFC PATCH v2 5/7] target/ppc: Implemented xvf16ger*
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220506121844.18969-1-lucas.araujo@eldorado.org.br>
 <20220506121844.18969-6-lucas.araujo@eldorado.org.br>
 <748597a5-7d57-0095-afdb-52ebcf5b9e1a@linaro.org>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
In-Reply-To: <748597a5-7d57-0095-afdb-52ebcf5b9e1a@linaro.org>
X-OriginalArrivalTime: 10 May 2022 14:47:41.0024 (UTC)
 FILETIME=[E6514E00:01D8647C]
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
--------------gr0WK0NQqlXCelTxo47g0Ayr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 08/05/2022 01:24, Richard Henderson wrote:
> On 5/6/22 07:18, Lucas Mateus Castro(alqotel) wrote:
>> +static inline float32 float32_neg(float32 a)
>> +{
>> +    if (((a & 0x7f800000) == 0x7f800000) && (a & 0x007fffff)) {
>> +        return a;
>> +    } else {
>> +        return float32_chs(a);
>> +    }
>> +}
>
> This is wrong -- even NaNs get their signs changed.
> Negation and absolute value are non-arithmetic operations.

The PowerISA 3.1 (page 589) defines bfp_negate as:

bfp_NEGATE(x)
x is a binary floating-point value that is represented in the binary 
floating-point working format.
If x is not a NaN, return x with its sign complemented. Otherwise, return x

So this is what I based on to create this function

>
> If you're matching hardware results, this suggests...
>
>> +                    if (neg_mul) {
>> +                        msum = float32_neg(msum);
>> +                    }
>> +                    if (neg_acc) {
>> +                        aux_acc = float32_neg(at[i].VsrSF(j));
>> +                    } else {
>> +                        aux_acc = at[i].VsrSF(j);
>> +                    }
>> +                    at[i].VsrSF(j) = float32_add(msum, aux_acc, 
>> excp_ptr);
>
> This "add" should be "sub" instead of using a separate negation, when 
> required.
> I do wonder about the double-negation vs nans.

But in this case some way to negate msum would still be necessary, so 
maybe move float32_neg to target/ppc/fpu_helper.c and change the name, I 
used 2 negations as a way to keep closer to the description, it is in 
the ISA as:

if “[pm]xvf16ger2pp” then v2 ← bfp_ADD(r1, acc)
if “[pm]xvf16ger2pn” then v2 ← bfp_ADD(r1, bfp_NEGATE(acc))
if “[pm]xvf16ger2np” then v2 ← bfp_ADD(bfp_NEGATE(r1), acc)
if “[pm]xvf16ger2nn” then v2 ← bfp_ADD(bfp_NEGATE(r1), bfp_NEGATE(acc))

But it could easily be change to an add/sub instead like you said

>
> It looks like this could be
>
>   float32_muladd(float32_one, msum, aux_acc, flags, &status)
>
> with flags set to float_muladd_negate_* for neg_mul and neg_acc. Any 
> NaNs would go
> through pick_nan_muladd and fail to be altered.

It would have to be float32_muladd(musm, float32_one, aux_acc, ...) to 
match the hardware result (it looks like qemu preference in a target PPC 
is to return A over C and C over B if all are NaN in a muladd, but A 
over B in a add/sub if both are NaN, so the equivalent of add(A,B) is 
muladd(A, 1, B))

That aside, having a muladd would bring it closer to vsxger over negate 
+ add/sub but personally I think I prefer the latter to not add an 
unnecessary muladd, any opinions?

>
> I'm not sure if I'm suggesting actual use of muladd, for the 
> simplicity, or if you should
> have an inline check for nans.  I might need to think about this in 
> the morning.
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
--------------gr0WK0NQqlXCelTxo47g0Ayr
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 08/05/2022 01:24, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:748597a5-7d57-0095-afdb-52ebcf5b9e1a@linaro.org">On
      5/6/22 07:18, Lucas Mateus Castro(alqotel) wrote:
      <br>
      <blockquote type="cite">+static inline float32 float32_neg(float32
        a)
        <br>
        +{
        <br>
        +    if (((a &amp; 0x7f800000) == 0x7f800000) &amp;&amp; (a
        &amp; 0x007fffff)) {
        <br>
        +        return a;
        <br>
        +    } else {
        <br>
        +        return float32_chs(a);
        <br>
        +    }
        <br>
        +}
        <br>
      </blockquote>
      <br>
      This is wrong -- even NaNs get their signs changed.
      <br>
      Negation and absolute value are non-arithmetic operations.
      <br>
    </blockquote>
    <p>The PowerISA 3.1 (page 589) defines bfp_negate as:</p>
    <p>bfp_NEGATE(x)<br>
      x is a binary floating-point value that is represented in the
      binary floating-point working format.<br>
      If x is not a NaN, return x with its sign complemented. Otherwise,
      return x</p>
    <p>So this is what I based on to create this function<br>
    </p>
    <blockquote type="cite"
      cite="mid:748597a5-7d57-0095-afdb-52ebcf5b9e1a@linaro.org">
      <br>
      If you're matching hardware results, this suggests...
      <br>
      <br>
      <blockquote type="cite">+                    if (neg_mul) {
        <br>
        +                        msum = float32_neg(msum);
        <br>
        +                    }
        <br>
        +                    if (neg_acc) {
        <br>
        +                        aux_acc = float32_neg(at[i].VsrSF(j));
        <br>
        +                    } else {
        <br>
        +                        aux_acc = at[i].VsrSF(j);
        <br>
        +                    }
        <br>
        +                    at[i].VsrSF(j) = float32_add(msum, aux_acc,
        excp_ptr);
        <br>
      </blockquote>
      <br>
      This "add" should be "sub" instead of using a separate negation,
      when required.
      <br>
      I do wonder about the double-negation vs nans.
      <br>
    </blockquote>
    <p>But in this case some way to negate msum would still be
      necessary, so maybe move float32_neg to target/ppc/fpu_helper.c
      and change the name, I used 2 negations as a way to keep closer to
      the description, it is in the ISA as:</p>
    <p>if “[pm]xvf16ger2pp” then v2 ← bfp_ADD(r1, acc)<br>
      if “[pm]xvf16ger2pn” then v2 ← bfp_ADD(r1, bfp_NEGATE(acc))<br>
      if “[pm]xvf16ger2np” then v2 ← bfp_ADD(bfp_NEGATE(r1), acc)<br>
      if “[pm]xvf16ger2nn” then v2 ← bfp_ADD(bfp_NEGATE(r1),
      bfp_NEGATE(acc))</p>
    <p>But it could easily be change to an add/sub instead like you said<br>
    </p>
    <blockquote type="cite"
      cite="mid:748597a5-7d57-0095-afdb-52ebcf5b9e1a@linaro.org">
      <br>
      It looks like this could be
      <br>
      <br>
        float32_muladd(float32_one, msum, aux_acc, flags, &amp;status)
      <br>
      <br>
      with flags set to float_muladd_negate_* for neg_mul and neg_acc. 
      Any NaNs would go
      <br>
      through pick_nan_muladd and fail to be altered.
      <br>
    </blockquote>
    <p>It would have to be float32_muladd(musm, float32_one, aux_acc,
      ...) to match the hardware result (it looks like qemu preference
      in a target PPC is to return A over C and C over B if all are NaN
      in a muladd, but A over B in a add/sub if both are NaN, so the
      equivalent of add(A,B) is muladd(A, 1, B))</p>
    <p>That aside, having a muladd would bring it closer to vsxger over
      negate + add/sub but personally I think I prefer the latter to not
      add an unnecessary muladd, any opinions?<br>
    </p>
    <blockquote type="cite"
      cite="mid:748597a5-7d57-0095-afdb-52ebcf5b9e1a@linaro.org">
      <br>
      I'm not sure if I'm suggesting actual use of muladd, for the
      simplicity, or if you should
      <br>
      have an inline check for nans.  I might need to think about this
      in the morning.
      <br>
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

--------------gr0WK0NQqlXCelTxo47g0Ayr--

