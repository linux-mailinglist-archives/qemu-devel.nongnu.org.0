Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9BB612476
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 18:41:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooorx-0007KK-TG; Sat, 29 Oct 2022 12:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1ooorw-0007Jz-0I
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 12:39:36 -0400
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1ooort-0004VM-GP
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 12:39:35 -0400
Received: from [192.168.178.59] (p5b151d14.dip0.t-ipconnect.de [91.21.29.20])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 7880EDA0C54;
 Sat, 29 Oct 2022 18:39:30 +0200 (CEST)
Message-ID: <ae19df77-a7b2-5ad6-710b-bc3c2d226978@weilnetz.de>
Date: Sat, 29 Oct 2022 18:39:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <20220908132817.1831008-8-bmeng.cn@gmail.com>
Subject: Re: [PATCH 7/7] .gitlab-ci.d/windows.yml: Test 'make installer' in
 the CI
In-Reply-To: <20220908132817.1831008-8-bmeng.cn@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rmr4rHremJ0o9Fh0krFXZYZu"
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
--------------rmr4rHremJ0o9Fh0krFXZYZu
Content-Type: multipart/mixed; boundary="------------aBWyoB35QZ0R3lmGxGGWmjXt";
 protected-headers="v1"
From: Stefan Weil <sw@weilnetz.de>
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <ae19df77-a7b2-5ad6-710b-bc3c2d226978@weilnetz.de>
Subject: Re: [PATCH 7/7] .gitlab-ci.d/windows.yml: Test 'make installer' in
 the CI
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <20220908132817.1831008-8-bmeng.cn@gmail.com>
In-Reply-To: <20220908132817.1831008-8-bmeng.cn@gmail.com>

--------------aBWyoB35QZ0R3lmGxGGWmjXt
Content-Type: multipart/mixed; boundary="------------4kjZA2GF9opmnyS06X3IM0Jd"

--------------4kjZA2GF9opmnyS06X3IM0Jd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

QW0gMDguMDkuMjIgdW0gMTU6Mjggc2NocmllYiBCaW4gTWVuZzoNCj4gRnJvbTogQmluIE1l
bmcgPGJpbi5tZW5nQHdpbmRyaXZlci5jb20+DQo+IA0KPiBOb3cgdGhhdCB3ZSBoYXZlIHN1
cHBvcnRlZCBwYWNrYWdpbmcgRExMcyBhdXRvbWF0aWNhbGx5LCBsZXQncyBhZGQNCj4gdGhl
ICdtYWtlIGluc3RhbGxlcicgaW4gdGhlIENJIGFuZCBwdWJsaXNoIHRoZSBnZW5lcmF0ZWQg
aW5zdGFsbGVyDQo+IGZpbGUgYXMgYW4gYXJ0aWZhY3QuDQo+IA0KPiBJbmNyZWFzZSB0aGUg
am9iIHRpbWVvdXQgdG8gOTAgbWludXRlcyB0byBhY2NvbW1vZGF0ZSB0byBpdC4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEJpbiBNZW5nIDxiaW4ubWVuZ0B3aW5kcml2ZXIuY29tPg0KPiAt
LS0NCj4gDQo+ICAgLmdpdGxhYi1jaS5kL3dpbmRvd3MueW1sIHwgMjcgKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyks
IDggZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvLmdpdGxhYi1jaS5kL3dpbmRv
d3MueW1sIGIvLmdpdGxhYi1jaS5kL3dpbmRvd3MueW1sDQo+IGluZGV4IGZmZmIyMDI2NTgu
LjNhOTRkNDBlNzMgMTAwNjQ0DQo+IC0tLSBhLy5naXRsYWItY2kuZC93aW5kb3dzLnltbA0K
PiArKysgYi8uZ2l0bGFiLWNpLmQvd2luZG93cy55bWwNCj4gQEAgLTEwLDcgKzEwLDcgQEAN
Cj4gICAgICAgICAtICR7Q0lfUFJPSkVDVF9ESVJ9L21zeXM2NC92YXIvY2FjaGUNCj4gICAg
IG5lZWRzOiBbXQ0KPiAgICAgc3RhZ2U6IGJ1aWxkDQo+IC0gIHRpbWVvdXQ6IDcwbQ0KPiAr
ICB0aW1lb3V0OiA5MG0NCj4gICAgIGJlZm9yZV9zY3JpcHQ6DQo+ICAgICAtIElmICggIShU
ZXN0LVBhdGggLVBhdGggbXN5czY0XHZhclxjYWNoZSApICkgew0KPiAgICAgICAgIG1rZGly
IG1zeXM2NFx2YXJcY2FjaGUNCj4gQEAgLTI4LDYgKzI4LDExIEBADQo+ICAgICAtIC5cbXN5
czY0XHVzclxiaW5cYmFzaCAtbGMgJ3BhY21hbiAtLW5vY29uZmlybSAtU3l1dScgICMgQ29y
ZSB1cGRhdGUNCj4gICAgIC0gLlxtc3lzNjRcdXNyXGJpblxiYXNoIC1sYyAncGFjbWFuIC0t
bm9jb25maXJtIC1TeXV1JyAgIyBOb3JtYWwgdXBkYXRlDQo+ICAgICAtIHRhc2traWxsIC9G
IC9GSSAiTU9EVUxFUyBlcSBtc3lzLTIuMC5kbGwiDQo+ICsgIGFydGlmYWN0czoNCj4gKyAg
ICBuYW1lOiAiJENJX0pPQl9OQU1FLSRDSV9DT01NSVRfUkVGX1NMVUciDQo+ICsgICAgZXhw
aXJlX2luOiA3IGRheXMNCj4gKyAgICBwYXRoczoNCj4gKyAgICAgIC0gYnVpbGQvcWVtdS1z
ZXR1cCouZXhlDQo+ICAgDQo+ICAgbXN5czItNjRiaXQ6DQo+ICAgICBleHRlbmRzOiAuc2hh
cmVkX21zeXMyX2J1aWxkZXINCj4gQEAgLTUxLDYgKzU2LDcgQEAgbXN5czItNjRiaXQ6DQo+
ICAgICAgICAgbWluZ3ctdzY0LXg4Nl82NC1sem8yDQo+ICAgICAgICAgbWluZ3ctdzY0LXg4
Nl82NC1uZXR0bGUNCj4gICAgICAgICBtaW5ndy13NjQteDg2XzY0LW5pbmphDQo+ICsgICAg
ICBtaW5ndy13NjQteDg2XzY0LW5zaXMNCj4gICAgICAgICBtaW5ndy13NjQteDg2XzY0LXBp
eG1hbg0KPiAgICAgICAgIG1pbmd3LXc2NC14ODZfNjQtcGtnY29uZg0KPiAgICAgICAgIG1p
bmd3LXc2NC14ODZfNjQtcHl0aG9uDQo+IEBAIC02MCwxMiArNjYsMTUgQEAgbXN5czItNjRi
aXQ6DQo+ICAgICAgICAgbWluZ3ctdzY0LXg4Nl82NC11c2JyZWRpcg0KPiAgICAgICAgIG1p
bmd3LXc2NC14ODZfNjQtenN0ZCAiDQo+ICAgICAtICRlbnY6Q0hFUkVfSU5WT0tJTkcgPSAn
eWVzJyAgIyBQcmVzZXJ2ZSB0aGUgY3VycmVudCB3b3JraW5nIGRpcmVjdG9yeQ0KPiAtICAt
ICRlbnY6TVNZU1RFTSA9ICdNSU5HVzY0JyAgICAgIyBTdGFydCBhIDY0IGJpdCBNaW5ndyBl
bnZpcm9ubWVudA0KPiArICAtICRlbnY6TVNZU1RFTSA9ICdNSU5HVzY0JyAgICAgIyBTdGFy
dCBhIDY0LWJpdCBNaW5HVyBlbnZpcm9ubWVudA0KDQpJIHVzZSBNaW5ndy13NjQsIG5vdCBN
aW5HVy4gOi0pDQoNCmh0dHBzOi8vd3d3Lm1pbmd3LXc2NC5vcmcvIHVzZXMgaW5jb25zaXN0
ZW50IGNhc2UsIG1vc3RseSBNaW5ndy13NjQsIGJ1dCANCmFsc28gTWluR1ctdzY0LiBUaGUg
c2FtZSBjb25mdXNpb24gZXhpc3RzIGluIHRoZSBkZXNjcmlwdGlvbiBvZiB0aGUgDQpEZWJp
YW4gcGFja2FnZXMsIGJ1dCB0aGVyZSBNaW5HVy13NjQgaXMgbW9yZSBjb21tb24uDQoNClNv
IHRoZXJlIHNlZW1zIHRvIGJlIG5vIHJpZ2h0IG9yIHdyb25nLg0KDQo+ICAgICAtICRlbnY6
TVNZUyA9ICd3aW5zeW1saW5rczpuYXRpdmUnICMgRW5hYmxlIG5hdGl2ZSBXaW5kb3dzIHN5
bWxpbmsNCj4gLSAgLSAuXG1zeXM2NFx1c3JcYmluXGJhc2ggLWxjICcuL2NvbmZpZ3VyZSAt
LXRhcmdldC1saXN0PXg4Nl82NC1zb2Z0bW11DQo+ICsgIC0gbWtkaXIgYnVpbGQNCj4gKyAg
LSBjZCBidWlsZA0KPiArICAtIC4uXG1zeXM2NFx1c3JcYmluXGJhc2ggLWxjICcuLi9jb25m
aWd1cmUgLS10YXJnZXQtbGlzdD14ODZfNjQtc29mdG1tdQ0KPiAgICAgICAgIC0tZW5hYmxl
LWNhcHN0b25lIC0td2l0aG91dC1kZWZhdWx0LWRldmljZXMnDQo+IC0gIC0gLlxtc3lzNjRc
dXNyXGJpblxiYXNoIC1sYyAnbWFrZScNCj4gLSAgLSAuXG1zeXM2NFx1c3JcYmluXGJhc2gg
LWxjICdtYWtlIGNoZWNrJw0KPiArICAtIC4uXG1zeXM2NFx1c3JcYmluXGJhc2ggLWxjICdt
YWtlJw0KPiArICAtIC4uXG1zeXM2NFx1c3JcYmluXGJhc2ggLWxjICdtYWtlIGNoZWNrJw0K
PiArICAtIC4uXG1zeXM2NFx1c3JcYmluXGJhc2ggLWxjICdtYWtlIGluc3RhbGxlcicNCj4g
ICANCj4gICBtc3lzMi0zMmJpdDoNCj4gICAgIGV4dGVuZHM6IC5zaGFyZWRfbXN5czJfYnVp
bGRlcg0KPiBAQCAtODksNiArOTgsNyBAQCBtc3lzMi0zMmJpdDoNCj4gICAgICAgICBtaW5n
dy13NjQtaTY4Ni1sem8yDQo+ICAgICAgICAgbWluZ3ctdzY0LWk2ODYtbmV0dGxlDQo+ICAg
ICAgICAgbWluZ3ctdzY0LWk2ODYtbmluamENCj4gKyAgICAgIG1pbmd3LXc2NC1pNjg2LW5z
aXMNCj4gICAgICAgICBtaW5ndy13NjQtaTY4Ni1waXhtYW4NCj4gICAgICAgICBtaW5ndy13
NjQtaTY4Ni1wa2djb25mDQo+ICAgICAgICAgbWluZ3ctdzY0LWk2ODYtcHl0aG9uDQo+IEBA
IC05OCwxMCArMTA4LDExIEBAIG1zeXMyLTMyYml0Og0KPiAgICAgICAgIG1pbmd3LXc2NC1p
Njg2LXVzYnJlZGlyDQo+ICAgICAgICAgbWluZ3ctdzY0LWk2ODYtenN0ZCAiDQo+ICAgICAt
ICRlbnY6Q0hFUkVfSU5WT0tJTkcgPSAneWVzJyAgIyBQcmVzZXJ2ZSB0aGUgY3VycmVudCB3
b3JraW5nIGRpcmVjdG9yeQ0KPiAtICAtICRlbnY6TVNZU1RFTSA9ICdNSU5HVzMyJyAgICAg
IyBTdGFydCBhIDMyLWJpdCBNaW5HIGVudmlyb25tZW50DQo+ICsgIC0gJGVudjpNU1lTVEVN
ID0gJ01JTkdXMzInICAgICAjIFN0YXJ0IGEgMzItYml0IE1pbkdXIGVudmlyb25tZW50DQo+
ICAgICAtICRlbnY6TVNZUyA9ICd3aW5zeW1saW5rczpuYXRpdmUnICMgRW5hYmxlIG5hdGl2
ZSBXaW5kb3dzIHN5bWxpbmsNCj4gLSAgLSBta2RpciBvdXRwdXQNCj4gLSAgLSBjZCBvdXRw
dXQNCj4gKyAgLSBta2RpciBidWlsZA0KPiArICAtIGNkIGJ1aWxkDQo+ICAgICAtIC4uXG1z
eXM2NFx1c3JcYmluXGJhc2ggLWxjICIuLi9jb25maWd1cmUgLS10YXJnZXQtbGlzdD1wcGM2
NC1zb2Z0bW11Ig0KPiAgICAgLSAuLlxtc3lzNjRcdXNyXGJpblxiYXNoIC1sYyAnbWFrZScN
Cj4gICAgIC0gLi5cbXN5czY0XHVzclxiaW5cYmFzaCAtbGMgJ21ha2UgY2hlY2snDQo+ICsg
IC0gLi5cbXN5czY0XHVzclxiaW5cYmFzaCAtbGMgJ21ha2UgaW5zdGFsbGVyJw0KDQpNYXli
ZSBpdCBpcyBzdWZmaWNpZW50IHRvIGJ1aWxkIG9ubHkgYSA2NCBiaXQgaW5zdGFsbGVyLiBJ
cyB0aGVyZSBzdGlsbCANCm5lZWQgZm9yIFFFTVUgb24gMzIgYml0IFdpbmRvd3M/IEZvciBD
SSwgbW9zdCBwYXJ0cyBvZiB0aGUgTlNJUyBwcm9jZXNzIA0KKHdoaWNoIHJlcXVpcmVzIGEg
bG90IG9mIHJlc291cmNlcykgYXJlIGNvdmVyZWQgYnkgZWl0aGVyIDMyIG9yIDY0IGJpdCAN
CmJ1aWxkcywgc28gcnVubmluZyBib3RoIG1pZ2h0IGJlIHVubmVjZXNzYXJ5Lg0KDQpSZWdh
cmRzDQpTdGVmYW4NCg==
--------------4kjZA2GF9opmnyS06X3IM0Jd
Content-Type: application/pgp-keys; name="OpenPGP_0xE08C21D5677450AD.asc"
Content-Disposition: attachment; filename="OpenPGP_0xE08C21D5677450AD.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBFXCNBcBEACUbHx9FWsS1ATrhLGAS+Nc6bFQHPR3CpUQ4v++RiMg25bF6Ov1
RsYEcovI0DXGh6Ma+l6dRlvUXV8tMvNwqghDUr5KY7LN6tgcFKjBbXdv9VlKiWiM
LKBrARcFKxx1sfLp1P8RiaUdKsgy2Hq4T1PPy9ENTL1/FBG6P/Rw0rO9zOB+yNHc
RJ5diDnERbi3x7qoaPUra2IglmQk/uxXKC0aNIhpNLNiQ+YpwTUN9q3eG6B9/3CG
8RGtFzH9vDPlLvtUX+01a2gCifTi3iH38EEK8ACXIRs2dszlxMneKTvflXfvyCM1
O+59wGcICQxltxLLhHSCJjOQyWdR2JUtn//XjVWMmf6bBT7Imx3DhhfFRlA+/Lw9
Zah66DJrZgiV0LqoN/2f031TzD3FCBiGQEMC072MvSQ1DdJNOiRE1iWO0teLOxaF
SbvJS9ij8CFSQQTnSVZs0YXGBal+1kMeaKo9sO4tkaAR2190IlMNanigCTJfeFqx
zZkoki378grSHdGUTGKfwNPflTOA6Pw6xuUcxW55LB3lBsPqb0289P8o9dTR7582
e6XTkpzqe/z/fYmfI9YXIjGY8WBMRbsuQA30JLq1/n/zwxAOr2P9y4nqTMMgFOtQ
S8w4G46KUMY/5IspZp2VnPwvazUo2zpYiUSLo1hFHx2jrePYNu2KLROXpwARAQAB
zRxTdGVmYW4gV2VpbCA8c3dAd2VpbG5ldHouZGU+wsF6BBMBCAAkAhsDBQsJCAcD
BRUKCQgLBRYCAwEAAh4BAheABQJV04LlAhkBAAoJEOCMIdVndFCtP5QP/1U8yWZz
HeHufRFxtMsK1PERiLuKyGRH2oE5NWVc5QQHZZ2ypXu53o2ZbZxmdy8+4lXiPWWw
YVqto3V7bPaMTvQhIT0I3c3ZEZsvwyEEE6QdRs52haZwX+TzNMQ5mOePdM2m4WqO
0oU7YHU2WFf54MBmAGtj3FAQEAlZAaMiJs2aApw/4t35ICL1Sb0FY8d8lKBbIFOA
aFfrlQTC3y8eMTk1QxOVtdXpRrOl6OE0alWn97NRqeZlBm0P+BEvdgTPQt+9rxbe
4ulgKME2LkbDhLqf0m2+xMXb7T4LiHbQYnnWKGZyogpFaw3PuRVd9m8uxx1F8b4U
jNzI9x2Ez5LDv8NHpSY0LGwvVmkgELYbcbyiftbuw81gJuM7k4IW5GR85kTH6y/S
q6JNaI4p909IK8X4eeoCkAqEVmDOo1D5DytgxIV/PErrin82OIDXLENzOWfPPtUT
O+H7qUe80NS2HLPGIveYSjuYKBB6n2JhPkUD7xxMEdh5Ukqi1WIBSV4Tuk3/ubHa
jP5bqg4QP3Wo1AyICX09A1QQDajtMkyxXhYxr826EGcRD2WUUprGNYwaks4YiPuv
OAJxSYprKWT6UDHzE3S8u4uZZm9H8cygFa3pysJwTmbmrBAP1lMolwXHky60dPnK
PmFyArGC0utAH7QELXzBybnE/vSNttNT1D+HwsF3BBMBCAAhBQJVwjQXAhsDBQsJ
CAcDBRUKCQgLBRYCAwEAAh4BAheAAAoJEOCMIdVndFCt15YP/19PBtZWQYTd8xlz
NqN/KsSEhiBScWWPGhE5HLDQmnq6+qYBIy9bDM83394ZPxvNb5cJs7LfgfrRJKj3
86OB8bAN9rB9dbGxMlirBpJVIBJj/2OkfgDk+19jNLrUaGC9qWVJeLf7Z/lDXYmP
0GmzzIZNzvobk5XT1Fv91E4HKlBaMoS9FiubxNKSywziI++n2qN5m1deI18lS7iS
nUIaTSvKvvyU9jqGyghW6pe8aVmtjQ1jYGv1RmxOJ8LkLl96cy/aKhPwEJKKR4f3
4VzKvwePcNicVosy9PvdvCvsk/ogjszb9tN/HD0Dsy94kuYyE3QkihAF2Dv/Ny0d
L5/n+e25nKokscUHfgLVwBLLTp/+jzIL6aRDq0yeq7gnKmK4OZ6SQkdIrCELW8Gh
MBe/1EBGge30PcW1C8B5WvFGi8R1xaFwjm7rWwbPvIeSHdhiVigatl6J7DECPs2U
55RJQ0y1ISl0PWpHecyWqf2EwWx+P1qIG7EqBxsKGII6F0MYaSEMwRHcG8Yua1l+
mFgZnwKHOMj4vmDFUeykGHUNu1ckQGMdL46A82P+r/TXnlQP33b+D+3+3bvqH6Nw
/abhyyNtV/jx/EgUvlmFvVGNHV7xk/AkigwJsDw8Or6e57moh9Uiq9TKc2qY8qZe
HrAYq/3WQsX61JSf0rD1jcYuVM7SzSVTdGVmYW4gV2VpbCA8c3RlZmFuLndlaWxA
d2VpbG5ldHouZGU+wsF3BBMBCAAhBQJV04LBAhsDBQsJCAcDBRUKCQgLBRYCAwEA
Ah4BAheAAAoJEOCMIdVndFCt+vAP/jjQWTZlQUIHXW+I7j22l/LbAFaJM82PZo7R
mjTKzzKs5OUG/7XPhseG/Per8u6otUWCTEtd/pIyZq451y0zzHt+Mvvrfj99uymk
fLw5wqWB2JM/bBwdJZlsFIuRw2aYpwAGpeAqVZutSCm9r1GmpxDQ4vj0tFKZATZs
9hjcMKBqyZP26rtrfu81AOXm4Dn3yB6zvj+diVLwjq7ho2Oxlkq38kYC4ph6RaVv
uDWgzA8+e4BUSf9VHmXz5LXCXgTqwrNsuGiv+DnURfpGM6AkwQSQO/ixNfrMVfQa
iCoysAGB4gZtWAAdbkg+Kc3QcBtRyxoAhLWEYwu4b/OfLE0TQLn6aY06kcAr7CuC
6nWoe+WFTHEKG6XhYuS6em9+PaoQtNU+HRv8QeBs4aPZKL+NvNI/+NRw4B6pD5b4
3cjbiEAZGVwcJRErKKC57RuerCC1UotPWGn8vcL6LfKTAZ9Fh6QCciOtUxo9t9md
fU4Wi1zl/f8VztoqBBx8L8jWxkjRk3bZVM+HKXtm/z+TDGeWpJNUzyRiIHX/AMmH
E1BpBdTT/mpApGerwrOYDaTAvc3vtYk29Buewii5340rQrULbWCIlpQwICmwhBGQ
Ha6N47VMvg4OM4IWDi3H+pMhzczHsAuNmO0/UQ8nzIYHvmKyWiRNIy5x8L/Y6156
Qxcu3ggZzS1TdGVmYW4gV2VpbCA8c3RlZmFuLndlaWxAYmliLnVuaS1tYW5uaGVp
bS5kZT7CwXcEEwEIACEFAlXTgxcCGwMFCwkIBwMFFQoJCAsFFgIDAQACHgECF4AA
CgkQ4Iwh1Wd0UK2P+RAAiLaAmn0zc8xNTXdvrWSblejSm1bGYnqo21RllnI4apL7
W7n1rTagnQnG0r2zT3lJLt7rSBhd7GBHyjiJ80omW3nf5cWHUX112HGOvIJObajI
fApfX4b+y/vMV8ccrdzzhLWsofh8ecrf1IaR4TUX/u9k2i54nfQYi7f8nPAz/MOq
6rX7Icu7qSnIJ7Yw1NLOEd3QGbdhIm+xi2IHjS575raxEA3RIzGeHwfvg/79L9z/
Ty1GirA9EmrhA8WKbh99+vNACLhfGUUsviHGjkjedXpyK3VzRSrs60kplv1/gtej
MtNfPjQ31HVIaO2iYym48K/0o1aCRNhHacsjy/FxhldwCwp8ESHmp0wQ0PHEh6Tg
YkGgmqxVCOz9bytqCPkVYhDDRdgrpgL3FWcxqoVCfviRNBAhbO+gb/VKkd3sgaYP
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

--------------4kjZA2GF9opmnyS06X3IM0Jd--

--------------aBWyoB35QZ0R3lmGxGGWmjXt--

--------------rmr4rHremJ0o9Fh0krFXZYZu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEESSNv6nXJXWmOwreK4Iwh1Wd0UK0FAmNdV0EFAwAAAAAACgkQ4Iwh1Wd0UK2K
jxAAiYK/Oj5/I790SLbW7Jv//ov7OkaGkmCtT/1LHhopV33mhFYAIziM225SMMd+4ySpWykwB4a6
b1BxzB/tQCDmhGZcTN7o28JA7UjQc5UMULtAyKlwI59FH4xyp1nhAUL7vNACiLnja2rGsAxH/rhE
/6fL/8Vn3d1JlwmAEGKkU9dbqEFFJqwfRsmAqBtzeM1vEYcxHXlah+wZnah4QyuZRoTMIgrJYmuE
guzdw2q/yiJOEBoDSEcLc/Nr1hcflcbMVFssZbGQU4E1I/BLKv5X3EtbNTKuj0so5WLKfPq4pA73
0pixc2G5PP6+ms+NPbEsv2+AHXY4A1WSEEyfZKHERyYrAWyUmPMxLRrwAiBneDioNxefh1QRVNz6
jvNROuhYlzx4I0Q9GjEEmMbTLXUbvzryxQe1e8mnHPifIykc3b8fgjdnWC/AtiLJrRFvQwRvgM+Q
5It+3yAXV9ElVyglQyHj9bKCBVmZdDtLQcQ/ACgjxLievy/ukncMWfB7NoP6jW9xizSpL0/sn8Fa
UUJ/y1H+5VGOH+XW1V8F8VjFIM/XXVaWvObt58sMwjSlGhSGOCaiAeL0Vq+9QKsazAE91/Ihx4th
0CjUGJ8IgWUYRacWUCUF5uz5Bf84uWz2kiHWAsHQm5V3soRDH+sjvy8P7/8AYPfFy2bJVYXBh6Bw
FWg=
=+Hd6
-----END PGP SIGNATURE-----

--------------rmr4rHremJ0o9Fh0krFXZYZu--

