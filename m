Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F37C038B821
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 22:11:49 +0200 (CEST)
Received: from localhost ([::1]:47376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljp1J-00078Z-1C
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 16:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ljoyn-0006IX-JA
 for qemu-devel@nongnu.org; Thu, 20 May 2021 16:09:13 -0400
Received: from [201.28.113.2] (port=60634 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>) id 1ljoyl-0002a9-RP
 for qemu-devel@nongnu.org; Thu, 20 May 2021 16:09:13 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 20 May 2021 16:55:36 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 9933A8013E1
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 16:55:36 -0300 (-03)
Subject: Re: [PATCH] scripts/checkpatch.pl: process .c.inc and .h.inc files as
 C source
To: qemu-devel@nongnu.org
References: <20210520195142.941261-1-matheus.ferst@eldorado.org.br>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <c104455d-b208-92b5-262c-be67e850a3ea@eldorado.org.br>
Date: Thu, 20 May 2021 16:55:36 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520195142.941261-1-matheus.ferst@eldorado.org.br>
Content-Type: multipart/alternative;
 boundary="------------5811CB2E73D08E3B13D6E0CC"
Content-Language: en-US
X-OriginalArrivalTime: 20 May 2021 19:55:36.0740 (UTC)
 FILETIME=[1A0E9640:01D74DB2]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------5811CB2E73D08E3B13D6E0CC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 20/05/2021 16:51, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>
> Change the regex used to determine whether a file should be processed as
> C source to include .c.inc and .h.inc extensions.
>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>   scripts/checkpatch.pl | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 3d185cceac..bbcd25ae05 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -12,7 +12,7 @@ use Term::ANSIColor qw(:constants);
>   my $P = $0;
>   $P =~ s@.*/@@g;
>   
> -our $SrcFile    = qr{\.(?:h|c|cpp|s|S|pl|py|sh)$};
> +our $SrcFile    = qr{\.(?:(h|c)(\.inc)?|cpp|s|S|pl|py|sh)$};
>   
>   my $V = '0.31';
>   
> @@ -1671,7 +1671,7 @@ sub process {
>   		}
>   
>   # check we are in a valid C source file if not then ignore this hunk
> -		next if ($realfile !~ /\.(h|c|cpp)$/);
> +		next if ($realfile !~ /\.((h|c)(\.inc)?|cpp)$/);
there's an extra ). shouldn't it be ((h|c(\.inc)?|cpp)$/)?
>   
>   # Block comment styles
>   
-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------5811CB2E73D08E3B13D6E0CC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 20/05/2021 16:51,
      <a class="moz-txt-link-abbreviated" href="mailto:matheus.ferst@eldorado.org.br">matheus.ferst@eldorado.org.br</a> wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20210520195142.941261-1-matheus.ferst@eldorado.org.br">
      <pre class="moz-quote-pre" wrap="">From: Matheus Ferst <a class="moz-txt-link-rfc2396E" href="mailto:matheus.ferst@eldorado.org.br">&lt;matheus.ferst@eldorado.org.br&gt;</a>

Change the regex used to determine whether a file should be processed as
C source to include .c.inc and .h.inc extensions.

Signed-off-by: Matheus Ferst <a class="moz-txt-link-rfc2396E" href="mailto:matheus.ferst@eldorado.org.br">&lt;matheus.ferst@eldorado.org.br&gt;</a>
---
 scripts/checkpatch.pl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 3d185cceac..bbcd25ae05 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -12,7 +12,7 @@ use Term::ANSIColor qw(:constants);
 my $P = $0;
 $P =~ <a class="moz-txt-link-abbreviated" href="mailto:s@.*/@@g">s@.*/@@g</a>;
 
-our $SrcFile    = qr{\.(?:h|c|cpp|s|S|pl|py|sh)$};
+our $SrcFile    = qr{\.(?:(h|c)(\.inc)?|cpp|s|S|pl|py|sh)$};
 
 my $V = '0.31';
 
@@ -1671,7 +1671,7 @@ sub process {
 		}
 
 # check we are in a valid C source file if not then ignore this hunk
-		next if ($realfile !~ /\.(h|c|cpp)$/);
+		next if ($realfile !~ /\.((h|c)(\.inc)?|cpp)$/);</pre>
    </blockquote>
    there's an extra ). shouldn't it be ((h|c(\.inc)?|cpp)$/)?<br>
    <blockquote type="cite"
      cite="mid:20210520195142.941261-1-matheus.ferst@eldorado.org.br">
      <pre class="moz-quote-pre" wrap="">
 
 # Block comment styles
 
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

--------------5811CB2E73D08E3B13D6E0CC--

