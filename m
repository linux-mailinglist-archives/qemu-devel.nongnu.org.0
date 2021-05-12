Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B5937D3EF
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 21:46:29 +0200 (CEST)
Received: from localhost ([::1]:39114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lguoN-0000aY-QO
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 15:46:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lguEk-0002Nu-Pk; Wed, 12 May 2021 15:09:38 -0400
Received: from [201.28.113.2] (port=65047 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lguEj-0007Lp-0t; Wed, 12 May 2021 15:09:38 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 12 May 2021 16:09:34 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 0DF228000C2;
 Wed, 12 May 2021 16:09:34 -0300 (-03)
Subject: Re: [RFC PATCH 10/11] target/ppc: created tcg-stub.c file
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-11-bruno.larsen@eldorado.org.br>
 <a80cf0c3-705e-e41a-f538-8abf492a5f4c@linaro.org>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <a2794fe7-51f0-3f12-763e-6d4bc182ec92@eldorado.org.br>
Date: Wed, 12 May 2021 16:09:33 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a80cf0c3-705e-e41a-f538-8abf492a5f4c@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------AF48C6F306AC572EB3CC99B2"
Content-Language: en-US
X-OriginalArrivalTime: 12 May 2021 19:09:34.0396 (UTC)
 FILETIME=[584457C0:01D74762]
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
--------------AF48C6F306AC572EB3CC99B2
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
yeah, I didn't expect this file to stick around, though, as the last 
time we made a stub file, it ended up not being used, so I decided to go 
the quick route
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
ah, this probably means we'll need to compile mmu_helper.c too... that 
was something we were hoping to avoid, because of the sheer size.
>
>
> r~
-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------AF48C6F306AC572EB3CC99B2
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
    </blockquote>
    yeah, I didn't expect this file to stick around, though, as the last
    time we made a stub file, it ended up not being used, so I decided
    to go the quick route<br>
    <blockquote type="cite"
      cite="mid:a80cf0c3-705e-e41a-f538-8abf492a5f4c@linaro.org">
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
    ah, this probably means we'll need to compile mmu_helper.c too...
    that was something we were hoping to avoid, because of the sheer
    size. <br>
    <blockquote type="cite"
      cite="mid:a80cf0c3-705e-e41a-f538-8abf492a5f4c@linaro.org">
      <br>
      <br>
      r~
      <br>
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

--------------AF48C6F306AC572EB3CC99B2--

