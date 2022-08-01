Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE781586B3D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 14:48:25 +0200 (CEST)
Received: from localhost ([::1]:39738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIUqN-0007go-PD
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 08:48:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oIUmG-0005Ry-75; Mon, 01 Aug 2022 08:44:08 -0400
Received: from [200.168.210.66] (port=48992 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oIUmE-0001jS-8D; Mon, 01 Aug 2022 08:44:07 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 1 Aug 2022 09:44:01 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 4DDF98002C0;
 Mon,  1 Aug 2022 09:44:01 -0300 (-03)
Content-Type: multipart/alternative;
 boundary="------------QZ9UVs9EvVsEEpN74e6l8Yyl"
Message-ID: <a9ec9906-3ccf-c791-0978-30f337eeeaa4@eldorado.org.br>
Date: Mon, 1 Aug 2022 09:44:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.1? 0/2] Re-enable ppc32 as a linux-user host
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk, qemu-ppc@nongnu.org, laurent@vivier.eu
References: <20220729172141.1789105-1-richard.henderson@linaro.org>
 <61198099-b282-3289-aa22-f0176d59816a@gmail.com>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
In-Reply-To: <61198099-b282-3289-aa22-f0176d59816a@gmail.com>
X-OriginalArrivalTime: 01 Aug 2022 12:44:01.0770 (UTC)
 FILETIME=[60623CA0:01D8A5A4]
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
--------------QZ9UVs9EvVsEEpN74e6l8Yyl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpPbiAyOS8wNy8yMDIyIDE3OjQ0LCBEYW5pZWwgSGVucmlxdWUgQmFyYm96YSB3cm90ZToN
Cj4NCj4gT24gNy8yOS8yMiAxNDoyMSwgUmljaGFyZCBIZW5kZXJzb24gd3JvdGU6DQo+PiBU
aGlzIGlzLCB0ZWNobmljYWxseSwgYSByZWdyZXNzaW9uIGZyb20gNi4yLCBzbyBpdCdzIG5v
dA0KPj4gaW1wbGF1c2libGUgdG8gYXBwbHkgYmVmb3JlIHJjMS7CoCBUaG91Z2h0cz8NCj4N
Cj4NCj4gSW4gZ2l0bGFiICMxMDk3IHRoZSBhdXRob3IgY29tbWVudHMgdGhhdDoNCj4NCj4g
aHR0cHM6Ly9naXRsYWIuY29tL3FlbXUtcHJvamVjdC9xZW11Ly0vaXNzdWVzLzEwOTcjbm90
ZV8xMDQ0ODEwNDgzDQo+DQo+ICJ0aGVyZSBhcmUgc2V2ZXJhbCBkaXN0cmlidXRpb25zIHN0
aWxsIGF2YWlsYWJsZSBvbiAzMi1iaXQgcG93ZXJwYywgZS5nLg0KPiBBZMOpbGllIExpbnV4
LCBmb3Igbm93IHN0aWxsIFZvaWQgTGludXgsIGFmYWlrIERlYmlhbiBhbmQgT3BlblNVU0Ug
YWxzbw0KPiBzdGlsbCBidWlsZCBwYWNrYWdlcyINCj4NCj4gSSBjaGVja2VkIHRoZXNlIGNs
YWltcy4gTGF0ZXN0IHZlcnNpb24gT3BlblN1c2UgTEVBUCBkb2Vzbid0IHN1cHBvcnQNCj4g
cHBjMzIgYml0czoNCj4NCj4gaHR0cHM6Ly9nZXQub3BlbnN1c2Uub3JnL2xlYXAvMTUuNC8j
ZG93bmxvYWQNCj4NCj4gVGhlIGxhc3QgRGViaWFuIHRoYXQgc3VwcG9ydHMgcHBjMzIgd2Fz
IERlYmlhbiA4Og0KPg0KPiBodHRwczovL3d3dy5kZWJpYW4ub3JnL3BvcnRzL3Bvd2VycGMv
I3Bvd2VycGMNCj4NCj4gIkRlYmlhbiBvbiAzMi1iaXQgUG93ZXJQQyAocG93ZXJwYykNCj4g
SXQgZmlyc3QgYmVjYW1lIGFuIG9mZmljaWFsIHJlbGVhc2UgYXJjaGl0ZWN0dXJlIHdpdGgg
RGViaWFuIEdOVS9MaW51eCANCj4gMi4yDQo+IChwb3RhdG8pIGFuZCBoYWQgcmV0YWluZWQg
dGhhdCBzdGF0dXMgdW50aWwgdGhlIHB1YmxpY2F0aW9uIG9mIERlYmlhbiANCj4gOSAoc3Ry
ZXRjaCkuDQo+IFRoZSBsYXN0IHN1cHBvcnRlZCByZWxlYXNlIGZvciAzMi1iaXQgUG93ZXJQ
QyBpcyBEZWJpYW4gOCAoamVzc2llKSINCj4NCj4gQW5kIFZvaWQgTGludXggZG9lc24ndCBz
ZWVtIHRvIHN1cHBvcnQgYW55IFBvd2VyUEMgZmxhdm9yOg0KPg0KPiBodHRwczovL3ZvaWRs
aW51eC5vcmcvZG93bmxvYWQvDQoNClRoZSBhdXRob3IgaXMgcHJvYmFibHkgdGFsa2luZyBh
Ym91dCBWb2lkIExpbnV4IHBwYyBhcyBpdCBzZWVtcyBpdCBzdGlsbCANCnN1cHBvcnQgcHBj
DQoNCmh0dHBzOi8vdm9pZGxpbnV4LXBwYy5vcmcvDQoNCj4NCj4gQWTDqWxpZSBMaW51eCBz
dXBwb3J0cyBwcGMzMi4gSSBjYW4gYWxzbyBhZGQgdGhhdCBGcmVlQlNEIGFsc28gc3VwcG9y
dHMgDQo+IHBwYzMyLg0KPg0KPiBDaGVja2luZyBhYm91dC9idWlsZC1wbGF0Zm9ybXMucnN0
IEkgY2FuIHNlZSB0aGF0IHdlIHdvdWxkIG9ubHkgc29tZXdoYXQNCj4gY2FyZSBmb3IgRnJl
ZUJTRCBoZXJlLCBzaW5jZSBEZWJpYW4gOCBpcyBhbHJlYWR5IG91dCBvZiBvdXIgc3VwcG9y
dA0KPiB3aW5kb3cuDQo+DQo+IEFsbCB0aGF0IHNhaWQsIEkgZG9uJ3QgaGF2ZSBzdHJvbmcg
ZmVlbGluZ3MgYWdhaW5zdCByZS1lbmFibGluZyBpdCwgDQo+IHNwZWNpYWxseQ0KPiBiZWNh
dXNlIHRoaXMgYnVpbGQgaXNzdWUgd2FzIGRlbGliZXJhdGVkIGNhdXNlZCBieSB1cy4NCj4N
Cj4gSG93ZXZlciwgYWZ0ZXIgcmUtZW5hYmxpbmcgaXQsIEkgd291bGQgb25seSBjYXJlIGFi
b3V0IGJ1aWxkIGJ1Z3MgdGhhdCANCj4gYXJlDQo+IHJlcHJvZHVjZWQgb24gcHBjMzIgRnJl
ZUJTRC4NCj4NCj4NCj4NCj4gRGFuaWVsDQo+DQo+Pg0KPj4NCj4+IHJ+DQo+Pg0KPj4NCj4+
IFJpY2hhcmQgSGVuZGVyc29uICgyKToNCj4+IMKgwqAgY29tbW9uLXVzZXIvaG9zdC9wcGM6
IEltcGxlbWVudCBzYWZlLXN5c2NhbGwuaW5jLlMNCj4+IMKgwqAgbGludXgtdXNlcjogSW1w
bG1lbnQgaG9zdC9wcGMvaG9zdC1zaWduYWwuaA0KPj4NCj4+IMKgIGxpbnV4LXVzZXIvaW5j
bHVkZS9ob3N0L3BwYy9ob3N0LXNpZ25hbC5oIHzCoCAzOSArKysrKysrKw0KPj4gwqAgY29t
bW9uLXVzZXIvaG9zdC9wcGMvc2FmZS1zeXNjYWxsLmluYy5TwqDCoCB8IDEwNyArKysrKysr
KysrKysrKysrKysrKysrDQo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDE0NiBpbnNlcnRpb25z
KCspDQo+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgbGludXgtdXNlci9pbmNsdWRlL2hvc3Qv
cHBjL2hvc3Qtc2lnbmFsLmgNCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb21tb24tdXNl
ci9ob3N0L3BwYy9zYWZlLXN5c2NhbGwuaW5jLlMNCj4+DQo+DQotLSANCkx1Y2FzIE1hdGV1
cyBNLiBBcmF1am8gZSBDYXN0cm8NCkluc3RpdHV0byBkZSBQZXNxdWlzYXMgRUxET1JBRE8g
DQo8aHR0cHM6Ly93d3cuZWxkb3JhZG8ub3JnLmJyLz91dG1fY2FtcGFpZ249YXNzaW5hdHVy
YV9kZV9lLW1haWwmdXRtX21lZGl1bT1lbWFpbCZ1dG1fc291cmNlPVJEK1N0YXRpb24+DQpE
ZXBhcnRhbWVudG8gQ29tcHV0YcOnw6NvIEVtYmFyY2FkYQ0KQW5hbGlzdGEgZGUgU29mdHdh
cmUgVHJhaW5lZQ0KQXZpc28gTGVnYWwgLSBEaXNjbGFpbWVyIDxodHRwczovL3d3dy5lbGRv
cmFkby5vcmcuYnIvZGlzY2xhaW1lci5odG1sPg0K
--------------QZ9UVs9EvVsEEpN74e6l8Yyl
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 29/07/2022 17:44, Daniel Henrique
      Barboza wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:61198099-b282-3289-aa22-f0176d59816a@gmail.com"><br>
      On 7/29/22 14:21, Richard Henderson wrote:
      <br>
      <blockquote type=3D"cite">This is, technically, a regression from
        6.2, so it's not
        <br>
        implausible to apply before rc1.=C2=A0 Thoughts?
        <br>
      </blockquote>
      <br>
      <br>
      In gitlab #1097 the author comments that:
      <br>
      <br>
      <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.com/qemu-=
project/qemu/-/issues/1097#note_1044810483">https://gitlab.com/qemu-proje=
ct/qemu/-/issues/1097#note_1044810483</a>
      <br>
      <br>
      "there are several distributions still available on 32-bit
      powerpc, e.g.
      <br>
      Ad=C3=A9lie Linux, for now still Void Linux, afaik Debian and OpenS=
USE
      also
      <br>
      still build packages"
      <br>
      <br>
      I checked these claims. Latest version OpenSuse LEAP doesn't
      support
      <br>
      ppc32 bits:
      <br>
      <br>
      <a class=3D"moz-txt-link-freetext" href=3D"https://get.opensuse.org=
/leap/15.4/#download">https://get.opensuse.org/leap/15.4/#download</a>
      <br>
      <br>
      The last Debian that supports ppc32 was Debian 8:
      <br>
      <br>
      <a class=3D"moz-txt-link-freetext" href=3D"https://www.debian.org/p=
orts/powerpc/#powerpc">https://www.debian.org/ports/powerpc/#powerpc</a>
      <br>
      <br>
      "Debian on 32-bit PowerPC (powerpc)
      <br>
      It first became an official release architecture with Debian
      GNU/Linux 2.2
      <br>
      (potato) and had retained that status until the publication of
      Debian 9 (stretch).
      <br>
      The last supported release for 32-bit PowerPC is Debian 8
      (jessie)"
      <br>
      <br>
      And Void Linux doesn't seem to support any PowerPC flavor:
      <br>
      <br>
      <a class=3D"moz-txt-link-freetext" href=3D"https://voidlinux.org/do=
wnload/">https://voidlinux.org/download/</a>
      <br>
    </blockquote>
    <p>The author is probably talking about Void Linux ppc as it seems
      it still support ppc</p>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://voidlinux-ppc.o=
rg/">https://voidlinux-ppc.org/</a></p>
    <blockquote type=3D"cite"
      cite=3D"mid:61198099-b282-3289-aa22-f0176d59816a@gmail.com">
      <br>
      Ad=C3=A9lie Linux supports ppc32. I can also add that FreeBSD also
      supports ppc32.
      <br>
      <br>
      Checking about/build-platforms.rst I can see that we would only
      somewhat
      <br>
      care for FreeBSD here, since Debian 8 is already out of our
      support
      <br>
      window.
      <br>
      <br>
      All that said, I don't have strong feelings against re-enabling
      it, specially
      <br>
      because this build issue was deliberated caused by us.
      <br>
      <br>
      However, after re-enabling it, I would only care about build bugs
      that are
      <br>
      reproduced on ppc32 FreeBSD.
      <br>
      <br>
      <br>
      <br>
      Daniel
      <br>
      <br>
      <blockquote type=3D"cite">
        <br>
        <br>
        r~
        <br>
        <br>
        <br>
        Richard Henderson (2):
        <br>
        =C2=A0=C2=A0 common-user/host/ppc: Implement safe-syscall.inc.S
        <br>
        =C2=A0=C2=A0 linux-user: Implment host/ppc/host-signal.h
        <br>
        <br>
        =C2=A0 linux-user/include/host/ppc/host-signal.h |=C2=A0 39 +++++=
+++
        <br>
        =C2=A0 common-user/host/ppc/safe-syscall.inc.S=C2=A0=C2=A0 | 107
        ++++++++++++++++++++++
        <br>
        =C2=A0 2 files changed, 146 insertions(+)
        <br>
        =C2=A0 create mode 100644 linux-user/include/host/ppc/host-signal=
=2Eh
        <br>
        =C2=A0 create mode 100644 common-user/host/ppc/safe-syscall.inc.S=

        <br>
        <br>
      </blockquote>
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

--------------QZ9UVs9EvVsEEpN74e6l8Yyl--

