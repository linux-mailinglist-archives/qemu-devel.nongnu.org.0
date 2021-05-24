Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 523F338E677
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 14:19:40 +0200 (CEST)
Received: from localhost ([::1]:47490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll9YY-0006Ae-GB
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 08:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ll9Vl-0004Rz-Di; Mon, 24 May 2021 08:16:45 -0400
Received: from [201.28.113.2] (port=62770 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ll9Vi-0004sP-Np; Mon, 24 May 2021 08:16:45 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 24 May 2021 09:16:35 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 60968801360;
 Mon, 24 May 2021 09:16:35 -0300 (-03)
Subject: Re: [PATCH 00/24] target/ppc: Clean up mmu translation
To: David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210518201146.794854-1-richard.henderson@linaro.org>
 <YKR9bZmPxOHKlnnP@yekko> <7a4c91d4-c813-2803-e5e7-4f8fe6d6f05d@linaro.org>
 <6bc68cda-a6aa-68c9-2c6f-f7c6ff95b7db@linaro.org> <YKsczpMuwDn006S4@yekko>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <44c341e8-eb2b-23c9-f120-78a22f1e95a7@eldorado.org.br>
Date: Mon, 24 May 2021 09:16:34 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKsczpMuwDn006S4@yekko>
Content-Type: multipart/alternative;
 boundary="------------AA57B89092283E886440A98B"
Content-Language: en-US
X-OriginalArrivalTime: 24 May 2021 12:16:35.0656 (UTC)
 FILETIME=[A3F1AC80:01D75096]
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
Cc: "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------AA57B89092283E886440A98B
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit


On 24/05/2021 00:26, David Gibson wrote:
> On Wed, May 19, 2021 at 05:47:05PM -0500, Richard Henderson wrote:
>> On 5/19/21 3:37 PM, Richard Henderson wrote:
>>> On 5/18/21 9:52 PM, David Gibson wrote:
>>>> I've applied 1..15, still looking at the rest.
>>> Please dequeue.  I want to create a new mmu-internal.h, which affects
>>> all the patches from #1.
>> Alternately, don't.  I can move the function later, and it may be a while
>> before I can get back to this.
> Ok, I'll leave them in, since they're good cleanups even without the
> rest of the series.

Just as a heads up, for the disable-tcg to work, we need the rest of the 
patches, so we sort of need the rest as soon as possible.

 From a quick conversation with farosas (cc'ed here), I think these 
might be old bugs (or at least one of them were, and I'm missing 
something), which either me or lucas (also cc'ed) were planning on 
tackling next.

If my understanding is correct, I don't think we lose anything by 
applying those and we finally support the disable flag.

-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------AA57B89092283E886440A98B
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
    <div class="moz-cite-prefix">On 24/05/2021 00:26, David Gibson
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YKsczpMuwDn006S4@yekko">
      <pre class="moz-quote-pre" wrap="">On Wed, May 19, 2021 at 05:47:05PM -0500, Richard Henderson wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 5/19/21 3:37 PM, Richard Henderson wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On 5/18/21 9:52 PM, David Gibson wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">I've applied 1..15, still looking at the rest.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Please dequeue.  I want to create a new mmu-internal.h, which affects
all the patches from #1.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Alternately, don't.  I can move the function later, and it may be a while
before I can get back to this.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Ok, I'll leave them in, since they're good cleanups even without the
rest of the series.</pre>
    </blockquote>
    <p>Just as a heads up, for the disable-tcg to work, we need the rest
      of the patches, so we sort of need the rest as soon as possible.</p>
    <p>From a quick conversation with farosas (cc'ed here), I think
      these might be old bugs (or at least one of them were, and I'm
      missing something), which either me or lucas (also cc'ed) were
      planning on tackling next. <br>
    </p>
    <p>If my understanding is correct, I don't think we lose anything by
      applying those and we finally support the disable flag.<br>
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

--------------AA57B89092283E886440A98B--

