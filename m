Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBE0383AB6
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 19:06:30 +0200 (CEST)
Received: from localhost ([::1]:54818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lighJ-0002Rl-Gw
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 13:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ligbW-00058H-AF; Mon, 17 May 2021 13:00:31 -0400
Received: from [201.28.113.2] (port=58597 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ligbT-0001DN-AR; Mon, 17 May 2021 13:00:29 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 17 May 2021 13:59:36 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 1C8D88000C2;
 Mon, 17 May 2021 13:59:36 -0300 (-03)
Subject: Re: [PATCH 09/11] include/exec: added functions to the stubs in
 exec-all.h
To: David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-10-bruno.larsen@eldorado.org.br>
 <c4b7cba3-eb5f-ff65-9376-da9dc8edf45f@linaro.org>
 <f0fbb69b-76e9-c951-f18d-cfc4629f5f2a@eldorado.org.br>
 <aad60a0c-1f07-24ab-821a-193047e4ad2e@linaro.org> <YKHpy53AwM8tTy3E@yekko>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
Message-ID: <06d4250b-4d4a-42a6-47fa-f5b75ea6c499@eldorado.org.br>
Date: Mon, 17 May 2021 13:59:35 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKHpy53AwM8tTy3E@yekko>
Content-Type: multipart/alternative;
 boundary="------------D2E7D00D69078CA415DD1A04"
Content-Language: en-US
X-OriginalArrivalTime: 17 May 2021 16:59:36.0689 (UTC)
 FILETIME=[04896E10:01D74B3E]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: farosas@linux.ibm.com, qemu-devel@nongnu.org, luis.pires@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------D2E7D00D69078CA415DD1A04
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit


On 17/05/2021 00:58, David Gibson wrote:
> On Thu, May 13, 2021 at 06:44:01PM -0500, Richard Henderson wrote:
> 65;6401;1c> On 5/13/21 9:03 AM, Lucas Mateus Martins Araujo e Castro wrote:
>>> tlb_set_page is called by many ppc_hash64_handle_mmu_fault,
>>> ppc_radix64_handle_mmu_fault and ppc_hash32_handle_mmu_fault, all of
>>> which from what I've seen are only used inside #if
>>> defined(CONFIG_SOFTMMU).
>> tlb_set_page should only be called from one place: ppc_cpu_tlb_fill.  The
>> other functions should fill in data, much like get_physical_address.
>>
>>
>>> So what is the best way to deal with these tlb_set_page calls? Should
>>> these part of the _handle_mmu_fault functions never be reached or should
>>> these functions never be called?
>> There is some duplication between get_physical_address* and
>> *handle_mmu_fault that should be fixed.
>>
>> What should be happening is that you have one function (per mmu type) that
>> takes a virtual address and resolves a physical address. This bit of code
>> should be written so that it is usable by both
>> CPUClass.get_phys_page_attrs_debug and TCGCPUOps.tlb_fill.  It appears as if
>> ppc_radix64_xlate is the right interface for this.
>>
>> It appears that real mode handling is duplicated between hash64 and radix64,
>> which could be unified.
> Any common handling between the hash and radix MMUs should go in
> mmu-book3s-v3.*  That covers common things across the v3 (POWER9 and
> later) MMUs which includes both hash and radix mode.

I'm not completely sure how this should be handled, there's a 
get_physical_address in mmu_helper.c but it's a static function and 
divided by processor families instead of MMU types, so 
get_physical_address_* should be a new function?

The new get_physical_address_* function would be a mmu-hash(32|64) that 
do something like ppc_radix64_xlate and add a function to mmu-book3s-v3 
that call either the radix64 or the hash64 function and also handle real 
mode access.

Also should the tlb_set_page calls in *_handle_mmu_fault be changed to 
ppc_cpu_tlb_fill or the function should themselves fill it?

>
>> You should only call tlb_set_page from TCGCPUOps.tlb_fill, aka
>> ppc_cpu_tlb_fill.  TCGCPUOps.tlb_fill is obviously TCG only.
>>
>> The version you are looking at here is system emulation specific (sysemu,
>> !defined(CONFIG_USER_ONLY)).  There is a second version of this function,
>> with the same signature, that is used for user emulation in the helpfully
>> named user_only_helper.c.
>>
>>
>> r~
>>
-- 
Lucas Mateus M. Araujo e Castro
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Estagiario
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------D2E7D00D69078CA415DD1A04
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
    <div class="moz-cite-prefix">On 17/05/2021 00:58, David Gibson
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YKHpy53AwM8tTy3E@yekko">
      <pre class="moz-quote-pre" wrap="">On Thu, May 13, 2021 at 06:44:01PM -0500, Richard Henderson wrote:
65;6401;1c&gt; On 5/13/21 9:03 AM, Lucas Mateus Martins Araujo e Castro wrote:
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">tlb_set_page is called by many ppc_hash64_handle_mmu_fault,
ppc_radix64_handle_mmu_fault and ppc_hash32_handle_mmu_fault, all of
which from what I've seen are only used inside #if
defined(CONFIG_SOFTMMU).
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
tlb_set_page should only be called from one place: ppc_cpu_tlb_fill.  The
other functions should fill in data, much like get_physical_address.


</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">So what is the best way to deal with these tlb_set_page calls? Should
these part of the _handle_mmu_fault functions never be reached or should
these functions never be called?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
There is some duplication between get_physical_address* and
*handle_mmu_fault that should be fixed.

What should be happening is that you have one function (per mmu type) that
takes a virtual address and resolves a physical address. This bit of code
should be written so that it is usable by both
CPUClass.get_phys_page_attrs_debug and TCGCPUOps.tlb_fill.  It appears as if
ppc_radix64_xlate is the right interface for this.

It appears that real mode handling is duplicated between hash64 and radix64,
which could be unified.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Any common handling between the hash and radix MMUs should go in
mmu-book3s-v3.*  That covers common things across the v3 (POWER9 and
later) MMUs which includes both hash and radix mode.</pre>
    </blockquote>
    <p>I'm not completely sure how this should be handled, there's a
      get_physical_address in mmu_helper.c but it's a static function
      and divided by processor families instead of MMU types, so
      get_physical_address_* should be a new function?</p>
    <p>The new get_physical_address_* function would be a
      mmu-hash(32|64) that do something like ppc_radix64_xlate and add a
      function to mmu-book3s-v3 that call either the radix64 or the
      hash64 function and also handle real mode access.</p>
    <p>Also should the tlb_set_page calls in *_handle_mmu_fault be
      changed to ppc_cpu_tlb_fill or the function should themselves fill
      it? <br>
    </p>
    <blockquote type="cite" cite="mid:YKHpy53AwM8tTy3E@yekko">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">You should only call tlb_set_page from TCGCPUOps.tlb_fill, aka
ppc_cpu_tlb_fill.  TCGCPUOps.tlb_fill is obviously TCG only.

The version you are looking at here is system emulation specific (sysemu,
!defined(CONFIG_USER_ONLY)).  There is a second version of this function,
with the same signature, that is used for user emulation in the helpfully
named user_only_helper.c.


r~

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <div class="moz-signature">-- <br>
      Lucas Mateus M. Araujo e Castro<br>
      <a
href="https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&amp;utm_medium=email&amp;utm_source=RD+Station">Instituto
        de Pesquisas ELDORADO</a><br>
      Departamento Computação Embarcada<br>
      Estagiario<br>
      <a href="https://www.eldorado.org.br/disclaimer.html">Aviso Legal
        - Disclaimer</a></div>
  </body>
</html>

--------------D2E7D00D69078CA415DD1A04--

