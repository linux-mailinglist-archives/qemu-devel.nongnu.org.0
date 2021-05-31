Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 785D9396776
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 19:55:12 +0200 (CEST)
Received: from localhost ([::1]:47392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnm87-00057L-7O
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 13:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lnm5Z-00044L-8Q; Mon, 31 May 2021 13:52:33 -0400
Received: from [201.28.113.2] (port=32384 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lnm5W-00089y-VF; Mon, 31 May 2021 13:52:33 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 31 May 2021 14:52:26 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id AD48E801481;
 Mon, 31 May 2021 14:52:26 -0300 (-03)
Subject: Re: [PATCH v3 2/4] HMP: added info cpustats to removed_features.rst
To: qemu-devel@nongnu.org
References: <20210531145629.21300-1-bruno.larsen@eldorado.org.br>
 <20210531145629.21300-3-bruno.larsen@eldorado.org.br>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <5ec95233-3611-4793-d7b2-db706c1bc765@eldorado.org.br>
Date: Mon, 31 May 2021 14:52:26 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210531145629.21300-3-bruno.larsen@eldorado.org.br>
Content-Type: multipart/alternative;
 boundary="------------729BB46C2014F1E458CC7B8C"
Content-Language: en-US
X-OriginalArrivalTime: 31 May 2021 17:52:27.0005 (UTC)
 FILETIME=[B7F9C2D0:01D75645]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
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
 luis.pires@eldorado.org.br, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------729BB46C2014F1E458CC7B8C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 31/05/2021 11:56, Bruno Larsen (billionai) wrote:
> Documented the removal of the HMP command info cpustats
>
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>

Oops, I seem to have dropped a few tags:

Reviewed-by: Luis Pires<luis.pires@eldorado.org.br>
Reviewed-by: Lucas Mateus<lucas.araujo@eldorado.org.br>
Reviewed-by: Greg Kurz<groug@kaod.org>

> ---
>   docs/system/removed-features.rst | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
> index 5a462ac568..2feae41089 100644
> --- a/docs/system/removed-features.rst
> +++ b/docs/system/removed-features.rst
> @@ -249,6 +249,11 @@ Use ``migrate-set-parameters`` and ``info migrate-parameters`` instead.
>   
>   Use ``migrate-set-parameters`` instead.
>   
> +``info cpustats`` (removed in 6.1)
> +'''''''''''''''''''''''''''''
> +
> +This command didn't produce any output already. Removed with no replacement.
> +
>   Guest Emulator ISAs
>   -------------------
>   
-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------729BB46C2014F1E458CC7B8C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 31/05/2021 11:56, Bruno Larsen
      (billionai) wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20210531145629.21300-3-bruno.larsen@eldorado.org.br">
      <pre class="moz-quote-pre" wrap="">Documented the removal of the HMP command info cpustats

Signed-off-by: Bruno Larsen (billionai) <a class="moz-txt-link-rfc2396E" href="mailto:bruno.larsen@eldorado.org.br">&lt;bruno.larsen@eldorado.org.br&gt;</a></pre>
    </blockquote>
    <p>Oops, I seem to have dropped a few tags:</p>
    <pre class="moz-quote-pre" wrap="">Reviewed-by: Luis Pires <a class="moz-txt-link-rfc2396E" href="mailto:luis.pires@eldorado.org.br">&lt;luis.pires@eldorado.org.br&gt;</a>
Reviewed-by: Lucas Mateus <a class="moz-txt-link-rfc2396E" href="mailto:lucas.araujo@eldorado.org.br">&lt;lucas.araujo@eldorado.org.br&gt;</a>
Reviewed-by: Greg Kurz <a class="moz-txt-link-rfc2396E" href="mailto:groug@kaod.org">&lt;groug@kaod.org&gt;</a></pre>
    <blockquote type="cite"
      cite="mid:20210531145629.21300-3-bruno.larsen@eldorado.org.br">
      <pre class="moz-quote-pre" wrap="">
---
 docs/system/removed-features.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 5a462ac568..2feae41089 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -249,6 +249,11 @@ Use ``migrate-set-parameters`` and ``info migrate-parameters`` instead.
 
 Use ``migrate-set-parameters`` instead.
 
+``info cpustats`` (removed in 6.1)
+'''''''''''''''''''''''''''''
+
+This command didn't produce any output already. Removed with no replacement.
+
 Guest Emulator ISAs
 -------------------
 
</pre>
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

--------------729BB46C2014F1E458CC7B8C--

