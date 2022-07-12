Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3A1571DC0
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 17:02:48 +0200 (CEST)
Received: from localhost ([::1]:36342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBHPU-0001xV-09
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 11:02:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oBHEJ-0007JG-GZ; Tue, 12 Jul 2022 10:51:19 -0400
Received: from [200.168.210.66] (port=19551 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oBHEH-0006lY-Sf; Tue, 12 Jul 2022 10:51:15 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 12 Jul 2022 11:51:11 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 89921800146;
 Tue, 12 Jul 2022 11:51:11 -0300 (-03)
Content-Type: multipart/alternative;
 boundary="------------XxihHi0bUVwEmcw9frhkC5VW"
Message-ID: <ae24ca7c-fc8e-ae34-5f0f-0d70840efdbe@eldorado.org.br>
Date: Tue, 12 Jul 2022 11:51:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
Subject: Using Unicamp's Minicloud for the QEMU CI
To: qemu-devel@nongnu.org, qemu-ppc <qemu-ppc@nongnu.org>
Cc: Rafael Peria de Sene <rpsene@br.ibm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
Content-Language: en-US
X-OriginalArrivalTime: 12 Jul 2022 14:51:11.0835 (UTC)
 FILETIME=[D3FEC2B0:01D895FE]
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
--------------XxihHi0bUVwEmcw9frhkC5VW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgZXZlcnlvbmUhDQoNCkkgd291bGQgbGlrZSBnYXVnZSB0aGUgaW50ZXJlc3QgaW4gdXNp
bmcgTWluaWNsb3VkJ3MgaW5mcmFzdHJ1Y3R1cmVbMV0gDQpmb3IgdGhlIENJLCB0YWxraW5n
IHdpdGggc29tZSBwZW9wbGUgZnJvbSB0aGVyZSB0aGV5IGFyZSBpbnRlcmVzdGVkLiBJdCAN
CmhhcyBib3RoIHBwYzY0IGFuZCBwcDY0bGUgaW1hZ2VzLCBtdWx0aXBsZSB2ZXJzaW9ucyBv
ZiA0IGRpc3Ryb3MgDQooVWJ1bnR1LCBGZWRvcmEsIERlYmlhbiBhbmQgQ2VudE9TKS4NCg0K
SSd2ZSBtYWRlIGEgaW5pdGlhbCB0ZXN0IHNldHVwIGluIGEgZm9ya1syXSB3aXRoIGEgYnJh
bmNoKHBwYzY0LXJ1bm5lcnMpIA0KdGhhdCBoYXMgYm90aCBhIG5ldyBwaXBlbGluZSB3aXRo
IGpvYnMgdG8gcnVuIG9uIHRoZSBwcGM2NC9wcGM2NGxlIA0KcnVubmVycyBhbmQgdXBkYXRl
ZCBzb21lIHNjcmlwdHMgKG1haW5seSB0aGUgYnVpbGQtZW52aXJvbm1lbnQueW1sKSB0byAN
CmF1dG9tYXRlIHRoZSBzZXR1cCBvZiB0aGUgZW52aXJvbm1lbnQgaW4gdGhvc2UgYXJjaGl0
ZWN0dXJlcy4NCg0KWzFdIGh0dHBzOi8vb3BlbnBvd2VyLmljLnVuaWNhbXAuYnIvbWluaWNs
b3VkLw0KDQpbMl0gaHR0cHM6Ly9naXRsYWIuY29tL3BwYzY0L3FlbXUvLS9waXBlbGluZXMN
Cg0KUC5TLjogUmUtc2VuZGluZyBkdWUgdG8gYW4gZXJyb3INCg0KQXR0Lg0KDQotLSANCkx1
Y2FzIE1hdGV1cyBNLiBBcmF1am8gZSBDYXN0cm8NCkluc3RpdHV0byBkZSBQZXNxdWlzYXMg
RUxET1JBRE8gDQo8aHR0cHM6Ly93d3cuZWxkb3JhZG8ub3JnLmJyLz91dG1fY2FtcGFpZ249
YXNzaW5hdHVyYV9kZV9lLW1haWwmdXRtX21lZGl1bT1lbWFpbCZ1dG1fc291cmNlPVJEK1N0
YXRpb24+DQpEZXBhcnRhbWVudG8gQ29tcHV0YcOnw6NvIEVtYmFyY2FkYQ0KQW5hbGlzdGEg
ZGUgU29mdHdhcmUgVHJhaW5lZQ0KQXZpc28gTGVnYWwgLSBEaXNjbGFpbWVyIDxodHRwczov
L3d3dy5lbGRvcmFkby5vcmcuYnIvZGlzY2xhaW1lci5odG1sPg0K
--------------XxihHi0bUVwEmcw9frhkC5VW
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
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
    <p>[1] <a class=3D"moz-txt-link-freetext"
        href=3D"https://openpower.ic.unicamp.br/minicloud/"
        moz-do-not-send=3D"true">https://openpower.ic.unicamp.br/miniclou=
d/</a></p>
    <p>[2] <a class=3D"moz-txt-link-freetext"
        href=3D"https://gitlab.com/ppc64/qemu/-/pipelines"
        moz-do-not-send=3D"true">https://gitlab.com/ppc64/qemu/-/pipeline=
s</a></p>
    <p>P.S.: Re-sending due to an error<br>
    </p>
    <p>Att.<br>
    </p>
    <div class=3D"moz-signature">-- <br>
      Lucas Mateus M. Araujo e Castro<br>
      <a
href=3D"https://www.eldorado.org.br/?utm_campaign=3Dassinatura_de_e-mail&=
amp;utm_medium=3Demail&amp;utm_source=3DRD+Station"
        moz-do-not-send=3D"true">Instituto de Pesquisas ELDORADO</a><br>
      Departamento Computa=C3=A7=C3=A3o Embarcada<br>
      Analista de Software Trainee<br>
      <a href=3D"https://www.eldorado.org.br/disclaimer.html"
        moz-do-not-send=3D"true">Aviso Legal - Disclaimer</a></div>
  </body>
</html>

--------------XxihHi0bUVwEmcw9frhkC5VW--

