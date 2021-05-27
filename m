Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E19F393025
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 15:53:23 +0200 (CEST)
Received: from localhost ([::1]:49906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmGRu-0004ie-Go
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 09:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lmFyX-00021G-N1; Thu, 27 May 2021 09:23:05 -0400
Received: from [201.28.113.2] (port=50164 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lmFyR-0003F9-GN; Thu, 27 May 2021 09:23:01 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 27 May 2021 10:22:51 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 4566E8013E1;
 Thu, 27 May 2021 10:22:51 -0300 (-03)
Subject: Re: [PATCH 2/5] target/ppc: remove ppc_cpu_dump_statistics
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
 <20210526202104.127910-3-bruno.larsen@eldorado.org.br>
 <YK7zwfSC7NGssEN5@yekko> <YK8hjhgPNK8yVfgm@yekko>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <d952f573-6a12-27c7-98e4-a29e2a955ec5@eldorado.org.br>
Date: Thu, 27 May 2021 10:22:50 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YK8hjhgPNK8yVfgm@yekko>
Content-Type: multipart/alternative;
 boundary="------------44E901FD6F60F85F3B117530"
Content-Language: en-US
X-OriginalArrivalTime: 27 May 2021 13:22:51.0635 (UTC)
 FILETIME=[650D2C30:01D752FB]
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------44E901FD6F60F85F3B117530
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit


On 27/05/2021 01:35, David Gibson wrote:
> On Thu, May 27, 2021 at 11:20:01AM +1000, David Gibson wrote:
>> On Wed, May 26, 2021 at 05:21:01PM -0300, Bruno Larsen (billionai) wrote:
>>> This function requires surce code modification to be useful, which means
>>> it probably is not used often, and the move to using decodetree means
>>> the statistics won't even be collected anymore.
>>>
>>> Also removed setting dump_statistics in ppc_cpu_realize, since it was
>>> only useful when in conjunction with ppc_cpu_dump_statistics.
>>>
>>> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
>>> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
>>> ---
>>>   target/ppc/cpu.h       |  1 -
>>>   target/ppc/cpu_init.c  |  3 ---
>>>   target/ppc/translate.c | 51 ------------------------------------------
>>>   3 files changed, 55 deletions(-)
>>>
>>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>>> index 203f07e48e..c3d1b492e4 100644
>>> --- a/target/ppc/cpu.h
>>> +++ b/target/ppc/cpu.h
>>> @@ -1256,7 +1256,6 @@ DECLARE_OBJ_CHECKERS(PPCVirtualHypervisor, PPCVirtualHypervisorClass,
>>>   void ppc_cpu_do_interrupt(CPUState *cpu);
>>>   bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
>>>   void ppc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
>>> -void ppc_cpu_dump_statistics(CPUState *cpu, int flags);
>>>   hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>>>   int ppc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>>>   int ppc_cpu_gdb_read_register_apple(CPUState *cpu, GByteArray *buf, int reg);
>>> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
>>> index f5ae2f150d..bd05f53fa4 100644
>>> --- a/target/ppc/cpu_init.c
>>> +++ b/target/ppc/cpu_init.c
>>> @@ -9250,9 +9250,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
>>>       cc->class_by_name = ppc_cpu_class_by_name;
>>>       cc->has_work = ppc_cpu_has_work;
>>>       cc->dump_state = ppc_cpu_dump_state;
>>> -#ifdef CONFIG_TCG
>>> -    cc->dump_statistics = ppc_cpu_dump_statistics;
>>> -#endif
>> This confuses me.  The ifdefs you're removing aren't present in my
>> tree, and AFAICT they never existed since your own patch created
>> cpu_init.c.
>>
>> So.. please rebase and check that.
> Duh, sorry, I looked at this set out of order with your latest !tcg
> patches.  Now that I've applied those, I've applied those one as well.
Let me just check, where do you keep your most updated tree? I'm 
rebasing on your github tree, but ppc-for-6.1 there seems quite outdated 
(still the same as main)
-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------44E901FD6F60F85F3B117530
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
    <div class="moz-cite-prefix">On 27/05/2021 01:35, David Gibson
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YK8hjhgPNK8yVfgm@yekko">
      <pre class="moz-quote-pre" wrap="">On Thu, May 27, 2021 at 11:20:01AM +1000, David Gibson wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Wed, May 26, 2021 at 05:21:01PM -0300, Bruno Larsen (billionai) wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">This function requires surce code modification to be useful, which means
it probably is not used often, and the move to using decodetree means
the statistics won't even be collected anymore.

Also removed setting dump_statistics in ppc_cpu_realize, since it was
only useful when in conjunction with ppc_cpu_dump_statistics.

Suggested-by: Richard Henderson<a class="moz-txt-link-rfc2396E" href="mailto:richard.henderson@linaro.org">&lt;richard.henderson@linaro.org&gt;</a>
Signed-off-by: Bruno Larsen (billionai) <a class="moz-txt-link-rfc2396E" href="mailto:bruno.larsen@eldorado.org.br">&lt;bruno.larsen@eldorado.org.br&gt;</a>
---
 target/ppc/cpu.h       |  1 -
 target/ppc/cpu_init.c  |  3 ---
 target/ppc/translate.c | 51 ------------------------------------------
 3 files changed, 55 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 203f07e48e..c3d1b492e4 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1256,7 +1256,6 @@ DECLARE_OBJ_CHECKERS(PPCVirtualHypervisor, PPCVirtualHypervisorClass,
 void ppc_cpu_do_interrupt(CPUState *cpu);
 bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void ppc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-void ppc_cpu_dump_statistics(CPUState *cpu, int flags);
 hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int ppc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int ppc_cpu_gdb_read_register_apple(CPUState *cpu, GByteArray *buf, int reg);
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index f5ae2f150d..bd05f53fa4 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -9250,9 +9250,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc-&gt;class_by_name = ppc_cpu_class_by_name;
     cc-&gt;has_work = ppc_cpu_has_work;
     cc-&gt;dump_state = ppc_cpu_dump_state;
-#ifdef CONFIG_TCG
-    cc-&gt;dump_statistics = ppc_cpu_dump_statistics;
-#endif
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
This confuses me.  The ifdefs you're removing aren't present in my
tree, and AFAICT they never existed since your own patch created
cpu_init.c.

So.. please rebase and check that.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Duh, sorry, I looked at this set out of order with your latest !tcg
patches.  Now that I've applied those, I've applied those one as well.
</pre>
    </blockquote>
    Let me just check, where do you keep your most updated tree? I'm
    rebasing on your github tree, but ppc-for-6.1 there seems quite
    outdated (still the same as main)<br>
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

--------------44E901FD6F60F85F3B117530--

