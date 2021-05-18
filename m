Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C67538804C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 21:06:31 +0200 (CEST)
Received: from localhost ([::1]:54952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj530-0005nn-IR
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 15:06:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lj4ie-0005nn-Vu; Tue, 18 May 2021 14:45:29 -0400
Received: from [201.28.113.2] (port=52130 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lj4ic-0003fL-H7; Tue, 18 May 2021 14:45:28 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 18 May 2021 15:45:22 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id C7E36801362;
 Tue, 18 May 2021 15:45:21 -0300 (-03)
Subject: Re: [PATCH 09/11] include/exec: added functions to the stubs in
 exec-all.h
To: Richard Henderson <richard.henderson@linaro.org>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-10-bruno.larsen@eldorado.org.br>
 <c4b7cba3-eb5f-ff65-9376-da9dc8edf45f@linaro.org>
 <f0fbb69b-76e9-c951-f18d-cfc4629f5f2a@eldorado.org.br>
 <aad60a0c-1f07-24ab-821a-193047e4ad2e@linaro.org> <YKHpy53AwM8tTy3E@yekko>
 <06d4250b-4d4a-42a6-47fa-f5b75ea6c499@eldorado.org.br>
 <88f58334-8bae-a9bd-aac0-aa20d432595f@linaro.org>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <af6641c4-0d64-c129-5e75-2c25f35232a6@eldorado.org.br>
Date: Tue, 18 May 2021 15:45:21 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <88f58334-8bae-a9bd-aac0-aa20d432595f@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------123AC5409CE653A9BFCF3F61"
Content-Language: en-US
X-OriginalArrivalTime: 18 May 2021 18:45:22.0235 (UTC)
 FILETIME=[F530A8B0:01D74C15]
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
Cc: farosas@linux.ibm.com, qemu-devel@nongnu.org, luis.pires@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------123AC5409CE653A9BFCF3F61
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 17/05/2021 15:02, Richard Henderson wrote:
> On 5/17/21 11:59 AM, Lucas Mateus Martins Araujo e Castro wrote:
>> I'm not completely sure how this should be handled, there's a 
>> get_physical_address in mmu_helper.c but it's a static function and 
>> divided by processor families instead of MMU types, so 
>> get_physical_address_* should be a new function?
>>
>> The new get_physical_address_* function would be a mmu-hash(32|64) 
>> that do something like ppc_radix64_xlate and add a function to 
>> mmu-book3s-v3 that call either the radix64 or the hash64 function and 
>> also handle real mode access.
>
> The entry points that we are concerned about are:
>   ppc_cpu_get_phys_page_debug
>   ppc_cpu_tlb_fill
>
> Currently there is a hook, pcc->handle_mmu_fault, which is used by 
> ppc_cpu_tlb_fill, but is insufficiently general.  We're going to 
> remove that hook.
>
> We're going to add a new hook with the same interface as 
> ppc_radix64_xlate that will be used by both 
> ppc_cpu_get_phys_page_debug and ppc_cpu_tlb_fill.
>
So, just to make sure we understand, what we want to do is:

* take all the common code from *_handle_mmu_fault and put it in 
ppc_cpu_tlb_fill

* take whatever is not common and hide it in an equivalent of 
ppc_radix64_xlate

* make the 2 entry points only use these new functions, so we can 
compile ppc_cpu_get_phys_page_debug

* move get_physical_address and all functions called by it somewhere 
that will compile when we disable tcg (again, to compile 
get_phys_page_debug)

Is that it? Sorry if this is very obvious, we never dealt with hardware 
and mmu stuff before...

-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------123AC5409CE653A9BFCF3F61
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 17/05/2021 15:02, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:88f58334-8bae-a9bd-aac0-aa20d432595f@linaro.org">On
      5/17/21 11:59 AM, Lucas Mateus Martins Araujo e Castro wrote:
      <br>
      <blockquote type="cite">I'm not completely sure how this should be
        handled, there's a get_physical_address in mmu_helper.c but it's
        a static function and divided by processor families instead of
        MMU types, so get_physical_address_* should be a new function?
        <br>
        <br>
        The new get_physical_address_* function would be a
        mmu-hash(32|64) that do something like ppc_radix64_xlate and add
        a function to mmu-book3s-v3 that call either the radix64 or the
        hash64 function and also handle real mode access.
        <br>
      </blockquote>
      <br>
      The entry points that we are concerned about are:
      <br>
        ppc_cpu_get_phys_page_debug
      <br>
        ppc_cpu_tlb_fill
      <br>
      <br>
      Currently there is a hook, pcc-&gt;handle_mmu_fault, which is used
      by ppc_cpu_tlb_fill, but is insufficiently general.  We're going
      to remove that hook.
      <br>
      <br>
      We're going to add a new hook with the same interface as
      ppc_radix64_xlate that will be used by both
      ppc_cpu_get_phys_page_debug and ppc_cpu_tlb_fill.
      <br>
      <br>
    </blockquote>
    <p>So, just to make sure we understand, what we want to do is:</p>
    <p>* take all the common code from *_handle_mmu_fault and put it in
      ppc_cpu_tlb_fill</p>
    <p>* take whatever is not common and hide it in an equivalent of
      ppc_radix64_xlate</p>
    <p>* make the 2 entry points only use these new functions, so we can
      compile ppc_cpu_get_phys_page_debug<br>
    </p>
    <p>* move get_physical_address and all functions called by it
      somewhere that will compile when we disable tcg (again, to compile
      get_phys_page_debug)</p>
    <p>Is that it? Sorry if this is very obvious, we never dealt with
      hardware and mmu stuff before...<br>
    </p>
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

--------------123AC5409CE653A9BFCF3F61--

