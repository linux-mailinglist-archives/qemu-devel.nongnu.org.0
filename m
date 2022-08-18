Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C76EE598864
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 18:12:22 +0200 (CEST)
Received: from localhost ([::1]:33738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOi85-0007EF-9P
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 12:12:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oOi2T-0001TR-J6; Thu, 18 Aug 2022 12:06:37 -0400
Received: from [200.168.210.66] (port=41684 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oOi2Q-0003SM-Ov; Thu, 18 Aug 2022 12:06:32 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 18 Aug 2022 13:06:26 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id D91F2800131;
 Thu, 18 Aug 2022 13:06:25 -0300 (-03)
Content-Type: multipart/alternative;
 boundary="------------01fuuRUJ00h8iyJPcCNJaBZl"
Message-ID: <b2c49e7f-9b62-86bc-d714-77367df702ca@eldorado.org.br>
Date: Thu, 18 Aug 2022 13:06:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Using Unicamp's Minicloud for the QEMU CI
Content-Language: en-US
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org, qemu-ppc <qemu-ppc@nongnu.org>
Cc: Rafael Peria de Sene <rpsene@br.ibm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <ae24ca7c-fc8e-ae34-5f0f-0d70840efdbe@eldorado.org.br>
In-Reply-To: <ae24ca7c-fc8e-ae34-5f0f-0d70840efdbe@eldorado.org.br>
X-OriginalArrivalTime: 18 Aug 2022 16:06:26.0135 (UTC)
 FILETIME=[78030670:01D8B31C]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
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
--------------01fuuRUJ00h8iyJPcCNJaBZl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

cGluZw0KDQpBbnkgaW50ZXJlc3QgaW4gdGhpcz8NCg0KT24gMTIvMDcvMjAyMiAxMTo1MSwg
THVjYXMgTWF0ZXVzIE1hcnRpbnMgQXJhdWpvIGUgQ2FzdHJvIHdyb3RlOg0KPg0KPiBIaSBl
dmVyeW9uZSENCj4NCj4gSSB3b3VsZCBsaWtlIGdhdWdlIHRoZSBpbnRlcmVzdCBpbiB1c2lu
ZyBNaW5pY2xvdWQncyBpbmZyYXN0cnVjdHVyZVsxXSANCj4gZm9yIHRoZSBDSSwgdGFsa2lu
ZyB3aXRoIHNvbWUgcGVvcGxlIGZyb20gdGhlcmUgdGhleSBhcmUgaW50ZXJlc3RlZC4gDQo+
IEl0IGhhcyBib3RoIHBwYzY0IGFuZCBwcDY0bGUgaW1hZ2VzLCBtdWx0aXBsZSB2ZXJzaW9u
cyBvZiA0IGRpc3Ryb3MgDQo+IChVYnVudHUsIEZlZG9yYSwgRGViaWFuIGFuZCBDZW50T1Mp
Lg0KPg0KPg0KLS0gDQpMdWNhcyBNYXRldXMgTS4gQXJhdWpvIGUgQ2FzdHJvDQpJbnN0aXR1
dG8gZGUgUGVzcXVpc2FzIEVMRE9SQURPIA0KPGh0dHBzOi8vd3d3LmVsZG9yYWRvLm9yZy5i
ci8/dXRtX2NhbXBhaWduPWFzc2luYXR1cmFfZGVfZS1tYWlsJnV0bV9tZWRpdW09ZW1haWwm
dXRtX3NvdXJjZT1SRCtTdGF0aW9uPg0KRGVwYXJ0YW1lbnRvIENvbXB1dGHDp8OjbyBFbWJh
cmNhZGENCkFuYWxpc3RhIGRlIFNvZnR3YXJlIFRyYWluZWUNCkF2aXNvIExlZ2FsIC0gRGlz
Y2xhaW1lciA8aHR0cHM6Ly93d3cuZWxkb3JhZG8ub3JnLmJyL2Rpc2NsYWltZXIuaHRtbD4N
Cg==
--------------01fuuRUJ00h8iyJPcCNJaBZl
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>ping</p>
    <p>Any interest in this?<br>
    </p>
    <div class=3D"moz-cite-prefix">On 12/07/2022 11:51, Lucas Mateus
      Martins Araujo e Castro wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:ae24ca7c-fc8e-ae34-5f0f-0d70840efdbe@eldorado.org.br">
      <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DU=
TF-8">
      <p>Hi everyone!</p>
      <p>I would like gauge the interest in using Minicloud's
        infrastructure[1] for the CI, talking with some people from
        there they are interested. It has both ppc64 and pp64le images,
        multiple versions of 4 distros (Ubuntu, Fedora, Debian and
        CentOS).<br>
      </p>
      <br>
    </blockquote>
    <div class=3D"moz-signature">-- <br>
      Lucas Mateus M. Araujo e Castro<br>
      <a
href=3D"https://www.eldorado.org.br/?utm_campaign=3Dassinatura_de_e-mail&=
amp;utm_medium=3Demail&amp;utm_source=3DRD+Station">Instituto
        de Pesquisas ELDORADO</a><br>
      Departamento Computa=C3=A7=C3=A3o Embarcada<br>
      Analista de Software Trainee<br>
      <a href=3D"https://www.eldorado.org.br/disclaimer.html">Aviso Legal=

        - Disclaimer</a></div>
  </body>
</html>

--------------01fuuRUJ00h8iyJPcCNJaBZl--

