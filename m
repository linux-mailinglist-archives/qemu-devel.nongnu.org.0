Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC1E612587
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 23:16:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oot9P-0001Z4-04; Sat, 29 Oct 2022 17:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1oot9M-0001Yw-Lv
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 17:13:52 -0400
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1oot9K-00088R-7C
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 17:13:52 -0400
Received: from [192.168.178.59] (p5b151d14.dip0.t-ipconnect.de [91.21.29.20])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 76C5DDA0729;
 Sat, 29 Oct 2022 23:13:47 +0200 (CEST)
Message-ID: <952d57c2-8493-0a7b-8384-96e0f285853a@weilnetz.de>
Date: Sat, 29 Oct 2022 23:13:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v2 29/30] tests/docker: remove FROM qemu/ support from
 docker.py
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
 <20220914155950.804707-30-alex.bennee@linaro.org>
 <72674788-e55a-8429-b1bf-384db3d837aa@linaro.org>
 <306323d5-1bec-078b-9686-7670b4fdf247@weilnetz.de>
 <CABgObfazc5opNOdO=Yyj_z8nYy4tYOetKs9GkwYzudEtKoAODQ@mail.gmail.com>
In-Reply-To: <CABgObfazc5opNOdO=Yyj_z8nYy4tYOetKs9GkwYzudEtKoAODQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5CUapMtHpI0gtSTUBe6DTHHj"
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5CUapMtHpI0gtSTUBe6DTHHj
Content-Type: multipart/mixed; boundary="------------P5yEvzsb2Ulkr4rnhLHi0MZ3";
 protected-headers="v1"
From: Stefan Weil <sw@weilnetz.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Message-ID: <952d57c2-8493-0a7b-8384-96e0f285853a@weilnetz.de>
Subject: Re: [PATCH v2 29/30] tests/docker: remove FROM qemu/ support from
 docker.py
References: <20220914155950.804707-1-alex.bennee@linaro.org>
 <20220914155950.804707-30-alex.bennee@linaro.org>
 <72674788-e55a-8429-b1bf-384db3d837aa@linaro.org>
 <306323d5-1bec-078b-9686-7670b4fdf247@weilnetz.de>
 <CABgObfazc5opNOdO=Yyj_z8nYy4tYOetKs9GkwYzudEtKoAODQ@mail.gmail.com>
In-Reply-To: <CABgObfazc5opNOdO=Yyj_z8nYy4tYOetKs9GkwYzudEtKoAODQ@mail.gmail.com>

--------------P5yEvzsb2Ulkr4rnhLHi0MZ3
Content-Type: multipart/mixed; boundary="------------rzKA8XW7OfgekGVko7ap7fxu"

--------------rzKA8XW7OfgekGVko7ap7fxu
Content-Type: multipart/alternative;
 boundary="------------mRpZGok0k4SHrTEUHdWM2GR8"

--------------mRpZGok0k4SHrTEUHdWM2GR8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

QW0gMjkuMTAuMjIgdW0gMjE6NDYgc2NocmllYiBQYW9sbyBCb256aW5pOg0KDQo+IElsIHNh
YiAyOSBvdHQgMjAyMiwgMTE6MzggU3RlZmFuIFdlaWwgPHN3QHdlaWxuZXR6LmRlPiBoYSBz
Y3JpdHRvOg0KPg0KPiAgICAgQW0gMTUuMDkuMjIgdW0gMTA6NDEgc2NocmllYiBSaWNoYXJk
IEhlbmRlcnNvbjoNCj4gICAgID4gT24gOS8xNC8yMiAxNjo1OSwgQWxleCBCZW5uw6llIHdy
b3RlOg0KPiAgICAgPj4gV2Ugd2FudCB0byBtaWdyYXRlIGZyb20gZG9ja2VyLnB5IHRvIGJ1
aWxkaW5nIG91ciBpbWFnZXMNCj4gICAgIGRpcmVjdGx5IHdpdGgNCj4gICAgID4+IGRvY2tl
ci9wb2RtYW4uIEJlZm9yZSB3ZSBnZXQgdGhlcmUgd2UgbmVlZCB0byBtYWtlIHN1cmUgd2Ug
ZG9uJ3QNCj4gICAgID4+IHJlLWludHJvZHVjZSBvdXIgbGF5ZXJlZCBidWlsZHMgc28gYnVn
IG91dCBpZiB3ZSBzZWUgRlJPTSBxZW11Lw0KPiAgICAgaW4gYQ0KPiAgICAgPj4gRG9ja2Vy
ZmlsZS4NCj4gICAgID4+DQo+ICAgICA+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWU8
YWxleC5iZW5uZWVAbGluYXJvLm9yZz4NCj4gICAgID4+IEFja2VkLWJ5OiBUaG9tYXMgSHV0
aDx0aHV0aEByZWRoYXQuY29tPg0KPiAgICAgPj4gTWVzc2FnZS1JZDo8MjAyMjA4MjYxNzIx
MjguMzUzNzk4LTI0LWFsZXguYmVubmVlQGxpbmFyby5vcmc+DQo+ICAgICA+PiAtLS0NCj4g
ICAgID4+IMKgIHRlc3RzL2RvY2tlci9kb2NrZXIucHkgfCAzOA0KPiAgICAgKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gICAgID4+IMKgIDEgZmlsZSBjaGFu
Z2VkLCAxMCBpbnNlcnRpb25zKCspLCAyOCBkZWxldGlvbnMoLSkNCj4gICAgID4NCj4gICAg
ID4gUmV2aWV3ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBs
aW5hcm8ub3JnPg0KPiAgICAgPg0KPiAgICAgPiByfg0KPiAgICAgPg0KPg0KPiAgICAgSSBh
bSBub3Qgc3VyZSB3aGV0aGVyIHRoYXQgaXMgcmVsYXRlZCwgYnV0IHdpdGggbGF0ZXN0IFFF
TVUgY29kZSBJDQo+ICAgICBub3cNCj4gICAgIGdldCBhbiBlLW1haWwgIlNFQ1VSSVRZIGlu
Zm9ybWF0aW9uIFsuLi5dIiBlYWNoIHRpbWUgd2hlbiBJIHJ1biB0aGUNCj4gICAgIGNvbmZp
Z3VyZSBzY3JpcHQgKG9yIGp1c3QgYHRlc3RzL2RvY2tlci9kb2NrZXIucHkgcHJvYmVgKToN
Cj4NCj4gICAgIHFlbXUud2VpbG5ldHouZGUgPGh0dHA6Ly9xZW11LndlaWxuZXR6LmRlPiA6
IE9jdCAyOSAwOTozMjozMiA6DQo+ICAgICBzdGVmYW4gOiBhIHBhc3N3b3JkIGlzIHJlcXVp
cmVkIDsNCj4gICAgIFRUWT1wdHMvMCA7IFBXRD0vaG9tZS9zdGVmYW4vcWVtdS9iaW4vbmRl
YnVnL2k2ODYtdzY0LW1pbmd3MzIgOw0KPiAgICAgVVNFUj1yb290IDsgQ09NTUFORD1kb2Nr
ZXIgdmVyc2lvbg0KPg0KPiAgICAgVGhlcmUgaXMgbm8gZG9ja2VyIGluc3RhbGxhdGlvbiBv
biBteSBEZWJpYW4gR05VIExpbnV4IGJ1aWxkIG1hY2hpbmUuDQo+DQo+DQo+IEl0J3Mgbm90
IHJlbGF0ZWQsIGNvbmZpZ3VyZSBpcyBjaGVja2luZyB3aGV0aGVyICJzdWRvIGRvY2tlciIg
d29ya3MuDQoNCg0KWW91IGFyZSByaWdodC4gImdpdCBiaXNlY3QiIGZpbmRzIHRoYXQgdGhl
IHNlY3VyaXR5IGUtbWFpbHMgb2NjdXIgc2luY2UgDQphbm90aGVyIGNvbW1pdC4NCg0KU3Rl
ZmFuDQoNCg0KYzQ1NzViNTkxNTVlMmUwMDY1YzI5ZDU2NDk2ZGJmM2U2ZmZkMDM1YiBpcyB0
aGUgZmlyc3QgYmFkIGNvbW1pdA0KY29tbWl0IGM0NTc1YjU5MTU1ZTJlMDA2NWMyOWQ1NjQ5
NmRiZjNlNmZmZDAzNWINCkF1dGhvcjogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0
LmNvbT4NCkRhdGU6wqDCoCBUaHUgU2VwIDI5IDEyOjQxOjU4IDIwMjIgKzAxMDANCg0KIMKg
wqDCoCBjb25maWd1cmU6IHN0b3JlIGNvbnRhaW5lciBlbmdpbmUgaW4gY29uZmlnLWhvc3Qu
bWFrDQoNCiDCoMKgwqAgSW4gcHJlcGFyYXRpb24gZm9yIHJlbW92aW5nICQoRE9DS0VSX1ND
UklQVCkgZnJvbSB0aGUgdGVzdHMvdGNnIA0KY29uZmlndXJhdGlvbg0KIMKgwqDCoCBmaWxl
cywgaGF2ZSBNYWtlIHVzZSB0aGUgc2FtZSBjb250YWluZXIgZW5naW5lIHRoYXQgaGFkIGJl
ZW4gcHJvYmVkIGF0DQogwqDCoMKgIGNvbmZpZ3VyZSB0aW1lLg0KDQogwqDCoMKgIFNpZ25l
ZC1vZmYtYnk6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+DQogwqDCoMKg
IFNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4N
CiDCoMKgwqAgTWVzc2FnZS1JZDogPDIwMjIwOTI5MTE0MjMxLjU4MzgwMS0xOS1hbGV4LmJl
bm5lZUBsaW5hcm8ub3JnPg0KDQogwqBjb25maWd1cmXCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHwgMTEgKysrKysrKystLS0NCiDCoHRlc3RzL2RvY2tlci9N
YWtlZmlsZS5pbmNsdWRlIHzCoCAyICstDQogwqAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCg0K
--------------mRpZGok0k4SHrTEUHdWM2GR8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Am 29.10.22 um 21:46 schrieb Paolo Bonzini:<br>
    </p>
    <blockquote type=3D"cite"
cite=3D"mid:CABgObfazc5opNOdO=3DYyj_z8nYy4tYOetKs9GkwYzudEtKoAODQ@mail.gm=
ail.com">
      <div dir=3D"auto">
        <div>Il sab 29 ott 2022, 11:38 Stefan Weil &lt;<a
            href=3D"mailto:sw@weilnetz.de" moz-do-not-send=3D"true"
            class=3D"moz-txt-link-freetext">sw@weilnetz.de</a>&gt; ha
          scritto:<br>
          <div class=3D"gmail_quote">
            <blockquote class=3D"gmail_quote">Am 15.09.22 um 10:41 schrie=
b
              Richard Henderson:<br>
              &gt; On 9/14/22 16:59, Alex Benn=C3=A9e wrote:<br>
              &gt;&gt; We want to migrate from docker.py to building our
              images directly with<br>
              &gt;&gt; docker/podman. Before we get there we need to
              make sure we don't<br>
              &gt;&gt; re-introduce our layered builds so bug out if we
              see FROM qemu/ in a<br>
              &gt;&gt; Dockerfile.<br>
              &gt;&gt;<br>
              &gt;&gt; Signed-off-by: Alex Benn=C3=A9e&lt;<a
                href=3D"mailto:alex.bennee@linaro.org" target=3D"_blank"
                rel=3D"noreferrer" moz-do-not-send=3D"true"
                class=3D"moz-txt-link-freetext">alex.bennee@linaro.org</a=
>&gt;<br>
              &gt;&gt; Acked-by: Thomas Huth&lt;<a
                href=3D"mailto:thuth@redhat.com" target=3D"_blank"
                rel=3D"noreferrer" moz-do-not-send=3D"true"
                class=3D"moz-txt-link-freetext">thuth@redhat.com</a>&gt;<=
br>
              &gt;&gt; Message-Id:&lt;<a
                href=3D"mailto:20220826172128.353798-24-alex.bennee@linar=
o.org"
                target=3D"_blank" rel=3D"noreferrer" moz-do-not-send=3D"t=
rue"
                class=3D"moz-txt-link-freetext">20220826172128.353798-24-=
alex.bennee@linaro.org</a>&gt;<br>
              &gt;&gt; ---<br>
              &gt;&gt; =C2=A0 tests/docker/docker.py | 38
              ++++++++++----------------------------<br>
              &gt;&gt; =C2=A0 1 file changed, 10 insertions(+), 28
              deletions(-)<br>
              &gt; <br>
              &gt; Reviewed-by: Richard Henderson &lt;<a
                href=3D"mailto:richard.henderson@linaro.org"
                target=3D"_blank" rel=3D"noreferrer" moz-do-not-send=3D"t=
rue"
                class=3D"moz-txt-link-freetext">richard.henderson@linaro.=
org</a>&gt;<br>
              &gt; <br>
              &gt; r~<br>
              &gt; <br>
              <br>
              I am not sure whether that is related, but with latest
              QEMU code I now <br>
              get an e-mail "SECURITY information [...]" each time when
              I run the <br>
              configure script (or just `tests/docker/docker.py probe`):<=
br>
              <br>
              <a href=3D"http://qemu.weilnetz.de" rel=3D"noreferrer
                noreferrer" target=3D"_blank" moz-do-not-send=3D"true">qe=
mu.weilnetz.de</a>
              : Oct 29 09:32:32 : stefan : a password is required ; <br>
              TTY=3Dpts/0 ;
              PWD=3D/home/stefan/qemu/bin/ndebug/i686-w64-mingw32 ; <br>
              USER=3Droot ; COMMAND=3Ddocker version<br>
              <br>
              There is no docker installation on my Debian GNU Linux
              build machine.<br>
            </blockquote>
          </div>
        </div>
        <div dir=3D"auto"><br>
        </div>
        <div dir=3D"auto">It's not related, configure is checking whether=

          "sudo docker" works.</div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>You are right. "git bisect" finds that the security e-mails occur
      since another commit.</p>
    <p>Stefan</p>
    <p><br>
    </p>
    <p>c4575b59155e2e0065c29d56496dbf3e6ffd035b is the first bad commit<b=
r>
      commit c4575b59155e2e0065c29d56496dbf3e6ffd035b<br>
      Author: Paolo Bonzini <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:pbonzini@redhat.com">&lt;pbonzini@redhat.com&gt;</a><br>
      Date:=C2=A0=C2=A0 Thu Sep 29 12:41:58 2022 +0100<br>
      <br>
      =C2=A0=C2=A0=C2=A0 configure: store container engine in config-host=
=2Emak<br>
      =C2=A0=C2=A0 =C2=A0<br>
      =C2=A0=C2=A0=C2=A0 In preparation for removing $(DOCKER_SCRIPT) fro=
m the
      tests/tcg configuration<br>
      =C2=A0=C2=A0=C2=A0 files, have Make use the same container engine t=
hat had been
      probed at<br>
      =C2=A0=C2=A0=C2=A0 configure time.<br>
      =C2=A0=C2=A0 =C2=A0<br>
      =C2=A0=C2=A0=C2=A0 Signed-off-by: Paolo Bonzini <a class=3D"moz-txt=
-link-rfc2396E" href=3D"mailto:pbonzini@redhat.com">&lt;pbonzini@redhat.c=
om&gt;</a><br>
      =C2=A0=C2=A0=C2=A0 Signed-off-by: Alex Benn=C3=A9e <a class=3D"moz-=
txt-link-rfc2396E" href=3D"mailto:alex.bennee@linaro.org">&lt;alex.bennee=
@linaro.org&gt;</a><br>
      =C2=A0=C2=A0=C2=A0 Message-Id:
      <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:20220929114231.58=
3801-19-alex.bennee@linaro.org">&lt;20220929114231.583801-19-alex.bennee@=
linaro.org&gt;</a><br>
      <br>
      =C2=A0configure=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 +=
+++++++---<br>
      =C2=A0tests/docker/Makefile.include |=C2=A0 2 +-<br>
      =C2=A02 files changed, 9 insertions(+), 4 deletions(-)<br>
      <br>
    </p>
  </body>
</html>

--------------mRpZGok0k4SHrTEUHdWM2GR8--

--------------rzKA8XW7OfgekGVko7ap7fxu
Content-Type: application/pgp-keys; name="OpenPGP_0xE08C21D5677450AD.asc"
Content-Disposition: attachment; filename="OpenPGP_0xE08C21D5677450AD.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
T7uiC0aTwAsniiln1XFlGBISNLB1HL/gUc9FJj8qmYgvUBZIzUjmm56up6er8ca9
2tARdBylQF3E9MJ/E4dVrmTyvOlddAb/MG1Ge425mjt0dRfOx8Qc7Pxs+d3UNVSu
Bm+WtuSgk+JNIT08c+WSXec8mE4hVdrKbAvCo9dcT5Gal2r6FSvRVY5kba3t280x
utLSp470k3+DO+AgVigbHr3scXlJXZe1m4luqBSkEBDNH2sAQoBrNVwVaCZqZRTN
TFN0ZWZhbiBXZWlsIChVbml2ZXJzaXTDpHRzYmlibGlvdGhlayBNYW5uaGVpbSkg
PHN0ZWZhbi53ZWlsQHVuaS1tYW5uaGVpbS5kZT7CwY4EEwEIADgWIQRJI2/qdcld
aY7Ct4rgjCHVZ3RQrQUCYlMdZAIbAwULCQgHAwUVCgkICwUWAgMBAAIeBQIXgAAK
CRDgjCHVZ3RQrRo6D/9MSqnSGOjWrcsiXbUsQmNKzI1JZOuabam3P9V/rILU7K4/
b9E6Bk5Vjo/6A4xMtC9y6L244Upn4MTdUofkBdd9dMG8eZ2oofsMGIeEmr4EFfKb
/LoZtIUJaNfiwvd3YakEmaAfd+AWIEAVYlVSxWHeCMowTNYxbSW+/M0ExGw1BErt
oFiz3Ti8iYNfgz2l9cwrKhQEnzZlHUq06AIbzch/nXFFcc3EBDz+J6x//DCclb6Y
8oLJRerrOJqpcpTYrwr+UDbh8JOqiUWUQ1BrbIZb+J5rU+DghBmNAWpd6yTbxX0T
I7g2Hu7gPdzhrLLRO+rQsDK3T+JdVQ9xyoWugFIw4YepAad5uo/2e+q38a+h57EK
Vsy4xfAEV/Mr4hl9KCY2hkiQYMKHvN1EZp72crAiPgDZxh6wTJZ979RHY2apq8XM
Y41uP5mwdHxFA1Al/5+syajNlTzsNdYB5Ucx5TwNU0TifM13exHw8lQZOaWbDZS4
QYwzeFWuEFse9ESmCQX5Pggw+ABFXOtPeqEfIO8v3QbT1vFlJ57iFBUiem967/JV
a0RQyEvAKj0T5124N8Hi1oa8TPk5oSe8id5jSgGD9twbS0HX2KcmwAF/A5MgP7hx
0X4EfhsJtDxFDy5PnoC8ADE2wcKDsTgqfDS/EQc6OeQCKceR45wyOT0Y3kbEa87B
TQRV3J49ARAAt9nArtjFnqmRHL0oY5KCrF5ONph6xm3rof74lZ/CTkG0zu9OhmbW
s6MMNsHgM7lRGIcKou7vUQE8/TEXh3+0eRdCiEYXP9jYTTXosU/+y/hOY33x9Sw/
tCEHXiz6M+rp74O1P+zqXSlmx8zzNy33dDdXUT+bF1C6Y7WEChIIjlOfLHOBeazN
dCqDxRDM/CKeI/UWx/wm0z1DNEuD8crUXIgdxY3dBAm1bBK041+3GXP8gYLN4qew
T1VoG35Ya3PrrTC/zMAumagjiF3/1NCAmH6eSOzw21EloDBR76K1noDGCfRM2dp0
78rS/BO+QtlN4+UWQLkB+crHxqXWk0u+gka2A7ZBHFYky/oUVIK1/ar6swnTRHj2
0Ga+rukzcdxQRJ2kwGeRrqLH1JO8p72ptvswMyzVPhk8sE2S9llPrbznj6fc9f5m
y5x9i5Fh4Mt2z7u+wBSdck2wV5eThEPz7UziXgtbq74Hja7tuoQxUhcpOIBXKl8b
MLtjxlO7VmH312VzfiBYqQku9fHg3E/Hi+uon2fJaifFbuViZqfZq9bKT/UWG0+0
cKc2d4os+3uwGcjraUjCFSXmGU27YqiW8jeM7pIa03QoAhWIH9ApAOVBqWF6drFz
6/oFcSl9qbY/4IneJ/eb0eyjHllegydGEuIShrXYZLiQqSX4yj/3vE8AEQEAAcLB
XwQYAQgACQUCVdyePQIbDAAKCRDgjCHVZ3RQrWEaEACTrt0WUxL1AT6BarJ3fOPV
ZjiioO+3LPhw98ci7afeScEK84cGv+KLgxawvOo7dbwEX6VceQvJ0LTZ1oYPuYeZ
MjiG7Qdf9uwgk3VwHf4S9pNxsqyVxHPotN9RPWwqoH9ihmO/ml7uC3gH0SFiU/RR
lc3c9X/u+6SbkSEUZrUrPFQKJ3dpfjnA3RCPTI3fTKr8jycA5A5A77Daba3L+MXj
c71/tn6MZCZmK7unSfpXq4rbGrIgMWnFKMBgeRONUWRFIOm5lReEjLHiABCli8t4
Txr2ATswA4atmC4JzP8J/WPWe2xDMvsOXu+bGgW5BSO053MQz1JyJf1ExClNTkYu
Vlm712JFE7Xzc2cg9P796KI3CKGbytTpaTrVx3ZajqHY1xfZy3vHolR8pfGZ8xcY
XhFtkD71/BSyqpkrPVvbGkLZOm4b/SzWCGCDYx9xBB//m25lfpZ+Du2u91pvC97Z
6Qty5nRp9kZvAeidmSunItU0Q4jKQlFnn6ZyLhPk4mwuVSUec8dGIdda8cQRaG/J
lpLUZi2cnhKAnGaAaLGycQ/NEMVjtN8z6ZHCe3eAa1bEPwSZAbRHuCZ+Iqh6gPzn
K88LhGUr/vzHYKKn25QWYQ7rJi2H1cu8BQ3lQpRunkCIithJ5gwoS0ZFSEM25FdI
hvjSVVSRyxiu/zrDuO/s6g=3D=3D
=3DumGL
-----END PGP PUBLIC KEY BLOCK-----

--------------rzKA8XW7OfgekGVko7ap7fxu--

--------------P5yEvzsb2Ulkr4rnhLHi0MZ3--

--------------5CUapMtHpI0gtSTUBe6DTHHj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEESSNv6nXJXWmOwreK4Iwh1Wd0UK0FAmNdl4sFAwAAAAAACgkQ4Iwh1Wd0UK3o
ig//f9RnxldaxVa0VMdDnPYBUIauFLzpnJuBBs2ZSo2HHnutzAep/epV6bDkDRoZbSXQ2yVsHOko
IdjDXEQvpyMJ7jAuqlvC3u8YQTyoLUfi6uUqDm+hpn4yXTn/I3lsgZLgV/rfLuTM4L3eMKRqnZ/9
MrOOvsZkisPvu1O5ljL7T2Q5VRHT/u46vAigmkr4lZVLUZRJDsTb1crO9kA2lhwtdC+iIHRXXe47
FogTYeU6Xr4XGrLzA9QO/v8atwfaUIZkzhdjTIEN1zrHoLL0JBi1b3ReN3DHQZnAoLnKZxY+bqX/
ojYcRxEdTfKC3YqD1lRlHm2JYS5f3jcnlh5HgMn5HxI3sc/SF28jy3CP4hl4tdRn2zfGVIpw1XJO
9jL9StrZ4aKWbn2wtVhVA2a2jcDzfgo1DdGnu3yCLtcULsjTJwSysqu/avfJIeL6Zda7AFGe8Mqr
L8erTjSpSi9UKeCFhLrZsHQCsrnrE+7RJ4ozZ4knroB8e5lZceBfl2Y7TWlVSTjdX3N9F0uqZ2iA
cdovEvAtpblkQWaLzx8iaP5R3D0ya6OgZp6/ynQz/YmYFNES3MABUK3eXPueiU+ARlMfpMj3A4VD
DzzLx74ic0KaWvl1he9uyKWRWvIsx4vfz1Fn44k0mlc5wfpagB/dSTc9Iq4Thv6dQTvPfAcPbq5A
hPE=
=LYnG
-----END PGP SIGNATURE-----

--------------5CUapMtHpI0gtSTUBe6DTHHj--

