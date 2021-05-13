Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB1037F85E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 15:04:22 +0200 (CEST)
Received: from localhost ([::1]:36048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhB0i-0000Oz-CY
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 09:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lhAtK-00015o-1o; Thu, 13 May 2021 08:56:38 -0400
Received: from [201.28.113.2] (port=63520 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lhAtG-0004uY-NT; Thu, 13 May 2021 08:56:37 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 13 May 2021 09:56:28 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 3E0B880139F;
 Thu, 13 May 2021 09:56:28 -0300 (-03)
Subject: Re: [RFC PATCH 10/11] target/ppc: created tcg-stub.c file
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-11-bruno.larsen@eldorado.org.br>
 <YJykOuYj9xgjVPZQ@yekko>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <4954165f-c4fe-aad8-3d0f-070297e6722c@eldorado.org.br>
Date: Thu, 13 May 2021 09:56:27 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJykOuYj9xgjVPZQ@yekko>
Content-Type: multipart/alternative;
 boundary="------------7046AE5CCC6B8073A174F9B3"
Content-Language: en-US
X-OriginalArrivalTime: 13 May 2021 12:56:28.0574 (UTC)
 FILETIME=[63B0BBE0:01D747F7]
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------7046AE5CCC6B8073A174F9B3
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit


On 13/05/2021 00:59, David Gibson wrote:
> On Wed, May 12, 2021 at 11:08:12AM -0300, Bruno Larsen (billionai) wrote:
>> Created a file with stubs needed to compile disabling TCG.
>>
>> We're not sure about keeping the softmmu stubs in this file. if there is
>> a better place to put them, please let us know.
>>
>> The other 3 functions have been stubbed because we didn't know what to
>> do with them. Making the file compile in the !TCG case would create an
>> ifdef hell, but extracting the functions meant moving many others as
>> well, and there weren't any good places to put them.
>>
>> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
>> ---
>>   target/ppc/tcg-stub.c | 33 +++++++++++++++++++++++++++++++++
>>   1 file changed, 33 insertions(+)
>>   create mode 100644 target/ppc/tcg-stub.c
>>
>> diff --git a/target/ppc/tcg-stub.c b/target/ppc/tcg-stub.c
>> new file mode 100644
>> index 0000000000..67099e2676
>> --- /dev/null
>> +++ b/target/ppc/tcg-stub.c
>> @@ -0,0 +1,33 @@
>> +
>> +#include "qemu/osdep.h"
>> +#include "exec/hwaddr.h"
>> +#include "cpu.h"
>> +#include "hw/ppc/spapr.h"
>> +
>> +hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
>> +{
>> +    return 0;
>> +}
>> +
>> +void dump_mmu(CPUPPCState *env)
>> +{
>> +}
>> +
>> +void ppc_tlb_invalidate_all(CPUPPCState *env)
>> +{
>> +}
>> +
>> +target_ulong softmmu_resize_hpt_prepare(PowerPCCPU *cpu,
>> +                                        SpaprMachineState *spapr,
>> +                                        target_ulong shift)
>> +{
>> +    g_assert_not_reached();
>> +}
>> +
>> +target_ulong softmmu_resize_hpt_commit(PowerPCCPU* cpu,
>> +                                       SpaprMachineState *spapr,
>> +                                       target_ulong flags,
>> +                                       target_ulong shift)
>> +{
>> +    g_assert_not_reached();
>> +}
> I think these last two stubs should be obsoleted by the patch from
> Lucas I already merged "hw/ppc: moved hcalls that depend on softmmu".

They aren't, when talking to him he said he wanted to use as few ifdefs 
as possible. Which do you think is better, to go back and ifdef away 
those calls, or keep the stubs? And if we keep the stubs, do we keep 
them here or in hw/ppc/spapr_hcall.c, along with other stubs?

-- 

Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------7046AE5CCC6B8073A174F9B3
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
    <div class="moz-cite-prefix">On 13/05/2021 00:59, David Gibson
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YJykOuYj9xgjVPZQ@yekko">
      <pre class="moz-quote-pre" wrap="">On Wed, May 12, 2021 at 11:08:12AM -0300, Bruno Larsen (billionai) wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Created a file with stubs needed to compile disabling TCG.

We're not sure about keeping the softmmu stubs in this file. if there is
a better place to put them, please let us know.

The other 3 functions have been stubbed because we didn't know what to
do with them. Making the file compile in the !TCG case would create an
ifdef hell, but extracting the functions meant moving many others as
well, and there weren't any good places to put them.

Signed-off-by: Bruno Larsen (billionai) <a class="moz-txt-link-rfc2396E" href="mailto:bruno.larsen@eldorado.org.br">&lt;bruno.larsen@eldorado.org.br&gt;</a>
---
 target/ppc/tcg-stub.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 target/ppc/tcg-stub.c

diff --git a/target/ppc/tcg-stub.c b/target/ppc/tcg-stub.c
new file mode 100644
index 0000000000..67099e2676
--- /dev/null
+++ b/target/ppc/tcg-stub.c
@@ -0,0 +1,33 @@
+
+#include "qemu/osdep.h"
+#include "exec/hwaddr.h"
+#include "cpu.h"
+#include "hw/ppc/spapr.h"
+
+hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
+{
+    return 0;
+}
+
+void dump_mmu(CPUPPCState *env)
+{
+}
+
+void ppc_tlb_invalidate_all(CPUPPCState *env)
+{
+}
+
+target_ulong softmmu_resize_hpt_prepare(PowerPCCPU *cpu,
+                                        SpaprMachineState *spapr,
+                                        target_ulong shift)
+{
+    g_assert_not_reached();
+}
+
+target_ulong softmmu_resize_hpt_commit(PowerPCCPU* cpu,
+                                       SpaprMachineState *spapr,
+                                       target_ulong flags,
+                                       target_ulong shift)
+{
+    g_assert_not_reached();
+}
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I think these last two stubs should be obsoleted by the patch from
Lucas I already merged "hw/ppc: moved hcalls that depend on softmmu".
</pre>
    </blockquote>
    <p>They aren't, when talking to him he said he wanted to use as few
      ifdefs as possible. Which do you think is better, to go back and
      ifdef away those calls, or keep the stubs? And if we keep the
      stubs, do we keep them here or in hw/ppc/spapr_hcall.c, along with
      other stubs?<br>
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

--------------7046AE5CCC6B8073A174F9B3--

