Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EBE375BA1
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 21:20:33 +0200 (CEST)
Received: from localhost ([::1]:38778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lejY0-0005qN-Sh
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 15:20:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lejKt-0006NT-Db; Thu, 06 May 2021 15:06:59 -0400
Received: from [201.28.113.2] (port=12743 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lejKr-00026H-IH; Thu, 06 May 2021 15:06:59 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 6 May 2021 16:06:52 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 74732800E42;
 Thu,  6 May 2021 16:06:52 -0300 (-03)
Subject: Re: [PATCH v5 2/4] target/ppc: move SPR R/W callbacks to translate.c
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210505155310.62710-1-bruno.larsen@eldorado.org.br>
 <20210505155310.62710-3-bruno.larsen@eldorado.org.br>
 <199d04bd-26b1-e6b5-06db-1e28074bbeb7@linaro.org>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <29db975d-15a5-b06e-3ec9-512ff49d4592@eldorado.org.br>
Date: Thu, 6 May 2021 16:06:52 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <199d04bd-26b1-e6b5-06db-1e28074bbeb7@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------723D5BF6EA88B0D910B41414"
Content-Language: en-US
X-OriginalArrivalTime: 06 May 2021 19:06:52.0774 (UTC)
 FILETIME=[F9744860:01D742AA]
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
--------------723D5BF6EA88B0D910B41414
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 06/05/2021 15:57, Richard Henderson wrote:
> On 5/5/21 8:53 AM, Bruno Larsen (billionai) wrote:
>> +/* SPR READ/RITE CALLBACKS */
>
> Missed the spelling fix reported against v4.
> And my r-b tags.
>
>
> r~

:facepalm:

sorry, resending it now

-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------723D5BF6EA88B0D910B41414
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 06/05/2021 15:57, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:199d04bd-26b1-e6b5-06db-1e28074bbeb7@linaro.org">On
      5/5/21 8:53 AM, Bruno Larsen (billionai) wrote:
      <br>
      <blockquote type="cite">+/* SPR READ/RITE CALLBACKS */
        <br>
      </blockquote>
      <br>
      Missed the spelling fix reported against v4.
      <br>
      And my r-b tags.
      <br>
      <br>
      <br>
      r~
      <br>
    </blockquote>
    <p>:facepalm:</p>
    <p>sorry, resending it now<br>
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

--------------723D5BF6EA88B0D910B41414--

