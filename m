Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA0D571D63
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 16:54:27 +0200 (CEST)
Received: from localhost ([::1]:51496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBHHM-0001On-R5
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 10:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oBHBm-0005jE-W6; Tue, 12 Jul 2022 10:48:39 -0400
Received: from [200.168.210.66] (port=2967 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oBHBl-0006G9-5W; Tue, 12 Jul 2022 10:48:38 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 12 Jul 2022 11:31:16 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id A038D800146;
 Tue, 12 Jul 2022 11:31:16 -0300 (-03)
Content-Type: multipart/alternative;
 boundary="------------01a6M4iy8yEnAo2JETigJpRf"
Message-ID: <e272e6ad-7274-9920-d40e-1eed12e65ee3@eldorado.org.br>
Date: Tue, 12 Jul 2022 11:31:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
Subject: Using Unicamp's Minicloud for the QEMU CI
Content-Language: en-US
To: qemu-devel@nongnu.org, qemu-ppc <qemu-ppc@nongnu.org>
Cc: Rafael Peria de Sene <rpsene@br.ibm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
X-OriginalArrivalTime: 12 Jul 2022 14:31:16.0953 (UTC)
 FILETIME=[0BCA3C90:01D895FC]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
--------------01a6M4iy8yEnAo2JETigJpRf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi everyone!

I would like gauge the interest in using Minicloud's infrastructure[1] 
for the CI, talking with some people from there they are interested. It 
has both ppc64 and pp64le images, multiple versions of 4 distros 
(Ubuntu, Fedora, Debian and CentOS).

I've made a initial test setup in a fork[2] with a branch(ppc64-runners) 
that has both a new pipeline with jobs to run on the ppc64/ppc64le 
runners and updated some scripts (mainly the build-environment.yml) to 
automate the setup of the environment in those architectures.

[1] https://openpower.ic.unicamp.br/minicloud/

[2] https://gitlab.com/ppc64/qemu/-/pipelines

Att.

-- 
Lucas Mateus M. Araujo e Castro
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>
--------------01a6M4iy8yEnAo2JETigJpRf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi everyone!</p>
    <p>I would like gauge the interest in using Minicloud's
      infrastructure[1] for the CI, talking with some people from there
      they are interested. It has both ppc64 and pp64le images, multiple
      versions of 4 distros (Ubuntu, Fedora, Debian and CentOS).<br>
    </p>
    <p>I've made a initial test setup in a fork[2] with a
      branch(ppc64-runners) that has both a new pipeline with jobs to
      run on the ppc64/ppc64le runners and updated some scripts (mainly
      the build-environment.yml) to automate the setup of the
      environment in those architectures.<br>
    </p>
    <p>[1] <a class="moz-txt-link-freetext"
        href="https://openpower.ic.unicamp.br/minicloud/">https://openpower.ic.unicamp.br/minicloud/</a></p>
    <p>[2] <a class="moz-txt-link-freetext" href="https://gitlab.com/ppc64/qemu/-/pipelines">https://gitlab.com/ppc64/qemu/-/pipelines</a></p>
    <p>Att.<br>
    </p>
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

--------------01a6M4iy8yEnAo2JETigJpRf--

