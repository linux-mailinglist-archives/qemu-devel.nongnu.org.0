Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F34DE61219F
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 10:52:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oohZX-0000kw-DK; Sat, 29 Oct 2022 04:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1oohZO-0000jh-18
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 04:52:04 -0400
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1oohZK-00075D-Ac
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 04:51:56 -0400
Received: from [192.168.178.59] (p5b151d14.dip0.t-ipconnect.de [91.21.29.20])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 3F187DA0C54;
 Sat, 29 Oct 2022 10:51:50 +0200 (CEST)
Message-ID: <f44abcf0-c7f4-b6d9-ff28-6403de0ded1a@weilnetz.de>
Date: Sat, 29 Oct 2022 10:51:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v10 0/4] cutils: Introduce bundle mechanism
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang
 <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
References: <20220627035744.23218-1-akihiko.odaki@gmail.com>
In-Reply-To: <20220627035744.23218-1-akihiko.odaki@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Fv7M2MK0MiO0JvJSMEyPsuCR"
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
--------------Fv7M2MK0MiO0JvJSMEyPsuCR
Content-Type: multipart/mixed; boundary="------------HKwkjKsSXwYr4WnNc58C539T";
 protected-headers="v1"
From: Stefan Weil <sw@weilnetz.de>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang
 <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Message-ID: <f44abcf0-c7f4-b6d9-ff28-6403de0ded1a@weilnetz.de>
Subject: Re: [PATCH v10 0/4] cutils: Introduce bundle mechanism
References: <20220627035744.23218-1-akihiko.odaki@gmail.com>
In-Reply-To: <20220627035744.23218-1-akihiko.odaki@gmail.com>

--------------HKwkjKsSXwYr4WnNc58C539T
Content-Type: multipart/mixed; boundary="------------JtjqFFPNaQVJ8YPdeb26sOyX"

--------------JtjqFFPNaQVJ8YPdeb26sOyX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

QW0gMjcuMDYuMjIgdW0gMDU6NTcgc2NocmllYiBBa2loaWtvIE9kYWtpOg0KDQo+IERldmVs
b3BlcnMgb2Z0ZW4gcnVuIFFFTVUgd2l0aG91dCBpbnN0YWxsaW5nLiBUaGUgYnVuZGxlIG1l
Y2hhbmlzbQ0KPiBhbGxvd3MgdG8gbG9vayB1cCBmaWxlcyB3aGljaCBzaG91bGQgYmUgcHJl
c2VudCBpbiBpbnN0YWxsYXRpb24gZXZlbiBpbg0KPiBzdWNoIGEgc2l0dWF0aW9uLg0KPg0K
PiBJdCBpcyBhIGdlbmVyYWwgbWVjaGFuaXNtIGFuZCBjYW4gZmluZCBhbnkgZmlsZXMgbG9j
YXRlZCByZWxhdGl2ZQ0KPiB0byB0aGUgaW5zdGFsbGF0aW9uIHRyZWUuIFRoZSBidWlsZCB0
cmVlIG11c3QgaGF2ZSBhIG5ldyBkaXJlY3RvcnksDQo+IHFlbXUtYnVuZGxlLCB0byByZXBy
ZXNlbnQgd2hhdCBmaWxlcyB0aGUgaW5zdGFsbGF0aW9uIHRyZWUgd291bGQNCj4gaGF2ZSBm
b3IgcmVmZXJlbmNlIGJ5IHRoZSBleGVjdXRhYmxlcy4NCj4NCj4gTm90ZSB0aGF0IHRoaXMg
YWJhbmRvbnMgY29tcGF0aWJpbGl0eSB3aXRoIFdpbmRvd3Mgb2xkZXIgdGhhbiA4IHRvIHVz
ZQ0KPiBQYXRoQ2NoU2tpcFJvb3QoKS4gVGhlIGV4dGVuZGVkIHN1cHBvcnQgZm9yIHRoZSBw
cmlvciB2ZXJzaW9uLCA3IGVuZGVkDQo+IG1vcmUgdGhhbiAyIHllYXJzIGFnbywgYW5kIGl0
IGlzIHVubGlrZWx5IHRoYXQgYW55b25lIHdvdWxkIGxpa2UgdG8gcnVuDQo+IHRoZSBsYXRl
c3QgUUVNVSBvbiBzdWNoIGFuIG9sZCBzeXN0ZW0uDQo+DQo+IHYxMDoNCj4gKiBVcGRhdGUg
ZGVzdGRpcl9qb2luKCkgaW4gc2NyaXB0cy9zeW1saW5rLWluc3RhbGwtdHJlZS5weSB3aXRo
IHRoZQ0KPiAgICBsYXRlc3QgaW1wbGVtZW50YXRpb24gZnJvbSBNZXNvbjoNCj4gICAgaHR0
cHM6Ly9naXRodWIuY29tL21lc29uYnVpbGQvbWVzb24vcHVsbC8xMDUzMQ0KPg0KPiB2OToN
Cj4gKiBVcGRhdGUgX1dJTjMyX1dJTk5UIGluIGluY2x1ZGUvcWVtdS9vc2RlcC5oIChUaG9t
YXMgSHV0aCkNCj4NCj4gdjg6DQo+ICogUGFzcyBhYnNvbHV0ZSBwYXRocyB0byBnZXRfcmVs
b2NhdGVkX3BhdGgoKSAoUGFvbG8gQm9uemluaSkNCj4gKiBVc2UgbWVzb24gaW50cm9zcGVj
dGlvbiAoUGFvbG8gQm9uemluaSkNCj4gKiBEcm9wICJxZ2E6IFJlbG9jYXRlIGEgcGF0aCBl
bWl0dGVkIGluIHRoZSBoZWxwIHRleHQiIGFzIGl0IGlzIG5vIGxvbmdlcg0KPiAgICByZWxl
dmFudCBmb3IgdGhlIGJ1bmRsZSBtZWNoYW5pc20uDQo+DQo+IHY3OiBQcm9wZXJseSBmaXgg
LS1maXJtd2FyZXBhdGggKERhbmllbCBQLiBCZXJyYW5nw6kpDQo+DQo+IHY2OiBSZXVzZSBn
ZXRfcmVsb2NhdGVkX3BhdGgoKSBpbiBmaW5kX2J1bmRsZSgpIChQYW9sbyBCb256aW5pKQ0K
Pg0KPiB2NToNCj4gKiBQcmVmZXIgcWVtdS1idW5kbGUgaWYgaXQgZXhpc3RzLiAoRGFuaWVs
IFAuIEJlcnJhbmfDqSkNCj4gKiBDaGVjayBpbnN0YWxsX2Jsb2JzIG9wdGlvbiBiZWZvcmUg
aW5zdGFsbGluZyBCSU9TZXMgKFBhb2xvIEJvbnppbmkpDQo+ICogQWRkIGNvbW1vbiBjb2Rl
IHRvIHNldCB1cCBxZW11LWJ1bmRsZSB0byB0aGUgdG9wIGxldmVsIG1lc29uLmJ1aWxkDQo+
ICAgIChQYW9sbyBCb256aW5pKQ0KPg0KPiB2NDoNCj4gKiBBZGQgRGFuaWVsIFAuIEJlcnJh
bmfDqSB0byBDQy4gSG9wZWZ1bGx5IHRoaXMgaGVscHMgbWVyZ2luZyBoaXMgcGF0Y2g6DQo+
ICAgIGh0dHBzOi8vbWFpbC5nbnUub3JnL2FyY2hpdmUvaHRtbC9xZW11LWRldmVsLzIwMjIt
MDYvbXNnMDIyNzYuaHRtbA0KPiAqIFJlYmFzZWQgdG8gdGhlIGxhdGVzdCBRRU1VLg0KPg0K
PiB2MzoNCj4gKiBOb3RlIHRoYXQgdGhlIGJ1bmRsZSBtZWNoYW5pc20gaXMgZm9yIGFueSBm
aWxlcyBsb2NhdGVkIHJlbGF0aXZlIHRvIHRoZQ0KPiAgICBpbnN0YWxsYXRpb24gdHJlZSBp
bmNsdWRpbmcgYnV0IG5vdCBsaW1pdGVkIHRvIGRhdGFkaXIuIChQZXRlciBNYXlkZWxsKQ0K
PiAqIEZpeCAiYnJpZGdlIiB0eXBvIChQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSkNCj4NCj4g
djI6IFJlYmFzZWQgdG8gdGhlIGxhdGVzdCBRRU1VLg0KPg0KPiBBa2loaWtvIE9kYWtpICgz
KToNCj4gICAgY3V0aWxzOiBJbnRyb2R1Y2UgYnVuZGxlIG1lY2hhbmlzbQ0KPiAgICBkYXRh
ZGlyOiBVc2UgYnVuZGxlIG1lY2hhbmlzbQ0KPiAgICBtb2R1bGU6IFVzZSBidW5kbGUgbWVj
aGFuaXNtDQo+DQo+IFBhb2xvIEJvbnppbmkgKDEpOg0KPiAgICB0ZXN0cy92bTogZG8gbm90
IHNwZWNpZnkgLWJpb3Mgb3B0aW9uDQo+DQo+ICAgLnRyYXZpcy55bWwgICAgICAgICAgICAg
ICAgICAgICB8ICAyICstDQo+ICAgZG9jcy9hYm91dC9idWlsZC1wbGF0Zm9ybXMucnN0ICB8
ICAyICstDQo+ICAgaW5jbHVkZS9xZW11L2N1dGlscy5oICAgICAgICAgICB8IDE4ICsrKysr
KystLQ0KPiAgIGluY2x1ZGUvcWVtdS9vc2RlcC5oICAgICAgICAgICAgfCAgMiArLQ0KPiAg
IG1lc29uLmJ1aWxkICAgICAgICAgICAgICAgICAgICAgfCAgNCArKw0KPiAgIHBjLWJpb3Mv
a2V5bWFwcy9tZXNvbi5idWlsZCAgICAgfCAyMSArKystLS0tLS0tDQo+ICAgcGMtYmlvcy9t
ZXNvbi5idWlsZCAgICAgICAgICAgICB8IDEzICsrLS0tLS0NCj4gICBzY3JpcHRzL29zcy1m
dXp6L2J1aWxkLnNoICAgICAgIHwgIDIgKy0NCj4gICBzY3JpcHRzL3N5bWxpbmstaW5zdGFs
bC10cmVlLnB5IHwgMzQgKysrKysrKysrKysrKysrKysNCj4gICBzb2Z0bW11L2RhdGFkaXIu
YyAgICAgICAgICAgICAgIHwgMjIgKy0tLS0tLS0tLS0NCj4gICB0ZXN0cy9xdGVzdC9mdXp6
L2Z1enouYyAgICAgICAgIHwgMTUgLS0tLS0tLS0NCj4gICB0ZXN0cy92bS9mZWRvcmEgICAg
ICAgICAgICAgICAgIHwgIDEgLQ0KPiAgIHRlc3RzL3ZtL2ZyZWVic2QgICAgICAgICAgICAg
ICAgfCAgMSAtDQo+ICAgdGVzdHMvdm0vbmV0YnNkICAgICAgICAgICAgICAgICB8ICAxIC0N
Cj4gICB0ZXN0cy92bS9vcGVuYnNkICAgICAgICAgICAgICAgIHwgIDEgLQ0KPiAgIHV0aWwv
Y3V0aWxzLmMgICAgICAgICAgICAgICAgICAgfCA2OCArKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0NCj4gICB1dGlsL21lc29uLmJ1aWxkICAgICAgICAgICAgICAgIHwgIDEg
Kw0KPiAgIHV0aWwvbW9kdWxlLmMgICAgICAgICAgICAgICAgICAgfCAgMSAtDQo+ICAgMTgg
ZmlsZXMgY2hhbmdlZCwgMTE1IGluc2VydGlvbnMoKyksIDk0IGRlbGV0aW9ucygtKQ0KPiAg
IGNyZWF0ZSBtb2RlIDEwMDc1NSBzY3JpcHRzL3N5bWxpbmstaW5zdGFsbC10cmVlLnB5DQoN
Cg0KSGksDQoNCndoZW4gSSBydW4gYHdpbmUgcWVtdS1zeXN0ZW0taTM4NiAtLXZlcnNpb25g
IG9uIERlYmlhbiBHTlUgTGludXggc3RhYmxlIA0KaW4gdGhlIGJ1aWxkIGRpcmVjdG9yeSBv
ZiBhIGNyb3NzIGJ1aWxkIHdoaWNoIHRhcmdldHMgV2luZG93cywgSSBub3cgZ2V0IA0KYW4g
ZXJyb3I6DQoNClo6XGhvbWVcc3RlZmFuXHFlbXVcYmluXG5kZWJ1Z1x4ODZfNjQtdzY0LW1p
bmd3MzJccWVtdS1zeXN0ZW0taTM4Ni5leGU6IA0KLS12ZXJzaW9uOiBDb3VsZCBub3Qgb3Bl
biANCidaOlxob21lXHN0ZWZhblxxZW11XGJpblxuZGVidWdceDg2XzY0LXc2NC1taW5ndzMy
L3FlbXUtYnVuZGxlJzogDQpQZXJtaXNzaW9uIGRlbmllZA0KDQpSZWdhcmRzDQoNClN0ZWZh
biBXZWlsDQoNCg==
--------------JtjqFFPNaQVJ8YPdeb26sOyX
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

--------------JtjqFFPNaQVJ8YPdeb26sOyX--

--------------HKwkjKsSXwYr4WnNc58C539T--

--------------Fv7M2MK0MiO0JvJSMEyPsuCR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEESSNv6nXJXWmOwreK4Iwh1Wd0UK0FAmNc6aUFAwAAAAAACgkQ4Iwh1Wd0UK3m
4A//eteslefsEf+fCwC6B6y3XXd6GdqO2QydG0TCEftkpTxitfgVww0q7WpAFBNjayD3S27UPAps
oMG7VsDrtS0AqCZ4HZjD1COD5ZE/c9UR1fRdBLMEyYnc2G9zGgKO00lI5w+MaGP0PUoLlfrvl6ye
EMQfGOtmZz/PwFc5fZJPERU2wLvwWLF9dJDycXwzGHA3YQoG3at8mOpczsV72m4+JFO9CtqarxxL
xah/yz6fAsA6S8g1eUBo9XAZKsN/514VXGW39QDqkWT3M1BpRNuTQs5P5dx+hT4DeJflGNL/JTdP
dwLYJyGjZtj9Qcpq3RqZyHO6h2PSz/pd8hojzn/GtFKqw3Tj1qqdOFQ/AkqNqe0PKMBrvIVdegzw
dOOa7ghOjF4bDicWUKRlrg9YAt8BTpyEfH0WHNzq+NuVD9s+epmjqH3SP2KvFQ1jZA+Shucwi+sk
KoR+sDweCtlsARBN+T6QKhJBCMzEyybltcXeZu5WKGSziWzDdiY3RZ1W6jzjB4gJRlmqEaeEomdF
PlnoUAOlVesLN/NQq3025hMp8VOSmLS9ON6QUepiP7ZBDAGtt1QWnr90D10+Nn7lv0ZVdJfGabKT
iPRosOytfzo62SCZNjmv+dM8brmgTp/AXkSGUYpztKwxQVlqGmKOl6RA/7/W32E37LWL+xb9vc/G
O2w=
=3KqI
-----END PGP SIGNATURE-----

--------------Fv7M2MK0MiO0JvJSMEyPsuCR--

