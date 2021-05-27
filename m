Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E65C339362D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 21:20:20 +0200 (CEST)
Received: from localhost ([::1]:57728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmLYJ-0001jZ-Ut
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 15:20:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1lmLW2-0000gS-3e; Thu, 27 May 2021 15:17:58 -0400
Received: from [201.28.113.2] (port=33256 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1lmLVz-0005IS-UM; Thu, 27 May 2021 15:17:57 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 27 May 2021 16:17:51 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 6B0798013E1;
 Thu, 27 May 2021 16:17:51 -0300 (-03)
Subject: Re: [PATCH v2] HMP: added info cpustats to removed_features.rst
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210527175602.40163-1-bruno.larsen@eldorado.org.br>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
Message-ID: <3890626e-4724-d6ef-69b7-341e56c01989@eldorado.org.br>
Date: Thu, 27 May 2021 16:17:50 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210527175602.40163-1-bruno.larsen@eldorado.org.br>
Content-Type: multipart/alternative;
 boundary="------------A9DAC3226A9C674C237C7FF9"
Content-Language: en-US
X-OriginalArrivalTime: 27 May 2021 19:17:51.0940 (UTC)
 FILETIME=[FD05C840:01D7532C]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, groug@kaod.org,
 luis.pires@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------A9DAC3226A9C674C237C7FF9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 27/05/2021 14:56, Bruno Larsen (billionai) wrote:
> Documented the removal of the HMP command info cpustats
>
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>   docs/system/removed-features.rst | 5 +++++
>   1 file changed, 5 insertions(+)
Reviewed-by: Lucas Mateus <lucas.araujo@eldorado.org.br>
-- 
Lucas Mateus M. Araujo e Castro
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Estagiario
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------A9DAC3226A9C674C237C7FF9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 27/05/2021 14:56, Bruno Larsen
      (billionai) wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20210527175602.40163-1-bruno.larsen@eldorado.org.br">
      <pre class="moz-quote-pre" wrap="">Documented the removal of the HMP command info cpustats

Signed-off-by: Bruno Larsen (billionai) <a class="moz-txt-link-rfc2396E" href="mailto:bruno.larsen@eldorado.org.br">&lt;bruno.larsen@eldorado.org.br&gt;</a>
---
 docs/system/removed-features.rst | 5 +++++
 1 file changed, 5 insertions(+)
</pre>
    </blockquote>
    Reviewed-by: Lucas Mateus <a class="moz-txt-link-rfc2396E" href="mailto:lucas.araujo@eldorado.org.br">&lt;lucas.araujo@eldorado.org.br&gt;</a><br>
    <blockquote type="cite"
      cite="mid:20210527175602.40163-1-bruno.larsen@eldorado.org.br">
    </blockquote>
    <div class="moz-signature">-- <br>
      Lucas Mateus M. Araujo e Castro<br>
      <a
href="https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&amp;utm_medium=email&amp;utm_source=RD+Station">Instituto
        de Pesquisas ELDORADO</a><br>
      Departamento Computação Embarcada<br>
      Estagiario<br>
      <a href="https://www.eldorado.org.br/disclaimer.html">Aviso Legal
        - Disclaimer</a></div>
  </body>
</html>

--------------A9DAC3226A9C674C237C7FF9--

