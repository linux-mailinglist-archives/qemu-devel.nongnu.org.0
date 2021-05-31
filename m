Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E71F53960DD
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 16:31:17 +0200 (CEST)
Received: from localhost ([::1]:55542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lniwm-0008WD-CT
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 10:31:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lnisl-0006qe-UL; Mon, 31 May 2021 10:27:08 -0400
Received: from [201.28.113.2] (port=40071 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lnisj-0007ip-Gh; Mon, 31 May 2021 10:27:07 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 31 May 2021 11:27:00 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 5254180135E;
 Mon, 31 May 2021 11:27:00 -0300 (-03)
Subject: Re: [PATCH 2/5] target/ppc: remove ppc_cpu_dump_statistics
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
 <20210526202104.127910-3-bruno.larsen@eldorado.org.br>
 <20210527080156.2b861a9b@bahia.lan> <YLHVZeGAna8Y91Qm@yekko>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <ddee98e4-aa2b-f328-fe68-0e85fdc5ebbf@eldorado.org.br>
Date: Mon, 31 May 2021 11:26:59 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YLHVZeGAna8Y91Qm@yekko>
Content-Type: multipart/alternative;
 boundary="------------D8F4DF8E32774BD3CF0A38D1"
Content-Language: en-US
X-OriginalArrivalTime: 31 May 2021 14:27:00.0714 (UTC)
 FILETIME=[04EF04A0:01D75629]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) BAYES_50=0.8, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.591, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
 luis.pires@eldorado.org.br, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------D8F4DF8E32774BD3CF0A38D1
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit


On 29/05/2021 02:47, David Gibson wrote:
> On Thu, May 27, 2021 at 08:01:56AM +0200, Greg Kurz wrote:
>> On Wed, 26 May 2021 17:21:01 -0300
>> "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br> wrote:
>>
>>> This function requires surce code modification to be useful, which means
>> s/surce/source
>>
>>> it probably is not used often, and the move to using decodetree means
>>> the statistics won't even be collected anymore.
>>>
>>> Also removed setting dump_statistics in ppc_cpu_realize, since it was
>> s/ppc_cpu_realize/ppc_cpu_class_init
> A rebase on main has triggered a conflict with this patch, so I've
> removed it from my tree again.

Did you answer to the correct patch? From what I can see, this patch is 
still in, but patch 5 is not. I fixed the rebase problem that that one 
had and will send it later, with the rest of the patch series.

-- 

Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------D8F4DF8E32774BD3CF0A38D1
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
    <div class="moz-cite-prefix">On 29/05/2021 02:47, David Gibson
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YLHVZeGAna8Y91Qm@yekko">
      <pre class="moz-quote-pre" wrap="">On Thu, May 27, 2021 at 08:01:56AM +0200, Greg Kurz wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Wed, 26 May 2021 17:21:01 -0300
"Bruno Larsen (billionai)" <a class="moz-txt-link-rfc2396E" href="mailto:bruno.larsen@eldorado.org.br">&lt;bruno.larsen@eldorado.org.br&gt;</a> wrote:

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">This function requires surce code modification to be useful, which means
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
s/surce/source

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">it probably is not used often, and the move to using decodetree means
the statistics won't even be collected anymore.

Also removed setting dump_statistics in ppc_cpu_realize, since it was
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
s/ppc_cpu_realize/ppc_cpu_class_init
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
A rebase on main has triggered a conflict with this patch, so I've
removed it from my tree again.</pre>
    </blockquote>
    <p>Did you answer to the correct patch? From what I can see, this
      patch is still in, but patch 5 is not. I fixed the rebase problem
      that that one had and will send it later, with the rest of the
      patch series.<br>
    </p>
    <p>-- </p>
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

--------------D8F4DF8E32774BD3CF0A38D1--

