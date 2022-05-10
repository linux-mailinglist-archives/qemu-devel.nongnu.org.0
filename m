Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A875222E6
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 19:36:50 +0200 (CEST)
Received: from localhost ([::1]:55830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noTmz-0001oY-IG
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 13:36:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1noTkt-0000yo-Ik; Tue, 10 May 2022 13:34:39 -0400
Received: from [187.72.171.209] (port=6957 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1noTkr-0004Hs-IW; Tue, 10 May 2022 13:34:39 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 10 May 2022 14:34:31 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 7EBA280046B;
 Tue, 10 May 2022 14:34:31 -0300 (-03)
Content-Type: multipart/alternative;
 boundary="------------ND6dIcwy07s6NNUTXUyu8vIV"
Message-ID: <ee50cc96-e26b-beb1-3042-d9b84b9589cc@eldorado.org.br>
Date: Tue, 10 May 2022 14:34:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] linux-user: Add PowerPC ISA 3.1 and MMA to hwcap
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Laurent Vivier <laurent@vivier.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20220427064204.373027-1-joel@jms.id.au>
 <e29248b7-1a61-87db-dc81-5c9db844b7cf@gmail.com>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
In-Reply-To: <e29248b7-1a61-87db-dc81-5c9db844b7cf@gmail.com>
X-OriginalArrivalTime: 10 May 2022 17:34:31.0984 (UTC)
 FILETIME=[35509300:01D86494]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
--------------ND6dIcwy07s6NNUTXUyu8vIV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 27/04/2022 17:51, Daniel Henrique Barboza wrote:
> On 4/27/22 03:42, Joel Stanley wrote:
>> These are new hwcap bits added for power10.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>> MMA support for TCG is on the list so I think it makes sense for this to
>> land after those are merged.
>
> I believe you mean this series:
>
>
> [RFC PATCH 0/7] VSX MMA Implementation
>
>
> In that case I'll queue this patch together with it.
Daniel and Joel, do you want me to send this with my patch series so 
there's no need to rebase this patch and they can be added together?
>
>
>
> Thanks,
>
>
> Daniel
>
>
-- 
Lucas Mateus M. Araujo e Castro
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>
--------------ND6dIcwy07s6NNUTXUyu8vIV
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 27/04/2022 17:51, Daniel Henrique
      Barboza wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:e29248b7-1a61-87db-dc81-5c9db844b7cf@gmail.com">On
      4/27/22 03:42, Joel Stanley wrote:
      <br>
      <blockquote type="cite">These are new hwcap bits added for
        power10.
        <br>
        <br>
        Signed-off-by: Joel Stanley <a class="moz-txt-link-rfc2396E" href="mailto:joel@jms.id.au">&lt;joel@jms.id.au&gt;</a>
        <br>
        ---
        <br>
        MMA support for TCG is on the list so I think it makes sense for
        this to
        <br>
        land after those are merged.
        <br>
      </blockquote>
      <br>
      I believe you mean this series:
      <br>
      <br>
      <br>
      [RFC PATCH 0/7] VSX MMA Implementation
      <br>
      <br>
      <br>
      In that case I'll queue this patch together with it.
      <br>
    </blockquote>
    Daniel and Joel, do you want me to send this with my patch series so
    there's no need to rebase this patch and they can be added together?<br>
    <blockquote type="cite"
      cite="mid:e29248b7-1a61-87db-dc81-5c9db844b7cf@gmail.com">
      <br>
      <br>
      <br>
      Thanks,
      <br>
      <br>
      <br>
      Daniel
      <br>
      <br>
      <br>
    </blockquote>
    <div class="moz-signature">-- <br>
      Lucas Mateus M. Araujo e Castro<br>
      <a
href="https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&amp;utm_medium=email&amp;utm_source=RD+Station">Instituto
        de Pesquisas ELDORADO</a><br>
      Departamento Computação Embarcada<br>
      Analista de Software Trainee<br>
      <a href="https://www.eldorado.org.br/disclaimer.html">Aviso Legal
        - Disclaimer</a></div>
  </body>
</html>

--------------ND6dIcwy07s6NNUTXUyu8vIV--

