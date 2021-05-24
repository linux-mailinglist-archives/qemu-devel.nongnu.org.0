Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A79538E6FE
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 14:58:04 +0200 (CEST)
Received: from localhost ([::1]:53246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llA9i-0005wU-RD
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 08:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1llA79-00043h-2u; Mon, 24 May 2021 08:55:23 -0400
Received: from [201.28.113.2] (port=6970 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1llA75-0003KO-UM; Mon, 24 May 2021 08:55:22 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 24 May 2021 09:54:29 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id D8374801360;
 Mon, 24 May 2021 09:54:28 -0300 (-03)
Subject: Re: [PATCH v3 8/9] target/ppc: created tcg-stub.c file
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210521201759.85475-1-bruno.larsen@eldorado.org.br>
 <20210521201759.85475-9-bruno.larsen@eldorado.org.br>
 <YKsXWvxV8aLRauoe@yekko>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <94e4ebf6-d57c-c9aa-0d3e-3c62d6d5a111@eldorado.org.br>
Date: Mon, 24 May 2021 09:54:28 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKsXWvxV8aLRauoe@yekko>
Content-Type: multipart/alternative;
 boundary="------------643C2C24AD6B340FBCB83398"
Content-Language: en-US
X-OriginalArrivalTime: 24 May 2021 12:54:29.0216 (UTC)
 FILETIME=[EF176600:01D7509B]
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
--------------643C2C24AD6B340FBCB83398
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit


On 24/05/2021 00:02, David Gibson wrote:
> On Fri, May 21, 2021 at 05:17:58PM -0300, Bruno Larsen (billionai) wrote:
>> Created a file with stubs needed to compile disabling TCG. *_ppc_opcodes
>> were created to make cpu_init.c have a few less ifdefs, since they are
>> not needed. coftmmu_resize_hpt_* have to be created because the compiler
>> can't automatically know they aren't used, but they should never be
>> reached.
>>
>> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
>> ---
>>   target/ppc/meson.build |  4 ++++
>>   target/ppc/tcg-stub.c  | 25 +++++++++++++++++++++++++
>>   2 files changed, 29 insertions(+)
>>   create mode 100644 target/ppc/tcg-stub.c
>>
>> diff --git a/target/ppc/meson.build b/target/ppc/meson.build
>> index d1aa7d5d39..848e625302 100644
>> --- a/target/ppc/meson.build
>> +++ b/target/ppc/meson.build
>> @@ -28,6 +28,10 @@ ppc_softmmu_ss.add(files(
>>     'mmu_helper.c',
>>     'monitor.c',
>>   ))
>> +ppc_softmmu_ss.add(when: 'CONFIG_TCG', if_false: files(
>> +  'tcg-stub.c'
>> +))
>> +
>>   ppc_softmmu_ss.add(when: 'TARGET_PPC64', if_true: files(
>>     'compat.c',
>>     'mmu-book3s-v3.c',
>> diff --git a/target/ppc/tcg-stub.c b/target/ppc/tcg-stub.c
>> new file mode 100644
>> index 0000000000..6d99834274
>> --- /dev/null
>> +++ b/target/ppc/tcg-stub.c
> New file needs a copyright banner.
Doh. how can I always forget this?
>> @@ -0,0 +1,25 @@
>> +#include "qemu/osdep.h"
>> +#include "cpu.h"
>> +#include "internal.h"
>> +#include "hw/ppc/spapr.h"
>> +
>> +void create_ppc_opcodes(PowerPCCPU *cpu, Error **errp)
>> +{}
> I believe style dictates this be
> {
> }
>
> rather than
> {}
>
huh, on it.

Should we try and add this to the checkpatch script? no one complained 
about it anywhere...

-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------643C2C24AD6B340FBCB83398
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
    <div class="moz-cite-prefix">On 24/05/2021 00:02, David Gibson
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YKsXWvxV8aLRauoe@yekko">
      <pre class="moz-quote-pre" wrap="">On Fri, May 21, 2021 at 05:17:58PM -0300, Bruno Larsen (billionai) wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Created a file with stubs needed to compile disabling TCG. *_ppc_opcodes
were created to make cpu_init.c have a few less ifdefs, since they are
not needed. coftmmu_resize_hpt_* have to be created because the compiler
can't automatically know they aren't used, but they should never be
reached.

Signed-off-by: Bruno Larsen (billionai) <a class="moz-txt-link-rfc2396E" href="mailto:bruno.larsen@eldorado.org.br">&lt;bruno.larsen@eldorado.org.br&gt;</a>
---
 target/ppc/meson.build |  4 ++++
 target/ppc/tcg-stub.c  | 25 +++++++++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 target/ppc/tcg-stub.c

diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index d1aa7d5d39..848e625302 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -28,6 +28,10 @@ ppc_softmmu_ss.add(files(
   'mmu_helper.c',
   'monitor.c',
 ))
+ppc_softmmu_ss.add(when: 'CONFIG_TCG', if_false: files(
+  'tcg-stub.c'
+))
+
 ppc_softmmu_ss.add(when: 'TARGET_PPC64', if_true: files(
   'compat.c',
   'mmu-book3s-v3.c',
diff --git a/target/ppc/tcg-stub.c b/target/ppc/tcg-stub.c
new file mode 100644
index 0000000000..6d99834274
--- /dev/null
+++ b/target/ppc/tcg-stub.c
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
New file needs a copyright banner.</pre>
    </blockquote>
    Doh. how can I always forget this?
    <blockquote type="cite" cite="mid:YKsXWvxV8aLRauoe@yekko">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">@@ -0,0 +1,25 @@
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internal.h"
+#include "hw/ppc/spapr.h"
+
+void create_ppc_opcodes(PowerPCCPU *cpu, Error **errp)
+{}
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I believe style dictates this be
{
}

rather than
{}

</pre>
    </blockquote>
    <p>huh, on it.</p>
    <p>Should we try and add this to the checkpatch script? no one
      complained about it anywhere... </p>
    <blockquote type="cite" cite="mid:YKsXWvxV8aLRauoe@yekko">
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

--------------643C2C24AD6B340FBCB83398--

