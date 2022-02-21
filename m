Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB5A4BDE1F
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 18:46:44 +0100 (CET)
Received: from localhost ([::1]:60020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMCln-0001I8-6K
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 12:46:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMCV9-0000Ev-8C; Mon, 21 Feb 2022 12:29:31 -0500
Received: from [187.72.171.209] (port=18349 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMCV6-00007P-RY; Mon, 21 Feb 2022 12:29:30 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 21 Feb 2022 14:29:21 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 35AEA80009B;
 Mon, 21 Feb 2022 14:29:21 -0300 (-03)
Message-ID: <caa88b25-9609-2f46-10cb-318f05ca3a4e@eldorado.org.br>
Date: Mon, 21 Feb 2022 14:29:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 3/3] tests/tcg/ppc64le: Use vector types instead of
 __int128
Content-Language: en-US
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20220208203145.3844662-1-matheus.ferst@eldorado.org.br>
 <20220208203145.3844662-4-matheus.ferst@eldorado.org.br>
 <1646dc52-cab4-baa6-aac3-9c16b4f9d7d9@kaod.org>
 <178c1bc8-49c8-2c03-8890-34c85d1b83f7@eldorado.org.br>
In-Reply-To: <178c1bc8-49c8-2c03-8890-34c85d1b83f7@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-OriginalArrivalTime: 21 Feb 2022 17:29:21.0790 (UTC)
 FILETIME=[903439E0:01D82748]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: danielhb413@gmail.com, alex.bennee@linaro.org, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gMTcvMDIvMjAyMiAwOTo0NiwgTWF0aGV1cyBLLiBGZXJzdCB3cm90ZToNCj4gT24gMTcv
MDIvMjAyMiAwNTowOSwgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6DQo+PiBPbiAyLzgvMjIg
MjE6MzEsIG1hdGhldXMuZmVyc3RAZWxkb3JhZG8ub3JnLmJyIHdyb3RlOg0KPj4+IEZyb206
IE1hdGhldXMgRmVyc3QgPG1hdGhldXMuZmVyc3RAZWxkb3JhZG8ub3JnLmJyPg0KPj4+DQo+
Pj4gTExWTS9DbGFuZyBkb2Vzbid0IGxpa2UgaW5saW5lIGFzbSB3aXRoIF9faW50MTI4LCB1
c2UgYSB2ZWN0b3IgdHlwZQ0KPj4+IGluc3RlYWQuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5
OiBNYXRoZXVzIEZlcnN0IDxtYXRoZXVzLmZlcnN0QGVsZG9yYWRvLm9yZy5icj4NCj4+PiAt
LS0NCj4+PiBBbHRlcm5hdGl2ZWx5LCB3ZSBjb3VsZCBwYXNzIFZTUiB2YWx1ZXMgaW4gR1BS
IHBhaXJzLCBhcyB3ZSBkaWQgaW4NCj4+PiB0ZXN0cy90Y2cvcHBjNjRsZS9ub25fc2lnbmFs
bGluZ194c2N2LmMNCj4+PiAtLS0NCj4+PiDCoCB0ZXN0cy90Y2cvcHBjNjRsZS9iY2RzdWIu
YyB8IDkyICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tDQo+Pj4gwqAg
MSBmaWxlIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKyksIDQwIGRlbGV0aW9ucygtKQ0KPj4+
DQo+Pj4gZGlmZiAtLWdpdCBhL3Rlc3RzL3RjZy9wcGM2NGxlL2JjZHN1Yi5jIGIvdGVzdHMv
dGNnL3BwYzY0bGUvYmNkc3ViLmMNCj4+PiBpbmRleCA4YzE4OGNhZTZkLi4xNzQwM2RhZjIy
IDEwMDY0NA0KPj4+IC0tLSBhL3Rlc3RzL3RjZy9wcGM2NGxlL2JjZHN1Yi5jDQo+Pj4gKysr
IGIvdGVzdHMvdGNnL3BwYzY0bGUvYmNkc3ViLmMNCj4+PiBAQCAtMSw2ICsxLDcgQEANCj4+
PiDCoCAjaW5jbHVkZSA8YXNzZXJ0Lmg+DQo+Pj4gwqAgI2luY2x1ZGUgPHVuaXN0ZC5oPg0K
Pj4+IMKgICNpbmNsdWRlIDxzaWduYWwuaD4NCj4+PiArI2luY2x1ZGUgPGFsdGl2ZWMuaD4N
Cj4+Pg0KPj4+IMKgICNkZWZpbmUgQ1JGX0xUwqAgKDEgPDwgMykNCj4+PiDCoCAjZGVmaW5l
IENSRl9HVMKgICgxIDw8IDIpDQo+Pj4gQEAgLTgsNiArOSwxNiBAQA0KPj4+IMKgICNkZWZp
bmUgQ1JGX1NPwqAgKDEgPDwgMCkNCj4+PiDCoCAjZGVmaW5lIFVOREVGwqDCoCAwDQo+Pj4N
Cj4+PiArI2lmZGVmIF9fTElUVExFX0VORElBTl9fDQo+Pg0KPj4gU2hvdWxkbid0IHdlIGJl
IHVzaW5nIDoNCj4+DQo+PiAjaWYgQllURV9PUkRFUiA9PSBMSVRUTEVfRU5ESUFODQo+Pg0K
Pj4gaW5zdGVhZCA/DQo+Pg0KPiANCj4gSSBndWVzcyBpdCBpcyBiZXR0ZXIsIEknbGwgc2Vu
ZCBhIHYyLg0KPiANCg0KQWN0dWFsbHksIGl0IGRvZXNuJ3Qgd29yayBmb3IgTExWTSBhbmQg
bmVlZHMgZW5kaWFuLmggZm9yIEdDQ1sxXS4gVGhpcyANCmNoZWNrIGlzIGFsc28gdXNlZCBp
biBzaWdidXMgYW5kIHNoYTEgdGVzdHMuIFRoZSBmaXJzdCBzaG91bGRuJ3QgYmUgYSANCnBy
b2JsZW0gKGFsbG93X2ZhaWwgaXMgemVybyBmb3IgcHBjKSwgYnV0IHNoYTEgZ2l2ZXMgdGhl
IHdyb25nIHJlc3VsdCANCmZvciBCRToNCg0KJCAuL3FlbXUtcHBjNjRsZSB0ZXN0cy90Y2cv
cHBjNjRsZS1saW51eC11c2VyL3NoYTENClNIQTE9MTVkZDk5YTE5OTFlMGIzODI2ZmVkZTNk
ZWZmYzFmZWJhNDIyNzhlNg0KJCAuL3FlbXUtcHBjNjQgdGVzdHMvdGNnL3BwYzY0LWxpbnV4
LXVzZXIvc2hhMQ0KU0hBMT03MGYxZDRkNjVlYjQ3MzA5ZmZhY2M1YTI4ZmYyODVhZDgyNjAw
NmRhDQoNCmFuZCAnbWFrZSBjaGVjay10Y2cnIHN1Y2NlZWRzIGFueXdheS4uLg0KDQpbMV0g
aHR0cHM6Ly9nb2Rib2x0Lm9yZy96L2ZZYnpiYmV4bg0KLS0gDQpNYXRoZXVzIEsuIEZlcnN0
DQpJbnN0aXR1dG8gZGUgUGVzcXVpc2FzIEVMRE9SQURPIDxodHRwOi8vd3d3LmVsZG9yYWRv
Lm9yZy5ici8+DQpBbmFsaXN0YSBkZSBTb2Z0d2FyZQ0KQXZpc28gTGVnYWwgLSBEaXNjbGFp
bWVyIDxodHRwczovL3d3dy5lbGRvcmFkby5vcmcuYnIvZGlzY2xhaW1lci5odG1sPg0K

