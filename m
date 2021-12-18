Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D35AA479E30
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 00:36:12 +0100 (CET)
Received: from localhost ([::1]:42316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myjFL-0004td-Bb
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 18:36:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mschiffer@universe-factory.net>)
 id 1myjBY-00037O-5x
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 18:32:16 -0500
Received: from orthanc.universe-factory.net ([104.238.176.138]:51854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mschiffer@universe-factory.net>)
 id 1myjBW-0003FN-3R
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 18:32:15 -0500
Received: from [IPV6:2001:19f0:6c01:100::2] (unknown
 [IPv6:2001:19f0:6c01:100::2])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by orthanc.universe-factory.net (Postfix) with ESMTPSA id 7FE441F401;
 Sun, 19 Dec 2021 00:32:10 +0100 (CET)
Message-ID: <a1c8bf1f-0e0d-3ef9-3a62-98c03d54cf21@universe-factory.net>
Date: Sun, 19 Dec 2021 00:32:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] linux-user/signal: Map exit signals in SIGCHLD siginfo_t
Content-Language: en-US-large
To: Laurent Vivier <laurent@vivier.eu>
References: <81534fde7cdfc6acea4889d886fbefdd606630fb.1635019124.git.mschiffer@universe-factory.net>
From: Matthias Schiffer <mschiffer@universe-factory.net>
In-Reply-To: <81534fde7cdfc6acea4889d886fbefdd606630fb.1635019124.git.mschiffer@universe-factory.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------sQJ7pJYKaKpc0qD0F2pTSpdT"
Received-SPF: pass client-ip=104.238.176.138;
 envelope-from=mschiffer@universe-factory.net;
 helo=orthanc.universe-factory.net
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.716,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------sQJ7pJYKaKpc0qD0F2pTSpdT
Content-Type: multipart/mixed; boundary="------------V6dbpendOj9SX4iKllwQl3Qd";
 protected-headers="v1"
From: Matthias Schiffer <mschiffer@universe-factory.net>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org
Message-ID: <a1c8bf1f-0e0d-3ef9-3a62-98c03d54cf21@universe-factory.net>
Subject: Re: [PATCH] linux-user/signal: Map exit signals in SIGCHLD siginfo_t
References: <81534fde7cdfc6acea4889d886fbefdd606630fb.1635019124.git.mschiffer@universe-factory.net>
In-Reply-To: <81534fde7cdfc6acea4889d886fbefdd606630fb.1635019124.git.mschiffer@universe-factory.net>

--------------V6dbpendOj9SX4iKllwQl3Qd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMvMTAvMjAyMSAyMTo1OSwgTWF0dGhpYXMgU2NoaWZmZXIgd3JvdGU6DQo+IFdoZW4g
Y29udmVydGluZyBhIHNpZ2luZm9fdCBmcm9tIHdhaXRpZCgpLCB0aGUgaW50ZXJwcmV0YXRp
b24gb2Ygc2lfc3RhdHVzDQo+IGRlcGVuZHMgb24gdGhlIHZhbHVlIG9mIHNpX2NvZGU6IEZv
ciBDTERfRVhJVEVELCBpdCBpcyBhbiBleGl0IGNvZGUgYW5kDQo+IHNob3VsZCBiZSBjb3Bp
ZWQgdmVyYmF0aW0uIEZvciBvdGhlciBjb2RlcywgaXQgaXMgYSBzaWduYWwgbnVtYmVyDQo+
IChwb3NzaWJseSB3aXRoIGFkZGl0aW9uYWwgaGlnaCBiaXRzIGZyb20gcHRyYWNlKSB0aGF0
IHNob3VsZCBiZSBtYXBwZWQuDQo+IA0KPiBUaGlzIGNvZGUgd2FzIHByZXZpb3VzbHkgY2hh
bmdlZCBpbiBjb21taXQgMWMzZGZiNTA2ZWEzDQo+ICgibGludXgtdXNlci9zaWduYWw6IERl
Y29kZSB3YWl0aWQgc2lfY29kZSIpLCBidXQgdGhlIGZpeCB3YXMNCj4gaW5jb21wbGV0ZS4N
Cg0KcGluZw0KDQo+IA0KPiBUZXN0ZWQgd2l0aCB0aGUgZm9sbG93aW5nIHRlc3QgcHJvZ3Jh
bToNCj4gDQo+ICAgICAgI2luY2x1ZGUgPHN0ZGlvLmg+DQo+ICAgICAgI2luY2x1ZGUgPHN0
ZGxpYi5oPg0KPiAgICAgICNpbmNsdWRlIDx1bmlzdGQuaD4NCj4gICAgICAjaW5jbHVkZSA8
c3lzL3dhaXQuaD4NCj4gDQo+ICAgICAgaW50IG1haW4oKSB7DQo+ICAgICAgCXBpZF90IHBp
ZCA9IGZvcmsoKTsNCj4gICAgICAJaWYgKHBpZCA9PSAwKSB7DQo+ICAgICAgCQlleGl0KDEy
KTsNCj4gICAgICAJfSBlbHNlIHsNCj4gICAgICAJCXNpZ2luZm9fdCBzaWdpbmZvID0ge307
DQo+ICAgICAgCQl3YWl0aWQoUF9QSUQsIHBpZCwgJnNpZ2luZm8sIFdFWElURUQpOw0KPiAg
ICAgIAkJcHJpbnRmKCJDb2RlOiAlZCwgc3RhdHVzOiAlZFxuIiwgKGludClzaWdpbmZvLnNp
X2NvZGUsIChpbnQpc2lnaW5mby5zaV9zdGF0dXMpOw0KPiAgICAgIAl9DQo+IA0KPiAgICAg
IAlwaWQgPSBmb3JrKCk7DQo+ICAgICAgCWlmIChwaWQgPT0gMCkgew0KPiAgICAgIAkJcmFp
c2UoU0lHVVNSMik7DQo+ICAgICAgCX0gZWxzZSB7DQo+ICAgICAgCQlzaWdpbmZvX3Qgc2ln
aW5mbyA9IHt9Ow0KPiAgICAgIAkJd2FpdGlkKFBfUElELCBwaWQsICZzaWdpbmZvLCBXRVhJ
VEVEKTsNCj4gICAgICAJCXByaW50ZigiQ29kZTogJWQsIHN0YXR1czogJWRcbiIsIChpbnQp
c2lnaW5mby5zaV9jb2RlLCAoaW50KXNpZ2luZm8uc2lfc3RhdHVzKTsNCj4gICAgICAJfQ0K
PiAgICAgIH0NCj4gDQo+IE91dHB1dCB3aXRoIGFuIHg4Nl82NCBob3N0IGFuZCBtaXBzNjRl
bCB0YXJnZXQgYmVmb3JlIDFjM2RmYjUwNmVhMw0KPiAoaW5jb3JyZWN0OiBleGl0IGNvZGUg
MTIgaXMgdHJhbnNsYXRlZCBsaWtlIGEgc2lnbmFsKToNCj4gDQo+ICAgICAgQ29kZTogMSwg
c3RhdHVzOiAxNw0KPiAgICAgIENvZGU6IDIsIHN0YXR1czogMTcNCj4gDQo+IEFmdGVyIDFj
M2RmYjUwNmVhMyAoaW5jb3JyZWN0OiBzaWduYWwgbnVtYmVyIGlzIG5vdCB0cmFuc2xhdGVk
KToNCj4gDQo+ICAgICAgQ29kZTogMSwgc3RhdHVzOiAxMg0KPiAgICAgIENvZGU6IDIsIHN0
YXR1czogMTINCj4gDQo+IFdpdGggdGhpcyBwYXRjaDoNCj4gDQo+ICAgICAgQ29kZTogMSwg
c3RhdHVzOiAxMg0KPiAgICAgIENvZGU6IDIsIHN0YXR1czogMTcNCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IE1hdHRoaWFzIFNjaGlmZmVyIDxtc2NoaWZmZXJAdW5pdmVyc2UtZmFjdG9yeS5u
ZXQ+DQo+IC0tLQ0KPiAgIGxpbnV4LXVzZXIvc2lnbmFsLmMgfCA3ICsrKysrKy0NCj4gICAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvbGludXgtdXNlci9zaWduYWwuYyBiL2xpbnV4LXVzZXIvc2lnbmFsLmMN
Cj4gaW5kZXggMTRkOGZkZmRlMTUyLi44ZTNhZjk4ZWMwYTcgMTAwNjQ0DQo+IC0tLSBhL2xp
bnV4LXVzZXIvc2lnbmFsLmMNCj4gKysrIGIvbGludXgtdXNlci9zaWduYWwuYw0KPiBAQCAt
NDAzLDcgKzQwMywxMiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgaG9zdF90b190YXJnZXRfc2ln
aW5mb19ub3N3YXAodGFyZ2V0X3NpZ2luZm9fdCAqdGluZm8sDQo+ICAgICAgICAgICBjYXNl
IFRBUkdFVF9TSUdDSExEOg0KPiAgICAgICAgICAgICAgIHRpbmZvLT5fc2lmaWVsZHMuX3Np
Z2NobGQuX3BpZCA9IGluZm8tPnNpX3BpZDsNCj4gICAgICAgICAgICAgICB0aW5mby0+X3Np
ZmllbGRzLl9zaWdjaGxkLl91aWQgPSBpbmZvLT5zaV91aWQ7DQo+IC0gICAgICAgICAgICB0
aW5mby0+X3NpZmllbGRzLl9zaWdjaGxkLl9zdGF0dXMgPSBpbmZvLT5zaV9zdGF0dXM7DQo+
ICsgICAgICAgICAgICBpZiAoc2lfY29kZSA9PSBDTERfRVhJVEVEKQ0KPiArICAgICAgICAg
ICAgICAgIHRpbmZvLT5fc2lmaWVsZHMuX3NpZ2NobGQuX3N0YXR1cyA9IGluZm8tPnNpX3N0
YXR1czsNCj4gKyAgICAgICAgICAgIGVsc2UNCj4gKyAgICAgICAgICAgICAgICB0aW5mby0+
X3NpZmllbGRzLl9zaWdjaGxkLl9zdGF0dXMNCj4gKyAgICAgICAgICAgICAgICAgICAgPSBo
b3N0X3RvX3RhcmdldF9zaWduYWwoaW5mby0+c2lfc3RhdHVzICYgMHg3ZikNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgIHwgKGluZm8tPnNpX3N0YXR1cyAmIH4weDdmKTsNCj4gICAg
ICAgICAgICAgICB0aW5mby0+X3NpZmllbGRzLl9zaWdjaGxkLl91dGltZSA9IGluZm8tPnNp
X3V0aW1lOw0KPiAgICAgICAgICAgICAgIHRpbmZvLT5fc2lmaWVsZHMuX3NpZ2NobGQuX3N0
aW1lID0gaW5mby0+c2lfc3RpbWU7DQo+ICAgICAgICAgICAgICAgc2lfdHlwZSA9IFFFTVVf
U0lfQ0hMRDsNCg0K

--------------V6dbpendOj9SX4iKllwQl3Qd--

--------------sQJ7pJYKaKpc0qD0F2pTSpdT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEZmTnvaa2aYgexS51Fu8/ZMsgHZwFAmG+b3kFAwAAAAAACgkQFu8/ZMsgHZwh
5Q/+PdalSpyoaL8bE3fd2CUKrYYQXuI+ujtdJzg1TrYrtp3iw4zpqwi2EEs7ShY+D3463aWZNy0D
nv8lyiUfSh0YSg63lUO27qbV82aP+QLVE/1bDGDZAQ49FEAj80X3iLQw38Vob+v1TU6fNidouvZ7
W32MhSzZDcQMvTkO5fUz1jlaAR6Jg5KqgvPpisVl8Do8ysrSXn3fZv/nISENUqYVT1ygHAUtqszT
hPLMrzXFGOrHbfj3yDHh+/TTxLb6fwPHVrfjGTIkWm1WvMmgp6bNB4iHjWmsFLyoXeZrz/xVGeHi
SC3T0e9u3BZXwB80c8+h9bcGK/X40YAzQC4AFwsMudnhdMDBS4gVjfNwdDC8eI4ljmyGGc1zGKQG
dCvxt69B7Mf0fXv7RBamd71PQ3+JYTVHLGeTUiU9nj7KOWh0+4yap5rtrLonVJ2BsQWe6Ukc4cCf
dskcUGYo1IaWb22NnRcLZF3oGWx3phvprcEdTiIogaZEm6AMxfaKlPqVxmjuO89JpARxIARCmTsX
MEyjLST0P1QM6GABNSt/5V/MblZviDyHwyN3BWa2DvACwPPBawH6l5w/c/Q1DZjORr0Q9TtCCJ0b
FMRjUTMGA2lsmFuNdI3b1fLi1xoTcvZqJuYBEjFFXG/vS29eTXBoT975Xh4FQhGQ1uAdZXMhZ03D
R50=
=6VIg
-----END PGP SIGNATURE-----

--------------sQJ7pJYKaKpc0qD0F2pTSpdT--

