Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C093A99F6
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 14:10:28 +0200 (CEST)
Received: from localhost ([::1]:46246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltUNH-0004gV-13
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 08:10:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ltUKy-0003S1-QT; Wed, 16 Jun 2021 08:08:04 -0400
Received: from [201.28.113.2] (port=59175 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ltUKt-0005qa-PJ; Wed, 16 Jun 2021 08:08:01 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 16 Jun 2021 09:07:55 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 444D580148D;
 Wed, 16 Jun 2021 09:07:55 -0300 (-03)
Subject: Re: [RFC PATCH v2 2/2] target/ppc: make gdb able to translate
 priviledged addresses
To: Fabiano Rosas <farosas@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210614191630.101304-1-bruno.larsen@eldorado.org.br>
 <20210614191630.101304-2-bruno.larsen@eldorado.org.br>
 <c2ffffa6-2868-f7ab-78c6-1f29eaafc4e5@linaro.org>
 <1c27c473-be10-41cf-d633-bcd838fed78e@eldorado.org.br>
 <7ce3cd57-0abf-f0d9-11ec-6fdc42b89b62@linaro.org>
 <877diuq06o.fsf@linux.ibm.com>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <161880df-9f94-fb36-6be9-eee54ab8b8e5@eldorado.org.br>
Date: Wed, 16 Jun 2021 09:07:54 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <877diuq06o.fsf@linux.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------2FB4D7B0E681F9E1ED8C2BD6"
Content-Language: en-US
X-OriginalArrivalTime: 16 Jun 2021 12:07:55.0674 (UTC)
 FILETIME=[3D82F7A0:01D762A8]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.17, PDS_HP_HELO_NORDNS=0.318, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: luis.pires@eldorado.org.br, Greg Kurz <groug@kaod.org>,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------2FB4D7B0E681F9E1ED8C2BD6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 15/06/2021 18:37, Fabiano Rosas wrote:
> Richard Henderson <richard.henderson@linaro.org> writes:
>
>> On 6/15/21 4:32 AM, Bruno Piazera Larsen wrote:
>>> On 14/06/2021 19:37, Richard Henderson wrote:
>>>> On 6/14/21 12:16 PM, Bruno Larsen (billionai) wrote:
>>>>> This patch changes ppc_cpu_get_phys_page_debug so that it is now
>>>>> able to translate both, priviledged and real mode addresses
>>>>> independently of whether the CPU executing it has those permissions
>>>>>
>>>>> This was mentioned by Fabiano as something that would be very useful to
>>>>> help with debugging, but could possibly constitute a security issue if
>>>>> that debug function can be called in some way by prodution code. the
>>>>> solution was implemented such that it would be trivial to wrap it around
>>>>> ifdefs for building only with --enable-debug, for instance, but we are
>>>>> not sure this is the best approach, hence why it is an RFC.
>>>>>
>>>>> Suggested-by: Fabiano Rosas<farosas@linux.ibm.com>
>>>>> Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
>>>>> ---
>>>>>    target/ppc/mmu_helper.c | 23 +++++++++++++++++++++++
>>>>>    1 file changed, 23 insertions(+)
>>>> I think the first part is unnecessary.  Either the cpu is in supervisor mode or it
>>>> isn't, and gdb should use the correct address space.  If you really want to force
>>>> supervisor lookup from a guest that is paused in usermode, I suppose you could force
>>>> MSR.PR=1 while you're performing the access and set it back afterward.
>>> I don't see why GDB should not be able to see supervisor level addresses just because the
>>> CPU can't.
>> Because then when you are debugging, you then don't know whether the address is actually
>> accessible in the current cpu context.
>>
> @Bruno, so this is what I referred to somewhere else on the thread,
> people expect GDB to have the same access level of the currently
> executing code. So implementing my suggestion would break their
> workflow.
Ok, that makes sense. I'll drop this patch, then
>
>>>> I think the second part is actively wrong -- real-mode address lookup will (for the most
>>>> part) always succeed.  Moreover, the gdb user will have no idea that you've silently
>>>> changed addressing methods.
>>> I disagree. Real-mode address will mostly fail, since during the boot process Linux
>>> kernels set the MMU to use only virtual addresses, so real mode addresses only work when
>>> debugging the firmware or the early setup of the kernel. After that, GDB can basically
>>> only see virtual addresses.
>> Exactly.  But you changed that so that any unmapped address will re-try with real-mode,
>> which (outside of hv) simply maps real->physical and returns the input.
>>
>> One should have to perform some special action to see addresses in a different cpu
>> context.  I don't think that gdb supports such a special action at the moment.  If you
>> want that feature though, that's where you should start.
> I think we can just drop this patch. The scenarios where debugging
> across MMU contexts happen are quite limited.
>
> My use case was a while back when implementing single-step for KVM
> guests; there were some situations where GDB would have issues setting
> breakpoints around kernel code that altered MSR_IR/DR. But that is
> mostly anecdotal at this point. If I ever run into that again, now I
> know where to look.
At least now it's documented how to make it work, if someone else ever 
needs it as well :)
>
>>
>> r~
-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------2FB4D7B0E681F9E1ED8C2BD6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 15/06/2021 18:37, Fabiano Rosas
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:877diuq06o.fsf@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">Richard Henderson <a class="moz-txt-link-rfc2396E" href="mailto:richard.henderson@linaro.org">&lt;richard.henderson@linaro.org&gt;</a> writes:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 6/15/21 4:32 AM, Bruno Piazera Larsen wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On 14/06/2021 19:37, Richard Henderson wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On 6/14/21 12:16 PM, Bruno Larsen (billionai) wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">This patch changes ppc_cpu_get_phys_page_debug so that it is now
able to translate both, priviledged and real mode addresses
independently of whether the CPU executing it has those permissions

This was mentioned by Fabiano as something that would be very useful to
help with debugging, but could possibly constitute a security issue if
that debug function can be called in some way by prodution code. the
solution was implemented such that it would be trivial to wrap it around
ifdefs for building only with --enable-debug, for instance, but we are
not sure this is the best approach, hence why it is an RFC.

Suggested-by: Fabiano Rosas<a class="moz-txt-link-rfc2396E" href="mailto:farosas@linux.ibm.com">&lt;farosas@linux.ibm.com&gt;</a>
Signed-off-by: Bruno Larsen (billionai)<a class="moz-txt-link-rfc2396E" href="mailto:bruno.larsen@eldorado.org.br">&lt;bruno.larsen@eldorado.org.br&gt;</a>
---
  target/ppc/mmu_helper.c | 23 +++++++++++++++++++++++
  1 file changed, 23 insertions(+)
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
I think the first part is unnecessary.  Either the cpu is in supervisor mode or it 
isn't, and gdb should use the correct address space.  If you really want to force 
supervisor lookup from a guest that is paused in usermode, I suppose you could force 
MSR.PR=1 while you're performing the access and set it back afterward.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">I don't see why GDB should not be able to see supervisor level addresses just because the 
CPU can't.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Because then when you are debugging, you then don't know whether the address is actually 
accessible in the current cpu context.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
@Bruno, so this is what I referred to somewhere else on the thread,
people expect GDB to have the same access level of the currently
executing code. So implementing my suggestion would break their
workflow.</pre>
    </blockquote>
    Ok, that makes sense. I'll drop this patch, then<br>
    <blockquote type="cite" cite="mid:877diuq06o.fsf@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">I think the second part is actively wrong -- real-mode address lookup will (for the most 
part) always succeed.  Moreover, the gdb user will have no idea that you've silently 
changed addressing methods.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
I disagree. Real-mode address will mostly fail, since during the boot process Linux 
kernels set the MMU to use only virtual addresses, so real mode addresses only work when 
debugging the firmware or the early setup of the kernel. After that, GDB can basically 
only see virtual addresses.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Exactly.  But you changed that so that any unmapped address will re-try with real-mode, 
which (outside of hv) simply maps real-&gt;physical and returns the input.

One should have to perform some special action to see addresses in a different cpu 
context.  I don't think that gdb supports such a special action at the moment.  If you 
want that feature though, that's where you should start.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I think we can just drop this patch. The scenarios where debugging
across MMU contexts happen are quite limited.

My use case was a while back when implementing single-step for KVM
guests; there were some situations where GDB would have issues setting
breakpoints around kernel code that altered MSR_IR/DR. But that is
mostly anecdotal at this point. If I ever run into that again, now I
know where to look.</pre>
    </blockquote>
    At least now it's documented how to make it work, if someone else
    ever needs it as well :)<br>
    <blockquote type="cite" cite="mid:877diuq06o.fsf@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

r~
</pre>
      </blockquote>
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

--------------2FB4D7B0E681F9E1ED8C2BD6--

