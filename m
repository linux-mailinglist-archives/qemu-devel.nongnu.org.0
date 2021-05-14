Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF59380F75
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 20:13:27 +0200 (CEST)
Received: from localhost ([::1]:45514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhcJK-0006vZ-UB
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 14:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lhcEA-0005vJ-Or; Fri, 14 May 2021 14:07:58 -0400
Received: from [201.28.113.2] (port=32687 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lhcE8-0007mb-3l; Fri, 14 May 2021 14:07:58 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 14 May 2021 15:07:14 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 110898013D0;
 Fri, 14 May 2021 15:07:14 -0300 (-03)
Subject: Re: [RFC PATCH 10/11] target/ppc: created tcg-stub.c file
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-11-bruno.larsen@eldorado.org.br>
 <a80cf0c3-705e-e41a-f538-8abf492a5f4c@linaro.org>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <81b318a7-5514-7e63-970a-e3211b16065f@eldorado.org.br>
Date: Fri, 14 May 2021 15:07:13 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a80cf0c3-705e-e41a-f538-8abf492a5f4c@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------F4D02662C01E92CF2335CD28"
Content-Language: en-US
X-OriginalArrivalTime: 14 May 2021 18:07:14.0482 (UTC)
 FILETIME=[F7EE4120:01D748EB]
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------F4D02662C01E92CF2335CD28
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/05/2021 15:39, Richard Henderson wrote:
> On 5/12/21 9:08 AM, Bruno Larsen (billionai) wrote:
>> +++ b/target/ppc/tcg-stub.c
>> @@ -0,0 +1,33 @@
>> +
>> +#include "qemu/osdep.h"
>
> All files get copyright boilerplate.
>
>> +#include "exec/hwaddr.h"
>> +#include "cpu.h"
>> +#include "hw/ppc/spapr.h"
>> +
>> +hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
>> +{
>> +    return 0;
>> +}
>
> This is used by gdbstub.
>
> If there's a way for kvm to convert a virtual address to a physical 
> address using the hardware, then use that.  I suspect there is not.
>
> Otherwise, you have to keep all of the mmu page table walking stuff 
> for kvm as well as tcg.  Which probably means that all of the other 
> stuff that you're stubbing out is used or usable as well.

 From what I can tell, KVM can't do it, so we'll have to extract the 
function. Looking at it, the main problem is that it might call 
get_physical_address and use struct mmu_ctx_t, if the mmu_model isn't 
one of: POWERPC_MMU_64B, POWERPC_MMU_2_03, POWERPC_MMU_2_06, 
POWERPC_MMU_2_07, POWERPC_MMU_3_00, POWERPC_MMU_32B, POWERPC_MMU_601.

Is it possible that a machine with an mmu not listed in here could build 
a !TCG version of qemu? if it's not possible, we can separate that part 
into a separate function left in mmu_helper.c and move the rest to 
somewhere else.

Looking at dump_mmu and ppc_tlb_invalidate_all, looks like we need to 
move enough code that it make sense to create an mmu_common.c for common 
code. Otherwise, it's probably easier to compile all of mmu_helper.c 
instead of picking those functions out.

-- 

Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------F4D02662C01E92CF2335CD28
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/05/2021 15:39, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:a80cf0c3-705e-e41a-f538-8abf492a5f4c@linaro.org">On
      5/12/21 9:08 AM, Bruno Larsen (billionai) wrote:
      <br>
      <blockquote type="cite">+++ b/target/ppc/tcg-stub.c
        <br>
        @@ -0,0 +1,33 @@
        <br>
        +
        <br>
        +#include "qemu/osdep.h"
        <br>
      </blockquote>
      <br>
      All files get copyright boilerplate.
      <br>
      <br>
      <blockquote type="cite">+#include "exec/hwaddr.h"
        <br>
        +#include "cpu.h"
        <br>
        +#include "hw/ppc/spapr.h"
        <br>
        +
        <br>
        +hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
        <br>
        +{
        <br>
        +    return 0;
        <br>
        +}
        <br>
      </blockquote>
      <br>
      This is used by gdbstub.
      <br>
      <br>
      If there's a way for kvm to convert a virtual address to a
      physical address using the hardware, then use that.  I suspect
      there is not.
      <br>
      <br>
      Otherwise, you have to keep all of the mmu page table walking
      stuff for kvm as well as tcg.  Which probably means that all of
      the other stuff that you're stubbing out is used or usable as
      well.
      <br>
    </blockquote>
    <p>From what I can tell, KVM can't do it, so we'll have to extract
      the function. Looking at it, the main problem is that it might
      call get_physical_address and use struct mmu_ctx_t, if the
      mmu_model isn't one of: POWERPC_MMU_64B, POWERPC_MMU_2_03,
      POWERPC_MMU_2_06, POWERPC_MMU_2_07, POWERPC_MMU_3_00,
      POWERPC_MMU_32B, POWERPC_MMU_601.</p>
    <p>Is it possible that a machine with an mmu not listed in here
      could build a !TCG version of qemu? if it's not possible, we can
      separate that part into a separate function left in mmu_helper.c
      and move the rest to somewhere else. <br>
    </p>
    <p>Looking at dump_mmu and ppc_tlb_invalidate_all, looks like we
      need to move enough code that it make sense to create an
      mmu_common.c for common code. Otherwise, it's probably easier to
      compile all of mmu_helper.c instead of picking those functions
      out. <br>
    </p>
    <p>-- <br>
    </p>
    <div class="moz-signature">Bruno Piazera Larsen<br>
      <a
href="https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&amp;utm_medium=email&amp;utm_source=RD+Station">Instituto
        de Pesquisas ELDORADO</a><br>
      Departamento Computação Embarcada<br>
      Analista de Software Trainee<br>
      <a href="https://www.eldorado.org.br/disclaimer.html">Aviso Legal
        - Disclaimer</a></div>
  </body>
</html>

--------------F4D02662C01E92CF2335CD28--

