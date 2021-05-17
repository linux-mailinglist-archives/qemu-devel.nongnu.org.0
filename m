Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3C9382B35
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 13:36:40 +0200 (CEST)
Received: from localhost ([::1]:57964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libY7-0004j2-8z
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 07:36:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lib60-0003Ej-Q3; Mon, 17 May 2021 07:07:37 -0400
Received: from [201.28.113.2] (port=11165 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lib5u-0006Su-Hk; Mon, 17 May 2021 07:07:36 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 17 May 2021 08:07:24 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 7F85F8000C2;
 Mon, 17 May 2021 08:07:24 -0300 (-03)
Subject: Re: [PATCH 09/11] include/exec: added functions to the stubs in
 exec-all.h
To: David Gibson <david@gibson.dropbear.id.au>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-10-bruno.larsen@eldorado.org.br>
 <c4b7cba3-eb5f-ff65-9376-da9dc8edf45f@linaro.org>
 <f0fbb69b-76e9-c951-f18d-cfc4629f5f2a@eldorado.org.br>
 <YKHpSU6Kbtj+C4o0@yekko>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <92660b00-e2a4-056b-0a66-e729f502cc19@eldorado.org.br>
Date: Mon, 17 May 2021 08:07:24 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKHpSU6Kbtj+C4o0@yekko>
Content-Type: multipart/alternative;
 boundary="------------0F44AA6552AD46241CAB5FEB"
Content-Language: en-US
X-OriginalArrivalTime: 17 May 2021 11:07:24.0911 (UTC)
 FILETIME=[D103FFF0:01D74B0C]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: farosas@linux.ibm.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, luis.pires@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------0F44AA6552AD46241CAB5FEB
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit


On 17/05/2021 00:55, David Gibson wrote:
> On Thu, May 13, 2021 at 11:03:24AM -0300, Lucas Mateus Martins Araujo e Castro wrote:
>> On 12/05/2021 15:34, Richard Henderson wrote:
>>> On 5/12/21 9:08 AM, Bruno Larsen (billionai) wrote:
>>>> From: "Lucas Mateus Castro (alqotel)"<lucas.araujo@eldorado.org.br>
>>>>
>>>> Added tlb_set_page and tlb_set_page_with_attrs to the
>>>> stubbed functions in exec-all.h  as it is needed
>>>> in some functions when compiling without TCG
>>>>
>>>> Signed-off-by: Lucas Mateus Castro
>>>> (alqotel)<lucas.araujo@eldorado.org.br>
>>>> ---
>>>>    include/exec/exec-all.h | 10 ++++++++++
>>>>    1 file changed, 10 insertions(+)
>>> No, the caller is tcg-specific already.
>>>
>>>
>>> r~
>> tlb_set_page is called by many ppc_hash64_handle_mmu_fault,
>> ppc_radix64_handle_mmu_fault and ppc_hash32_handle_mmu_fault, all of which
>> from what I've seen are only used inside #if defined(CONFIG_SOFTMMU). So
>> what is the best way to deal with these tlb_set_page calls? Should these
>> part of the _handle_mmu_fault functions never be reached or should
>> these
> The handle_mmu_fault() functions per se shouldn't be included in a
> !SOFTMMU build.  We might have to extract some of their internal logic
> for the gdb path, though.
>
>> functions never be called?
>>
>> If it's the latter then should we change the #if defined to #if
>> defined(CONFIG_SOFTMMU) && (CONFIG_TCG)?
> That definitely doesn't make sense.  In practice CONFIG_SOFTMMU == CONFIG_TCG.
We figured it was the case, but from what I can tell, CONFIG_SOFTMMU is 
set when parsing the target list (in the configure script) and 
CONFIG_TCG is set later, when parsing which accelerators were requested. 
So even though SOFTMMU should imply TCG, the way it is coded right now 
doesn't. We could also try and change the configure script, but neither 
of us is really good with bash scripts, so this was the next best 
solution we came up with.
>
>>
>> P.S: There was a miscommunication between me and Bruno, this should've been
>> a RFC.
>>
-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------0F44AA6552AD46241CAB5FEB
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 17/05/2021 00:55, David Gibson
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YKHpSU6Kbtj+C4o0@yekko">
      <pre class="moz-quote-pre" wrap="">On Thu, May 13, 2021 at 11:03:24AM -0300, Lucas Mateus Martins Araujo e Castro wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On 12/05/2021 15:34, Richard Henderson wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On 5/12/21 9:08 AM, Bruno Larsen (billionai) wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">From: "Lucas Mateus Castro (alqotel)"<a class="moz-txt-link-rfc2396E" href="mailto:lucas.araujo@eldorado.org.br">&lt;lucas.araujo@eldorado.org.br&gt;</a>

Added tlb_set_page and tlb_set_page_with_attrs to the
stubbed functions in exec-all.h  as it is needed
in some functions when compiling without TCG

Signed-off-by: Lucas Mateus Castro
(alqotel)<a class="moz-txt-link-rfc2396E" href="mailto:lucas.araujo@eldorado.org.br">&lt;lucas.araujo@eldorado.org.br&gt;</a>
---
  include/exec/exec-all.h | 10 ++++++++++
  1 file changed, 10 insertions(+)
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
No, the caller is tcg-specific already.


r~
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
tlb_set_page is called by many ppc_hash64_handle_mmu_fault,
ppc_radix64_handle_mmu_fault and ppc_hash32_handle_mmu_fault, all of which
from what I've seen are only used inside #if defined(CONFIG_SOFTMMU). So
what is the best way to deal with these tlb_set_page calls? Should these
part of the _handle_mmu_fault functions never be reached or should
these
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
The handle_mmu_fault() functions per se shouldn't be included in a
!SOFTMMU build.  We might have to extract some of their internal logic
for the gdb path, though.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">functions never be called?

If it's the latter then should we change the #if defined to #if
defined(CONFIG_SOFTMMU) &amp;&amp; (CONFIG_TCG)?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
That definitely doesn't make sense.  In practice CONFIG_SOFTMMU == CONFIG_TCG.</pre>
    </blockquote>
    We figured it was the case, but from what I can tell, CONFIG_SOFTMMU
    is set when parsing the target list (in the configure script) and
    CONFIG_TCG is set later, when parsing which accelerators were
    requested. So even though SOFTMMU should imply TCG, the way it is
    coded right now doesn't. We could also try and change the configure
    script, but neither of us is really good with bash scripts, so this
    was the next best solution we came up with.<br>
    <blockquote type="cite" cite="mid:YKHpSU6Kbtj+C4o0@yekko">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

P.S: There was a miscommunication between me and Bruno, this should've been
a RFC.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <div class="moz-signature">-- <br>
      Bruno Piazera Larsen<br>
      <a
href="https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&amp;utm_medium=email&amp;utm_source=RD+Station">Instituto
        de Pesquisas ELDORADO</a><br>
      Departamento Computação Embarcada<br>
      Analista de Software Trainee<br>
      <a href="https://www.eldorado.org.br/disclaimer.html">Aviso Legal
        - Disclaimer</a></div>
  </body>
</html>

--------------0F44AA6552AD46241CAB5FEB--

