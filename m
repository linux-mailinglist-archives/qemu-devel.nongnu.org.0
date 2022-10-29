Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 102EF61246B
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 18:21:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oooYY-0004Vy-Ew; Sat, 29 Oct 2022 12:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1oooYV-0004V3-LE
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 12:19:31 -0400
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1oooYT-000191-D2
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 12:19:31 -0400
Received: from [192.168.178.59] (p5b151d14.dip0.t-ipconnect.de [91.21.29.20])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 8CFCDDA0C54;
 Sat, 29 Oct 2022 18:19:26 +0200 (CEST)
Message-ID: <8077e5fd-13f6-ea72-f0dd-a32e09dae4a3@weilnetz.de>
Date: Sat, 29 Oct 2022 18:19:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
To: Bin Meng <bmeng.cn@gmail.com>, Thomas Huth <thuth@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <20220908132817.1831008-7-bmeng.cn@gmail.com>
 <85f915c4-938c-8a23-a4c2-01fba0f87b63@redhat.com>
 <CAEUhbmVNNuSRgjHiewKhqOifTF2_Rzn+8uUNphay6aXRYHg=kw@mail.gmail.com>
 <CAEUhbmXmKoE+cZUO-6Z=yPcWr1fknyw5PFyY+=c2-E4kCf-0AA@mail.gmail.com>
 <CAEUhbmX4uDWWoc=B23TZS9gbPCMkPu+H-jFcMYuPYWE_QuMR7w@mail.gmail.com>
Subject: Re: [PATCH 6/7] .gitlab-ci.d/windows.yml: Unify the prerequisite
 packages
In-Reply-To: <CAEUhbmX4uDWWoc=B23TZS9gbPCMkPu+H-jFcMYuPYWE_QuMR7w@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------uUbV0xhtuI8fT15pm2qCFNTM"
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
--------------uUbV0xhtuI8fT15pm2qCFNTM
Content-Type: multipart/mixed; boundary="------------DO8bzMJJF6hT2kaYX7Av9FLl";
 protected-headers="v1"
From: Stefan Weil <sw@weilnetz.de>
To: Bin Meng <bmeng.cn@gmail.com>, Thomas Huth <thuth@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <8077e5fd-13f6-ea72-f0dd-a32e09dae4a3@weilnetz.de>
Subject: Re: [PATCH 6/7] .gitlab-ci.d/windows.yml: Unify the prerequisite
 packages
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <20220908132817.1831008-7-bmeng.cn@gmail.com>
 <85f915c4-938c-8a23-a4c2-01fba0f87b63@redhat.com>
 <CAEUhbmVNNuSRgjHiewKhqOifTF2_Rzn+8uUNphay6aXRYHg=kw@mail.gmail.com>
 <CAEUhbmXmKoE+cZUO-6Z=yPcWr1fknyw5PFyY+=c2-E4kCf-0AA@mail.gmail.com>
 <CAEUhbmX4uDWWoc=B23TZS9gbPCMkPu+H-jFcMYuPYWE_QuMR7w@mail.gmail.com>
In-Reply-To: <CAEUhbmX4uDWWoc=B23TZS9gbPCMkPu+H-jFcMYuPYWE_QuMR7w@mail.gmail.com>

--------------DO8bzMJJF6hT2kaYX7Av9FLl
Content-Type: multipart/mixed; boundary="------------tFGW1X169IoHleoJEGKwUxXP"

--------------tFGW1X169IoHleoJEGKwUxXP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

QW0gMjkuMTAuMjIgdW0gMTU6MDYgc2NocmllYiBCaW4gTWVuZzoNCj4gSGkgVGhvbWFzLA0K
PiANCj4gT24gU2F0LCBTZXAgMjQsIDIwMjIgYXQgNToyMCBQTSBCaW4gTWVuZyA8Ym1lbmcu
Y25AZ21haWwuY29tPiB3cm90ZToNCj4+DQo+PiBIaSBUaG9tYXMsDQo+Pg0KPj4gT24gU2F0
LCBTZXAgMTAsIDIwMjIgYXQgODozMiBBTSBCaW4gTWVuZyA8Ym1lbmcuY25AZ21haWwuY29t
PiB3cm90ZToNCj4+Pg0KPj4+IE9uIFNhdCwgU2VwIDEwLCAyMDIyIGF0IDEyOjMyIEFNIFRo
b21hcyBIdXRoIDx0aHV0aEByZWRoYXQuY29tPiB3cm90ZToNCj4+Pj4NCj4+Pj4gT24gMDgv
MDkvMjAyMiAxNS4yOCwgQmluIE1lbmcgd3JvdGU6DQo+Pj4+PiBGcm9tOiBCaW4gTWVuZyA8
YmluLm1lbmdAd2luZHJpdmVyLmNvbT4NCj4+Pj4+DQo+Pj4+PiBBdCBwcmVzZW50IHRoZSBw
cmVyZXF1aXNpdGUgcGFja2FnZXMgZm9yIDY0LWJpdCBhbmQgMzItYml0IGJ1aWxkcw0KPj4+
Pj4gYXJlIHNsaWdodGx5IGRpZmZlcmVudC4gTGV0J3MgdXNlIHRoZSBzYW1lIHBhY2thZ2Vz
IGZvciBib3RoLg0KPj4+Pg0KPj4+PiBOb3Qgc3VyZSB3aGV0aGVyIHRoYXQncyBhIGdvb2Qg
aWRlYSAuLi4gSSBkaWQgdGhhdCBvbiBwdXJwb3NlIHRvIHNhdmUgc29tZQ0KPj4+PiBmZXcg
dGltZSBkdXJpbmcgY29tcGlsYXRpb24gKHNpbmNlIHRoZSBXaW5kb3dzIGpvYnMgYXJlIHJ1
bm5pbmcgdmVyeSBsb25nDQo+Pj4+IGFscmVhZHkpIC4uLiBkaWQgeW91IGNoZWNrIHdoZXRo
ZXIgaXQgbWFrZXMgYSBkaWZmZXJlbmNlIGluIHRoZSBydW4gdGltZSBub3c/DQo+Pj4+DQo+
Pj4NCj4+PiBOb3QgbXVjaCBkaWZmZXJlbmNlIG9uIHRoZSBidWlsZCB0aW1lLiBBY3R1YWxs
eSBJIGZvdW5kIGFmdGVyIHdlDQo+Pj4gc3dpdGNoZWQgdG8gc2luZ2xlIHRocmVhZCBidWls
ZCB0aGUgdGltZSBkaWQgbm90IGluY3JlYXNlIHRvby4NCj4+Pg0KPj4+IE9uZSBzaWRlIG5v
dGUgcmVnYXJkaW5nIHRoZSBnaXRsYWIgc2hhcmVkIHJ1bm5lcjoNCj4+Pg0KPj4+IEl0IHNl
ZW1zIHRoZSBzaGFyZWQgcnVubmVyIFdpbmRvd3MgVk0gaXMgcXVpdGUgc2xvdy4gSXMgaXQg
cG9zc2libGUgdG8NCj4+PiBnZXQgYSBmYXN0ZXIgVk0gZXh0ZXJuYWxseT8NCj4+DQo+PiBB
bnkgZnVydGhlciBjb21tZW50IGZvciB0aGlzIHBhdGNoPw0KPj4NCj4gDQo+IFBpbmc/DQo+
IA0KPiBSZWdhcmRzLA0KPiBCaW4NCg0KDQpBZGRpbmcgbW9yZSBwYWNrYWdlcyB0eXBpY2Fs
bHkgaXMgYSBnb29kIGlkZWEgYmVjYXVzZSBpdCBhbGxvd3MgDQpjb21waWxhdGlvbiBvZiBt
b3JlIGNvZGUgZmVhdHVyZXMsIHNvIHRoZSBjb3ZlcmFnZSBkdXJpbmcgdGhlIGJ1aWxkIGlz
IA0KaW5jcmVhc2VkLg0KDQpCdXQgaGVyZSB3ZSBoYXZlIDMyIGFuZCA2NCBiaXQgYnVpbGRz
IGZvciBXaW5kb3dzIHdoaWNoIGFyZSBsZXNzIA0KZGlmZmVyZW50IHRoYW4gb24gTGludXgg
YmVjYXVzZSBzaXplb2YobG9uZykgaXMgdGhlIHNhbWUgZm9yIGJvdGguIA0KTmV2ZXJ0aGVs
ZXNzIHBhdGNoIDUgb2YgdGhlIHNlcmllcyBzaG93cyBhbiBleGFtcGxlIHdoZXJlIDMyIGJp
dCBidWlsZHMgDQpwcm9kdWNlZCBhIHdhcm5pbmcsIGJ1dCA2NCBiaXQgYnVpbGRzIGRpZCBu
b3QuIFNvIGNvdmVyaW5nIGFzIG11Y2ggY29kZSANCmFzIHBvc3NpYmxlICh3aGljaCByZXF1
aXJlcyBpbnN0YWxsYXRpb24gb2YgYWxsIHJlcXVpcmVkIHBhY2thZ2VzKSBjYW4gDQpiZSB1
c2VmdWwgZm9yIGJ1aWxkIHRlc3RzLiBBbmQgb2YgY291cnNlIGl0IGlzIGFsc28gbmVjZXNz
YXJ5IGlmIHRoZSANCmdlbmVyYXRlZCBiaW5hcmllcyBzaG91bGQgc3VwcG9ydCBhcyBtYW55
IGZlYXR1cmVzIGFzIHBvc3NpYmxlLg0KDQpPbiB0aGUgb3RoZXIgaGFuZCBidWlsZHMgd2l0
aCBhIHJlZHVjZWQgbnVtYmVyIG9mIHBhY2thZ2VzIGNhbiBhbHNvIGJlIA0KcmVhc29uYWJs
ZSwgbm90IG9ubHkgYmVjYXVzZSB0aGV5IG5lZWQgbGVzcyByZXNvdXJjZXMgKGJ1aWxkIHRp
bWUsIA0KZW5lcmd5KSwgYnV0IGFsc28gYmVjYXVzZSB0aGV5IGNhbiB1bmNvdmVyIGJyb2tl
biBkZXBlbmRlbmNpZXMuIEFuZCBmb3IgDQpzb21lIGFwcGxpY2F0aW9ucyBzbWFsbGVyIGJp
bmFyaWVzIHdpdGggbGVzcyBmZWF0dXJlcyBjYW4gYmUgc3VmZmljaWVudC4NCg0KU28gdGhl
cmUgaXMgbm8gY2xlYXIgYW5zd2VyIGZvciBtZSB3aGV0aGVyIHRoZSBwYWNrYWdlcyBmb3Ig
MzIgYW5kIDY0IA0KYml0IHNob3VsZCBiZSBzeW5jaHJvbml6ZWQgb3Igbm90Lg0KDQpJIHRo
aW5rIHRlY2huaWNhbGx5IHRoZSBwYXRjaCBpcyBmaW5lLiBXZSBjYW4gcG9zdHBvbmUgdGhl
IGRlY2lzaW9uIA0KYmVjYXVzZSBpdCBpcyBub3QgdXJnZW50IGZvciB0aGUgdXBjb21pbmcg
cmVsZWFzZS4NCg0KU3RlZmFuDQoNCg==
--------------tFGW1X169IoHleoJEGKwUxXP
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

--------------tFGW1X169IoHleoJEGKwUxXP--

--------------DO8bzMJJF6hT2kaYX7Av9FLl--

--------------uUbV0xhtuI8fT15pm2qCFNTM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEESSNv6nXJXWmOwreK4Iwh1Wd0UK0FAmNdUo0FAwAAAAAACgkQ4Iwh1Wd0UK3A
nQ//eismVgNX7NlZhEKyhW1XbQQVa3Ux339qzfWQyfrWjgyGUQDIM+pQhWbDpTXCvONA7lFxyajj
jBgojRL26HaQ2tiqztknkFwhG4uJWgH2kvEz/8g1/7eRdd1bo4YgU3qt6iLu9qaiAO1A1V5GPAwk
icH+6ekD9zE0osCjSdmZ9KYFwlaMphl5am8ZwCRkL7gbPpuMPKGPNHfkF5wCXYJy9McPJ+gDxFuR
rUJhzlG4uY2lEaaYuItRXAnBr1b6KLV9kMsKsIXHN0IvLbl05GVAz4LxplxU+gK7D1CWICFlYmBf
88dYZI8b/q6kbOAMp30MgKpLYi0UFefuL2XwM98dHmGctQWZsjKoQV8XfCrIc7ItSAKLM/lIAcT4
vCdicrnLddJ++CaY4GDgsQfDBtlBZzl8S3fQ2iieCjBXoChq56Qd/GJmU9Z99v1zNt0tTee/mgUh
PCCBe40AGzZlAoKuLbMePoNbGxHx7CCdoYvTN0ygJenkENlcMIuh4wOm5lf+PzuMGFUbJyYhHYnd
763qzLbhEspBsiF41YGlYuCfS+8jUkphb4D2BaBBoRgoTgw6zDVtEapVZkTL2RaiJ7lvpbONNLdX
i8kADKbvdHe4pjpUPLVTKonxIqslrKJUQUlLSwLhW2qXXbwE5NJo7zC1dwApf1mzvAez/zb+dTj2
dtM=
=oY9O
-----END PGP SIGNATURE-----

--------------uUbV0xhtuI8fT15pm2qCFNTM--

