Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 682DC5254D9
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 20:29:26 +0200 (CEST)
Received: from localhost ([::1]:33196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npDYz-0006Zg-Dz
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 14:29:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1npClu-0005RP-8n; Thu, 12 May 2022 13:38:43 -0400
Received: from [187.72.171.209] (port=14156 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1npCls-0006w9-A6; Thu, 12 May 2022 13:38:41 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 12 May 2022 14:38:32 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id EE323800177;
 Thu, 12 May 2022 14:38:31 -0300 (-03)
Content-Type: multipart/alternative;
 boundary="------------qp0GUt0ggMu0HdFteR0OCCEj"
Message-ID: <78fc0335-a310-16b8-9cb6-d15aa8061cc1@eldorado.org.br>
Date: Thu, 12 May 2022 14:38:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [RFC PATCH v2 3/7] target/ppc: Implemented pmxvi*ger* instructions
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220506121844.18969-1-lucas.araujo@eldorado.org.br>
 <20220506121844.18969-4-lucas.araujo@eldorado.org.br>
 <49260ca5-169d-3f9a-bfc5-7cce27a85543@linaro.org>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
In-Reply-To: <49260ca5-169d-3f9a-bfc5-7cce27a85543@linaro.org>
X-OriginalArrivalTime: 12 May 2022 17:38:32.0239 (UTC)
 FILETIME=[195813F0:01D86627]
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
--------------qp0GUt0ggMu0HdFteR0OCCEj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 08/05/2022 00:48, Richard Henderson wrote:
> On 5/6/22 07:18, Lucas Mateus Castro(alqotel) wrote:
>
>> +{
>> +    arg_MMIRR_XX3 m;
>> +    m.xa = a->xa;
>> +    m.xb = a->xb;
>> +    m.xt = a->xt;
>> +    m.pmsk = 0xFF;
>> +    m.ymsk = 0xF;
>> +    m.xmsk = 0xF;
>> +    return do_ger_MMIRR_XX3(ctx, &m, helper);
>>   }
>
> Is XX3 going to be used for anything else?  Is it worthwhile to move 
> these into the
> decoder as explicit assignments?
XX3 and MMIRR_XX3 are in different decodetree files, I'll change all 
instructions to use MMIRR_XX3 for the next patch but I'll have to change 
MMIRR_XX3 declaration in target/ppc/insn64.decode to have an !extern in 
it (since it'll need to also be declared in target/ppc/insn32.decode)
>
> Either way,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> r~
-- 
Lucas Mateus M. Araujo e Castro
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>
--------------qp0GUt0ggMu0HdFteR0OCCEj
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 08/05/2022 00:48, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:49260ca5-169d-3f9a-bfc5-7cce27a85543@linaro.org">On
      5/6/22 07:18, Lucas Mateus Castro(alqotel) wrote:
      <br>
      <br>
      <blockquote type="cite">+{
        <br>
        +    arg_MMIRR_XX3 m;
        <br>
        +    m.xa = a-&gt;xa;
        <br>
        +    m.xb = a-&gt;xb;
        <br>
        +    m.xt = a-&gt;xt;
        <br>
        +    m.pmsk = 0xFF;
        <br>
        +    m.ymsk = 0xF;
        <br>
        +    m.xmsk = 0xF;
        <br>
        +    return do_ger_MMIRR_XX3(ctx, &amp;m, helper);
        <br>
          }
        <br>
      </blockquote>
      <br>
      Is XX3 going to be used for anything else?  Is it worthwhile to
      move these into the
      <br>
      decoder as explicit assignments?
      <br>
    </blockquote>
    XX3 and MMIRR_XX3 are in different decodetree files, I'll change all
    instructions to use MMIRR_XX3 for the next patch but I'll have to
    change MMIRR_XX3 declaration in target/ppc/insn64.decode to have an
    !extern in it (since it'll need to also be declared in
    target/ppc/insn32.decode)
    <blockquote type="cite"
      cite="mid:49260ca5-169d-3f9a-bfc5-7cce27a85543@linaro.org">
      <br>
      Either way,
      <br>
      Reviewed-by: Richard Henderson
      <a class="moz-txt-link-rfc2396E" href="mailto:richard.henderson@linaro.org">&lt;richard.henderson@linaro.org&gt;</a>
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

--------------qp0GUt0ggMu0HdFteR0OCCEj--

